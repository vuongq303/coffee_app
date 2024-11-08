import 'package:coffee_app/viewmodels/detail_view_model.dart';
import 'package:coffee_app/viewmodels/favorite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavHeaderDetail extends StatelessWidget {
  const NavHeaderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final detailViewModel = context.read<DetailViewModel>();
    final itemSelected = detailViewModel.coffeeModel;
    final favoriteViewModel = context.read<FavoriteViewModel>();
    final color = favoriteViewModel.color;
    detailViewModel.checkIsFavorite(idCoffee: itemSelected.id!);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                color.black.withAlpha(200),
                color.black,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          height: 30,
          width: 30,
          padding: const EdgeInsets.only(left: 2),
          child: IconButton(
            onPressed: () {
              favoriteViewModel.backToHomeScreen(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: color.gray,
              size: 14,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: color.gray, width: 0.5),
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                color.black.withAlpha(200),
                color.black,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          height: 30,
          width: 30,
          child: ValueListenableBuilder(
            valueListenable: detailViewModel.isFavorite,
            builder: (context, value, child) {
              return IconButton(
                onPressed: () async {
                  final isFavorite =
                      await favoriteViewModel.changeCoffeeFavorite(
                    idCofee: itemSelected.id!,
                  );
                  detailViewModel.changeIsFavorite(isFavorite);
                },
                icon: Icon(
                  Icons.favorite,
                  color: value ? Colors.white : color.redOrange,
                  size: 14,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
