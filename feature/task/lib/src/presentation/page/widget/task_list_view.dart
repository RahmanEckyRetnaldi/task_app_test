import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:task/src/domain/entitiy/entitiy.dart';
import 'package:task/src/presentation/page/cubit/task_cubit.dart';

import '../../../../task.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return Expanded(
          child: state.listFiltered.isNotEmpty
              ? ListView.builder(
                  itemCount: state.listFiltered.length,
                  itemBuilder: (context, index) {
                    final todo = state.listFiltered[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                        title: Text(
                          todo.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(todo.description).margin(bottom: 4),
                            Text(
                              'Due Date: ${todo.dueDate}',
                              style: TaskTypography.xs
                                  .copyWith(color: AppColors.neutral40),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                showAddTaskDialog(context, true, todo, (p0) {
                                  context.read<TaskCubit>().updateTask(p0);
                                });
                              },
                              icon:
                                  const Icon(Icons.edit, color: Colors.purple),
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<TaskCubit>().deleteTask(todo.id);
                              },
                              icon: const Icon(Icons.delete, color: Colors.red),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.check_circle,
                                  color: (todo.status == TaskStatus.InProgress)
                                      ? AppColors.neutral40
                                      : (todo.status == TaskStatus.Pending)
                                          ? Colors.amberAccent
                                          : Colors.green),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    "No tasks found",
                    style:
                        TaskTypography.sm.copyWith(color: AppColors.neutral40),
                  ),
                ),
        );
      },
    );
  }
}
