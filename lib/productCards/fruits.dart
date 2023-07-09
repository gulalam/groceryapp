import 'package:flutter/material.dart';
import 'package:grocery_app/homePage/home_page.dart';
import 'package:grocery_app/productCards/product_page.dart';
import 'product_card.dart';


List<List<dynamic>> fruits = [
  ["Apple", "Fresh Apples", "\$2.5", "Per kilo", "assets/images/fruits/apple.png", Colors.red],
  ["Orange", "Citrus Oranges", "\$1.0", "Per dozen", "assets/images/fruits/orange.png", Colors.orange],
  ["Mango", "Juicy Mangoes", "\$2.5", "Per piece", "assets/images/fruits/mango.png", Colors.orange],
  ["Banana", "Ripe Bananas", "\$1.0", "Per dozen", "assets/images/fruits/banana.png", const Color.fromARGB(255, 194, 178, 36)],
  ["Strawberry", "Sweet Strawberries", "\$3.2", "Per kilo", "assets/images/fruits/strawberry.png", Colors.red],
  ["Pineapple", "Tropical Pineapples", "\$3.5", "Per piece", "assets/images/fruits/pineapple.png", const Color.fromARGB(255, 194, 178, 36)],
  ["Peach", "Juicy Peaches", "\$2.7", "Per kilo", "assets/images/fruits/peach.png", Colors.orange],
  ["Avocado", "Creamy Avocados", "\$5.0", "Per piece", "assets/images/fruits/avocado.png", Colors.green],
  ["Grapes", "Sweet Grapes", "\$2.0", "Per kilo", "assets/images/fruits/grapes.png", Colors.purple],
  ["Watermelon", "Refreshing Watermelons", "\$6.0", "Per piece", "assets/images/fruits/watermelon.png", Colors.green],
  ["Cherry", "Sweet Cherries", "\$3.0", "Per kilo", "assets/images/fruits/cherry.png", Colors.red],
  ["Blackberry", "Plump Blackberries", "\$2.3", "Per kilo", "assets/images/fruits/blackberry.png", Colors.purple],
  ["Blueberry", "Juicy Blueberries", "\$2.0", "Per kilo", "assets/images/fruits/blueberry.png", Colors.blue],
  ["Melon", "Ripe Melons", "\$2.5", "Per piece", "assets/images/fruits/melon.png", Colors.green],
  ["Lemon", "Juicy Lemons", "\$1.8", "Per dozen", "assets/images/fruits/lemon.png", const Color.fromARGB(255, 194, 178, 36)],
  ["Papaya", "Ripe Papayas", "\$4.5", "Per kilo", "assets/images/fruits/papaya.png", Colors.orange],
  ["Raspberry", "Plump Raspberries", "\$2.0", "Per kilo", "assets/images/fruits/rasberry.png", Colors.pink],
  ["Lime", "Tangy Limes", "\$1.2", "Per dozen", "assets/images/fruits/lime.png", Colors.green],
  ["Fig", "Delicious Figs", "\$2.8", "Per dozen", "assets/images/fruits/fig.png", Colors.purple],
  ["Pear", "Sweet Pears", "\$2.0", "Per kilo", "assets/images/fruits/pear.png", Colors.green],
  ["Kiwi", "Tangy Kiwis", "\$1.5", "Per piece", "assets/images/fruits/kiwi.png", Colors.brown],
  ["Plum", "Sweet Plums", "\$2.2", "Per kilo", "assets/images/fruits/plum.png", Colors.purple],
  ["Coconut", "Tropical Coconuts", "\$3.5", "Per piece", "assets/images/fruits/coconut.png", Colors.brown],
];

  List<String> descriptions = [
    "Crisp and juicy, the apple is a classic fruit with a refreshing taste.",
    "Sweet and citrusy, oranges are packed with Vitamin C and make a perfect snack.",
    "Exotic and tropical, mangoes are known for their vibrant flavor and smooth texture.",
    "Naturally curved and creamy, bananas are a convenient and nutritious choice.",
    "Small and sweet, strawberries are bursting with flavor and are perfect for desserts or snacks.",
    "Tropical and prickly, pineapples offer a juicy and tangy taste.",
    "Soft and fuzzy, peaches are a summer fruit with a delicate and sweet flavor.",
    "Creamy and rich, avocados are a versatile fruit that can be used in both savory and sweet dishes.",
    "Small and bite-sized, grapes come in a variety of colors and offer a burst of sweetness.",
    "Refreshing and hydrating, watermelons are perfect for hot summer days.",
    "Tiny and vibrant, cherries are a sweet and tangy fruit that are perfect for snacking.",
    "Small and packed with flavor, blackberries offer a delightful balance of sweetness and tartness.",
    "Plump and juicy, blueberries are rich in antioxidants and have a sweet, yet tangy flavor.",
    "Juicy and aromatic, melons are a refreshing treat with a hint of sweetness.",
    "Tart and citrusy, lemons are often used for their zesty flavor in both cooking and beverages.",
    "Sweet and tropical, papayas offer a unique taste and are rich in vitamins.",
    "Tangy and vibrant, raspberries are packed with antioxidants and are a versatile fruit.",
    "Zesty and tangy, limes are commonly used in beverages and as a flavor enhancer in various dishes.",
    "Small and delicate, figs have a sweet and chewy texture with a subtle floral flavor.",
    "Juicy and sweet, pears are a versatile fruit that can be enjoyed fresh or used in various recipes.",
    "Tropical and tangy, kiwis are known for their bright green flesh and unique taste.",
    "Sweet and juicy, plums come in a variety of colors and have a deliciously sweet flavor.",
    "Tropical and refreshing, coconuts offer a unique flavor and are packed with nutrients."
  ];

class FruitCards extends StatelessWidget{
  const FruitCards({super.key, required this.homePage});

  final HomePage homePage;
  productPage(BuildContext context, int index){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context)=>ProductPage(
        homePage: homePage,
        description: descriptions[index], sku: 'fu-$index', index: index, products: fruits,))
    );
  }

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: fruits.length~/2,
      itemBuilder: (context, index) {
        int column1 = (index * 2);
        int column2 = (index * 2)+1;
        return Row(       //   1 Row
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){productPage(context, column1);},
              child: ProductCard(
                  product: fruits[column1],
                  sku: 'fu-$column1',
                  homePage: homePage,
                  ),
            ),
                
            InkWell(
              onTap: (){productPage(context, column2);},
              child: ProductCard(
                product: fruits[column2],
                sku: 'fu-$column2',
                homePage: homePage,
              ),
            )
          ],
        );
      },
    );
  }
}
