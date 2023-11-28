import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:latian/app/routes/app_pages.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('6565b811dfd49dde8b1e')
    .setSelfSigned(status: true);

final account = Account(client);
// Register
Future<String> createUser(String name, String Email, String Password) async {
  try {
    final user = await account.create(
        userId: ID.unique(),
        email: Email,
        password: Password,
        name: name);
    return "success";
  } on AppwriteException catch (e) {
    return e.message.toString();
  }
}

// Login
Future loginUser(String email, String password) async {
  try {
    final user =
        await account.createEmailSession(email: email, password: password);
    return true;
  } on AppwriteException catch (e) {
    return false;
  }
}

// Logout
Future logoutUser() async {
  await account.deleteSession(sessionId: 'current');
  Get.offAllNamed(Routes.LOGIN);
}

// Check Session
Future checkSession() async {
  try {
    await account.getSession(sessionId: 'current');
    return true;
  } catch (e) {
    return false;
  }
}
