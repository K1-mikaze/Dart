class Person{
    String name;
    int age;

    Person(this.name,[this.age = 18]);

    // named Constructor
    Person.Guest() : name = 'Guest',age = 18;

    void showOutput(){
        print(name);
        print(age);
    }

}

void main(){
    Person person1 = Person("sergio",10);

    person1.showOutput();

    Person person2 = Person.Guest();
    person2.showOutput();
}