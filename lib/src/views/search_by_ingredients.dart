// search_by_ingredients.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/src/Bloc/search_bloc.dart';
import 'package:recipe_app/src/model/recipe_info_model.dart';
import 'package:recipe_app/src/shared/button.dart';
import 'package:recipe_app/src/shared/search_input_field.dart';
import 'package:recipe_app/src/styles/app_colors.dart';
import 'package:recipe_app/src/styles/text_theme.dart';
import 'recipe_detail_view.dart';

class SearchByIngredients extends StatefulWidget {
  static const routeName = "./searchByIngredients";
  const SearchByIngredients({Key? key}) : super(key: key);

  @override
  State<SearchByIngredients> createState() => _SearchByIngredientsState();
}

class _SearchByIngredientsState extends State<SearchByIngredients> {
  late final SearchBloc _searchBloc;
  TextEditingController searchByIngredientsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchBloc = BlocProvider.of<SearchBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Recipe",
          style: TextStyling.largeBold.copyWith(
            color: AppColors.black,
            fontSize: 22.sp,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.appPrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SearchInputField(
                  hint: "Search recipe by ingredients",
                  width: MediaQuery.of(context).size.width * 0.8,
                  controller: searchByIngredientsController,
                  onChanged: (value) {
                    //Add a SearchByIngredientsEvent to the SearchBloc to initiate the search and updates the UI accordingly
                    _searchBloc.add(SearchByIngredientsEvent(value));
                  },
                ),
              ),

              //It listens to changes in the Search State and updates the UI accordingly
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  //condition for checking if the state is in loading state so loader will display
                  if (state is SearchLoadingState) {
                    return Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: Center(
                        child: SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: CircularProgressIndicator(
                            color: AppColors.appPrimary,
                          ),
                        ),
                      ),
                    );
                  }

                  //condition for checking if the state returns an error
                  else if (state is SearchErrorState) {
                    return Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: Center(
                        child: Text(
                          state.error,
                          style: TextStyling.mediumBold.copyWith(
                              color: AppColors.black, fontSize: 18.sp),
                        ),
                      ),
                    );
                  }

                  //condition for checking if the state returns success so display the UI accordingly.
                  else if (state is SearchSuccessState) {
                    List<RecipeInfoModel> recipeInfoList = state.recipeInfoList;

                    return recipeInfoList.isEmpty
                        ? Padding(
                            padding: EdgeInsets.only(top: 30.h),
                            child: Center(
                              child: Text(
                                "Oops! No data found",
                                style: TextStyling.mediumBold.copyWith(
                                    color: AppColors.black, fontSize: 18.sp),
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: recipeInfoList.length,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (ctx, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 30.h),
                                      padding: EdgeInsets.only(bottom: 20.h),
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.grey.withOpacity(0.5),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            height: 100.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(20),
                                                        topRight:
                                                            Radius.circular(
                                                                20)),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        recipeInfoList[index]
                                                                .image
                                                                .toString() ??
                                                            ""),
                                                    fit: BoxFit.cover)),
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  recipeInfoList[index]
                                                      .title
                                                      .toString(),
                                                  style: TextStyling.mediumBold
                                                      .copyWith(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 14.sp),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Total Used Ingredients: ",
                                                      style: TextStyling
                                                          .smallBold
                                                          .copyWith(
                                                              color: AppColors
                                                                  .black,
                                                              fontSize: 12.sp),
                                                    ),
                                                    Text(
                                                      recipeInfoList[index]
                                                          .usedIngredientCount
                                                          .toString(),
                                                      style: TextStyling
                                                          .smallRegular
                                                          .copyWith(
                                                              color: AppColors
                                                                  .black,
                                                              fontSize: 12.sp),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Center(
                                                  child: MainButton(
                                                    text: "View Details",
                                                    onTap: () {
                                                      //Adding bloc event to navigate to details page
                                                      _searchBloc.add(
                                                        NavigateToDetailsEvent(
                                                            recipeInfoList[
                                                                index]),
                                                      );
                                                      Navigator.of(context)
                                                          .pushNamed(
                                                        RecipeDetailsPage
                                                            .routeName,
                                                      );
                                                    },
                                                    isPrimary: false,
                                                    textColor: AppColors.white,
                                                    bgColor: AppColors.pinkColor
                                                        .withOpacity(0.8),
                                                    height: 45.h,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.7,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                  }

                  // Default return if no state matches
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchBloc.close();
    super.dispose();
  }
}
