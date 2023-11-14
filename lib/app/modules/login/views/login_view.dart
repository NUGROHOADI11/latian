import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latian/app/controllers/auth_controller.dart';
import 'package:latian/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  final emailControl = TextEditingController();
  final passControl = TextEditingController();
  final authControl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
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
                  authControl.login(emailControl.text, passControl.text),
              child: Text("Login"),
            ),
            Row(
              children: [
                Text("Don't have any Account?"),
                TextButton(
                    onPressed: () => Get.toNamed(Routes.SIGNUP),
                    child: Text("Sign Up"))
              ],
            )
          ],
        )),
      ),
    );
  }
}
