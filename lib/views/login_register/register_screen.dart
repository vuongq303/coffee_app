import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:coffee_app/views/login_register/widgets/button_login.dart';
import 'package:coffee_app/views/login_register/widgets/header_login.dart';
import 'package:coffee_app/views/login_register/widgets/text_button_login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
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
              const HeaderLogin(content: 'Register to Continue'),
              const SizedBox(height: 15),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Name',
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
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
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
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Re-Password',
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
                      onClick: () {},
                      title: 'Register',
                      textColor: Colors.white,
                      bgColor: color.redOrange,
                    ),
                    const SizedBox(height: 10),
                    TextButtonLogin(
                      onClick: () {
                        router.pop();
                      },
                      title: 'You have account? Click ',
                      action: 'Sign in',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
