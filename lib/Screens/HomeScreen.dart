// import 'package:flutter/cupertino.dart';
// import 'dart:convert'; // Import for jsonEncode
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:whatsapp/Screens/Login.dart';
// import 'package:whatsapp/Screens/Widgets/todo_item.dart';
// import 'package:whatsapp/model/to%20do.dart';
// import 'package:http/http.dart' as http;
//
// class HomeScreen extends StatefulWidget {
//   final String username;
//   HomeScreen(this.username);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final List<ToDo> tlist = ToDo.todoList();
//   final TextEditingController MyTask = TextEditingController();
//
//   void sendname() async {
//     final response = await http.post(
//       Uri.parse('http://10.0.2.2:5000/tasksubmit'), // Use 10.0.2.2 for Android emulator
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       body: jsonEncode({"todoData": MyTask.text}),
//     );
//
//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Data sent successfully')));
//       setState(() {
//         tlist.add(ToDo(
//           id: DateTime.now().toString(),
//           todoText: MyTask.text,
//           isDone: false,
//         ));
//         MyTask.clear();
//       });
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Failed to send data')));
//     }
//   }
//
//   void _handleToDoChange(ToDo todo) {
//     setState(() {
//       todo.isDone = !todo.isDone;
//     });
//   }
//
//   void _deleteToDoItem(ToDo todo) {
//     setState(() {
//       tlist.remove(todo);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade900,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Icon(
//               Icons.menu,
//               color: Colors.white,
//               size: 30,
//             ),
//             Text(
//               "To do App",
//               style: TextStyle(
//                   fontSize: 30,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w700),
//             ),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(20), // Add borderRadius
//               child: CircleAvatar(
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     shape: CircleBorder(), // Circle shape for the button
//                     padding: EdgeInsets.zero, // No padding
//                     elevation: 0, // No shadow
//                   ),
//                   child: Image.asset(
//                     'assets/images/4035892-200.png',
//                     fit: BoxFit.cover, // Fit the image inside the button
//                   ),
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Stack(
//         children: [
//           Container(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Column(
//                 children: [
//                   searchBox(),
//                   Expanded(
//                     child: ListView(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(top: 30, bottom: 20),
//                           child: Text(
//                             "To Do Tasks",
//                             style: TextStyle(
//                                 fontSize: 30, fontWeight: FontWeight.w400),
//                           ),
//                         ),
//                         ...tlist.map((todo) => TodoItem(
//                           key: ValueKey(todo.id),
//                           todo: todo,
//                           onTodoChanged: _handleToDoChange,
//                           onDeleteItem: _deleteToDoItem,
//                         )).toList(),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Row(
//               children: [
//                 Expanded(
//                     child: Container(
//                       margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
//                       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           boxShadow: [BoxShadow(
//                               color: Colors.grey,
//                               offset: Offset(0.0, 0.0),
//                               blurRadius: 10.0,
//                               spreadRadius: 0.0
//                           ),],
//                           borderRadius: BorderRadius.circular(10)
//                       ),
//                       child: TextField(
//                         controller: MyTask,
//                         decoration: InputDecoration(
//                             hintText: "Add New To do Item",
//                             border: InputBorder.none
//                         ),
//                       ),
//                     )
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(
//                       bottom: 20,
//                       right: 20
//                   ),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       sendname();
//                     },
//                     child: Text("+", style: TextStyle(fontSize: 40, color: Colors.white),),
//                     style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                         backgroundColor: Colors.blueAccent,
//                         minimumSize: Size(60, 60),
//                         elevation: 10
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget searchBox() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 15),
//       child: Container(
//         decoration: BoxDecoration(
//             color: Colors.white, borderRadius: BorderRadius.circular(20)),
//         child: TextField(
//           decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(5),
//               prefixIcon: Icon(
//                 Icons.search,
//                 size: 25,
//               ),
//               prefixIconConstraints: BoxConstraints(
//                 minHeight: 20,
//                 maxHeight: 25,
//               ),
//               border: InputBorder.none,
//               hintText: 'Search'),
//         ),
//       ),
//     );
//   }
// }
