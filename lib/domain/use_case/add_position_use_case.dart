import 'package:hackathon/domain/model/position.dart';
import 'package:hackathon/domain/repo/abstract_position_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddPositionUseCase {
  final AbstractPositionRepo repo;

  AddPositionUseCase(this.repo);

  Future<String> call(Position position) => repo.addPosition(position);
}