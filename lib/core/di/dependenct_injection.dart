
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/presentation/cubit/sinup_cubit.dart';
import '../networking/firebase_service/firebase_auth_service.dart';

final getIt = GetIt.instance;

void setupGitIt() {
  getIt.registerLazySingleton<FirebaseAuthService>(()=> FirebaseAuthService());

  // Login DI
  getIt.registerLazySingleton<AuthRepoImpl>(() => AuthRepoImpl(getIt()));
  getIt.registerFactory<SinUpCubit>(()=> SinUpCubit(getIt())) ;
//
// //SinUp
//   getIt.registerLazySingleton<SinUpRepo>(() => SinUpRepo(getIt()));
//   getIt.registerFactory<SinupCubit>(()=> SinupCubit(getIt())) ;
//
//   //Home
//   // registers a type as Singleton by passing a factory function that will be called on the first call
//   getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
//
//   // كل مره بيكريت نسخه جديدة هو كدا مالوش لازمه
//   // registers a type so that a new instance will be created on each call of get
//   getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
//
//
}