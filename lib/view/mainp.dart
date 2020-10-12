import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kaewta/view/SignIn.dart';
 
class HomePage extends StatefulWidget {
  final FirebaseUser user;

 
  HomePage(this.user, {Key key}) : super(key: key);
 
  @override
  _HomePageState createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePage> {
   final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  initState() {
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue ,
          title: Text("KAEWTA", style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.exit_to_app),
                color: Colors.white,
                onPressed: () {
                   signOut(context);
                })
          ],
        ),
        body: Container(
          
            child: Center(
                child:
                    Column(mainAxisSize: MainAxisSize.min,children: <Widget>[
          Text(widget.user.email, style: TextStyle(fontSize: 20,color: Colors.white)),
        ]))));
  }
  
  void signOut(BuildContext context) {
    _auth.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        ModalRoute.withName('/'));
  }
}
 
