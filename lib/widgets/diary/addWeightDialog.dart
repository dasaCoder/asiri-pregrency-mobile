import 'package:flutter/material.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:provider/provider.dart';

class AddWeightDialog extends StatefulWidget {
  final String selectedDate;
  final String userId;
  const AddWeightDialog({Key key, this.selectedDate, this.userId}) : super(key: key);

  @override
  _AddWeightDialogState createState() => _AddWeightDialogState();
}

class _AddWeightDialogState extends State<AddWeightDialog> {
  var weightController = TextEditingController();
  final _form = GlobalKey<FormState>();
  bool showProgressBar = false;
  final WEIGHT = "WEIGHT";

  saveWeight(BuildContext context) {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    setState(() {
      showProgressBar = true;
    });
    DiaryData diaryData = DiaryData(WEIGHT, { "date": widget.selectedDate, "weight": weightController.text});
    diaryData.userId = widget.userId;
    Provider.of<UserService>(context, listen: false)
        .saveDiaryData(diaryData)
        .then((doc) => print(doc));
    setState(() {
      showProgressBar = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
      width: MediaQuery.of(context).size.width * 0.9,
      constraints: BoxConstraints(minHeight: 300),
          child: Form(
            key: _form,
            child: ListView(
              shrinkWrap: true,
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Container(
                    child: Text(
                      Languages.of(context).addWeightTitle,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(60, 180, 242, 1),
                      ),
                    ),
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                  ),
                ),

                Center(
                  child: Image.asset(
                    "assets/images/diary/weight.png",
                    width: 80,
                  ),
                ),

                /**
                 * weight
                 */
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2.0, color: Color.fromRGBO(60, 180, 242, 1)),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(left: 25, right: 15),
                        child: TextFormField(
                            controller: weightController,
                            validator: (text) {
                              if (text.isEmpty)
                                return "Please enter a value for weight";
                              else
                                return null;
                            },
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            decoration: InputDecoration(
                              // alignLabelWithHint: true,
                              border: InputBorder.none,
                              labelText: Languages.of(context).weightTxt + " (Kg)",
                              contentPadding: EdgeInsets.only(top: 5, bottom: 5),
                            )))),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  // decoration: BoxDecoration(color: Colors.red),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(255, 87, 143, 1),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      saveWeight(context);
                    },
                    child: showProgressBar
                        ? Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                            padding: EdgeInsets.all(5),
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              strokeWidth: 5,
                            )))
                        : Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    ));
  }
}
