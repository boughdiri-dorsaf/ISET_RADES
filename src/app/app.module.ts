import { DashboardAdminComponent } from './Admin/dashboard/dashboard.component';

import { BrowserModule } from '@angular/platform-browser';
import {NgModule, NO_ERRORS_SCHEMA} from '@angular/core';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AdminComponent } from './layout/admin/admin.component';
import { SharedModule} from './shared/shared.module';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import { BrowserAnimationsModule} from '@angular/platform-browser/animations';
import { DashboardDefaultComponent } from './pages/dashboard/dashboard-default/dashboard-default.component';
import { SimplePageComponent } from './pages/simple-page/simple-page.component';
import { HomePageComponent } from './home-page/home-page.component';
import { ProfileComponent } from './pages/user/profile/profile.component';
import { PopupComponent } from './popup/popup.component';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AuthComponent } from './pages/auth/auth.component';
import { SignupComponent } from './pages/signup/signup.component';
import { HomeComponent } from './pages/home/home.component';
import { DashboardComponent } from './pages/dashboard/dashboard.component';
import {NgxPaginationModule} from 'ngx-pagination';
import { UserComponent } from './layout/user/user.component';
import { ResetpasswordComponent } from './pages/resetpassword/resetpassword.component';
import { HomepageAdComponent } from './Admin/homepage-ad/homepage-ad.component';
import { AuthAdminComponent } from './Admin/auth-admin/auth-admin.component';
import { EstablishementsComponent } from './Admin/establishements/establishements.component';
import { DepartmentComponent } from './Admin/department/department.component';

@NgModule({
  declarations: [
    AppComponent,AuthAdminComponent,DashboardAdminComponent,
    AdminComponent,
    DashboardDefaultComponent,
    SimplePageComponent,
    HomePageComponent,
    ProfileComponent,
    PopupComponent,
    AuthComponent,
    SignupComponent,
    HomeComponent,
    DashboardComponent,
    UserComponent,
    ResetpasswordComponent,
    HomepageAdComponent,
    AuthAdminComponent,
    EstablishementsComponent,
    DepartmentComponent,
  ],
  imports: [
    BrowserModule,NgbModule,NgxPaginationModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    SharedModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
  ],
  entryComponents: [PopupComponent],
  schemas: [ NO_ERRORS_SCHEMA ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
