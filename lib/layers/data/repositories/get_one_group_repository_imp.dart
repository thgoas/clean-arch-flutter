import 'package:dartz/dartz.dart';
import 'package:fin_ca/layers/data/erros/data_source_erros.dart';
import 'package:fin_ca/layers/data/sources/get_one_group_data_source.dart';
import 'package:fin_ca/layers/domain/entities/group_entity.dart';
import 'package:fin_ca/layers/domain/erros/failure_get_group.dart';
import 'package:fin_ca/layers/domain/repositories/get_one_group_repository.dart';

class GetOneGroupRepositoryImp implements GetOneGroupRepository {
  final GetOneGroupDataSource getOneGroupDataSource;

  GetOneGroupRepositoryImp(this.getOneGroupDataSource);
  @override
  Future<Either<FailureGroup, GroupEntity>> call(String id) async {
    try {
      final result = await getOneGroupDataSource(id);
      return Right(result);
    } catch (e) {
      print(e);
      return Left(GetDataSourceError());
    }
  }
}
