class AppState {
 

   bool isLogin;
   bool isEmpty ;
   AppState(this.isLogin);

  bool get isLogged => isLogin == true;  
}
