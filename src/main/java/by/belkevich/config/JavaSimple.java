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

  @Bean
ServletRegistrationBean registerPrometheusExporterServlet(CollectorRegistry metricRegistry) {
    ServletRegistrationBean srb = new ServletRegistrationBean();
    srb.setServlet(new MetricsServlet(metricRegistry));
    srb.setUrlMappings(Arrays.asList("/prometheus"));
    return srb;

  }
}
