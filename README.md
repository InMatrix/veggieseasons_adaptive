# Veggie Seasons Adaptive
This demo app is an experiment of adapting Material Design 3 for an iOS audience in the context of Flutter development. It aims to achieve platform-appropriate look and feel with as little compromise on reusing code between Android and iOS as possible. 

The app ports [Veggie Seasons](https://github.com/flutter/samples/tree/main/veggieseasons), which was built with Flutter's [Cupertino library](https://docs.flutter.dev/development/ui/widgets/cupertino) as an iOS-only app, to [Material Design 3](https://docs.flutter.dev/development/ui/material) (M3). Certain parts of the original app, such as state management and data persistence, were not implemented, since they're not needed for this UI exploration. 
<figure>
<img width="700" alt="screenshots of Veggie Seasons in Material Design 3 and in its original iOS style" src="https://user-images.githubusercontent.com/348942/221036265-008ca558-79f7-4789-b65f-a83376b55e06.png">

<figcaption align = "center">Left: Veggie Seasons Adaptive in Material Design 3. Right: The original Veggie Seasons app in the iOS style.</figcaption>
</figure>

To see the platform adaptations in action, run the app on both iOS and Android. For VS Code users, follow [these instructions](https://github.com/flutter/flutter/wiki/Multi-device-debugging-in-VS-Code) to set up multi-device debugging.

## Join the discussions

If you're familiar with iOS UI design patterns, let us know your thoughts on Material-to-iOS adaptation in the Discussions board and the issue tracker. Feel free to fork this repo, experiment with your own cross-platform adaptations, and share your approach in the Discussions board.  
