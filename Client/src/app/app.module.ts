import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CarListComponent } from './car-list/car-list.component';
import { NavbarComponent } from './navbar/navbar.component';
import { LoginComponent } from './login/login.component';
import { FormsModule } from '@angular/forms';
import { CarFormComponent } from './car-form/car-form.component';
@NgModule({
  declarations: [
    AppComponent,
    CarListComponent,
    NavbarComponent,
    LoginComponent,
    CarFormComponent,
  ],
  imports: [BrowserModule, AppRoutingModule, HttpClientModule, FormsModule],
  providers: [],
  bootstrap: [
    AppComponent,
    CarListComponent,
    NavbarComponent,
    LoginComponent,
    CarFormComponent,
  ],
})
export class AppModule {}
