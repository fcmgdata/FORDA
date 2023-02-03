[bs-138] Add categories (secure,open) to EndpointsProperties
Rename Import*AutoConfiguration classes    Rename Import*AutoConfiguration classes to AutoConfigure*.    Fixes gh-5692
Add POST to allowed CORS methods for CF actuators    Update CORS configuration to support POST.    See gh-7108
Improve diagnostics in DevTools integration tests    See gh-10454
Align simple sample with configuration properties validation change    See gh-8024
Simplify some code    See gh-17860
Change package name in sample
Remove autowired injection of HealthIndicators into HealthEndpoint    Moved into EndpointAutoConfiguration
Support binding to collection with EnumSet values    Fixes gh-15539
[bs-138] Add categories (secure,open) to EndpointsProperties
EventListenerMethodProcessor accepts internal configuration classes  Issue: SPR-17160
Use varargs for DefaultApplicationArguments    Closes gh-15142
Support EnvironmentAware ImportSelector/Registrar  Add support for the EnvironmentAware interface with ImportSelector and ImportBeanDefinitionRegistrar implementations.  Issue: SPR-10602
Skips Cassandra and Elasticsearch tests on Windows    Neither Cassandra nor Elasticsearch starts reliably on Windows. This  commit adds a custom class rule to the associated sample application  tests to skip them on Windows. A class rule is used rather than a  Unit assumption as we want to avoid starting Elasticsearch (done by  the application context) and Cassandra (done by a test execution  listener) and an assumption would be too late.
Polish 'Add separate property for Redis read and connection timeout'    See gh-23137
Improve DefaultCookieSerializer auto-configuration    Spring Session's own configuration support (i.e.  SpringHttpSessionConfiguration) will configure the default  DefaultCookieSerializer with rememberMeRequestAttribute if  SpringSessionRememberMeServices bean has been detected in the  application context.    In contrast, Spring Boot's auto-configured DefaultCookieSerializer does  not do this which results in a different out-of-the-box experience for  users that rely on Spring Session's remember-me integration.    This commit improves Spring Session DefaultCookieSerializer  auto-configuration to match Spring Session's behavior and make the  auto-configured DefaultCookieSerializer aware of  SpringSessionRememberMeServices bean.    See gh-16513
Allow CompositeHealthIndicator to be created with a Map as before    See gh-4965
Ignore unresolvable nested placeholders  The NamePatternEnvironmentFilter used to throw an exception if  placeholders in property values could not be resolved.    Fixes gh-8510
Make sure Caching is initialized before JPA support    The second level cache of Hibernate can be configured with dedicated  factories that look up for the presence of a cache infrastructure. As  Hibernate shouldn't have to know about Spring, that lookup is done  against the respective proprietary APIs.    We now make sure that caching (and the general purpose Hazelcast  auto-configuration) is fully processed before JPA kicks in. In particular  an explicit `dependsOn` attribute on those beans is added when they are  processed.    Closes gh-4158
Fix @ConfigurationProperties on @Bean methods without metadata caching    Due to a current limitation of Spring Framework, when bean metadata  caching is disabled, a merged bean definition may have a null  resolved factory method that would have been non-null if bean metadata  caching was enabled. Configuration property binding for @Bean methods  annotated with @ConfigurationProperties relied upon the resolved  factory method being enabled to find the @ConfigurationProperties  annotation and trigger property binding. As a result, when bean  metadata caching is disabled on the bean factory, such  @ConfigurationProperties beans would not be bound.    This commit works around the limitation by adding a fallback that  performs a reflection-based search for the factory method when the  resolved factory method on the bean definition is null. This allows  the bean's factory method and any @ConfigurationProperties annotation  on it to be found, ensuring that propoerty binding is then performed.    Fixes gh-18440
Polish 'Handle AbstractReactiveHealthIndicator.doHealthCheck exception'    Closes gh-10822
Guard IntegrationJmxConfiguration if no mBeanServer is available    Closes gh-12966
Properly discover endpoints that are proxied    Previously to this commit, if a `@ControllerEndpoint`,  `@RestControllerEndpoint` or `@ServletEndpoint` annotated bean was  proxied, the endpoint wasn't properly detected.    This commit makes sure that annotation retrieval works on the user class  while preserving the get (vs. find) retrieval semantic    Closes gh-12441
Properly handle InvalidEndpointRequestException    This commit makes sure that `InvalidEndpointRequestException` is wrapped  in a `ReflectionException` when invoked via JMX.    Closes gh-12857
Use String indexOf(char) and lastIndexOf(char) where possible    Closes gh-11416
Align ordering of BootJar and BootWar archive entries    Previously, the ordering of the entries in an archive produced by  BootJar was different to the ordering of the entries in an archive  produced by BootWar. The latter placed application classes before  any nested jars, whereas the former was the other way around.    This commit updates BootJar to use the same ordering as BootWar and  adds tests to verify that the ordering is the following:    1. Loader classes  2. Application classes (BOOT-INF/classes or WEB-INF/classes)  3. Nested jars (BOOT-INF/lib or WEB-INF/lib)  4. Provided nested jars in a war (WEB-INF/lib-provided)    The tests also verify that the position of a library is not affected  by it requiring unpacking.    See gh-11695  See gh-11696
Use entrySet() rather than using keySet() and then calling get(key)    Closes gh-4813
Improve diagnostics in DevTools integration tests    See gh-10454
Don\xe2\x80\x99t start child context for actuator endpoints when not embedded    Prior to this commit, EndpointWebMvcAutoConfiguration would start a  child context if the management port was different to the server port  and the application context was a web application context. This caused  two problems:    If a user built an executable war and configured the management port so  that it was different to the server port, their application would run  successfully when launched with java -jar, but it would fail when  deployed to Tomcat as an attempt would be made to start embedded Tomcat.    Secondly, if a user ran a test annotated with @WebAppConfiguration the  main embedded Tomcat instance would not be started, but the child  context would trigger the creation of a Tomcat instance listening on the  configured management port. This is unexpected as @WebIntegrationTest  or @IntegrationTest and @WebAppConfiguration should be required to have  the test trigger full startup of the application and listen on the  configured ports.    This commit updates EndpointWebMvcAutoConfiguration so that it will only  start a child context when the management port is different to the  server port and the EmbeddedWebApplicationContext has an embedded  servlet container. This resolves the two problems described above as  there will be no embedded servlet container when deployed to a  standalone container or when a test is run without @IntegrationTest.    Fixes gh-2798
Propagate Map conversion failures    Align `MapBinder` with `IndexedBinder` so that if a value is specified  any converter exception are propagated.    See gh-11493
Ensure that condition evaluator uses runner\xe2\x80\x99s class loader    Closes gh-13319
Fix relaxed binding of SI JMX config    Instead of using an expression for JMX-related properties, this commit  properly honors relaxed binding.    Closes gh-6184
Do not enable cglib if spring.aop.proxy-target-class is configured    This commit makes sure to honour the `spring.aop.proxy-target-class`  property if set by the user. Previously, the  `MethodValidationPostProcessor` was always configured to use cglib,  regardless of the value of that property.    Closes gh-8869
Fix startup failure when WebFlux auto-config is skipped    Prior to this commit, the `HttpHandlerAutoConfiguration` would rely on  the `WebFluxProperties` bean being present - this is most of the time  true when the appplication is using the WebFlux auto-configuration.    If the application is overriding the WebFlux auto-configuration and  providing its own setup, the properties bean is not present and we  should skip its usage.    Fixes gh-20891
Fix property detection in SpringApplicationBuilder    Update SpringApplicationBuilder so that properties of the form  `abc=d:e:f` are correctly parsed. Prior to this commit the `:` delimiter  would always be chosen over `=`, even if `=` occurred first.    Fixes gh-6121
Make sure Caching is initialized before JPA support    The second level cache of Hibernate can be configured with dedicated  factories that look up for the presence of a cache infrastructure. As  Hibernate shouldn't have to know about Spring, that lookup is done  against the respective proprietary APIs.    We now make sure that caching (and the general purpose Hazelcast  auto-configuration) is fully processed before JPA kicks in. In particular  an explicit `dependsOn` attribute on those beans is added when they are  processed.    Closes gh-4158
Add Jetty SSL keystore in classpath test    Update JettyEmbeddedServletContainerFactoryTests to test loading an  SSL keystore from the classpath. Currently this is a Jetty only feature,  although if https://issues.apache.org/bugzilla/show_bug.cgi?id=56777 is  fixed we could do the same thing with Tomcat.    Closes gh-1943
Add ApplicationContext to the EmbeddedServletContainerInitializedEvent
Update auto-configured ParameterNamesModule to use DEFAULT creator mode    The PROPERTIES creator mode has the unfortunate side-effect of stopping  mixins from working. This commit updates the auto-configured module to  use the DEFAULT creator mode instead.    Closes gh-4336
Add Binder backed CloudPlatform.isEnforced method    Update `CloudPlatform` with a new `isEnforced` method that's backed  by a `Binder` rather than the `Environment`. We'll require this when  we overhaul our external config data processing logic.    Closes gh-22498
Avoid early init of CacheManager    This commit restructures the Cache auto-configuration to avoid an early  init on CacheManager (and potentially all its infrastructure). Rather  than adding a dependency on the validator bean, this commit relies on  the fact CacheAspectSupport checks if a CacheManager is available in the  afterSingletonsInstantiated callback. In this case, a simple bean with  a postconstruct callback is enough.    Closes gh-13038
Add Binder backed CloudPlatform.isEnforced method    Update `CloudPlatform` with a new `isEnforced` method that's backed  by a `Binder` rather than the `Environment`. We'll require this when  we overhaul our external config data processing logic.    Closes gh-22498
Add Jetty SSL keystore in classpath test    Update JettyEmbeddedServletContainerFactoryTests to test loading an  SSL keystore from the classpath. Currently this is a Jetty only feature,  although if https://issues.apache.org/bugzilla/show_bug.cgi?id=56777 is  fixed we could do the same thing with Tomcat.    Closes gh-1943
Add 'client-name' property to specify a Redis client name    See gh-17330
Make all @Bean methods public    Fixes gh-1571
Be slightly more defensive in DataSource initialization    Adding an Order to the BeanPostProcessor and catching an exception  are enough to get a simple web app with @EnableGlobalMethodSecurity  and JDBC user details running. It actually doesn't solve an underlying  problem in Spring Security, but I'll deal with that separately.    See gh-1115
Fail fast when attempting to repackage a reproducible war    Maven's war plugin does not support reproducible builds, resulting in  the entries in the war file not being written in a consistent order  from build to build.    Closes gh-20176
Fix injection point with proxied DataSource    Prior to this commit, the `ApplicationContext` couldn't start with a  JDK-proxied `HikariDataSource` as the JMX auto-configuration was  attempting to inject a (too narrowed) `HikariDataSource`.    This commit rather injects a regular `DataSource` and attempt to unwrap  it as a `HikariDataSource`.    Closes gh-12271
Ignore parent contexts in message source auto-configuration    This commit applies the changes made in 68b55ad to 1.2.x (it was  originally only made in 1.0.x and master). It also adds some tests.    Closes gh-3803
Apply gridFsDatabase to auto-configured ReactiveGridFsTemplate    Closes gh-18284
Add Redis Sentinel database support    See gh-12556
Disable resource cache when DevTools is enabled    Closes gh-3794  Closes gh-3739
Add separate property for Redis read and connection timeout    See gh-23137
Make Kubernetes detection slightly more efficient    See gh-19002
Ignore parent contexts in message source auto-configuration    This commit applies the changes made in 68b55ad to 1.2.x (it was  originally only made in 1.0.x and master). It also adds some tests.    Closes gh-3803
Use posix long names when creating tar archive for image building    Fixes gh-19964
Add configuration key for GzipResourceResolver    This commit adds a new key that configures a GzipResourceResolver  in the resource handling chain.    Configuring an application with the following will add that resolver,  which checks for gzipped resources in the configured locations:    ```  spring.resources.chain.gzipped=true  ```    This means that if a resource 'style.css' is requested, the  GzipResourceResolver will look for resources named 'style.css.gz', which  should be a gzipped variant of the 'style.css' file. Note that this  resolver only checks for variants if the client supports the 'gzip'  encoding, as defined in the 'Accept-Encoding' HTTP request headers.    Fixes #4683
Support binding to collection with EnumSet values    Fixes gh-15539
Tune @ConditionalOnMissingBean for interface-based back off    Previously, a number of usages of @ConditionalOnMissingBean prevented  a bean that implements an auto-configured bean's 'main' interface from  causing the auto-configuration of the bean to back off. This would  happen when @ConditionalOnMissingBean did not specify a type, the  @Bean method returned the bean's concrete type, and that concreate  type implements a 'main' interface.    This commit updates such usages of @ConditionalOnMissingBean to  specify the 'main' interface as the type of the bean that must be  missing. This will allow, for example, the auto-configured  MongoTemplate bean to back off when a MongoOperations bean is defined.    Fixes gh-18101
Support binding to collection with EnumSet values    Fixes gh-15539
Support binding with multiple constructors    Update `DefaultBindConstructorProvider` so that binding to objects with  multiple constructors is allowed, as long as there is only one  non-public candidate.    Closes gh-23117
Update copyright year of changed files
Add serialization endpoint tests    Test basic serialization in Endpoint tests to ensure that JSON  can always be produced.
Add missing tests
Support binding to collection with EnumSet values    Fixes gh-15539
Fix Invalid target for Validator error    Update `PropertiesConfigurationFactory` so that the validator is only  set when it supports the target object.    Fixes gh-8149
Add support for lists in SPRING_APPLICATION_JSON
Add @Order annotations to conditions    Fixes gh-1574
Make all @Bean methods public    Fixes gh-1571
Support binding to collection with EnumSet values    Fixes gh-15539
Fix detection of WebApplicationType with context class    Closes gh-14589
Improve DefaultCookieSerializer auto-configuration    Spring Session's own configuration support (i.e.  SpringHttpSessionConfiguration) will configure the default  DefaultCookieSerializer with rememberMeRequestAttribute if  SpringSessionRememberMeServices bean has been detected in the  application context.    In contrast, Spring Boot's auto-configured DefaultCookieSerializer does  not do this which results in a different out-of-the-box experience for  users that rely on Spring Session's remember-me integration.    This commit improves Spring Session DefaultCookieSerializer  auto-configuration to match Spring Session's behavior and make the  auto-configured DefaultCookieSerializer aware of  SpringSessionRememberMeServices bean.    See gh-16513
Update to latest 1.3 code
Add missing copyright headers
Fix grape -> compiler package tangle    Fix package tangle by moving DependencyResolutionContext from the  compiler package to grape.    See gh-1004
Adapt to deprecation of StringUtils.isEmpty(Object)    See gh-23774
Delay property source initialization till LoggingSystem is initialized    Previously, the initialization of StandardServletEnvironment's  property sources in SpringBootServletInitializer led to debug logging  calls being made before the LoggingSystem had been initialized. As a  result, the system's default configuration was used and, in the case  of Logback at least, the debug logging was output to System.out  in a war deployment.    This commit updates SpringBootServletInitializer to delay the  initialization of StandardServletEnvironment's property sources until  after the LoggingSystem has been initialized, but still in time for  active profiles to be configured via servlet context parameters  (see gh-9972).    Closes gh-13736
Suppress debug log output during Logback initialization    Closes gh-12071
Update Johannes Edmeier author attribution    Congratulations to Johannes Edmeier on getting married!
Remove internal configuration properties validator cleanup    This commit removes the cleanup of the javax.validator.Validator that  can be created to validate @ConfigurationProperties binding as the  memory effect can no longer be reproduced.    Closes gh-10573
Add 'client-name' property to specify a Redis client name    See gh-17330
Make hot methods in-line friendly    Refactor a few hot methods so that they are more likely to be in-lined  by the JIT.    Fixes gh-11409
Ignore unbound collection properties if collection bound    As of Spring Boot 2.0, if Collection properties are specified in  multiple property sources, only the elements from the property source  with the highest precedence are used for binding. This caused an  `UnboundConfigurationPropertiesException` if the size of the collection  from the higher order property source was smaller and `ignoreUnknownFields`  was set to true.    This commit ignores unbound collection properties if the  collection was properly bound.    Fixes gh-16290
Drop RepackageTask.getDependencies()    Drop `RepackageTask.getDependencies` from the gradle plugin in favor of  exposing `getLibraries()` and using the callback.  Drop getDependencies
Remove unnecessary use of @Autowired in the samples
Disable DevTools property defaults in production    Update `DevToolsPropertyDefaultsPostProcessor` so that property defaults  are only added at development time. Properties are now added only when  `Restarter` is initialize or remote devtools is enabled.    Fixes gh-7014
Rename internal OutputCapture classes    Rename the internal versions of OutputCapture to prevent accidental  import.    See gh-5492
Fix detection of WebApplicationType with context class    Closes gh-14589
Add redirection to actuator endpoint    If a request to the actuator endpoint ends with a slash with Spring  HATEOAS on the classpath, an empty array of links is returned whereas  a request without the slash returns a response with all the expected  links to the actuator's other endpoints.    This commit adds an automatic redirection so that both URIs return the  expected result.    Closes gh-4575
Support case insensitive value for Cassandra's SchemaAction    Closes gh-8903
Polish 'Fix modifiers order'    Closes gh-11681
Align ordering of BootJar and BootWar archive entries    Previously, the ordering of the entries in an archive produced by  BootJar was different to the ordering of the entries in an archive  produced by BootWar. The latter placed application classes before  any nested jars, whereas the former was the other way around.    This commit updates BootJar to use the same ordering as BootWar and  adds tests to verify that the ordering is the following:    1. Loader classes  2. Application classes (BOOT-INF/classes or WEB-INF/classes)  3. Nested jars (BOOT-INF/lib or WEB-INF/lib)  4. Provided nested jars in a war (WEB-INF/lib-provided)    The tests also verify that the position of a library is not affected  by it requiring unpacking.    See gh-11695  See gh-11696
Align with Framework\xe2\x80\x99s removal of charset attribute from application/json    Closes gh-16979
Change DataSourceHealthIndicator details from 'hello' to 'result'    Closes gh-15136
Update admin MBean to only be ready when its own context is ready    Previously, if there was a hierarchy of SpringApplications, the admin  MBean would report that the application was ready as soon as any  application in the hierarchy was ready. This could lead to a client  trying to query a property in the environment before it's available.    This commit updates the MBean registrar to that the MBean only reports  that the application is ready when the context that contains the  registrar has refreshed and fired its ApplicationReadyEvent.    Closes gh-6362
Polish modifier declaration ordering    Follow that Java language specification.
Align ordering of BootJar and BootWar archive entries    Previously, the ordering of the entries in an archive produced by  BootJar was different to the ordering of the entries in an archive  produced by BootWar. The latter placed application classes before  any nested jars, whereas the former was the other way around.    This commit updates BootJar to use the same ordering as BootWar and  adds tests to verify that the ordering is the following:    1. Loader classes  2. Application classes (BOOT-INF/classes or WEB-INF/classes)  3. Nested jars (BOOT-INF/lib or WEB-INF/lib)  4. Provided nested jars in a war (WEB-INF/lib-provided)    The tests also verify that the position of a library is not affected  by it requiring unpacking.    See gh-11695  See gh-11696
Improve error message when BootJar or BootWar has no known main class    Closes gh-12712
Fix welcome page support in WebFlux    Prior to this commit, the welcome page support implemented in gh-9785  would override existing index views in both annotation and functional  variants.    This comes from the fact that the feature was implemented as a  `RouterFunction` configured in the main `RouterFunctionMapping` bean.  Due to ordering issues between mappings, this would override existing  application mappings in some cases.    This commit ensures that the welcome page `RouterFunction` is  contributed to the context in its own handler mapping, ordered after the  application ones.    Fixes gh-21909
Align ordering of BootJar and BootWar archive entries    Previously, the ordering of the entries in an archive produced by  BootJar was different to the ordering of the entries in an archive  produced by BootWar. The latter placed application classes before  any nested jars, whereas the former was the other way around.    This commit updates BootJar to use the same ordering as BootWar and  adds tests to verify that the ordering is the following:    1. Loader classes  2. Application classes (BOOT-INF/classes or WEB-INF/classes)  3. Nested jars (BOOT-INF/lib or WEB-INF/lib)  4. Provided nested jars in a war (WEB-INF/lib-provided)    The tests also verify that the position of a library is not affected  by it requiring unpacking.    See gh-11695  See gh-11696
Improve error message when BootJar or BootWar has no known main class    Closes gh-12712
Register any EventListener beans with auto-configured SessionFactory    Closes gh-7531
Improve error message when BootJar or BootWar has no known main class    Closes gh-12712
Add HANA to the lookup of well-known databases    See gh-15125
Add HANA to the lookup of well-known databases    See gh-15125
Defer disabling registry until Tomcat server is being created    Closes gh-16498
Fix DefaultPropertiesPropertySource package tangle    Relocate `DefaultPropertiesPropertySource` to fix a package tangle.    Closes gh-23383
Expose MongoDB's replica set name    Closes gh-20391
Automatically enable transaction management for Neo4j    This commit makes sure that `@EnableTransactionManagement` is  auto-configured with Neo4j. It actually reuses what was done in #8434,  making sure that the `Neo4jDataAutoConfiguration` is ordered properly.    Closes gh-8587
Auto-configuration of reactive Spring Session
Use PropertySources.stream() where possible    Closes gh-13724
Disable unnecessary database initialization    If a DataSource class is found in the classpath then  EmbeddedDataSourceConfiguration will not be used, so the in-memory  database will not be shutdown on application context closing.  As a result, unnecessary database initialization may cause subsequent  tests to fail, for example see [1].    [1] https://github.com/spring-projects/spring-boot/issues/1712
Ensure DispatcherServlet is available in a deployed WAR    The DispatcherServletAutoConfiguration had a condition on it that  meant it wasn't used at all if there was no EmbeddedServletContainerFactory.  It's amazing that any WAR ever deployed.    Also added some info logging to servlet and filter registrations.
Fix request factory used with TestRestTemplate withBasicAuth    This commit updates the behavior of withBasicAuth on TestRestTemplate  by trying to use the same request factory type as the underlying restTemplate.  If creation of a new instance of the configured request factory class fails,  it falls back to the `ClientHttpRequestFactorySupplier`.    See gh-15982
Apply gridFsDatabase to auto-configured ReactiveGridFsTemplate    Closes gh-18284
Don't limit collection sizes in property binding    Update PropertiesConfigurationFactory so that collections can grow  beyond 256 items. Prior to this commit configuration property binding  used the default `DataBinder.autoGrowNestedPaths` setting of 256.    Fixes gh-6436
Move `Assume` to spring-boot-test-support    Fixes gh-10866
Use Collections.addAll(...) instead of for loops    Replace various for loops which add items to collections with calls  to Collections.addAll(...).    Fixes gh-2277
Update copyright header    See gh-11510
Refine AliasFor usage    This commit makes sure to use `getAliasedStringArray` rather than  `getStringArray` as the latter does not work with ASM. While this will  probably be fixed in the core framework, this commit also adds dedicated  tests with ASM to ensure that the code works as expected.    Closes gh-6337
Remove unused imports
Fix break bug in for/foreach loops.
make constructor calls go through indy as well
make fielddata fields a plugin
Fix planner bug when mixing window functions and implicit coercions  A query that has: - window functions - implicit coercions - wildcard field references (e.g., SELECT *)  Such as:  SELECT *, 1.0 * count(*) OVER () FROM (VALUES 1);  Fails during planning with the following error:  java.lang.IllegalStateException: No mapping for field '0'     at com.google.common.base.Preconditions.checkState(Preconditions.java:197)     at com.facebook.presto.sql.planner.TranslationMap.rewrite(TranslationMap.java:114)     at com.facebook.presto.sql.planner.PlanBuilder.rewrite(PlanBuilder.java:72)     at com.facebook.presto.sql.planner.QueryPlanner.project(QueryPlanner.java:210)     at com.facebook.presto.sql.planner.QueryPlanner.visitQuerySpecification(QueryPlanner.java:128)     at com.facebook.presto.sql.planner.QueryPlanner.visitQuerySpecification(QueryPlanner.java:70)     at com.facebook.presto.sql.tree.QuerySpecification.accept(QuerySpecification.java:98)     at com.facebook.presto.sql.tree.AstVisitor.process(AstVisitor.java:22)     at com.facebook.presto.sql.planner.RelationPlanner.visitQuerySpecification(RelationPlanner.java:416)     at com.facebook.presto.sql.planner.RelationPlanner.visitQuerySpecification(RelationPlanner.java:97)     at com.facebook.presto.sql.tree.QuerySpecification.accept(QuerySpecification.java:98)     at com.facebook.presto.sql.tree.AstVisitor.process(AstVisitor.java:22)     at com.facebook.presto.sql.planner.QueryPlanner.planQueryBody(QueryPlanner.java:141)     at com.facebook.presto.sql.planner.QueryPlanner.visitQuery(QueryPlanner.java:97)     at com.facebook.presto.sql.planner.QueryPlanner.visitQuery(QueryPlanner.java:70)     at com.facebook.presto.sql.tree.Query.accept(Query.java:80)     at com.facebook.presto.sql.tree.AstVisitor.process(AstVisitor.java:22)     at com.facebook.presto.sql.planner.RelationPlanner.visitQuery(RelationPlanner.java:403)     at com.facebook.presto.sql.planner.RelationPlanner.visitQuery(RelationPlanner.java:97)     at com.facebook.presto.sql.tree.Query.accept(Query.java:80)     at com.facebook.presto.sql.tree.AstVisitor.process(AstVisitor.java:22)     at com.facebook.presto.sql.planner.LogicalPlanner.createRelationPlan(LogicalPlanner.java:176)     at com.facebook.presto.sql.planner.LogicalPlanner.plan(LogicalPlanner.java:80)
added license to some java files
Stops the algo as soon as possible in findSinglePath
allow subdomain access parent domain's network
improve documentation for alias annotation code
Test case clean up
Fix compilation after rebase
Inline SubscriptionHelper.isCancelled() (#6263)
Prevent 7.x nodes from joining cluster with un-upgraded 6.x .security indices (elastic/x-pack-elasticsearch#2921) (elastic/x-pack-elasticsearch#2940)  This is a forward-port of elastic/x-pack-elasticsearch/pull/2921.  original commit message:  Before this commit, a cluster with security enabled and backed by native-realm user permissions allowed rolled upgrades to clusters without upgrading the `.security` index. This resulted in the newly established 6.0 cluster not able to register the native-realm users previously established in the `.security` index. In order to fix this, one would have to rely on file-based users to re-configure and upgrade the `.security` index. Since this state is easily avoidable with an upgrade, this commit rejects the joining of upgraded nodes without upgrading the security index beforehand.  modifications:  Test with 7.x vs 6.x nodes.  Original commit: elastic/x-pack-elasticsearch@56f81bfb20e832a9690229da0cd33f2501d18a95
Fix more inspector warnings introduced by recent mergences
Fix a few typos  Minor changes to fix typos. Small adjustment to add a couple commas.
OM-DSL: add @since tags.
Use JDK Supplier for OperatorContext info supplier
Removed ArrayLength from CFG. Fixed an issue when scheduling Merge instructions within a block. If a block only consists of a single Merge instruction, we have to schedule this instruction as the first instruction.
Aggregations: Encapsulate AggregationBuilder name and make getter public  Close #7425
Factor in JOrphanUtils useful method
Remove unnecessary casts
include isValid in Assumption.toString(); minor javadoc fix.
warn instead of exiting if memory usage tracking options are used without VM support
Supported message on skip (transformer returns NULL)
Revert "Fix failing test"  This reverts commit c01f45fa59db126e928affccad596eca45c8c202.
Add missing mappers to MapperBuilders.   - completion  - geo_point  - geo_shape  - parent  - size  - ttl  Close #4423
Improve QueryBuilder to support VARCHAR condition
Use correct primary term for replicating NOOPs (#25128)  NOOPs should be, same as for indexing operations, written on the replica using the original operation term instead of the current term of the replica.
added NativeLibraryHandle.getName()
Fixed bug reported in ML by Andreas on the caching of indexed values. This fix should reduce also the memory occupied by the index nodes as well
Make String.format() calls, aside from those used in log statements, specify a Locale for consistent behavior.
Remove unused SourcePathResolver from AndroidManifest  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 09e36d4
Add default implementation to reduce duplication
Refactoring. Remove PACKAGE_NAME constant.
Improve error message for some Android SDK and NDK flows.  Summary: Certain code paths that required an Android SDK and NDK would use the methods returning an optional and then throwing a generic error message instead of using the methods that would throw the precise exception.  Test Plan: CI misconfigure NDK and build an ndk_library: before: `BUILD FAILED: Must set ANDROID_NDK to point to the absolute path of your Android NDK directory.` after: `BUILD FAILED: Buck is configured to use Android NDK version 12.1.2977051 at ndk.dir or ANDROID_NDK or NDK_HOME. The found version is 14.1.3816874 located at /Users/coneko/homebrew/opt/android-ndk`  Reviewed By: aiked  fbshipit-source-id: 413c971
Don't replace all 'connection' headers when sending h2c upgrade request (#7824)  Motivation:  There may be meaningful 'connection' headers that exist on a request that is used to attempt a HTTP/1.x upgrade request that will be clobbered.  Modifications:  HttpClientUpgradeHandler uses the `HttpHeaders.add` instead of `HttpHeaders.set` when adding the 'upgrade' field.  Result:  Fixes #7823, existing 'connection' headers are preserved.
Fix node method parsing with cached fields. (GR-16366)
Rename BASIC_SQL test group to HIVE_PARTITIONING
Added method to allow creation of new methods on-the-fly.
Reduced timeouts from 60 to 10 minutes to avoid long CI hangs
Update exception message according to review feedback.
`JsBundleGenrule`: `skipResources` does not skip JS  Summary: Fixes a problem with `js_bundle_genrule`, where `skip_resources` was also skipping the JS output itself.  Reviewed By: fromcelticpark  fbshipit-source-id: 8ea626b0e9
CAMEL-7999: Add more labels to components.
Convert DoctorConfig to @BuckStyleValue  Summary: - migrates to the new style of immutable - replaces `.of()` with constructor calls  Reviewed By: bobyangyf  fbshipit-source-id: 751323a8ab
[updated] scene2d widgets to have a size after being constructed. This is just so people are less confused when using widgets without Table. Call pack() if you change the size of a widget after construction and aren't using Table!
Method for instantiating a RelationshipTypeCreator so that it can be overridden
TIKA-468: Missing Silde-Count metadata for PPT files
Move JVM vendor detection to a global constant. Fix detection of Sun/Oracle JVM that only worked for older Sun branded JVMs.
bug 12364:  fixed export template with swift  status 12364: resolved fixed
Removed redundant import.
compute lock depth for MonitorIdNodes correctly when inlining during parsing
Name added methods in NodeFactory appropriately
SimonStewart: Upgrading to HtmlUnit 2.4  r6037
Throw ESIA if required field 'patterns' is not present in filter config.  If 'pattern_capture' tokenfilter is create / mapped without a 'patterns' settings we now throw an exception since this is a misconfiguration and likely due to the similar settings on related token filters.  Closes #3808
Clean up warnings in spring-test
Decrease visibility of inner classes. #1555  Possibility to instantiate private checks was added.  Fixes `PublicInnerClass` inspection violation.  Description: >Reports public inner classes.
Make Channel*Invoker package private
Use the Option annotation to specify CLI options for the sampler.
DRILL-1140: Add cast function from Timestamp to Time
clean delegated authn to wsfed
Add support for ValueProvider in JdbcIO.DataSourceConfiguration methods  Allows JdbcIO transforms to be fully templatized by providing ValueProvider support for the following methods: - create - withConnectionProperties - withPassword - withUsername
Exists API can send response body, closes #2072.
Remove shouldRetry from Cursor since it's never called
Watcher: Ensure correct method is used to read secure settings (#31753)  As SecureSetting is extended from Setting, you can easily accidentally use `SecureSetting.simpleString()` to read a secure setting instead of `SecureSetting.secureString()`. This commit changes this behaviour in some watcher notification services.
returning serverapiexceptions for prepare and cancel pool maintenance; making it consistent with other pieces of code
remove global phase metric, replaced with per-phase metrics
Enhance TargetNode equality to work with multiple repos  Summary: It's entirely possible for each repo to have targets with duplicate names, but which represent different rules. Currently when we build the Target Graph we only use the build target was for comparison, & this means that we're ignoring the repo the target is in. Fix that.  Test Plan: buck test --all
SimonStewart: Cleaning up some imports  r16101
test more javadoc code examples
Normalize template index settings before validating
GatewayAllocator: reset rerouting flag after error  After asynchronously fetching shard information the gateway allocator issues a reroute via  a cluster state update task. #11421 introduced an optimization trying to avoid submitting unneeded reroutes when results for many shards come in together. This is done by having a rerouting flag, indicating a pending reroute is coming and thus any new incoming shard info doesn't need to issue a reroute. This flag wasn't reset upon an error in the reroute update task. Most notably - if a master node had to step during to a min_master_node violation, it could reject an ongoing reroute. Lacking to reset the flag causing it to skip any future reroute, when the node became master again.  Closes #11519
Marked Jackson 1.x support classes as deprecated
Implement Class.getPackage().
Only reserve ids in reltype store, no other token store  since they just weren't built for it.
Provide 'with implementationType' overloads  Provided overloaded versions of `forField` and `forMethodParameter` that accept a `ResolvableType` implementation type (as opposed to a Class).  Primarily added to allow resolution against implementation types that have been created programmatically using `forTypeWithGenerics`.  Issue: SPR-11218
Rest improvements (#2113)  * Use DeferredResult in TGT creating endpoint  * Fix tests  * Create Jackson Writer only once  * Use StringBuilder over Formatter as it's almost 10x faster (355707.814 ops/s vs 2652050.343 ops/s)  * Add TODOs for tasks  * Extract stirng constants  * Do all the concatenations we can on start up. Add an initial capacity to the StringBuilder  * Iterate over values as keys are not used  * Log error in one line  * Remove TODO  * Cleaning checkstyle  * Do not use DeferredResult as we need to test it deeply  * Fix tests for non DeferredResult implementation
Propagate cxx.ldflags to Xcode project  Summary: This adds values in `cxx.ldflags` to `OTHER_LDFLAGS` field for generated xcconfigs. This brings `ldflags` on par with `cxx.cflags`(set to `OTHER_CFLAGS`) and `cxx.cxxflags` (set to `OTHER_CPLUSPLUSFLAGS`). Closes https://github.com/facebook/buck/pull/1756  Reviewed By: milend  Pulled By: milend  fbshipit-source-id: 0d9b81a
SQL: Improve handling of invalid args for PERCENTILE/PERCENTILE_RANK (#37803)  Improve the Exception and the error message returned when 2nd argument of PERCENTILE and PERCENTILE_RANK is not a constant.
cxx: thread in platform conflicting header whitelist for PCH rules  Summary: The PCH code was overlooked in the original change that added this.  Reviewed By: philipjameson  fbshipit-source-id: 0122783a15
add progress to indices status API
Move StateInternalsFactory to runners/core-java
Show location identity in graph dumps.
Changed Enclosed runner to ignore abstract classes. Before this change, an abstract enclosed class caused jUnit to throw an exception.
Random javadoc spruces for Maps.asMap/toMap and Ordering. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=49401524
Added new flag for compiler only flags to [cxx] section of .buckconfig  Summary: This diff provides a new flag 'compiler_flag' to the [cxx] section which is combined with the compiler flags but not the preprocessor flags from the config file.  Test Plan: Unit tests:  CxxPlatforms.combinesPreprocessAndCompileFlagsIsDefault CxxPlatforms.compilerOnlyFlagsNotAddedToPreprocessor
Improve Javadoc in SQL script support classes
adding missing finals
Include off-heap metadata size in MemoryWalker.RuntimeCompiledMethodAccess.
WW-4095 WW-4094 Changes how pattern is compiled to be once per instance and changes default regexp to match underscore
Make UnpooledDirectByteBuf, UnpooledHeapByteBuf and UnpooledUnsafeDirectByteBuf constructors public.  Motivation:  The constrcutors a protected atm but the classes are public. We should make the constructors public as well to make it easier to write your own ByteBufAllocator.  Modifications:  Change constructors to be public and add some javadocs.  Result:  Easier to create own ByteBufAllocator.
Use Constants.SESSION_PARAMETER_NAME instead "jsessionid".
Make otest tool optional in Apple platforms  Summary: Xcode 7 no longer ships `SenTestingKit` or its test runner `otest`, so this commit makes the `otest` tool optional and throws an exception if a test tries to use it when it's not present.  Test Plan: Updated unit tests. `ant java-test -Dtest.class=AppleCxxPlatformsTest`
allow for _ separator on top of camel case for mapping definitions
Fixed CS for Camel-Spark and regen
Update of committed tx id now only done in Transaction.doCommit().
All httpclient.execute calls always follow redirects. Deprecate the old method
Restored log lines to TRACE for notification post alias creation and open/close index Introduced specific log level for those in OpenCloseIndexTests#testCloseOpenAliasMultipleIndices
Fix FakeProjectFilesystem.getFilesUnderPath()  Summary: `FakeProjectFilesystem.getFilesUnderPath()` is broken in a bunch of ways currently. It had no tests, so it sadly regressed.  1) `ProjectFilesystem.walkRelativeFileTree()` is polymorphic, but the most general version of the API which takes an `EnumSet<FileVisitOption>` was private, so `FakeProjectFilesystem` could not override it.  2) `ProjectFilesystem.getFilesUnderPath()` incorrectly converted the project-relative path to an absolute path before passing it to `ProjectFilesystem.walkRelativeFileTree()`. That method requires a project-relative path.  3) `FakeProjectFilesystem.getFilesUnderPath()` was implemented to always return the empty set.  Test Plan: New test added. Confirmed it failed until I fixed all above issues.
Automatic messageType detection for ChannelInboundMessageHandlerAdapter
Minor improvements in the local and the queue scheduler
Migrate NOT_EQUAL operator for arrays to new framework
Add config for controlling how ABIs are generated  Summary: See doc comments on `AbstractJavacOptions.AbiGenerationMode`. Note that generation from source files is to be implemented.  Examples:  Enable generation of ABIs from source: ``` [java]     abi_generation_mode = source ```  Validate that your code is ready for ABI generation from source, but still generate ABIs from classes: ``` [java]     abi_generation_mode = migrating_to_source ```  Test Plan: New unit tests  Reviewed By: dreiss  fbshipit-source-id: 356a83c
Add default method getColumnTypes to SystemTable
Set instance variables to null so that we don't OOM exceptions when using m2
Added <p> tags to javadocs paragraphs.  ----Release Notes---- [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=90613025
Fix datafeed with date_histogram aggregation (elastic/elasticsearch#876)  date_histogram buckets return the key as a DateTime object. This PR checks if the key is DateTime and returns the epoch millis when suitable.  Fixes elastic/elasticsearch#869  Original commit: elastic/x-pack-elasticsearch@8e39760dad55e07c9f216f59ed673fb8344da202
[java] Moving marionette specific test to the corresponding class
Make Hive view error message a constant
Add random read failures in unit tests to test the retry logic added to S3BlobContainer.openInput()
Fix ticket registry cleaner to process durations correctly. Stop the scheduler if itâs disabled.
HIVE-7314 : Wrong results of UDF when hive.cache.expr.evaluation is set (Navis reviewed by Ashutosh Chauhan)
refactor to move commit logic control inside the database implementation
Add support to buck for unbundled resources  Summary: Fixes #699  Verified this by adding the unbundled_resources_root and running tests that access resources via `getResource` which relies on the file path. Closes https://github.com/facebook/buck/pull/1435  Reviewed By: dreiss  Pulled By: dreiss  fbshipit-source-id: ae63062
Rename transaction type to write state, update setter name.
sulong: rename LLVMScanner#parseBitcodeBlock to #parseBitcode
Make PrecompiledHeaderData implement AddsToRuleKey  Summary: This allows us to remove the custom appendToRuleKey in CxxPreprocessAndCompile and will allow us to correctly derive its deps automatically.  Reviewed By: ttsugriy  fbshipit-source-id: c0bacf2
Renames class to match pattern used in Tiles
Small fix to test and toString(); add helpful check for bad use of item/user pref array
break down of strategy to composable parts
CAMEL-1408: Fixes setting absolute paths using the file component.
Fix match_phrase_prefix query with single term on _all field (#20471)  * Fix match_phrase_prefix query with single term on _all field  This change fixes the match_phrase_prefix query when a single term is queried on the _all field. It builds a prefix query instead of an AllTermQuery which would not match any prefix.  Fixes #20470  * Add missing change
Move InMemoryStateInternals to runners/core-java
[hotfix] [checkpoints] Remove never used method 'close()' on CheckpointStreamFactory  The fact that the method was never called (and never implemented) strongly suggests that it should be removed, otherwise someone might eventually end up implementing it for a new state backend and wonder why it is never called.
Resync fails to notify on unavaiable exceptions (#33615)  We fail to notify the resync listener if the resync replication hits a shard unavailable exception. Moreover, we no longer need to swallow these unavailable exceptions.  Relates #28571 Closes #33613
[streaming] API javadoc + StreamRecordSerializer update
Make Arrayblock, MapBlock, RowBlock support mayHaveNull
Remove SourcePathRuleFinder from LuaScriptStarter  Reviewed By: bobyangyf  fbshipit-source-id: bde6ca646a
https://issues.apache.org/jira/browse/AMQ-3205 - Update ActivationSpec, patch applied with thanks
Remove empty PartitionedLookupSourceFactory.close() method
fix usage of deprecated apis
ExternalUUID control: enforce checking uuid validity by defining checkUUID method in the corresponding absract class, and performing the check during API command dispatching
Updated license header to 2018
Fixes due to changes in master branch.
Issue #2161: unify test input locations
Adding a method to enable insecure cert support via FirefoxOptions
Move verification of valid final CacheResultType earlier  Summary: Currently this is only verified in the console eventbus listener. By that point we've lost a lot of the context of how this got set to this value.  Add a couple places much earlier that will verify this.  Reviewed By: philipjameson  fbshipit-source-id: 2a2f488b4c
Put nonoss under Spring framework
Added test for SpringProperties setFlag method  Issue: SPR-9014 Issue: SPR-11297 (cherry picked from commit 23249cd)
Added Bigtable Read DisplayData
Fix errors reported by javadoc  Motivation:  Javadoc reports errors about invalid docs.  Modifications:  Fix some errors reported by javadoc.  Result:  A lot of javadoc errors are fixed by this patch.
AbstractCxxLibrary: don't extend `NativeTestable`  Summary: This belongs on the actual concrete classes, rather than the base interface for C/C++ libs.  Test Plan: CI  Reviewed By: Coneko  fb-gh-sync-id: 6b2b888
Replaced `new HashMap` with `Maps.newHashMap` in our codebase.
Add ByteBuf leak detection @Rule  This commit introduces a JUnit rule that detects ByteBuf leaks in subclasses of AbstractDataBufferAllocatingTestCase.
Make PageLoader an interface.
Fixed bug on using remote indexes reported in ML
Add resource_union_package for android_binary  Summary: When I committed "Add resource_union_package for android_library", I forgot that we do our own R.java generation for the uber R.java, rather than using the one from aapt.  This makes resource_union_package work on android_binary (for uber R.java) to make sure those resource ids are available at runtime.  Test Plan: Ran the app in question, rather than just building it. :)
Use ILLEGAL.equals(value) in ValueUtil.isIllegal
CAMEL-8184 Add support to set/retrieve custom headers in S3 for Producers & Consumers
Two way sync with moe (#1108)  * Enable v12 for GMS auth and add v12 visibilitys for it, FamilyLink, and libraries/kids. This is all building up to upgrading FamilyLink to v12.  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=167909893  * fix a Moe sync directive error  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=169141166  * Replace occurrences of Wrapped.valueOf(...) with Wrapped.parseWrapped(...) where the value will be immediately unboxed anyway.  The change removes small-but-pervasive inefficiencies from creating and immediately discarding instances of the wrapped value, as well as removing unnecessary syntax.  More information: go/lsc-immediateunboxing  Tested:     tap_presubmit: http://test/OCL:189509157:BASE:189708880:1521556795490:d7b0a09a     Some tests failed; test failures are believed to be unrelated to this CL  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=189880661  * Fix bug that MediaHttpDownloader couldn't specify a size larger than 4G.  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=192165502
Internal: resolve a few compiler warnings  @NotThreadSafe is not a valid standard java annotation. Removed unused method and empty @param javadoc annotation  Original commit: elastic/x-pack-elasticsearch@3583bcfa66362f5b3b99e7f6d33df5b985d9c688
Make EvaluationException more informative  Update EvaluationException to expose the toDetailedString() method as the exception message. The simple message can now be accessed via the new getSimpleMessage() method.  Issue: SPR-10938
Internal testing change  ----Release Notes---- ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=97257395
[fixed] Actor.visable -> Actor.visible [fixed] Removed iterating over children with fancy for loop syntax.
Updated the graph-algo component to match the changes to Uniqueness in the traversal framework.
Use configured time zone for logging in test harness  This commit fixes a problem where configured time zone for log files was not used for the user log. `Neo4jRule` used to ignore the `dbms.db.timezone` setting. Thus neo4j.log and debug.log contained different time zone offsets in logged timestamps.
fix tests with json and yaml registries
Allow recursive directory traversal to be configured  Right now there is no way to configure this value, even if Hive is configured to support recursive directory traversal/subdirectories. This commit exposes the variable through a HiveClientConfig value.
CAMEL-217: Persistent aggregator load tests.
Add better validation error message and a dedicated test
Throw exception for delete from unpartitioned Hive table
Add setSchema convenience method.
Remove unnecessary imports
minor refactor: slightly earlier return for some AST transform validation checks
SPR-8429 Add test cases for missing header, cookie, and pathvar values
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=48230 Remove unused imports. Patch provided by sebb.
[BEAM-3842] Allow static methods to be defined inside PipelineOptions.
CAMEL-6792: Added getMockEndpoint method to not auto create. Thanks to James Carman for the patch.
fixed timing issue in shutdown logic of Queue component along with making the a test case a little less noisy when ran
Move extractSymbols to SymbolsExtractor
Fix infinite cycle and add testcase for preventing cycles creation
Use Splitter instead of String.split, in InternetDomainName.  RELNOTES=n/a  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=193087177
Removing extra empty lines
[javadocs, network] Add javadocs to SpanningRecordSerializer and RecordSerializer
reformat  Revision created by MOE tool push_codebase. MOE_MIGRATION=2324
Add the cause exception string when failing to write the chrome trace file.  Test Plan: Unit Tests
Fix a bug where store migration forgets about legacy indexes.  IndexManager now also respects the availability guard (by virtue of transaction begin) when creating an index.
Ensure we only call ReferenceCountUtil.safeRelease(...) in finalize() if the refCnt() > 0  Motivation:  We need to ensure we only call ReferenceCountUtil.safeRelease(...) in finalize() if the refCnt() > 0 as otherwise we will log a message about IllegalReferenceCountException.  Modification:  Check for a refCnt() > 0 before try to release  Result:  No more IllegalReferenceCountException produced when run finalize() on OpenSsl* objects that where explicit released before.
Reduced debug output
assign names to threads that do not have one.  patch by jbellis
Remove some default methods and annotations  Summary: Not needed  Reviewed By: ttsugriy  fbshipit-source-id: b3ea341993
Replace Parser with DaemonicParserState in PerBuildState  Summary: This change removes the dependency of `PerBuildState` on `Parser` by passing `DaemonicParserState` directly.  It seems that `DaemonicParserState` was designed initially to be an implementation detail of `Parser`, but it's accessed from `PerBuildState`.  The state after these changes is not ideal, but it's better to not have cyclic dependencies between classes.  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: 0b4517c
plugins: fix print of url when it contains spaces
Fix more inspector warnings introduced by recent mergences
Add ByteBuf leak detection @Rule  This commit introduces a JUnit rule that detects ByteBuf leaks in subclasses of AbstractDataBufferAllocatingTestCase.
Added Texture#toString.  Sometimes it's the little things.
Replace ResolvedJavaType.isFinal with more meaningful and correct isLeaf
Added comments for the search builder classes on how to use them
Updated OProfiler. Added getContext API
Java API: ActionFuture#actionGet to automatically unwrap failures, closes #1292.
make Token serializable again for JMX
SubProtocolWebSocketHandler checks if session is open  Issue: SPR-12812
MAHOUT-1258: Another shot at findbugs and checkstyle - removed unused imports
Avoid missed signals on a default promise  Motivation:  Today when awaiting uninterruptibly on a default promise, a race condition can lead to a missed signal. Quite simply, the check for whether the condition holds is not made inside a lock before waiting. This means that the waiting thread can enter the wait after the promise has completed and will thus not be notified, thus missing the signal. This leads to the waiting thread to enter a timed wait that will only trip with the timeout elapses leading to unnecessarily long waits (imagine a connection timeout, and the waiting thread missed the signal that the connection is ready).  Modification:  This commit fixes this missed signal by checking the condition inside a lock. We also add a test that reliably fails without the non-racy condition check.  Result:  Timed uninterruptible waits on default promise will not race against the condition and possibly wait longer than necessary.
fixed issue with type detection from string for values starting with '-', issue #2924
Bulk API: Rename `index` to `_index`, `type` to `_type` and `id` to `_id`, closes #421.
Move CodeSignIdentityStore.DEFAULT_IDENTITIES_COMMAND to AppleConfig  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: b7b9958
Delete IndexAPI: Allow to delete more than one index or _all indices, closes #791.
Profiler: new metric "server.network.requests" as the sum of binary and HTTP requests
CLOUDSTACK-1862 Added vm ip address info in the list PF rules response  Signed-off-by: Abhinandan Prateek <aprateek@apache.org>
these tests were failing on windows where File.delete fails if the file is still open.
[updated] scene2d widgets to have a size after being constructed. This is just so people are less confused when using widgets without Table. Call pack() if you change the size of a widget after construction and aren't using Table!
TIKA-1412 - Add UnitTest
Move ParseBuckProfilerReportEvent to an appropriate package.  Summary: Otherwise an attempt to add a dependency on it leads to cyclic deps.  Reviewed By: jtorkkola  fbshipit-source-id: a4c9665
Pass Elemets to Types constructor now that circularity is eliminated  Summary: Now that all `TreeBackedElement` creation happens in a separate class, there's no longer a circular dependency between `TreeBackedElements` and `TreeBackedTypes`. Taking advantage of that for a slight simplification.  Test Plan: CI  Reviewed By: asp2insp  fbshipit-source-id: 98915d9
Added lastTransactionCommitTimestampWhenStarted to interface
removed ResolvedJavaMethod.getCompiledCodeSize()
Avoid AssertionError when closing engine (#43638)  Lucene throwing an AlreadyClosedException when closing the engine is fine, and should not trigger an AssertionError.  Closes #43626
[added] OpenAL native to LWJGL. [removed] newTexture method that takes a ByteBuffer. It's all going away anyway.
Remove Statement from ResourceGroupSelector.match()
Revert "Added improved debugging for incorrect message handling."  This reverts commit 95c36934adc838666aebb2200d7ee6a647d01a49.  Since there's no longer a specific need for it.
CAMEL-9885: Camel-NATS: Add an option to specify the optional reply subject
Increase default http timeout threads  With a default of one thread, it's impossible to tell if there's a backlog of http requests that need to be timed out.
Added ChannelBuffer.readSlice() methods in case a user doesn't want to copy at the risk of modified content
Revert "Consistent naming style for enum"  This reverts commit 4feafc4a5226c6307f5a9b36665d8fe8d8a05072.
Revert "Use ImageStage Enum instead of specific methods to represent run-context."  This reverts commit a75fd00fc074a1e3107e86ce5eb031595c7bbb36.
Introduce alias for 'value' attribute in @Payload  This commit introduces 'expression' as an alias for 'value' in @Payload.  Issue: SPR-11393
bug 12364:  fixed export template with swift  status 12364: resolved fixed
Add missing line to license header
added bean name assertions
Revert "All SFBuilder setters return 'this' & use varargs"  This reverts commit 0e2ce565c9ef64d97299836a3b979b2cf85de759.
Adding missing license header
api.object: add some missing javadoc
Adding missing license header
bug 10848: Change function signatures to accept capacity type as an object..
Pass CxxTest its SourcePathResolver from runTests context  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 648fb82
[streaming] streamrecord add method and tests updated
Drop remaining getSlice methods from temporal field value providers
Rewrite getVariableNameTypesMapping to new Type
Move loop phi recursive usage optimization from loop begin simplification to loop phi canonicalization.
Extra method instead of base implementation of next
Refactoring to put the unit tests for the checks into the proper package.  Side note: Eclipse makes this refactoring very easy to do. As part of the move it performs all the CVS operations that are required for moving a file. I actually like the Eclipse support for CVS, I thought nothing would beat good old Emacs.
Fix match_phrase_prefix query with single term on _all field (#20471)  * Fix match_phrase_prefix query with single term on _all field  This change fixes the match_phrase_prefix query when a single term is queried on the _all field. It builds a prefix query instead of an AllTermQuery which would not match any prefix.  Fixes #20470  * Add missing change
Handle non-equijoins with negated expressions  Normalize join criteria to support expressions like "not(l.x = r.x)"
Minor refactoring: remove duplicated code
Updated the graph-algo component to match the changes to Uniqueness in the traversal framework.
Add default implementation to reduce duplication
Deleting unused imports
turned requestedSessionId into a settable property
Issue #1604. Remote bag. Fix embedded serialization
include last value in cause when error occurs in takeUntil(predicate)
Minor docfix in Iterators.java. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=61749084
Fix @RequestBody argument processing for null Content-Type  Since the changes introduced in SPR-12778, some `@RequestBody` args would not be properly processed in some cases:  * requests with an empty body * no Content-Type header defined  This typically happens when GET requests are mapped on a handler dealing with POST requests and HTTP bodies.  This change makes sure that the `RequestResponseBodyMethodProcessor` is only involved for requests that:  * have a Content-Type defined * OR are HTTP requests eligible for an HTTP body (PUT, POST, PATCH)  Issue: SPR-13176 Fixes spring-projects/spring-boot#3313
Revert my previously not so clever implementation. If there is an executor being used, then one shall expect that the executor is reporting the numbers of threads itself, and it should no longer be the responsibility of the connector
We should let a client change the client id on a connection even if it was set on the connection factory.
Mark methods final if they are used in constructors. #1555  Fixes `OverridableMethodCallDuringObjectConstruction` inspection violations.  Description: >Reports any calls to overridable methods of the current class during object construction. A call is during object construction if it is made inside a constructor, in an non-static instance initializer, in a non-static field initializer or inside a clone(), readObject() or readObjectNoData() method. Methods are overridable if they are not declared final, static or private. Such calls may result in subtle bugs, as the object is not guaranteed to be initialized before the method call occurs.
Profiler: new metric "server.network.requests" as the sum of binary and HTTP requests
KAFKA-6148; ClassCastException in connectors that include kafka-clients packages (#4457)  Exclusion for packages that need not be loaded in isolation needs to be extended to all the `org.apache.kafka` packages (that do not belong to transforms and the other whitelisted packages). Most notably, this refers to any classes in `kafka-clients` package.   Reviewers: Randall Hauch <rhauch@gmail.com>, Jason Gustafson <jason@confluent.io>
Internal: Deguice IndicesService  Almost all the dependencies of indices service are already created outside of guice. This change deguices MetaStateService, and then IndicesService.
Summary: Fix bridge parsing when bridge names are subsets of others  Detail: There are several places in the code that do a "brctl show | grep bridgeName" or similar, which causes all sorts of problems when you have for example a cloudVirBr50 and a cloudVirBr5000. This patch attempts to stop relying on the output of brctl, instead favoring sysfs and /sys/devices/virtual/net. It cuts a lot of bash out altogether by using java File. It was tested in my devcloud-kvm against current 4.0, as well as by the customer reporting initial bug.  BUG-ID: CLOUDSTACK-938 Fix-For: 4.0.1 Signed-off-by: Marcus Sorensen <marcus@betterservers.com>
* SecureChatServerHandler should use ChannelGroup where possible * Moved MapBackedSet and its test class to org.jboss.netty.util becuase it's used only there
fixed parent propagation of configuration in OrientDBConfig, issue #7728
HtmlUnitDriver: Throwing NoSuchWindowException if the current window was closed.
Cleanup: removal of unused imports
Correct documentation for Splitter#withKeyValueSeparator(Splitter)  RELNOTES=n/a  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=220473960
Renamed @WebTests to @WebTest  @WebTests has been renamed to @WebTest so that the Gradle build does not attempt to run it as a JUnit test.
Adding licence header to files to make the build pass
working on ctor args
[FLINK-10089][tests] Update FlinkKafkaConsumerBaseMigrationTest for 1.5
Added missing @deprecated tags - they are not copied from the interface.
HtmlUnit: Fix getAttribute for dynamic properties.  Signed-off-by: Simon Stewart <simon.m.stewart@gmail.com>
Add context to RealAndroidDevice.rmFiles() errors  Summary: This will just hide higher stack frames and include a message that we were trying to delete files on a particular device (with its id).  Reviewed By: asp2insp  fbshipit-source-id: f301f92
Add an inline assembler node construction method in the facade
Added additional log statements for attribute processing
Renamed LeftCurlyCheck to AbstractLeftCurlyCheck. Completely happy with the name. :-)
Working on authn handler ordering
2.x: clarify dematerialize() and terminal items/signals (#5897)
Fix SQL CONTAINS with lists of lists  Resolves: #8653
Remove unused PhasePosition.HIGH_LEVEL.
Enable Docker in the PortableDirectRunner  Add an EnvironmentType which allows the PortableDirectRunner to construct either in-process environments or docker environments.
removed unused method DeoptimizingNode.isCallSiteDeoptimization()
Fix a bug in the regex that matches native library file names.  Summary: iknowregex  Test Plan: Added a unit test.
Optimized scalar observeOn/subscribeOn
WW-4713 Added deprecation warnings as preparation to drop searchValueStack attribute from the <s:text/> tag
cleaned up some tests to clean up after themselves
Enables implementations of the BlobContainer interface to (#19749)  conform with the requirements of the writeBlob method by throwing a FileAlreadyExistsException if attempting to write to a blob that already exists. This change means implementations of BlobContainer should never overwrite blobs - to overwrite a blob, it must first be deleted and then can be written again.  Closes #15579
Remove ToolchainProvider from constructor of AndroidPrebuiltAarDescription  Summary: Instead use `ToolchainProvider` from `BuildRuleCreationContext`.  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: bfc1f4a
Reverted correct size() calculation because of the performance penalty that would come with it. A solution to/existence of size() will have to revisited later
Move PlanPrinter to sql.planner.planPrinter package  extraction of inner-classes as package-private top-level classes will follow.
[TEST] Add test for restoring into a shadowreplica enabled index
Unused imports Tidy error handling
make fielddata fields a plugin
CLOUDSTACK-8833: Fixed  Generating url and migrate volume to another storage , resulting two entry in UI and listvolume is not working for that volume Update the volume id in volume_store_ref table to newly created volume for migration
Mark RemovalListener and Weigher as Java 8 FunctionalInterfaces  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=143461582
- Gaurd access to dispatched list ( a sync was missing). - Added better exception messages to know what happened when a slave subscription gets out of sync with the master. - Implemented a simpler isFull()
Update special-cases of GroupAlsoByWindow to use getOutputTimestamp  ----Release Notes---- [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=99225882
Truffle: added compilation graal tier finished event to compilation listener.
Fixed nullshape indexing. Closes #3310
Tweaks necessary to make common.collect build in Java 8. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=65201740
Added allowIpod to IOSApplicationConfiguration  Added a new variable to IOSAppConfig called allowIpod in order to be able to play the game without stopping the background music from iPod app. Also, modified the constructor of IOSAudio to pass the IOSApplicationConfiguration from IOSApplication.
Move schema guard to global dependencies.
an empty array is now returned by ResolvedJavaType.declaredFields() for array and primitive types
Bug fix with the ldap principal id when no attributes are found if they are resolved elsewhere via person directory, etc.
Recognize that the reason for an early completion might be cancellation rather than exception. This fixes the bug "com.google.common.util.concurrent.AbstractFuture$Cancellation cannot be cast to com.google.common.util.concurrent.AbstractFuture$Failure"  TODO(cpovirk): Write basher tests at some point. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=96784416
Simplify getting topic connection
SimonStewart: Marking failing chrome tests as ignored to green the build.  r16358
Remove some default methods and annotations  Summary: Not needed  Reviewed By: ttsugriy  fbshipit-source-id: b3ea341993
Support username and metadata in TransactionData events
CAMEL-8561: Better component docs summary of components - we use javadoc from the endpoint class instead of component so its in the same source file as @UriEndpoint.
Texture, fixed filter on reload.
Update version.
Fixed the doc for the network offerings
All httpclient.execute calls always follow redirects. Deprecate the old method
Add support for splitting a compressed source for uncompressed files  This adds support for splitting the file if the file name does not end with one of the supported compression formats (currently gz and bz2) and the delegate source also supports splitting.  This is for Apache Beam.  ----Release Notes----  [] ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=114894950
Use supplier to pass rules to exclude around AndroidBinary  Summary: This will allow to pass `rulesToExclude` to `AndroidBinaryGraphEnhancer` from `AndroidInstrumentationApkDescription` as a supplier which will be used in the following changes to avoid the instantiation the whole set.  Reviewed By: jtorkkola  shipit-source-id: 6a39074075
MatchableHandlerMapping extends HandlerMapping and lives in web.servlet.handler now  Issue: SPR-14321
Remove the annotation output of the abi targets from the source folders  Summary: This avoids adding duplicate classes to IntelliJ.  Reviewed By: asp2insp  fbshipit-source-id: b4b19109ee
Made sure that named filters and queries defined in a wrapped query and filter are not lost.  Closes #6871
Account for inner classes in test filtering  Summary: Test filtering does not work if you ask the test runner to run something like com.facebook.buck.rules.CachingBuildEngineTest$OtherTests  Test Plan: manual  Reviewed By: aiked  fbshipit-source-id: 9051ecf
Useful iterator util fromEnd
Fix usage of "parent" as a projection name in SQL  Resolves: #8565
Fix predicates for Raptor system.tables  Remove lowercase and fix handling of multiple values.
- Fix strongValues key/value confusion reported on guava-discuss. - Make HostAndPort's port field final.  Revision created by MOE tool push_codebase. MOE_MIGRATION=2004
2.x: Add empty source clauses to javadocs of combineLatest operators accepting unspecified number of sources. This commit resolves #5412 (#5413)
Add isLinked method to ResolvedJavaType
Replace ResolvedJavaType.isFinal with more meaningful and correct isLeaf
Polishing  Issue: SPR-10469
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=55110 Small performance improvements Patch provided by Adrian Nistor
Composite transform lambdas via PTransform::compose
Mapping updates on objects should propagate `include_an_all`. #20051  Today you can't update `include_an_all` on an existing object. The bug affects 2.x too.
Minor tweaks to tests to reduce memory usage WW-1715
NaaS: Remove IsServiceProvider() functions  If the element is the service provider for this network, then can be tell from network offering. We don't need these functions in the interface.
doh - added the correct headers
TraceRA: handle ShadowedRegisterValue correctly.
make entries in diagnostics zip file have relative path names
Remove unused SourcePathResolver from CxxInferCaptureTransitive  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: bbceadb
Removed unused imports.
Issue #2137: Make test for FileTabCharacter locale and OS independent
HIVE-7605: add more javadoc to HivePrivilegeObject (Thejas Nair via Jason Dere)
Include current date and time in Chrome trace filename  Summary: Does what it says on the tin.  Test Plan: Unit test included. Ran 'buck project', confirmed trace file had expected format.
STORM-1017: Ignore ignoreZkOffsets for trident.
Fixed unused and deprecated statements
Fix some failing tests. No regression in Tomcat/Jasper, just need to take account of changes in test framework.
Shutdown and release log files, and bad collector report file.
tell the PendingMessageCursor how many messages you want - for more efficent polling from store
Fix robolectric res_directories paths.  Summary: The RobolectricTest rule was using PathSourcePath.toString to construct the paths list that got passed to the runner. The way the string was constructed ended up depending on whether the ProjectFileSystem rootPath was terminated with a slash or not. The tests didn't catch this because they were using a FakeProjectFilesystem with an empty root path. The fix is to have RobolectricTest use the resolver to convert a SourcePath to a Path and then a String.  Test Plan: build buck, run robolectric tests, make sure they pass.
encrypt oidc tokens support
[FLINK-10569][runtime] Remove Instance usage in ExecutionGraphDeploymentTest
Provide support for VirtualMemoryProvider implementations
add some missing @Nullable  Summary: @public Add some missing Nullable annotations following Eradicate warnings  Test Plan: Buck CI  Reviewed By: Coneko, dreiss  fbshipit-source-id: b4318a8
GROOVY-7134: Fix potential NPE and reorder tests for faster execution
More detailed description of the expected behavior when evaluating interactive and non-interactive sources
[streaming] uuid update
Remove direct implementation declaration of SupportsInputBasedRuleKey interface for ModernBuildRules.  Summary: `ModernBuildRule` already implements `SupportsInputBasedRuleKey` interface so no need to directly depend on `SupportsInputBasedRuleKey` from Rules.  Reviewed By: styurin  fbshipit-source-id: ba4b2bf1eb
Forces segment merge before reading term frequencies  because otherwise it was possible to observe a state where there were non-unique terms in the index, but instead of Lucene reporting a docFreq > 1 on a single term it would report that term multiple times each with docFreq == 1. This would break a fundamental constraint in the uniqueness checking algorithm.
DRILL-976: Fix extract second to return only second portion of interval; exclude hours, minutes
SyncedFlushResponse to implement ToXContentObject (#31155)  The response currently implements ToXContentFragment although the only time it's used it is supposed to print out a complete object rather than a fragment. Note that this is the client version of the response, used only in the high-level client.
clear pixMap page to remove texture artifacts
spring: Remove annotations from interfaces and abstract classes  Signed-off-by: Rohit Yadav <bhaisaab@apache.org>
MAHOUT-1214: Improve the accuracy of the Spectral KMeans Method - minor code cleanup
HIVE-7314 : Wrong results of UDF when hive.cache.expr.evaluation is set (Navis reviewed by Ashutosh Chauhan)
Rename "basic" configuration to "native"
Thirdparty tests go in the thirdparty package   r5641
ensure backup metadata is cleaned up for service matches
added unit test based on user forum reported issue
Adapt bwc versions after backporting #31045 to 6.3
Prevent possible NPE (from the testbeans branch, but unrelated).
Allow noop PutUser updates (#35843)  When assertions are enabled, a Put User action that have no effect (a noop update) would trigger an assertion failure and shutdown the node.  This change accepts "noop" as an update result, and adds more diagnostics to the assertion failure message.
testing the exception message when conversion of a generic collection element fails
Avoid concurrent modification in mock log appender (#41424)  It can be the case that while we are setting up expectations that also a log message is appended. For example, if we are setting up these expectations after a cluster has formed and messages start being sent around the cluster. In this case, we would hit a concurrent modification exception while we are mutating the expectations, and also while the expectations are being iterated over as a message is appended. This commit avoids this by using a copy-on-write array list which is safe for concurrent modification and iteration. Note that another possible approach here is to use synchronized, but that seems unnecessary since we don't appear to rely on messages that are sent while we are setting up expectations. Rather, we are setting up some expectations and some situation that we think will cause those expectations to be met. Using copy-on-write array list here is nice since we avoid bottlenecking these tests on synchronizing these methods.
corrects some typos and moves the check for the catch statement type into ClassCompletionVerifier, to let the ResolveVisitor first resolve all types and then do type based checks
Revert "Auto-unwrap SessionFactoryBuilder-created proxies"  This reverts commit 7903d6489f9c98532826324b0ba79cafbc618d78.  Issue: SPR-8492
Make LocalPartitionGenerator implement PartitionFunction
Closes #4129, added Controllers#getListeners()
More detailed description of the expected behavior when evaluating interactive and non-interactive sources
Removed redundant version checks in transport serialization (#4731 leftover)
SL: some minor simplifications.
Use protected constructors in abstract classes. #1555  Fixes `NonProtectedConstructorInAbstractClass` inspection violations.  Description: >Reports constructors in abstract classes that are not declared protected, package-protected or private.
move GEP construction into the facade
Avoid using placeholder nodes when emitting explicit exceptions. Introduce StressExplictExceptionCode flag for debugging.
bug 10579: disable pool vm sync and disable hostTrack for XenServer,  status 10579: resolved fixed  reviewed-by: alex  Conflicts:      core/src/com/cloud/hypervisor/xen/resource/CitrixResourceBase.java
More explanation + more links
MINOR: Remove Dead Code in QueryCache (#36147)
Access java options through toolchain in AndroidPrebuiltAarDescription  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: e3074c1
Add method to ProjectWorkspace to write file contents.  Test Plan: Unit test.
Moved tint logic from Skin to tint(Color) on each drawable class.  #2705
Make the version of the remote node accessible on a transport channel (#23019)  This commit adds a new method to the TransportChannel that provides access to the version of the remote node that the response is being sent on and that the request came from. This is helpful for serialization of data attached as headers.
Change return type and add nullable check for DepsAwareExecutor  Summary: We should return more specific ImmutableList and check for nonNull in DepsAwareTask.getStatus  Reviewed By: styurin, ttsugriy  fbshipit-source-id: c22dc24784
added Fingerprint points to assist debugging replay compilation
How to register MIME types in MockServletContext  Prior to this commit, it was unclear that it was possible to register custom MIME types when using MockServletContext.  This commit updates the Javadoc for MockServletContext.getMimeType() with an example of how to achieve this using the MimetypesFileTypeMap from the Java Activation Framework.  Issue: SPR-12126
fixed JSP ErrorsTag to avoid invalid "*.errors" id, using form object name as id prefix instead (SPR-7258)
Fix SKIP behavior on SELECT expand(out()) queries  Resolves: #5854
SimpleIdProvider zap page before releasing page  This is something that the real freelist already does and we rely on this behavior.
Add constants for the tiered compilation naming conventions.
DispatcherServlet and ServletWrapping/ForwardingController accept any HTTP method by default  Issue: SPR-4799
Always upstream full memcache messages.  This changeset is related to #2182, which exposes the failure in the http codec, but the memcache codec works very similar. In addition, better failure handling in the decoder has been added.
Remove unused SourcePathResolver from CxxInferCaptureTransitive  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: bbceadb
Revert "Make DirectHeaderMap use relative paths"  Summary: Breaks findining header maps in some builds.  Reviewed By: styurin  fbshipit-source-id: a1eabbd300
Improve error if Indices Permission is too complex (elastic/x-pack-elasticsearch#4239)  If a user has roles that grant access to a large number of disparate index patterns, then the resulting Automaton can become large and too costly to determinise. This happens rarely, and is usually a sign of a poorly implemented security model, so we have no immediate plans to change the implementation. However the resulting error message is not clear and does not provide sufficient information for users to resolve the underlying problem.  This commit catches the underlying exception and provides a more specific error message, with DEBUG logging of the offending index patterns.  Original commit: elastic/x-pack-elasticsearch@532be70efcde63df8f96d62bce343a21662c2278
Add arrayKlassOffset field to HotSpotVMConfig.
Remove unused SourcePathResolver from CxxBinary  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 4db459f
Make Tool extend AddsToRuleKey instead of RuleKeyAppendable  Summary: There are now only two Tool implementations that override appendToRuleKey(). Limit the RuleKeyAppendable down to those two implementations.  Test Plan: CI  Reviewed By: styurin  fbshipit-source-id: 8d11bc3
Add @Beta annotation to new subSet/subMap methods. ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=109435892
UCDetector clean-up  - Remove unused code  - Use final where appropriate
Clean up lamda refs with method refs instead. Remove abstract from reg service UI info
Close Index API should force a flush if a sync is needed (#37961)  This commit changes the TransportVerifyShardBeforeCloseAction so that it issues a  forced flush, forcing the translog and the Lucene commit to contain the same max seq  number and global checkpoint in the case the Translog contains operations that were  not written in the IndexWriter (like a Delete that touches a non existing doc). This way  the assertion added in #37426 won't trip.  Related to #33888
Remove bogus DataSource test from JpaTransactionManagerTests
Migrate array cardinality to scalar framework
[fixed] license headers for jogl backend
[scene2d.ui] Changed widgets to use Actor#hasKeyboardFocus.
restructure processors  This Commit does the following:   - moves processors into their own sub-packages  - adds ability to add any typed field value into Data
rename getRemoteCpuTime to getRemoteCpuTimeMs  Summary: Use millis for this.  Reviewed By: rajyengi  fbshipit-source-id: b7c801fd93
#119 Add missing license headers
Change ByteBufAllocator.buffer() to allocate a direct buffer only when the platform can handle a direct buffer reliably   - Rename directbyDefault to preferDirect  - Add a system property 'io.netty.prederDirect' to allow a user from changing the preference on launch-time  - Merge UnpooledByteBufAllocator.DEFAULT_BY_* to DEFAULT
Make round() return NaN when input is NaN  This was a regression in a recent change: 54eeef93
Remove Beta annotations.  Summary: We don't really take them into consideration.  Test Plan: CI  Reviewed By: bolinfest  fbshipit-source-id: 2c7d07a
Assert that CompositeValues are not visited directly by ValueProcedures/ValueConsumers.
Decouple JavaLibrary from AnnotationProcessingParams  Summary: We only need to expose the generated source directory (which may not exist). As AnnotationProcessingParams is java specific (rather than jvmlang agnostic) we'd prefer JavaLibrary (soon to become JvmLibrary) to not know about it.  Context: I'm another LMAX person. We really want to make some progress towards the work described in https://github.com/facebook/buck/pull/439  Tested with ant && ./bin/buck test (advice on whether this is enough gratefully received!) Closes https://github.com/facebook/buck/pull/508  Test Plan: Imported from GitHub, without a `Test Plan:` line.
Replace "fail(...); return x;" with "throw new AssertionFailedError(...);" This eliminates some unreachable code that the compiler couldn't prove was unreachable. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=59341803
JAVADOC: Added missing javadocs.
CAMEL-8023: Model and component javadoc documentation
don't discard original exception (suspiciously/possibly eclipse-generated)
STORM-616 : removing unintended changes.
fixed javadoc comments, default values and var order
Bind file rename executor as ListeningExecutorService  - Also use cached thread pool and bounded executor to reduce memory footprint for thread management
Remove References to Instant#now in the DirectRunner  The DirectRunner should use exclusively the configured clock to determine the processing time.
CAS-1474: Removed unneeded prop from handler.
Added Texture#toString.  Sometimes it's the little things.
added transaction state tostring methods for debugging
KAFKA-5412: Using connect-console-sink/source.properties raises an exception related to "file" property not found  Author: ppatierno <ppatierno@live.com>  Reviewers: Randall Hauch <rhauch@gmail.com>, Ewen Cheslack-Postava <ewen@confluent.io>  Closes #3279 from ppatierno/kafka-5412
Expose OrderingCompiler cache stats via JMX
Revised NoSuchBeanDefinitionException message for proper array class names  Issue: SPR-14595
Transport: Clarifying the role of AbstractBootstrap#bind()  This small changeset clarifies the role of AbstractBootstrap#bind(), especially when not used in a ServerBoostrap context.
[hotfix] Make KeyGroupsStateHandle implement StreamStateHandle
Bug 62829 - Allow specifying Proxy server scheme for HTTP request sampler, Advanced tab and command line option  Fix error if scheme is empty Bugzilla Id: 62829
In SdkComponents (portability support lib), use equality to compare Coders (#7462)  Previously, identity was used to compare Coders, instead of Coder equals(). This leads to equivalent Coders being created leading to separate Coder ids and entries in the model pipeline proto etc. It also leads to Coders created during internal expansion of PTransforms (e.g. Combine.perKey()'s accumulatorCoder) appearing to be different (and getting a different id) than the equivalent Coder known when the model pipeline proto was computed. This PR switches to equals() to compare Coders, so that it's no longer a problem to create equivalent Coder representations.
DefaultJavaLibrary: Pass in ZipArchiveDependencySupplier rather than creating it  Summary: I'm working toward changing Java compilation so that we can create the source ABI partway through compilation and allow a module's dependents to start compiling while `javac` finishes creating the full JAR for the module.  With that available, library compilation might be started by either the `CalculateAbiFromSource` rule or the `DefaultJavaLibrary` one, depending on whether source ABIs are enabled. If we left it up to the rule to create the supplier (and, say, forgot to do so), dep file keys would cease to function. Factoring it out prevents us from getting that wrong. (Or, more accurately, is the result of having gotten it wrong and debugged it for longer than I should have.)  Test Plan: CI  Reviewed By: asp2insp  fbshipit-source-id: 7953a3d
javadoc, with override and inheritdoc flags
Use Supplier for StreamInput#readOptionalStreamable  This commit changes the signature of StreamInput#readOptionalStreamable to accept a Supplier to create new streamables rather than requiring callers to construct new instances. This has the advantage of avoiding an allocation in cases when the stream indicates the resulting streamable is null
[chromedriver] Expose chromedriver "execute CDP command" command
Fix handling of missing columns in Parquet Reader
Tighten up visibility
tokenMetadata should be updated before removing obsolete pending ranges, and unset bootstrapped flag when decommission is complete.  patch by Jaakko Laine and jbellis for CASSANDRA-435
Move string to BuildTarget conversion to a more appropriate class to avoid cyclic dependencies.  Summary: String->BuildTarget conversion is the BuildTargetParser's job. This diff also helps avoid cyclic dependencies in future work.  Test Plan: CI  Reviewed By: ruibm  fbshipit-source-id: e1b6d75
Output TraceInlining format, and separate case when there are multiple decisions about callsites.
Move TimeValue into elasticsearch-core project (#29486)  This commit moves the `TimeValue` class into the elasticsearch-core project. This allows us to use this class in many of our other projects without relying on the entire `server` jar.  Relates to #28504
Bug 57193: Escape entities like &, < and >, as they are not  allowed in javadocs. Place code tag around code-fragments in javadoc. Bugzilla Id: 57193
Fix match_phrase_prefix query with single term on _all field (#20471)  * Fix match_phrase_prefix query with single term on _all field  This change fixes the match_phrase_prefix query when a single term is queried on the _all field. It builds a prefix query instead of an AllTermQuery which would not match any prefix.  Fixes #20470  * Add missing change
improvement for CAMEL-3 so that boolean b = in.getHeader("foo", boolean.class); does not throw a NPE for a missing header; instead false is returned for missing values
Log database startup failures in messages.log  Before this change database startup errors were logged only in console.log
Removed need for state after on load indexed, and new bytecodes.
Minor tweaks to tests to reduce memory usage WW-1715
fix bad merge for parent field mapper, and change most field types to be pkg-private and final
Move tests into *.test packages.
Fix a few typos  Minor changes to fix typos. Small adjustment to add a couple commas.
Add getSingleValue to ValueBlock
Remove unused StepContext name methods
NaaS: Remove IsServiceProvider() functions  If the element is the service provider for this network, then can be tell from network offering. We don't need these functions in the interface.
Revised deprecation markers
removed unused domain in system vms
make empty strings always return the MINIMUM token, and DecoratedKeys containing the MINIMUM token always be considered empty.  This is something we probably should be doing anyway for consistency.  (It was already true for OPP, but not COPP or RP.)  No further special casing should be necessary because we have already abstracted out code that needs to work across multiple partitioners to use IPartitioner.isEmpty, including getRangeSlice.  patch by jbellis; reviewed by Stu Hood for CASSANDRA-745
clean up leaking threads
CAMEL-10091: Camel-Git: Always check if Git instance is null in GitProducer before closing
Autowiring rejects self references to a factory method on the same bean as well  Issue: SPR-12018
Added lastTransactionCommitTimestampWhenStarted to interface
moved InvokConstructor Test to UTC2 to avoid OME
Make TargetNode implement HasBuildTarget.  Summary: So that we can use the convenient HasBuildTarget.TO_TARGET function.  Test Plan: buck test --all
Remove unnecessarily general generic type bound  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 1bbc81a
SslHandler dervies jdkCompatibilityMode from SSLEngine  Motivation: Some SSLEngine implementations (e.g. ReferenceCountedOpenSslContext) support unwrapping/wrapping multiple packets at a time. The SslHandler behaves differently if the SSLEngine supports this feature, but currently requires that the constructor argument between the SSLEngine creation and SslHandler are coordinated. This can be difficult, or require package private access, if extending the SslHandler.  Modifications: - The SslHandler should inspect the SSLEngine to see if it supports jdkCompatibilityMode instead of relying on getting an extra constructor argument which maybe out of synch with the SSLEngine  Result: Easier to override SslHandler and have consistent jdkCompatibilityMode between SSLEngine and SslHandler.
working on test cases
[inlining] no need for the suspense about return value
Fixed issue on marshalling/unmarshalling of embedded types
[CAMEL-13040] Move modules to core/ folder
Avoid running on CI as its not reliable to run there
Clean up warnings in spring-websocket
TraceRA: rename LinearScanOptimizeSpillPositionPhase -> TraceLinearScanOptimizeSpillPositionPhase.
Make unused Loads simplify in more cases  If they require a check, just replace them with this check.
Only enable validation of headers if original headers were validating as well.  Motiviation:  In our replace(...) methods we always used validation for the newly created headers while the original headers may not use validation at all.  Modifications:  - Only use validation if the original headers used validation as well. - Ensure we create a copy of the headers in replace(...).  Result:  Fixes [#5226]
Use MockitoJUnitRunner from Mockito 2's preferred location  Issue: SPR-14880
Remove calls to simple getters within classes. #1555  Fixes `CallToSimpleGetterInClass` inspection violations.  Description: >Reports any calls to a simple property getter from within the property's class. A simple property getter is defined as one which simply returns the value of a field, and does no other calculation. Such simple getter calls may be safely inlined, at a small performance improvement. Some coding standards also suggest against the use of simple getters for code clarity reasons.
Move BuildRuleWithBinary to apple package  Summary: Moving `BuildRuleWithBinary` to `com.facebook.buck.apple` package where it's only used.  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: 44f9c99
Added license headers
Renamed ReactiveHttpOutputMessage dataBufferFactory() method to bufferFactory()
Validate types for IN subquery expression
test: install a new signed license when running index BWC tests  This change now installs a signed license that has been generated at runtime so the BWC tests can run without hitting licensing issues. The x-pack BWC tests pull in the full cluster state, which contains the trial license from when the indices and state was generated. After the trial license period and grace period issues arise with the tests.  Closes elastic/elasticsearch#3858  Original commit: elastic/x-pack-elasticsearch@1c79e874e5033aedac14e7913fa9d194b62f56c9
We should prefer heap buffers when using the OIO transport to reduce memory copies.  Motivation:  When using the OIO transport we need to act on byte[] when writing and reading from / to the underyling Socket. So we should ensure we use heap buffers by default to reduce memory copies.  Modifications:  Ensure we prefer heap buffers by default for the OIO transport.  Result:  Possible less memory copies.
disabled control-flow-based inlining
adding missing finals
HHH-6407 : Add SimpleValue.getAlias(Dialect) and implement in subclasses
Move more functions down into LegacyNativeLinkableGroup  Summary: ^  Reviewed By: mykola-semko  shipit-source-id: 2f5c6ad982
Minor refactoring: remove duplicated code
Make unused Loads simplify in more cases  If they require a check, just replace them with this check.
Consistent use of LinkedHashSet for interfaces (since interface order may matter in subtle cases)
Provide a way to explicitly set the `BuildRuleSourcePath` path  Summary: This diff adds a new constructor to ##BuildRuleSourcePath## so that the resolved path can be explicitly set, rather than using the output path of the build rule that is wrapped.  This is useful for build rules which generate multiple output sources (e.g. thrift, lex, yacc).  Test Plan: - included test - Used with C++ lex, yacc, and thrift support, as each of these produce combinations of C++ sources and headers.
Allow for reuse of key visitor classes in tooling  Based on https://github.com/SpringSource/spring-framework/pull/263
allow plugins to provide actual Module instances, not just classes to create the modules from
Issue #2874,  methods to book file id before creation were added.
Added lastTransactionCommitTimestampWhenStarted to interface
Exists API can send response body, closes #2072.
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=48424 Based on a patch by Ivan Ensure that the ObjectNames for the Connectors are always generated using the same method
Introduce mayNullCheckSkipConversion method in ConvertNode interface. Move address lowering after fixed read phase.
Put nonoss under Spring framework
test more javadoc code examples
Allow to disable target_compatible_with check  Summary: This is useful when debugging failures related to `target_compatible_with`.  Reviewed By: sbalabanov  fbshipit-source-id: 35f1c5cc36
Cache objects for out of process build  Summary: Instead of creating and destroying these objects, we may cache them. Also, tune the number of outer processes to be CORES/4: these processes are multithreaded themselves and according to my benchmarks, the fastest mode for 8 core machine is when we have 2 outer processes for javac. The results are:     buck build buck -c java.location=IN_PROCESS    takes 1m 5s     buck build buck -c java.location=OUT_OF_PROCESS    takes 1m 22s  Test Plan: CI  Reviewed By: marcinkosiba  fbshipit-source-id: 121312e
Deprecate cancellation and task control things in org.neo4j.helpers.
MAHOUT-1258: Another shot at findbugs and checkstyle - removed unused imports
@Import detects and accepts existing configuration class of the desired type
TIKA-314: Initial support for JPEG EXIF metadata extraction  Add license headers, generics
Some javadoc polish
add diagram for new takeUntil variant and a few other related javadoc tweaks and remove a troublesome unicode ligature from SpscArrayQueue.java that's causing a compiler warning
Renamed ChunkStream to ChunkedInput Renamed ChunkStreamWriteHandler to ChunkedWriteHandler Renamed FileChunkStream to ChunkedFile
Pass BuildContext to getPostBuildSteps  Summary: And use it in AppleDsym, rather than a SourcePathResolver from the constructor  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 69e9ea1
Finally working item-based Hadoop recommender
[FLINK-2158] Add support for null to the DateSerializer  This closes #780
[BEAM-734] Add support for Spark Streaming Listeners.
Fix unit test placing output files like "null.java" in the project directory
CAMEL-13313: Add support for generating type converter loader source code to be able to load component type converters in a faster way.
CAS-1475: Deprecated and added logs.
Fix outdated Javadoc in the TestContext framework  Fixed outdated Javadoc regarding support for 'annotated classes' in the TestContext Framework.
Update legacy test stuff too.
Add more variants of ByteBufAllocator.ioBuffer() / Update Javadoc
STORM-726: Adding nimbus.host config for backward compatibility.  Conflicts:     storm-core/src/jvm/backtype/storm/utils/NimbusClient.java
Add ClientRequest.attribute(String)  This commit adds the attribute(String) convenience method to the ClientRequest class. It also adapts the Basic Authentication filter to use it.
Put nonoss under Spring framework
Switch to using a varargs syntax in CommandRunner.  Summary: We use the array syntax for the final argument for CommandRunner.runCommand. If we use the varargs syntax, calling the method becomes cleaner.  Test Plan: buck test --all
2.x: Single.subscribe(BiConsumer) consistent isDisposed (#5277)
HOTFIX: ChangeLoggingKeyValueStore.name() returns null  This class doesn't need to override this method as it is handled appropriately by the super class  Author: Damian Guy <damian.guy@gmail.com>  Reviewers: Guozhang Wang <wangguoz@gmail.com>  Closes #2397 from dguy/hotfix-npe-state-store
Add missing license headers
Make Arrayblock, MapBlock, RowBlock support mayHaveNull
Make phi_convict_threshold a float. Patch by Harish Doddi, reviewed by brandonwilliams for CASSANDRA3910
Merging capabilities to options should be fluent
make BootStrapperTest use of TokenMetadata match actual BootStrapper use better.  patch by jbellis for CASSANDRA-502
Update to the tests for better stability on some platforms.
[BEAM-5945] add reverse
Removed a strange comment and renamed the MapUtil methods to better names
assign names to threads that do not have one.  patch by jbellis
Migrate SelectorKey to use BuildTarget  Summary: This is a part in a series of changes to migrate configuration targets to use `BuildTarget`.  Reviewed By: bobyangyf  shipit-source-id: aa55d25b25
Inline a trivial function.  Test Plan: CI  Reviewed By: aiked  fbshipit-source-id: 0065a48
Added more debug info to thrift http request workflow  Summary: Two of the possible failures are: - during connecting - while downloading the artifact  We add more logs in case there's a failure in one of those situations.  Test Plan: CI  fbshipit-source-id: 7956702
WW-4110 Marks AOP support as deprecated
Aggregations: Sibling Pipeline Aggregations can now be nested in SingleBucketAggregations  Closes #11379
Follows changes in AbstractGraphDatabase
Get color diagnostic option directly from passed in tool  Summary: Instead of passing it down via preprocessor/compiler delegate, into ToolCommand, into Step, just get the args from the tool, which is already passed into the step.  Test Plan: CI  Reviewed By: beefon  fbshipit-source-id: 18d6399
Renamed ReactiveHttpOutputMessage dataBufferFactory() method to bufferFactory()
AlexeiBarantsev: Ignoring tests for the browsers that don't support yet 'true or null' paradigm for boolean attributes  r16981
Reduced frame length for the tests and @Ignores a test which accidentally produces a deadlock during client shutdown
Log unresolved exceptions at error level
avoid unnecessary autoboxing
fix the typo in the Traffic example java docs.  ----Release Notes----  [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=90761527
[BEAM-316] Add file scheme support in TextIO
CAMEL-4758: Improved javadoc. Thanks to Glen Mazza for patch.
Add getDescription() to BuildTargetPattern and VisibilityPattern.  Summary: For the upcoming `buck autodeps --suggest-partition` feature, we need a way to produce the serialized version of a `VisibilityPattern`. This new API makes that straightforward to do.  Test Plan: Unit tests  Reviewed By: Coneko  fbshipit-source-id: e720502
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
working on ctor args
don't discard original exception (suspiciously/possibly eclipse-generated)
clean up attribute release policy for R&S
Improve naming of global allocation nodes.
Revert "mute failing filerealm hash caching tests (#42304)"  This reverts commit 8907dc9598667a1fa29be0ba22c7030ebee1101b.
users: Removed default users and user->role mappings  This will force users to create a user via the esusers This also adds log warning when no users are found.  Original commit: elastic/x-pack-elasticsearch@3c31f8d3b050ff36ac16330898c15fffa1354784
fixed dirty database left in thread local in case of error on constructor.
command line option to combine test bundles when generating xcode projects  Summary: This adds a command line option `--combine-test-bundles` to activate combining similar test bundles.  Test Plan: run on a workspace and project with 2 identical tests, see that a combined test project is generated.
Adding the option to disable Truffle compilation.
Revert: DefaultJavaLibraryBuilder: Bring sanity to classesToRemoveFromJar  Summary: This reverts commit DefaultJavaLibraryBuilder: Bring sanity to classesToRemoveFromJar.  Test Plan: revert-hammer  fbshipit-source-id: a942a42
Replace the many asNode methods with one on ValueNode and one on FixedNode
PersistenceAnnotationBeanPostProcessor defensively handles BeanDefinition access for extended EntityManagers  Issue: SPR-8834
Pass platform param through CxxPreprocessables.addHeaderSymlinkTree  Summary: This generic "Flavor" argument is really a platform flavor. Since we lack //Typed Flavors//, passing along the platform itself is probably the next best thing.  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 056942c
Code clean up to use braces and java 7 features
Give friendly error on bad visibility entries  Test Plan: Added unit test  Reviewed By: Coneko  fbshipit-source-id: 7ddca2b
Add an escaper for makefile strings  Summary: This adds an escaper for values placed on the right-hand side of assignments in GNU-style makefiles, and is useful for makefile generation for use with the Android NDK.  GNU makefiles use an interesting escaping strategy, where the escape sequence (i.e. backslash) must itself be escaped *only* if it precedes a character that needs to be escaped (e.g. so a backslash in the original string won't necessarily be escaped).  Test Plan: added some tests; generated some Android.mk files
Issue #4165: Split and Organize Checkstyle inputs by Test for ExplicitInitializationCheckTest
Remove / clean-up pointless javadoc
Removed unused imports
Rename query.initial-hash-partitions property  Rename the query.initial-hash-partitions to query.hash-partition-count to match the session property name
MAHOUT-1258: Another shot at findbugs and checkstyle - removed unused imports
Add HashFunction#hashObject() shortcut. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=38044012
Removed unused imports and an unused local variable reported by Eclipse
Rename WebTestClientConnectorTests to match class name
Prepend -Xlinker to linker flags in project generation.  Summary: Buck prepends -Xlinker to linker_flags during building. This makes project generation have the same behaviour.  Test Plan: CI
expose journal writeBatchSize and tidy up xbean annotations
Make the deprecation messaging on legacy index APIs more consistent.
Thread entire QueryEnvironment through QueryExpression.parse  Summary: In order to introduce parse-time resolution of target literals, we will have to pass the environment down to access the context (including the cell)  Test Plan: Functionality unchanged; existing tests pass  Reviewed By: illicitonion  fbshipit-source-id: 8828bce
Prevent possible NPE (from the testbeans branch, but unrelated).
Make Rule tests use Memo and Lookup
Add detectHandlerMethodsInAncestorContexts property to AbstractHandlerMethodMapping.
Add support for setting ip address for web server
Remove $Id keyword from files in catalina/startup/**
Remove unused SourcePathResolver from UnzipAar  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 4d9f1ff
Add getRawSlice to BlockCursor interface
Make NoSuchBufferException message more useful
[euphoria-core] Join operator hint tests - equals, hash code.
unregister mbean on flush.  patch by daishi; reviewed by jbellis for CASSANDRA-157
Add ImmutableBiMap.Builder.put(Entry) overload, which had previously not been overridden from ImmutableMap.Builder.  Now, it correctly returns ImmutableBiMap.Builder. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=75833810
Throw ESIA if required field 'patterns' is not present in filter config.  If 'pattern_capture' tokenfilter is create / mapped without a 'patterns' settings we now throw an exception since this is a misconfiguration and likely due to the similar settings on related token filters.  Closes #3808
Mapping updates on objects should propagate `include_an_all`. #20051  Today you can't update `include_an_all` on an existing object. The bug affects 2.x too.
Move the ES output adapter to upper level
Watcher: Allow more tags for HTML sanitizer in tables (elastic/elasticsearch#2350)  This allows the colspan/rowspan attr on td/tr as well as border/cellpadding attrs on table elements.  Original commit: elastic/x-pack-elasticsearch@e0b989f0ac23ce17c99d7616d4b3bd2e585116a9
working on ctor args
Remove deprecated code
Make the list of encoders available where they are needed
cxx: make C/C++ tests runnable via `buck run`  Test Plan: `buck run ..` on `cxx_test` target  Reviewed By: aiked  fbshipit-source-id: c0cfd4b
Don't check accessible in the #capacity method (#7830)  Motivation: The `#ensureAccessible` method in `UnpooledHeapByteBuf#capacity` used to prevent NPE if buffer is released and `array` is `null`. In all other implementations of `ByteBuf` the accessible is not checked by `capacity` method. We can assign an empty array to `array` in the `deallocate` and don't worry about NPE in the `#capacity`. This will help reduce the number of repeated calls of the `#ensureAccessible` in many operations with `UnpooledHeapByteBuf`.  Modifications: 1. Remove `#ensureAccessible` call from `UnpooledHeapByteBuf#capacity`. Use the `EmptyArrays#EMPTY_BYTES` instead of `null` in `#deallocate`.  2. Fix access checks in `AbstractUnsafeSwappedByteBuf` and `AbstractByteBuf#slice` that relied on `#ensureAccessible` in `UnpooledHeapByteBuf#capacity`. This was found by unit tests.  Result: Less double calls of `#ensureAccessible` for `UnpooledHeapByteBuf`.
Ticket metadata abstracted into methods
Use shard as a name of lucene index part  Update storage layout name to reuse agreed terminology.
Make parameters of Parser.getTargetNodeRawAttributes explicit  Summary: This will refactored later and explicit parameters make future refactoring easier.  Reviewed By: bobyangyf  fbshipit-source-id: b965f22409
Adding licence header to files to make the build pass
Fix ResourceUrlProvider path check in getForRequestUrl  Prior to this change, getForRequestUrl implementation would only work for applications with a non-empty servlet path. So web applications mapped to "/" would trigger a IllegalStateException while checking the current request against the request path within the current mapping.  This change relaxes this and only check that the path within mapping is within the request URL.  Issue: SPR-12158
relaxed @AspectJ detection check (for CGLIB subclasses to still be recognized as an aspect)
Remove "presto" from uris
fixed @MVC processing of parameter-level annotations to work with interface-based proxies again (SPR-7483)
Bug 57193: * Generics won't work in javadoc, so describe the type  textually. * add missing return and throws javadoc statements Bugzilla Id: 57193
Cleanup: bulk removal of unused imports
use waitOnFuture more often
Add buck config option for ProcessTracker  Test Plan: Verify that ProcessTracker gets instantiated only when adding the buck config option:      [log]         process_tracker_enabled = True  Reviewed By: marcinkosiba  fbshipit-source-id: 4f2d90e
Replace uses of log4j with slf4j
Move TruffleStackTraceElement#{fillIn,getStackTrace} to TruffleStackTrace  * Where they logically belong.
[CAMEL-8428] Move getEndpoint() methods to EndpointAware interface
Updated OProfiler. Added getContext API
CAMEL-8561: Better component docs summary of components - we use javadoc from the endpoint class instead of component so its in the same source file as @UriEndpoint.
Process monitor refresh interval setting  This commit converts the process monitor refresh interval setting "monitor.process.refresh_interval" to the new settings infrastructure.
further javadoc commenting
Avoid importing testing hierarchy for Javadoc comments.  These files import from the testing hierarchy solely to provide Javadoc comments. This blurs the line a bit between operational and test code. This is just a cleanup to make it more clear the references are documentation and not actual code dependencies.
Make ProjectConfig a NoopBuildRule.  Summary: ProjectConfig doesn't produce any output, so it should be a NoopBuildRule  Test Plan: CI
Publish discovery advertised address.
Renamed a method and added javadoc.
Remove unused method.  Test Plan: CI  Reviewed By: ruibm  fbshipit-source-id: d73c730
Expose struct function in extension files  Summary: This is needed to support common ways to abstract Python-like modules. This is also how skylib is exposing all of its fuctionality.  Test Plan: CI  Reviewed By: styurin  fbshipit-source-id: c457b24
Increase visibility in PAssert and ZipFiles utilities  This is needed for package reorganization in runners/google-cloud-dataflow. Those classes will have to move away from org.apache.beam.sdk.* packages.
Plugins: Add ScriptService to dependencies available for plugin components
move default value wrapper into support package (rather then interceptor)
Rename authentication test classes to reflect the actual test case. The JUnit classes test the opposite of what their original names suggest.  Signed-off-by: Gregor Zurowski <gregor@zurowski.org>
change default behavior
HIVE-8326 Using DbTxnManager with concurrency off results in run time error (Alan Gates, reviewed by Eugene Koifman)
Adjust ChannelGroup to behave the same like a Channel in terms of write and flush
BEAM-5372 -> Make minPauseBetweenCheckpoints setting available in FlinkPipelineOptions
Add an option to set the stack size
Validate types for IN subquery expression
Added license headers
Only allow rebalance operations to run if all shard store data is available  This commit prevents running rebalance operations if the store allocator is still fetching async shard / store data to prevent pre-mature rebalance decisions which need to be reverted once shard store data is available. This is typically happening on rolling restarts which can make those restarts extremely painful.  Closes #14387
AMQ-4122 - add log warning if lease will expire due to mal configuration
Remove unnecessary boxing and unboxing.
cxx: allow configuration shared library extension used for C/C++ platforms  Reviewed By: adamjernst, ttsugriy  fbshipit-source-id: c7900cd
Test: Allow merging mock secure settings (#25387)  While real secure settings (ie an ES keystore) cannot be merged together, mocked secure settings can and need to be sometimes merged. This commit adds a merge method to allow tests to merge together multiple instances of secure settings.
Fix Eclipse warning: unused parameter.  Test Plan: Sandcastle builds.
add serialized version ids
Implement read streaming in grpc client and test server  Summary: ^  Reviewed By: ttsugriy  fbshipit-source-id: 170f01eb37
Fix a misspelling, tiny method change
Update Network.asGraph()'s edge value methods to be consistent with how they're defined in the interfaces. Update tests to fail with the old implementation.  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=130683572
Consistent exclusion of bridge methods in annotation post-processors (for Java 8 compatibility)  Issue: SPR-12187
allow for settings loader to load data from byte[], not just string
Rename SimpleEdgesConnecting to EdgesConnecting to be consistent with our naming pattern for NetworkConnections (*NetworkConnections and *MultiNetworkConnections).  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=130551638
There was no need to introduce a thread local to avoid event recursion
- don't put another application/ in front of the existing application/x-hdf and application/x-netcdf
test classes cleanup (fixed warnings and typos)
Polish Javadoc for caching annotations
Move lexer predicates test to TestSemPredEvalLexer
[fixed] added Application.log(tag, message, exception). Not so fancy on desktop but who cares :D
HOTFIX: Fix apache headers in float serde class files  hachikuji  Author: Guozhang Wang <wangguoz@gmail.com>  Reviewers: Jason Gustafson <jason@confluent.io>  Closes #2679 from guozhangwang/KHotfix-serde-headers
Removed printStackTrace(...) from whole code, issue #660
fix heisenbug in RecoveryManager2Test where a compaction could add back a new sstable to the "cleared" ColumnFamilyStore patch by jbellis; reviewed by junrao for CASSANDRA-463
Added some io utils and removed an unused variable
TIKA-416: Out-of-process text extraction  More javadocs and some cleanup.
https://issues.apache.org/jira/browse/AMQ-4108 - fix unit test regression, QueueMasterSlaveTest,  related to https://issues.apache.org/jira/browse/AMQ-4005 and the dual impl of broker service aware. the auto created locker was not getting its broker service init. flakyness in test related to exponential backoff tool long for reconnect
CLOUDSTACK-1862 Added vm ip address info in the list PF rules response  Signed-off-by: Abhinandan Prateek <aprateek@apache.org>
Prevent cases when exception during locks client close causing transaction to be never released into the pool, and stuck with closing status forever.
WW-3164  Need to inject ActionMapper in PortletUrlRenderer to avoid NPE when passing through to ServletUrlRenderer.
MAHOUT-1258: Another shot at findbugs and checkstyle - removed unused imports
CAMEL-13150: Add command "exchangeProperty" for dateExpression in ExpressionBuilder (#2741)
HOTFIX: Fix apache headers in float serde class files  hachikuji  Author: Guozhang Wang <wangguoz@gmail.com>  Reviewers: Jason Gustafson <jason@confluent.io>  Closes #2679 from guozhangwang/KHotfix-serde-headers
encrypt oidc tokens support
More JDK8 api change fixes.
Update of committed tx id now only done in Transaction.doCommit().
Cleanup: Ensure no logic is executed in the constructor  The SignatureService tried to access the system key file in the constructor, which could lead to endless loops. This PR moves the service into a AbstractLifecycleComponent to keep the constructor dumb.  Relates elastic/elasticsearch#517  Original commit: elastic/x-pack-elasticsearch@b1e5bfe98c519caaeab87163940482562ebd2e4b
Update Javadoc in ExtendedBeanInfo   - updated the link to the "indexed properties" section of the JavaBeans    tutorial
tidy up some @since version numbers
Enable IndexActionTests and WatcherIndexingListenerTests (#38738)  fix tests to use clock in milliseconds precision in watcher code make sure the date comparison in string format is using same formatters some of the code was modified in #38514 possibly because of merge conflicts  closes #38581
Migrate Executor-less Futures callback methods to the ones with an Executor, while applying MoreExecutors.directExecutor() for identical behavior.  For more information, see [] []  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=155174706
GROOVY-3046: Groovy should provide an @Immutable annotation to make creating immutable objects easy (javadoc)
Clean up javadoc
WW-1453  Simple cleanup items   - remove duplicate and/or unused imports   - change static access to class, not instance
moved the CamelClient into the core Camel API package
Refactoring. Remove PACKAGE_NAME constant.
Add flag to restore legacy array_agg behavior  The flag is named experimental.legacy-array-agg, which is default to be false. When it is set to true, array_agg will ignore the null values.
Allow to disable target_compatible_with check  Summary: This is useful when debugging failures related to `target_compatible_with`.  Reviewed By: sbalabanov  fbshipit-source-id: 35f1c5cc36
Order by assigned id when everything else matches
Serialize from LogChannel instead of from buffer
Fixed tests with durations on throttling and others
Reuse FollowParameters' parse fields. (#38508)
Anchor InstanceOf to branches  This allows the anchor to be optimized
Remove unused SourcePathResolver from AndroidManifest  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 09e36d4
made sure to use the class name as database name in distributed tests
Move extractSymbols to SymbolsExtractor
Investigate claim on SO regarding ctx cache in TCF  This commit introduces a test that investigates a claim made on Stack Overflow regarding context caching in the TestContext Framework (TCF).
apply patch for: https://issues.apache.org/jira/browse/AMQ-4121  Allows for more user customization of MemoryUsage if desired.
Minor cleanup.
Added @UriParams for camel-twitter
Fix default config file location in code to match usage elsewhere
CAMEL-11379: Optimise - core type converters to be invoked faster
dont throw exceptions. return flags instead
[added] Action.getTarget() for profit!
[FLINK-5532] [streaming api] Make marker window assigners for aligned window ops non-extendable  Makes the TumblingAlignedProcessingTimeWindows and the SlidingAlignedProcessingTimeWindows final so that users cannot extend them.  This closes #3180
Fix build  Original commit: elastic/x-pack-elasticsearch@474e5e7a9a5adfc561f6719f4bca349ff7329b15
Truffle: simpler, more consistent toString for DirectCallNode subclasses.
Change signature of lowerToIf.
javadoc corrections patch by dbrosius; reviewed by jbellis for CASSANDRA-3063
Bacporting moving of tx brindge to global scope from more recent PR since multiple bridges creating mess during context creation in various places when bridge is resolved from dependency resolver.
Copy all transitive frameworks of the particular bundle types into the bundles  Summary: After removing the phase of copying subframeworks into framework bundles, apps became broken if they are launched outside of Xcode session/derived data. This is because app bundle basically didn't contain these frameworks anymore. This diff fixes this issue by adding all transitive frameworks into copy phase for generated Xcode project.  Test Plan: CI, added unit test. Generate project for Mac app with frameworks Build it using Xcode Move the app bundle to Desktop and double-click it there, app should launch normally.  Tested building Color Picker extension. It still had Frameworks included, and launched correctly.  Reviewed By: ryu2, darknoon  fb-gh-sync-id: 3f618b2
Synchronized between 4.1 and master (part 3)  Motivation:  4 and 5 were diverged long time ago and we recently reverted some of the early commits in master.  We must make sure 4.1 and master are not very different now.  Modification:  Fix found differences  Result:  4.1 and master got closer.
Introduce TraceTruffleInliningTree option.
MarshallingView unwraps JAXBElement value for Marshaller.supports(Class) check  Issue: SPR-11827
add diagram for new takeUntil variant and a few other related javadoc tweaks and remove a troublesome unicode ligature from SpscArrayQueue.java that's causing a compiler warning
Avoid missed signals on a default promise  Motivation:  Today when awaiting uninterruptibly on a default promise, a race condition can lead to a missed signal. Quite simply, the check for whether the condition holds is not made inside a lock before waiting. This means that the waiting thread can enter the wait after the promise has completed and will thus not be notified, thus missing the signal. This leads to the waiting thread to enter a timed wait that will only trip with the timeout elapses leading to unnecessarily long waits (imagine a connection timeout, and the waiting thread missed the signal that the connection is ready).  Modification:  This commit fixes this missed signal by checking the condition inside a lock. We also add a test that reliably fails without the non-racy condition check.  Result:  Timed uninterruptible waits on default promise will not race against the condition and possibly wait longer than necessary.
better method name, to correspond to addLast
Removed unused imports in camel-core
some minor adjustments before doing the big work
add evictions stats to field data
Removed unused imports
Deleting unused imports
Change the contract of ResourceLeakDetector.open() so that unsampled resources are recycled  - This also fixes the problem introduced while trying to implement #1612 (Allow to disable resource leak detection).
an API-only option (doesn't make sense on the command line) that tells the ProxyHandler to assume it is being chained even if http.proxyHost is not set. This is useful for java 5 systems that use the new ProxySelector API instead of relying on old crappy system properties  r3524
Use URI vs URL accessing File from classpath.  URL escapes special characters such as spaces which causes the resource to not be found when used to create a File object.  Use URI.  Closes #5915
Remove unflavoredNodes parameter in TargetGraph constructor.  Summary: TargetGraph is always created with a map mapping all unflavoured targets to a node with either that target, or a flavoured target based on it.  Test Plan: CI
Introduce mayNullCheckSkipConversion method in ConvertNode interface. Move address lowering after fixed read phase.
wildcard query on _index (#27334)
Move EmbeddedGraphDatabase to internal pkgs
Added JavaDoc for ChannelFuture and its related types
HIVE-8326 Using DbTxnManager with concurrency off results in run time error (Alan Gates, reviewed by Eugene Koifman)
Watcher: Fix encoding of UTF8 data in HttpClient (elastic/x-pack-elasticsearch#3398)  The HttpClient uses an Apache HTTP client class named StringEntity to encode a HTTP request body. This one however assumes ISO-8859-1 as its charset when encoding the string based body to bytes.  This commit switches to a byte array based body, then sets the content type header and falls back to the old text/plain content type if no content type header is specified.  relates elastic/x-pack-elasticsearch#3397  Original commit: elastic/x-pack-elasticsearch@d5a6e7f0c7f65e507564b9aaab91be97e0beb77c
Update of committed tx id now only done in Transaction.doCommit().
Make PercolateResponse a ToXContentObject
Fixes due to changes in master branch.
Handle unresolved view name
Some toString methods for easier widget inspection.
Make sure all public classes/interfaces in common.graph have @Beta and @since.  Also, a little bit of narcissism :) add myself to authors to the main interfaces (Graph/Network/MutableGraph/MutableNetwork). I normally wouldn't list myself first but the convention seems to be alphabetical order. ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=125691964
CAMEL-4358: Fixed failing test in camel-ftp. Migrating components to use support.ServiceSupport.
Corrected naming Operator -> Operation
replaced Service marker interface with non-standard META-INF directory names to differentiate JVMCI providers from standard service providers META-INF/services/ files for Options provider are now generated directly from files in META-INF/jvmci.options/
Make Tool extend AddsToRuleKey instead of RuleKeyAppendable  Summary: There are now only two Tool implementations that override appendToRuleKey(). Limit the RuleKeyAppendable down to those two implementations.  Test Plan: CI  Reviewed By: styurin  fbshipit-source-id: 8d11bc3
Add a static constructor to GrpcStateService
Updates to Javadoc
Updated Truffle-SL to new codegen API.
Remove $Id keyword from files in catalina/startup/**
ContextTestSupport supports many RouteBuilders to be tested Tests without test methods made abstract so eclipse doesn't complain when executing them
SPR-7354 - Added equivalent of JAX-RS @Consumes to Spring MVC
Disallow null-returning suppliers in Optional#or ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=24585583
Fix CONTAINS operator on lists of maps  Resolves: #8604
Get rid of a deprecated method in ProjectFilesystem.  Summary: And use `Path`.
Add more logging in the Coordinator-startup codepath.  Summary: Moar log messages.  Test Plan: thereisnoneedtobeupset  Reviewed By: michsien  fbshipit-source-id: a5b4d49
Fixed regression with fallback for non-resolvable property type
Ignoring tests that fail on travis (despite the fact that they are green for me locally)
Renamed ReactiveHttpOutputMessage dataBufferFactory() method to bufferFactory()
fixed cs issues by removing unused certs
build sneaky throws
Removing the log "Creating action graph"  Summary: - It's going to show later anyway when it actually needs to do it. - It was showing when not appropriate (for example in buck clean). - There's a two second-delay before showing the buck parsing phase.  Reviewed By: ttsugriy  fbshipit-source-id: 8218fac
Remove a dependency on Java 6 that accidentally got introduced
Add Javadoc for main interfaces/classes
CAMEL-12352 - make system property uppercase if given lowercase in simple expression
removed redundant arrays
Pass canonicalizer into IterativeConditionalEliminationPhase.
Describe a necessity to copy frame arguments in nodes tagged with RootTag.
revised "ClassUtils.isAssignable" semantics to cover primitives vs wrappers in both directions (SPR-7610)
Review comments.
Unignoring tests passing in updated HtmlUnit driver
Unused imports.
Add more specific prints for the cases where a specific log file could not be opened.
Fix match_phrase_prefix query with single term on _all field (#20471)  * Fix match_phrase_prefix query with single term on _all field  This change fixes the match_phrase_prefix query when a single term is queried on the _all field. It builds a prefix query instead of an AllTermQuery which would not match any prefix.  Fixes #20470  * Add missing change
Fix for https://issues.apache.org/activemq/browse/AMQ-1790
AbstractTraceInterceptor provides logExceptionStackTrace flag and writeToLog delegates  Issue: SPR-15763 (cherry picked from commit aa0d7a6)
Remove legacy hive.bucket-writing config property
Add WorkProcessor#transformProcessor method  This methods allows to write more streamlined transformations of the processor itself, e.g:  processor.transformProcessor(WorkProcessorUtils::flatten)
AbstractCxxLibrary: don't extend `NativeTestable`  Summary: This belongs on the actual concrete classes, rather than the base interface for C/C++ libs.  Test Plan: CI  Reviewed By: Coneko  fb-gh-sync-id: 6b2b888
Remove unused SourcePathResolver from AndroidManifest  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 09e36d4
CLOUDSTACK-6476: Basic Zone with Multiple Pods Setup: DHCP server doesnt get deployed in the pod where the VM gets deployed  Changes: PodId in which the router should get started was not being saved to the DB due to the VO's setter method not following the setXXX format. So when planner loaded the router from DB, it always got podId as null and that would allow planner to deploy the router in any pod. If the router happens to start in a different pod than the user VM, the Vm fails to start since the Dhcp service check fails.  Fixed the VO's setPodId method, that was causing the DB save operation fail.
Revert my previously not so clever implementation. If there is an executor being used, then one shall expect that the executor is reporting the numbers of threads itself, and it should no longer be the responsibility of the connector
Have ProjectFileSystemView support reading attributes  Reviewed By: bobyangyf  fbshipit-source-id: 7391713b25
Remove Cell.getAbsolutePathToBuildFileUnsafe(BuildTarget)  Summary: This is a part in a series of changes to remove ParserConfig-related information from Cell.  Reviewed By: bobyangyf  fbshipit-source-id: 3719ffc3fb
Replace withoutCell() with getCellRelativePath()  Summary: withoutCell() is a super-powerful function that makes it really hard to restrict the state of build targets. We only need it to construct paths that don't include the cell name...  Update some comments to make it clear what things include cell names vs not.  Reviewed By: bobyangyf  shipit-source-id: d3ef9a8a8b
Added some links into the example code
Resync fails to notify on unavaiable exceptions (#33615)  We fail to notify the resync listener if the resync replication hits a shard unavailable exception. Moreover, we no longer need to swallow these unavailable exceptions.  Relates #28571 Closes #33613
Deprecate Direct Access to Scheduler Implementations  This enforces the convention of using `Schedulers.*` and then makes the RxJavaDefaultSchedulers plugin more reliable.
rename default compiler config to basic to match configuration name
Absorb ImmutableSettings into Settings
Add MaterializedResult.toPage()
Rename PagesHashStrategy compare to compareSortChannelPositions
Add QueryStateMachine.getFailureInfo to avoid creation of QueryInfo
Add closeQuietly(InputStream) and closeQuietly(Reader). ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=61085980
Use LinkedHashmap to preserve insert order  In several places in the spring-webmvc module, URL patterns / objects relationships are kept in `HashMap`s. When matching with actual URLs, the algorithm uses a pattern comparator to sort the matching patterns and select the most specific. But the underlying collection implementation does not keep the original order which can lead to inconsistencies.  This commit changes the underlying collection implementation to `LinkedHashmap`s, in order to keep the insert order if the comparator does not reorder entries.  Issue: SPR-13798
Rename KeyGenerator#extract => #generate
Fixed minor problems with unit tests
Don't let VMsync touch the VM if VM has been scheduled for HA but HA is not yet running.
Use ExecutorService execute instead of submit so that Errors in EventBus subscribers propagate out  Summary: `ExecutorService.submit` will swallow any exceptions if the FutureTask it returns is not used, or the ExecutorService doesn't override `afterExecute`. From the [docs](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/ThreadPoolExecutor.html#afterExecute-java.lang.Runnable-java.lang.Throwable-): `Note: When actions are enclosed in tasks (such as FutureTask) either explicitly or via methods such as submit, these task objects catch and maintain computational exceptions, and so they do not cause abrupt termination.`  Reviewed By: jkeljo  fbshipit-source-id: fe52b51f50
Ensure we never read from a closed MockSecureSettings object (#25322)  If secure settings are closed after the node has been constructed no key-store access is permitted. We should also try to be as close as possible to the real behavior if we mock secure settings. This change also adds the same behavior as bootstrap has to InternalTestCluster to ensure we fail if we try to read from secure settings after the node has been constructed.
- Add an extra async IO flag I used for testing. - Blocking should block.
Avoid null-pointer exceptions for cases where LLVMAsForeignNode returns null.
[CAMEL-13114] Provide single Cookie header for multiple cookies
Add the cause exception string when failing to write the chrome trace file.  Test Plan: Unit Tests
Add CAST from BOOLEAN to REAL
Make sorting unconditional in followup to CASSANDRA-10162
Procedure for accessing bloom indexed properties.
[CCR] Make index.xpack.ccr.following_index an internal setting (#33768)
Optimize resolveType by reducing the invocations of String.format
DefaultHttp2FrameWriter ping payload size check  Motivation: The HTTP/2 spec states that the ping frame length must be 8 and is otherwise an error https://tools.ietf.org/html/rfc7540#section-6.7. The DefaultHttp2FrameReader enforces this, but the DefaultHttp2FrameWriter allows invalid frames to be written. We should not allow invalid ping frames to be written to the network.  Modifications: - DefaultHttp2FrameWriter checks the frame size to be 8, or throws an exception  Result: Fixes https://github.com/netty/netty/issues/3721
Move the option output formatting into LLVMOptions
Added license info
Log unresolved exceptions at error level
adding configs and validation
Refactoring, less guava, more standard JDK
CAMEL-8852: Camel JCR doesnt include Connection to a repository workspace except the default one
Resolve `ndk-build` properly on Windows  Summary: The method on `ExecutionContext`, which was only called by this code, didn't handle file extensions properly.  This removes that method, and adds a method on `ExecutableFinder` to do the right thing.  Test Plan: Ran `NdkLibraryIntegrationTest` and see that it got further.
Small fix to test and toString(); add helpful check for bad use of item/user pref array
fix issue with oauth user authentication where attributes and uid werent mapped
Detect default value from factory method    If a field is initialized via a factory method taking a single argument,  we can relatively safely consider that said argument is a good  representation of its default value. This is typically the case for  Charset or MimeType instances.    We now make sure to detect such use case (i.e. method argument with a  single argument).    Closes gh-3482
Ensure tomcat on the classpath does not imply web application
Polishing: fix some compiler warnings
Remove explicit constructor super() calls    Closes gh-11068
Use factoryBeanObjectType attribute to find factory bean to replace    Previously, MockitoPostProcessor would fail to replace a factory bean  with a mock if the factory bean didn't return a matching type from  getObjectType(). This prevented Spring Data respoitories from being  replaced with a mock as Spring Data's repository factory beans  generally do not know the specific repository type that they will  produce when MockPostProcesser (a bean factory post-processor) is  running.    Spring Data has been updated to add a factoryBeanObjectType attribute  to its factory bean definitions. MockitoPostProcessor has been updated  to look for FactoryBeans with this attribute and to use its value  to determine whether or not the factory bean produces a bean of the  required type and, therefore, should be replaced with a mock.    Closes gh-6541
refactor SimpleQueryParser settings into separate class, add "lenient" option  Fixes #5011
Add some missing nullable annotations.
Fix parsing of value with comma    Closes gh-12297
Quick Javadoc cleanup to restore snapshot building.
Quick Javadoc cleanup to restore snapshot building.
Fix spelling mistakes in comment, 'Transfort' to 'Transporter' (#5414)
Polish 'Make sure exception tag values are not empty in web metrics'    Closes gh-13187
Docs and actuator endpoints can be enabled when endpoints.enabled=false    Previously, if endpoints.enabled was false setting  endpoints.docs.enabled=true or endpoints.actuator.enabled=true would  have no effect as their entire configuration class was conditional  on endpoints.enabled being true.    This commit updates the conditions on the configuration class so that  it is conditional on either the actuator or docs endpoint being enabled.    Closes gh-5007
Restore that fields shadow fields from super class    This commit restores the shadowing behaviour of JUnit 4.12. Some users  of JUnit 4 have tests that rely on this behaviour. Their tests would  fail with JUnit 4.13.    This commit finally reverts 39b8a92d24e6c81e4fc614cdf13003ce17bbc166.  Some parts have already been reverted by  ed6813d3bbe2da4d67892f73e641fa80ab4d126e.
Add test for executing Calls at most once
Add test for executing Calls at most once
Rename Import*AutoConfiguration classes    Rename Import*AutoConfiguration classes to AutoConfigure*.    Fixes gh-5692
Add boolean flag spring.rabbit.listener.useTransactionManager    If set *and* there is a transaction manager in the context, then the  listener container created by Spring Boot will use the transaction  manager to execute the listeners.    Fixes gh-3432 (by virtue of not requiring a JtaTransactionManager any  more).
Move most http2 tests to Junit 5 (#6378)
Add control connection timeout property for Cassandra    Closes gh-24189
Polish 'Trim whitespace when coercing to a LogLevel'    Closes gh-15143
Improve transaction manager detection    Switch the condition used to trigger the creation of a transaction  manager from the default name to the actual type.    Fixes gh-3012
Update RSocket configuration after Framework changes    Since spring-projects/spring-framework#23314, the `RSocketStrategies`  provide more codecs by default, and there is no need to order them to  avoid conflicts during mime type selection.    This commit also ensures that the `PayloadDecoder.ZERO_COPY` is  configured on the RSocket server if the configured `DataBufferFactory`  is compatible with that strategy.
Allow to configure Kafka Listener's onlyLogRecordMetadata    See gh-24582
Apply customizers to build when created embedded Mongo client    Closes gh-11132
Simplify code by using for-each loop    See gh-15563
Rename nested *AutoConfiguration classes to *Configuration    Closes gh-12989
Use Collections.addAll(...) instead of for loops    Replace various for loops which add items to collections with calls  to Collections.addAll(...).    Fixes gh-2277
Avoid early init of CacheManager    This commit restructures the Cache auto-configuration to avoid an early  init on CacheManager (and potentially all its infrastructure). Rather  than adding a dependency on the validator bean, this commit relies on  the fact CacheAspectSupport checks if a CacheManager is available in the  afterSingletonsInstantiated callback. In this case, a simple bean with  a postconstruct callback is enough.    Closes gh-13038
Harmonize class visibility    Closes gh-19414
Add mediaTypes (extension to media type mapping) in MVC resources    Allows users to configure 'allowed' file extensions for controller  mappings, so that browsers will not switch to downloading 'f.txt'  (part of the recent RFD attack fixes in Spring MVC).    See gh-4220
Make sure Caching is initialized before JPA support    The second level cache of Hibernate can be configured with dedicated  factories that look up for the presence of a cache infrastructure. As  Hibernate shouldn't have to know about Spring, that lookup is done  against the respective proprietary APIs.    We now make sure that caching (and the general purpose Hazelcast  auto-configuration) is fully processed before JPA kicks in. In particular  an explicit `dependsOn` attribute on those beans is added when they are  processed.    Closes gh-4158
Polish 'Remove redundant interface modifiers'    Closes gh-15694
Remove internal configuration properties validator cleanup    This commit removes the cleanup of the javax.validator.Validator that  can be created to validate @ConfigurationProperties binding as the  memory effect can no longer be reproduced.    Closes gh-10573
Fix checkstyle issues in samples    Fix checkstyle issues with samples following the  spring-javaformat upgrade.    See gh-13932
readability enhancement and assert check for proxy object (#3048)
refresh configCenter before start
readability enhancement and assert check for proxy object (#3048)
make protocols a mutable list (a concrete ArrayList) (#3869)    * use ArrayList instead of Arrays.ArrayList
Forbid response bodies on HTTP 204 and 205 responses.
Add @Documented to the new annotations.
Use standard exception cause handling in RetrofitError.    Improves RetrofitError.toString() output.
Add @Documented to the new annotations.
Add test for executing Calls at most once
Do not leak body in intermediate buffers to converters    Multiple calls to source() would create a new BufferedSource which, when a single byte was read, would cache data in its buffer which would be lost on a subsequent call to source(). Calls to source() will now always return the same BufferedSource ensuring data cannot be lost.
readability enhancement and assert check for proxy object (#3048)
Avoid NPE when call AbstractDynamicConfiguration#execute (#6576)    fix #6575
Add support for @GrabResolver to AetherGrapeEngine    @GrabResolver can now be used to add a repository to the list that is  used for dependency resolution. Any repository that is added via the  annotation will then be available for the lifetime of the  AetherGrapeEngine instance. In reality, this equates to the lifetime  of the Boot application. This is in keeping with the documented default  behaviour [1]: 'By default, the grape subsystem is shared globally, so  added resolvers will become available for any subsequent grab calls'.    [1] - http://groovy.codehaus.org/api/groovy/lang/GrabResolver.html    [bs-345]  [60145036]
Removed unnecessary SuppressWarnings
#946 - Updated TemporaryFolder.newFolder() to give a better error message if a path contains a slash
Restore that fields shadow fields from super class    This commit restores the shadowing behaviour of JUnit 4.12. Some users  of JUnit 4 have tests that rely on this behaviour. Their tests would  fail with JUnit 4.13.    This commit finally reverts 39b8a92d24e6c81e4fc614cdf13003ce17bbc166.  Some parts have already been reverted by  ed6813d3bbe2da4d67892f73e641fa80ab4d126e.
Cleanup TemporaryFolderUsageTest and add it to AllTests suite
Autowiring rejects self references to a factory method on the same bean as well  Issue: SPR-12018
Update copyright year of changed files
Configure RouteMatcher at the RSocketStrategies level    After a change in Spring Framework (see  spring-projects/spring-framework#23314), the `RouteMatcher` to be used  with the RSocket infrastructure is configured on the `RSocketStrategies`  directly.    This commit moves the auto-configuration of the  `PathPatternRouteMatcher` from the message handling parts to the RSocket  strategy one.    Closes gh-17571
Expose setter for Map store in InMemoryMetricRepository    User can then use a weak reference map (for instance), if worried  about memory usage.
Ensure RestTemplate interceptors remain mutable    Fixes gh-4553
Handle wrapper types in Env actuator    This commit modifies the actuator `EnvironmentEndpoint` to allow  primitive wrapper types to be serialized in the response data  structure.    Fixes gh-24307
Allow data unit to be specified on the constructor parameter    See gh-21746
Auto-configure Micrometer's Clock in a single place    Closes gh-11977
Remove unwanted @Nullable annotations    See gh-15876
Changed exception message method name    Changed method name from setMissingExceptionMessage to  reportMissingExceptionWithMessage to be more consistent with the  existing API.
Fix request factory used with TestRestTemplate withBasicAuth    This commit updates the behavior of withBasicAuth on TestRestTemplate  by trying to use the same request factory type as the underlying restTemplate.  If creation of a new instance of the configured request factory class fails,  it falls back to the `ClientHttpRequestFactorySupplier`.    See gh-15982
[Dubbo-4147] restore the metadata store key change (#4170)
Tweak javadocs in SprinApplicationBuilder
Classes annotated with @RunWith(Suite.class) do not need to be public. (#1408)    This fixes a regression in JUnit 4.12 introduced by  https://github.com/junit-team/junit4/commit/1d97da7.
moved new test to 'running' subpackage
revert #5099, deserialization readObject related changes.
Fix spelling mistakes in comment, 'Transfort' to 'Transporter' (#5414)
Use header delay instead of body delay before status line (#4011)    * Use header delay instead of body delay before status line
performance tuning: avoid address resolve (#4220)
Add test for executing Calls at most once
make protocols a mutable list (a concrete ArrayList) (#3869)    * use ArrayList instead of Arrays.ArrayList
Remove usage of classes in Junit 4
Deprecate APIs that use Hamcrest classes.    Users should use the java-hamcrest library instead.    Closes #1150.
completely remove 'default.' prefix of URL key (#4222)
DRILL-655: Miscellaneous fixes for SchemaPath   - Fixed equals() and hashCode().  - Made PathSegment immutable outside of package.  - Made ArraySegment and NameSegment final.
Polish modifier order    See gh-12019
Allow Multipart requests with parts of unknown length
Fix relaxed binding of SI JMX config    Instead of using an expression for JMX-related properties, this commit  properly honors relaxed binding.    Closes gh-6184
