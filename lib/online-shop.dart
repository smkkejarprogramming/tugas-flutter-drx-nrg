import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeShop extends StatelessWidget {
  const HomeShop({super.key});
  @override
  Widget build(BuildContext context) {
    List<ProductCard> products = [
      ProductCard(title: "Men T-Shirt", price: "\$27", image: "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//90/MTA-1813239/nazoela-clothing_nazoela-clothing-polos-kaos-pria---black-solid_full04.jpg"),
      ProductCard(title: "Men Glasses", price: "\$10", image: "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//90/MTA-1813239/nazoela-clothing_nazoela-clothing-polos-kaos-pria---black-solid_full04.jpg"),
      ProductCard(title: "Men and Women", price: "\$9999", image: "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//90/MTA-1813239/nazoela-clothing_nazoela-clothing-polos-kaos-pria---black-solid_full04.jpg"),
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(
              children: [Icon(Icons.list, color: Colors.black)],
            )),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                    width: double.infinity,
                    height: 40.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3))
                        ]),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
                      child: Row(children: [
                        Icon(Icons.search,
                            color: Colors.grey.shade500, size: 25.0),
                        Expanded(
                            child: TextFormField(
                          decoration: InputDecoration(
                              label: Text("Search Products"),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ))
                      ]),
                    ))),
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "New Arrival",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Row(
                              children: [
                                Text("See More",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.orange,
                                  size: 20.0,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20.0),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(3, (index) => ProductCard(title: products[index].title, price: products[index].price, image: products[index].image)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Best Seller",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Row(
                          children: [
                            Text("See More",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.orange,
                              size: 20.0,
                            )
                          ],
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(3, (index) => ProductCard(title: products[index].title, price: products[index].price, image: products[index].image)),
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}

class ProductCard extends StatefulWidget {
  final String title;
  final String price;
  final String image;

  const ProductCard(
      {Key? key, required this.title, required this.price, required this.image})
      : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      margin: EdgeInsets.fromLTRB(0, 16.0, 16.0, 16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      widget.image),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.price,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600)),
                      Icon(Icons.favorite, color: Colors.grey.shade600)
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(widget.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal))
                ],
              ))
        ],
      ),
    );
  }
}