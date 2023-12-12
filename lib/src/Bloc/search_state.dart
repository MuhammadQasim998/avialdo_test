part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

// Represents the initial state of the search process
class SearchInitialState extends SearchState {}

// Represents the state when the search process is in progress.
class SearchLoadingState extends SearchState {}

// Represents the state when an error occurs during the search process.
class SearchErrorState extends SearchState {
  final String error;

  SearchErrorState(this.error);
}

//Represents the state when the search process is successful.Includes list of recipes information.
class SearchSuccessState extends SearchState {
  final List<RecipeInfoModel> recipeInfoList;

  SearchSuccessState(this.recipeInfoList);
}

class SearchNavigationState extends SearchState {
  final RecipeInfoModel recipeInfo;

  SearchNavigationState(this.recipeInfo);
}
