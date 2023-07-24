import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { CarFormComponent } from './car-form/car-form.component';
import { CarListComponent } from './car-list/car-list.component';

const routes: Routes = [
  { path: '', redirectTo: 'car-list', pathMatch: 'full' }, // This line makes 'car-list' the default route
  // { path: 'car-list', component: CarListComponent },
  { path: 'login', component: LoginComponent },
  { path: 'add-car', component: CarFormComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
