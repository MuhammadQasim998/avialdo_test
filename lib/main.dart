// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/src/Bloc/search_bloc.dart';
import 'package:recipe_app/src/styles/app_colors.dart';
import 'package:recipe_app/src/views/home_view.dart';
import 'package:recipe_app/src/views/recipe_detail_view.dart';
import 'package:recipe_app/src/views/search_by_ingredients.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, snapshot) {
        return MultiBlocProvider(
          providers: [
            //Bloc provider for search bloc
            BlocProvider<SearchBloc>(
              create: (context) => SearchBloc(),
            ),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              useMaterial3: true,
              colorScheme: ColorScheme(
                brightness: Brightness.light,
                primary: AppColors.primary,
                onPrimary: AppColors.white,
                secondary: AppColors.secondary,
                onSecondary: AppColors.white,
                error: AppColors.red,
                onError: AppColors.white,
                background: AppColors.white,
                onBackground: AppColors.white,
                surface: AppColors.white,
                onSurface: AppColors.primary,
              ),
              fontFamily: 'Poppins',
            ),
            //Default View
            home: HomeView(),
            routes: {
              SearchByIngredients.routeName: (ctx) =>
                  const SearchByIngredients(),
              RecipeDetailsPage.routeName: (ctx) => RecipeDetailsPage(),
            },
          ),
        );
      },
    );
  }
}
