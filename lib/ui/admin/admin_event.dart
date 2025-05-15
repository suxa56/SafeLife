part of 'admin_bloc.dart';

@immutable
sealed class AdminEvent {}

final class AddOrganizationEvent extends AdminEvent {
  final String name;

  AddOrganizationEvent(this.name);
}

final class AddPositionEvent extends AdminEvent {
  final String name;
  final List<String> jd;

  AddPositionEvent(this.name, this.jd);
}
