// recipe_detail_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/src/Bloc/search_bloc.dart';
import 'package:recipe_app/src/model/recipe_info_model.dart';
import 'package:recipe_app/src/styles/app_colors.dart';
import 'package:recipe_app/src/styles/text_theme.dart';

class RecipeDetailsPage extends StatelessWidget {
  static const routeName = '/recipeDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail",
          style: TextStyling.largeBold.copyWith(
            color: AppColors.black,
            fontSize: 22.sp,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.appPrimary,
      ),
      body: Center(
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state is SearchNavigationState) {
              RecipeInfoModel recipeInfo = state.recipeInfo;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Title: ${recipeInfo.title}",
                    style: TextStyling.mediumRegular
                        .copyWith(color: AppColors.black),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Used Ingredients: ${recipeInfo.usedIngredients}",
                    style: TextStyling.mediumRegular
                        .copyWith(color: AppColors.black),
                  ),
                  SizedBox(height: 16),
                  // Add other details as needed
                ],
              );
            }

            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
