import 'package:common_dependency/common_dependency.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task/src/data/mapper/task_mapper.dart';
import 'package:task/src/data/model/request/task_data_model.dart';
import 'package:task/src/data/model/response/task_response_model.dart';
import 'package:task/src/data/repositoryimpl/task_repository_impl.dart';
import 'package:task/src/domain/entitiy/entitiy.dart';
import 'package:task/task.dart';
import 'package:test/test.dart';

class MockTaskLocalDataSource extends Mock implements TaskLocalDataSource {}

class MockTaskRemoteDataSource extends Mock implements TaskRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}
class FakeTaskItemModel extends Fake implements TaskItemModel {}
class FakeTaskDataModel extends Fake implements TaskDataModel {}


void main() {
  late MockTaskLocalDataSource mockLocalDataSource;
  late MockTaskRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late TaskRepositoryImpl repository;

  setUp(() {
    mockLocalDataSource = MockTaskLocalDataSource();
    mockRemoteDataSource = MockTaskRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = TaskRepositoryImpl(
      mockLocalDataSource,
      mockRemoteDataSource,
      mockNetworkInfo,
    );
    // Register fallback values for mocktail
    registerFallbackValue(FakeTaskItemModel());
    registerFallbackValue(FakeTaskDataModel());
  });

  group('deleteTask', () {
    const String taskId = '1';

    test('should delete task locally when offline', () async {
      // Arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(() => mockLocalDataSource.deleteTask(taskId))
          .thenAnswer((_) async => true);

      // Act
      final result = await repository.deleteTask(taskId);

      // Assert
      expect(result, const Right(true));
      verify(() => mockNetworkInfo.isConnected).called(1);
      verify(() => mockLocalDataSource.deleteTask(taskId)).called(1);
      verifyNever(() => mockRemoteDataSource.deleteTask(taskId));
    });

    test('should delete task both remotely and locally when online', () async {
      // Arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.deleteTask(taskId))
          .thenAnswer((_) async => true);
      when(() => mockLocalDataSource.deleteTask(taskId))
          .thenAnswer((_) async => true);

      // Act
      final result = await repository.deleteTask(taskId);

      // Assert
      expect(result, const Right(true));
      verify(() => mockNetworkInfo.isConnected).called(1);
      verify(() => mockRemoteDataSource.deleteTask(taskId)).called(1);
      verify(() => mockLocalDataSource.deleteTask(taskId)).called(1);
    });

    test('should return failure when remote deletion fails', () async {
      // Arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.deleteTask(taskId))
          .thenAnswer((_) async => false);

      // Act
      final result = await repository.deleteTask(taskId);

      // Assert
      expect(result, const Left(ErrorMessageFailure("Delete failed")));
      verify(() => mockNetworkInfo.isConnected).called(1);
      verify(() => mockRemoteDataSource.deleteTask(taskId)).called(1);
      verifyNever(() => mockLocalDataSource.deleteTask(taskId));
    });
  });

  group('saveTask', () {
    final task = TaskItemEntity(
      id: '1',
      title: 'Task 1',
      description: 'Description 1',
    );

    test('should save task locally when offline', () async {
      // Arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(() => mockLocalDataSource.addOrUpdateTask(any(), false))
          .thenAnswer((_) async => true);

      // Act
      final result = await repository.saveTask(task);

      // Assert
      expect(result, const Right(true));
      verify(() => mockNetworkInfo.isConnected).called(1);
      verify(() => mockLocalDataSource.addOrUpdateTask(any(), false)).called(1);
      verifyNever(() => mockRemoteDataSource.saveTask(any()));
    });

    test('should return Failure when saveTask fails locally', () async {
      // Arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(() => mockLocalDataSource.addOrUpdateTask(any(), false))
          .thenAnswer((_) async => false); // Simulate failure

      // Act
      final result = await repository.saveTask(task);

      // Assert
      expect(result, const Left(ErrorMessageFailure("Failed Save Data")));
    });

    test('should save task locally when offline', () async {
      // Arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(() => mockLocalDataSource.addOrUpdateTask(any(), false))
          .thenAnswer((_) async => true); // Ensure this mock returns true

      // Act
      final result = await repository.saveTask(task);

      // Assert
      expect(result, const Right(true));
    });
  });

  group('getTaskList', () {
    final localTasks = [
      const TaskItemEntity(
        id: '1',
        title: 'Task 1',
        description: 'Description 1',
        dueDate: '12 Jan 2025',
        status: TaskStatus.Pending,
      )
    ];

    test('should return local tasks when offline', () async {
      // Arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(() => mockLocalDataSource.getTask())
          .thenAnswer((_) async => Future.value(localTasks.map((e) => e.toModelLocal()).toList()));

      // Act
      final result = await repository.getTaskList();

      // Assert
      result.fold(
            (failure) => fail('Expected Right, got Left: $failure'),
            (actualTasks) {
          expect(actualTasks, localTasks);
        },
      );
    });

  });




}
