import 'package:fake_shop/api/api_manager.dart';
import 'package:fake_shop/model/jeweleryModel.dart';
import 'package:fake_shop/providers/shoppingCart.dart';
import 'package:fake_shop/screen/cartScreen.dart';
import 'package:fake_shop/widgets/singleitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Jewelery extends StatelessWidget {
  final title;
  const Jewelery({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<JeweleryModel>?> _jeweleryCall = APIManager().getJewelery();
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight + 45) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "$title".toUpperCase(),
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contex) => CartScreen(),
                          ),
                        );
                      },
                      icon: Icon(Icons.shopping_cart_outlined),
                      color: Colors.black,
                    ),
                    Positioned(
                      right: 7.0,
                      top: 7.0,
                      child: Container(
                        height: 18.0,
                        width: 18.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.0),
                            color: Colors.black),
                        child: Center(
                            child: Text(
                          "${context.watch<ShoppingCart>().cartCount}",
                          style: TextStyle(fontSize: 10.0),
                        )),
                      ),
                    ),
                  ],
                ))
          ],
        ),
        body: FutureBuilder<List<JeweleryModel>?>(
            future: _jeweleryCall,
            builder: (context, snapshort) {
              if (snapshort.hasData) {
                return GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: (itemWidth / itemHeight),
                  children: List.generate(snapshort.data!.length, (index) {
                    var title = snapshort.data![index].title;
                    var price = snapshort.data![index].price.toString();
                    var category = snapshort.data![index].category;
                    var image = snapshort.data![index].image;
                    return Singleitem(
                      title: title,
                      price: price,
                      category: category,
                      image: image,
                    );
                  }),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
