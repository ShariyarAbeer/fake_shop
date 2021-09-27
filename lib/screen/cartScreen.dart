import 'package:fake_shop/providers/shoppingCart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
          itemCount: context.watch<ShoppingCart>().cartCount,
          itemBuilder: (context, index) {
            String title =
                context.watch<ShoppingCart>().fullCart[index]['title'];
            int quantity =
                context.watch<ShoppingCart>().fullCart[index]['quantity'];
            String price =
                context.watch<ShoppingCart>().fullCart[index]['price'];
            String category =
                context.watch<ShoppingCart>().fullCart[index]['category'];
            String image =
                context.watch<ShoppingCart>().fullCart[index]['image'];
            // print(context.watch<ShoppingCart>().fullCart[index]["name"]);
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListTile(
                leading: Image.network(image),
                title: Text("$quantity"),
                trailing: IconButton(
                    onPressed: () {
                      context.read<ShoppingCart>().removeItems(index);
                      print(context.watch<ShoppingCart>().fullCart);
                    },
                    icon: Icon(Icons.delete)),
              ),
            );
          }),
    );
  }
}
