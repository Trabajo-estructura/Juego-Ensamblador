class GeneradorPseudoaleatorio:
    def __init__(self, semilla, a=109, c=27, m=4096):
        self.semilla = semilla
        self.a = a
        self.c = c
        self.m = m

    def siguiente(self, min_val, max_val):
        # Generar el siguiente número pseudoaleatorio
        self.semilla = (self.a * self.semilla + self.c) % self.m
        # Ajustar el número al rango [min_val, max_val)
        return min_val + (self.semilla % (max_val - min_val))

# Ejemplo de uso
generador = GeneradorPseudoaleatorio(semilla=123)

# Generar 10 números pseudoaleatorios en el rango [10, 50)
for _ in range(10):
    print(generador.siguiente(1, 10))