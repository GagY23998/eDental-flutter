import 'package:edental/providers/baseProvider.dart';
import '../../models/report.dart';

class ReportService extends BaseProvider<Report> {
  ReportService({apiName = 'report'}) : super(apiName);
}
