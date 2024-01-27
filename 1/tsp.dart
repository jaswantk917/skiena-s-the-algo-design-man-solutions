import 'dart:math';

class Point {
  Point({required this.x, required this.y});
  final num x;
  final num y;
  num distance(Point other) {
    num sqDist = pow((x - other.x), 2) + pow((y - other.y), 2);
    return sqrt(sqDist);
  }

  @override
  String toString() {
    return "($x, $y), ";
  }
}

List<Point> tsp1(List<Point> points) {
  List<Point> ans = [];
  int id = 0;
  Point temp = points[id];
  num distance = double.maxFinite;
  ans.add(points[id]);
  points.removeAt(id);

  while (points.isNotEmpty) {
    for (int i = 0; i < points.length; i++) {
      if (distance > points[i].distance(temp)) {
        id = i;
        distance = points[i].distance(temp);
      }
    }
    temp = points[id];
    ans.add(points[id]);
    points.removeAt(id);
    distance = double.maxFinite;
  }

  return ans;
}

List<Point> tsp2(List<Point> points) {
  if (points.isEmpty) return points;
  List<List<Point>> secs = [];
  for (var x in points) secs.add([x]);
  int a = 0, b = 0, aa = 0, bb = 0;

  while (secs.length > 1) {
    num d = double.maxFinite;
    for (int i = 0; i < secs.length - 1; i++) {
      var curr = secs[i];
      for (int x in [0, curr.length - 1]) {
        for (int j = i + 1; j < secs.length; j++) {
          var other = secs[j];
          for (int y in [0, other.length - 1]) {
            if (curr[x].distance(other[y]) < d) {
              a = i;
              b = j;
              aa = x;
              bb = y;
            }
          }
        }
      }
    }
    if (aa == 0 && bb == 0) {
      secs[a] = secs[a].reversed.toList();
    } else if (aa == 0 && bb != 0) {
      secs[b] = secs[b].reversed.toList();
      secs[a] = secs[a].reversed.toList();
    } else if (aa != 0 && bb == 0) {
    } else if (aa != 0 && bb != 0) {
      secs[b] = secs[b].reversed.toList();
    }
    secs[a].addAll(secs[b]);
    secs.removeAt(b);
  }

  return secs[0];
}

List<Point> generate() {
  List<Point> points = [];
  int count = Random().nextInt(30) + 1200;
  for (int i = 0; i < count; i++) {
    points.add(Point(
        x: Random().nextDouble() * 10 - 5, y: Random().nextDouble() * 10 - 5));
  }
  return points;
}

num totalDistance(List<Point> points) {
  print(points.length.toString());
  num ans = 0;
  int len = points.length;
  for (int i = 0; i < len; i++) {
    print(points[i]);
    ans += points[i].distance(points[(i + 1) % len]);
  }
  return ans;
}

void main() {
  final List<Point> points = generate();
  print(points.length);
  var v1 = tsp1(List.from(points));
  print(totalDistance(v1));
  var v2 = tsp2(points);
  print(totalDistance(v2));
}
