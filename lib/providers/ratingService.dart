import '../../models/rating.dart';
import 'baseProvider.dart';

class RatingService extends BaseProvider<Rating, Object> {
  RatingService({apiName = 'rating', username = '', password = ''})
      : super(apiName, username, password);
}
