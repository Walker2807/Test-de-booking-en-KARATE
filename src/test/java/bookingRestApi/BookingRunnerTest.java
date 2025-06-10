package bookingRestApi;

import com.intuit.karate.Runner;

public class BookingRunnerTest {
    public static void main(String[] args) {
        Runner.path("src/test/java/bookingRestApi") // Ruta de la carpeta específica
                .outputCucumberJson(true) // Habilitar reporte Cucumber JSON
                .parallel(1); // Ejecutar de forma secuencial
    }
}