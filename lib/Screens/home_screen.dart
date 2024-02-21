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
  int _selectedIndex = 0;

  void _showSignOutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sign Out"),
          content: Text("Are you sure you want to sign out?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                // Perform signout action
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              child: Text(
                "Sign Out",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _widgetOptions = <Widget>[
    Container(
      color: Colors.white,
      child: GridView.count(
        crossAxisCount: 2, // Two squares in each row
        children: List.generate(
          8, // Total number of squares
          (index) => GridItem(
            itemName: 'Item ${index + 1}',
            itemPrice: 10.0 + index * 5,
            itemWeight: '${100 + index}g',
            onTap: () {
              print('Item ${index + 1} tapped');
            },
            // margin: EdgeInsets.all(8),
            // decoration: BoxDecoration(
            //   color:
            //       Colors.black.withOpacity(0.1), // Slightly transparent black
            //   borderRadius: BorderRadius.circular(10),
            // ),
          ),
        ),
      ),
      // child: Center(
      //   child: Text('Home Screen'),
      // ),
    ),
    Container(
      color: Colors.white,
      child: Center(
        child: Text('Add Screen'),
      ),
    ),
    Container(
      color: Colors.white,
      child: Center(
        child: Text('Profile Screen'),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
        actions: [
          if (_selectedIndex == 2)

            // If Profile Screen is selected, show Signout button
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                // Handle signout action here
                _showSignOutConfirmationDialog(context);
              },
            ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 15, 181, 0),
        onTap: _onItemTapped,
      ),
    );
  }

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
  // );
}

class GridItem extends StatelessWidget {
  final String itemName;
  final double itemPrice;
  final String itemWeight;
  final VoidCallback onTap;

  const GridItem({
    required this.itemName,
    required this.itemPrice,
    required this.itemWeight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your image here
            Image.asset(
              "assets/images/wheat_image.jpg", // Replace with your image path
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              itemName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Price: \$${itemPrice.toStringAsFixed(2)}'),
            Text('Weight: $itemWeight'),
            ElevatedButton(
              onPressed: onTap,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
