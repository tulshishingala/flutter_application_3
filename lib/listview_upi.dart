// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'listview_upi2.dart';
// import 'main.dart';
// import 'modules/list_view_model.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<User> users = [];
//   User? user;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     getUsers();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: _isLoading
//             ? const Center(child: CircularProgressIndicator.adaptive())
//             : ListView.builder(
//                 itemCount: users.length,
//                 itemBuilder: (context, index) => ListTile(
//                       onTap: () {
//                         // inavigate with id
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) =>
//                                     DetailPage(id: users[index].id)));
//                       },
//                       leading: Image.network('${users[index].url}'),
//                       title: Text('${users[index].name}'),
//                       subtitle: Text('${users[index].createdAt}'),
//                     )));
//   }

//   void getUsers() async {
//     setState(() => _isLoading = true);
//     http.Response res = await http.get(Uri.parse('$baseUrl/users/'));

//     if (res.statusCode == 200) {
//       var decoded = jsonDecode(res.body);
//       decoded.forEach((v) {
//         setState(() {
//           users.add(User(
//             id: v['id'],
//             name: v['name'],
//             url: v['avatar'],
//             createdAt: v['createdAt'],
//           ));
//         });
//       });
//       setState(() => _isLoading = false);
//     }
//   }
// }
