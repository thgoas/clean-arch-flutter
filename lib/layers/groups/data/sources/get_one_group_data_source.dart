import 'package:fin_ca/layers/groups/data/dtos/group_dto.dart';

abstract class GetOneGroupDataSource {
  Future<GroupDto?> call(String id);
}
