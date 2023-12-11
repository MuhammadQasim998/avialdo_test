import 'package:dio/dio.dart';
import 'package:recipe_app/src/model/recipe_info_model.dart';

final dio = Dio();

class ApiService {
  Future<List<RecipeInfoModel>> request(String ingredients) async {
    print("ingredient---${ingredients}");
    Response response;
    response = await dio.get(
        'https://api.spoonacular.com/recipes/findByIngredients?ingredients=$ingredients&number=10&limitLicense=true&ranking=1&ignorePantry=false&apiKey=2742255cc0574a199bcd038ffd31a105');
    print(response.data.toString());
    return RecipeInfoModel.fromJsonList(response.data);
    // // The below request is the same as above.
    // response = await dio.get(
    //   '/test',
    //   queryParameters: {'id': 12, 'name': 'dio'},
    // );
    // print(response.data.toString());
  }
}
