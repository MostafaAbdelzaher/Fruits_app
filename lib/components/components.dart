import 'package:flutter/material.dart';

import '../model/fruits_model.dart';
import '../screens/details_screen.dart';

Padding searchBuilder(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
    child: Row(
      children: [
        Container(
          height: 45,
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10)),
          child: const TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search product",
                prefixIcon: Icon(Icons.search)),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const Icon(
          Icons.filter_list_sharp,
          color: Colors.grey,
          size: 30,
        )
      ],
    ),
  );
}

class GridViewItem extends StatefulWidget {
  final int index;
  final Fruits model;
  const GridViewItem({Key? key, required this.model, required this.index})
      : super(key: key);

  @override
  State<GridViewItem> createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem> {
  bool selectedItem = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(product: widget.model)));
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 75,
                      height: 35,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "25% off",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          selectedItem = !selectedItem;
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: selectedItem == true ? Colors.red : Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: Hero(
                        tag: widget.model.id,
                        child: Image.asset(
                          widget.model.image,
                          height: 100,
                          width: 130,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.model.name,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.model.category,
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 7.0),
                          child: Text.rich(
                            TextSpan(
                                text: "\$${widget.model.price}  ",
                                style: const TextStyle(
                                    color: Colors.green, fontSize: 15),
                                children: [
                                  TextSpan(
                                    text: "\$${widget.model.oldPrice}",
                                    style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.black,
                                        fontSize: 13),
                                  )
                                ]),
                          ),
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
