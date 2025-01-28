import 'package:flutter/material.dart';
import 'package:movies/utils/colors.dart';

class BottomSheetItems extends StatelessWidget {
  Widget image;
  bool isSelectedImage;
  BottomSheetItems(
      {super.key, required this.image, required this.isSelectedImage});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.013,
          vertical: screenSize.height * 0.01),
      decoration: BoxDecoration(
        color: isSelectedImage ? AppColor.orange : AppColor.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.orange, width: 2),
      ),
      child: ClipRRect(
        child: image,
      ),
    );
  }
}
