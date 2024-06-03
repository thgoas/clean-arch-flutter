import 'package:dartz/dartz.dart';
import 'package:fin_ca/layers/domain/entities/group_entity.dart';
import 'package:fin_ca/layers/domain/erros/failure_get_group.dart';

abstract class GetOneGroupRepository {
  Future<Either<FailureGroup, GroupEntity>> getOneGroup(String id);
}
