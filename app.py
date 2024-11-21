import csv
from flask import Flask, jsonify

app = Flask(__name__)

def read_csv():
    foods = []
    try:
        with open('foods.csv', newline='', encoding='utf-8-sig') as csvfile:
            reader = csv.DictReader(csvfile, delimiter=';')

            print("Encabezado CSV:", reader.fieldnames)  # Verifica las cabeceras del CSV

            for row in reader:
                print("Fila CSV:", row)  # Mostrar cada fila leída

                foods.append({
                    "codigo": int(row["CODIGO"]),
                    "nombre": row["NOMBRE"],
                    "categoria": row["CATEGORIA"],
                    "proteina": float(row["PROTEINA"]),
                    "grasa": float(row["GRASA"]),
                    "carbohidrato": float(row["CARBOHIDRATO"]),
                    "energia": float(row["ENERGIA"]),
                })
    except FileNotFoundError:
        return {"error": "Archivo CSV no encontrado."}
    except Exception as e:
        return {"error": f"Error al leer el archivo CSV: {str(e)}"}
    
    return foods

@app.route('/foods', methods=['GET'])
def get_foods():
    foods = read_csv()
    return jsonify(foods)

if __name__ == "__main__":
    app.run(debug=True)




