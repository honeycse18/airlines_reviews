import 'package:airlines_review/controllers/home_controller.dart';
import 'package:airlines_review/utils/constant/colors.dart';
import 'package:airlines_review/utils/constant/images.dart';
import 'package:airlines_review/widgets/custom_button.dart';
import 'package:airlines_review/widgets/review_card.dart';
import 'package:airlines_review/widgets/tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      global: false,
      init: HomeController(),
      builder:
          (controller) => Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  floating: true,
                  snap: true,
                  pinned: false,
                  title: const Text("Airlines Review"),
                  actions: [
                    SvgPicture.asset(AppAssetImages.notification),
                    const SizedBox(width: 24),
                    const CircleAvatar(
                      radius: 17.41,
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 16,
                          child: Icon(Icons.person, color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(width: 18),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu, size: 32),
                    ),
                  ],
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(20.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomButton(
                              title: 'Share your experience',
                              icon: AppAssetImages.share,
                              ontap:() => controller.showShareDialog(context),
                            ),
                          ),
                          const SizedBox(width: 10),
                          CustomButton(
                            title: 'Ask a question',
                            icon: AppAssetImages.qs,
                            ontap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        title: 'Search',
                        icon: AppAssetImages.search,
                        ontap: () {},
                      ),
                      const SizedBox(height: 34),
                      Image.asset('assets/images/banner.png'),
                      const SizedBox(height: 34),

                      /// Review Card
                      PostCard(
                        name: "Dianne Russell",
                        img: "assets/images/user.png",
                        commenterImg: "assets/images/female_user.png",
                      ),
                      const SizedBox(height: 34),
                      PostCard(
                        name: "Dianne Russell",
                        img: "assets/images/female_user.png",
                        commenterImg: "assets/images/user.png",
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
