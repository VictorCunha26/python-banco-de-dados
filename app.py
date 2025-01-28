from flask import Flask, render_template

app = Flask(__name__)

@app.route("/ola")
def hello_world():
    return "<p>Olá, mundo!</p>"

@app.route("/")
def main_page():
    return render_template("home.html")

# from modelos.avengers import Avengers
# from modelos.interface import Interface as i
# # from modelos.database import Database


# def main():

#    Avengers.carregar_herois()
#    i.apresentar_menu_principal()

# if __name__ == '__main__': # sempre no final do arquivo contendo a definição da função principal
#     main()