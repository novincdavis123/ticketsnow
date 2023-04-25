import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Account extends StatefulWidget {
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('failedtopickimage:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            image != null
                ? Image.file(
                    image!,
                    width: 160,
                    height: 160,
                  )
                : FlutterLogo(
                    size: 160,
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => pickImage(),
                  child: Text('Pick Image From Gallery')),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 224, 219, 219),
                          borderRadius: BorderRadius.circular(30)),
                      child: ListTile(
                          leading: Icon(Icons.privacy_tip),
                          title: Text('Privacy'),
                          trailing: Icon(Icons.arrow_forward_ios))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 224, 219, 219),
                          borderRadius: BorderRadius.circular(30)),
                      child: ListTile(
                          leading: Icon(Icons.history),
                          title: Text('Purchase History'),
                          trailing: Icon(Icons.arrow_forward_ios))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 224, 219, 219),
                          borderRadius: BorderRadius.circular(30)),
                      child: ListTile(
                          leading: Icon(Icons.help_outline),
                          title: Text('Help & Support'),
                          trailing: Icon(Icons.arrow_forward_ios))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 224, 219, 219),
                          borderRadius: BorderRadius.circular(30)),
                      child: ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Settings'),
                          trailing: Icon(Icons.arrow_forward_ios))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 224, 219, 219),
                          borderRadius: BorderRadius.circular(30)),
                      child: ListTile(
                          leading: Icon(Icons.person_add),
                          title: Text('Invite a friend'),
                          trailing: Icon(Icons.arrow_forward_ios))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 224, 219, 219),
                          borderRadius: BorderRadius.circular(30)),
                      child: ListTile(
                          leading: Icon(Icons.info),
                          title: Text('Information'),
                          trailing: Icon(Icons.arrow_forward_ios))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 224, 219, 219),
                          borderRadius: BorderRadius.circular(30)),
                      child: ListTile(
                          leading: Icon(Icons.book),
                          title: Text('About'),
                          trailing: Icon(Icons.arrow_forward_ios))),
                ),
              ],
            ),
          ]))
        ],
      ),
    );
  }
}
