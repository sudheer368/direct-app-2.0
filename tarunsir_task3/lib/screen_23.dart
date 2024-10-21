import 'package:flutter/material.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  @override
  _CreateNewPasswordScreenState createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();
  String _password = '';
  String _confirmPassword = '';
  String? _errorMessage;

  void _validatePasswords() {
    setState(() {
      if (_formKey.currentState!.validate()) {
        // If all fields are valid, proceed with password reset
        // You can implement your password reset logic here
        _errorMessage = null; // Clear error message
      } else {
        _errorMessage = 'Passwords do not match or are invalid.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Create New Password'),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40), // Spacing
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(Icons.lock, size: 50, color: Colors.blue),
                ),
              ),
              SizedBox(height: 40),
              // Password TextField
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Background color
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                child: TextFormField(
                  obscureText: !_passwordVisible,
                  onChanged: (value) {
                    _password = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password.';
                    } else if (value.length < 8) {
                      return 'Must be at least 8 characters.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent, // Keep the container color
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black54),
                    hintText: 'Must be at least 8 characters',
                    hintStyle: TextStyle(color: Colors.black38),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    border: InputBorder.none, // Remove the default border
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Confirm Password TextField
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Background color
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                child: TextFormField(
                  obscureText: !_confirmPasswordVisible,
                  onChanged: (value) {
                    _confirmPassword = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password.';
                    } else if (value != _password) {
                      return 'Passwords do not match.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent, // Keep the container color
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(color: Colors.black54),
                    hintText: 'Both passwords must match',
                    hintStyle: TextStyle(color: Colors.black38),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _confirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          _confirmPasswordVisible = !_confirmPasswordVisible;
                        });
                      },
                    ),
                    border: InputBorder.none, // Remove the default border
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Error Message
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 20),
              // Reset Password Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _validatePasswords,
                  child: Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: CreateNewPasswordScreen(),
    ));
