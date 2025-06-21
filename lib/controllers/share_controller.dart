import 'package:airlines_review/screens/share_form.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

class ShareDialogController extends GetxController {
  var selectedDepartureAirport = ''.obs;
  var selectedArrivalAirport = ''.obs;
  var selectedAirline = ''.obs;
  var selectedClass = ''.obs;
  var selectedYear = 2025.obs;
  var selectedMonth = 'May'.obs;
  var selectedTravelDate = DateTime.now().obs;
  var rating = 0.obs;
  var message = ''.obs;

  final List<String> airports = [
    'Dhaka, Bangladesh - Hazrat Shahjalal International Airport (DAC)',
    'Zielona Gora, Poland - Zielona Góra-Babimost Airport (IEG)',
    'London, UK - Heathrow Airport (LHR)',
    'New York, USA - John F. Kennedy Airport (JFK)',
    'Dubai, UAE - Dubai International Airport (DXB)',
  ];

  final List<String> airlines = [
    'Emirates',
    'Qatar Airways',
    'Singapore Airlines',
    'Lufthansa',
    'British Airways',
    'Turkish Airlines',
  ];

  final List<String> classes = [
    'Any',
    'Economy',
    'Premium Economy',
    'Business',
    'First',
  ];

  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  final List<int> years = [2024, 2025, 2026, 2027, 2028];

  void updateRating(int newRating) {
    rating.value = newRating;
  }

  void updateMessage(String newMessage) {
    message.value = newMessage;
  }

  /*************  ✨ Windsurf Command ⭐  *************/
  /// Displays a success snackbar indicating that the travel experience
  /// has been shared successfully and then navigates back to the
  /// previous screen.

  /*******  946bc5f4-96bf-4f7a-862b-5d37d7e107cb  *******/
  void submitShare() {
    Get.snackbar(
      'Success',
      'Travel experience shared successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    Get.back();
  }

  final selectedImages = <XFile>[].obs;

  Future<void> pickImages({bool multiple = false}) async {
    final ImagePicker picker = ImagePicker();
    if (multiple) {
      final pickedFiles = await picker.pickMultiImage();
      if (pickedFiles.isNotEmpty) {
        selectedImages.addAll(pickedFiles);
      }
    } else {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImages.add(pickedFile);
      }
    }
  }
}
