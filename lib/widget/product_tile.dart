import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_shop/model/furniture.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({Key? key}) : super(key: key);

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  List<Furniture> furnitures = [];

  @override
  void initState() {
    super.initState();
    // _loadJsonRestaurant();
    _loadJsonFurniture();
  }

  Future<void> _loadJsonFurniture() async {
    String jsonString = await rootBundle.loadString('assets/furniture.json');
    final jsonData = jsonDecode(jsonString);
    List<dynamic> furnitureData = jsonData['furnitures'];

    List<Furniture> loadedFurnitures = [];
    for (var furnitureJson in furnitureData) {
      Furniture restaurant = Furniture.fromJson(furnitureJson);
      loadedFurnitures.add(restaurant);
    }
    setState(() {
      furnitures = loadedFurnitures;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final crossAxisCount = (screenWidth / 200).floor();
    return GridView.builder(
      itemCount: furnitures.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        Furniture furniture = furnitures[index];

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 8,
                offset: const Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: GridTile(
              child: Column(
                children: [
                  SizedBox(
                    child: Image.network(
                      furniture.pictureId,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // width: constraints.maxWidth,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment:
                          //     MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              furniture.name,
                              style: const TextStyle(
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Text('\$${furniture.price}'),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
