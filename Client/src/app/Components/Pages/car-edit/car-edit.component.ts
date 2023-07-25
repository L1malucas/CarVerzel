import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { CarModel } from 'src/app/Models/car-model';
import { AuthService } from '../../../Services/auth.service';

@Component({
  selector: 'app-car-edit',
  templateUrl: './car-edit.component.html',
  styleUrls: ['./car-edit.component.css'],
})
export class CarEditComponent implements OnInit {
  car!: CarModel;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private http: HttpClient,
    private authService: AuthService
  ) {}

  ngOnInit() {
    this.route.paramMap.subscribe((params) => {
      const carId = Number(params.get('id'));
      console.log('carid is ' + carId);
      if (!isNaN(carId)) {
        this.fetchCarData(carId);
      }
    });
  }

  fetchCarData(carId: number) {
    const apiUrl = `https://carverzelapi.azurewebsites.net/api/carros/${carId}`;
    this.http.get<CarModel>(apiUrl).subscribe(
      (data) => {
        this.car = data;
      },
      (error) => {
        console.error('Erro na request:', error);
      }
    );
  }

  saveCar() {
    if (!confirm('Tem certeza que deseja salvar este carro?')) {
      return;
    }
    const apiUrl = `https://carverzelapi.azurewebsites.net/api/carros/${this.car.carId}`;
    const token = this.authService.getToken();
    if (!token) {
      console.log('Necessário login para salvar');
      return;
    }

    const headers = new HttpHeaders({
      Authorization: `Bearer ${token}`,
    });

    this.http.put(apiUrl, this.car, { headers }).subscribe(
      () => {
        console.log('Carro atualizado com sucesso!');
        this.navigateToCarList();
      },
      (error) => {
        console.error('Erro na requisição:', error);
      }
    );
  }

  deleteCar() {
    if (!confirm('Tem certeza que deseja excluir este carro?')) {
      return;
    }

    const apiUrl = `https://carverzelapi.azurewebsites.net/api/carros/${this.car.carId}`;
    const token = this.authService.getToken();
    if (!token) {
      console.log('Necessário login para excluir');
      return;
    }

    const headers = new HttpHeaders({
      Authorization: `Bearer ${token}`,
    });

    this.http.delete(apiUrl, { headers }).subscribe(
      () => {
        console.log('Carro excluído com sucesso!');
        this.navigateToCarList();
      },
      (error) => {
        console.error('Erro na requisição:', error);
      }
    );
  }

  navigateToCarList() {
    this.router.navigate(['']);
  }
}
