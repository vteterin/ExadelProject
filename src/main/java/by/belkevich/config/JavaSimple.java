package io.Prometheus;

import io.prometheus.client.Counter;
import io.prometheus.client.exporter.MetricsServlet;
import io.prometheus.client.hotspot.DefaultExports;
import org.eclipse.jetty.server.Server;
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
