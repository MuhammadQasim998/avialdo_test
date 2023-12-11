import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/src/shared/button.dart';
import 'package:recipe_app/src/styles/app_colors.dart';
import 'package:recipe_app/src/styles/text_theme.dart';
import 'package:recipe_app/src/views/search_by_ingredients.dart';
import 'package:recipe_app/src/views/search_by_name.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recipe App",
          style: TextStyling.largeBold.copyWith(
            color: AppColors.black,
            fontSize: 22.sp,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.appPrimary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: MainButton(
              text: "Search by Name",
              width: MediaQuery.of(context).size.width * 0.8,
              onTap: () {
                Navigator.of(context).pushNamed(SearchByName.routeName);
              },
              isPrimary: false,
              bgColor: Colors.transparent,
              borderColor: AppColors.appPrimary,
              textColor: AppColors.black,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: MainButton(
              text: "Search by Ingredients",
              onTap: () {
                Navigator.of(context).pushNamed(SearchByIngredients.routeName);
              },
              width: MediaQuery.of(context).size.width * 0.8,
              isPrimary: true,
              bgColor: AppColors.appPrimary,
              borderColor: Colors.transparent,
              textColor: AppColors.black,
            ),
          )
        ],
      ),
    );
  }
}
