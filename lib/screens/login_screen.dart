import 'package:dashboard/widgets/loading.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:dashboard/screens/home_screen.dart';
// import 'package:dashboard/screens/show_data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/material/scaffold.dart';
import 'package:firebase_core/firebase_core.dart';

// abstract class LoginWidget extends StatelessWidget {
//   String email;
//   String password;

//   LoginWidget({super.key, required this.email, required this.password});
// }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //formkey
  // final _formkey = GlobalKey<FormState>();

  bool loading = false;
  bool isobsecure = true;

//editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final eController = TextEditingController();

  //firebase
  // final _auth = FirebaseAuth.instance;

  String? errorMessage;

  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
//email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
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
        obscureText: isobsecure,
        autofocus: false,
        controller: passwordController,
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isobsecure = !isobsecure;
              });
            },
            icon: isobsecure
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
          ),
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
          final email = emailController.text.toString();
          final password = passwordController.text.toString();
          RegExp regex = RegExp(r'^.{6,}$');

          //email validation
          if (email!.isEmpty) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blueGrey[800]),
              child: Text("Please enter your email"),
            )));
            print("Please enter your email");
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(email)) {
            print("Please Enter a valid email");
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blueGrey[800]),
              child: Text("Please enter a valid email"),
            )));
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          }

          //password validation
          else if (password!.isEmpty) {
            print("Password is required for login");
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blueGrey[800]),
              child: Text("Password is required for login"),
            )));
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          } else if (!regex.hasMatch(password)) {
            print("Enter Valid Password(Min. 6 Character)");
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blueGrey[800]),
              child: Text("Enter Valid Password(Min. 6 Character)"),
            )));
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          }

          signIn();
        },
        child: const Center(child: Text("Sign in")),
      ),
    );

    return loading
        ? Loading()
        : Scaffold(
            body: SafeArea(
              child: Padding(
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
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: emailField,
                            ),
                            Visibility(
                              child: Text("data"),
                              visible: false,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        elevation: 8,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: passwordField,
                            ),
                            Visibility(
                              child: Text("data"),
                              visible: false,
                            )
                          ],
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
                              child:
                                  Image.asset('assets/images/google-logo.png'),
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
                                child: Image.asset(
                                    'assets/images/facebook-logo.png'),
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
                              child:
                                  Image.asset('assets/images/twitter-logo.png'),
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  void signIn() {
    String email = emailController.text.toString();
    String password = passwordController.text.toString();

    print(email);
    print(password);

    //todo Start loading screen
    setState(() => loading = true);

    FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        loading = false;
        print('Document data: ${documentSnapshot.data()}');
        print(documentSnapshot.get('password'));
        print(password == documentSnapshot.get('password'));
        if (password == documentSnapshot.get('password')) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage()));
        } else {
          //loading = false;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.blueGrey[800]),
            child: Text("Incorrect password"),
          )));
        }
      } else {
        print('Email does not exist');
        loading = false;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.blueGrey[800]),
          child: Text("Email does not exist"),
        )));
      }
    });
  }
}
