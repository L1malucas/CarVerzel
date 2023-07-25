import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { AuthService } from '../../../Services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  username: string = '';
  password: string = '';

  constructor(
    private http: HttpClient,
    private authService: AuthService,
    private router: Router
  ) {}

  onSubmit() {
    const loginData = {
      username: this.username,
      password: this.password,
    };

    this.http
      .post<any>('https://carverzelapi.azurewebsites.net/api/login', loginData)
      .subscribe(
        (response) => {
          if (response && response.token) {
            this.authService.setToken(response.token);
            console.log('validado');
            confirm('Usuário logado');
          } else {
            confirm('Usuário ou senha inválidos!s');
          }
          this.router.navigate(['']);
        },
        (error) => {
          console.error('Falha no login:', error);
          confirm('Falha no login');
        }
      );
  }
}
