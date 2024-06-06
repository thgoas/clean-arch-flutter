import 'package:fin_ca/layers/groups/data/dtos/group_dto.dart';
import 'package:fin_ca/layers/groups/data/erros/data_source_erros.dart';
import 'package:fin_ca/layers/groups/data/sources/get_one_group_data_source.dart';

class GetOneGroupDataSourceLocal implements GetOneGroupDataSource {
  @override
  Future<GroupDto?> call(String id) async {
    try {
      final where = groups.where((w) => w['id'] == id);
      if (where.isEmpty) {
        return null;
      }
      final result = GroupDto.fromMap(where.first);

      return result;
    } catch (e) {
      throw EmptyResultException(e.toString());
    }
  }
}

final groups = [
  {"id": "1", "description": "group 1", "type": "group type 1"},
  {"id": "2", "description": "group 2", "type": "group type 2"},
  {"id": "3", "description": "group 3", "type": "group type 3"},
] as List<Map<String, dynamic>>;
