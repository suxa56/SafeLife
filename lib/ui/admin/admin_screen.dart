import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:hackathon/di/injections.dart';
import 'package:hackathon/ui/admin/admin_bloc.dart';
import 'package:hackathon/ui/dialogs/new_organization.dart';
import 'package:hackathon/ui/dialogs/new_position.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _key = GlobalKey<ExpandableFabState>();
  final bloc = getIt<AdminBloc>();

  void _toggleFAB() {
    final state = _key.currentState;
    if (state != null) {
      state.toggle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminBloc, AdminState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is OrganizationAddedState) {
          SnackBar snackBar = SnackBar(
              content: Text('${state.name} добавлено'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Admin panel')),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFab(
          openButtonBuilder: RotateFloatingActionButtonBuilder(
            child: const Icon(Icons.add_outlined),
          ),
          closeButtonBuilder: RotateFloatingActionButtonBuilder(
            child: const Icon(Icons.close_outlined),
          ),
          key: _key,
          type: ExpandableFabType.up,
          distance: 80,
          margin: EdgeInsets.all(16),
          overlayStyle: ExpandableFabOverlayStyle(
            color: Colors.black.withValues(alpha: 0.5),
            blur: 5,
          ),
          children: [
            FloatingActionButton.extended(
              heroTag: 'organization',
              label: const Text("Организация"),
              icon: const Icon(Icons.corporate_fare_outlined),
              onPressed: () {
                showNewOrganizationDialog(
                  context: context,
                  onConfirm: (value) {
                    bloc.add(AddOrganizationEvent(value));
                  },
                );
                _toggleFAB();
              },
            ),
            FloatingActionButton.extended(
              heroTag: 'position',
              label: const Text("Должность"),
              icon: const Icon(Icons.badge_outlined),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => NewPositionDialog(
                      onSave: (name, jd) {
                        bloc.add(AddPositionEvent(name, jd));
                      },
                    ),
                  ),
                );
                _toggleFAB();
              },
            ),
            // TODO(): Полноценная форма с имя, фамилия, пароль, должность, организация, почта
            FloatingActionButton.extended(
              heroTag: 'user',
              label: const Text("Пользователь"),
              icon: const Icon(Icons.supervised_user_circle_outlined),
              onPressed: () {
                const SnackBar snackBar = SnackBar(
                    content: Text("Реализуй, как будет время"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                _toggleFAB();
              },
            ),
          ],
        ),
        // TODO(): Дашборд с показателями, имеющимися данными, может KPI
        body: Column(),
      ),
    );
  }
}
