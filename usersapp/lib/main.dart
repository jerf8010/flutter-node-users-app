import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:async';
import 'dart:convert';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Map data;
  late List usersData;

  getUsers() async {
    http.Response response = await http.get(Uri.parse('http://10.0.2.2:8080/api/users'));
    data = json.decode(response.body);
    setState(() {
      usersData = data[ 'users'];
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'User List'),
        backgroundColor: Colors.indigo[900],
      ),
      body: ListView.builder(
        itemCount: usersData.length,
        itemBuilder: ( BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text("$index", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),)
                  ),
                  CircleAvatar(backgroundImage: NetworkImage(usersData[index]['avatar']),),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("${usersData[index]["firstName"]}  ${usersData[index]["lastName"]}",
                    style: TextStyle(
                      fontSize:  20.0,
                      fontWeight: FontWeight.w700
                    )),
                  )
                ],
              ),
            ),
          );
        },
      )
    );
  }
}