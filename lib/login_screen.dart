import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './services/auth_service.dart';

final authService = AuthService();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  void register() async {
    final email = controllerEmail.text.trim();
    final password = controllerPassword.text.trim();

    if (email.isEmpty || password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Enter a valid email and a password of at least 6 characters',
          ),
        ),
      );
      return;
    }

    try {
      await authService.createAccount(email: email, password: password);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Registration successful')));
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print('CODE: ${e.code}');
      print('MESSAGE: ${e.message}');
      print('FULL: $e');
    } catch (e) {
      print('NON-FIREBASE ERROR: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email"),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: controllerEmail,
                    decoration: InputDecoration(

                      border: OutlineInputBorder(),
                    ),
                    onEditingComplete: () {
                      setState(() {});
                    },
                  ),

                  Text("Password"),
                  TextField(
                    controller: controllerPassword,
                    decoration: InputDecoration(

                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
           Column(children: [   SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () {
                    register();
                  },
                  child: Text("Create an account"),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () {
                    //register();
                  },
                  child: Text("Next"),
                ),
              ),],)
            ],
          ),
        ),
      ),
    );
  }
}
