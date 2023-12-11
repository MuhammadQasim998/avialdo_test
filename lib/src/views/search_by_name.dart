import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/src/shared/search_input_field.dart';
import 'package:recipe_app/src/styles/app_colors.dart';
import 'package:recipe_app/src/styles/text_theme.dart';

class SearchByName extends StatefulWidget {
  static const routeName = "./searchByName";
  const SearchByName({super.key});

  @override
  State<SearchByName> createState() => _SearchByNameState();
}

class _SearchByNameState extends State<SearchByName> {
  TextEditingController searchByNameController = TextEditingController();
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SearchInputField(
                hint: "Search recipe by name",
                width: MediaQuery.of(context).size.width * 0.8,
                controller: searchByNameController,
                onChanged: (value) {
                  setState(() {});
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
