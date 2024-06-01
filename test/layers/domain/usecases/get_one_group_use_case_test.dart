import 'package:dartz/dartz.dart';
import 'package:fin_ca/layers/domain/entities/group.dart';
import 'package:fin_ca/layers/domain/repositories/get_one_group_repository.dart';
import 'package:fin_ca/layers/domain/usecases/get_one_group_use_case_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class GetOneRepositoryMock extends Mock implements GetOneGroupRepository {}

void main() {
  final repository = GetOneRepositoryMock();
  final usecase = GetOneGroupUseCaseImp(repository);
  test('should return one group', () async {
    when(repository.getOneGroup('1')).thenAnswer(
      (_) async => Right(
          {"id": "1", "description": "description", "type": "type"} as Group),
    );
    final result = await usecase("1");

    expect(result, isA<Right>());
    // expect(result, isA<Group>());
  });
}
