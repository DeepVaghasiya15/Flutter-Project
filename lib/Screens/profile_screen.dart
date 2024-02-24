import 'package:flutter/material.dart';

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