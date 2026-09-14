import'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String,Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        'Details',
        ),
      ),
      body: Column(
        children: [
          Text(product['title'] as String,style:Theme.of(context).textTheme.titleLarge,),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(product['imageUrl'] as String),
          ),
          Spacer(flex: 2,),
        ],
      ),


    );
  }
}

