// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api
import 'package:http/http.dart' as http;
import 'package:flutter_inventory/screens/login.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                final response = await http.post(
                  Uri.parse("http://127.0.0.1:8000/auth/register/"),
                  body: {
                    'username': username,
                    'password': password,
                  });

                  if (response.statusCode == 200) {
                    // Handle successful registration
                    // You can parse the response body if needed
                    String message = "Registration successful!";
                    String uname = username;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(content: Text("$message Welcome, $uname.")),
                      );
                  } else {
                    // Handle registration failure
                    String errorMessage = jsonDecode(response.body)['message'];
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Registration Failed'),
                        content: Text(errorMessage),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}