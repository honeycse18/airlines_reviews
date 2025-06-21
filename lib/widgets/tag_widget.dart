import 'package:airlines_review/utils/constant/colors.dart';
import 'package:airlines_review/utils/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class TagsRow extends StatelessWidget {
  final String tag1;
  final String tag2;
  final String tag3;
  final String tag4;
  const TagsRow({
    super.key,
    required this.tag1,
    required this.tag2,
    required this.tag3,
    required this.tag4,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: [
        Tags(title: tag1),
        Tags(title: tag2),
        Tags(title: tag3),
        Tags(title: tag4),
      ],
    );
  }
}

class Tags extends StatelessWidget {
  final String title;

  const Tags({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.5),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(8.68),
      ),
      child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}

class Comment extends StatelessWidget {
  final String img;
  final String commenterImg;
  const Comment({super.key, required this.img, required this.commenterImg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12.66),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 14, child: Image.asset(commenterImg)),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Darron Levesque",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          "5 Upvotes",
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: AppColors.primaryButtonColor),
                        ),
                      ],
                    ),
                    Text(
                      "3 min ago",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6.33),
          Text(
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: AppColors.primaryButtonColor,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppAssetImages.upvote),
                    SizedBox(width: 8.05),
                    Text(
                      'Upvote',
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(color: AppColors.primaryButtonColor),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppAssetImages.reply),
                    SizedBox(width: 8.05),
                    Text(
                      'Reply',
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(color: AppColors.primaryButtonColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.66),
        ],
      ),
    );
  }
}

class CommentInput extends StatelessWidget {
  final String img;
  const CommentInput({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircleAvatar(radius: 21, child: Image.asset(img)),
        const SizedBox(width: 5.55),
        Expanded(
          child: Container(
            height: 41.48,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(17.33),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Write Your Comment",
                      hintStyle: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(color: AppColors.text2Color),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17.33),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17.33),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17.33),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17.33),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(AppAssetImages.send),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
