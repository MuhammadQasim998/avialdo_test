// search_event.dart
part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

//Event for ingredients based recipe search
class SearchByIngredientsEvent extends SearchEvent {
  final String ingredients;

  SearchByIngredientsEvent(this.ingredients);
}

//Event for navigate to specific recipe detail page
class NavigateToDetailsEvent extends SearchEvent {
  final RecipeInfoModel recipeInfo;

  NavigateToDetailsEvent(this.recipeInfo);
}
