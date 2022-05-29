import 'package:flutter/material.dart';

class CustomStartButton extends StatelessWidget {
  const CustomStartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.star_border),
    );
  }
}
