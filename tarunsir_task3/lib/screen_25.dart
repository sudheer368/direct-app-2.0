import 'package:flutter/material.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Flag and Language Switcher
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          // children: [
                          //   Image.asset('assets/india_flag.png', width: 30),
                          //   SizedBox(width: 8),
                          //   DropdownButton<String>(
                          //     value: 'India',
                          //     items: [
                          //       DropdownMenuItem<String>(
                          //         value: 'India',
                          //         child: Text('India'),
                          //       ),
                          //     ],
                          //     onChanged: (value) {},
                          //   ),
                          // ],
                          ),
                      Row(
                        children: [
                          Text('EN'),
                          IconButton(
                            icon: Icon(Icons.language),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  // Logo
                  Image.asset('assets/logo_direct.png', height: 60),

                  SizedBox(height: 40),

                  // Username Field
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      suffixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Password Field with visibility toggle
                  PasswordField(),

                  SizedBox(height: 10),

                  // OTP instead of password checkbox
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text('Signin using OTP instead of password'),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Signin Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: Text('Signin', style: TextStyle(fontSize: 18)),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Forgot Username/Password
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot Username / Password ?',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        border: OutlineInputBorder(),
      ),
    );
  }
}
