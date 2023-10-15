import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/login', //set the initial route
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/Forget_password': (context) => ForgetPasswordPage(),
      },
    ),
  );
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = '';

  void _login(){
    String username = _usernameController.text;
    String password = _passwordController.text;

    //jika dan jika
    if(username=='cobanama' && password=='cobapw'){
      setState((){
        _errorMessage='';
      });
      //login berhasil akan ke homepage
      Navigator.pushReplacementNamed(context, '/home');
    }
    else{
      setState(() {
        _errorMessage='username atau password salah';
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('images/logo.png'),
            fit: BoxFit.cover,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'password'),
            ),
            ElevatedButton(onPressed: _login, child: Text('Login'),
            ),
            if(_errorMessage.isNotEmpty)
              Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
              ),
            TextButton(
              onPressed:(){
                Navigator.pushNamed(context,'/Forget_password');
              //untuk forget password
              },
                child: Text('Forget password?')
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'welcome orang terpilih,',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'hanya kamu yang tahu passwordnya !!!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context,'/login');
            },
                child: Text('back to login'),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgetPasswordPage extends StatefulWidget {

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State< ForgetPasswordPage > {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String _errorMessage = '';

  void _submitNewPassword() {
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (newPassword == confirmPassword) {
      setState(() {
        _errorMessage = '';
        // Implement password update logic here.

        // After updating the password, pop the current page to return to the login page.
        Navigator.pop(context,'/login');
      });
    } else {
      setState(() {
        _errorMessage = 'Password does not match';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'new password'),
            ),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'confirm password'),
            ),
            ElevatedButton(
                onPressed: _submitNewPassword,
                child: Text('submit'),
            ),
            if(_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
