import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latian/app/controllers/auth_appwrite.dart';
import 'package:latian/app/controllers/auth_controller.dart';
import 'package:latian/app/routes/app_pages.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final TextEditingController nameControl = TextEditingController();
  final TextEditingController emailControl = TextEditingController();
  final TextEditingController passControl = TextEditingController();
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
              controller: nameControl,
              decoration: InputDecoration(labelText: "Name"),
            ),
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
              onPressed: () async {
                try {
                  await createUser(
                          nameControl.text, emailControl.text, passControl.text)
                      .then((value) {
                    if (value == 'success') {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Register Success")));
                      // Get.offAllNamed(Routes.LOGIN);
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(value)));
                    }
                  });
                  await authControl.signup(emailControl.text, passControl.text);
                } catch (error) {
                  print("Error during registration: $error");
                }
              },
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
