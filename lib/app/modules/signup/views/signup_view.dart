import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latian/app/controllers/auth_controller.dart';
import 'package:latian/app/routes/app_pages.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final emailControl = TextEditingController();
  final passControl = TextEditingController();
  final authControl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUpView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
            child: Column(
          children: [
            TextField(
              controller: emailControl,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: passControl,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () =>
                  authControl.signup(emailControl.text, passControl.text),
              child: Text("Register"),
            ),
            Row(
              children: [
                Text("Don't have any Account?"),
                TextButton(
                    onPressed: () => Get.toNamed(Routes.SIGNUP),
                    child: Text("Login"))
              ],
            )
          ],
        )),
      ),
    );
  }
}
