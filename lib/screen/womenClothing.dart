import 'package:fake_shop/api/api_manager.dart';
import 'package:fake_shop/model/womenModel.dart';
import 'package:fake_shop/widgets/singleitem.dart';
import 'package:flutter/material.dart';

class WomenClothing extends StatelessWidget {
  final title;
  const WomenClothing({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<WomenModel>?> _womenCall = APIManager().getWomenClothing();
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
        ),
        body: FutureBuilder<List<WomenModel>?>(
            future: _womenCall,
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
