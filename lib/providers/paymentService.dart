import '../../models/payment.dart';
import 'baseProvider.dart';

class PaymentService extends BaseProvider<Payment> {
  PaymentService({apiName = 'payment'}) : super(apiName);
}
