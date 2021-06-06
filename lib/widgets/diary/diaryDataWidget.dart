import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:mother_and_baby/widgets/imageCarousel.dart';
import 'package:provider/provider.dart';

class DiaryDataWidget extends StatelessWidget {
  const DiaryDataWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(230, 242, 255, 1.0),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          /// Life Style data
          StreamBuilder(
              stream: Provider.of<UserService>(context).getDiaryData(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                double temp = 0;
                double weight = 0;
                double waterIntake = 0;
                var symptomsWidgetList = <Widget>[];
                var notesWidgetList = <Widget>[];

                double getAvg(List<double> list) {
                  return list.reduce((a, b) => (a + b)) / list.length;
                }

                Map<String, List<double>> symptomMap = {};
                if (!snapshot.hasData || snapshot.data.size == 0)
                  return SizedBox(
                    height: 0,
                  );
                else {
                  List<QueryDocumentSnapshot<Object>> docs = snapshot.data.docs;
                  for (DocumentSnapshot ds in docs) {
                    var section = ds["section"];
                    if (section == "LIFE_STYLE") {
                      if (ds["type"] == "WEIGHT") {
                        print("width " + ds["data"]["weight"]);
                        weight = double.parse(ds["data"]["weight"]);
                      } else if (ds["type"] == "TEMPERATURE") {
                        temp = ds["data"]["temperature"];
                      } else if (ds["type"] == "WATER_INTAKE") {
                        waterIntake += ds["data"]["waterIntakeCount"];
                      }
                    } else if (section == "SYMPTOMS") {
                      var key = ds["data"]["symptom"];
                      if (symptomMap.containsKey(key)) {
                        symptomMap.update(key, (value) {
                          value.add(ds["data"]["symptomCount"]);
                          return value;
                        });
                      }
                      symptomMap.putIfAbsent(
                          key, () => [ds["data"]["symptomCount"]]);
                    } else if (section == "NOTE") {
                      int _current = 0;
                      var imageList = ds["data"]["imageUrls"];
                      notesWidgetList.add(ExpansionTile(
                        title: Text(
                          ds["data"]["title"],
                          style: new TextStyle(
                              color: Color.fromRGBO(70, 72, 162, 1),
                              fontSize: 16),
                        ),
                        trailing: Icon(Icons.description),
                        children: [
                          if(ds["data"]["description"].toString().isNotEmpty) Container(child: Text(ds["data"]["description"]),),
                          if(imageList.length > 0) ImageCarousel(imageList: imageList)
                        ],
                      ));
                    }
                  }
                  symptomMap.forEach((key, value) {
                    generateSymptomsBars(
                        key, symptomsWidgetList, getAvg, value);
                  });
                  return Column(
                    children: [
                      LifeStyleDataWidget(
                        temp: temp,
                        weight: weight,
                        waterIntake: waterIntake,
                      ),

                      /// Symptoms
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        padding:
                            EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        child: Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: symptomsWidgetList,
                        ),
                      ),

                      Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 0, bottom: 10),
                          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                          child: Column(children: notesWidgetList))
                    ],
                  );
                }
              }),
        ],
      ),
    );
  }

  void generateSymptomsBars(String key, List<Widget> symptomsWidgetList,
      double getAvg(List<double> list), List<double> value) {
    if (key == "Nausca") {
      symptomsWidgetList.add(
        SymptomRatioViewWidget(
          iconPath: "nausca.png",
          color: Colors.green,
          iconData: Icons.mood_bad_outlined,
          value: getAvg(value),
        ),
      );
    } else if (key == "Vomiting") {
      symptomsWidgetList.add(
        SymptomRatioViewWidget(
          iconPath: "vomiting.png",
          color: Colors.green,
          iconData: Icons.mood_bad_outlined,
          value: getAvg(value),
        ),
      );
    } else if (key == "Urinating") {
      symptomsWidgetList.add(
        SymptomRatioViewWidget(
          iconPath: "urine.png",
          color: Colors.orange,
          iconData: Icons.wc_outlined,
          value: getAvg(value),
        ),
      );
    } else if (key == "Breast Sensitivity") {
      symptomsWidgetList.add(
        SymptomRatioViewWidget(
          iconPath: "breast.png",
          color: Colors.amber,
          iconData: Icons.sentiment_satisfied_outlined,
          value: getAvg(value),
        ),
      );
    } else if (key == "Cravings") {
      symptomsWidgetList.add(
        SymptomRatioViewWidget(
          iconPath: "cravings.png",
          color: Colors.deepOrangeAccent,
          iconData: Icons.lunch_dining,
          value: getAvg(value),
        ),
      );
    } else if (key == "Headache") {
      symptomsWidgetList.add(
        SymptomRatioViewWidget(
          iconPath: "headache.png",
          color: Colors.orange,
          iconData: Icons.sentiment_very_dissatisfied_outlined,
          value: getAvg(value),
        ),
      );
    } else if (key == "Hunger") {
      symptomsWidgetList.add(
        SymptomRatioViewWidget(
          iconPath: "hunger.png",
          color: Colors.orange,
          iconData: Icons.restaurant_outlined,
          value: getAvg(value),
        ),
      );
    } else if (key == "Stress") {
      symptomsWidgetList.add(
        SymptomRatioViewWidget(
          iconPath: "stress.png",
          color: Colors.amber,
          iconData: Icons.sentiment_very_dissatisfied_outlined,
          value: getAvg(value),
        ),
      );
    } else if (key == "Tension") {
      symptomsWidgetList.add(
        SymptomRatioViewWidget(
          iconPath: "tension.png",
          color: Colors.red,
          iconData: Icons.sentiment_neutral_outlined,
          value: getAvg(value),
        ),
      );
    } else if (key == "Gas") {
      symptomsWidgetList.add(
        SymptomRatioViewWidget(
          iconPath: "gas.png",
          color: Colors.blue,
          iconData: Icons.masks_outlined,
          value: getAvg(value),
        ),
      );
    }
  }
}

class SymptomRatioViewWidget extends StatelessWidget {
  final String iconPath;
  final IconData iconData;
  final Color color;
  final double value;

  const SymptomRatioViewWidget({
    Key key,
    this.iconPath,
    this.iconData,
    this.color,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Row(
        children: [
          Image.asset(
            "assets/images/diary/$iconPath",
            height: 22,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: RatingBar.builder(
              initialRating: this.value,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 18,
              itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
              itemBuilder: (context, _) => Icon(
                iconData,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LifeStyleDataWidget extends StatelessWidget {
  final double temp;
  final double weight;
  final double waterIntake;
  const LifeStyleDataWidget({
    Key key,
    this.temp,
    this.weight,
    this.waterIntake,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  "assets/images/diary/weight.png",
                  height: 18,
                ),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("$weight Kg"))
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  "assets/images/diary/temperature.png",
                  height: 22,
                ),
                Container(
                    padding: EdgeInsets.only(left: 10), child: Text("$temp *C"))
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  "assets/images/diary/water.png",
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("$waterIntake Cups"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
