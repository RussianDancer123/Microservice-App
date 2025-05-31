export interface Page<T> {
  content: T[];
  totalPages: number;
  pageable: {
    pageNumber: number;
    pageSize: number;
  }
}
