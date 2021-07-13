import 'package:flutter/material.dart';
import 'package:mother_and_baby/screens/home.dart';
import 'package:mother_and_baby/screens/register.dart';
import 'package:mother_and_baby/services/auth.service.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _form = GlobalKey<FormState>();

  Future<bool> login(BuildContext context, String email, String password) {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return null;
    }
    Provider.of<AuthenticationService>(context, listen: false)
        .signIn(email: email, password: password)
        .then((result) {
      if (result) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen()));
      } else {
        final snackBar = SnackBar(content: Text('User name or password is wrong! Please try again'), backgroundColor: Colors.red,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

  Future<bool> loginWithGoogle(BuildContext context) {
    Provider.of<AuthenticationService>(context, listen: false)
        .signInWithGoogle()
        .then((result) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen(selectedIndex: 1,)));
    });
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
                    "Sign In",
                    style: TextStyle(
                        color: Color.fromRGBO(60, 180, 242, 1), fontSize: 35),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
                child: Form(
                  key: _form,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
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
                                  obscureText: true,
                                  controller: passwordController,
                                  validator: (text) {
                                    if (text.isEmpty)
                                      return "Please enter a valid password";
                                    else
                                      return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Password',
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
                            login(context, emailController.text,
                                passwordController.text);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "SING IN",
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
                            loginWithGoogle(context);
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
                                  "Login with google",
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
                            // TODO - fix fb problem
                            // Provider.of<AuthenticationService>(context, listen: false)
                            //     .signInWithFacebook()
                            //     .then((result) {
                            //   Navigator.of(context).push(
                            //       MaterialPageRoute(builder: (BuildContext context) => HomeScreen(selectedIndex: 1,)));
                            // });
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
                                  "Login with facebook",
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
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Donʼt have Account? ",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey)),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        RegisterScreen()));
                              },
                              child: Text(
                                "Create Account",
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
