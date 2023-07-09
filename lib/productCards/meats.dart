import 'package:flutter/material.dart';
import '../homePage/home_page.dart';
import 'product_card.dart';
import 'product_page.dart';

List<List<dynamic>> meats = [
  ["Beef", "Premium Beef", "\$8.0", "Per pound", "assets/images/meat/beef.png", Colors.brown],
  ["Turkey Meat", "Lean Turkey Meat", "\$7.5", "Per pound", "assets/images/meat/turkeymeat.png", Colors.brown],
  ["Chicken", "Fresh Chicken", "\$5.0", "Per pound", "assets/images/meat/chicken.png", const Color.fromARGB(255, 144, 134, 43)],
  ["Lamb", "Tender Lamb", "\$9.0", "Per pound", "assets/images/meat/lamb.png", Colors.brown],
  ["Delimeats", "Delicious Deli Meats", "\$6.5", "Per pound", "assets/images/meat/delimeats.png", Colors.red],
  ["Seafoods", "Assorted Fish and Seafoods", "\$10.0", "Per pound", "assets/images/meat/fishandseafoods.png", Colors.blue],
  ["Pork", "Tasty Pork", "\$6.0", "Per pound", "assets/images/meat/pork.png", Colors.pink],
  ["Veal", "Juicy Veal", "\$8.5", "Per pound", "assets/images/meat/veal.png", Colors.brown],
];

  List<String> descriptions = [
    "Tender and flavorful, beef is a versatile meat used in various dishes like steaks, roasts, and burgers.",
    "Lean and protein-rich, turkey meat is a healthy alternative to traditional meats, perfect for sandwiches or as a main course.",
    "Juicy and versatile, chicken is a popular meat choice that can be cooked in a variety of ways, from grilling to roasting.",
    "Rich and savory, lamb meat offers a distinct flavor that pairs well with spices and herbs, perfect for stews or roasts.",
    "Sliced and cured, deli meats come in a variety of options like ham, turkey, or roast beef, perfect for sandwiches and charcuterie boards.",
    "Fresh and flavorful, seafood offers a range of options like fish, shrimp, and scallops, perfect for a nutritious and delicious meal.",
    "Versatile and succulent, pork is a meat choice that can be used in various cuisines, from pork chops to pulled pork sandwiches.",
    "Tender and delicate, veal meat has a subtle flavor and can be cooked in a variety of ways, such as cutlets or stews."
  ];

class MeatCards extends StatelessWidget{
  const MeatCards({super.key, required this.homePage});

  final HomePage homePage;
    productPage(BuildContext context, int index){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context)=>ProductPage(
        homePage: homePage,
        description: descriptions[index], sku: 'me-$index', index: index, products: meats,))
    );
  }

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: meats.length~/2,
      itemBuilder: (context, index) {
        int column1 = (index * 2);
        int column2 = (index * 2)+1;
        return Row(       //   1 Row
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){productPage(context, column1);},
              child: ProductCard(
                  product: meats[column1],
                  sku: 'me-$column1',
                  homePage: homePage,
                  ),
            ),
                
            InkWell(
              onTap: (){productPage(context, column2);},
              child: ProductCard(
                product: meats[column2],
                sku: 'me-$column2',
                homePage: homePage
              ),
            )
          ],
        );
      },
    );
  }
}
