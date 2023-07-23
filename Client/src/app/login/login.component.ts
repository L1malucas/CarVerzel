import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { AuthService } from '../Services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  username: string = '';
  password: string = '';

  constructor(private http: HttpClient, private authService: AuthService) {}

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
            this.authService.setToken(response.token);
            console.log('validado');
          }
        },
        (error) => {
          console.error('Falha no login:', error);
        }
      );
  }
}
