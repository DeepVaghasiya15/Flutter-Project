// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_signin/screens/signin_screen.dart';
// ignore_for_file: library_private_types_in_public_api

import 'package:farmers_gateway/Screens/add_product_screen.dart';
import 'package:farmers_gateway/Screens/product_detail_screen.dart';
import 'package:farmers_gateway/Screens/profile_screen.dart';
import 'package:farmers_gateway/Screens/signIn_screen.dart';
// import 'package:farmers_gateway/reusable_widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<String> _titles = [
    'Featured Products',
    'Add Product',
    'Profile',
    'Listings'
  ];

  void _showSignOutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Sign Out"),
          content: const Text("Are you sure you want to sign out?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                // Perform signout action
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                );
              },
              child: const Text(
                "Sign Out",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  // void navigateToProfileScreen() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => ProfileScreen(
  //         // Pass your profile data here
  //         profileImageUrl: 'assets/images/profile_pic.jpg',
  //         username: 'John Doe',
  //         uniqueId: '123456',
  //       ),
  //     ),
  //   );
  // }

  late List<Widget> _widgetOptions;
  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      Container(
        color: Colors.white,
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            8,
            (index) => GridItem(
              itemName: 'Item ${index + 1}',
              itemPrice: 10.0 + index * 5,
              onTap: () {
                print('Item ${index + 1} tapped');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const product_detail_screen(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      Container(
        color: const Color.fromARGB(255, 239, 255, 238),
        child: AddProductScreen(),
      ),
      Container(
        color: Colors.white,
        child: const Center(
          child: ProfileScreen(
            profileImageUrl: "assets/images/farmer_profile.jpg",
            username: "Farmer's Name",
            uniqueId: 'NKce346fe',
            phoneNumber: "+919236741245",
            address: "Plot No 308, N I T, Jawahar Colony, Faridabad,Delhi",
          ),
        ),
      ),
      Container(
        color: const Color.fromARGB(255, 239, 255, 238),
        // child: AddProductScreen(),
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        automaticallyImplyLeading: false,
        leading: _selectedIndex == 0
            ? Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              )
            : null,
        actions: [
          if (_selectedIndex == 2)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                // Handle signout action here
                _showSignOutConfirmationDialog(context);
              },
            ),
          // if (_selectedIndex == 0)
          //   IconButton(
          //       onPressed: () {
          //         // Scaffold.of(context).openDrawer();
          //       },
          //       icon: Container(
          //         width: 25,
          //         height: 25,
          //         child: Image.asset("assets/images/drawer_icon.png"),
          //       )),
          if (_selectedIndex == 0)
            IconButton(
                onPressed: () {
                  // Handle save icon press
                },
                icon: Container(
                  width: 20,
                  height: 20,
                  child: Image.asset("assets/images/save_image.png"),
                )),
        ],
      ),
      drawer: Drawer(
        // Add the drawer widget here
        child: ListView(
          padding: EdgeInsets.fromLTRB(8, 20, 8, 20),
          children: <Widget>[
            Container(
              color: Colors.white,
              child: const Center(
                child: ProfileScreen(
                  profileImageUrl: "assets/images/farmer_profile.jpg",
                  username: "Farmer's Name",
                  uniqueId: 'NKce346fe',
                  phoneNumber: "+919236741245",
                  address:
                      "Plot No 308, N I T, Jawahar Colony, Faridabad,Delhi",
                ),
              ),
            ),
            // DrawerHeader(
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            //   child: Text(
            //     'Drawer Header',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 24,
            //     ),
            //   ),
            // ),
            // ListTile(
            //   title: Text('Item 1'),
            //   onTap: () {
            //     // Update the state of the app
            //     // Close the drawer
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   title: Text('Item 2'),
            //   onTap: () {
            //     // Update the state of the app
            //     // Close the drawer
            //     Navigator.pop(context);
            //   },
            // ),
            // // Add more list tiles for additional items in the drawer
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Listings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 15, 181, 0),
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
  // final String itemWeight;
  final VoidCallback onTap;

  const GridItem({
    required this.itemName,
    required this.itemPrice,
    // required this.itemWeight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(173, 227, 227, 227),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 55, left: 8, right: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/images/wheat_image.jpg',
                  width: MediaQuery.of(context).size.width * 0.8,
                  // height: MediaQuery.of(context).size.width * 0.8,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 14,
              right: 14,
              child: Container(
                  width: 25,
                  height: 25,
                  child: IconButton(
                    onPressed: onTap,
                    // icon: Icon(Icons.save),
                    icon: Image.asset("assets/images/save_image.png"),
                    iconSize: 20,
                    padding: const EdgeInsets.all(2),
                    // color: Colors.green,
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    itemName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Price: \$${itemPrice.toStringAsFixed(2)}/kg',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
