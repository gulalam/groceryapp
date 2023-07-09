import 'package:flutter/material.dart';
import '../homePage/home_page.dart';
import 'product_card.dart';
import 'product_page.dart';


List<List<dynamic>> dairy = [
  ["Milk", "Fresh Milk", "\$2.0", "Per gallon", "assets/images/dairy/milk.png",  const Color.fromARGB(255, 193, 183, 183)],
  ["Yogurt", "Creamy Yogurt", "\$2.5", "Per cup", "assets/images/dairy/yogurt.png",  const Color.fromARGB(255, 193, 183, 183)],
  ["Cheese", "Assorted Cheese", "\$3.0", "Per pound", "assets/images/dairy/cheese.png", const Color.fromARGB(255, 164, 150, 24)],
  ["Butter", "Smooth Butter", "\$2.0", "Per pound", "assets/images/dairy/butter.png",  const Color.fromARGB(255, 164, 150, 24)],
  ["Ricotta Cheese", "Rich Ricotta Cheese", "\$4.5", "Per pound", "assets/images/dairy/ricottacheese.png",  const Color.fromARGB(255, 193, 183, 183)],
  ["Cottage Cheese", "Creamy Cottage Cheese", "\$3.5", "Per pack", "assets/images/dairy/cottagecheese.png", const Color.fromARGB(255, 193, 183, 183)],
  ["Cream Cheese", "Smooth Cream Cheese", "\$3.5", "Per pack", "assets/images/dairy/creamcheese.png",  const Color.fromARGB(255, 193, 183, 183)],
  ["Sour Cream", "Tangy Sour Cream", "\$2.5", "Per container", "assets/images/dairy/sourcream.png",  const Color.fromARGB(255, 193, 183, 183)],
  ["Ice Cream", "Delicious Ice Cream", "\$5.0", "Per pint", "assets/images/dairy/icecream.png", Colors.blue],
];

List<String> descriptions = [
    "Fresh and nourishing, our milk is a staple for all your daily needs, from cooking to drinking.",
    "Refreshing and probiotic-rich, enjoy it on its own or as a versatile ingredient in smoothies and recipes.",
    "Explore a world of flavors with our wide selection of artisanal and gourmet cheeses.",
    "Creamy and rich, perfect for spreading on toast or baking.",
    "Delicate and light, a versatile ingredient for both sweet and savory dishes.",
    "A healthy and versatile option, great for salads or as a protein-packed snack.",
    "Luxuriously creamy and velvety, our cream cheese adds a touch of indulgence to any recipe.",
    "Smooth and creamy, our sour cream is the ideal companion for all your favorite dishes.",
    "Indulge in a frozen delight with a variety of flavors and smooth, creamy textures."
  ];

class DairyCards extends StatelessWidget{
  const DairyCards({super.key, required this.homePage});

  final HomePage homePage;
  productPage(BuildContext context, int index){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context)=>ProductPage(
        homePage: homePage,
        description: descriptions[index], sku: 'da-$index', index: index, products: dairy,))
    );
  }
  @override
  Widget build(BuildContext context){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: dairy.length~/2,
      itemBuilder: (context, index) {
        int column1 = (index * 2);
        int column2 = (index * 2)+1;
        return Row(       //   1 Row
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){productPage(context, column1);},
              child: ProductCard(
                  product: dairy[column1],
                  sku: 'da-$column1',
                  homePage: homePage,
                  ),
            ),
                
            InkWell(
              onTap: (){productPage(context, column2);},
              child: ProductCard(
                product: dairy[column2],
                sku: 'da-$column2',
                homePage: homePage
              ),
            )
          ],
        );
      },
    );
  }
}
