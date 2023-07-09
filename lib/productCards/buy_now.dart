import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BuyNow extends StatelessWidget {
  final String sku;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  BuyNow({Key? key, required this.sku}) : super(key: key);

  void _sendToWhatsApp() async {
    var phoneNumber = '+14099347339'; // Replace with the desired phone number

    var name = _nameController.text;
    var phoneNumberInput = _phoneNumberController.text;
    var address = _addressController.text;
    var order = 'You Have Received a new Order';

    var message =
        '$order\nSKU: $sku\nName: $name\nPhone Number: $phoneNumberInput\nAddress: $address';

    var url = 'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final TextStyle mainTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Now'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SKU: $sku', style: mainTextStyle),
            SizedBox(height: 20),
            Text('Delivery Address', style: mainTextStyle),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 6),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
            SizedBox(height: 20),
            Text('Payment Method', style: mainTextStyle),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                MyButton(
                  width: 150,
                  color: Colors.white,
                  widget: Image(
                    image: AssetImage('assets/images/buttons/gpay.png'),
                  ),
                ),
                MyButton(
                  width: 150,
                  color: Colors.white,
                  widget: Image(
                    image: AssetImage('assets/images/buttons/applepay.png'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: const [
                SizedBox(width: 13),
                MyButton(
                  width: 150,
                  color: Colors.white,
                  widget: Image(
                    image: AssetImage('assets/images/buttons/debitcard.png'),
                  ),
                ),
                SizedBox(width: 20),
                MyButton(
                  width: 150,
                  color: Colors.white,
                  widget: Image(
                    image: AssetImage('assets/images/buttons/cod.png'),
                    width: 100,
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
            Align(
              child: InkWell(
                onTap: () => _sendToWhatsApp(),
                child: MyButton(
                  width: 290,
                  widget: Text(
                    'Place Order',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final Widget widget;
  final Color color;
  final double width;
  final double height;

  const MyButton({
    Key? key,
    required this.widget,
    required this.color,
    this.width = 100,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border.all(width: 1.5),
            borderRadius: BorderRadius.circular(5),
            color: color,
          ),
          child: widget,
        ),
      ],
    );
  }
}

class EntryText extends StatelessWidget {
  final Text prefixText;
  final int maxLines;
  final double height;

  const EntryText({
    Key? key,
    required this.prefixText,
    this.maxLines = 1,
    this.height = 35,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(flex: 2, child: prefixText),
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 6,
          child: SizedBox(
            height: height,
            child: TextFormField(
              maxLines: 4,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 7, bottom: 7, right: 0, top: 4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
