import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:task/src/domain/entitiy/entitiy.dart';
import 'package:task/src/presentation/page/cubit/task_cubit.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return Expanded(
          child: state.listTask.isNotEmpty
              ? ListView.builder(
                  itemCount: state.listTask.length,
                  itemBuilder: (context, index) {
                    final todo = state.listTask[index];
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
                        subtitle: Text(todo.description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon:
                                  const Icon(Icons.edit, color: Colors.purple),
                            ),
                            IconButton(
                              onPressed: () {},
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
              : const Center(
                  child: Text(
                    "No tasks found",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
        );
      },
    );
  }
}
