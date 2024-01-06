import 'package:flutter/material.dart';
import 'package:flutter_task_management_app/components/my_button.dart';
import 'package:flutter_task_management_app/components/my_text_field.dart';
import 'package:flutter_task_management_app/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required void Function() onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
 final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp()async{
    if(passwordController.text !=confirmPasswordController.text){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match!"),),

      );
      return;

     
    }

     final authService= Provider.of<AuthService>(context,listen:false);
     try{
      await authService.signInWithEmailAndPassword(emailController.text, passwordController.text);
     
     }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()),),
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
              "Let create your account for you!",
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
                MyTextField(
              controller:confirmPasswordController,
                hintText: 'Confirm password',
                obscureText: true),
                 const SizedBox(height: 20),

                MyButton(onTap:signUp, text: "Sign Up"),
                const SizedBox(height:50),


                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Already a member?'),
                  SizedBox(width:4),
                  Text('Login now',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),


                )],)
          ]),
        ),
      )),
    );
  }
}

