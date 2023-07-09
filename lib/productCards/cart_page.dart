import 'package:flutter/material.dart';
import 'package:grocery_app/productCards/buy_now.dart';
import 'package:grocery_app/productCards/product_page.dart';
import '../homePage/home_page.dart';

List<List<dynamic>> cartProducts = [];

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final TextStyle mainTextStyle = const TextStyle(
      fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);

  String totalPrice() {
    double sum = 0;
    for (int i = 0; i < cartProducts.length; i++) {
      String tempStr = cartProducts[i][2].toString();
      tempStr = tempStr.substring(1);
      sum += double.parse(tempStr);
    }
    return '\$$sum';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 221, 221),
      appBar: AppBar(
        title: const Text('Cart Page'),
        titleTextStyle: mainTextStyle,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 221, 221, 221),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (homePage != null) {
              homePage!.setState(() {});
            }
            if (productPage != null) {
              productPage!.setState(() {});
            }
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          cartProducts[index][0],
                          style: mainTextStyle,
                        ),
                        Text(cartProducts[index][3]),
                        Text(
                          cartProducts[index][2],
                          style: mainTextStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: FloatingActionButton(
                                backgroundColor:
                                    const Color.fromARGB(255, 212, 212, 212),
                                onPressed: () => setState(() {
                                      cartProducts.removeAt(index);
                                    }),
                                child: const Icon(Icons.delete_outline)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: cartProducts[index][5],
                              borderRadius: BorderRadius.circular(5)),
                          child:
                              Image(image: AssetImage(cartProducts[index][4]))),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Price'),
                  Text(totalPrice(), style: mainTextStyle),
                ],
              ),
              ElevatedButton(
  style: const ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(Colors.black),
  ),
  onPressed: () {
    for (int i = 0; i < cartProducts.length; i++) {
      dynamic sku = cartProducts[i][6];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BuyNow(sku: sku),
        ),
      );
    }
  },
  child: const Text('Proceed'),
),
            ],
          ),
        ),
      ),
    );
  }
}
