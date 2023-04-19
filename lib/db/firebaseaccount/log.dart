import 'package:flutter/material.dart';
import 'package:ticketsnow/db/firebaseaccount/FireHelper.dart';
import 'package:ticketsnow/db/firebaseaccount/signup.dart';
import 'package:ticketsnow/db/firebaseaccount/welcome.dart';

class Firelog extends StatefulWidget {
  @override
  State<Firelog> createState() => _FirelogState();
}

class _FirelogState extends State<Firelog> {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y29tcHV0ZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: email,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(width: 1, color: Colors.pink.shade100)),
                  filled: true,
                  fillColor: Colors.grey,
                  hintStyle: TextStyle(color: Colors.pink.shade100),
                  hintText: "email:",
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: pass,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          BorderSide(width: 1, color: Colors.pink.shade100)),
                  filled: true,
                  fillColor: Colors.grey,
                  hintStyle: TextStyle(color: Colors.pink.shade100),
                  hintText: "Password:",
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  String eemail = email.text.trim();
                  String pwd = pass.text.trim();
                  AuthHelper()
                      .signIn(email: eemail, password: pwd)
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Welcome()));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(result)));
                    }
                  });
                  email.text = '';
                  pass.text = '';
                },
                child: Text('Login')),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Log()));
              },
              child: Text('Regnow'))
        ],
      ),
    );
  }
}
