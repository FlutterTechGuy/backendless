import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers.dart';
import 'package:flutter_application_1/model_views/auth_viewmodel.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Login Page',
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
                controller: emailCtrl,
                validator: (e) {
                  if (e!.isEmpty) {
                    return "Field Required";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: passwordCtrl,
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
              const SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () {
                        AuthHelper.forgotPass(context,
                            email: emailCtrl.text.trim());
                      },
                      child: const Text("Forgot Password?"))),
              const SizedBox(height: 10.0),
              Consumer<AuthViewModel>(
                builder: (context, value, child) => ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String email = emailCtrl.text;
                      String password = passwordCtrl.text;
                      AuthHelper.loginUser(context,
                          email: email, password: password);
                    }
                  },
                  child: value.isLoading
                      ? const Text("Loading..")
                      : const Text('Login'),
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, registerScreen);
                  },
                  child: const Text("New User?"))
            ],
          ),
        ),
      ),
    );
  }
}
