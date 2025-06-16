import 'package:airlines_review/utils/constant/colors.dart';
import 'package:airlines_review/utils/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgrounColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Airlines Review"),
        actions: [
          SvgPicture.asset(AppAssetImages.notificationLogoLine),
          SizedBox(width: 24),
          CircleAvatar(
            radius: 17.41,
            child: Center(
              child: Container(
                height: 34.82,
                width: 34.82,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                ),

                child: Center(child: Icon(Icons.person)),
              ),
            ),
          ),
          SizedBox(width: 18),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu, size: 32)),
        ],
      ),
      body: CustomScrollView(
        slivers: [SliverToBoxAdapter(child: Text("Airlines Review"))],
      ),
    );
  }
}
