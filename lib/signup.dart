import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Add controllers to capture input from the text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputFields(context),
              _loginInfo(context),
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Text(
          "Create Account",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Enter details to get started"),
      ],
    );
  }

  _inputFields(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Username",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _emailController,  // Capture email input
          decoration: InputDecoration(
            hintText: "Email id",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.email_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _passwordController,  // Capture password input
          decoration: InputDecoration(
            hintText: "Password",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.password_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
          obscureText: true,
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: "Retype Password",
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.password_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
          obscureText: true,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            // Perform sign up using Firebase Authentication
            try {
              // ignore: unused_local_variable
              final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                email: _emailController.text.trim(),
                password: _passwordController.text.trim(),
              );

              // If sign up is successful, navigate to the phone verification page
              Navigator.pushNamed(context, '/phone');
            } catch (e) {
              print("Sign up failed: $e");
              // Show an error message to the user
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Failed to sign up: $e")),
              );
            }
          },
          child: Text(
            "Sign Up",
            style: TextStyle(fontSize: 20, color: Colors.white), // White text
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Blue button color
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        )
      ],
    );
  }

  _loginInfo(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?"),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
          child: Text(
            "Login",
            style: TextStyle(color: Colors.blue), // White text
          ),
          style: ElevatedButton.styleFrom(),
        ),
      ],
    );
  }
}
