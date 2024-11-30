package fakeRestApi.passengers;

import com.intuit.karate.Runner;

public class PassengersTest {

    public static void main(String[] args) {
        Runner.path("src/test/java/fakeRestApi/passengers")
                .outputCucumberJson(true)
                .parallel(1);
    }
}
