// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_signin/screens/signin_screen.dart';
import 'package:farmers_gateway/Screens/signIn_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
            child: Text("Logout"),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2, // Two squares in each row
        children: List.generate(
          8, // Total number of squares
          (index) => Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color:
                  Colors.black.withOpacity(0.1), // Slightly transparent black
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),

      // body: Center(
      //     child: ElevatedButton(
      //         child: Text("Logout"),
      //         // onPressed: () {
      //         //   FirebaseAuth.instance.signOut().then((value) {
      //         //     print("Signed Out");
      //         //   Navigator.push(context,
      //         //       MaterialPageRoute(builder: (context) => SignInScreen()));
      //         // },);
      //         onPressed: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => SignInScreen()));
      //         })),
    );
  }
}
