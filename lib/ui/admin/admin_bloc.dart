import 'package:bloc/bloc.dart';
import 'package:hackathon/domain/model/organization.dart';
import 'package:hackathon/domain/model/position.dart';
import 'package:hackathon/domain/use_case/add_organization_use_case.dart';
import 'package:hackathon/domain/use_case/add_position_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'admin_event.dart';

part 'admin_state.dart';

@lazySingleton
class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final AddOrganizationUseCase addOrganizationUseCase;
  final AddPositionUseCase addPositionUseCase;

  AdminBloc(this.addOrganizationUseCase, this.addPositionUseCase) : super(AdminInitial()) {
    on<AddOrganizationEvent>((event, emit) async {
      var result = await addOrganizationUseCase(
        Organization(uid: Uuid().v1(), name: event.name),
      );
      emit(OrganizationAddedState(result));
    });
    on<AddPositionEvent>((event, emit) async {
      await addPositionUseCase(Position(uid: Uuid().v1(), name: event.name, jobDescription: event.jd));
    });
  }
}
