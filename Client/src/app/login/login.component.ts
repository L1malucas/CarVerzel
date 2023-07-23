import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  username: string = '';
  password: string = '';

  constructor(private http: HttpClient) {}

  onSubmit() {
    const loginData = {
      username: this.username,
      password: this.password,
    };

    this.http
      .post<any>('https://localhost:7094/api/login', loginData)
      .subscribe(
        (response) => {
         
          if (response && response.token) {
            
            localStorage.setItem('token', response.token);
            console.log('validado')
          }
        },
        (error) => {
         
          console.error('Falha no login:', error);
        }
      );
  }
}
