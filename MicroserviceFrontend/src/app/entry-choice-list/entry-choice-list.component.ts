import {Component, inject} from '@angular/core';
import {CompendiumApiService} from '../compendium-api.service';
import {IEntry} from '../../interfaces/IEntry';
import {NgForOf, NgIf} from '@angular/common';
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

  protected readonly Entries = Entries; // enum for template
  protected entries: IEntry[] = [];
  protected message: string = "";
  protected currentEntry: Entries = Entries.spells;
  protected pageNumber: number = 1;
  protected totalPages: number = 0;

  protected keycloak = inject(Keycloak)

  constructor(private compendiumApiService: CompendiumApiService) {
  }

  selectEntry(entry: Entries) {
    this.currentEntry = entry;
    this.message = entry.charAt(0).toUpperCase() + entry.slice(1) + ":";
    this.pageNumber = 1;
    this.loadEntries();
  }

  prevPage() {
    if (this.pageNumber > 1) {
      this.pageNumber--;
      this.loadEntries();
    }
  }

  nextPage() {
    if (this.pageNumber < this.totalPages) {
      this.pageNumber++;
      this.loadEntries();
    }
  }

  loadEntries() {
    this.entries = [];
    this.compendiumApiService.getEntries(this.currentEntry, this.pageNumber).subscribe((page) => {
      console.log(page);
      this.entries = page.content;
      this.pageNumber = page.pageable.pageNumber+1;
      this.totalPages = page.totalPages;
    })
  }

  ngOnInit() {
    this.selectEntry(Entries.spells);
  }
}
