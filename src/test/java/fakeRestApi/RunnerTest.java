package fakeRestApi;

import com.intuit.karate.Runner;

public class RunnerTest {

    public static void main(String[] args){
        Runner.path("src/test/java/fakeRestApi")
                .outputCucumberJson(true)
                .parallel(1);
    }
}
