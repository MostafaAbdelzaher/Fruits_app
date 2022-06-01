import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/model/fruits_model.dart';

import '../components/components.dart';

class FruitsScreen extends StatefulWidget {
  const FruitsScreen({Key? key}) : super(key: key);

  @override
  State<FruitsScreen> createState() => _FruitsScreenState();
}

class _FruitsScreenState extends State<FruitsScreen> {
  int selectedItem = 1;
  String nameList = "Vegetables";

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon":
            "assets/icons/bakery-baking-bread-food-restaurant-svgrepo-com.svg",
        "text": "Bakery"
      },
      {"icon": "assets/icons/grapes.svg", "text": "Vegetables"},
      {"icon": "assets/icons/vegetables-svgrepo-com.svg", "text": "Fruits"},
      {"icon": "assets/icons/milk-svgrepo-com.svg", "text": "Milk"},
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: const Icon(
            Icons.menu_rounded,
            color: Colors.grey,
            size: 30,
          ),
          title: const Text(
            "EDEKA",
            style: TextStyle(
                color: Colors.blue,
                fontFamily: "Muli",
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.all(5),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey.withOpacity(0.1)),
              child: SvgPicture.asset(
                "assets/icons/share-svgrepo-com.svg",
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey.withOpacity(0.1)),
              child: const Center(
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    searchBuilder(context),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...List.generate(
                                categories.length,
                                (index) => categoryCard(
                                    index: index,
                                    icon: categories[index]["icon"],
                                    text: categories[index]["text"],
                                    press: () {}))
                          ]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: GridView.count(
                          padding: const EdgeInsets.only(bottom: 140),
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 3,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          childAspectRatio: 1 / 1.54,
                          crossAxisCount: 2,
                          children: List.generate(
                              listsModel[nameList]!.length,
                              (index) => GridViewItem(
                                    model: listsModel[nameList]![index],
                                    index: index,
                                  ))),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.01,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 55,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                      "Total",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.grey, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "3x \$49,5 ",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 15),
                    ),
                    const Spacer(),
                    MaterialButton(
                      height: 50,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      color: Colors.blue,
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Text(
                            "Cart",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                            size: 25,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget categoryCard({
    required String icon,
    text,
    required GestureTapCallback press,
    required int index,
  }) =>
      GestureDetector(
        onTap: () {
          setState(() {
            nameList = text;
            selectedItem = index;
          });
        },
        child: SizedBox(
          width: 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.4)),
                  color: selectedItem == index ? Colors.green : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  icon,
                  color: selectedItem == index ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                text,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      );
}
