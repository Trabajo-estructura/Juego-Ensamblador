import cv2
import numpy as np
import struct

# Dimensiones de la imagen
ancho = 640
alto = 480

# Crear un array vacío para almacenar los píxeles
imagen_recuperada = np.zeros((alto, ancho, 3), dtype=np.uint8)

# Leer el archivo binario que contiene los píxeles
with open('original_logo_pixel_file_opti.bin', 'rb') as archivo:
    for y in range(alto):
        for x in range(ancho):
            # Leer 3 bytes (B, G, R)
            bytes_leidos = archivo.read(3)
            if len(bytes_leidos) < 3:
                break  # Final del archivo inesperado
            # Desempaquetar los valores BGR
            _, b, g, r = struct.unpack('BBB', bytes_leidos)
            # Asignar los valores al píxel en la imagen
            imagen_recuperada[y, x] = [b, g, r]

# Mostrar la imagen recuperada
cv2.imshow('Imagen recuperada', imagen_recuperada)
cv2.waitKey(0)
cv2.destroyAllWindows()
