package fakeRestApi.airlines;

import com.intuit.karate.Runner;

public class AirlinesTest {

    public static void main(String[] args) {
        Runner.path("src/test/java/fakeRestApi/airlines") // Ruta de la carpeta específica
                .outputCucumberJson(true) // Habilitar reporte Cucumber JSON
                .parallel(1); // Ejecutar de forma secuencial
    }
}
