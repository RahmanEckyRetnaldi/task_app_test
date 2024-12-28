import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:task/src/presentation/page/cubit/task_cubit.dart';

class FilterTask extends StatelessWidget {
  const FilterTask({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskCubit>();
    final theme = Theme.of(context);
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return Wrap(
          spacing: 10.0,
          children: state.filters.keys.map((filter) {
            return FilterChip(
              showCheckmark: false,
              label: Text(filter),
              selected: state.filters[filter]!,
              onSelected: (_) => cubit.toggleFilter(filter),
              selectedColor: theme.colorScheme.primary,
              labelStyle: TextStyle(
                color: state.filters[filter]! ? Colors.white : Colors.black,
              ),
              backgroundColor: Colors.grey[300],
            );
          }).toList(),
        );
      },
    );
  }
}
