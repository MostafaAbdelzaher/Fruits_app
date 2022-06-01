class Fruits {
  final String image;
  final String name;
  final String category;
  final num price;
  final num oldPrice;
  final int id;

  Fruits(
    this.image,
    this.name,
    this.category,
    this.price,
    this.oldPrice,
    this.id,
  );
}

Map<String, List<Fruits>> listsModel = {
  "Milk": [
    Fruits("assets/images/milke-2.webp", "Milk", "Cattier Italiano", 2.5, 3, 0),
    Fruits("assets/images/milk.webp", "Milk", "Cattier Italiano", 2.5, 3, 1),
  ],
  "Fruits": [
    Fruits("assets/images/apple.png", "Apple", "Cattier Italiano", 2.5, 3, 2),
    Fruits("assets/images/banana.png", "Banana", "Cattier Italiano", 3, 4, 3),
    Fruits("assets/images/mango.png", "Mango", "Bergamo Italy", 1.8, 2, 4),
    Fruits("assets/images/watermelon.png", "WaterMelon", "Cattier Italiano", 3,
        4.5, 5),
    Fruits("assets/images/orange.png", "Apple", "Cattier Italiano", 2.5, 3, 5),
  ],
  "Vegetables": [
    Fruits("assets/images/vera.jpg", "Aloe vera", "Cattier Italiano", 5, 8, 7),
    Fruits("assets/images/red-pepper.webp", "Red bell Pepper",
        "Cattier Italiano", 5, 8, 8),
    Fruits("assets/images/lemon.jpg", "Lemon", "Cattier Italiano", 5, 8, 9),
    Fruits("assets/images/gRLIC.jpg", "Garlic", "Cattier Italiano", 3.5, 5, 10),
    Fruits(
        "assets/images/raddish.jpg", "Raddish", "Cattier Italiano", 2.5, 7, 11),
    Fruits("assets/images/cucumber.jpg", "Cucumber", "Cattier Italiano", 2.5, 5,
        12),
    Fruits("assets/images/mint-leaves.jpg", "Mint Leaves", "Cattier Italiano",
        5, 8, 13),
    Fruits(
        "assets/images/brinjal.jpg", "Brinjal", "Cattier Italiano", 4.5, 5, 14),
    Fruits("assets/images/beans.jpg", "Beans", "Cattier Italiano", 2, 5, 15),
    Fruits("assets/images/baby-corn-1.png", "Baby corn", "Cattier Italiano",
        2.5, 4.5, 16),
    Fruits("assets/images/beetroot.webp", "Beetroot", "Cattier Italiano", 2.3,
        5, 17),
    Fruits("assets/images/brocolli.jpg", "Brocolli", "Cattier Italiano", 2.5, 3,
        18),
    Fruits(
        "assets/images/carrots.jpg", "Carrot", "Cattier Italiano", 4.5, 5, 19),
    Fruits("assets/images/cauliflower_commodity-page.png", "Cauliflower",
        "Cattier Italiano", 2.5, 3, 20),
    Fruits(
        "assets/images/cabbage.jpg", "Cabbage", "Cattier Italiano", 3.5, 6, 21),
    Fruits("assets/images/Tomatoes.jpg", "Tomatoes", "Cattier Italiano", 2.5, 3,
        22),
  ],
  "Bakery": [
    Fruits("assets/images/480671Image1.jpg", "Bakery", "Cattier Italiano", 1.5,
        5, 33),
  ],
};
