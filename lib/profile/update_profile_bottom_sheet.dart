import 'package:flutter/material.dart';
import 'package:movies/profile/bottom_sheet_items.dart';
import 'package:movies/utils/imageassets.dart';

class UpdateProfileBottomSheet extends StatelessWidget {
  List<Widget> avatars = [
    Image.asset(ImageAssets.avatar1),
    Image.asset(ImageAssets.avatar2),
    Image.asset(ImageAssets.avatar3),
    Image.asset(ImageAssets.avatar4),
    Image.asset(ImageAssets.avatar5),
    Image.asset(ImageAssets.avatar6),
    Image.asset(ImageAssets.avatar7),
    Image.asset(ImageAssets.avatar8),
    Image.asset(ImageAssets.avatar9),
  ];

  UpdateProfileBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;

    return GridView.builder(
      itemCount: avatars.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return BottomSheetItems(image: avatars[index],isSelectedImage: false,);
      },
    );
  }
}
