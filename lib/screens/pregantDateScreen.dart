import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mother_and_baby/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:mother_and_baby/services/user.service.dart';

import 'Login.dart';

class PregnantDateScreen extends StatefulWidget {
  @override
  _PregnantDateScreenState createState() => _PregnantDateScreenState();
}

class _PregnantDateScreenState extends State<PregnantDateScreen> {
  DateTime selectedDate;
  var dateController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var optionsList = <String>[
    'First day of last period',
    'Conception date',
    'IVF transfer date'
  ];

  var questionsList = <String>[
    "What's your first day of last period?",
    "What's your conception date?",
    "What's your IVF transfer date?"
  ];
  var dueDateCalculateMethod = "First day of last period";
  String selectedQuestion = "What's your first day of last period?";
  DateTime dueDate;
  bool isDueDateCalculated = false;

  void next() {
    if(isDueDateCalculated) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen()));
    } else {
      recordPregnantDate();
    }
  }

  void recordPregnantDate() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    final firebaseUser = Provider.of<User>(context, listen: false);
    if (firebaseUser == null) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    }
    dueDate = Provider.of<UserService>(context, listen: false)
        .calculateAndSaveDueDate(
            firebaseUser.uid, dueDateCalculateMethod, selectedDate);

    print(dueDate);
    if(dueDate != null) {
      setState(() {
        isDueDateCalculated = true;
      });
    }
  }

  void setQuestion() {
    for (int x = 0; x < optionsList.length; x++) {
      if (dueDateCalculateMethod == optionsList[x]) {
        setState(() {
          selectedQuestion = questionsList[x];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var mainContainerMargin = EdgeInsets.only(top: 10, left: 25, right: 25);

    return Scaffold(
      floatingActionButton: SizedBox(
        width: 100,
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          onPressed: () => next(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Next",
                style: TextStyle(fontSize: 16),
              ),
              Icon(Icons.navigate_next_outlined)
            ],
          ),
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/images/login/bg.png"),
                  fit: BoxFit.cover)),
          constraints:
              BoxConstraints(minHeight: screenHeight, minWidth: screenWidth),
          child: Center(
            child: AnimatedCrossFade(
              duration: const Duration(microseconds: 5000),
              crossFadeState: !isDueDateCalculated ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: mainContainerMargin,
                    padding: EdgeInsets.only(left: 25, right: 15),
                    child: Text(
                      "What's your preferred method to calculate due date?",
                      style: TextStyle(
                          fontSize: 18, color: Color.fromRGBO(88, 2, 106, 1.0)),
                    ),
                  ),
                  Container(
                      margin: mainContainerMargin,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25, right: 40),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: dueDateCalculateMethod,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Colors.purple,
                          ),
                          // iconSize: 24,
                          underline: Container(
                            height: 2,
                            color: Color(0xFFBDBDBD),
                            margin: EdgeInsets.only(top: 5),
                          ),
                          elevation: 16,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 19,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dueDateCalculateMethod = newValue;
                            });
                            setQuestion();
                          },
                          items: optionsList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: mainContainerMargin,
                    padding: EdgeInsets.only(left: 25, right: 15),
                    child: Text(
                      selectedQuestion,
                      style: TextStyle(
                          fontSize: 18, color: Color.fromRGBO(88, 2, 106, 1.0)),
                    ),
                  ),
                  Container(
                    margin: mainContainerMargin,
                    child: Container(
                        padding: EdgeInsets.only(left: 25, right: 40),
                        child: Form(
                          key: _form,
                          child: TextFormField(
                              onTap: () async {
                                selectedDate = await showDatePicker(
                                  initialDate: DateTime.now(),
                                  context: context,
                                  firstDate: DateTime(2021, 1),
                                  lastDate: DateTime(2030, 1),
                                );
                                dateController.text = DateFormat('yyyy-MM-dd')
                                    .format(selectedDate);
                              },
                              validator: (text) {
                                if (text.isEmpty)
                                  return "Please select a date";
                                else
                                  return null;
                              },
                              obscureText: false,
                              controller: dateController,
                              keyboardType: TextInputType.number,
                              readOnly: true,
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.purple,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFBDBDBD), width: 2.0),
                                ),
                                alignLabelWithHint: true,
                                focusColor: Color(0xFFBDBDBD),
                                contentPadding: EdgeInsets.only(
                                    top: 20, bottom: 0, left: 0),
                              )),
                        )),
                  ),
                ],
              ),
              secondChild: Column(
                children: [
                  Container(child: Text("Your due date is", style: TextStyle(
                      fontSize: 18, color: Color.fromRGBO(88, 2, 106, 1.0)),),),
                  if(isDueDateCalculated && dueDate != null) Container(child: Text(DateFormat("MMMM d, yyyy").format(dueDate), style: TextStyle(
                      fontSize: 22, color: Color.fromRGBO(88, 2, 106, 1.0)),),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
