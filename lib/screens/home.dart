import 'package:airlines_review/utils/constant/colors.dart';
import 'package:flutter/material.dart';

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
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          CircleAvatar(child: Icon(Icons.person)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ],
      ),
      body: CustomScrollView(
        slivers: [SliverToBoxAdapter(child: Text("Airlines Review"))],
      ),
    );
  }
}
