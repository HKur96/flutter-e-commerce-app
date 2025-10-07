import 'package:ecommerce_app/common/helper/api_helper.dart';
import 'package:ecommerce_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:ecommerce_app/features/auth/domain/use-case/auth_usecase.dart';
import 'package:ecommerce_app/features/counter/data/datasources/counter_datasource.dart';
import 'package:ecommerce_app/features/counter/data/repositories/counter_repository_impl.dart';
import 'package:ecommerce_app/features/counter/domain/repositories/counter_repository.dart';
import 'package:ecommerce_app/features/counter/domain/usecases/get_counter_usecase.dart';
import 'package:ecommerce_app/features/home/data/repository/home_repository_impl.dart';
import 'package:ecommerce_app/features/home/domain/repository/home_repository.dart';
import 'package:ecommerce_app/features/home/domain/use-case/home_usecase.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void initLocator() {
  locator.registerSingleton<ApiHelper>(ApiHelper(
    baseUrl: dotenv.env['BASE_URL_PROD']!,
  ));

  // REPOSITORY
  locator.registerLazySingleton<CounterRepository>(
    () => CounterRepositoryImpl(CounterDatasource()),
  );
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(locator()),
  );
  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(locator()),
  );

  // USECASE
  locator.registerLazySingleton<GetCounterUseCase>(
    () => GetCounterUseCase(locator()),
  );
  locator.registerLazySingleton<SignInUseCase>(() => SignInUseCase(locator()));
  locator.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(locator()));
  locator.registerLazySingleton<GetAllCategories>(
    () => GetAllCategories(locator()),
  );
}
