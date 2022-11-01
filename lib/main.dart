import 'package:flutter/material.dart';
import  'package:spritewidget/spritewidget.dart' as prefix;
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';



class SpaceShooterGame extends FlameGame {

  final SpriteComponent player = null;


  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final sprite = await Sprite.load('player.png');
    final size = Vector2.all(128.0);
    final player = SpriteComponent(size: size, sprite: sprite);

    // screen coordinates
    player.position = Vector2(0.0, 0.0); // Vector2(0.0, 0.0) by default, can also be set in the constructor
    player.angle = 0; // 0 by default, can also be set in the constructor
    add(player); // Adds the component

    add(
      Player()
        ..position = size / 2
        ..width = 50
        ..height = 10
        ..anchor = Anchor.center,
    );
  }
}


void main() {
  runApp(GameWidget(game: SpaceShooterGame()));
}

class Player extends PositionComponent {
  static final _paint = Paint()..color = Colors.white;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), _paint);
  }
}


