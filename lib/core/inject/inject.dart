import 'package:fin_ca/layers/groups/domain/usecases/get_one%20_group_use_case.dart';
import 'package:fin_ca/layers/groups/domain/usecases/get_one_group_use_case_imp.dart';
import 'package:fin_ca/layers/groups/data/repositories/get_one_group_repository_imp.dart';
import 'package:fin_ca/layers/groups/data/sources/get_one_group_data_source.dart';
import 'package:fin_ca/layers/groups/data/sources/local/get_one_group_data_source_local.dart';
import 'package:fin_ca/layers/groups/domain/repositories/get_one_group_repository.dart';
import 'package:fin_ca/layers/groups/presentation/controlles/group_controller.dart';

import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //datasources
    getIt.registerLazySingleton<GetOneGroupDataSource>(
        () => GetOneGroupDataSourceLocal());
    //repositories
    getIt.registerLazySingleton<GetOneGroupRepository>(
        () => GetOneGroupRepositoryImp(getIt()));
    //usecases
    getIt.registerLazySingleton<GetOneGroupUseCase>(
        () => GetOneGroupUseCaseImp(getIt()));
    //controlles
    getIt.registerFactory<GroupController>(() => GroupController(getIt()));
  }
}
