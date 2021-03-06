﻿
Процедура КнопкаСформироватьНажатие(Кнопка)
	
	Старт = ТочноеТекущееВремя();
	
	Повторы.Очистить();
	ЭлементыФормы.ПолеТекстовогоДокумента1.Очистить();
	
	Ранг = Новый Массив; 
	След = Новый Массив;
	
	РазныхСтрок = ЧтениеМодулей(ПутьВыгрузки, Ранг, След);
	ВсегоСтрок = Ранг.Количество();
	
	// вообще говоря, против зацикливания строки нужно бы добавить сентител - последний одиночный символ, 
	// равный Нумератор.Количество(), но в данной реализации пока есть еще "ПоАлфавиту", поэтому оставляем так - "на авось"
	// зациклится тогда, когда будут только одинаковые файлы из всех разных строк
	
	ВсегоСтрок = Ранг.Количество();
	
	//Тень = ЗначениеИзСтрокиВнутр(ЗначениеВСтрокуВнутр(Ранг));
	
	Тень = Новый Массив(Ранг.Количество()); Для ё = 0 По Ранг.Количество() - 1 Цикл Тень[ё] = Ранг[ё] КонецЦикла;
	
	Состояние("Получение суффиксного массива");
	
	ПолучитьСуффиксныйМассив(Ранг, След);
	
	Путь = Новый Массив(Ранг.Количество());
	Рост = Новый Массив(Ранг.Количество());
	
	Состояние("Получение длин наибольших общих префиксов");
	
	ПолучитьДлиныНаибольшихОбщихПрефиксов(Тень, Ранг, Путь, Рост);
	
	Состояние("Вычисление среднего роста");
	Сумма = 0;
	Для Каждого Элемент Из Рост Цикл Сумма = Сумма + Элемент
	КонецЦикла;
	СреднийРост = Окр(Сумма / Рост.Количество(), 2); 
	
	Состояние("Отбор мест повторов");
	
	Повторы.Загрузить(ОтборМестПовторов(Ранг, Путь, Рост));
	
	Состояние("Сортировка повторов");
	
	Повторы.Сортировать("Рост Убыв");
	
	ЭтаФорма.Заголовок = "КопиПастаМер - " + (ТочноеТекущееВремя() - Старт) + " мсек, "  + "всего строк " + ВсегоСтрок + ", различных " + РазныхСтрок + ", повторяется в среднем " + СреднийРост

КонецПроцедуры

Процедура ПутьВыгрузкиНачалоВыбора(Элемент, СтандартнаяОбработка)
	
	ДВФ = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.ВыборКаталога);
	
	ДВФ.Заголовок = "Выберите каталог, куда были выгружены тексты модулей";
	
	Если ДВФ.Выбрать() Тогда
		
		ПутьВыгрузки = ДВФ.Каталог	
		
	КонецЕсли
	
КонецПроцедуры

Процедура ПовторыПриАктивизацииСтроки(Элемент)
	
	Детали = Расшифровка(Элемент.ТекущаяСтрока);
	
	ЭлементыФормы.Файл1.Значение = Детали.Файл1;
	
	ЭлементыФормы.Строка1.Значение = Детали.Строка1;
	
	ЭлементыФормы.Файл2.Значение = Детали.Файл2;
	
	ЭлементыФормы.Строка2.Значение = Детали.Строка2;
	
	ЭлементыФормы.ПолеТекстовогоДокумента1.УстановитьТекст(Детали.Текст)
	
КонецПроцедуры