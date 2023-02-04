import '../../models/rating.dart';
import 'baseProvider.dart';

class RatingService extends BaseProvider<Rating> {
  RatingService({apiName = 'rating'}) : super(apiName);
}
