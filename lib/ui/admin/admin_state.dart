part of 'admin_bloc.dart';

@immutable
sealed class AdminState {}

final class AdminInitial extends AdminState {}

final class OrganizationAddedState extends AdminState{
  final String name;

  OrganizationAddedState(this.name);
}

final class PositionAddedState extends AdminState{
  final String name;

  PositionAddedState(this.name);

}