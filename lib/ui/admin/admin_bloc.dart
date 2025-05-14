import 'package:bloc/bloc.dart';
import 'package:hackathon/domain/use_case/add_organization_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'admin_event.dart';
part 'admin_state.dart';

@lazySingleton
class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final AddOrganizationUseCase addOrganizationUseCase;
  AdminBloc(this.addOrganizationUseCase) : super(AdminInitial()) {
    on<AddOrganizationEvent>((event, emit) async {
      await addOrganizationUseCase(Uuid().v1(), event.name);
      emit(OrganizationAddedState(event.name));
    });
  }
}
