import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String icon;
  void Function()? ontap;
  CustomButton({
    required this.title,
    required this.icon,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 51.48,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(14.2),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 9.0,
            top: 18,
            bottom: 18,
            right: 9.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodySmall),
              SizedBox(width: 11),
              Center(child: SvgPicture.asset(icon, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
