
import 'package:flutter/widgets.dart';

class HeroImage extends StatelessWidget {


  const HeroImage(this.photoPath, {
    super.key,
  });

  final String photoPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                photoPath,
              ))),
    );
  }
}
