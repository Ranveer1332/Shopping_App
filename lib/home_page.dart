import 'package:flutter/material.dart';
import 'package:shoppingapp/global_variable.dart';
import 'package:shoppingapp/product_card.dart';
import 'package:shoppingapp/product_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = ['All', 'Adidas', 'Nike', 'Bata'];
  late String selectedFilter;

  @override
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(165, 162, 162, 1.0)),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50),
        topLeft: Radius.circular(50),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Shoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });

                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromRGBO(245, 247, 249, 1),
                        side: BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        label: Text(filter),
                        labelStyle: TextStyle(fontSize: 14),
                        padding: EdgeInsets.symmetric(
                          horizontal: 19,
                          vertical: 13,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                     return GestureDetector(
                       onTap: (){
                         Navigator.of(context).push(
                           MaterialPageRoute(
                               builder: (context){
                             return  ProductDetailsPage(product: product);
                         },
                         ),
                         );
                       },
                       child: ProductCard(
                         title :product['title'] as String,
                         price: product['price'] as double,
                         image: product['imageUrl'] as String,
                         backgroundColor: index.isEven? Color.fromRGBO(216,240,253,1): Color.fromRGBO(245,247,249,1,),
                       ),
                     );


                  }, ),
            )
          ],
        ),
      ),
    );
  }
}
