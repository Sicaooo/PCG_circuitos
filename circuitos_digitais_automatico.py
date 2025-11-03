import os
import subprocess

diretorio = input("Digite o caminho da pasta do arquivo: ")

os.chdir(diretorio)

lista_arquivos = os.listdir()

nome = input("Insira o nome do arquivo: ")

subprocess.run(["iverilog", "-o", f"{nome}.vvp", f"{nome}_tb.v"])
subprocess.run(["vvp", f"{nome}.vvp"])
subprocess.run(["gtkwave", f"{nome}_tb.vcd"])