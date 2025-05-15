import 'package:hackathon/domain/model/position.dart';

abstract class AbstractPositionRepo {
  Future<String> addPosition(Position position);
}
