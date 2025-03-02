import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EntryChoiceListComponent } from './entry-choice-list.component';

describe('EntryChoiceListComponent', () => {
  let component: EntryChoiceListComponent;
  let fixture: ComponentFixture<EntryChoiceListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [EntryChoiceListComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EntryChoiceListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
