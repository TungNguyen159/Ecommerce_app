import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  // final Product product;
  // const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('Product Name'),
    );
  }
}
