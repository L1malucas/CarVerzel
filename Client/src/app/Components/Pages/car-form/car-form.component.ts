import { Component } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { AuthService } from '../../../Services/auth.service';
import { CarModel } from 'src/app/Models/car-model';
import { Router } from '@angular/router';

@Component({
  selector: 'app-car-form',
  templateUrl: './car-form.component.html',
  styleUrls: ['./car-form.component.css'],
})
export class CarFormComponent {
  modelo: string = '';
  marca: string = '';
  preco: number = 0;
  foto: string = '';

  constructor(private http: HttpClient, private router: Router) {}

  onSubmit(): void {
    const carData: CarModel = {
      carId: 0,
      modelo: this.modelo,
      marca: this.marca,
      preco: this.preco,
      foto: this.foto,
    };

    const apiUrl = 'https://carverzelapi.azurewebsites.net/api/carros';

    const token = new AuthService().getToken();

    const headers = new HttpHeaders({
      Authorization: `Bearer ${token}`,
    });

    this.http.post<CarModel>(apiUrl, carData, { headers }).subscribe(
      (response) => {
        console.log('Carro enviado:', response);

        this.modelo = '';
        this.marca = '';
        this.preco = 0;
        this.foto = '';

        this.router.navigate(['']);
      },
      (error) => {
        console.error('Erro ao enviar os dados request', error);
      }
    );
  }
}
