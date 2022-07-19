import 'package:flutter/material.dart';
import 'package:vetmed_app/utils/colors.dart';

class PhotosIcon extends StatelessWidget {
  final IconData iconPhoto;
  final Color color;
  final VoidCallback onPressed;
  final String textIcon;

  const PhotosIcon({
    Key? key,
    required this.iconPhoto,
    required this.onPressed,
    required this.color,
    required this.textIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: iconPhoto == Icons.camera_alt ? primaryWhite : secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconPhoto,
              size: 54,
              color:
                  iconPhoto == Icons.camera_alt ? primaryColor : primaryWhite,
            ),
            Text(textIcon, style: TextStyle(color: textIcon == "Sacar foto"? primaryColor : primaryWhite),),
          ],
        ),
      ),
    );
  }
}
