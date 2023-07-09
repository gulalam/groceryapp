import 'package:flutter/material.dart';

import '../variables.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              'lorem ipsum dollar langa mari da kho zarwali khana nawe nawe nizamona de khoraeya',
              style: descriptionText,
            ),
          ),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}