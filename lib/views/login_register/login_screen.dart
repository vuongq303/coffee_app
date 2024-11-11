import 'package:coffee_app/modules/native_module.dart';
import 'package:coffee_app/viewmodels/login_view_model.dart';
import 'package:coffee_app/views/login_register/widgets/button_login.dart';
import 'package:coffee_app/views/login_register/widgets/header_login.dart';
import 'package:coffee_app/views/login_register/widgets/text_button_login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final module = context.read<NativeModule>();
    module.createNotification();
  }

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginViewModel>();
    final color = loginViewModel.color;
    final maxWidth = MediaQuery.of(context).size.width;
    final router = GoRouter.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: SingleChildScrollView(
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
                          hintText: 'Username',
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
                        onSaved: loginViewModel.onSaveUsernameInputForm,
                        validator: loginViewModel.onVaidatorUsernameInputForm,
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
                        onSaved: loginViewModel.onSavePasswordInputForm,
                        validator: loginViewModel.onVaidatorPasswordInputForm,
                      ),
                      const SizedBox(height: 20),
                      ButtonLogin(
                        maxWidth: maxWidth,
                        onClick: () async {
                          await loginViewModel.onSubmitFormLogin(
                              formKey, router);
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
                    loginViewModel.goToRegister(router);
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
      ),
    );
  }
}
