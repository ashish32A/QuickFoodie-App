import 'package:flutter/material.dart';
import 'package:quickfoodie/pages/cart_page.dart';
import 'package:quickfoodie/pages/details.dart';
import 'package:quickfoodie/widgets/widget_support.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool salad = false, burger = false, pizza = false, icecream = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hello Ashish,", style: AppWidget.boldTextFeildStyle()),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const CartPage();
                        }));
                      },
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              Text("Delicious Food", style: AppWidget.headlineTextFeildStyle()),
              Text("Discover and Get Great Food",
                  style: AppWidget.lightTextFeildStyle()),
              const SizedBox(height: 20.0),
              Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: showItem()),
              const SizedBox(height: 20.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Details();
                        }));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("assets/images/salad2.png",
                                    height: 150, width: 150, fit: BoxFit.cover),
                                const SizedBox(height: 5.0),
                                Text(
                                  "Veggie Taco Hash",
                                  style: AppWidget.semiboldTextFeildStyle(),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  "Fresh and Healthy",
                                  style: AppWidget.lightTextFeildStyle(),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  "\$25",
                                  style: AppWidget.semiboldTextFeildStyle(),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/salad4.png",
                                  height: 150, width: 150, fit: BoxFit.cover),
                              const SizedBox(height: 5.0),
                              Text(
                                "Mix veg Salad",
                                style: AppWidget.semiboldTextFeildStyle(),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                "Spicy with Onion",
                                style: AppWidget.lightTextFeildStyle(),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                "\$28",
                                style: AppWidget.semiboldTextFeildStyle(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/salad3.png",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 20.0),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Maditerranean Chikpea Salad",
                                  style: AppWidget.semiboldTextFeildStyle(),
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Honey goot Cheese",
                                  style: AppWidget.lightTextFeildStyle(),
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "\$28",
                                  style: AppWidget.semiboldTextFeildStyle(),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/salad2.png",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 20.0),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Maditerranean Chikpea Salad",
                                  style: AppWidget.semiboldTextFeildStyle(),
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Honey goot Cheese",
                                  style: AppWidget.lightTextFeildStyle(),
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "\$28",
                                  style: AppWidget.semiboldTextFeildStyle(),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/salad2.png",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 20.0),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Maditerranean Chikpea Salad",
                                  style: AppWidget.semiboldTextFeildStyle(),
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Honey goot Cheese",
                                  style: AppWidget.lightTextFeildStyle(),
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "\$28",
                                  style: AppWidget.semiboldTextFeildStyle(),
                                ),
                              )
                            ],
                          ),
                        )
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
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            icecream = true;
            salad = false;
            burger = false;
            pizza = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: icecream ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                "assets/images/ice-cream.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: icecream ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            salad = false;
            burger = true;
            pizza = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: burger ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                "assets/images/burger.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: burger ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            salad = false;
            burger = false;
            pizza = true;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: pizza ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                "assets/images/pizza.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: pizza ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            salad = true;
            burger = false;
            pizza = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: salad ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                "assets/images/salad.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: salad ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
