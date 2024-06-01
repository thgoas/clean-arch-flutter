import 'package:dartz/dartz.dart';
import 'package:fin_ca/layers/domain/entities/group.dart';
import 'package:fin_ca/layers/domain/erros/failure_get_group.dart';
import 'package:fin_ca/layers/domain/repositories/get_one_group_repository.dart';
import 'package:fin_ca/layers/domain/usecases/get_one%20_group_use_case.dart';

class GetOneGroupUseCaseImp implements GetOneGroupUseCase {
  final GetOneGroupRepository _repository;

  GetOneGroupUseCaseImp(this._repository);
  @override
  Future<Either<FailureGetGroup, Group>> call(String id) async {
    return _repository.getOneGroup(id);
  }
}
