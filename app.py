from modelos.avengers import Avengers
from modelos.interface import Interface as i
# from modelos.database import Database


def main():

   Avengers.carregar_herois()
   i.apresentar_menu_principal()

if __name__ == '__main__': # sempre no final do arquivo contendo a definição da função principal
    main();