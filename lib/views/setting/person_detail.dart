import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:coffee_app/widgets/header_navigation_custom_back.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonDetail extends StatelessWidget {
  const PersonDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.read<MyColor>();

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: HeaderNavigationCustomBack(title: 'Person Detail'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://lol-skin.weblog.vc/img/wallpaper/tiles/Zed_0.jpg',
                    height: 125,
                    width: 125,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Form(
                child: Column(
                  children: [
                    _TextInputForm(
                      hint: 'Fullname',
                      onSaved: (data) {},
                      validator: (data) {
                        return null;
                      },
                      color: color,
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(height: 10),
                    _TextInputForm(
                      hint: 'Email',
                      onSaved: (data) {},
                      validator: (data) {
                        return null;
                      },
                      color: color,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10),
                    _TextInputForm(
                      hint: 'Password',
                      onSaved: (data) {},
                      validator: (data) {
                        return null;
                      },
                      color: color,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 10),
                    _TextInputForm(
                      hint: 'Re-Password',
                      onSaved: (data) {},
                      validator: (data) {
                        return null;
                      },
                      color: color,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      child: Container(
                        height: 57,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: color.redOrange,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextInputForm extends StatelessWidget {
  final String hint;
  final MyColor color;
  final TextInputType textInputType;
  final Function(String? data) onSaved;
  final String? Function(String? data) validator;

  const _TextInputForm(
      {required this.hint,
      required this.onSaved,
      required this.validator,
      required this.color,
      required this.textInputType});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: color.gray,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: color.gray, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color.gray),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
