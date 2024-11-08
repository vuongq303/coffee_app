import 'package:coffee_app/viewmodels/home_view_model.dart';
import 'package:coffee_app/views/home/widgets/item_coffee.dart';
import 'package:coffee_app/views/home/widgets/select_type_home.dart';
import 'package:coffee_app/widgets/header_navigation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Logger logger = Logger();

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();
    final color = homeViewModel.myColor;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: HeaderNavigation(color: color, title: ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Find the best\ncoffee for you',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  _space(15),
                  TextField(
                    style: TextStyle(
                      color: color.gray,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 20,
                      ),
                      hintText: 'Find Your Coffee...',
                      hintStyle: TextStyle(
                        color: color.gray,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: color.gray.withOpacity(0.2)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: color.gray.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _space(10),
            const SelectTypeHome(),
            _space(10),
            SizedBox(
              height: 240,
              child: FutureBuilder(
                future: homeViewModel.getAllCoffeeSameType('coffee'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final listCoffee = snapshot.data;

                    return ListView.builder(
                      padding: const EdgeInsets.only(left: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: listCoffee!.length,
                      itemBuilder: (context, index) {
                        final item = listCoffee[index];
                        return ItemCoffee(itemCoffee: item, color: color);
                      },
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            _space(10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Coffee beans',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            _space(10),
            SizedBox(
              height: 240,
              child: FutureBuilder(
                future: homeViewModel.getAllCoffeeSameType('bean'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final listCoffee = snapshot.data;

                    return ListView.builder(
                      padding: const EdgeInsets.only(left: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: listCoffee!.length,
                      itemBuilder: (context, index) {
                        final item = listCoffee[index];
                        return ItemCoffee(itemCoffee: item, color: color);
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _space(double space) => SizedBox(height: space);
}
