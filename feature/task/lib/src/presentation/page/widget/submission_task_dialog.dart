import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../domain/entitiy/entitiy.dart';

class SubmissionTaskDialog extends StatefulWidget {
  final bool isEdit;
  final TaskItemEntity? initialData;

  const SubmissionTaskDialog({
    Key? key,
    this.isEdit = false,
    this.initialData,
  }) : super(key: key);

  @override
  _SubmissionTaskDialogState createState() => _SubmissionTaskDialogState();
}

class _SubmissionTaskDialogState extends State<SubmissionTaskDialog> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController dueDateController;
  TaskStatus selectedStatus = TaskStatus.Pending;
  String? titleError;
  String? dueDateError;

  @override
  void initState() {
    super.initState();
    titleController =
        TextEditingController(text: widget.initialData?.title ?? '');
    descriptionController =
        TextEditingController(text: widget.initialData?.description ?? '');
    dueDateController =
        TextEditingController(text: widget.initialData?.dueDate ?? '');
    selectedStatus = widget.initialData?.status ?? TaskStatus.Pending;
  }

  void validateAndSubmit() {
    setState(() {
      // Reset Error
      titleError = null;
      dueDateError = null;

      // Validasi Title
      if (titleController.text.isEmpty) {
        titleError = 'Title is required';
      }

      // Validasi Due Date
      if (dueDateController.text.isEmpty) {
        dueDateError = 'Due date is required';
      }

      // Jika Tidak Ada Error, Kirim Data
      if (titleError == null && dueDateError == null) {
        context.pop({
          'title': titleController.text,
          'dueDate': dueDateController.text,
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title (Add or Edit Task)
              Text(
                widget.isEdit ? 'Edit Task' : 'Add Task',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 16),

              // Title TextField
              BaseInputField(
                controller: titleController,
                label: 'Title',
                hintText: "Enter title",
                isPasswordField: false,
                alert: titleError ??'',
                inputFormatter: [LengthLimitingTextInputFormatter(50)],
                maxLength: 50,
              ).margin(bottom: 16),

              // Description TextField
              BaseInputField(
                controller: descriptionController,
                label: 'Description',
                hintText: "Enter Description",
                isPasswordField: false,
                minLines: 4,
                maxLines: 6,
              ).margin(bottom: 16),

              // Due Date Picker
              DueDatePicker(
                controller: dueDateController,
                errorMessage: dueDateError ?? '',
              ).margin(bottom: 16),

              // Status Dropdown
              BaseDropdown<TaskStatus>(
                value: selectedStatus,
                items: const [
                  TaskStatus.Pending,
                  TaskStatus.InProgress,
                  TaskStatus.Completed
                ],
                onChanged: (value) {
                  setState(() {
                    selectedStatus = value;
                  });
                },
                itemToString: (item) => item.name,
              ).margin(bottom: 24),

              // Add/Edit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: validateAndSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    widget.isEdit ? 'Save Changes' : 'ADD',
                    style:
                        TaskTypography.sm.copyWith(color: AppColors.background),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
