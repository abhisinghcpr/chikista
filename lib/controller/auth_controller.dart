import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:chikista/view/screens/auth/login_screen.dart';
import 'package:chikista/view/screens/bottom_navigation/bottom_navigation_screen.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  var isLoading = false.obs;

  // Email and Password signup method
  Future<void> signupWithEmail(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "All fields are required",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Color(0xff6f8bef),
        colorText: Colors.red,
        duration: Duration(seconds: 2),
      );
      return;
    }

    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      isLoading.value = false;

      Get.snackbar(
        "Success",
        "Account created successfully",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Color(0xff6f8bef),
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );

      Get.offAll(() => BottomNavScreen());
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        e.message ?? "Something went wrong",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Color(0xff6f8bef),
        colorText: Colors.red,
        duration: const Duration(seconds: 1),
      );
    }
  }

  // Email & Password login method
  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Fields cannot be empty",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Color(0xff6f8bef),
        colorText: Colors.red,
        duration: const Duration(seconds: 1),
      );
      return;
    }

    isLoading.value = true;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.offAll(() => BottomNavScreen());
      Get.snackbar(
        "Success",
        "Logged In successfully",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Color(0xff6f8bef),
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        e.message ?? "An error occurred",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Color(0xff6f8bef),
        colorText: Colors.red,
        duration: const Duration(seconds: 1),
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> signInWithGoogle() async {
  //   try {
  //     isLoading.value = true;
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //
  //     if (googleUser == null) {
  //       isLoading.value = false;
  //       return;
  //     }
  //
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;
  //
  //     final OAuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //
  //     UserCredential userCredential =
  //         await _auth.signInWithCredential(credential);
  //     isLoading.value = false;
  //
  //     if (userCredential.user != null) {
  //       Get.offAll(() => BottomNavScreen());
  //       Get.snackbar(
  //         "Success",
  //         "Google Sign-In successful",
  //         snackPosition: SnackPosition.TOP,
  //         backgroundColor: Color(0xff6f8bef),
  //         colorText: Colors.white,
  //         duration: Duration(seconds: 2),
  //       );
  //     }
  //   } catch (e) {
  //     isLoading.value = false;
  //     print(e.toString());
  //     Get.snackbar(
  //       "Error",
  //       "Google Sign-In failed: ${e.toString()}",
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: Color(0xff6f8bef),
  //       colorText: Colors.red,
  //       duration: const Duration(seconds: 2),
  //     );
  //   }
  // }

  Future<void> signOut() async {
    try {
      bool isSignedIn = await _googleSignIn.isSignedIn();

      if (isSignedIn) {
        await _googleSignIn.signOut();
      }

      await _auth.signOut();
      Get.snackbar(
        "Success",
        "Logged out successfully",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Color(0xff6f8bef),
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );

      Get.offAll(() => SignInScreen());
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
  }
}
