void main(){
  int value = 0;
  try{
    if(value <= 0){
      throw Exception('Value must be greater than 0');
    }
    print(value);
  }catch(e){
    print(e);
  }finally{
    var result = 10/0; 
  }
}