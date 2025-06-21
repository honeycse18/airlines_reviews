import 'dart:io';

import 'package:airlines_review/controllers/share_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_material_pickers/helpers/show_date_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class CustomDropdown extends StatelessWidget {
  final String hint;
  final String value;
  final List<String> items;
  final Function(String?) onChanged;
  final String? airportCode;

  const CustomDropdown({
    Key? key,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    this.airportCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(18.67),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (value.isNotEmpty) ...[
                  Text(
                    value.split(' - ').first,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (value.contains(' - '))
                    Text(
                      value.split(' - ').last,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ] else
                  Text(
                    hint,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  ),
              ],
            ),
          ),
          if (airportCode != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(18.67),
              ),
              child: Text(
                airportCode!,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          const SizedBox(width: 8),
          PopupMenuButton<String>(
            icon: const Icon(Icons.keyboard_arrow_down),
            onSelected: onChanged,
            itemBuilder:
                (context) =>
                    items.map((item) {
                      return PopupMenuItem<String>(
                        value: item,
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            item,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      );
                    }).toList(),
          ),
        ],
      ),
    );
  }
}

class DatePickerWidget extends StatelessWidget {
  final ShareDialogController controller;

  const DatePickerWidget({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final currentMonth = controller.selectedMonth.value;
      final currentYear = controller.selectedYear.value;
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(18.67),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '$currentMonth $currentYear',
                style: const TextStyle(fontSize: 14),
              ),
            ),
            PopupMenuButton(
              icon: const Icon(Icons.calendar_month),
              offset: const Offset(0, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              itemBuilder: (context) {
                return controller.years.map((year) {
                  return PopupMenuItem(
                    enabled: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$year',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        GridView.count(
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          physics: const NeverScrollableScrollPhysics(),
                          children:
                              controller.months.map((month) {
                                return GestureDetector(
                                  onTap: () {
                                    controller.selectedYear.value = year;
                                    controller.selectedMonth.value = month;
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.transparent,
                                    ),
                                    child: Text(
                                      month,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                }).toList();
              },
            ),
          ],
        ),
      );
    });
  }
}

class ShareDialog extends StatelessWidget {
  const ShareDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShareDialogController());

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.9,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Share',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 20),

            GestureDetector(
              onTap: () => controller.pickImages(),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(18.67),
                  color: Colors.blue.shade50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud_upload_outlined,
                      size: 32,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        text: 'Drag and drop your files here, or ',
                        style: TextStyle(color: Colors.grey.shade700),
                        children: const [
                          TextSpan(
                            text: 'browse',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Obx(() {
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    controller.selectedImages
                        .map(
                          (image) => ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              File(image.path),
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                        .toList(),
              );
            }),

            const SizedBox(height: 20),

            Obx(
              () => CustomDropdown(
                hint: 'Departure Airport',
                value: controller.selectedDepartureAirport.value,
                items: controller.airports,
                airportCode:
                    controller.selectedDepartureAirport.value.isNotEmpty
                        ? controller.selectedDepartureAirport.value
                            .split('(')
                            .last
                            .replaceAll(')', '')
                        : null,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedDepartureAirport.value = value;
                  }
                },
              ),
            ),
            const SizedBox(height: 16),

            Obx(
              () => CustomDropdown(
                hint: 'Arrival Airport',
                value: controller.selectedArrivalAirport.value,
                items: controller.airports,
                airportCode:
                    controller.selectedArrivalAirport.value.isNotEmpty
                        ? controller.selectedArrivalAirport.value
                            .split('(')
                            .last
                            .replaceAll(')', '')
                        : null,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedArrivalAirport.value = value;
                  }
                },
              ),
            ),
            const SizedBox(height: 16),

            Obx(
              () => CustomDropdown(
                hint: 'Airline',
                value: controller.selectedAirline.value,
                items: controller.airlines,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedAirline.value = value;
                  }
                },
              ),
            ),
            const SizedBox(height: 16),

            Obx(
              () => CustomDropdown(
                hint: 'Class',
                value: controller.selectedClass.value,
                items: controller.classes,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedClass.value = value;
                  }
                },
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 12),
                fillColor: Colors.white,
                hintText: 'Write your message',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.67),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.67),
                ),
              ),
              onChanged: controller.updateMessage,
            ),

            const SizedBox(height: 16),

           
            const Text(
              'Travel Date',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            DatePickerWidget(controller: controller),
            const SizedBox(height: 16),

          
            const Text('Rating', style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Obx(
              () => Row(
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () => controller.updateRating(index + 1),
                    child: Icon(
                      Icons.star,
                      color:
                          index < controller.rating.value
                              ? Colors.amber
                              : Colors.grey.shade300,
                      size: 32,
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 24),

     
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.submitShare,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.67),
                  ),
                ),
                child: const Text(
                  'Share Now',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
