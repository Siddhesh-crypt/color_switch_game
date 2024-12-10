import 'dart:ui';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:color_switch_game/player.dart';

class MyGame extends FlameGame with TapCallbacks{
  late Player myPlayer;

  MyGame() :
      super(
        camera: CameraComponent.withFixedResolution(
            width: 600,
            height: 1000)
      );

  @override
  Color backgroudColor() => const Color(0xff222222);

  @override
  void onMount() {
    // TODO: implement onMount

    world.add(myPlayer = Player());

    super.onMount();
  }

  @override
  void update(double dt){
    final cameraY = camera.viewfinder.position.y;
    final playerY = myPlayer.position.y;

    if(playerY < cameraY){
      camera.viewfinder.position = Vector2(0, playerY);
    }
    // camera.viewfinder.position = myPlayer.position;
    super.update(dt);
  }
  @override
  void onTapDown(TapDownEvent event) {
    // TODO: implement onTapDown
    super.onTapDown(event);
    // print("TapDown");
    myPlayer.jump();
  }


}