import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  String userId;
  String password;

  LoginWidget({
    super.key,
    required this.userId,
    required this.password,
  });

  final _formkey = GlobalKey<FormState>();

  //editing controller
  final emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //email field
  final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "Email",
        border: InputBorder.none,
      ));

  //passowrd field
  final passwordField = TextFormField(
      autofocus: false,
      // controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
        return null;
      },
      onSaved: (value) {
        // passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        hintText: "password",
        border: InputBorder.none,
      ));

//login Button
  final loginButton = Material(
    elevation: 5,
    borderRadius: BorderRadius.circular(30),
    child: ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue[900])),
      onPressed: () {
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => const MyHomePage()));
      },
      child: const Center(child: Text("Sign in")),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: 400,
              child: Image.asset('assets/images/logo1r.png'),
            ),
            const Text(
              'Login to your account',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              elevation: 8,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: emailField,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 8,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: passwordField,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              child: loginButton,
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(130, 0, 10, 0),
              child: Text(
                "-Or SignIn with-",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 45,
                    width: 70,
                    child: Image.asset('assets/images/google-logo.png'),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    height: 45,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset('assets/images/facebook-logo.png'),
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Container(
                    height: 45,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset('assets/images/twitter-logo.png'),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
