import 'package:flutter/material.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const TextField(
              decoration: InputDecoration(labelText: "Fullname"),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Email"),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Password"),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(color: Colors.red),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 140),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: const Text("Sign In"))
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
