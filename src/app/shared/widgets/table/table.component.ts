import { CommonModule } from '@angular/common';
import {
  Component,
  Input,
  OnChanges,
  OnInit,
  SimpleChanges,
} from '@angular/core';
import {
  OrderTableData,
  UserTableData,
} from '../../../core/constant/table-data';

@Component({
  selector: 'app-table',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.scss'],
})
export class TableComponent<T> implements OnInit, OnChanges {
  @Input() headings!: string[];
  @Input() activeTab!: string;
  @Input() tableData!: T[];
  @Input() dataType!: 'order' | 'user';

  orderTableData: OrderTableData[] = [];
  userTableData: UserTableData[] = [];

  ngOnInit(): void {
    this.processTableData();
  }

  ngOnChanges(changes: SimpleChanges): void {
    if (changes['tableData'] || changes['dataType'] || changes['activeTab']) {
      this.processTableData();
    }
  }

  processTableData(): void {
    if (this.dataType === 'order') {
      this.orderTableData = (this.tableData as OrderTableData[]).filter(
        (row) =>
          this.activeTab.toLowerCase() === 'all' ||
          row.Status.toLowerCase().trim() ===
            this.activeTab.toLowerCase().trim()
      );
      console.log('orderTableData', this.orderTableData);

      this.userTableData = [];
    } else if (this.dataType === 'user') {
      this.userTableData = this.tableData as UserTableData[];
      this.orderTableData = [];
    }
  }
}
