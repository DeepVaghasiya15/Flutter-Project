import 'package:farmers_gateway/Screens/home_screen.dart';
import 'package:farmers_gateway/Screens/signUp_screen.dart';
import 'package:farmers_gateway/utils/color_utils.dart';
import 'package:farmers_gateway/reusable_widgets/reusable_widgets.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("006600"),
            hexStringToColor("008000"),
            hexStringToColor("7CCD7C")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      20, MediaQuery.of(context).size.height * 0.2, 20, 20),
                  // MediaQuery.of(context).size.height * 0.1
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.end, // Align to the bottom
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      logoWidget("assets/images/farmer_logo.jpg"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Farmer's Gateway",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Text(
                        "Gateway to the Farmer's Future",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 254, 254),
                          fontSize: 14,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      reusableTextField("Enter Username", Icons.person_outline,
                          false, _emailTextController),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField("Enter Password", Icons.lock_outline,
                          true, _passwordTextController),
                      SizedBox(
                        height: 20,
                      ),
                      // signInSignUpButton(context, true, () {
                      //   FirebaseAuth.instance
                      //       .signInWithEmailAndPassword(
                      //           email: _emailTextController.text,
                      //           password: _passwordTextController.text)
                      //       .then((value) {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => HomeScreen()));
                      //   });
                      // }),
                      signInSignUpButton(context, true, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }),

                      signUpOption()
                    ],
                  )))),
    );
  }

  Image logoWidget(String imageName) {
    return Image.asset(imageName,
        fit: BoxFit.fitWidth, width: 120, height: 120);
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have account?  ",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: const Text(
              "Sign Up",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
