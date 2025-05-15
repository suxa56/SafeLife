import 'package:firebase_database/firebase_database.dart';
import 'package:hackathon/domain/model/position.dart';
import 'package:hackathon/domain/repo/abstract_position_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AbstractPositionRepo)
class PositionRepo extends AbstractPositionRepo {
  final FirebaseDatabase db;
  late final DatabaseReference ref;

  PositionRepo(this.db) {
    ref = db.ref('position');
  }

  @override
  Future<String> addPosition(Position position) async {
    await ref.child(position.uid).set(position.toJson());
    return position.name;
  }

}