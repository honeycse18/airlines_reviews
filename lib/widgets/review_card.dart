import 'package:airlines_review/controllers/home_controller.dart';
import 'package:airlines_review/utils/constant/colors.dart';
import 'package:airlines_review/utils/constant/images.dart';
import 'package:airlines_review/widgets/tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PostCard extends StatelessWidget {
  final String name;
  final String img;
  final String commenterImg;
  // final String review;
  // final String date;
  // final List<String> tags;
  const PostCard({
    Key? key,
    required this.name,
    required this.commenterImg,
    // required this.review,
    // required this.date,
    // required this.tags,
    required this.img,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      global: false,
      init: HomeController(),
      builder:
          (controller) => Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(backgroundImage: AssetImage(img)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "1 day ago",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "5.0",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TagsRow(
                  tag1: "LHR - DEL",
                  tag2: "Air India",
                  tag3: "Business Class",
                  tag4: "July 2023",
                ),
                const SizedBox(height: 16),
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.isExpanded.value
                            ? 'Stay tuned for a smoother, more convenient experience right at your fingertips, a smoother, more convenient other, more convenient experience right at your. Stay tuned for a smoother, more convenient experience right at your fingertips, a smoother, more convenient other, more convenient experience right at your'
                            : 'Stay tuned for a smoother, more convenient experience right at your fingertips, a smoother, more convenient other, more convenient experience right at your',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          controller.isExpanded.toggle();
                        },
                        child: const Text(
                          'See More',
                          style: TextStyle(
                            color: AppColors.text2Color,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 13.87),
                Image.asset('assets/images/plane.png'),
                const SizedBox(height: 5.55),
                Text(
                  "30 Like  •  20 Comment",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: AppColors.primaryButtonColor,
                  ),
                ),
                const SizedBox(height: 12.48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(AppAssetImages.likeLine),
                        const SizedBox(width: 8.55),
                        Text(
                          'Like',
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(color: AppColors.primaryButtonColor),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AppAssetImages.shareIcon),
                        const SizedBox(width: 8.55),
                        Text(
                          'Share',
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(color: AppColors.primaryButtonColor),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Comment(img: img, commenterImg: commenterImg),
                const SizedBox(height: 12.66),
                const Text(
                  "See More Comments",
                  style: TextStyle(
                    color: AppColors.text2Color,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 13.17),
                CommentInput(img: img),
              ],
            ),
          ),
    );
  }
}
