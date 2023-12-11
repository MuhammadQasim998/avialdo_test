// search_state.dart
part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchErrorState extends SearchState {
  final String error;

  SearchErrorState(this.error);
}

class SearchSuccessState extends SearchState {
  final List<RecipeInfoModel> recipeInfoList;

  SearchSuccessState(this.recipeInfoList);
}

class SearchNavigationState extends SearchState {
  final RecipeInfoModel recipeInfo;

  SearchNavigationState(this.recipeInfo);
}
