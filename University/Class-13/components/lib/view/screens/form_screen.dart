import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  TextEditingController pruebaController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey(); // crea una clave para identificar el formulario 

  @override
  Widget build(BuildContext context) {
    //pruebaController.text = 'Probando un Controller Text';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Título de FormScreen'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const SizedBox(height: 12,),
              Container(
                alignment: Alignment.center,
                child: const Text('Controles generales',
                 style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),)
                  ),
              const SizedBox(height: 12,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    obscureText: true, // Hide Text
                    controller: pruebaController,
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Debe Agregar un texto';
                      }else{
                        return null;
                      }
                    },
                    //autofocus: true,
                    //initialValue: 'An initial Text',
                    onChanged: (value){ print(value);},
                    decoration: InputDecoration(
                      hintText: 'Hint Text',
                      labelText: 'Label (FLoating)',
                      helperText: "helper Text",
                      counterText: "x of y Characters used",
                      suffixIcon: Icon(Icons.rectangle_outlined),
                      prefixIcon: Icon(Icons.person_2_outlined),
                      icon: Icon(Icons.group),
                      border: OutlineInputBorder(
                        //borderRadius: BorderRadius.all(Radius.circular(10))
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green
                        )
                      )
                    ),
                  ),
                    const SizedBox(height: 12,),
                    TextFormField(),
                    const SizedBox(height: 12,),
                    FractionallySizedBox(
                      widthFactor: 0.8,
                    child: ElevatedButton(
                      onPressed: (){ 
                        if(!formkey.currentState!.validate()){
                          return;
                        }
                      },
                     child: Text("Launch",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900),),
                     ),
                  ),
                    ],
          ) 
        ),
      ),
  
    );
  }
}
