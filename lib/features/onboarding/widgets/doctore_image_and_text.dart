import 'package:doctormobile/core/helpers/assets_maneger.dart';
import 'package:doctormobile/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctoreImageAndText extends StatelessWidget {
  const DoctoreImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AssetsManeger.docLogoLowOpacity),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14, 0.4],
            ),
          ),
          child: Image.asset(AssetsManeger.onBoardingDoctore),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 30,
          child: Text(
            'Best Doctore Appointment App',
            style: TextStyles.font32BlueBold.copyWith(
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
