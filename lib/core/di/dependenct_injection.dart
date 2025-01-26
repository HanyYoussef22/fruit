
import 'package:fruit/core/networking/firebase_service/firebase_store_service.dart';
import 'package:fruit/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/presentation/cubit/sinup_cubit/sinup_cubit.dart';
import '../networking/firebase_service/firebase_auth_service.dart';

final getIt = GetIt.instance;

void setupGitIt() {
  getIt.registerLazySingleton<FirebaseAuthService>(()=> FirebaseAuthService());
  getIt.registerLazySingleton<FirebaseStoreService>(()=> FirebaseStoreService());

  // Sin Up DI
  getIt.registerLazySingleton<AuthRepoImpl>(() => AuthRepoImpl(
    getIt<FirebaseAuthService>(),
    getIt<FirebaseStoreService>(),));
  getIt.registerFactory<SinUpCubit>(()=> SinUpCubit(getIt())) ;
//
// //Login
     getIt.registerFactory<LoginCubit>(()=> LoginCubit(getIt())) ;

//
}