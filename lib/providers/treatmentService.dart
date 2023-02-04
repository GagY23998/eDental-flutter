import '../../models/treatment.dart';
import 'baseProvider.dart';

class TreatmentService extends BaseProvider<Treatment> {
  TreatmentService({apiName = 'treatment'}) : super(apiName);
}
