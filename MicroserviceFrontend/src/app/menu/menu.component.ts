import {Component, inject} from '@angular/core';
import Keycloak from 'keycloak-js';
import {RouterLink} from '@angular/router';
import {NgIf} from '@angular/common';

@Component({
  selector: 'app-menu',
  imports: [
    RouterLink,
    NgIf
  ],
  templateUrl: './menu.component.html',
  styleUrl: './menu.component.css'
})
export class MenuComponent {

  private readonly keycloak = inject(Keycloak);

  isLoggedIn: boolean | undefined = false;

  async ngOnInit() {
    this.isLoggedIn = this.keycloak.authenticated;
  }

  logout() {
    this.keycloak.logout();
  }

  login(){
    this.keycloak.login();
  }
}
