import 'package:fin_ca/layers/groups/data/erros/data_source_erros.dart';
import 'package:fin_ca/layers/groups/data/repositories/get_one_group_repository_imp.dart';
import 'package:fin_ca/layers/groups/data/sources/local/get_one_group_data_source_local.dart';
import 'package:fin_ca/layers/groups/domain/usecases/get_one_group_use_case_imp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final datasource = GetOneGroupDataSourceLocal();
  final repository = GetOneGroupRepositoryImp(datasource);
  final usecase = GetOneGroupUseCaseImp(repository);
  test('should return one group with id 1', () async {
    final result = await usecase('1');

    expect(result.fold((l) => l, (r) => r.id), '1');
  });

  test('should return a GetDataSourceError when id not exist', () async {
    final result = await usecase('4');

    expect(result.fold((l) => l, (r) => r), isA<NoElementDataSourceError>());
  });
}
