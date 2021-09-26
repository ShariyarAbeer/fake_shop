import 'package:fake_shop/api/api_manager.dart';
import 'package:fake_shop/screen/electronics.dart';
import 'package:fake_shop/screen/jewelery.dart';
import 'package:fake_shop/screen/menClothing.dart';
import 'package:fake_shop/screen/womenClothing.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>?>? _categoriesCall = APIManager().getCategories();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: Text(
            "Fake Shop",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: FutureBuilder<List<dynamic>?>(
          future: _categoriesCall,
          builder: (context, snapshort) {
            if (snapshort.hasData) {
              return ListView.builder(
                  itemCount: snapshort.data!.length,
                  itemBuilder: (context, index) {
                    String categories = snapshort.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        title: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contex) => index == 0
                                      ? Electronics(title: categories)
                                      : index == 1
                                          ? Jewelery(title: categories)
                                          : index == 2
                                              ? MenClothing(title: categories)
                                              : WomenClothing(
                                                  title: categories)),
                            );
                          },
                          child: Container(
                              height: 100.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.purple[300],
                              ),
                              child: Center(
                                  child: Text(
                                categories.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ))),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
