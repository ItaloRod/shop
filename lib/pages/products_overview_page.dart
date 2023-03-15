import 'package:flutter/material.dart';
import 'package:shop/widgets/product_grid.dart';

class ProductOverviewPage extends StatelessWidget {
  const ProductOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Minha Loja'),
        ),
        body: const ProductGrid());
  }
}
