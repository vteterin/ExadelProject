package config;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.Properties;

@Configuration
@ComponentScan(basePackages = {"by.belkevich"} )
@EnableTransactionManagement()
@Import({by.belkevich.config.CoreConfig.class,by.belkevich.config.JPAConfig.class})
public class TestJPAConfig {

    /**
     * Overrides dataSource bean from main configuration class
     * @return test dataSource
     */
    @Bean
    public BasicDataSource dataSource(){
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("org.h2.Driver");
        dataSource.setUsername("sa");
        dataSource.setPassword("");
        dataSource.setUrl("jdbc:h2:~/test-breakingnews");

        dataSource.setInitialSize(10);
        dataSource.setMaxActive(50);
        dataSource.setMaxIdle(50);
        dataSource.setMaxWait(6000);

        return dataSource;
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean entityManager(JpaVendorAdapter hibernateJpaVendorAdapter) {

        LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();
        localContainerEntityManagerFactoryBean.setDataSource(dataSource());
        localContainerEntityManagerFactoryBean.setJpaVendorAdapter(hibernateJpaVendorAdapter);
        localContainerEntityManagerFactoryBean.setPersistenceUnitName("entityManager"); // In persistence.xml
        Properties p = new Properties();
        p.put("hibernate.show_sql", "true");
        p.put("hibernate.format_sql", "true");
        p.put("hibernate.hbm2ddl.auto", "create"); //change this onto update to not recreate db everytime
        localContainerEntityManagerFactoryBean.setJpaProperties(p);

        return localContainerEntityManagerFactoryBean;
    }


}
