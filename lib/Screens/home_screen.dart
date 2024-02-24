// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_signin/screens/signin_screen.dart';
// ignore_for_file: library_private_types_in_public_api

import 'package:farmers_gateway/Screens/product_detail_screen.dart';
import 'package:farmers_gateway/Screens/signIn_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<String> _titles = ['Featured Products', 'Add Product', 'Profile'];

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
        actions: [
          if (_selectedIndex == 2)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                // Handle signout action here
                _showSignOutConfirmationDialog(context);
              },
            ),
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
          // if (_selectedIndex == 0)
          //   IconButton(
          //     icon: Icon(
          //       Icons.shopping_cart,
          //       color: Colors.green,
          //     ),
          //     onPressed: () {
          //       // Handle shopping cart icon press
          //     },
          //   ),
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
            label: 'Add Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
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
          // mainAxisAlignment: MainAxisAlignment.start,

          children: [
            // Add your image here
            Padding(
              padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 55,
                  left: 8,
                  right: 8), // Adjust the padding as needed
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(10.0), // Adjust the radius as needed
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
                  width: 25, // Adjust the width as needed
                  height: 25, // Adjust the height as needed
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(4),
                  //   color:
                  //       Color.fromARGB(240, 255, 255, 255), // Background color
                  //   // shape: BoxShape.circle, // Make it circular
                  // ),
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

class ProfileScreen extends StatelessWidget {
  final String profileImageUrl;
  final String username;
  final String uniqueId;
  final String phoneNumber;
  final String address;

  const ProfileScreen({
    Key? key,
    required this.profileImageUrl,
    required this.username,
    required this.uniqueId,
    required this.phoneNumber,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(profileImageUrl),
        ),
        const SizedBox(height: 20),
        Text(
          username,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'ID: $uniqueId',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.phone,
              color: Colors.green,
              size: 20,
            ),
            const SizedBox(width: 5),
            Text(
              phoneNumber,
              style: const TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 127, 127, 127),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20), // Adjust the horizontal padding as needed
          child: Container(
            width:
                MediaQuery.of(context).size.width, // Adjust the width as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_pin,
                  color: Colors.green,
                  size: 30,
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8), // Adjust the vertical margin as needed
                    child: Text(
                      address,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 127, 127, 127),
                      ),
                      textAlign:
                          TextAlign.center, // Ensure text remains centered
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AddProductScreenState extends State<AddProductScreen> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _amountController;
  late TextEditingController _descriptionController;
  // File? _image;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _amountController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelStyle: const TextStyle(
                    color: Color.fromARGB(
                        255, 0, 0, 0)), // Text color when not focused
                focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          Colors.green), // Border color when error and focused
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.red), // Border color when error
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity, // Full width
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0), // Adjust padding as needed
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle saving crop details
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.upload,
                              color: Colors.white,
                            ), // You can add an icon if needed
                            SizedBox(
                                width:
                                    8), // Adjust spacing between icon and text
                            Text(
                              'Upload Images',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              // width: 60,
              // width: MediaQuery.of(context).size.width * 0.8,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, // Set crossAxisCount to 5
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.grey[300],
                      child: const Center(
                          // child: Text('Image ${index + 1}'),
                          ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: 'Price/kg',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelStyle: const TextStyle(
                    color: Color.fromARGB(
                        255, 0, 0, 0)), // Text color when not focused
                focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          Colors.green), // Border color when error and focused
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.red), // Border color when error
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelStyle: const TextStyle(
                    color: Color.fromARGB(
                        255, 0, 0, 0)), // Text color when not focused
                focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          Colors.green), // Border color when error and focused
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.red), // Border color when error
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                alignLabelWithHint: true, // Align label with the hint text
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelStyle: const TextStyle(
                  color: Color.fromARGB(
                      255, 0, 0, 0), // Text color when not focused
                ),
                focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                  ), // Border color when error and focused
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ), // Border color when error
                ),
              ),
              minLines: 3,
              maxLines: 4,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Row(
                children: [
                  Switch(
                    value: isAvailable,
                    onChanged: (value) {
                      setState(() {
                        isAvailable = value;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                  Text(
                    isAvailable ? 'Available' : 'Not Available',
                    style: TextStyle(
                      fontSize: 15,
                      color: isAvailable ? Colors.green : Colors.red,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
// Handle saving crop details
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                // child: Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
