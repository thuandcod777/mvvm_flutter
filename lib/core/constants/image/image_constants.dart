class ImageConstants {
  static ImageConstants? _instance;

  static ImageConstants get instance => _instance = ImageConstants._init();

  ImageConstants._init();

  String get logo => toPng("value");

  String toPng(String name) => "assets/image/$name";
}
