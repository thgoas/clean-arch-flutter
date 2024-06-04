import 'package:dartz/dartz.dart';
import 'package:fin_ca/layers/domain/entities/group_entity.dart';
import 'package:fin_ca/layers/domain/erros/failure_get_group.dart';
import 'package:fin_ca/layers/domain/repositories/get_one_group_repository.dart';
import 'package:fin_ca/layers/domain/usecases/get_one_group_use_case_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetOneRepositoryMock extends Mock implements GetOneGroupRepository {}

void main() {
  late GetOneRepositoryMock repository;
  late GetOneGroupUseCaseImp usecase;
  final testGroup = GroupEntity(id: '1', description: 'desc', type: 'type');
  setUpAll(() {
    // Registre o comportamento esperado para argumentos não nulos
    registerFallbackValue('');
  });
  setUp(() {
    repository = GetOneRepositoryMock();
    usecase = GetOneGroupUseCaseImp(repository);
  });
  test('should return a group when the id is valid', () async {
    when(() => repository('1')).thenAnswer(
      (_) async => Right(testGroup),
    );
    final result = await usecase("1");

    expect(result, isA<Right>());
    expect(result, Right(testGroup));
  });

  test('should return a failureGroup when there is a failure', () async {
    when(() => repository(any())).thenAnswer(
      (_) async => Left(InvalidIdError()),
    );
    final result = await usecase("1");
    expect(result, isA<Left>());
    expect(result.fold(id, id), isA<InvalidIdError>());
  });
}
