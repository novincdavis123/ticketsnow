import 'package:flutter/material.dart';
import 'package:ticketsnow/db/firebaseaccount/FireHelper.dart';
import 'package:ticketsnow/db/firebaseaccount/log.dart';

class Log extends StatefulWidget {
  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1524055988636-436cfa46e59e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGJhY2slMjBncm91bmR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1639628735078-ed2f038a193e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fGNhcnRvb258ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.email, color: Colors.green),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 1, color: Colors.lightBlueAccent)),
                    filled: true,
                    fillColor: Colors.grey,
                    hintStyle: TextStyle(color: Colors.lightBlueAccent),
                    hintText: "Email:",
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  controller: pass,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.password, color: Colors.red),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 1, color: Colors.lightBlueAccent)),
                    filled: true,
                    fillColor: Colors.grey,
                    hintStyle: TextStyle(color: Colors.lightBlueAccent),
                    hintText: "Password:",
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    String mail = email.text.toString();
                    String pwd = pass.text.toString();
                    AuthHelper()
                        .signup(email: mail, password: pwd)
                        .then((result) {
                      if (result == null) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Firelog()));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(result)));
                      }
                    });
                    email.text = '';
                    pass.text = '';
                  },
                  child: Text('Sign up')),
            )
          ],
        ),
      ),
    );
  }
}
