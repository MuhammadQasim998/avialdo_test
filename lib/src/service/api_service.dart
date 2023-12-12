import 'package:dio/dio.dart';

import 'package:recipe_app/src/model/recipe_info_model.dart';
import 'package:recipe_app/src/service/flavor_service.dart';

final dio = Dio();

// The ApiService class manages communication with an external recipe API through the Dio library.
class ApiService {
  Future<List<RecipeInfoModel>> ingredientSearch(String ingredients) async {
    Response response;
    response = await dio.get(
        '${FlavorService.getBaseApi}/recipes/findByIngredients?ingredients=$ingredients&number=10&limitLicense=true&ranking=1&ignorePantry=false&apiKey=${FlavorService.getApiKey}');

    return RecipeInfoModel.fromJsonList(response.data);
  }
}
