import 'package:coffee_app/viewmodels/register_view_model.dart';
import 'package:coffee_app/views/login_register/widgets/button_login.dart';
import 'package:coffee_app/views/login_register/widgets/header_login.dart';
import 'package:coffee_app/views/login_register/widgets/text_button_login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerViewModel = context.read<RegisterViewModel>();
    final maxWidth = MediaQuery.of(context).size.width;
    final router = GoRouter.of(context);
    final color = registerViewModel.color;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: SingleChildScrollView(
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
                        onSaved: registerViewModel.onSaveUsernameInputForm,
                        validator:
                            registerViewModel.onVaidatorUsernameInputForm,
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
                        onSaved: registerViewModel.onSavePasswordInputForm,
                        validator:
                            registerViewModel.onVaidatorPasswordInputForm,
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
                        onSaved: registerViewModel.onSaveRePasswordInputForm,
                        validator:
                            registerViewModel.onVaidatorRePasswordInputForm,
                      ),
                      const SizedBox(height: 20),
                      ButtonLogin(
                        maxWidth: maxWidth,
                        onClick: () async {
                          await registerViewModel.onSubmitFormRegister(formKey);
                        },
                        title: 'Register',
                        textColor: Colors.white,
                        bgColor: color.redOrange,
                      ),
                      const SizedBox(height: 10),
                      TextButtonLogin(
                        onClick: () {
                          registerViewModel.goToSignIn(router);
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
      ),
    );
  }
}
