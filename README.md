# 🧠 Simulador de Gestión de Memoria (MMU) en PSeInt

## 📌 Descripción

Este proyecto implementa un simulador básico de gestión de memoria inspirado en el funcionamiento de una **Unidad de Manejo de Memoria (MMU)**.

Se desarrolló en **PSeInt** y permite analizar el comportamiento de la memoria mediante algoritmos de reemplazo de páginas.

---

## 🎯 Objetivos

* Simular la asignación de marcos de memoria.
* Implementar algoritmos de reemplazo de páginas.
* Analizar los fallos de página en distintos escenarios.
* Comprender el funcionamiento básico de la memoria virtual.

---

## ⚙️ Funcionalidades

### 🧩 1. Inicialización de memoria

* Se crea una memoria con 4 marcos.
* Se utiliza un mapa de bits para indicar ocupación.

### 🔄 2. Algoritmos implementados

#### 📥 FIFO (First In, First Out)

* Reemplaza la página más antigua en memoria.
* Utiliza un puntero circular.

#### 🧠 OPT (Óptimo)

* Reemplaza la página que tardará más tiempo en volver a usarse.
* Minimiza la cantidad de fallos de página.

---

## 📊 Datos de prueba

Secuencia de referencias utilizada:

```
1, 2, 3, 4, 1, 2, 5, 1, 2, 3, 4, 5
```

Número de marcos de memoria:

```
3 marcos
```

---

## ▶️ Ejecución

1. Abrir PSeInt
2. Copiar el código del simulador
3. Ejecutar el algoritmo

---

## 📈 Resultados esperados

El programa mostrará:

* Estado del mapa de bits
* Número de fallos de página usando:

  * FIFO
  * OPT

Ejemplo:

```
Fallos FIFO: X
Fallos OPT: Y
```

---

## 🧪 Interpretación

* FIFO es sencillo pero puede ser ineficiente.
* OPT ofrece el mejor resultado posible (teórico).
* Comparar ambos permite entender la optimización en memoria.

---

## 📚 Conceptos clave

* Memoria virtual
* Paginación
* Fallos de página
* Algoritmos de reemplazo

---

## 👨‍💻 Autor

Proyecto académico desarrollado para el estudio de **Estructuras de Datos GT-02 / Ingenieria en Desarrollo de Software**.

---

## 📝 Notas

* El proyecto está adaptado a la sintaxis de **PSeInt**.
* Se corrigieron limitaciones del lenguaje como:

  * Índices que inician en 1
  * Restricciones en ciclos `Para`

---
