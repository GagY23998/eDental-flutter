import '../../models/payment.dart';
import 'baseProvider.dart';

class PaymentService extends BaseProvider<Payment, Object> {
  PaymentService({apiName = 'payment', username = '', password = ''})
      : super(apiName, username, password);
}
