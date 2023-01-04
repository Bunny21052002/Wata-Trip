import 'package:flutter/material.dart';
import 'package:wata_trip/Widgets/joinActivityForm.dart';







class joinActivity extends StatefulWidget {
  int i = 0;
  joinActivity({super.key});

  @override
  State<joinActivity> createState() => joinActivityState(i: i);
}

class joinActivityState extends State<joinActivity> {
  static List name = [];
  static List email = [];
  static List phone = [];
  int i;
  joinActivityState({required this.i});

  static List<form> formlst = [];
  int _item = 1;
  @override
  Widget build(BuildContext context) {
    addList() {
      i = i + 1;
      formlst.add(new form(index: i));
      setState(() {});
    }

    deleteList() {
      formlst.removeLast();
      setState(() {});
    }

    save1() {
      name.clear();
      email.clear();
      phone.clear();
      formlst.forEach((widget) {
        name.add(widget.nameController.text);
        email.add(widget.emailController.text);
        phone.add(widget.phoneController.text);
      });
  //     Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => screen2(name: name, email: email, phone: phone)),
  // );

      print(name);
      print(email);
      print(phone);
    }

    return Scaffold(
    
      body: Center(
        child: Stack(
          children: [
           
            Flexible(
              child: ListView.builder(
                  itemCount: formlst.length,
                  itemBuilder: (BuildContext context, int index) {
                    return formlst[index];
                  }),
            ),
            Positioned(
              bottom: 30,
              left: 15,
              child: i > 0
                  ? TextButton(
                      onPressed: () {
                        deleteList();
                        i = i - 1;
                      },
                      child: Text("Delete"))
                  : Container(),
            ),
            Positioned(
              bottom: 30,
              left: 150,
              child: i > 0
                  ? TextButton(
                      onPressed: () {
                        save1();
                      },
                      child: Text("Save"))
                  : Container(),
            ),
          ],
        ),
      ),
      floatingActionButton: i < 8
          ? FloatingActionButton(
              onPressed: () {
                addList();
              },
              child: Icon(Icons.add),
            )
          : Container(),
    );
  }
}
