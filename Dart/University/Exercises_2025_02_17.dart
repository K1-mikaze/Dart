// Ejercicio #1
List<int> ShowPrimeNumbersTill50(int n) {
  if (n < 2) return [];
  List<bool> prime = List.filled(n + 1, true);
  prime[0] = prime[1] = false; // 0 y 1 no son primos

  for (int i = 2; i * i <= n; i++) {
    if (prime[i]) {
      for (int j = i * i; j <= n; j += i) {
        prime[j] = false;
      }
    }
  }
  List<int> primeNumbers = [];
  for (int i = 2; i <= n; i++) {
    if (prime[i]) {
      primeNumbers.add(i);
    }
  }

  return primeNumbers;
}
// Ejercicio #2
void Factorial_Number(int Number_Find,[int value = 1,int count = 1]){
  value = value * count;
  if(value == Number_Find){
    print("El factorial del numero es : $count");
  }else if(value > Number_Find){
    print("El numero no tiene un factorial en los naturales");
  }else {
    Factorial_Number(Number_Find, value,count+1);
  }
}
void main(){
  print(ShowPrimeNumbersTill50(50));
}