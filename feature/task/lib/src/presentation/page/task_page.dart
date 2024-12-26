import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/src/presentation/page/cubit/task_cubit.dart';
import 'package:task/src/presentation/page/widget/input_search_field.dart';
import 'package:task/src/presentation/page/widget/task_list_view.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<TaskCubit>()..init(),
      child: const TaskUI(),
    );
  }
}

class TaskUI extends StatefulWidget {
  const TaskUI({super.key});

  @override
  State<TaskUI> createState() => _TaskUIState();
}

class _TaskUIState extends State<TaskUI> {
  final searchController = TextEditingController();
  late FocusNode _focusNodeSearch;

  @override
  void initState() {
    super.initState();
    _focusNodeSearch = FocusNode();
  }

  @override
  void dispose() {
    // Dispose controllers and focus nodes to avoid memory leaks
    searchController.dispose();
    _focusNodeSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage<TaskCubit, TaskState>(
      customLoading: const BaseLoadingAnimation(
        color: AppColors.background,
      ),
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle.light,
              backgroundColor: Colors.purple[300],
              elevation: 0,
              title: Text(
                'TASK APP',
                style: TaskTypography.xl
                    .merge(const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            extendBodyBehindAppBar: true,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    //welcome
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: InputSearchField(
                        controller: searchController,
                        focusNode: _focusNodeSearch,
                        onChanged: (value) {},
                        onSearchClicked: () {},
                      ),
                    ),
                    const TaskListView(),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.purple[300],
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
