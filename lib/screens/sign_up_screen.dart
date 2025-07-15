// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:myapp/controllers/sign_up_controller.dart';

class Sign_Up_Screen extends StatefulWidget {
  const Sign_Up_Screen({super.key});

  @override
  State<Sign_Up_Screen> createState() => _Sign_Up_ScreenState();
}

class _Sign_Up_ScreenState extends State<Sign_Up_Screen> {
  final GlobalKey<FormState> userForm = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController country = TextEditingController();

  bool isLoading = false;

  void handleSignUp() async {
    if (userForm.currentState!.validate()) {
      setState(() => isLoading = true);

      try {
        await Sign_up_controller.createaccount(
          context: context,
          email: email.text,
          password: password.text,
          name: name.text,
          country: country.text,
        );
      } finally {
        if (mounted) {
          setState(() => isLoading = false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: userForm,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/ic_launcher.png"),
                      const SizedBox(height: 20),

                      /// Email
                      TextFormField(
                        controller: email,
                        validator: (value) =>
                            value == null || value.isEmpty ? "Email cannot be empty" : null,
                        decoration: const InputDecoration(labelText: "Email"),
                      ),
                      const SizedBox(height: 20),

                      /// Password
                      TextFormField(
                        controller: password,
                        validator: (value) =>
                            value == null || value.isEmpty ? "Please enter your password" : null,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(labelText: "Password"),
                      ),
                      const SizedBox(height: 20),

                      /// Name
                      TextFormField(
                        controller: name,
                        validator: (value) =>
                            value == null || value.isEmpty ? "Name cannot be empty" : null,
                        decoration: const InputDecoration(labelText: "Name"),
                      ),
                      const SizedBox(height: 20),

                      /// Country
                      TextFormField(
                        controller: country,
                        validator: (value) =>
                            value == null || value.isEmpty ? "Country cannot be empty" : null,
                        decoration: const InputDecoration(labelText: "Country"),
                      ),
                      const SizedBox(height: 30),

                      /// Button
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: isLoading ? null : handleSignUp,
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 50),
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: isLoading
                                  ? const SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Text(
                                      "Create an Account",
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
