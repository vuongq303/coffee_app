import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:coffee_app/views/setting/widgets/setting_item.dart';
import 'package:coffee_app/widgets/header_navigation_custom_back.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  void _logOut(BuildContext context, MyColor color) {
    final router = GoRouter.of(context);

    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Are you sure want to logout',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 40,
                        child: Center(
                          child: Text(
                            'No',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: color.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        router.go('/');
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: color.redOrange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    final color = context.read<MyColor>();

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: HeaderNavigationCustomBack(title: 'Setting'),
      ),
      body: Column(
        children: [
          SettingItem(
            content: 'History',
            icon: Icons.history,
            onClick: () {},
          ),
          SettingItem(
            content: 'Persional Details',
            icon: Icons.person,
            onClick: () {
              router.push('/setting/person-detail');
            },
          ),
          SettingItem(
            content: 'Address',
            icon: Icons.location_on,
            onClick: () {},
          ),
          SettingItem(
            content: 'Payment Method',
            icon: Icons.payment,
            onClick: () {},
          ),
          SettingItem(
            content: 'About',
            icon: Icons.error,
            onClick: () {},
          ),
          SettingItem(
            content: 'Help',
            icon: Icons.help_outline,
            onClick: () {},
          ),
          SettingItem(
            content: 'Log out',
            icon: Icons.logout,
            onClick: () => _logOut(context, color),
          ),
        ],
      ),
    );
  }
}
