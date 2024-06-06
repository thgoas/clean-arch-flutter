import 'package:fin_ca/core/inject/inject.dart';
import 'package:fin_ca/layers/groups/presentation/controlles/group_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  Inject.init();

  test('test injection', () async {
    final controller = GetIt.instance.get<GroupController>();

    expect(controller, isA<GroupController>());
  });
}
