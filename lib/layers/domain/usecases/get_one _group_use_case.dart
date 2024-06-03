import 'package:fin_ca/layers/domain/entities/group.dart';
import 'package:dartz/dartz.dart';
import 'package:fin_ca/layers/domain/erros/failure_get_group.dart';

abstract class GetOneGroupUseCase {
  Future<Either<FailureGroup, Group>> call(String id);
}
