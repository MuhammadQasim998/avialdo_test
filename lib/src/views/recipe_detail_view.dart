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
  const RecipeDetailsPage({Key? key}) : super(key: key);

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
      ),
      body: SafeArea(
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state is SearchNavigationState) {
              RecipeInfoModel recipeInfo = state.recipeInfo;

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(recipeInfo.image.toString()),
                            fit: BoxFit.fill)),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipeInfo.title.toString(),
                          style: TextStyling.largeBold
                              .copyWith(color: AppColors.black),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 15.h),
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.grey,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "Used Ingredients",
                                  textAlign: TextAlign.center,
                                  style: TextStyling.mediumBold.copyWith(
                                      color: AppColors.appPrimary,
                                      fontSize: 18.sp),
                                ),
                              ),
                              ListView.builder(
                                itemCount: recipeInfo.usedIngredients?.length,
                                shrinkWrap: true,
                                itemBuilder: (ctx, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(top: 10.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${(index + 1).toString()}) ",
                                          style: TextStyling.mediumRegular
                                              .copyWith(
                                            color: AppColors.black,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                recipeInfo
                                                        .usedIngredients?[index]
                                                        .original
                                                        .toString() ??
                                                    "",
                                                style: TextStyling.mediumRegular
                                                    .copyWith(
                                                  color: AppColors.black,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
