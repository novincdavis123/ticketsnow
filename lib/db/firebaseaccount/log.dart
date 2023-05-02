import 'package:flutter/material.dart';
import 'package:ticketsnow/db/firebaseaccount/FireHelper.dart';
import 'package:ticketsnow/db/firebaseaccount/signup.dart';
import 'package:ticketsnow/screens/Homescreen.dart';

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
                            'https://images.unsplash.com/photo-1613750651512-d65ce96dff55?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Njd8fGNhcnRvb258ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'))),
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
                        borderSide:
                            BorderSide(width: 1, color: Colors.pink.shade100)),
                    filled: true,
                    fillColor: Colors.grey,
                    hintStyle: TextStyle(color: Colors.pink.shade100),
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
                            MaterialPageRoute(builder: (context) => Home()));
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Log()));
                  },
                  child: Text('Regnow')),
            )
          ],
        ),
      ),
    );
  }
}
