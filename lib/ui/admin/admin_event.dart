part of 'admin_bloc.dart';

@immutable
sealed class AdminEvent {}

final class AddOrganizationEvent extends AdminEvent {
  final String name;

  AddOrganizationEvent(this.name);
}
