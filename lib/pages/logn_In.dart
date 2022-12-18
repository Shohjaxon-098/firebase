import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';
import '../services/pref.dart';
import 'homePage.dart';
import 'logn_Up.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({ Key? key }) : super(key: key);

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
   TextEditingController emailController = TextEditingController();
  TextEditingController parolController = TextEditingController();

  bool isLoading=false;

  _signIn() {
    setState(() {
      isLoading = true;
    });
    String? email = emailController.text.trim();
    String? parol = parolController.text.trim();

    if (email.isEmpty || parol.isEmpty) {
      return;
    }

    AuthService.signIn(email, parol).then((user) {
      getUserId(user);
    });
  }

  getUserId(User? user) async {
    setState(() {
      isLoading = false;
    });
    if (user != null) {
      await Pref.saveUserId(user.uid);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
      print(user.uid);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Email yoki parol xato")));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: parolController,
                  decoration: InputDecoration(labelText: "Parol"),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    _signIn();
                  },
                  child: const Text("Sign In"),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Ro'yxatdan o'tmaganmisz?"),
                    const SizedBox(
                      width: 5,
                    ),
                   
                  ],
                ),
              ],
            ),
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container()
        ],
      ),
    );
  }
}