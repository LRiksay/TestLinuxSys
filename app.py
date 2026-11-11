# app.py
from flask import Flask, render_template, request
import os

app = Flask(__name__)

# Главная страница
@app.route('/')
def index():
    port = os.environ.get('PORT', 5000)
    return render_template('index.html', port=port)

# Страница "О проекте"
@app.route('/about')
def about():
    return render_template('about.html')

# Страница с интерактивной формой
@app.route('/form', methods=['GET', 'POST'])
def form():
    name = None
    if request.method == 'POST':
        # Получаем данные из поля input с именем "username"
        name = request.form.get('username')
    return render_template('form.html', name=name)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 5000)), debug=True)