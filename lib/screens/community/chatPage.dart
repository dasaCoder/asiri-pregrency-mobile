import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mother_and_baby/models/asiriUser.dart';
import 'package:mother_and_baby/models/message.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  final AsiriUser asiriUser;

  const ChatPage({Key key, this.asiriUser}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var txtController = TextEditingController();
  var _form = GlobalKey<FormState>();

  void sendMessage() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }

    Message message = Message(
        txtController.text, widget.asiriUser.userId, widget.asiriUser.name, DateTime.now().millisecondsSinceEpoch);
    Provider.of<UserService>(context, listen: false).saveMessage(message);

    setState(() {
      txtController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        constraints: BoxConstraints(minHeight: screenSize.height),
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/diary/bg.png"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      // Scaffold.of(context).openDrawer();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 15),
                      width: 30,
                      child: Icon(
                        Icons.arrow_back_rounded,
                        size: 25,
                        color: Color.fromRGBO(161, 129, 239, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: StreamBuilder(
                    stream: Provider.of<UserService>(context, listen: false)
                        .getMessages(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Container(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              Message message = Message.fromJson(
                                  snapshot.data.docs[index].data());
                              return Container(
                                child: Column(
                                  children: [
                                    message.userId == widget.asiriUser.userId
                                        ? buildOwnMessage(screenSize, message)
                                        : buildMessageFromSomeone(
                                            screenSize, message),
                                  ],
                                ),
                              );
                            });
                      }
                    },
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0,
                                color: Color.fromRGBO(161, 129, 239, 1)),
                            borderRadius: new BorderRadius.circular(30.0),
                            color: Colors.white),
                        padding: EdgeInsets.only(left: 25, right: 15),
                        margin: EdgeInsets.only(
                            left: 15, right: 5, bottom: 5, top: 3),
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
                                  minLines: 1,
                                  maxLines: 2,
                                  expands: false,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    // floatingLabelBehavior:FloatingLabelBehavior.always,
                                    alignLabelWithHint: true,
                                    hintText: "Type your message...",
                                    contentPadding:
                                        EdgeInsets.only(top: 2, bottom: 2),
                                  )),
                            ],
                          ),
                        )),
                  ),
                  ElevatedButton(
                    onPressed: () => sendMessage(),
                    child: Icon(Icons.send),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(15),
                        primary: Color.fromRGBO(161, 129, 239, 1)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Align buildMessageFromSomeone(Size screenSize, Message message) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(20.0),
              color: Color.fromRGBO(219, 205, 255, 1.0)),
          padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
          margin: EdgeInsets.only(top: 2, bottom: 2),
          constraints: BoxConstraints(maxWidth: screenSize.width * 0.65),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                toBeginningOfSentenceCase(message.userName),
                style: TextStyle(fontSize: 12, color: Colors.pink),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                message.text,
                style: TextStyle(fontSize: 15),
              ),
            ],
          )),
    );
  }

  Align buildOwnMessage(Size screenSize, Message message) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(20.0),
              color: Color.fromRGBO(179, 219, 255, 1.0)),
          padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
          margin: EdgeInsets.only(top: 2, bottom: 2),
          constraints: BoxConstraints(maxWidth: screenSize.width * 0.65),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.text,
                style: TextStyle(fontSize: 15),
              ),
            ],
          )),
    );
  }
}
