import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class AddNoteAlertDialog extends StatefulWidget {
  final String selectedDate;

  const AddNoteAlertDialog({Key key, @required this.selectedDate})
      : super(key: key);

  @override
  _AddNoteAlertDialogState createState() => _AddNoteAlertDialogState();
}

class _AddNoteAlertDialogState extends State<AddNoteAlertDialog> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  final _form = GlobalKey<FormState>();
  final LIFE_EVENT = "LIFE_EVENT";

  List<File> _selectedImages = <File>[];
  bool showProgressBar = false;
  String uuid;
  @override
  void initState() {
    final firebaseUser = Provider.of<User>(this.context, listen: false);
    uuid = firebaseUser.uid;
  }

  openImportFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ["jpg", "png", "jpeg"]);

    if (result != null) {
      setState(() {
        _selectedImages.addAll(result.paths.map((path) => File(path)).toList());
      });
      print(_selectedImages);
    } else {
      // User canceled the picker
    }
  }

  Future uploadImageToFirebase(File imageFile) async {
    String fileName = basename(imageFile.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    TaskSnapshot uploadTask = await firebaseStorageRef.putFile(imageFile);
    return uploadTask.ref.getDownloadURL();
  }

  Future<void> saveNote(BuildContext context) async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    setState(() {
      showProgressBar = true;
    });
    List<String> downloadUrls = <String>[];
    if (_selectedImages.isNotEmpty) {
      for (var imageFile in _selectedImages) {
        String url = await uploadImageToFirebase(imageFile);
        downloadUrls.add(url);
      }
    }
    Note note = Note(titleController.text, descriptionController.text,
        widget.selectedDate, downloadUrls);
    DiaryData diaryData = DiaryData(LIFE_EVENT, note.toJson(),);
    diaryData.userId = uuid;
    diaryData.section = "NOTE";
    Provider.of<UserService>(context, listen: false)
        .saveDiaryData(diaryData);
    setState(() {
      _selectedImages = [];
    });
    Navigator.pop(context);
    // TODO - show success msg
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // contentPadding: EdgeInsets.zero,
      content: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        constraints: BoxConstraints(minHeight: 300),
        child: Form(
          key: _form,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Container(
                  child: Text(
                    "Add Note",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(60, 180, 242, 1),
                    ),
                  ),
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                ),
              ),

              /**
               * title
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
                          controller: titleController,
                          validator: (text) {
                            if (text.isEmpty)
                              return "Please enter a title";
                            else
                              return null;
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                            // alignLabelWithHint: true,
                            border: InputBorder.none,
                            labelText: 'Title',
                            contentPadding: EdgeInsets.only(top: 5, bottom: 5),
                          )))),
              SizedBox(
                height: 20,
              ),

              /**
               * descritpion
               */
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2.0, color: Color.fromRGBO(60, 180, 242, 1)),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 25, right: 15),
                      child: Container(
                        child: TextFormField(
                            controller: descriptionController,
                            obscureText: false,
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.multiline,
                            minLines: 5,
                            maxLines: 8,
                            expands: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // floatingLabelBehavior:FloatingLabelBehavior.always,
                              alignLabelWithHint: true,
                              labelText: 'Description',
                              contentPadding: EdgeInsets.zero,
                            )),
                      ))),
              SizedBox(
                height: 20,
              ),

              /**
               * add images
               */
              if (_selectedImages != null && _selectedImages.isNotEmpty)
                Row(
                  children: _selectedImages
                      .map((e) => Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(2),
                            child: Image.file(
                              e,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ))
                      .toList(),
                ),
              Container(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.add,
                    color: Color.fromRGBO(60, 180, 242, 1),
                  ),
                  label: Text(
                    "Add Images",
                    style: TextStyle(
                      color: Color.fromRGBO(73, 73, 73, 1.0),
                      fontSize: 16.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      width: 2.0,
                      color: Color.fromRGBO(60, 180, 242, 1),
                    ),
                    primary: Colors.white,
                    padding: EdgeInsets.all(10),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    openImportFile();
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),

              /**
               * save button
               */
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
                    saveNote(context);
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
      ),
    );
  }
}
