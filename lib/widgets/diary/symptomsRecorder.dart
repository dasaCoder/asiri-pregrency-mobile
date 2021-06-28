import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mother_and_baby/lan/Languages.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:provider/provider.dart';

class SymptomsRecorder extends StatefulWidget {
  final String selectedDate;
  final String title;
  final IconData iconData;
  final Color iconsColor;
  final String symptomIconName;
  final String userId;
  const SymptomsRecorder(
      {Key key,
      this.selectedDate,
      this.title,
      this.iconData,
      this.symptomIconName,
      this.iconsColor, this.userId})
      : super(key: key);

  @override
  _SymptomsRecorderState createState() => _SymptomsRecorderState();
}

class _SymptomsRecorderState extends State<SymptomsRecorder> {
  bool showProgressBar = false;
  double _symptomCount = 1;
  final String SYMPTOMS = "SYMPTOMS";

  saveSymptom(BuildContext context) {
    setState(() {
      showProgressBar = true;
    });
    DiaryData diaryData = DiaryData(SYMPTOMS, {
      "date": widget.selectedDate,
      "symptomCount": _symptomCount,
      "symptom": widget.title
    });
    diaryData.section = "SYMPTOMS";
    diaryData.userId = widget.userId;
    print(diaryData.userId);
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
        child: ListView(
          shrinkWrap: true,
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Container(
                child: Text(
                  widget.title,
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
                "assets/images/diary/${widget.symptomIconName}.png",
                width: 80,
              ),
            ),

            /**
                 * symptom
                 */
            Center(
              child: Container(
                  child: RatingBar.builder(
                initialRating: _symptomCount,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  widget.iconData,
                  color: widget.iconsColor,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _symptomCount = rating;
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
                  saveSymptom(context);
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
