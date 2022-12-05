import '../../../data/provider/api.dart';

class HomeRepository {
  final MyApi api;

  HomeRepository(this.api);

  getDashboard() => api.getDashboard();
  getSearch(q) => api.getSearch(q);
}
