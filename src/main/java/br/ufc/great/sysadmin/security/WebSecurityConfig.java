package br.ufc.great.sysadmin.security;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

/**
 * Classe de configuração do Spring Security
 * @author armandosoaressousa
 *
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private DataSource datasource;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	http.sessionManagement()
        .sessionCreationPolicy(SessionCreationPolicy.ALWAYS);

    	http.authorizeRequests()        
        		.antMatchers("/register").permitAll()
                .antMatchers("/bootstrap/**", "/dist/**", "/plugins/**").permitAll()
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/accesscontrol/**").hasAnyAuthority("ADMIN")
                .antMatchers("/users").hasAnyAuthority("ADMIN")
                .antMatchers("/users/").hasAnyAuthority("ADMIN")
                .antMatchers("/stores").hasAnyAuthority("ADMIN")
                .antMatchers("/stores/").hasAnyAuthority("ADMIN")
                .anyRequest().authenticated()
                .and()
            .formLogin()
                .failureUrl("/login?error")
                .loginPage("/login")
                .defaultSuccessUrl("/")
                .permitAll()
                .and()
            .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .invalidateHttpSession(true)
                .logoutSuccessUrl("/login")
                .permitAll();   
           	
    	http.sessionManagement()
    		.maximumSessions(2)
    		.expiredUrl("/sessionExpired.html");
    	
    	http.sessionManagement().invalidSessionUrl("/invalidSession.html");   
    	
    	//http.sessionManagement()
    	//  .sessionFixation().migrateSession();
    	
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        //Use Spring Boots User detailsMAnager
        JdbcUserDetailsManager userDetailsService = new JdbcUserDetailsManager();

        //Set our Datasource to use the one defined in application.properties
        userDetailsService.setDataSource(datasource);

        //Create BCryptPassword encoder
        PasswordEncoder encoder = new BCryptPasswordEncoder();

        //add components
        auth.userDetailsService(userDetailsService).passwordEncoder(encoder);
        auth.jdbcAuthentication().dataSource(datasource);
       
        // add new user "user" with password "password" - password will be encrypted
        if(!userDetailsService.userExists("armando")) {
            List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
            authorities.add(new SimpleGrantedAuthority("ADMIN"));
            authorities.add(new SimpleGrantedAuthority("USER"));
            authorities.add(new SimpleGrantedAuthority("STOREOWNER"));
            User userDetails = new User("armando", encoder.encode("armando"), authorities);
            userDetailsService.createUser(userDetails);
        }
        
        /*
    	String username = "armando";
		Object principal = userDetailsService.loadUserByUsername(username);
		Object credentials = null;		
		UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(principal, credentials);
    	SecurityContextHolder.getContext().setAuthentication(authentication);
    	
    	ou
    	
    	UserDetails principal = userDetailsService.loadUserByUsername("username"); 
    	UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(principal, null, principal.getAuthorities()); 
    	SecurityContextHolder.getContext().setAuthentication(authentication);s
    	*/      
        
    }

}
