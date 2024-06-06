import 'package:fin_ca/layers/groups/domain/usecases/get_one%20_group_use_case.dart';
import 'package:fin_ca/layers/groups/presentation/states/group_page_state.dart';
import 'package:flutter/material.dart';

class GroupController {
  var state = ValueNotifier<GroupPageState>(GroupPageStartState());
  final GetOneGroupUseCase _getOneGroupUseCase;

  GroupController(this._getOneGroupUseCase);

  getOneGroup(String id) async {
    state.value = GroupPageLoadingState();
    var result = await _getOneGroupUseCase(id);
    result.fold((failure) {
      state.value = GroupPageErrorState(failure.message);
    }, (group) {
      state.value = GroupPageSuccessfulState(group);
    });
  }
}
