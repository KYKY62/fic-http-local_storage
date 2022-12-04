class AppConfig {
  //# CONFIG
  static String yourName = "RizkyA";
  static String phoneNumber = "08213811922";
  //# ---------------------------------------
  //# ---------------------------------------

  static String get baseUrl {
    var storage = yourName.replaceAll(" ", "-").toLowerCase();
    storage = "$storage-$phoneNumber";
    return "http://capekngoding.com:8080/$storage/api";
  }
}
