import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch, // Makes the button take full width
            children: [
              _header(context),
              SizedBox(height: 20),
              _codeInputField(context),
              SizedBox(height: 20),
              _passwordInputField(context),
              SizedBox(height: 20),
              _confirmPasswordInputField(context),
              SizedBox(height: 20),
              _resetPasswordButton(context),
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
          "Reset Password",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text("Enter the code sent to your email and set a new password"),
      ],
    );
  }

  // Code Input Field
  _codeInputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _codeController,
          decoration: InputDecoration(
              hintText: "Enter code",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.lock)),
        ),
      ],
    );
  }

  // New Password Input Field
  _passwordInputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
              hintText: "New Password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.lock)),
        ),
      ],
    );
  }

  // Confirm Password Input Field
  _confirmPasswordInputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(
              hintText: "Confirm Password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.lock)),
        ),
      ],
    );
  }

  // Reset Password Button
  _resetPasswordButton(context) {
    return SizedBox(
      width: double.infinity, // Makes the button take full width
      child: ElevatedButton(
        onPressed: () {
          // Validate the input fields
          String code = _codeController.text;
          String password = _passwordController.text;
          String confirmPassword = _confirmPasswordController.text;

          if (code.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Please fill in all fields')),
            );
            return;
          }

          if (password != confirmPassword) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Passwords do not match')),
            );
            return;
          }

          // Logic to reset password with the entered code and new password
          // Example: send the code and new password to the backend

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password has been reset successfully')),
          );

          // Optionally, navigate back to the login screen
          // Navigator.pushNamed(context, '/login');
        },
        child: Text(
          "Reset Password",
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
