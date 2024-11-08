import 'package:coffee_app/viewmodels/favorite_view_model.dart';
import 'package:coffee_app/views/favorite/widgets/item_favorite.dart';
import 'package:coffee_app/widgets/header_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = context.read<FavoriteViewModel>();
    final color = favoriteViewModel.color;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: HeaderNavigation(color: color, title: 'Favorite'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: FutureBuilder(
          future: favoriteViewModel.listFavorite,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final listFavorite = snapshot.data;

              return CustomScrollView(
                slivers: [
                  SliverList.builder(
                    itemBuilder: (context, index) => ItemFavorite(
                      item: listFavorite[index],
                    ),
                    itemCount: listFavorite!.length,
                  ),
                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
