import 'package:health/health.dart';

class HealthService {
  late HealthFactory health;

  int steps = 0, lifeTimeSteps = 0;

  HealthService() {
    health = HealthFactory(useHealthConnectIfAvailable: true);
  }

  Future<void> init() async {
    var types = [
      HealthDataType.STEPS,
    ];

    // requesting access to the data types before reading them
    await health.requestAuthorization(types);
    await fetchStepData();
  }

  Future<void> fetchStepData() async {
    var now = DateTime.now();
    lifeTimeSteps = await health.getTotalStepsInInterval(DateTime(2020, 1, 1), now) ?? 0;

    // get the number of steps for today
    var midnight = DateTime(now.year, now.month, now.day);
    steps = await health.getTotalStepsInInterval(midnight, now) ?? 0;
  }
}
