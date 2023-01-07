import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ndzdogapi/src/cubit/repository.dart';

part 'dog_state.dart';

class DogCubit extends Cubit<DogState> {
  DogCubit() : super(DogInitial()){
    getData();
  }

  DogRepo repository=DogRepo();
  Future getData() async{
   emit(DogLoading());
   try{
     final response=await repository.fetchData();
     String message=response.message;
     String status=response.status;

     emit(DogLoaded(message,status));
   }catch(ex){
     DogError();
   }

  }
}
