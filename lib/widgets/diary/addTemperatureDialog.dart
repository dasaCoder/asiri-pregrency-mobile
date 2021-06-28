import 'package:flutter/material.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:provider/provider.dart';

class AddTemperatureDialog extends StatefulWidget {
  final String selectedDate;
  final String userId;

  const AddTemperatureDialog({Key key, this.selectedDate, this.userId}) : super(key: key);

  @override
  _AddTemperatureDialogState createState() => _AddTemperatureDialogState();
}

class _AddTemperatureDialogState extends State<AddTemperatureDialog> {
  final _form = GlobalKey<FormState>();
  final TEMPERATURE = "TEMPERATURE";
  double _currentSliderValue = 0;
  bool showProgressBar = false;

  saveTemperature(BuildContext context) {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    setState(() {
      showProgressBar = true;
    });
    DiaryData diaryData = DiaryData(TEMPERATURE, { "date": widget.selectedDate, "temperature": _currentSliderValue});
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
                  Languages.of(context).diaryTemperature,
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
                "assets/images/diary/temperature.png",
                height: 70,
              ),
            ),

            /**
                 * weight
                 */
            Container(
                child: Container(
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: _currentSliderValue.round().toString() + " *C",
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                )),
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
                  saveTemperature(context);
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
