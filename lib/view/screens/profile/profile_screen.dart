import 'package:chikista/controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/login_screen.dart';

class ProfileSettingsPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.chevron_left_sharp, color: Colors.black, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            AssetImage('assets/images/profile-icon.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: Color(0xff6f8bef),

                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.white,
                                width: 2), // Border for a clean look
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Take Care!",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text(
                        "Richa Bose",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),
              Text(
                "Settings",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.notifications_none, color: Colors.black),
                title: Text("Notification"),
                subtitle: Text("Check your medicine notification"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.volume_up_outlined, color: Colors.black),
                title: Text("Sound"),
                subtitle: Text("Ring, Silent, Vibrate"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.person_outline, color: Colors.black),
                title: Text("Manage Your Account"),
                subtitle: Text("Password, Email ID, Phone Number"),
                onTap: () {},
              ),
              // Device Section
              SizedBox(height: 10),
              Text(
                "Device",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.wifi, color: Colors.black),
                      title: Text("Connect"),
                      subtitle: Text("Bluetooth, Wi-Fi"),
                      onTap: () {},
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        leading:
                            Icon(Icons.volume_up_outlined, color: Colors.black),
                        title: Text("Sound Option"),
                        subtitle: Text("Ring, Silent, Vibrate"),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ), // Caretakers Section
              SizedBox(height: 10),
              Text(
                "Caretakers: 03",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Default profile icons
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage('assets/images/profile.png'),
                        ),
                        SizedBox(height: 8),
                        Text("Dipa Luna", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage('assets/images/img_1.png'),
                        ),
                        SizedBox(height: 8),
                        Text("Roz Sod.", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/img.png'),
                        ),
                        SizedBox(height: 8),
                        Text("Sunny Tu.", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    // Add button
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.add, color: Colors.black),
                        ),
                        SizedBox(height: 8),
                        Text("Add", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              // Doctor Section
              SizedBox(height: 10),
              Text(
                "Doctor",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CircleAvatar(
                        backgroundColor: Color(0xff6f8bef),
                        radius: 30,
                        child: Icon(Icons.add, color: Colors.white, size: 40)),
                    SizedBox(height: 10),
                    Text(
                      "Add Your Doctor",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Or use",
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Or use invite link",
                            style:
                                TextStyle(color: Colors.orange, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("Privacy Policy"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Terms of Use"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Rate Us"),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Share"),
                    onTap: () {},
                  ),
                ],
              ),
              // Logout Button
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xff6f8bef),
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      color: Color(0xff6f8bef),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  onPressed: () async {
                    //authController.signOut();

                    try {
                      await _auth.signOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ));
                      ;
                      Get.snackbar(
                        "Logout",
                        "Logout Successfully",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Color(0xff6f8bef),
                        colorText: Colors.white,
                        duration: Duration(seconds: 2),
                      );
                    } catch (e) {
                      Get.snackbar(
                        "Error",
                        "An error occurred during logout.",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Color(0xff6f8bef),
                        colorText: Colors.red,
                        duration: Duration(seconds: 2),
                      );
                    }
                  },
                  child: Text(
                    "Log Out",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
