import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:http/http.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  List<Map<String, dynamic>> allUser = [];

  Future getAllUser() async {
    try {
      var response = await get(Uri.parse("https://reqres.in/api/users?page=1"));
      List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
      data.forEach((element) {
        allUser.add(element);
      });
    } catch (e) {
      print("terjadi kesalahan");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: getAllUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("Loading ...."),
                );
              } else {
                return ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(allUser[index]['avatar']),
                    ),
                    title: Text(
                        "${allUser[index]['first_name']} ${allUser[index]['last_name']}"),
                    subtitle: Text("${allUser[index]['email']}"),
                  ),
                );
              }
            }));
  }
}
