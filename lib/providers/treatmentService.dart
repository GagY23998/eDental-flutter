import '../../models/treatment.dart';
import 'baseProvider.dart';

class TreatmentService extends BaseProvider<Treatment, Object> {
  TreatmentService({apiName = 'treatment', username = '', password = ''})
      : super(apiName, username, password);
}
