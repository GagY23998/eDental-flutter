import 'package:edental/providers/baseProvider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/dentist.dart';

class DentistService extends BaseProvider<Dentist> {
  DentistService({apiName = 'dentist'}) : super(apiName);
}
