import {Component, inject, OnInit} from '@angular/core';
import {CompendiumApiService} from '../compendium-api.service';
import {IEntry} from '../../interfaces/IEntry';
import {NgForOf} from '@angular/common';
import {Entries} from '../entries';
import Keycloak from 'keycloak-js'

@Component({
  selector: 'app-entry-choice-list',
  imports: [
    NgForOf
  ],
  templateUrl: './entry-choice-list.component.html',
  styleUrl: './entry-choice-list.component.css'
})
export class EntryChoiceListComponent{

  protected entries: IEntry[] = [];
  protected message: string = "";

  protected keycloak = inject(Keycloak)

  constructor(private compendiumApiService: CompendiumApiService) {
  }

  getEntries(entry: Entries) {
    //empty before changing
    this.entries = [];
    this.compendiumApiService.getEntries(entry).subscribe((data) => {
      console.log(data);
      this.entries = data;
    })
  }

  //for html template (call with enums instead of multiple methods)
  protected readonly Entries = Entries;

  logOut() {
    this.keycloak.logout();
  }
}
