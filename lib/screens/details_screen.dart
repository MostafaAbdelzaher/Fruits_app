import 'package:flutter/material.dart';
import 'package:fruits/model/fruits_model.dart';

class DetailsScreen extends StatelessWidget {
  final Fruits product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.green,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class Body extends StatelessWidget {
  final Fruits product;
  const Body({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: product.id,
                    child: Center(
                      child: ImagePoster(
                        image: product.image,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15),
                    child: Text(
                      product.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text.rich(
                      TextSpan(
                          text: "\$${product.price}  ",
                          style: const TextStyle(
                              color: Colors.green, fontSize: 25),
                          children: [
                            TextSpan(
                              text: "\$${product.oldPrice}",
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.black,
                                  fontSize: 20),
                            )
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
            MaterialButton(
              height: 60,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Add to cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 25,
                      ),
                    )
                  ],
                ),
              ),
              color: Colors.green,
            ),
            const SizedBox(
              height: 20 * 2,
            )
          ],
        ),
      ),
    );
  }
}

class ImagePoster extends StatelessWidget {
  final String image;
  const ImagePoster({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(50),
      height: size.width * 0.8,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size.width * 0.8,
            width: size.width * 0.8,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          Image.asset(
            image,
            height: size.width * 0.75,
            width: size.width * 0.75,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
