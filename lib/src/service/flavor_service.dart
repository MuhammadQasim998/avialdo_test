enum Env {
  prod,
  dev,
}

class FlavorService {
  FlavorService._();

  static Env? env;

  static init() {}

  static String get getBaseApi {
    return "https://api.spoonacular.com";
  }

  static String get getApiKey {
    return "2742255cc0574a199bcd038ffd31a105";
  }
}
