import cv2
import struct

# Dimensiones clave del ensamblador 640x480

#IMPORTANTE:
#El programa convierte una imagen tipo png o jpg (preferiblemente png para optimización)
#a una secuencia de bits que se escriben en un fichero .bin (binario).
#El programa escribe 3 bytes cada vez, es decir, 1 byte por cada pixel b/g/r

# Cargar la imagen
imagen = cv2.imread('path de vuestra imagen')

# Obtener las dimensiones de la imagen
alto, ancho, _ = imagen.shape

#abrir archivo binario para escribir el código bgr
with open("pixel_file.bin", "wb") as archivo:
    # Iterar sobre cada píxel y obtener el valor en formato BGR
    for y in range(alto):
        for x in range(ancho):
            # Obtener el valor BGR del píxel en (x, y)
            b, g, r = imagen[y, x]
            archivo.write(struct.pack("BBB", b, g, r))
    archivo.close()
print("Finalizado")
