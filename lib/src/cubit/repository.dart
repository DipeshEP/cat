import 'package:ndzdogapi/src/model/api_helper.dart';
import 'package:ndzdogapi/src/model/model.dart';

class DogRepo{
  Future<DogList>fetchData()async{
    const route="breeds/image/random";

    var response=await ApiHelper.internal().getRequest(route);
    return response;

  }
}