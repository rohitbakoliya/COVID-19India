
import 'package:covid_19/service/service.dart';
import 'package:covid_19/utils/init_get_it.dart';

class HomeViewModel {
  Map data = {};


  DataService service;
  HomeViewModel(){
    service = getIt<DataService>();
  }

  setData(value){
    data = value;
  }

  Future<Null> onAppStart() async{
    await service.getData().then((value){
      setData(value);
    });
  }
}