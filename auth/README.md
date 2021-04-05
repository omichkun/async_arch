При развертывании: 
- открыть http://localhost:3001/
- зарегистрироваться
- сменить у себя роль на админа
- зайти на http://localhost:3001/oauth/applications
- добавить приложение
- в качестве коллбэка указать http://localhost:3000/auth/popugi/callback
- uid и secret и scope поместить в .env-файл сервиса task_tracker в переменные AUTH_APP_ID, AUTH_SECRET и AUTH_SCOPE соответственно
- docker-compose down && docker-compose up -d 

Вроде после этого должно заработать все