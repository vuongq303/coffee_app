import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:coffee_app/views/login_register/widgets/button_login.dart';
import 'package:coffee_app/views/login_register/widgets/header_login.dart';
import 'package:coffee_app/views/login_register/widgets/text_button_login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final color = context.read<MyColor>();
    final maxWidth = MediaQuery.of(context).size.width;
    final router = GoRouter.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HeaderLogin(content: 'Login to continue'),
              const SizedBox(height: 15),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email adress',
                        hintStyle: TextStyle(
                          color: color.gray,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: color.gray,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: color.gray,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: color.gray,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ButtonLogin(
                      maxWidth: maxWidth,
                      onClick: () {
                        router.pushReplacement('/home');
                      },
                      title: 'Sign In',
                      textColor: Colors.white,
                      bgColor: color.redOrange,
                    ),
                    const SizedBox(height: 15),
                    ButtonLogin(
                      maxWidth: maxWidth,
                      onClick: () {},
                      textColor: Colors.black,
                      title: 'Sign in with Google',
                      bgColor: color.gray.withOpacity(0.1),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextButtonLogin(
                onClick: () {
                  router.go('/register');
                },
                title: "Don't have account? Click ",
                action: 'Register',
              ),
              const SizedBox(height: 10),
              TextButtonLogin(
                onClick: () {},
                title: "Forget password? Click ",
                action: 'Reset',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
