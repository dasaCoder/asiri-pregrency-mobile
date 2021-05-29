import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:provider/provider.dart';

class AddWaterIntake extends StatefulWidget {
  final String selectedDate;

  const AddWaterIntake({Key key, this.selectedDate}) : super(key: key);
  @override
  _AddWaterIntakeState createState() => _AddWaterIntakeState();
}

class _AddWaterIntakeState extends State<AddWaterIntake> {
  bool showProgressBar = false;
  double _waterIntakeCount = 1;
  final String WATER_INTAKE = "WATER_INTAKE";

  saveWaterIntake(BuildContext context) {
    setState(() {
      showProgressBar = true;
    });
    DiaryData diaryData = DiaryData(WATER_INTAKE, { "date": widget.selectedDate, "waterIntakeCount": _waterIntakeCount});
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
                  "assets/images/diary/water.png",
                  height: 70,
                ),
              ),

              /**
               * water intake
               */
              Center(
                child: Container(
                    child: RatingBar.builder(
                      initialRating: _waterIntakeCount,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 20,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.local_drink_outlined,
                        color: Colors.blue,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          _waterIntakeCount = rating;
                        });
                      },
                    )),
              ),
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
                    saveWaterIntake(context);
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
        ));
  }
}
