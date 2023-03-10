# Veggie Seasons Adaptive
This demo app is an experiment of adapting Material Design 3 for an iOS audience in the context of Flutter development. It aims to achieve platform-appropriate look and feel with as little compromise on reusing code between Android and iOS as possible. 

The app ports [Veggie Seasons](https://github.com/flutter/samples/tree/main/veggieseasons), which was built with Flutter's [Cupertino library](https://docs.flutter.dev/development/ui/widgets/cupertino) as an iOS-only app, to [Material Design 3](https://docs.flutter.dev/development/ui/material) (M3). Certain parts of the original app, such as state management and data persistence, were not implemented, since they're not needed for this UI exploration. 
<figure>
<img width="700" alt="screenshots of Veggie Seasons in Material Design 3 and in its original iOS style" src="https://user-images.githubusercontent.com/348942/221036265-008ca558-79f7-4789-b65f-a83376b55e06.png">

<figcaption align = "center">Left: Veggie Seasons Adaptive in Material Design 3. Right: The original Veggie Seasons app in the iOS style.</figcaption>
</figure>

## Run the app with a specific adaptation level

You can run the app with three different levels of adaptation for iOS, set by the `iOSAdaptation` variable in [adaptation_settings.dart](https://github.com/InMatrix/veggieseasons_adaptive/blob/main/lib/data/adaptation_settings.dart). You may change that setting directly in code or do so in the Settings screen of the app. 

<img width="230" alt="image" src="https://user-images.githubusercontent.com/348942/222787138-dd0eac3f-4dce-4a6a-986e-d9e90cff0ac5.png">

When you run the app with `AdaptationLevel.minimal` (the default), it comes with a UI in full Material Design 3 with slight adaptations automatically done by Flutter as documented in [Platform-specific behaviors and adaptations](https://docs.flutter.dev/resources/platform-adaptations).
The `some` and `more` levels provide increasingly more adaptations based on Apple's [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/guidelines/overview/). Both levels are being defined and implemented through this experimentation (see https://github.com/InMatrix/veggieseasons_adaptive/issues/6 and https://github.com/InMatrix/veggieseasons_adaptive/issues/7, respectively).  

## Join the discussions

If you're familiar with iOS UI design patterns, let us know your thoughts on Material-to-iOS adaptation in the Discussions board and the issue tracker. Feel free to fork this repo, experiment with your own cross-platform adaptations, and share your approach in the Discussions board.  
