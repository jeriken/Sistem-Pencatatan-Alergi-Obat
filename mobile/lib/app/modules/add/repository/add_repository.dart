import '../../../data/provider/api.dart';

class AddRepository {
  final MyApi api;

  AddRepository(this.api);

  getRelation() => api.getRelation();
  sendData(data) => api.sendData(data);
  sendKtp(data) => api.sendKtp(data);
  sendBpjs(data) => api.sendBpjs(data);
  sendObat(data) => api.sendObat(data);
}
