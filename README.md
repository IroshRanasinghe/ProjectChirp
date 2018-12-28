# ProjectChirp
Developed an end to end  web Application named <b>Chirp</b> using Spring MVC with multiple modules
        <br>
        <h3>Functionalities:</h3>
        <h5>01 &nbsp; User Registration</h5>
        <ul>
            <li>User can register with application.</li>
        </ul>
        <h5>02 &nbsp;operations</h5>
        <ul>
            <li>User can <b>post</b> advertisements.</li>
            <li>User can search advertisements by <b>title</b> of advertisement.</li>
        </ul>
        <h5>03 &nbsp; Spring Security</h5>
        <ul>
            <li>User can login the site.</li>
            <li>The entire site will change according the role. Whether the client is User or Admin.</li>
            <li>user can logout after completing.</li>
        </ul>
        <h3>Tools and Technologies:</h3>
        <ul>
            <li><b>Technology :</b>
                <ul>
                    <li><b>Front End :</b>CSS3,HTML5,Javascript</li>
                    <li><b>Front End Framework :</b>Bootstrap,Angular JS,jQuery,SweetAlert</li>
                </ul>
                <ul>
                    <li><b>Backend :</b>Java,JSP,xml</li>
                    <li><b>Backend Frameworks :</b>Spring MVC , Hibernate </li>
                </ul>
            </li>
            <li><b>Application Servicer :</b> GlassFish Server open source edition 4.1.1</li>
            <li><b>Database :</b> Hibernate ORM </li>
        </ul>
        <h3>Installation</h3>
        <h5>01.&nbsp;Development Environment - JDK 1.8.0</h5>
        <ul>
            <li><a href="https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html" style="text-decoration: none;">Download JDK 1.8.0</a></li>
        </ul>
        <h5>02.&nbsp;Development Platform - Netbeans IDE 8.1</h5>
        <ul>
            <li><a href="https://netbeans.org/downloads/" style="text-decoration: none;">Download Netbeans IDE 8.1 </a></li>
        </ul>
        <h5>03.&nbsp;Server - GlassFish Server</h5>
        <ul>
            <li><a href="https://netbeans.org/downloads/" style="text-decoration: none;">Download GlassFish 4.1.1</a></li>
        </ul>
        <h5>04.&nbsp;Configure glassfish with netbeans - <a href="https://docs.oracle.com/cd/E19798-01/821-1770/gioew/index.html" style="text-decoration: none;">Click here</a></h5>
        <h5>05.&nbsp;Configure hibernate in netbeans-<a style="text-decoration: none;" href="https://netbeans.org/kb/docs/web/hibernate-webapp.html">Click here</a></h5>
        <h5>06.&nbsp;Clone the repository and import it to netbeans</h5>
        <h5>06.&nbsp;Configure your <b>hibernate.cfg.xml</b> file in hibernate</h5>
        
        <hibernate-configuration>
            <session-factory>
                <property name="hibernate.dialect">org.hibernate.dialect.MySQLDialect</property>
                <property name="hibernate.connection.driver_class">com.mysql.jdbc.Driver</property>
                <property name="hibernate.connection.url">jdbc:mysql://localhost:{Port}/chirpdb?zeroDateTimeBehavior=convertToNull</property>
                <property name="hibernate.connection.username">{Your username}</property>
                <property name="hibernate.connection.password">{your password}</property>
                <mapping resource="POJOS/User.hbm.xml"/>
                <mapping resource="POJOS/Post.hbm.xml"/>
            </session-factory>
        </hibernate-configuration>
