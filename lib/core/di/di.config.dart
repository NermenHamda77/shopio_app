// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../api/api_services.dart' as _i394;
import '../../api/data_sources/auth/remote/auth_remote_data_source_impl.dart'
    as _i420;
import '../../api/dio/get_it_module.dart' as _i814;
import '../../data/data_sources/auth/remote/auth_remote_data_source.dart'
    as _i817;
import '../../data/repository/auth/auth_repository_impl.dart' as _i392;
import '../../domain/repositoy/auth/auth_repository.dart' as _i381;
import '../../domain/use_case/auth/login_use_case.dart' as _i408;
import '../../domain/use_case/auth/register_use_case.dart' as _i1020;
import '../../features/ui/auth/register/cubit/register_view_model.dart'
    as _i873;
import '../../features/ui/auth/sign_in/cubit/sign_in_view_model.dart' as _i1054;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.singleton<_i361.BaseOptions>(() => getItModule.baseOption);
    gh.singleton<_i528.PrettyDioLogger>(() => getItModule.prettyDioLogger);
    gh.singleton<_i394.ApiServices>(() => getItModule.apiServices);
    gh.singleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.factory<_i817.AuthRemoteDataSource>(
      () => _i420.AuthRemoteDataSourceImpl(gh<_i394.ApiServices>()),
    );
    gh.factory<_i381.AuthRepository>(
      () => _i392.AuthRepositoryImpl(gh<_i817.AuthRemoteDataSource>()),
    );
    gh.factory<_i408.LoginUseCase>(
      () => _i408.LoginUseCase(authRepository: gh<_i381.AuthRepository>()),
    );
    gh.factory<_i1020.RegisterUseCase>(
      () => _i1020.RegisterUseCase(authRepository: gh<_i381.AuthRepository>()),
    );
    gh.factory<_i873.RegisterViewModel>(
      () => _i873.RegisterViewModel(gh<_i1020.RegisterUseCase>()),
    );
    gh.factory<_i1054.SignInViewModel>(
      () => _i1054.SignInViewModel(gh<_i408.LoginUseCase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i814.GetItModule {}
