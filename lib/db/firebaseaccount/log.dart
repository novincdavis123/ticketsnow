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
          TextField(controller: email),
          TextField(controller: pass),
          ElevatedButton(
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
