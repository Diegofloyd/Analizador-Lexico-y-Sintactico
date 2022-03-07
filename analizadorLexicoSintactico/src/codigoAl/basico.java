/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigoAl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
/**
 *
 * @author Jennifer Ortiz
 */
public class basico {
    public static void main(String[] args) throws Exception {
        String ruta1 = "C:/Users/diego/OneDrive/Escritorio/Cuatri 8/Compiladores e Interpretes/Programa/analizadorLexicoSintactico/src/codigoAl/anLex.flex";
        String ruta2 = "C:/Users/diego/OneDrive/Escritorio/Cuatri 8/Compiladores e Interpretes/Programa/analizadorLexicoSintactico/src/codigoAl/anCup.flex";
        String[] rutaS = {"-parser", "Sintax", "C:/Users/diego/OneDrive/Escritorio/Cuatri 8/Compiladores e Interpretes/Programa/analizadorLexicoSintactico/src/codigoAl/Sintax.cup"};
        generar(ruta1, ruta2, rutaS);
    }
    public static void generar(String ruta1, String ruta2, String[] rutaS) throws IOException, Exception{
        File archivo;
        archivo = new File(ruta1);
        JFlex.Main.generate(archivo);
        archivo = new File(ruta2);
        JFlex.Main.generate(archivo);
        java_cup.Main.main(rutaS);
        
        
        Path rutaSym = Paths.get("C:/Users/diego/OneDrive/Escritorio/Cuatri 8/Compiladores e Interpretes/Programa/analizadorLexicoSintactico/src/codigoAl/sym.java");
        if (Files.exists(rutaSym)) {
            Files.delete(rutaSym);
        }
        Files.move(
                Paths.get("C:/Users/diego/OneDrive/Escritorio/Cuatri 8/Compiladores e Interpretes/Programa/analizadorLexicoSintactico/sym.java"), 
                Paths.get("C:/Users/diego/OneDrive/Escritorio/Cuatri 8/Compiladores e Interpretes/Programa/analizadorLexicoSintactico/src/codigoAl/sym.java")
        );
        Path rutaSin = Paths.get("C:/Users/diego/OneDrive/Escritorio/Cuatri 8/Compiladores e Interpretes/Programa/analizadorLexicoSintactico/src/codigoAl/Sintax.java");
        if (Files.exists(rutaSin)) {
            Files.delete(rutaSin);
        }
        Files.move(
                Paths.get("C:/Users/diego/OneDrive/Escritorio/Cuatri 8/Compiladores e Interpretes/Programa/analizadorLexicoSintactico/Sintax.java"), 
                Paths.get("C:/Users/diego/OneDrive/Escritorio/Cuatri 8/Compiladores e Interpretes/Programa/analizadorLexicoSintactico/src/codigoAl/Sintax.java")
        );
    }
}
