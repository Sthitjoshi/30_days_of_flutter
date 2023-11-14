import 'package:basics_of_flutter_30days/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white ,
      child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/login.png.png",fit: BoxFit.cover),
          const SizedBox(
            height: 20,
          ),
          const Text(
              "Welcome",
            style: TextStyle(
              fontSize:25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16,vertical:32),
            child: Column(
              children: [
                TextFormField(

                  decoration: const InputDecoration(
                    hintText: "Enter UserName",
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  obscureText:true,
                  decoration: const InputDecoration(
                    hintText: "EnterPassword",
                    labelText: "Password",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: (){
                     Navigator.pushNamed(context,myRoutes.homeRoutes);
                    },
                      style:TextButton.styleFrom(minimumSize:const Size(130, 40)),
                    child:const Text("Login"),
                )
              ],
            ),
            ),

        ],
    ),
      ),
    );
  }
}

