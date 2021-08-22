import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mother_and_baby/models/asiriUser.dart';
import 'package:mother_and_baby/models/communityPost.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:mother_and_baby/widgets/imageCarousel.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CommunityPage extends StatefulWidget {
  final AsiriUser asiriUser;

  const CommunityPage({Key key, this.asiriUser}) : super(key: key);
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  List<File> _selectedImages = <File>[];
  var txtController = TextEditingController();
  var _form = GlobalKey<FormState>();
  bool showProgressBar = false;
  List<CommunityPost> communityPostList = <CommunityPost>[];

  openImportFile() async {
    // FilePickerResult result = await FilePicker.platform.pickFiles(
    //     allowMultiple: true,
    //     type: FileType.image,
    //     );
    //
    // print("filess");
    // print(result.toString());//allowedExtensions: ["jpg", "png", "jpeg"]
    //
    // if (result != null) {
    //   setState(() {
    //     _selectedImages.addAll(result.paths.map((path) => File(path)).toList());
    //   });
    //   print(_selectedImages);
    // } else {
    //   // User canceled the picker
    // }
  }

  Future uploadImageToFirebase(File imageFile) async {
    String fileName = basename(imageFile.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/community/$fileName');
    TaskSnapshot uploadTask = await firebaseStorageRef.putFile(imageFile);
    return uploadTask.ref.getDownloadURL();
  }

  Future<void> savePost(BuildContext context) async {
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

    CommunityPost post = CommunityPost(txtController.text, downloadUrls,
        widget.asiriUser.userId, DateTime.now().millisecondsSinceEpoch);
    post.userData = widget.asiriUser;
    Provider.of<UserService>(context, listen: false).saveCommunityPost(post);
    setState(() {
      _selectedImages = [];
      showProgressBar = false;
      txtController.text = "";
    });
  }

  void loadPosts(BuildContext context) {}

  @override
  void initState() {
    loadPosts(this.context);
  }

  @override
  Widget build(BuildContext context) {
    loadPosts(context);

    Size screenSize = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(minHeight: screenSize.height),
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/diary/bg.png"),
              fit: BoxFit.cover)),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 15),
                        width: 30,
                        child: Image.asset(
                          "assets/images/drawer/burger.png",
                          height: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25, top: 10),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.0,
                                    color: Color.fromRGBO(60, 180, 242, 1)),
                                borderRadius: new BorderRadius.circular(10.0),
                                color: Colors.white),
                            padding: EdgeInsets.only(left: 25, right: 15),
                            child: Form(
                              key: _form,
                              child: Column(
                                children: [
                                  TextFormField(
                                      controller: txtController,
                                      obscureText: false,
                                      validator: (text) {
                                        if (text.isEmpty)
                                          return "Please enter a value";
                                        else
                                          return null;
                                      },
                                      textInputAction: TextInputAction.newline,
                                      keyboardType: TextInputType.multiline,
                                      minLines: 3,
                                      maxLines: 5,
                                      expands: false,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        // floatingLabelBehavior:FloatingLabelBehavior.always,
                                        alignLabelWithHint: true,
                                        hintText: "What's on your mind?",
                                        contentPadding:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                      )),
                                ],
                              ),
                            )),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.all(0),
                            child: IconButton(
                              icon: Icon(
                                Icons.add_a_photo,
                                color: Color.fromRGBO(60, 180, 242, 1),
                                size: 30,
                              ),
                              onPressed: () {
                                openImportFile();
                              },
                            ),
                          ),
                        )
                      ],
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(0),
                          child: ElevatedButton(
                            child: Text("Save"),
                            onPressed: () {
                              savePost(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: StreamBuilder(
                    stream: Provider.of<UserService>(context, listen: false)
                        .getCommunityPosts(20),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Container(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              CommunityPost post = CommunityPost.fromJson(
                                  snapshot.data.docs[index].data());
                              return Container(
                                margin: EdgeInsets.only(
                                    top: 5, left: 25, right: 25, bottom: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        post.userData.imageUrl != ""
                                            ? CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    post.userData.imageUrl))
                                            : CircleAvatar(
                                                child: Icon(Icons
                                                    .account_circle_outlined),
                                              ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10.0,
                                              ),
                                              child: Text(
                                                toBeginningOfSentenceCase(
                                                    widget.asiriUser.name),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10.0,
                                              ),
                                              child: Text(
                                                DateFormat("MMMM d, yyyy")
                                                    .format(DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                            post.createdAt)),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Text(
                                        post.text,
                                        style: TextStyle(
                                            fontSize: post.imageList.length > 0
                                                ? 16
                                                : 19),
                                      ),
                                    ),
                                    if (post.imageList.length > 0)
                                      ImageCarousel(
                                        imageList: post.imageList,
                                      ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        post.likedUserIdList == null ||
                                                !post.likedUserIdList.contains(
                                                    widget.asiriUser.userId)
                                            ? IconButton(
                                                icon: Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                ),
                                                onPressed: () => {
                                                  Provider.of<UserService>(
                                                          context,
                                                          listen: false)
                                                      .likePost(
                                                          snapshot.data
                                                              .docs[index].id,
                                                          widget
                                                              .asiriUser.userId)
                                                },
                                              )
                                            : IconButton(
                                                icon: Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () => {
                                                  Provider.of<UserService>(
                                                          context,
                                                          listen: false)
                                                      .unlikePost(
                                                          snapshot.data
                                                              .docs[index].id,
                                                          widget
                                                              .asiriUser.userId)
                                                },
                                              ),
                                        Text(
                                            "${post.likedUserIdList != null ? post.likedUserIdList.length.toString() : 0} likes")
                                      ],
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              );
                            });
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
