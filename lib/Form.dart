import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Form extends StatefulWidget {
  @override
  _PostMethod createState() => _PostMethod();
}

class _PostMethod extends State<Form> {
  TextEditingController usertypeController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformpasswordController = TextEditingController();

  void postData() async{
    String url = 'your_post_endpoint'; // Replace with your actual POST endpoint

    Map<String, String> headers = {
      'Cookie': 'PHPSESSID=fad2635654a052e9af60caab347f0f14',
    };

    Map<String, String> body = {
      'user_type': usertypeController.text,
      'mobile': mobilenumberController.text,
      'new_password': passwordController.text,
      'confirm_password': conformpasswordController.text,
    };

    http.Response response = await http.post(
      Uri.parse('https://abuysweb.coderzbot.com/api/forgetpassword.php'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      print('POST request successful');
      // Handle the response here if needed
    } else {
      print('POST request failed with status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetTrail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: usertypeController,
                decoration: InputDecoration(
                  labelText: 'User type',
                ),
              ),
              TextFormField(
                controller: mobilenumberController,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                ),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'password',
                ),
              ),
              TextFormField(
                controller: conformpasswordController,
                decoration: InputDecoration(
                  labelText: 'Conform Password',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  postData();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}