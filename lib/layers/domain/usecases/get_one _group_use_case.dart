import 'package:fin_ca/layers/domain/entities/group_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:fin_ca/layers/domain/erros/failure_get_group.dart';

abstract class GetOneGroupUseCase {
  Future<Either<FailureGroup, GroupEntity>> call(String id);
}
