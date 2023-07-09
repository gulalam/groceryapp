import 'package:flutter/material.dart';

import '../variables.dart';
import 'upper_card.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UpperCard(
            backgroundColor: const Color.fromARGB(255, 182, 15, 15),
            mainText: Text(
              'Strawberry',
              style: upperCardText,
            ),
            discriptionText: Text(
              '10% off',
              style: upperCardDescription,
            ),
            image: const AssetImage('assets/images/fruits/strawberry.png')),
        UpperCard(
            backgroundColor: Colors.orange,
            mainText: Text(
              'Orange',
              style: upperCardText,
            ),
            discriptionText: Text(
              '20% off',
              style: upperCardDescription,
            ),
            image: const AssetImage('assets/images/fruits/orange.png')),
      ],
    );
  }
}

