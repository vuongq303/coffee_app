import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:coffee_app/views/favorite/widgets/data/favorite_data.dart';
import 'package:coffee_app/views/favorite/widgets/item_favorite.dart';
import 'package:coffee_app/widgets/header_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.read<MyColor>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: HeaderNavigation(color: color, title: 'Favorite'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ItemFavorite(
                  item: coffeeListFavorite[index],
                );
              },
              itemCount: coffeeListFavorite.length,
            ),
          ),
        ],
      ),
    );
  }
}
