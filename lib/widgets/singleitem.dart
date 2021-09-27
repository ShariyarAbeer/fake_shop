import 'package:fake_shop/providers/shoppingCart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Singleitem extends StatefulWidget {
  final title, price, category, image;
  const Singleitem(
      {Key? key, this.title, this.price, this.category, this.image})
      : super(key: key);

  @override
  _SingleitemState createState() => _SingleitemState();
}

class _SingleitemState extends State<Singleitem> {
  bool clicked = true;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0)),
                image: DecorationImage(
                    image: NetworkImage(widget.image), fit: BoxFit.fill)),
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(widget.title.substring(0, 18)),
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(widget.price),
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(widget.category),
          ),
          SizedBox(
            height: 15.0,
          ),
          clicked
              ? InkWell(
                  onTap: () {
                    context.read<ShoppingCart>().addItems({
                      "title": widget.title,
                      "price": widget.price,
                      "category": widget.category,
                      "image": widget.image,
                      "quantity": 1
                    });
                    setState(() {
                      if (clicked) {
                        clicked = false;
                      } else {
                        clicked = true;
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15.0),
                    height: 50.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.red[200]),
                    child: Center(
                      child: Text(
                        "Add",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<ShoppingCart>().updateItems({
                            "title": widget.title,
                            "price": widget.price,
                            "category": widget.category,
                            "image": widget.image,
                            "quantity": 1
                          });
                        },
                        icon: Icon(Icons.add_circle_outline_rounded),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(context.read<ShoppingCart>().quantityRead({
                                "title": widget.title,
                                "price": widget.price,
                                "category": widget.category,
                                "image": widget.image,
                                "quantity": 1
                              }) ==
                              Null
                          ? "0"
                          : context.read<ShoppingCart>().quantityRead({
                              "title": widget.title,
                              "price": widget.price,
                              "category": widget.category,
                              "image": widget.image,
                              "quantity": 1
                            })),
                      SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<ShoppingCart>().discriminantItems({
                            "title": widget.title,
                            "price": widget.price,
                            "category": widget.category,
                            "image": widget.image,
                            "quantity": 1
                          });
                        },
                        icon: Icon(Icons.remove_circle_outline_outlined),
                      )
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
