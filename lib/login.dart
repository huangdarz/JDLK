// import 'package:flutter/material.dart';
// import 'auth_service.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   createState() => LoginScreenState();
// }

// class LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(30),
//         decoration: const BoxDecoration(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             const FlutterLogo(
//               size: 150,
//             ),
//             const Text(
//               'Login or to Start',
//               textAlign: TextAlign.center,
//             ),
//             const Text('Skim'),
//             TextFormField(
//               controller: _emailController,
//               decoration: const InputDecoration(labelText: 'Email'),
//               validator: (String? value) {
//                 if (value == null) return null;
//                 if (value.isEmpty) {
//                   return 'Please enter some text';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               controller: _passwordController,
//               decoration: const InputDecoration(labelText: 'Password'),
//               validator: (String? value) {
//                 if (value == null) return null;
//                 if (value.isEmpty) {
//                   return 'Please enter some text';
//                 }
//                 return null;
//               },
//             ),
//             LoginButton(
//                 loginMethod: AuthService(
//                         emailAddress: _emailController.text,
//                         password: _passwordController.text)
//                     .signIn),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LoginButton extends StatelessWidget {
//   final Function loginMethod;

//   const LoginButton({Key? key, required this.loginMethod}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () async {
//         await loginMethod();
//       },
//       child: const Text("Login"),
//     );
//   }
// }
