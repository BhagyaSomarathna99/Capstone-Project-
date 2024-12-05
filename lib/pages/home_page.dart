import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void signUserOut() {
  FirebaseAuth.instance.signOut();
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool systemOn = true;
  bool actionSwitch = false;
  String selectedAnimal = 'Elephant';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('lib/images/logo.png', height: 60), // Increased height of the logo
            SizedBox(width: 10),
            Spacer(), // Added spacer to push "Ongoing Action" to the right
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end, // Align text and indicator to the right
              children: [
                Text(
                  'Ongoing Action',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: systemOn ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.black, // Black background color for the first row
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Last Detection', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
                          SizedBox(height: 10),
                          Text('Date: 2024-05-16', style: TextStyle(color: Colors.white)),
                          Text('Time: 14:35', style: TextStyle(color: Colors.white)),
                          Text('Animal: Elephant', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100, // Adjusted width of the captured image
                      height: 100, // Adjusted height of the captured image
                      child: Image.asset('lib/images/last_detection.jpg', fit: BoxFit.cover), // Ensure this image exists
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.grey[200], // Light ash background color for the second row
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align button to the left
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, // Set button color to black
                          foregroundColor: Colors.white, // Set button text color to white
                        ),
                        onPressed: () {
                          // Add your request update logic here
                        },
                        child: Text('Request Update'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.black, // Black background color for the third row
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Turn On/Off', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                          Text('Action', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SwitchListTile(
                        title: Text(''),
                        value: actionSwitch,
                        onChanged: (bool value) {
                          setState(() {
                            actionSwitch = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.grey[200], // Light ash background color for the fourth row
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Change the Action', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                            dense: true,
                            title: const Text('Elephant'),
                            leading: Radio<String>(
                              value: 'Elephant',
                              groupValue: selectedAnimal,
                              onChanged: actionSwitch ? (String? value) {
                                setState(() {
                                  selectedAnimal = value!;
                                });
                              } : null,
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                            dense: true,
                            title: const Text('Wild-Boar'),
                            leading: Radio<String>(
                              value: 'Wild-Boar',
                              groupValue: selectedAnimal,
                              onChanged: actionSwitch ? (String? value) {
                                setState(() {
                                  selectedAnimal = value!;
                                });
                              } : null,
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                            dense: true,
                            title: const Text('Peacock'),
                            leading: Radio<String>(
                              value: 'Peacock',
                              groupValue: selectedAnimal,
                              onChanged: actionSwitch ? (String? value) {
                                setState(() {
                                  selectedAnimal = value!;
                                });
                              } : null,
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                            dense: true,
                            title: const Text('Common'),
                            leading: Radio<String>(
                              value: 'Common',
                              groupValue: selectedAnimal,
                              onChanged: actionSwitch ? (String? value) {
                                setState(() {
                                  selectedAnimal = value!;
                                });
                              } : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
