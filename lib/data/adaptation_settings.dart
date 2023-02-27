enum AdaptationLevel {
  // M3 default + Default adaptations by Flutter
  //according to https://docs.flutter.dev/resources/platform-adaptations
  minimal,
  some, // To be defined https://github.com/InMatrix/veggieseasons_adaptive/issues/6
  more, // To be defined https://github.com/InMatrix/veggieseasons_adaptive/issues/7
}

var iOSAdaptation = AdaptationLevel.minimal;
