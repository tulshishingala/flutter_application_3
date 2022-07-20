import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



void main() {
  runApp(const MyApp());
}

String baseUrl = 'https://628dd36fa339dfef87a10005.mockapi.io';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];
  User? user;
  bool _isLoading = false;

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Text(widget.title),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        //inavigate with id
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) =>
                        //             DetailPage(id: users[index].id)));
                      },
                      leading: Image.network('${users[index].url}'),
                      title: Text('${users[index].name}'),
                      subtitle: Text('${users[index].createdAt}'),
                    )));
  }

  void getUsers() async {
    setState(() => _isLoading = true);
    http.Response res = await http.get(Uri.parse('$baseUrl/users/'));

    if (res.statusCode == 200) {
      var decoded = jsonDecode(res.body);
      decoded.forEach((v) {
        setState(() {
          users.add(User(
            id: v['id'],
            name: v['name'],
            url: v['avatar'],
            createdAt: v['createdAt'],
          ));
        });
      });
      setState(() => _isLoading = false);
    }
  }
}

// model
class User {
  final String? id;
  final String? name;
  final String? url;
  final String? createdAt;

  User({this.id, this.name, this.url, this.createdAt});
}