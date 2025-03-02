import {Component, OnInit} from '@angular/core';
import {CompendiumApiService} from '../compendium-api.service';
import {IEntry} from '../../interfaces/IEntry';
import {NgForOf} from '@angular/common';
import {Entries} from '../entries';

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

  constructor(private compendiumApiService: CompendiumApiService) {
  }

  getEntries(entry: Entries) {
    //empty before changing
    this.entries = [];
    this.compendiumApiService.getEntries(entry).subscribe((data) => {
      this.entries = data;
    })
  }

  //for html template (call with enums instead of multiple methods)
  protected readonly Entries = Entries;
}
