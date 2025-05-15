// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_database/firebase_database.dart' as _i345;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hackathon/data/auth_repo.dart' as _i704;
import 'package:hackathon/data/organization_repo.dart' as _i751;
import 'package:hackathon/data/user_repo.dart' as _i922;
import 'package:hackathon/di/injectable_module.dart' as _i562;
import 'package:hackathon/domain/repo/abstract_auth_repo.dart' as _i799;
import 'package:hackathon/domain/repo/abstract_organization_repo.dart' as _i259;
import 'package:hackathon/domain/repo/abstract_user_repo.dart' as _i414;
import 'package:hackathon/domain/use_case/add_organization_use_case.dart'
    as _i825;
import 'package:hackathon/domain/use_case/get_user_use_case.dart' as _i618;
import 'package:hackathon/domain/use_case/is_admin_use_case.dart' as _i823;
import 'package:hackathon/domain/use_case/login_use_case.dart' as _i410;
import 'package:hackathon/ui/admin/admin_bloc.dart' as _i895;
import 'package:hackathon/ui/login/login_bloc.dart';
import 'package:injectable/injectable.dart' as _i526;
import 'package:talker_flutter/talker_flutter.dart' as _i207;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i207.Talker>(() => injectableModule.talker);
    gh.lazySingleton<_i59.FirebaseAuth>(() => injectableModule.auth);
    gh.lazySingleton<_i345.FirebaseDatabase>(() => injectableModule.database);
    gh.factory<_i414.AbstractUserRepo>(
      () => _i922.UserRepo(gh<_i345.FirebaseDatabase>()),
    );
    gh.factory<_i259.AbstractOrganizationRepo>(
      () => _i751.OrganizationRepo(gh<_i345.FirebaseDatabase>()),
    );
    gh.factory<_i825.AddOrganizationUseCase>(
      () => _i825.AddOrganizationUseCase(gh<_i259.AbstractOrganizationRepo>()),
    );
    gh.factory<_i799.AbstractAuthRepo>(
      () => _i704.AuthRepo(auth: gh<_i59.FirebaseAuth>()),
    );
    gh.factory<_i618.GetUserUseCase>(
      () => _i618.GetUserUseCase(gh<_i414.AbstractUserRepo>()),
    );
    gh.factory<_i823.IsAdminUseCase>(
      () => _i823.IsAdminUseCase(gh<_i414.AbstractUserRepo>()),
    );
    gh.lazySingleton<_i895.AdminBloc>(
      () => _i895.AdminBloc(gh<_i825.AddOrganizationUseCase>()),
    );
    gh.factory<_i410.LoginUseCase>(
      () => _i410.LoginUseCase(repo: gh<_i799.AbstractAuthRepo>()),
    );
    gh.lazySingleton<LoginBloc>(
      () => LoginBloc(gh<_i410.LoginUseCase>(), gh<_i618.GetUserUseCase>()),
    );
    return this;
  }
}

class _$InjectableModule extends _i562.InjectableModule {}
