анализ повторений кода
модули должны быть в файлах txt

q:
как читать результаты работы.

a:
На форме обработки есть поля: 
1) Путь выгрузки. Это папка, куда помещены файлы, повторы в текстах которых нужно найти; 
2) Порог. Это минимальное значение длины повторяющихся фрагментов (в строках), которые замечаются обработкой. 
	Когда 0 - все повторы показываются; 
3) По алфавиту - несколько замедляет поиск. Параметр нужен был для тестирования, чтобы суффиксный массив строился также,
	как и другими алгоритмами, чтобы можно было сравнить результаты. 
4) Табличная часть с колонками: 
4.1) Рост - это длина найденного фрагмента; 
4.2) Место - это сдвиг (в строках) от начала всех файлов. Нумерация строк сквозная; 
4.3) Копия - сдвиг копии фрагмента (в строках) от общего начала всех файлов. 
При выборе строки в табличной части производится переход от сквозной нумерации строк к нумерации внутри отдельных файлов.
	При этом отображается: 
5) Имя файла, содержащего образец (его рост показан в выделенной строке); 
6) Сдвиг образца относительно начала указанного файла; 
5) Имя файла, содержащего копию (её рост соответствует росту оригинала); 
6) Сдвиг копии относительно начала файла, содержащего копию. Файл, содержащий оригинал и копию может быть одним и тем же.

q: 
спасибо, а что делать с информацией в колонках 
4.2) Место - это сдвиг (в строках) от начала всех файлов. Нумерация строк сквозная; 
4.3) Копия - сдвиг копии фрагмента (в строках) от общего начала всех файлов. 
? 
ведь требуется увидеть как часто и где встречается тот или иной фрагмент кода, а с местом и копией что делать?
  + – Ответить  1

a: 
вопрос "как часто и где встречается тот или иной фрагмент кода"
не требует таких сложных алгоритмов. Тут работает встроенный метод платформы "Найти" и "СтрЧислоВхождений".
Скорее всего, при реализации "Найти" используется алгоритм Боурера-Мура, который предельно быстр. 

Здесь решалась проблема найти следы копипаста, то есть обнаружить те фрагменты, которые, вероятнее всего,
были целиком скопированы из другого места программы. Буквально это и показано: указано место первого (исходного)
фрагмента и указано место, где есть его копия. При этом "первичность" фрагмента (у кого кто списал)
точно не определяется. Также если фрагмент 1 был скопирован десять раз и были получены фрагменты 2, 3, 4, ... ,11
нет гарантии того, что будут показаны пары 1-2, 1-3, 1-11. Вполне может быть результат 1-2, 2-3, 4-2... .
Это зависит от строк "окружения" фрагментов и порядка их записи в цепочке файлов текстов модулей. 

Это не означает, что на основе полученных данных нельзя ответить на другие вопросы анализа текстов программных модулей.
Но для этого их нужно четко и однозначно сформулировать.