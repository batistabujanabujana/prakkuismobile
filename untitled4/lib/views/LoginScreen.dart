import 'package:flutter/material.dart';
import 'package:untitled4/views/listGroceries.dart';


class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}
class _LoginScreenState extends State<LoginScreen> {
  String username = "";
  String password = "";
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Icon(Icons.login, color: Colors.white,),
        title: Text("Login Page", style: TextStyle(
          color: Colors.white,
        )),
        actions: <Widget>[
          Icon(Icons.access_alarm, color: Colors.white,),
          Icon(Icons.access_alarm_rounded, color: Colors.cyan,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/image/apa.jpg'),
                SizedBox(height: 30),
                SizedBox(
                  width: 1000,
                  child: TextFormField(
                    onChanged: (value){
                      username = value;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20), // Atur padding konten
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                          color: (isLogin) ? Colors.green : Colors.red,
                        ),
                      ),
                      hintText: 'Masukan Username',
                      labelText: 'Username',
                    ),
                    onSaved: (String? value) {
                    },
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 1000,
                  child: TextFormField(
                    onChanged: (value){
                      password = value;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10), // Atur padding konten
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: (isLogin) ? Colors.green : Colors.red,
                        ),
                      ),
                      hintText: 'Masukan Password',
                      labelText: 'Password',
                    ),
                    onSaved: (String? value) {
                    },
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 1000,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      String text ="";
                      SnackBar snackBar;
                      if(username=="paijo" && password=="1234"){
                        setState(() {
                          text="Login Sukses Bolo";
                          snackBar = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(text,
                              style:TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ) ,),
                            backgroundColor: Colors.green,
                          );
                          isLogin=true;
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context){
                                return ListGroceries();
                              }
                          ));
                        });
                      }else{
                        setState(() {
                          text="Login e salah";
                          snackBar = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(text,
                              style:TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ) ,),
                            backgroundColor: Colors.red,
                          );
                          isLogin=false;
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      }
                    },
                    color: Colors.black,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextButton(
                  onPressed: (){},
                  child: Text("Forgot Password?",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
