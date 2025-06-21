import 'package:airlines_review/controllers/share_controller.dart';
import 'package:airlines_review/screens/share_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  var isExpanded = false.obs;

  void toggleReadMore() {
    isExpanded.value = !isExpanded.value;
  }

  void showShareDialog(BuildContext context) {
    final controller = Get.put(ShareDialogController());
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Row(children: [Expanded(child: ShareDialog())]),
          ),
    );
  }
}
