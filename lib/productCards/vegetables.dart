import 'package:flutter/material.dart';
import '../homePage/home_page.dart';
import 'product_card.dart';
import 'product_page.dart';

List<List<dynamic>> vegetables = [
  ["Tomatoes", "Ripe Tomatoes", "\$2.5", "Per pound", "assets/images/vegetables/tomatoes.png", Colors.red],
  ["Onions", "Fresh Onions", "\$1.2", "Per pound", "assets/images/vegetables/onions.png", Colors.purple],
  ["Potatoes", "Farm Potatoes", "\$1.5", "Per pound", "assets/images/vegetables/potatoes.png", Colors.brown],
  ["Sweet Potatoes", "Sweet Potatoes", "\$2.2", "Per pound", "assets/images/vegetables/sweetpotatoes.png", Colors.orange],
  ["Bell Peppers", "Colorful Bell Peppers", "\$1.5", "Per piece", "assets/images/vegetables/bellpeppers.png", Colors.red],
  ["Carrots", "Juicy Carrots", "\$1.2", "Per pound", "assets/images/vegetables/carrots.png", Colors.orange],
  ["Cucumbers", "Crisp Cucumbers", "\$1.2", "Per pound", "assets/images/vegetables/cucumbers.png", Colors.green],
  ["Pumpkin", "Halloween Pumpkin", "\$3.0", "Per piece", "assets/images/vegetables/pumpkin.png", Colors.orange],
  ["Spinach", "Leafy Spinach", "\$2.0", "Per bunch", "assets/images/vegetables/spinach.png", Colors.green],
  ["Turnips", "Crunchy Turnips", "\$1.5", "Per bunch", "assets/images/vegetables/turnips.png", const Color.fromARGB(255, 155, 13, 138)],
  ["Cauliflower", "Crisp Cauliflower", "\$2.5", "Per head", "assets/images/vegetables/cauliflower.png", const Color.fromARGB(255, 17, 228, 17)],
  ["Eggplant", "Purple Eggplant", "\$1.8", "Per pound", "assets/images/vegetables/eggplant.png", Colors.purple],
  ["Broccoli", "Tender Broccoli", "\$2.0", "Per pound", "assets/images/vegetables/broccoli.png", Colors.green],
  ["Acorn Squash", "Sweet Acorn Squash", "\$2.0", "Per pound", "assets/images/vegetables/acornsquash.png", Colors.orange],
  ["Radishes", "Crisp Radishes", "\$1.8", "Per bunch", "assets/images/vegetables/radishes.png", Colors.red],
  ["Green Beans", "Fresh Green Beans", "\$1.5", "Per pound", "assets/images/vegetables/greenbeans.png", Colors.green],
  ["Butternut Squash", "Butternut Squash", "\$2.5", "Per pound", "assets/images/vegetables/butternutsquash.png", Colors.orange],
  ["Peas", "Sweet Peas", "\$2.5", "Per pound", "assets/images/vegetables/peas.png", Colors.green],
  ["Cabbage", "Fresh Cabbage", "\$1.5", "Per pound", "assets/images/vegetables/cabbage.png", Colors.green],
  ["Corn", "Sweet Corn", "\$0.8", "Per ear", "assets/images/vegetables/corn.png", Colors.yellow],
  ["Kale", "Nutritious Kale", "\$2.2", "Per bunch", "assets/images/vegetables/kale.png", Colors.green],
  ["Artichokes", "Tender Artichokes", "\$3.0", "Per piece", "assets/images/vegetables/artichokes.png", Colors.green],
  ["Lettuce", "Fresh Lettuce", "\$1.5", "Per head", "assets/images/vegetables/lettuce.png", Colors.green],
  ["Asparagus", "Tender Asparagus", "\$3.5", "Per pound", "assets/images/vegetables/asparagus.png", Colors.green],
  ["Mushrooms", "Fresh Mushrooms", "\$2.5", "Per pound", "assets/images/vegetables/mushrooms.png", Colors.brown],
  ["Beets", "Colorful Beets", "\$2.0", "Per bunch", "assets/images/vegetables/beets.png", Colors.red],
  ["Celery", "Crunchy Celery", "\$1.8", "Per bunch", "assets/images/vegetables/celery.png", Colors.green],
  ["Okra", "Fresh Okra", "\$2.5", "Per pound", "assets/images/vegetables/okra.png", Colors.green],
  ["Zucchini", "Fresh Zucchini", "\$1.5", "Per pound", "assets/images/vegetables/zucchini.png", Colors.green],
  ["Brussels Sprouts", "Tasty Brussels Sprouts", "\$2.5", "Per pound", "assets/images/vegetables/brusselssprouts.png", Colors.green],
];

  List<String> descriptions = [
    "Juicy and versatile, tomatoes are a staple ingredient in many cuisines, perfect for salads, sauces, and more.",
    "Pungent and flavorful, onions are used as a base for many dishes, adding depth of flavor.",
    "Starchy and versatile, potatoes can be prepared in various ways, from mashed potatoes to crispy fries.",
    "Naturally sweet and nutritious, sweet potatoes are a delicious alternative to regular potatoes, perfect for fries, casseroles, and pies.",
    "Colorful and crunchy, bell peppers add a refreshing taste to salads, stir-fries, and stuffed dishes.",
    "Crunchy and vibrant, carrots are packed with nutrients and can be enjoyed raw or cooked in various dishes.",
    "Cool and hydrating, cucumbers are refreshing in salads, sandwiches, or as a healthy snack.",
    "Sweet and versatile, pumpkin can be used in both sweet and savory dishes, like soups, pies, and desserts.",
    "Nutrient-rich and versatile, spinach can be enjoyed fresh or cooked, adding a boost of vitamins to your meals.",
    "Root vegetables with a slightly sweet flavor, turnips can be roasted, mashed, or added to stews and soups.",
    "Versatile and nutritious, cauliflower can be used as a low-carb alternative to rice, mashed potatoes, or as a pizza crust.",
    "Distinctive and versatile, eggplant can be baked, grilled, or fried, offering a rich and meaty texture.",
    "Nutrient-packed and vibrant, broccoli is a cruciferous vegetable that can be steamed, roasted, or stir-fried.",
    "Sweet and nutty, acorn squash is often roasted and stuffed, making a hearty and delicious meal.",
    "Peppery and crisp, radishes add a refreshing crunch to salads, tacos, and vegetable platters.",
    "Crunchy and flavorful, green beans are a versatile vegetable that can be steamed, sautéed, or added to stir-fries.",
    "Sweet and creamy, butternut squash is perfect for roasting, soups, or as a healthy side dish.",
    "Small and sweet, peas are a popular vegetable used in a variety of dishes, from stir-fries to pasta salads.",
    "Crunchy and robust, cabbage can be used in salads, slaws, stir-fries, or fermented into sauerkraut.",
    "Sweet and versatile, corn can be enjoyed on the cob, in salads, soups, or as a side dish.",
    "Nutrient-dense and hearty, kale is a leafy green that can be enjoyed raw in salads or sautéed as a side dish.",
    "Tender and flavorful, artichokes are a unique vegetable with edible leaves and a delicious heart.",
    "Crisp and refreshing, lettuce is the perfect base for salads, wraps, and sandwiches.",
    "Tender and flavorful, asparagus is a versatile vegetable that can be roasted, grilled, or sautéed.",
    "Earthy and savory, mushrooms add depth of flavor to various dishes, from stir-fries to pasta sauces.",
    "Sweet and earthy, beets can be roasted, pickled, or enjoyed raw in salads.",
    "Crunchy and aromatic, celery is often used in soups, stews, or as a healthy snack with dips.",
    "Tender and slightly slimy, okra is commonly used in stews, curries, and as a thickening agent.",
    "Versatile and mild, zucchini can be sautéed, grilled, or used in baking, like zucchini bread.",
    "Small and compact, Brussels sprouts offer a unique flavor when roasted, sautéed, or used in salads."
  ];


class VegetableCards extends StatelessWidget{
  const VegetableCards({super.key, required this.homePage});

  final HomePage homePage;
  productPage(BuildContext context, int index){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context)=>ProductPage(
        homePage: homePage,
        description: descriptions[index], sku: 've-$index', index: index, products: vegetables,))
    );
  }

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: vegetables.length~/2,
      itemBuilder: (context, index) {
        int column1 = (index * 2);
        int column2 = (index * 2)+1;
        return Row(       //   1 Row
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){productPage(context, column1);},
              child: ProductCard(
                  product: vegetables[column1],
                  sku: 've-$column1', 
                  homePage: homePage,
                  ),
            ),
                
            InkWell(
              onTap: (){productPage(context, column2);},
              child: ProductCard(
                product: vegetables[column2],
                sku: 've-$column2',
                homePage: homePage,
              ),
            )
          ],
        );
      },
    );
  }
}


