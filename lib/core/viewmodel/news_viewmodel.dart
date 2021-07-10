
import 'package:bljr_mvvm/core/enums/viewstate.dart';
import 'package:bljr_mvvm/core/model/news.dart';
import 'package:bljr_mvvm/core/services/api.dart';
import 'package:bljr_mvvm/core/viewmodel/base_viewmodel.dart';
import 'package:bljr_mvvm/locator.dart';

class NewsViewModel extends BaseViewModel {

  ApiServices _api = locator<ApiServices>();

  List<News> news;

  Future getNews() async {
    setState(ViewState.Busy);
    news = await _api.getNews();
    notifyListeners();
    setState(ViewState.Idle);
  }

}
