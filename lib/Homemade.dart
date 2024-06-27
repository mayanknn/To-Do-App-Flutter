import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;
import 'package:to_do_list/Screens/Login.dart';
import 'package:to_do_list/Screens/Widgets/todo_item.dart';
import 'package:to_do_list/todofinal.dart'; // Replace with actual import path

class HomeMade extends StatefulWidget {
  final String username;

  const HomeMade({Key? key, required this.username}) : super(key: key);

  @override
  State<HomeMade> createState() => _HomeMadeState();
}



List<Todofinal> convertToTodofinals(List<dynamic> responseData) {
  return responseData
      .map((item) => Todofinal(
    id: item['id'].toString(), // Assuming id is of type String
    todoText: item['task'], // Assuming task is a String
    isdone: false, // Assuming isdone is a boolean
  ))
      .toList();
}


class _HomeMadeState extends State<HomeMade> {
  final TextEditingController MyTask = TextEditingController();
  List<dynamic> responseData = []; // Changed to List<dynamic>
  List<dynamic> todolists1 = []; // Changed to List<todoLists>
  List<Todofinal> search = [];
  List<Todofinal> search1 = [];



  void sendname(BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('https://todo-node-ugha.onrender.com/tasksubmit'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body:
            jsonEncode({"todoData": MyTask.text, "username": widget.username}),
      );

      if (response.statusCode == 200) {
        // Handle successful response
        responseData = json.decode(response.body); // List<dynamic> from JSON
        search =
            convertToTodofinals(responseData);
        search1 = search;// Convert to List<todoLists>
        print2();
      } else {
        // Handle unsuccessful response
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send data')),
        );
      }
    } catch (e) {
      // Handle any errors during the HTTP request
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
  void showfirst(BuildContext context)async{
      try {
        final response = await http.post(
          Uri.parse('https://todo-node-ugha.onrender.com/showfirst'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body:
          jsonEncode({"username": widget.username}),
        );

        if (response.statusCode == 200) {
          // Handle successful response
          responseData = json.decode(response.body); // List<dynamic> from JSON
          search =
              convertToTodofinals(responseData);
          search1 = search;// Convert to List<todoLists>
          print2();
        } else {
          // Handle unsuccessful response
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to send data')),
          );
        }
      } catch (e) {
        // Handle any errors during the HTTP request
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }

  }

  @override
  void initState() {
    showfirst(context);
    search1 = search;

    super.initState();
  }
  void print2() {
    print(search1); // Print fetched todoLists
    setState(() {}); // Trigger a rebuild after data update
  }

  final todofinal1 = Todofinal.search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
              Text(
                "To do App",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CircleAvatar(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.zero,
                      elevation: 0,
                    ),
                    child: Image.asset(
                      'assets/images/4035892-200.png',
                      fit: BoxFit.cover,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // searchBox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30, bottom: 20),
                          child: Text(
                            "To Do Tasks",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        for (Todofinal tofdo in search)
                          TodoItem(
                            toddo: tofdo,
                            ontodoChnaged: handleTodoChange,
                            deleteitem: deleteitem,
                          )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: 20, right: 20, left: 20),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: MyTask,
                              decoration: InputDecoration(
                                hintText: "Add New To do Item",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20, right: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              print(widget.username);
                              print(search);
                              sendname(
                                  context);
                              MyTask.clear();                            },
                            child: Text(
                              "+",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor: Colors.blueAccent,
                              minimumSize: Size(60, 60),
                              elevation: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  void handleTodoChange(Todofinal todo) {
    setState(() {
      todo.isdone = !todo.isdone;
    });
  }

  void deleteitem(String id) async{
    setState(() {
      search.removeWhere((item) => item.id == id);
      search1.removeWhere((item) => item.id == id);
    });
    try {
      final response = await http.post(
        Uri.parse('https://todo-node-ugha.onrender.com/delete'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },

        body:
        jsonEncode({"todoData": MyTask.text, "username": widget.username,"todoid":id}),

      );
    } catch (e) {
      // Handle any errors during the HTTP request
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }

  }

  // void runfilter(String enterkey) {
  //   List<Todofinal> results = [];
  //   if (enterkey.isEmpty) {
  //     results = search;
  //   } else {
  //     results = search
  //         .where((item) =>
  //             (item.todoText.toLowerCase().contains(enterkey.toLowerCase())))
  //         .toList();
  //   }
  //   setState(() {
  //     search1 = results;
  //   });
  // }

//   Widget searchBox() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 15),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: TextField(
//           onChanged: (value)=>runfilter(value),
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.all(5),
//             prefixIcon: Icon(
//               Icons.search,
//               size: 25,
//             ),
//             prefixIconConstraints: BoxConstraints(
//               minHeight: 20,
//               maxHeight: 25,
//             ),
//             border: InputBorder.none,
//             hintText: 'Search',
//           ),
//         ),
//       ),
//     );
//   }
}


