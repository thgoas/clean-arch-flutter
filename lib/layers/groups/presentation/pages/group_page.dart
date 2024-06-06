import 'package:fin_ca/layers/groups/presentation/controlles/group_controller.dart';
import 'package:fin_ca/layers/groups/presentation/states/group_page_state.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({super.key});

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  late final GroupController _groupController;
  final _inputText = TextEditingController();

  @override
  void initState() {
    super.initState();
    _groupController = GetIt.instance.get<GroupController>();
  }

  Future<void> _search() async {
    final text = _inputText.text;
    _groupController.getOneGroup(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grupo'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.00),
            child: TextField(
              controller: _inputText,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Buscar'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              child: Text('buscar'),
              onPressed: _search,
            ),
          ),
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: _groupController.state,
            builder: (context, state, _) {
              switch (state.runtimeType) {
                case const (GroupPageStartState):
                  return const Center(
                    child: Center(
                      child: Text('Sem dados'),
                    ),
                  );
                case const (GroupPageLoadingState):
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case const (GroupPageSuccessfulState):
                  final successFulState = state as GroupPageSuccessfulState;
                  return Center(
                    child: Text(successFulState.groupEntity.description),
                  );
                case const (GroupPageErrorState):
                  final errorState = state as GroupPageErrorState;
                  return Center(
                    child: Text(errorState.errorMessage),
                  );
                default:
                  return Container();
              }
            },
          ))
        ],
      ),
    );
  }
}
