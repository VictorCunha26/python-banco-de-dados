# from modelos import avengers
from  modelos.avengers import Avengers
import os
from modelos.database import Database #

class Interface:

    def __init__(self):
        Avengers.carregar_herois()
        self.apresentar_menu_principal()

    @staticmethod
    def imprime_titulo_app():
        
        print('''      
██╗░░██╗███████╗██████╗░░█████╗░██████╗░░█████╗░░██████╗████████╗███████╗██████╗░
██║░░██║██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗
███████║█████╗░░██████╔╝██║░░██║██████╔╝██║░░██║╚█████╗░░░░██║░░░█████╗░░██████╔╝
██╔══██║██╔══╝░░██╔══██╗██║░░██║██╔══██╗██║░░██║░╚═══██╗░░░██║░░░██╔══╝░░██╔══██╗
██║░░██║███████╗██║░░██║╚█████╔╝██║░░██║╚█████╔╝██████╔╝░░░██║░░░███████╗██║░░██║
╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝░╚════╝░╚═════╝░░░░╚═╝░░░╚══════╝╚═╝░░╚═╝   
         ''')
       
    @staticmethod

    def apresentar_menu_principal():
        '''Este método apresenta o menu principal com opções para realizar tarefas no app.'''
        os.system('cls')
        Interface.imprime_titulo_app()
        print()
        print('Menu Principal')
        print('1. Cadastrar um novo Vingador')
        print('2. Listar todos os Vingadores Cadastrados')
        print('3. Declarar status de convocação')
        print('4. Declarar status da tornozeleira')
        print('5. Declarar status de gps')  
        print('6. Listar detalhes Vingador')
        print('7. sair')
        print()
        Interface.ler_opcao_usuario()

    @staticmethod

    def imprime_titulo_tela(titulo):
        '''Este método imprime um titulo na tela dependendo da sua localização do app.'''
        os.system('cls')
        Interface.imprime_titulo_app
        print(f'{str(titulo).upper()}')
        print ('*' * 30)
        print()


    def cadastrar_avengers():
        '''Este método permite que o usuario cadastre um determinado carro por meio de sua descrição.'''
        Interface.imprime_titulo_tela('Cadastrando Avengers')
        nome_heroi = input('Nome do herói: ')
        nome_real = input('Nome real do herói: ')
        categoria = input('Categoria do herói: ')
        poderes = input('Poderes do herói: ')
        poder_principal = input('Poder Principal do herói: ')
        fraquezas = input('Fraquezas do herói: ')
        nivel_forca = input('Nível de força: ')

        #Salvar o vingador no banco de dados
        try:
            db = Database()
            db.connect()
            query = "INSERT INTO heroi (nome_heroi, nome_real, categoria, poderes, poder_principal, fraquezas, nivel_forca) VALUES (%s, %s, %s, %s, %s, %s, %s)"
            values = (nome_heroi, nome_real, categoria, ''.join(poderes), poder_principal, ''.join(fraquezas), nivel_forca)
            db.execute_query(query, values)

            cursor= db.execute_query(query, values)

            avengers = Avengers(cursor.lastrowid, nome_heroi, nome_real, categoria, poderes, poder_principal, fraquezas, nivel_forca)


        except Exception as e:
            print(f"Erro ao salvar vingador no banco de dados: {e}")

        finally:
            db.disconnect()

            # finalizando o necessário para passar para o banco de dados

        print(f'O Vingador foi cadastrado: \n{avengers}')
        

    @staticmethod
    def ler_opcao_usuario():
        '''Este método faz a leitura da opção do usuário com bases nas opções apresentadas.'''
        
        try:
            opcao = int(input('Digite sua opção: '))
            if opcao == 1:
                Interface.cadastrar_avengers()
            elif opcao == 2:
                Interface.imprime_titulo_tela('Listando Vingadores')
                Avengers.listar_avengers()
            elif opcao == 3:
                Interface.status_concov()
            elif opcao == 4:
                Interface.status_tornozeleira()
            elif opcao == 5:
                Interface.status_gps()
            elif opcao == 6:
                Interface.detalhes_vingador()
            elif opcao == 7:
                print('Encerrando o programa')
                exit()
            else:
                print('Digite uma opção valida')
                
        except ValueError:
            print('Você deve digitar um número inteiro')

        Interface.voltar_ao_menu_principal()

    @staticmethod

    def voltar_ao_menu_principal():
        '''Este método permite voltar para o menu principal.'''
        print()
        input('Presione ENTER para voltar ao menu')
        os.system('cls')
        Interface.apresentar_menu_principal()

    @staticmethod
    def detalhes_vingador():
        '''Este método permite que o usuário veja os detalhes de um vingador específico.'''
        nome_heroi = input('Digite o nome do herói que deseja procurar: ')
        avengers = Avengers.procurar_vingador(nome_heroi)  # Utiliza o método estático para procurar o vingador
        
        if avengers:
            print(f'\nDetalhes do Vingador {avengers.nome_heroi}:')
            print(f'Nome Real: {avengers.nome_real}')
            print(f'Categoria: {avengers.categoria}')
            print(f'Poderes: {avengers.poderes}')
            print(f'Poder Principal: {avengers.poder_principal}')
            print(f'Fraquezas: {avengers.fraquezas}')
            print(f'Nível de Força: {avengers.nivel_forca}')
        else:
            print(f'Vingador {nome_heroi} não encontrado.')

    # Funções para realizar a convocacao, tornozeleira  

    @staticmethod
    def status_concov():
        '''Este método permite que o usuário convoque um vingador e mude o status deste.'''
        nome_heroi = input('Digite o nome do herói que deseja convocar: ')
        for avengers in Avengers.lista_de_avengers:
            if nome_heroi in avengers.nome_heroi or nome_heroi in avengers.nome_real:
                print(avengers.convocar())
                return
        print(f"Vingador(a) '{nome_heroi}' não encontrado.")


    @staticmethod
    def status_tornozeleira():
        '''Este método permite que o usuário coloque a tornozeleira em um vingador e mude o status deste.'''
        nome_heroi = input('Digite o nome do herói que deseja colocar a tornozeleira: ')
        for avengers in Avengers.lista_de_avengers:
            if nome_heroi in avengers.nome_heroi or nome_heroi in avengers.nome_real:
                print(avengers.aplicar_tornozeleira())
                return
        print(f"Vingador(a) '{nome_heroi}' não encontrado.")

    @staticmethod
    def status_gps():
        '''Este método permite que o usuário coloque a tornozeleira em um vingador e mude o status deste.'''
        nome_heroi = input('Digite o nome do herói que deseja colocar a tornozeleira: ')
        for avengers in Avengers.lista_de_avengers:
            if nome_heroi in avengers.nome_heroi or nome_heroi in avengers.nome_real:
                print(avengers.aplicar_gps())
                return
        print(f"Vingador(a) '{nome_heroi}' não encontrado.")

        #finalização da funções
       





    
                   
                   
           
           
