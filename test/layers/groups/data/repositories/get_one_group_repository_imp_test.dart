import 'package:dartz/dartz.dart';
import 'package:fin_ca/layers/groups/data/dtos/group_dto.dart';
import 'package:fin_ca/layers/groups/data/erros/data_source_erros.dart';
import 'package:fin_ca/layers/groups/data/repositories/get_one_group_repository_imp.dart';
import 'package:fin_ca/layers/groups/data/sources/get_one_group_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetOneGroupDataSourceMock extends Mock implements GetOneGroupDataSource {}

void main() {
  late GetOneGroupDataSourceMock getOneGroupDataSource;
  late GetOneGroupRepositoryImp repository;
  final resultGroup = GroupDto(id: '1', description: 'desc', type: 'type');
  setUpAll(() {
    // Registre o comportamento esperado para argumentos não nulos
    registerFallbackValue('');
  });
  setUp(() {
    getOneGroupDataSource = GetOneGroupDataSourceMock();
    repository = GetOneGroupRepositoryImp(getOneGroupDataSource);
  });
  test('should return a getOneGroup', () async {
    when(() => getOneGroupDataSource('1')).thenAnswer((_) async => resultGroup);
    final result = await repository('1');

    expect(result, isA<Right>());
    expect(result, Right(resultGroup));
  });

  test('should return a DataSourceError if the data source failure', () async {
    when(() => getOneGroupDataSource('1')).thenThrow(Exception());
    final result = await repository('1');

    expect(result, isA<Left>());
    expect(result.fold(id, id), isA<NoElementDataSourceError>());
  });
}
