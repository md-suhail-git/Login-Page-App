import 'package:flutter/material.dart';
import 'package:flutter_task_management_app/components/my_button.dart';
import 'package:flutter_task_management_app/components/my_text_field.dart';
import 'package:flutter_task_management_app/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key,required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
     void signIn () async{
      final authService = Provider.of<AuthService>(context,listen:false);
      try {
        await authService.signInWithEmailandPassword(emailController.text, 
        passwordController.text,);
      }catch(e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(
            e.toString(),
          ),)
        );
      }
     }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Icon(Icons.message, size: 105),
            const Text(
              "Welcome back you have been missed!",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false),
            const SizedBox(height: 20),
            MyTextField(
                controller: passwordController,
                hintText: 'password',
                obscureText: true),

                const SizedBox(height:25),
                MyButton(onTap:signIn, text: "Sign in"),
                const SizedBox(height:50),


               Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children:  [const
    Text('Already a member?'),
    const SizedBox(width: 4),
    GestureDetector(
      onTap: widget.onTap,
      child:const Text(
        'Login now',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
)

          ]),
        ),
      )),
    );
  }
}
