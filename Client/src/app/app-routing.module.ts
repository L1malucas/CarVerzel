import { Component, NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './Components/Pages/login/login.component';
import { CarFormComponent } from './Components/Pages/car-form/car-form.component';
import { CarEditComponent } from './Components/Pages/car-edit/car-edit.component';
import { CarListComponent } from './Components/Pages/car-list/car-list.component';

const routes: Routes = [
  { path: '', component: CarListComponent },
  { path: 'login', component: LoginComponent },
  { path: 'add-car', component: CarFormComponent },
  { path: 'carros/:id', component: CarEditComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
