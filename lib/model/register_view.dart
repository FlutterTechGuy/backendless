// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers.dart';
import 'package:flutter_application_1/model_views/auth_viewmodel.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class Registerview extends StatefulWidget {
  @override
  _RegisterviewState createState() => _RegisterviewState();
}

class _RegisterviewState extends State<Registerview> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Register',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Field Required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Field Required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: 'Password', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 40.0),
              Consumer<AuthViewModel>(
                builder: (context, value, child) => ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String email = _emailController.text;
                      String password = _passwordController.text;
                      AuthHelper.registerUser(context,
                          email: email, password: password);
                    }
                  },
                  child: Text(value.isLoading ? 'Loading..' : 'Register'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, loginScreen);
                  },
                  child: const Text('Already a user ? '))
            ],
          ),
        ),
      ),
    );
  }
}
