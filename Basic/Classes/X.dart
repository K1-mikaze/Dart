class X{
    final name; // type will be defined by infered value
    static const int age = 10;

    X(this.name);

}

void main(){

    X object = X("coso");

    print(object.name);
}