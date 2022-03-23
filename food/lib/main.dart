import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// IMAGES
var meatImage = 'https://i.ibb.co/5FRwHtB/unnamed.jpg';
var foodImage = 'https://i.ibb.co/qk6PzDy/London-broil.jpg';

var burgerImage =
    'https://images.unsplash.com/photo-1534790566855-4cb788d389ec?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';
var chickenImage =
    'https://images.unsplash.com/photo-1532550907401-a500c9a57435?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';

// COLORS
var textYellow = const Color(0xFFf6c24d);
var iconYellow = const Color(0xFFf4bf47);

var green = const Color(0xFF4caf6a);
var greenLight = const Color(0xFFd8ebde);

var red = const Color(0xFFf36169);
var redLight = const Color(0xFFf2dcdf);

var blue = const Color(0xFF398bcf);
var blueLight = const Color(0xFFc1dbee);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Apps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'Food Menu & Promo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 4.0,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.shop),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: ListView(
          padding: const EdgeInsets.only(bottom: 10.0),
          children: <Widget>[
            Row(children: <Widget>[
              MyFoodList(url: meatImage, diskon: '10'),
            ]),
            Row(children: <Widget>[
              MyFoodList(url: foodImage, diskon: '15'),
            ]),
            Row(children: <Widget>[
              MyFoodList(url: burgerImage, diskon: '20'),
            ]),
            Row(children: <Widget>[
              MyFoodList(url: chickenImage, diskon: '25'),
            ]),
            const SizedBox(height: 5.0),
            Row(children: const <Widget>[SelectTypeBlock()]),
            const SizedBox(height: 5.0),
            Row(children: const <Widget>[ListMenu()]),
          ]),
    );
  }
}

class ListMenu extends StatelessWidget {
  const ListMenu({Key? key, required}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Popular Dishes",
            style: TextStyle(fontSize: 22.0, color: Colors.black54),
          ),
          const SizedBox(height: 16.0),
          MenuItem(
              rating: "4",
              description:
                  "Chicken, Yogurt, Red chilli, Ginger paste, Carlic paste, ...",
              imageUrl: meatImage),
          MenuItem(
              rating: "5",
              description:
                  "ground beef, egg, onion, bread crumbs, Worcestershire, garlic",
              imageUrl: burgerImage),
          MenuItem(
              rating: "3.5",
              description:
                  "chicken breasts, Eggs, ginger paste, garlic paste, onions, coriander leaves",
              imageUrl: chickenImage),
          MenuItem(
              rating: "3.7",
              description:
                  "beef steaks, porterhouse, rib eye, sirloin, T-bone steaks",
              imageUrl: foodImage),
          MenuItem(
              rating: "4.7",
              description:
                  "chicken, fresh lemongrass, lime leaves, kosher salt",
              imageUrl: meatImage),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem(
      {Key? key,
      required this.rating,
      required this.description,
      required this.imageUrl})
      : super(key: key);
  final String rating;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 100.0,
                width: 100.0,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16.0),
              SizedBox(
                  child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: iconYellow,
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Row(
                          children: <Widget>[
                            const Icon(
                              Icons.star,
                              size: 15.0,
                            ),
                            Text(rating)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                        width: 200.0,
                        child: Text(
                          description,
                          style: const TextStyle(color: Colors.grey),
                        )),
                  ],
                ),
              ))
            ]));
  }
}

class SelectTypeBlock extends StatelessWidget {
  const SelectTypeBlock({Key? key, required}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
          child: Row(
        children: <Widget>[
          Container(
              color: greenLight,
              height: 92.0,
              width: 100.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(
                    FontAwesomeIcons.starHalfAlt,
                    color: Colors.green,
                  ),
                  SizedBox(height: 4.0),
                  Text("Special Menu",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w500))
                ],
              )),
          // const SizedBox(width: 8.0),
          Container(
              color: redLight,
              height: 92.0,
              width: 100.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(
                    FontAwesomeIcons.hourglass,
                    color: Colors.red,
                  ),
                  SizedBox(height: 4.0),
                  Text("Booking",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w500))
                ],
              )),
          // const SizedBox(width: 8.0),
          Container(
              color: blueLight,
              height: 92.0,
              width: 100.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(
                    FontAwesomeIcons.hourglass,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 4.0),
                  Text("Caterings",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w500))
                ],
              )),
        ],
      )),
    );
  }
}

class MyFoodList extends StatelessWidget {
  const MyFoodList({Key? key, required this.url, required this.diskon})
      : super(key: key);
  final String url;
  final String diskon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 6.0, bottom: 4.0),
            child: Container(
                height: 160.0,
                width: 300.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(url), fit: BoxFit.cover)),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 160.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.black.withOpacity(0.1),
                            Colors.black
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Spacer(),
                          Text(
                            diskon + "% OFF",
                            style: const TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                                letterSpacing: 1.1),
                          ),
                          const Text(
                            'ON First Orders',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                letterSpacing: 1.1),
                          ),
                        ],
                      ),
                    )
                  ],
                )))
      ],
    );
  }
}
