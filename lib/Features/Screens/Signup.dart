import 'package:ecommerce_project/Features/Controllers/registerController.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLogin = false;
  // String name = '';
  // String email = '';
  // String password = '';
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50.0,
              ),
              TextFormField(
                // onChanged: (value) => name = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "name is required";
                  } else {
                    return null;
                  }
                },
                controller: _nameController,
                decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "email is required";
                  } else {
                    return null;
                  }
                },
                controller: _emailController,
                decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "password is required";
                  } else {
                    return null;
                  }
                },
                controller: _passwordController,
                decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "confirm password is required";
                  } else {
                    return null;
                  }
                },
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    RegisterController.register(
                        email: _emailController.text,
                        password: _passwordController.text,
                        confirmPassword: _confirmPasswordController.text,
                        username: _nameController.text);
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  padding: const EdgeInsets.all(15.0),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
                  onPressed: () => Get.toNamed('/signin'),
                  child:
                      const Text("Sign In", style: TextStyle(fontSize: 16.0)))
            ],
          ),
        ),
      )),
    );
  }
}
