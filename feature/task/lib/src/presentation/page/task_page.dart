import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/src/domain/repositories/home_navigation_repository.dart';
import 'package:task/src/presentation/page/cubit/task_cubit.dart';
import 'package:task/src/presentation/page/widget/filter_task.dart';
import 'package:task/src/presentation/page/widget/input_search_field.dart';
import 'package:task/src/presentation/page/widget/submission_task_dialog.dart';
import 'package:task/src/presentation/page/widget/task_list_view.dart';

import '../../domain/entitiy/entitiy.dart';

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
        color: AppColors.neutral50,
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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'TASK APP',
                    style: TaskTypography.xl
                        .merge(const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  TextButton(
                      onPressed: () {
                        context.read<TaskCubit>().logout(() {
                          di<HomeNavigationRepository>().goToLogin(context);
                        });
                      },
                      child: Text(
                        'Logout',
                        style: TaskTypography.md.merge(
                            const TextStyle(fontWeight: FontWeight.bold)),
                      ))
                ],
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
                      child: Column(
                        children: [
                          InputSearchField(
                            controller: searchController,
                            focusNode: _focusNodeSearch,
                            onChanged: (value) {
                              context.read<TaskCubit>().onSearchChanged(value);
                            },
                            onSearchClicked: () {},
                          ).margin(
                            bottom: 8
                          ),
                          const FilterTask()
                        ],
                      ),
                    ),
                    const TaskListView(),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showAddTaskDialog(
                  context,
                  false,
                  const TaskItemEntity(),
                  (p0) {
                    context.read<TaskCubit>().addNewTask(p0);
                  },
                );
              },
              backgroundColor: Colors.purple[300],
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

void showAddTaskDialog(
  BuildContext context,
  bool isEdit,
  TaskItemEntity? data,
  Function(TaskItemEntity) onResult,
) async {
  final result = await showDialog(
    context: context,
    builder: (BuildContext context) => SubmissionTaskDialog(
      isEdit: isEdit,
      initialData: data,
    ),
  );

  if (result != null) {
    onResult(result);
  }
}
