import 'package:flutter/material.dart';
import 'reset_password.dart'; // Import the ResetPasswordScreen

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _header(context),
              SizedBox(height: 20), // Space between header and input field
              _emailInputField(context),
              SizedBox(height: 20), // Space between input field and send button
              _sendResetLinkButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // Header Section
  _header(context) {
    return Column(
      children: [
        Text(
          "Forgot Password",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text("Enter your email to reset your password"),
      ],
    );
  }

  // Email Input Field
  _emailInputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.email)),
        ),
      ],
    );
  }

  // Send Reset Link Button with increased width
  _sendResetLinkButton(context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          String email = _emailController.text;
          if (email.isNotEmpty) {
            // Logic to send password reset email
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Password reset link sent to $email')),
            );

            // Navigate to the ResetPasswordScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Please enter your email')),
            );
          }
        },
        child: Text(
          "Send Reset Link",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
