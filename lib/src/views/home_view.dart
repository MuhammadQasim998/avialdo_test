import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/src/service/api_service.dart';
import 'package:recipe_app/src/shared/button.dart';
import 'package:recipe_app/src/styles/app_colors.dart';
import 'package:recipe_app/src/styles/text_theme.dart';
import 'package:recipe_app/src/views/search_by_ingredients.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  ApiService apiService = ApiService();
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
        body: Center(
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
        ));
  }
}
