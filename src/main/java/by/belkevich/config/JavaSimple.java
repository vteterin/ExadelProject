package io.robustperception.java_examples;

import io.prometheus.client.Counter;
import io.prometheus.client.exporter.MetricsServlet;
import io.prometheus.client.hotspot.DefaultExports;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.servlet.ServletContextHandler;
import org.eclipse.jetty.servlet.ServletHolder;
import java.io.IOException;

public class JavaSimple {

  public static void main( String[] args ) throws Exception {
      Server server = new Server(1234);
      ServletContextHandler context = new ServletContextHandler();
      context.setContextPath("/");
      server.setHandler(context);
      // Expose our example servlet.
      context.addServlet(new ServletHolder(new ExampleServlet()), "/");
      // Expose Promtheus metrics.
      context.addServlet(new ServletHolder(new MetricsServlet()), "/metrics");
      // Add metrics about CPU, JVM memory etc.
      DefaultExports.initialize();

  }
}
