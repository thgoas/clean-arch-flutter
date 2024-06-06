import 'package:fin_ca/core/inject/inject.dart';
import 'package:fin_ca/layers/groups/presentation/controlles/group_controller.dart';
import 'package:fin_ca/layers/groups/presentation/states/group_page_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  Inject.init();
  test('should return a group id with 1', () async {
    final controller = GetIt.instance.get<GroupController>();

    await controller.getOneGroup('1');
    print(controller.state.value);
    expect(controller.state.value, isA<GroupPageSuccessfulState>());
    // expect(controller.state, '1');
  });
}
