import 'package:dartz/dartz.dart';
import 'package:fin_ca/layers/groups/data/erros/data_source_erros.dart';
import 'package:fin_ca/layers/groups/data/sources/get_one_group_data_source.dart';
import 'package:fin_ca/layers/groups/domain/entities/group_entity.dart';
import 'package:fin_ca/layers/groups/domain/erros/failure_get_group.dart';
import 'package:fin_ca/layers/groups/domain/repositories/get_one_group_repository.dart';

class GetOneGroupRepositoryImp implements GetOneGroupRepository {
  final GetOneGroupDataSource getOneGroupDataSource;

  GetOneGroupRepositoryImp(this.getOneGroupDataSource);
  @override
  Future<Either<FailureGroup, GroupEntity>> call(String id) async {
    try {
      final result = await getOneGroupDataSource(id);
      if (result == null) {
        return Left(NoElementDataSourceError('No data found'));
      }
      return Right(result);
    } on NoElementDataSourceError {
      return Left(NoElementDataSourceError('No data found'));
    } catch (e) {
      return Left(NoElementDataSourceError('Unknown error occurred'));
    }
  }
}
