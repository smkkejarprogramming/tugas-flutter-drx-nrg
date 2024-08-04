import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Home Page",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Products",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(0, 0, 0, 1)),
                    ),
                    Icon(Icons.shopping_cart,
                        color: const Color.fromRGBO(0, 0, 0, 1))
                  ],
                )),
            body: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 206, 206, 206)
                            .withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.search, color: Colors.grey),
                            Expanded(
                                child: Center(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    label: Text(
                                      "Search Products",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey),
                                    )),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                            2,
                            (index) => ProductCard(
                                title: "title",
                                desciption: "desciption",
                                rating: "rating",
                                image: "image")))
                  ],
                ),
              ),
            )));
  }
}

class ProductCard extends StatefulWidget {
  final String title;
  final String desciption;
  final String rating;
  final String image;

  const ProductCard({
    Key? key,
    required this.title,
    required this.desciption,
    required this.rating,
    required this.image,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 200,
        child: Column(children: [
          Container(
            width: 150,
            height: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: const DecorationImage(
                    image: NetworkImage(
                        "https://flowbite.com/docs/images/blog/image-1.jpg"),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(height: 10.0),
          Container(
            width: 150,
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Office Set",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 110,
                      child: Text("Comfortable and artistic",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 10.0,
                            fontWeight: FontWeight.normal,
                          )),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15.0,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text("4.0",
                        style: GoogleFonts.poppins(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ))
                  ],
                )
              ],
            ),
          )
        ]));
  }
}
