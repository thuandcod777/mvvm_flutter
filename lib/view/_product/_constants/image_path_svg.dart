class SVGImagePaths {
  static SVGImagePaths? _instance;
  static SVGImagePaths get instance => _instance = SVGImagePaths._init();

  SVGImagePaths._init();

  final astroautSVG = "astronaut".toSVG;
  final relaxSVG = "relax".toSVG;
  final chattingSVG = "chat".toSVG;
}

extension _SVGPATH on String {
  String get toSVG => "assets/svg/$this.svg";
}
