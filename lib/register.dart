import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _response = 'www';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const FlutterLogo(
              size: 150,
            ),
            const Text(
              'REGISTER',
              textAlign: TextAlign.center,
            ),
            const Text('Skim'),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (String? value) {
                if (value == null) return null;
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (String? value) {
                if (value == null) return null;
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                register(_emailController.text, _passwordController.text);
              },
              child: const Text("Register"),
            ),
            Container(alignment: Alignment.center, child: Text(_response))
          ],
        ),
      ),
    );
  }

  void register(String emailAddress, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      setState(() {
        _response = 'Success!';
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState(() {
          _response = 'Weak password';
        });
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          _response = 'The account already exists for that email.';
        });
      }
    } catch (e) {
      setState(() {
        _response = 'Error';
      });
    }
  }
}

class RegisterButton extends StatelessWidget {
  final Function registerMethod;
  const RegisterButton({Key? key, required this.registerMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await registerMethod();
      },
      child: const Text("Register"),
    );
  }
}
