import 'package:fin_ca/layers/data/dtos/group_dto.dart';
import 'package:fin_ca/layers/data/sources/get_one_group_data_source.dart';

class GetOneGroupDataSourceLocal implements GetOneGroupDataSource {
  @override
  Future<GroupDto> call(String id) async {
    final where = groups.where((w) => w['id'] == id).first;
    final result = GroupDto.fromMap(where);

    return result;
  }
}

final groups = [
  {"id": "1", "description": "group 1", "type": "group type 1"},
  {"id": "2", "description": "group 2", "type": "group type 2"},
  {"id": "3", "description": "group 3", "type": "group type 3"},
] as List<Map<String, dynamic>>;
