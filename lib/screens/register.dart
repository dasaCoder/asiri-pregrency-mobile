import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mother_and_baby/models/asiriUser.dart';
import 'package:mother_and_baby/screens/Login.dart';
import 'package:mother_and_baby/screens/home.dart';
import 'package:mother_and_baby/screens/pregantDateScreen.dart';
import 'package:mother_and_baby/services/auth.service.dart';
import 'package:mother_and_baby/services/user.service.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isSocialSignUp = false;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var telephoneController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  final _form = GlobalKey<FormState>();
  String userProfilePicUrl = "";
  String uuid;
  AsiriUser userDetails;

  void loginWithSocial(BuildContext context) {
    Provider.of<AuthenticationService>(context, listen: false)
        .signInWithGoogle()
        .then((credentials) {
      // hide password inputs
      setState(() {
        isSocialSignUp = true;
      });

      nameController.text = credentials.user.displayName;
      emailController.text = credentials.user.email;
      userProfilePicUrl = credentials.user.photoURL;
      uuid = credentials.user.uid;
    });
  }

  void registerUserWithUserNameAndPassword(BuildContext context) {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return null;
    }
    Provider.of<AuthenticationService>(context, listen: false)
      .signUp(email: emailController.text, password: passwordController.text)
      .then((result) {
        if(result != null) {
          uuid = result.user.uid;
          socialRegister(context);
        } else {
          final snackBar = SnackBar(content: Text('Something occurred! please try again'), backgroundColor: Colors.red,);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
    });
  }

  void socialRegister(BuildContext context) {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return null;
    }
    userDetails = AsiriUser(uuid, nameController.text, emailController.text,
        telephoneController.text, "", userProfilePicUrl);
    Provider.of<UserService>(context, listen: false)
        .saveUser(userDetails: userDetails)
        .then((doc) {
      final snackBar = SnackBar(content: Text('Account created successfully!'), backgroundColor: Colors.green,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => PregnantDateScreen()));
    });

    // Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (BuildContext context) => PregnantDateScreen()));
  }

  void validateBasicUserDetails() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/images/login/bg.png"),
                  fit: BoxFit.cover)),
          width: screenWidth,
          constraints: BoxConstraints(minHeight: screenHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenWidth * 0.1,
              ),
              Container(
                padding: EdgeInsets.only(left: screenWidth * 0.1),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Color.fromRGBO(60, 180, 242, 1), fontSize: 35),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 15),
                child: Form(
                  key: _form,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        // decoration: BoxDecoration(color: Colors.red),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(60, 180, 242, 1),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () {
                            loginWithSocial(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 50,
                                  child: Image.asset(
                                    "assets/images/login/google.png",
                                    height: 50,
                                  )),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Sign up with google",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        // decoration: BoxDecoration(color: Colors.red),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(60, 180, 242, 1),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (BuildContext context) => PregnantDateScreen()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 50,
                                  child: Image.asset(
                                    "assets/images/login/fb.png",
                                    height: 30,
                                  )),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Sign up with facebook",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "or",
                          style: TextStyle(
                              color: Color.fromRGBO(60, 180, 242, 1),
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      /**
                       * inputs
                       */
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0,
                                color: Color.fromRGBO(60, 180, 242, 1)),
                            borderRadius: new BorderRadius.circular(50.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(left: 25, right: 15),
                              child: TextFormField(
                                  obscureText: false,
                                  controller: nameController,
                                  validator: (text) {
                                    if (text.isEmpty)
                                      return "Please enter a valid name";
                                    else
                                      return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Name',
                                    contentPadding:
                                        EdgeInsets.only(top: 5, bottom: 5),
                                  )))),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0,
                                color: Color.fromRGBO(60, 180, 242, 1)),
                            borderRadius: new BorderRadius.circular(50.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(left: 25, right: 15),
                              child: TextFormField(
                                  obscureText: false,
                                  controller: emailController,
                                  validator: (text) {
                                    bool isEmailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
                                    if (text.isEmpty || !isEmailValid)
                                      return "Please enter a valid email";
                                    else
                                      return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Email',
                                    contentPadding:
                                        EdgeInsets.only(top: 5, bottom: 5),
                                  )))),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0,
                                color: Color.fromRGBO(60, 180, 242, 1)),
                            borderRadius: new BorderRadius.circular(50.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(left: 25, right: 15),
                              child: TextFormField(
                                  obscureText: false,
                                  controller: telephoneController,
                                  validator: (text) {
                                    bool isTelephoneValid = RegExp(r"07(\d{8})").hasMatch(text);
                                    if (text.isEmpty || !isTelephoneValid)
                                      return "Please enter a valid telephone number";
                                    else
                                      return null;
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Telephone Number',
                                    hintText: '07XXXXXXXX',
                                    contentPadding:
                                        EdgeInsets.only(top: 5, bottom: 5),
                                  )))),
                      SizedBox(
                        height: 20,
                      ),
                      if (!isSocialSignUp)
                        Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2.0,
                                  color: Color.fromRGBO(60, 180, 242, 1)),
                              borderRadius: new BorderRadius.circular(50.0),
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(left: 25, right: 15),
                                child: TextFormField(
                                    obscureText: true,
                                    controller: passwordController,
                                    validator: (text) {
                                      if (text.isEmpty)
                                        return "Please enter a valid password";
                                      else if (text.length < 6)
                                        return "Password should have more than 6 letters";
                                      else
                                        return null;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Password',
                                      contentPadding:
                                          EdgeInsets.only(top: 5, bottom: 5),
                                    )))),
                      if (!isSocialSignUp)
                        SizedBox(
                          height: 20,
                        ),
                      if (!isSocialSignUp)
                        Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2.0,
                                  color: Color.fromRGBO(60, 180, 242, 1)),
                              borderRadius: new BorderRadius.circular(50.0),
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(left: 25, right: 15),
                                child: TextFormField(
                                    obscureText: true,
                                    controller: rePasswordController,
                                    validator: (text) {
                                      if (text.isEmpty)
                                        return "Please enter a valid password";
                                      else if (text != passwordController.text)
                                        return "Passwords are not matched";
                                      else
                                        return null;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Re-enter Password',
                                      contentPadding:
                                          EdgeInsets.only(top: 5, bottom: 5),
                                    )))),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        // decoration: BoxDecoration(color: Colors.red),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(255, 87, 143, 1),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () {
                            if (isSocialSignUp) {
                              socialRegister(context);
                            } else {
                              registerUserWithUserNameAndPassword(context);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              isSocialSignUp ? "Next" : "SIGN UP",
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
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an Account? ",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey)),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginScreen()));
                              },
                              child: Text(
                                "SignIn",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(255, 87, 143, 1)),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
