import 'package:flutter/material.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        fontFamily: 'Lato',
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: ProductOverviewPage(),
      routes: {
        AppRoutes.PRODUCT_DETAIL: (context) => const ProductDetailPage()
      },
    );
  }
}
