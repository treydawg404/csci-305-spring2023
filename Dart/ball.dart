// Dart program that is a conversion of Addiley's bouncing ball program,
// which is written in javascript

import 'dart:async';
import 'dart:html';
import 'dart:math' as math;

void main() {
  final canvas = querySelector('canvas') as CanvasElement;
  final ctx = canvas.getContext('2d') as CanvasRenderingContext2D;

  double x = 50;
  double y = 50;
  double dx = 2;
  double dy = -4;
  double r = 10;

  canvas.onClick.listen((event) {
    x = event.client.x.toDouble();
    y = event.client.y.toDouble();
  });

  void draw(Timer timer) {
    ctx.save();
    ctx.fillStyle = "black";
    ctx.fillRect(0, 0, canvas.width!, canvas.height!);
    ctx.restore();

    // Update ball (with Physics! =)
    // 1 - apply velocity to position (dx -> x)
    x += dx;
    y += dy;

    // 2 - apply drag/friction to velocity
    dx *= .99;
    dy *= .99;

    // 3 - apply gravity to velocity
    dy += .25;
    dx += .25;

    // 4 - check for collisions
    if (y + r > canvas.height!) {
      y = canvas.height!.toDouble() - r;
      dy = -dy.abs();
    }
    if (x + r > canvas.width!) {
      x = canvas.width!.toDouble() - r;
      dx = -dx.abs();
    }

    // Draw ball
    ctx.save();
    ctx.translate(x, y);
    ctx.fillStyle = 'red';
    ctx.beginPath();
    ctx.arc(0, 0, r, 0, math.pi * 2, true);
    ctx.closePath();
    ctx.fill();
    ctx.restore();
  }

  Timer.periodic(Duration(milliseconds: 10), draw);
}
