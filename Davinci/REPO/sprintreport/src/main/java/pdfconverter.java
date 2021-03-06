package main.java;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import java.io.*;
import com.lowagie.text.DocumentException;
import org.xhtmlrenderer.pdf.ITextRenderer;

public class pdfconverter {

    public static void main(String[] args)
            throws IOException, DocumentException {
        String inputFile = "samples/firstdoc.xhtml";
        String url = new File(inputFile).toURI().toURL().toString();
        String outputFile = "firstdoc.pdf";
        OutputStream os = new FileOutputStream(outputFile);

        ITextRenderer renderer = new ITextRenderer();
        renderer.setDocument(url);
        renderer.layout();
        renderer.createPDF(os);

        os.close();

}
