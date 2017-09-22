анализ повторений кода
модули должны быть в файлах txt

как читать результаты работы.

На форме обработки есть поля: 
1) Путь выгрузки. Это папка, куда помещены файлы, повторы в текстах которых нужно найти; 
2) Порог. Это минимальное значение длины повторяющихся фрагментов (в строках), которые замечаются обработкой. Когда 0 - все повторы показываются; 
3) По алфавиту - несколько замедляет поиск. Параметр нужен был для тестирования, чтобы суффиксный массив строился также, как и другими алгоритмами, чтобы можно было сравнить результаты. 
4) Табличная часть с колонками: 
4.1) Рост - это длина найденного фрагмента; 
4.2) Место - это сдвиг (в строках) от начала всех файлов. Нумерация строк сквозная; 
4.3) Копия - сдвиг копии фрагмента (в строках) от общего начала всех файлов. 
При выборе строки в табличной части производится переход от сквозной нумерации строк к нумерации внутри отдельных файлов. При этом отображается: 
5) Имя файла, содержащего образец (его рост показан в выделенной строке); 
6) Сдвиг образца относительно начала указанного файла; 
5) Имя файла, содержащего копию (её рост соответствует росту оригинала); 
6) Сдвиг копии относительно начала файла, содержащего копию. Файл, содержащий оригинал и копию может быть одним и тем же.