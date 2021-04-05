omich.kun@gmail.com


## Как развернуть
```
docker-compose up -d 
```
Таск-трекер находится по пути http://localhost:3000

Сервис аутентификации: http://localhost:3001

Сервис биллинга: http://localhost:3002

## Общие требования

В ходе обсуждения задачи с топ-менеджментом были выявлены следующие требования:

### Таск-трекер

1. Таск-трекер должен быть отдельным дашбордом и доступен всем сотрудникам компании UberPopug Inc.
2. Авторизация в таск-трекере должна выполняться через общий сервис авторизации UberPopug Inc (у нас там инновационная система авторизации на основе формы клюва).
3. В таск-трекере должны быть только задачи. Проектов, скоупов и спринтов никому не надо, ибо минимализм.
4. В таск-трекере новые таски может создавать кто угодно. У задачи должны быть описание, статус (выполнена или нет) и попуг, на которого заассайнена задача.
5. Менеджеры или администраторы должны иметь кнопку «заассайнить задачи», которая возьмет все открытые задачи и рандомно заассайнит каждую на любого из сотрудников. Не успел закрыть задачу до реассайна — сорян, делай следующую.
6. Каждый сотрудник должен иметь возможность видеть в отдельном месте список заассайненных на него задач + отметить задачу выполненной.
7. После ассайна новой задачи сотруднику должно приходить оповещение на почту, в слак и в смс.

### Аккаунтинг: кто сколько денег заработал

1. Аккаунтинг должен быть в отдельном дашборде и доступным только для администраторов и бухгалтеров.
2. Авторизация в таск-трекере должна выполняться через общий сервис авторизации UberPopug Inc.
3. У каждого из сотрудников должен быть свой счет, который показывает, сколько за сегодня он получил денег. У счета должен быть аудитлог того, за что были списаны или начислены деньги, с подробным описанием каждой из задач.
4. Расценки:
    - у сотрудника появилась новая задача — `rand(-10..-20)$`
    - сотрудник выполнил задачу — `rand(20..40)$`
5. Вверху выводить количество заработанных за сегодня денег.
6. В конце дня необходимо считать, сколько денег сотрудник получил за рабочий день, слать на почту сумму выплаты.
7. После выплаты баланса (в конце дня) он должен обнуляться и в аудитлоге должно быть отображено, что была выплачена сумма.
8. Дашборд должен выводить информацию по дням, а не за весь период сразу.

### Аналитика

1. Аналитика — это отдельный дашборд, доступный только админам.
2. Нужно указывать, сколько заработал топ-менеджмент: сколько программистов ушло в минус.
3. Нужно показывать самую дорогую задачу за: день, неделю и месяц.

## Технические дополнения

1. Никакого сложного UI-дизайна не надо, хватит самого банального бутстрапа или чистого html.
2. Нотификации достаточно вывести в консоль, что они произошли. Ничего делать не нужно.
3. Никакого реалтайма тоже не нужно, хватит рефреша страницы.
4. Язык и технологии можно выбрать любые.
5. Все права на PopugJira принадлежат UberPopug Inc.