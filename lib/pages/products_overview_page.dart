import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/widgets/product_grid.dart';

import '../models/cart.dart';

enum FilterOptions { Favorites, All }

class ProductOverviewPage extends StatefulWidget {
  const ProductOverviewPage({Key? key}) : super(key: key);

  @override
  State<ProductOverviewPage> createState() => _ProductOverviewPageState();
}

class _ProductOverviewPageState extends State<ProductOverviewPage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Minha Loja'),
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                const PopupMenuItem(
                  value: FilterOptions.Favorites,
                  child: Text('Somente Favoritos'),
                ),
                const PopupMenuItem(
                    value: FilterOptions.All, child: Text('Todos')),
              ],
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showFavoriteOnly = true;
                  } else {
                    _showFavoriteOnly = false;
                  }
                  print(_showFavoriteOnly);
                });
              },
            ),
            Consumer<Cart>(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.CART);
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              builder: (ctx, cart, child) => Badge(
                label: Text(cart.itemsCount().toString()),
                alignment: const AlignmentDirectional(-1.25, 1),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: child,
              ),
            ),
          ],
        ),
        body: ProductGrid(
          showFavoriteOnly: _showFavoriteOnly,
        ));
  }
}
