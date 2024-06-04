import 'package:fin_ca/layers/data/dtos/group_dto.dart';

abstract class GetOneGroupDataSource {
  Future<GroupDto> call(String id);
}
