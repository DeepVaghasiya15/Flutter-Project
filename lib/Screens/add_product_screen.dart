import 'package:farmers_gateway/Screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
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
            // Container(
            //   width: double.infinity, // Full width
            //   padding: const EdgeInsets.symmetric(
            //       horizontal: 8.0), // Adjust padding as needed
            //   child: Row(
            //     children: [
            //       Expanded(
            //         flex: 1,
            //         child: ElevatedButton(
            //           onPressed: () {
            //             // Handle saving crop details
            //           },
            //           style: ButtonStyle(
            //             backgroundColor:
            //                 MaterialStateProperty.all<Color>(Colors.green),
            //           ),
            //           child: const Padding(
            //             padding: EdgeInsets.all(1.0),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Icon(
            //                   Icons.upload,
            //                   color: Colors.white,
            //                 ), // You can add an icon if needed
            //                 SizedBox(
            //                     width:
            //                         8), // Adjust spacing between icon and text
            //                 Text(
            //                   'Upload Images',
            //                   style: TextStyle(
            //                     color: Colors.white,
            //                     fontSize: 18,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
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
                  return GestureDetector(
                      onTap: () {
                        print('Button tapped for item $index');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Colors.grey[300],
                          child: const Center(
                            // child: Text('Image ${index + 1}'),
                            child: Icon(
                              Icons.upload_rounded,
                              color: Color.fromARGB(201, 1, 154, 6),
                            ),
                          ),
                        ),
                      ));
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
