import 'package:flutter/material.dart';

class CustomBorderImage extends StatelessWidget {
  String selectedImage;
  Color backgroundColor;
  CustomBorderImage({super.key,
    required this.selectedImage,
    required this.backgroundColor

  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(selectedImage)),
        border: Border.all(
          color:backgroundColor,
          width: 2,
        ),
      ),
    );
  }
}
