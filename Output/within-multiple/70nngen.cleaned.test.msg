[bs-138] Add categories (secure,open) to EndpointsProperties
Disable more @Bean method proxying    Previously, due to a quirk in Spring Framework, it was necessary to use bean method  proxying in @Configuration classes that define one or more FactoryBeans. This quirk has  now been addressed so this commit disables bean method proxying where it is now no longer  needed.    Closes gh-16533
Add POST to allowed CORS methods for CF actuators    Update CORS configuration to support POST.    See gh-7108
Skip tests on Windows that exceed its file system's limitations
Align simple sample with configuration properties validation change    See gh-8024
Simplify some code    See gh-17860
Change package name in sample
Remove autowired injection of HealthIndicators into HealthEndpoint    Moved into EndpointAutoConfiguration
Support binding to collection with EnumSet values    Fixes gh-15539
[bs-138] Add categories (secure,open) to EndpointsProperties
Deprecate/move CGLIB methods AopUtils=>ClassUtils  isCglibProxy* methods in AopUtils are useful in lower-level modules, i.e. those that cannot depend on .aop.  Therefore copied these methods to ClassUtils; deprecated the existing ones in AopUtils and now delegating to the new location; switched all usage of AopUtils#isCglibProxy* within the framework to use ClassUtils#isCglibProxy* instead.
Fix matching of SNAPSHOT artifacts when customizing layers    Previously the artifact's version was used. In an artifact's version,  SNAPSHOT is replaced with the timestamped version number of a specific  snapshot. As a result, it no longer matches the *:*:*SNAPSHOT pattern.    This commit replaces switches to using the artifact's base version.  This preserves the SNAPSHOT in the version number. For non-snapshot  artifacts, the version and base version are identical.    Fixes gh-23533
Support *Aware for @ComponentScan custom filters  Support a limited set of *Aware interfaces for TypeFilters created via the @ComponentScan annotation.  Issue: SPR-14009
Skips Cassandra and Elasticsearch tests on Windows    Neither Cassandra nor Elasticsearch starts reliably on Windows. This  commit adds a custom class rule to the associated sample application  tests to skip them on Windows. A class rule is used rather than a  Unit assumption as we want to avoid starting Elasticsearch (done by  the application context) and Cassandra (done by a test execution  listener) and an assumption would be too late.
Polish 'Add separate property for Redis read and connection timeout'    See gh-23137
Improve DefaultCookieSerializer auto-configuration    Spring Session's own configuration support (i.e.  SpringHttpSessionConfiguration) will configure the default  DefaultCookieSerializer with rememberMeRequestAttribute if  SpringSessionRememberMeServices bean has been detected in the  application context.    In contrast, Spring Boot's auto-configured DefaultCookieSerializer does  not do this which results in a different out-of-the-box experience for  users that rely on Spring Session's remember-me integration.    This commit improves Spring Session DefaultCookieSerializer  auto-configuration to match Spring Session's behavior and make the  auto-configured DefaultCookieSerializer aware of  SpringSessionRememberMeServices bean.    See gh-16513
Allow CompositeHealthIndicator to be created with a Map as before    See gh-4965
Support values other than String in /env    Fixes gh-9079
Make sure Caching is initialized before JPA support    The second level cache of Hibernate can be configured with dedicated  factories that look up for the presence of a cache infrastructure. As  Hibernate shouldn't have to know about Spring, that lookup is done  against the respective proprietary APIs.    We now make sure that caching (and the general purpose Hazelcast  auto-configuration) is fully processed before JPA kicks in. In particular  an explicit `dependsOn` attribute on those beans is added when they are  processed.    Closes gh-4158
Fix @ConfigurationProperties on @Bean methods without metadata caching    Due to a current limitation of Spring Framework, when bean metadata  caching is disabled, a merged bean definition may have a null  resolved factory method that would have been non-null if bean metadata  caching was enabled. Configuration property binding for @Bean methods  annotated with @ConfigurationProperties relied upon the resolved  factory method being enabled to find the @ConfigurationProperties  annotation and trigger property binding. As a result, when bean  metadata caching is disabled on the bean factory, such  @ConfigurationProperties beans would not be bound.    This commit works around the limitation by adding a fallback that  performs a reflection-based search for the factory method when the  resolved factory method on the bean definition is null. This allows  the bean's factory method and any @ConfigurationProperties annotation  on it to be found, ensuring that propoerty binding is then performed.    Fixes gh-18440
Polish 'Handle AbstractReactiveHealthIndicator.doHealthCheck exception'    Closes gh-10822
Guard IntegrationJmxConfiguration if no mBeanServer is available    Closes gh-12966
Properly discover endpoints that are proxied    Previously to this commit, if a `@ControllerEndpoint`,  `@RestControllerEndpoint` or `@ServletEndpoint` annotated bean was  proxied, the endpoint wasn't properly detected.    This commit makes sure that annotation retrieval works on the user class  while preserving the get (vs. find) retrieval semantic    Closes gh-12441
Optimize reactor operators in actuator support    This commit uses native Reactor operators `Mono.fromCallable` and  `subscribeOn` for better performance and support.    Fixes gh-17452
Use String indexOf(char) and lastIndexOf(char) where possible    Closes gh-11416
Include layertools in layered jars build with Gradle    Closes gh-19867
Set TCCL of shutdown thread when triggered by the shutdown endpoint    Previously, the shutdown endpoint would spawn a new thread to perform  the shutdown but did not explicitly configure its thread context  class loader (TCCL). This mean that the new thread would use the  request thread's TCCL as its TCCL. This meant that a different TCCL  would be used compared to a shutdown triggered by the shutdown hook  and also caused problems with Tomcat's thread leak detection logic.    This commit updates the shutdown endpoint to explicitly configure the  TCCL of the shutdown thread to be the ClassLoader that loaded the  endpoint's class.    Closes gh-6361
Use random port for DevTools tests    Change the `RemoteApplicationLauncher` to use a random port and also  protect against an NPE if the launch fails.
Disable child context's /error endpoint if disabled in parent    Previously, EndpointWebMvcChildContextConfiguration would attempt to  create a /error endpoint, irrespective of whether or not the parent  had such an endpoint. If the endpoint was disabled in the parent this  would cause a failure due to the absence of an ErrorAttributes bean.    This commit updates EndpointWebMvcChildContextConfiguration to make  the creation of its /error endpoint conditional on the existence of  an ErrorAttributes bean.    Closes gh-4164
Support binding to collection with EnumSet values    Fixes gh-15539
Ensure that condition evaluator uses runner\xe2\x80\x99s class loader    Closes gh-13319
Always auto-configure pool metadata providers    Import DataSourcePoolMetadataProvidersConfiguration from  DataSourceAutoConfiguration so that PoolMetadataProviders are configured  even if actuator is not used.
Do not enable cglib if spring.aop.proxy-target-class is configured    This commit makes sure to honour the `spring.aop.proxy-target-class`  property if set by the user. Previously, the  `MethodValidationPostProcessor` was always configured to use cglib,  regardless of the value of that property.    Closes gh-8869
Test compression with invalid content type for all webservers    See gh-18337
Fix property detection in SpringApplicationBuilder    Update SpringApplicationBuilder so that properties of the form  `abc=d:e:f` are correctly parsed. Prior to this commit the `:` delimiter  would always be chosen over `=`, even if `=` occurred first.    Fixes gh-6121
Make sure Caching is initialized before JPA support    The second level cache of Hibernate can be configured with dedicated  factories that look up for the presence of a cache infrastructure. As  Hibernate shouldn't have to know about Spring, that lookup is done  against the respective proprietary APIs.    We now make sure that caching (and the general purpose Hazelcast  auto-configuration) is fully processed before JPA kicks in. In particular  an explicit `dependsOn` attribute on those beans is added when they are  processed.    Closes gh-4158
Add Jetty SSL keystore in classpath test    Update JettyEmbeddedServletContainerFactoryTests to test loading an  SSL keystore from the classpath. Currently this is a Jetty only feature,  although if https://issues.apache.org/bugzilla/show_bug.cgi?id=56777 is  fixed we could do the same thing with Tomcat.    Closes gh-1943
Polish test property source changes made in 69b08291    TestPropertySourcesInitializer needs to be ordered with a high  precedence, specifically higher than  ContextIdApplicationContextInitializer, to ensure that any properties  used in setting the context\xe2\x80\x99s id are available in the environment.    Closes gh-4828
Polish 'Retrieve javax.cache.CacheManager using Bean ClassLoader'    Closes gh-13338
Add Binder backed CloudPlatform.isEnforced method    Update `CloudPlatform` with a new `isEnforced` method that's backed  by a `Binder` rather than the `Environment`. We'll require this when  we overhaul our external config data processing logic.    Closes gh-22498
Avoid early init of CacheManager    This commit restructures the Cache auto-configuration to avoid an early  init on CacheManager (and potentially all its infrastructure). Rather  than adding a dependency on the validator bean, this commit relies on  the fact CacheAspectSupport checks if a CacheManager is available in the  afterSingletonsInstantiated callback. In this case, a simple bean with  a postconstruct callback is enough.    Closes gh-13038
Add Binder backed CloudPlatform.isEnforced method    Update `CloudPlatform` with a new `isEnforced` method that's backed  by a `Binder` rather than the `Environment`. We'll require this when  we overhaul our external config data processing logic.    Closes gh-22498
Add Jetty SSL keystore in classpath test    Update JettyEmbeddedServletContainerFactoryTests to test loading an  SSL keystore from the classpath. Currently this is a Jetty only feature,  although if https://issues.apache.org/bugzilla/show_bug.cgi?id=56777 is  fixed we could do the same thing with Tomcat.    Closes gh-1943
Add 'client-name' property to specify a Redis client name    See gh-17330
Make all @Bean methods public    Fixes gh-1571
Use constructor injection in DataSourceInitializer    Closes gh-7973
Fail fast when attempting to repackage a reproducible war    Maven's war plugin does not support reproducible builds, resulting in  the entries in the war file not being written in a consistent order  from build to build.    Closes gh-20176
Fix injection point with proxied DataSource    Prior to this commit, the `ApplicationContext` couldn't start with a  JDK-proxied `HikariDataSource` as the JMX auto-configuration was  attempting to inject a (too narrowed) `HikariDataSource`.    This commit rather injects a regular `DataSource` and attempt to unwrap  it as a `HikariDataSource`.    Closes gh-12271
Ignore parent contexts in message source auto-configuration    This commit applies the changes made in 68b55ad to 1.2.x (it was  originally only made in 1.0.x and master). It also adds some tests.    Closes gh-3803
Improve Couchbase repository support    Previously, if Couchbase was available on the classpath but not  configured, Spring Boot would attempt to scan the project for  repositories anyway.    This commit makes sure that it only happens if an infrastructure  bean required is present. The tests have also been rewritten to better  reflect what would happen in practice.    Closes gh-5349
Add Redis Sentinel database support    See gh-12556
Disable resource cache when DevTools is enabled    Closes gh-3794  Closes gh-3739
Add separate property for Redis read and connection timeout    See gh-23137
Add support to detect Kubernetes platform in CloudPlatform    Closes gh-15537
Improve Couchbase repository support    Previously, if Couchbase was available on the classpath but not  configured, Spring Boot would attempt to scan the project for  repositories anyway.    This commit makes sure that it only happens if an infrastructure  bean required is present. The tests have also been rewritten to better  reflect what would happen in practice.    Closes gh-5349
Protect PluginApplicationActions against absent plugin classes    Closes gh-24526
Add configuration key for GzipResourceResolver    This commit adds a new key that configures a GzipResourceResolver  in the resource handling chain.    Configuring an application with the following will add that resolver,  which checks for gzipped resources in the configured locations:    ```  spring.resources.chain.gzipped=true  ```    This means that if a resource 'style.css' is requested, the  GzipResourceResolver will look for resources named 'style.css.gz', which  should be a gzipped variant of the 'style.css' file. Note that this  resolver only checks for variants if the client supports the 'gzip'  encoding, as defined in the 'Accept-Encoding' HTTP request headers.    Fixes #4683
Support binding to collection with EnumSet values    Fixes gh-15539
Migrate off deprecated Spring Data Cassandra API    Configure UserTypeResolver and CodecRegistry on  MappingCassandraConverter. Configure on CassandraMappingContext only the  simple type holder instead of custom conversions.    See gh-20662
Support binding to collection with EnumSet values    Fixes gh-15539
Support binding to collection with EnumSet values    Fixes gh-15539
Make intermediate classes of public classes public    Backport gh-12590 to 1.5.x and also pick up a few classes that were  missed. This commit also makes a few properties bound classes public.    Closes gh-17337
Make the AutoConfigurationReportEndpoint path a bit shorter
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
Rename classes and package in new OAuth2 and Actuator sample    Closes gh-8058
Update CLI to work around Framework's early adoption of Bismuth-SR1
Remove redundant code    See gh-17875
Delay property source initialization till LoggingSystem is initialized    Previously, the initialization of StandardServletEnvironment's  property sources in SpringBootServletInitializer led to debug logging  calls being made before the LoggingSystem had been initialized. As a  result, the system's default configuration was used and, in the case  of Logback at least, the debug logging was output to System.out  in a war deployment.    This commit updates SpringBootServletInitializer to delay the  initialization of StandardServletEnvironment's property sources until  after the LoggingSystem has been initialized, but still in time for  active profiles to be configured via servlet context parameters  (see gh-9972).    Closes gh-13736
Suppress debug log output during Logback initialization    Closes gh-12071
Make all @Bean methods public    Fixes gh-1571
Allow recursive list binding when iterable source    Further refine recursive binding rules so that Lists are supported when  the underlying source is iterable.    Close gh-10702
Add 'client-name' property to specify a Redis client name    See gh-17330
Make hot methods in-line friendly    Refactor a few hot methods so that they are more likely to be in-lined  by the JIT.    Fixes gh-11409
Ignore unbound collection properties if collection bound    As of Spring Boot 2.0, if Collection properties are specified in  multiple property sources, only the elements from the property source  with the highest precedence are used for binding. This caused an  `UnboundConfigurationPropertiesException` if the size of the collection  from the higher order property source was smaller and `ignoreUnknownFields`  was set to true.    This commit ignores unbound collection properties if the  collection was properly bound.    Fixes gh-16290
Replace convention mappings with PropertyState and Provider    Closes gh-9891
Remove unnecessary use of @Autowired in the samples
Disable DevTools property defaults in production    Update `DevToolsPropertyDefaultsPostProcessor` so that property defaults  are only added at development time. Properties are now added only when  `Restarter` is initialize or remote devtools is enabled.    Fixes gh-7014
Use RelaxedDataBinder for excludes    Update `EnableAutoConfigurationImportSelector` to directly use the  RelaxedDataBinder when obtaining excludes. This removes the need for  the additional getProperties method on RelaxedPropertyResolver.    See gh-4352
Fix detection of WebApplicationType with context class    Closes gh-14589
Add redirection to actuator endpoint    If a request to the actuator endpoint ends with a slash with Spring  HATEOAS on the classpath, an empty array of links is returned whereas  a request without the slash returns a response with all the expected  links to the actuator's other endpoints.    This commit adds an automatic redirection so that both URIs return the  expected result.    Closes gh-4575
Support case insensitive value for Cassandra's SchemaAction    Closes gh-8903
Polish 'Avoid string concatenation inside StringBuilder append()'    Closes gh-15589
Drop RepackageTask.getDependencies()    Drop `RepackageTask.getDependencies` from the gradle plugin in favor of  exposing `getLibraries()` and using the callback.  Drop getDependencies
Fix property prefix    This commit fixes the prefix for the WebClient and WebDriver auto-config  so that it complies with the prefix set on `AutoconfigureWebMvc`    Closes gh-6727
Change DataSourceHealthIndicator details from 'hello' to 'result'    Closes gh-15136
Update admin MBean to only be ready when its own context is ready    Previously, if there was a hierarchy of SpringApplications, the admin  MBean would report that the application was ready as soon as any  application in the hierarchy was ready. This could lead to a client  trying to query a property in the environment before it's available.    This commit updates the MBean registrar to that the MBean only reports  that the application is ready when the context that contains the  registrar has refreshed and fired its ApplicationReadyEvent.    Closes gh-6362
Polish modifier declaration ordering    Follow that Java language specification.
Align ordering of BootJar and BootWar archive entries    Previously, the ordering of the entries in an archive produced by  BootJar was different to the ordering of the entries in an archive  produced by BootWar. The latter placed application classes before  any nested jars, whereas the former was the other way around.    This commit updates BootJar to use the same ordering as BootWar and  adds tests to verify that the ordering is the following:    1. Loader classes  2. Application classes (BOOT-INF/classes or WEB-INF/classes)  3. Nested jars (BOOT-INF/lib or WEB-INF/lib)  4. Provided nested jars in a war (WEB-INF/lib-provided)    The tests also verify that the position of a library is not affected  by it requiring unpacking.    See gh-11695  See gh-11696
Improve error message when BootJar or BootWar has no known main class    Closes gh-12712
Fix welcome page support in WebFlux    Prior to this commit, the welcome page support implemented in gh-9785  would override existing index views in both annotation and functional  variants.    This comes from the fact that the feature was implemented as a  `RouterFunction` configured in the main `RouterFunctionMapping` bean.  Due to ordering issues between mappings, this would override existing  application mappings in some cases.    This commit ensures that the welcome page `RouterFunction` is  contributed to the context in its own handler mapping, ordered after the  application ones.    Fixes gh-21909
Align ordering of BootJar and BootWar archive entries    Previously, the ordering of the entries in an archive produced by  BootJar was different to the ordering of the entries in an archive  produced by BootWar. The latter placed application classes before  any nested jars, whereas the former was the other way around.    This commit updates BootJar to use the same ordering as BootWar and  adds tests to verify that the ordering is the following:    1. Loader classes  2. Application classes (BOOT-INF/classes or WEB-INF/classes)  3. Nested jars (BOOT-INF/lib or WEB-INF/lib)  4. Provided nested jars in a war (WEB-INF/lib-provided)    The tests also verify that the position of a library is not affected  by it requiring unpacking.    See gh-11695  See gh-11696
Remove use of deprecated Gradle API from plugin's public API    This commit removes the use of the incubating PropertyState and  Provider API that was introduced in Gradle 4.0 and deprecated in  Gradle 4.3. A not-deprecated-but-still-incubating replacement was  introduced in Gradle 4.3. The short life of PropertyState and Provider  has made me wary of using an incubating Gradle API in our public API  as it may not be stable for long. Therefore, this commit does not move  to the replacement as it is incubating. Instead, it falls back to  using Gradle's convention mapping. This is internal API, but its use  is not part of our public API and I perceive the risk of using it to  be lower than using the deprecated and/or incubating API alternatives.    Closes gh-11640
Register any EventListener beans with auto-configured SessionFactory    Closes gh-7531
Polish 'Test the Gradle plugin against Gradle 4.10.3 and 5.1.1'    Closes gh-15791
Add HANA to the lookup of well-known databases    See gh-15125
Add HANA to the lookup of well-known databases    See gh-15125
Defer disabling registry until Tomcat server is being created    Closes gh-16498
Retain inner-class data on incremental compile    Ensure that metadata sourced from inner-types is not deleted when  performing an incremental compile. Prior to this commit, the source  type was searched using the `Outer$Inner` format. This is not supported  `Elements.getTypeElement` so we now convert the names to `Outer.Inner`.    Closes gh-10886
Expose MongoDB's replica set name    Closes gh-20391
Allow @EnableTransactionManagement to be supplied by user
Auto-configuration of reactive Spring Session
Fix DefaultPropertiesPropertySource package tangle    Relocate `DefaultPropertiesPropertySource` to fix a package tangle.    Closes gh-23383
Update tests to shut down in-memory databases proactively
Ensure DispatcherServlet is available in a deployed WAR    The DispatcherServletAutoConfiguration had a condition on it that  meant it wasn't used at all if there was no EmbeddedServletContainerFactory.  It's amazing that any WAR ever deployed.    Also added some info logging to servlet and filter registrations.
Fix request factory used with TestRestTemplate withBasicAuth    This commit updates the behavior of withBasicAuth on TestRestTemplate  by trying to use the same request factory type as the underlying restTemplate.  If creation of a new instance of the configured request factory class fails,  it falls back to the `ClientHttpRequestFactorySupplier`.    See gh-15982
Apply gridFsDatabase to auto-configured ReactiveGridFsTemplate    Closes gh-18284
Don't limit collection sizes in property binding    Update PropertiesConfigurationFactory so that collections can grow  beyond 256 items. Prior to this commit configuration property binding  used the default `DataBinder.autoGrowNestedPaths` setting of 256.    Fixes gh-6436
Rename internal OutputCapture classes    Rename the internal versions of OutputCapture to prevent accidental  import.    See gh-5492
Use Collections.addAll(...) instead of for loops    Replace various for loops which add items to collections with calls  to Collections.addAll(...).    Fixes gh-2277
Update copyright year of changed files    See gh-21007
Refine AliasFor usage    This commit makes sure to use `getAliasedStringArray` rather than  `getStringArray` as the latter does not work with ASM. While this will  probably be fixed in the core framework, this commit also adds dedicated  tests with ASM to ensure that the code works as expected.    Closes gh-6337
Move limit and shuffle functions to IterableUtils
Fix break bug in for/foreach loops.
ensure annotation members are visited and used classes are resolved
Use time with nanosecond resolution calculated at the executing node to measure the time that contexts are held open  Closes #12345
Add VariableReferenceExpression to TopNRowNumberNode
added license to some java files
Follows changes in kernel (-ReturnFilter -> Predicate<Position>)
allow subdomain access parent domain's network
improve documentation for alias annotation code
Test case clean up
Set cursor exception inside GenericKeyState  ... instead of in CompositeGenericKey to get more details about error.
Inline SubscriptionHelper.isCancelled() (#6263)
Prevent 7.x nodes from joining cluster with un-upgraded 6.x .security indices (elastic/x-pack-elasticsearch#2921) (elastic/x-pack-elasticsearch#2940)  This is a forward-port of elastic/x-pack-elasticsearch/pull/2921.  original commit message:  Before this commit, a cluster with security enabled and backed by native-realm user permissions allowed rolled upgrades to clusters without upgrading the `.security` index. This resulted in the newly established 6.0 cluster not able to register the native-realm users previously established in the `.security` index. In order to fix this, one would have to rely on file-based users to re-configure and upgrade the `.security` index. Since this state is easily avoidable with an upgrade, this commit rejects the joining of upgraded nodes without upgrading the security index beforehand.  modifications:  Test with 7.x vs 6.x nodes.  Original commit: elastic/x-pack-elasticsearch@56f81bfb20e832a9690229da0cd33f2501d18a95
Fix more inspector warnings introduced by recent mergences
Fix a few typos  Minor changes to fix typos. Small adjustment to add a couple commas.
OM-DSL: add @since tags.
Use JDK Supplier for OperatorContext info supplier
Small clean up.
Aggregations: Encapsulate AggregationBuilder name and make getter public  Close #7425
Factor in JOrphanUtils useful method
Remove unnecessary casts
include isValid in Assumption.toString(); minor javadoc fix.
Remove unneeded instanceof.
Fixed problem with LET and variable output
Revert "Fix failing test"  This reverts commit c01f45fa59db126e928affccad596eca45c8c202.
Add missing mappers to MapperBuilders.   - completion  - geo_point  - geo_shape  - parent  - size  - ttl  Close #4423
Improve QueryBuilder to support VARCHAR condition
Use correct primary term for replicating NOOPs (#25128)  NOOPs should be, same as for indexing operations, written on the replica using the original operation term instead of the current term of the replica.
added NativeLibraryHandle.getName()
Fixed bug reported in ML by Andreas on the caching of indexed values. This fix should reduce also the memory occupied by the index nodes as well
Remove some unneeded unboxing, unneeded methods, made some stuff private that can be
Remove unused SourcePathResolver from NdkLibrary  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 6236b7d
Refactoring: HTTP/1.1 - HTTP/2 alignment  Change StreamOutputBuffer to implement HttpOutputBuffer
Refactoring. Remove PACKAGE_NAME constant.
[buck][i18n] Remove unused isStoreStringsAsAssets from FilteredResourcesProvider interface  Summary: Looks like no one is using this interface any more so we can clean up your TODO.  Test Plan: build buck
Don't replace all 'connection' headers when sending h2c upgrade request (#7824)  Motivation:  There may be meaningful 'connection' headers that exist on a request that is used to attempt a HTTP/1.x upgrade request that will be clobbered.  Modifications:  HttpClientUpgradeHandler uses the `HttpHeaders.add` instead of `HttpHeaders.set` when adding the 'upgrade' field.  Result:  Fixes #7823, existing 'connection' headers are preserved.
Fix node method parsing with cached fields. (GR-16366)
Add tests for prepared statements with subqueries  Pull request: https://github.com/prestodb/presto/pull/6928
Added method to allow creation of new methods on-the-fly.
Reduced timeouts from 60 to 10 minutes to avoid long CI hangs
Fix for transactional state leaking into cache
`JsBundleGenrule`: `skipResources` does not skip JS  Summary: Fixes a problem with `js_bundle_genrule`, where `skip_resources` was also skipping the JS output itself.  Reviewed By: fromcelticpark  fbshipit-source-id: 8ea626b0e9
Spring Boot configuraiton update
Convert DoctorSuggestion to @BuckStyleValue  Summary: - migrates to the new style of immutable - replaces `.of()` with constructor calls  Reviewed By: sbalabanov  fbshipit-source-id: 9208cbcd3a
[updated] scene2d widgets to have a size after being constructed. This is just so people are less confused when using widgets without Table. Call pack() if you change the size of a widget after construction and aren't using Table!
Method for instantiating a RelationshipTypeCreator so that it can be overridden
TIKA-468: Missing Silde-Count metadata for PPT files
Move JVM vendor detection to a global constant. Fix detection of Sun/Oracle JVM that only worked for older Sun branded JVMs.
bug 12364:  fixed export template with swift  status 12364: resolved fixed
Added multi-window API to LWJGL3 backend. See MultiWindowTest on how to use it.
compute lock depth for MonitorIdNodes correctly when inlining during parsing
Name added methods in NodeFactory appropriately
SimonStewart: Upgrading to HtmlUnit 2.4  r6037
Throw ESIA if required field 'patterns' is not present in filter config.  If 'pattern_capture' tokenfilter is create / mapped without a 'patterns' settings we now throw an exception since this is a misconfiguration and likely due to the similar settings on related token filters.  Closes #3808
Clean up warnings in spring-test   - Deleted unused imports.   - Switched from junit.framework.Assert to org.junit.Assert, since the    former is deprecated as of JUnit 4.11.   - Suppressed warnings for continued deprecated usage of    junit.framework.Assert.
Decrease visibility of inner classes. #1555  Possibility to instantiate private checks was added.  Fixes `PublicInnerClass` inspection violation.  Description: >Reports public inner classes.
Make Channel*Invoker package private
Use the Option annotation to specify CLI options for the sampler.
DRILL-1140: Add cast function from Timestamp to Time
clean delegated authn to wsfed
Add support for ValueProvider in JdbcIO.DataSourceConfiguration methods  Allows JdbcIO transforms to be fully templatized by providing ValueProvider support for the following methods: - create - withConnectionProperties - withPassword - withUsername
Exists API can send response body, closes #2072.
More efficient nodeExists  by using CommonAbstractStore#isInUse instead of reading the whole record to figure that out.
Watcher: Ensure correct method is used to read secure settings (#31753)  As SecureSetting is extended from Setting, you can easily accidentally use `SecureSetting.simpleString()` to read a secure setting instead of `SecureSetting.secureString()`. This commit changes this behaviour in some watcher notification services.
bug 9411: 1. adding storage pool fails, remove the entry in DB 2. in introduce SR, create pbd for master host  status 9411: resolved fixed
remove global phase metric, replaced with per-phase metrics
Enhance TargetNode equality to work with multiple repos  Summary: It's entirely possible for each repo to have targets with duplicate names, but which represent different rules. Currently when we build the Target Graph we only use the build target was for comparison, & this means that we're ignoring the repo the target is in. Fix that.  Test Plan: buck test --all
SimonStewart: Cleaning up some imports  r16101
test more javadoc code examples
Normalize template index settings before validating
GatewayAllocator: reset rerouting flag after error  After asynchronously fetching shard information the gateway allocator issues a reroute via  a cluster state update task. #11421 introduced an optimization trying to avoid submitting unneeded reroutes when results for many shards come in together. This is done by having a rerouting flag, indicating a pending reroute is coming and thus any new incoming shard info doesn't need to issue a reroute. This flag wasn't reset upon an error in the reroute update task. Most notably - if a master node had to step during to a min_master_node violation, it could reject an ongoing reroute. Lacking to reset the flag causing it to skip any future reroute, when the node became master again.  Closes #11519
Consistent final declaration for static delegate classes  Issue: SPR-16968
Do not recompute existing annotatedSuperInfo
Only write out modified persistence windows (AbstractPersistenceWindow only).
Provide 'with implementationType' overloads  Provided overloaded versions of `forField` and `forMethodParameter` that accept a `ResolvableType` implementation type (as opposed to a Class).  Primarily added to allow resolution against implementation types that have been created programmatically using `forTypeWithGenerics`.  Issue: SPR-11218
Rest improvements (#2113)  * Use DeferredResult in TGT creating endpoint  * Fix tests  * Create Jackson Writer only once  * Use StringBuilder over Formatter as it's almost 10x faster (355707.814 ops/s vs 2652050.343 ops/s)  * Add TODOs for tasks  * Extract stirng constants  * Do all the concatenations we can on start up. Add an initial capacity to the StringBuilder  * Iterate over values as keys are not used  * Log error in one line  * Remove TODO  * Cleaning checkstyle  * Do not use DeferredResult as we need to test it deeply  * Fix tests for non DeferredResult implementation
Propagate cxx.ldflags to Xcode project  Summary: This adds values in `cxx.ldflags` to `OTHER_LDFLAGS` field for generated xcconfigs. This brings `ldflags` on par with `cxx.cflags`(set to `OTHER_CFLAGS`) and `cxx.cxxflags` (set to `OTHER_CPLUSPLUSFLAGS`). Closes https://github.com/facebook/buck/pull/1756  Reviewed By: milend  Pulled By: milend  fbshipit-source-id: 0d9b81a
SQL: Improve handling of invalid args for PERCENTILE/PERCENTILE_RANK (#37803)  Improve the Exception and the error message returned when 2nd argument of PERCENTILE and PERCENTILE_RANK is not a constant.
cxx: thread in platform conflicting header whitelist for PCH rules  Summary: The PCH code was overlooked in the original change that added this.  Reviewed By: philipjameson  fbshipit-source-id: 0122783a15
add progress to indices status API
Add option to run PTransform steps from PipelineRunner  Added PipelineRunner.run(PTransform) method. Added PipelineTest.testRunPTransform() test case.
Show location identity in graph dumps.
Changed Enclosed runner to ignore abstract classes. Before this change, an abstract enclosed class caused jUnit to throw an exception.
Random javadoc spruces for Maps.asMap/toMap and Ordering. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=49401524
Added new flag for compiler only flags to [cxx] section of .buckconfig  Summary: This diff provides a new flag 'compiler_flag' to the [cxx] section which is combined with the compiler flags but not the preprocessor flags from the config file.  Test Plan: Unit tests:  CxxPlatforms.combinesPreprocessAndCompileFlagsIsDefault CxxPlatforms.compilerOnlyFlagsNotAddedToPreprocessor
Improve Javadoc in SQL script support classes
adding missing finals
Include off-heap metadata size in MemoryWalker.RuntimeCompiledMethodAccess.
WW-4095 WW-4094 Changes how pattern is compiled to be once per instance and changes default regexp to match underscore
[#2573] UnpooledUnsafeDirectByteBuf.setBytes(int,ByteBuf,int,int) fails to use fast-path when src has array  Motivation:  UnpooledUnsafeDirectByteBuf.setBytes(int,ByteBuf,int,int) fails to use fast-path when src uses an array as backing storage. This is because the if else uses the wrong ByteBuf for its check.  Modifications:  - Use correct ByteBuf when check for array as backing storage - Also eliminate unecessary check in UnpooledDirectByteBuf which always fails anyway  Result:  Faster setBytes(...) when src ByteBuf is backed by an array.  No more IndexOutOfBoundsException or data-corruption.
Use Constants.SESSION_PARAMETER_NAME instead "jsessionid".
Make otest tool optional in Apple platforms  Summary: Xcode 7 no longer ships `SenTestingKit` or its test runner `otest`, so this commit makes the `otest` tool optional and throws an exception if a test tries to use it when it's not present.  Test Plan: Updated unit tests. `ant java-test -Dtest.class=AppleCxxPlatformsTest`
more logging on region and endpoint used
Fixed CS for Camel-Spark and regen
Added eventIdentifier to SlaveContext
Adding close connection support to HttpClient to combat hanging open files  Added a .close() method to org.openqa.selenium.remote.http.HttpClient interface.  Added a call to the client's .close() method from the HttpCommandExecutor class when a org.openqa.selenium.remote.DriverCommand.QUIT is sent.  Implemented the .close() method in org.openqa.selenium.remote.internal.ApacheHttpClient which taps the connectionManager and closes idle connections.  Fixes #1080  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Restored log lines to TRACE for notification post alias creation and open/close index Introduced specific log level for those in OpenCloseIndexTests#testCloseOpenAliasMultipleIndices
Fix FakeProjectFilesystem.getFilesUnderPath()  Summary: `FakeProjectFilesystem.getFilesUnderPath()` is broken in a bunch of ways currently. It had no tests, so it sadly regressed.  1) `ProjectFilesystem.walkRelativeFileTree()` is polymorphic, but the most general version of the API which takes an `EnumSet<FileVisitOption>` was private, so `FakeProjectFilesystem` could not override it.  2) `ProjectFilesystem.getFilesUnderPath()` incorrectly converted the project-relative path to an absolute path before passing it to `ProjectFilesystem.walkRelativeFileTree()`. That method requires a project-relative path.  3) `FakeProjectFilesystem.getFilesUnderPath()` was implemented to always return the empty set.  Test Plan: New test added. Confirmed it failed until I fixed all above issues.
Cache: exists() called / rel. path support
Minor improvements in the local and the queue scheduler
Migrate NOT_EQUAL operator for arrays to new framework
Buck: sort the suggested dependencies for Java  Summary: Currently if the dependencies are missed when building Jave, Buck will suggest them but unsorted. This change is to sort the suggested dependencies to make it more readable and easier to operate.  Test Plan: Build the Buck project and verify all unit tests passed.  Reviewed By: Coneko  fbshipit-source-id: 09189e1
Add default method getColumnTypes to SystemTable
https://issues.apache.org/activemq/browse/AMQ-2706 - request-reply over network
Added <p> tags to javadocs paragraphs.  ----Release Notes---- [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=90613025
Fix datafeed with date_histogram aggregation (elastic/elasticsearch#876)  date_histogram buckets return the key as a DateTime object. This PR checks if the key is DateTime and returns the epoch millis when suitable.  Fixes elastic/elasticsearch#869  Original commit: elastic/x-pack-elasticsearch@8e39760dad55e07c9f216f59ed673fb8344da202
[java] Moving marionette specific test to the corresponding class
Make Hive view error message a constant
Add random read failures in unit tests to test the retry logic added to S3BlobContainer.openInput()
Clean up tests
HIVE-7314 : Wrong results of UDF when hive.cache.expr.evaluation is set (Navis reviewed by Ashutosh Chauhan)
added newBlob method on database document interface
Remove unused SourcePathRuleFinder  Summary: Nothing is using this.  Reviewed By: styurin  fbshipit-source-id: 1da0fc0d97
Rename transaction type to write state, update setter name.
sulong: rename LLVMScanner#parseBitcodeBlock to #parseBitcode
Make PrecompiledHeaderData implement AddsToRuleKey  Summary: This allows us to remove the custom appendToRuleKey in CxxPreprocessAndCompile and will allow us to correctly derive its deps automatically.  Reviewed By: ttsugriy  fbshipit-source-id: c0bacf2
Renames class to match pattern used in Tiles
Small fix to test and toString(); add helpful check for bad use of item/user pref array
break down of strategy to composable parts
some minor refactoring
Fix match_phrase_prefix query with single term on _all field (#20471)  * Fix match_phrase_prefix query with single term on _all field  This change fixes the match_phrase_prefix query when a single term is queried on the _all field. It builds a prefix query instead of an AllTermQuery which would not match any prefix.  Fixes #20470  * Add missing change
Move InMemoryStateInternals to runners/core-java
[hotfix] [checkpoints] Remove never used method 'close()' on CheckpointStreamFactory  The fact that the method was never called (and never implemented) strongly suggests that it should be removed, otherwise someone might eventually end up implementing it for a new state backend and wonder why it is never called.
Resync fails to notify on unavaiable exceptions (#33615)  We fail to notify the resync listener if the resync replication hits a shard unavailable exception. Moreover, we no longer need to swallow these unavailable exceptions.  Relates #28571 Closes #33613
[streaming] [api-breaking] Minor DataStream cleanups  - Removed unused constructor parameter. - Updated outdated and wrong connection javadocs.  Closes #825
Make Arrayblock, MapBlock, RowBlock support mayHaveNull
Remove SourcePathRuleFinder from LuaScriptStarter  Reviewed By: bobyangyf  fbshipit-source-id: bde6ca646a
https://issues.apache.org/jira/browse/AMQ-3205 - Update ActivationSpec, patch applied with thanks
Remove empty PartitionedLookupSourceFactory.close() method
fix usage of deprecated apis
ExternalUUID control: enforce checking uuid validity by defining checkUUID method in the corresponding absract class, and performing the check during API command dispatching
Update header to 2017
Fixes due to changes in master branch.
Issue #2161: unify test input locations
Adding a method to enable insecure cert support via FirefoxOptions
Move verification of valid final CacheResultType earlier  Summary: Currently this is only verified in the console eventbus listener. By that point we've lost a lot of the context of how this got set to this value.  Add a couple places much earlier that will verify this.  Reviewed By: philipjameson  fbshipit-source-id: 2a2f488b4c
Put nonoss under Spring framework
Minor javadoc updates
When getting display data from a runtime parameter, don't call get().
Fix errors reported by javadoc  Motivation:  Javadoc reports errors about invalid docs.  Modifications:  Fix some errors reported by javadoc.  Result:  A lot of javadoc errors are fixed by this patch.
AbstractCxxLibrary: don't extend `NativeTestable`  Summary: This belongs on the actual concrete classes, rather than the base interface for C/C++ libs.  Test Plan: CI  Reviewed By: Coneko  fb-gh-sync-id: 6b2b888
Change exception types to avoid casting error  Summary: We may occasionally get a casting exception due to multiple layers of exceptions. It is sufficient to just throw the UncheckedExecutionException  Test Plan: unit test  Reviewed By: sbalabanov  fbshipit-source-id: c2612de
Add ByteBuf leak detection @Rule  This commit introduces a JUnit rule that detects ByteBuf leaks in subclasses of AbstractDataBufferAllocatingTestCase.
Make PageLoader an interface.
Fixed bug on using remote indexes reported in ML
Add resource_union_package for android_binary  Summary: When I committed "Add resource_union_package for android_library", I forgot that we do our own R.java generation for the uber R.java, rather than using the one from aapt.  This makes resource_union_package work on android_binary (for uber R.java) to make sure those resource ids are available at runtime.  Test Plan: Ran the app in question, rather than just building it. :)
Use ILLEGAL.equals(value) in ValueUtil.isIllegal
CAMEL-5857: Add server side enrycption algorithm option to s3 producer. Thanks to Scott LePage for the patch.
Two way sync with moe (#1108)  * Enable v12 for GMS auth and add v12 visibilitys for it, FamilyLink, and libraries/kids. This is all building up to upgrading FamilyLink to v12.  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=167909893  * fix a Moe sync directive error  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=169141166  * Replace occurrences of Wrapped.valueOf(...) with Wrapped.parseWrapped(...) where the value will be immediately unboxed anyway.  The change removes small-but-pervasive inefficiencies from creating and immediately discarding instances of the wrapped value, as well as removing unnecessary syntax.  More information: go/lsc-immediateunboxing  Tested:     tap_presubmit: http://test/OCL:189509157:BASE:189708880:1521556795490:d7b0a09a     Some tests failed; test failures are believed to be unrelated to this CL  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=189880661  * Fix bug that MediaHttpDownloader couldn't specify a size larger than 4G.  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=192165502
Internal: resolve a few compiler warnings  @NotThreadSafe is not a valid standard java annotation. Removed unused method and empty @param javadoc annotation  Original commit: elastic/x-pack-elasticsearch@3583bcfa66362f5b3b99e7f6d33df5b985d9c688
revised TypedValue toString representation (SPR-7569)
Internal testing change  ----Release Notes---- ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=97257395
[fixed] Actor.visable -> Actor.visible [fixed] Removed iterating over children with fancy for loop syntax.
Removed some System.outs
Use configured time zone for logging in test harness  This commit fixes a problem where configured time zone for log files was not used for the user log. `Neo4jRule` used to ignore the `dbms.db.timezone` setting. Thus neo4j.log and debug.log contained different time zone offsets in logged timestamps.
fix tests with json and yaml registries
Allow recursive directory traversal to be configured  Right now there is no way to configure this value, even if Hive is configured to support recursive directory traversal/subdirectories. This commit exposes the variable through a HiveClientConfig value.
Ignore tests that fail on CI servers
Add better validation error message and a dedicated test
Throw exception for delete from unpartitioned Hive table
Mark PValue and PValueBase Internal  These should not be referred to as their abstract types by users, and PipelineRunners won't interact with PValues that aren't PCollections or PCollectionViews.
Remove unnecessary imports
minor refactor: slightly earlier return for some AST transform validation checks
SPR-8429 Add test cases for missing header, cookie, and pathvar values
Remove unused imports idnetified by Eclipse
[BEAM-316] Add file scheme support in TextIO
CAMEL-6792: Added getMockEndpoint method to not auto create. Thanks to James Carman for the patch.
fixed timing issue in shutdown logic of Queue component along with making the a test case a little less noisy when ran
Remove Predicates.always{True,False} obsoleted by Guava
add getDocument() function
Use Splitter instead of String.split, in InternetDomainName.  RELNOTES=n/a  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=193087177
Removing extra empty lines
[javadocs, network] Add javadocs to SpanningRecordSerializer and RecordSerializer
reformat  Revision created by MOE tool push_codebase. MOE_MIGRATION=2324
Cache success type included as part of machine readable log.  Summary: In the case of a cache hit, this will allow us to determine the type of cache hit, e.g. default rule key, input-based rule key, etc.  Test Plan: added new unit tests  Reviewed By: aiked  fbshipit-source-id: 24c3ce2
Fix a bug where store migration forgets about legacy indexes.  IndexManager now also respects the availability guard (by virtue of transaction begin) when creating an index.
Removed unused imports  Motivation:  Warnings in IDE, unclean code, negligible performance impact.  Modification:  Deletion of unused imports  Result:  No more warnings in IDE, cleaner code, negligible performance improvement.
Reduced debug output
assign names to threads that do not have one.  patch by jbellis
Change BinaryBuildRule.getExecutableCommand to return List of arguments instead of formatted string.  Summary: Change getExecutableCommand to return something easier for ProcessBuilder to work with.  Test Plan: buck test --all
Move parser profiling option to parser options  Summary: This is in preperation for extracting parser API into its own interface, so that multiple implementations are possible.  Test Plan: buck test ...  Reviewed By: dinhviethoa  fbshipit-source-id: c895fe5
plugins: fix print of url when it contains spaces
Fix more inspector warnings introduced by recent mergences
Add ByteBuf leak detection @Rule  This commit introduces a JUnit rule that detects ByteBuf leaks in subclasses of AbstractDataBufferAllocatingTestCase.
Make it easier to specify a shader
Replace ResolvedJavaType.isFinal with more meaningful and correct isLeaf
Added comments for the search builder classes on how to use them
Added some more checks on HTTP REST invocation
Java API: ActionFuture#actionGet to automatically unwrap failures, closes #1292.
make Token serializable again for JMX
Clean up warnings in spring-websocket
Moved EigenSeedgenerator plus test into spectral package because it is only used by SpectralKMeansDriver.
DefaultPromise make listeners not volatile  Motivation: DefaultPromise has a listeners member variable which is volatile to allow for an optimization which makes notification of listeners less expensive when there are no listeners to notify. However this change makes all other operations involving the listeners member variable more costly. This optimization which requires listeners to be volatile can be removed to avoid volatile writes/reads for every access on the listeners member variable.  Modifications: - DefaultPromise listeners is made non-volatile and the null check optimization is removed  Result: DefaultPromise.listeners is no longer volatile.
fixed issue with type detection from string for values starting with '-', issue #2924
Bulk API: Rename `index` to `_index`, `type` to `_type` and `id` to `_id`, closes #421.
Move CodeSignIdentityStore.DEFAULT_IDENTITIES_COMMAND to AppleConfig  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: b7b9958
Reindex: Better error message for pipeline in wrong place (#21985)  `_update_by_query` supports specifying the `pipeline` to process the documents as a url parameter but `_reindex` doesn't. It doesn't because everything about the `_reindex` request that has to do with writing the documents is grouped under the `dest` object in the request body. This changes the response parameter from `request [_reindex] contains unrecognized parameter: [pipeline]` to `_reindex doesn't support [pipeline] as a query parmaeter. Specify it in the [dest] object instead.`
Added dictionary for 2 metrics about req/sec
CLOUDSTACK-1862 Added vm ip address info in the list PF rules response  Signed-off-by: Abhinandan Prateek <aprateek@apache.org>
these tests were failing on windows where File.delete fails if the file is still open.
[updated] scene2d widgets to have a size after being constructed. This is just so people are less confused when using widgets without Table. Call pack() if you change the size of a widget after construction and aren't using Table!
TIKA-1412 - Add UnitTest
Move ParseBuckProfilerReportEvent to an appropriate package.  Summary: Otherwise an attempt to add a dependency on it leads to cyclic deps.  Reviewed By: jtorkkola  fbshipit-source-id: a4c9665
Fix TreeBackedTypeElement.asType for generic types  Summary: `asType` for a generic type is expected to return a `DeclaredType` whose type arguments are `TypeVariable`s. This was not being tested, and was broken.  Test Plan: New unit tests  Reviewed By: dreiss  fbshipit-source-id: 982d2a8
Fixed issue with test code
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
bug 8249 : save combined persistent and run-time id into worker to help worker VM GC
Add missing line to license header
Revert signature change in BDRU.registerWithGeneratedName  This change broke binary compatibility as evidenced by running the greenhouse test suite and finding that Spring Integration's AbstractConsumerEndpointParser.parseInternal fails with NoSuchMethodError when trying to invoke.
Revert "All SFBuilder setters return 'this' & use varargs"  This reverts commit 0e2ce565c9ef64d97299836a3b979b2cf85de759.
clean up license headers.  patch by Nate McCall for CASSANDRA-1294
api.object: add some missing javadoc
Adding missing license header
CLOUDSTACK-2536: fix the regression introduced by 4c81ea69c4e8326cc81a0e2607f6a6d99645ce5f
Pass CxxTest its SourcePathResolver from runTests context  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 648fb82
[streaming] streamrecord add method and tests updated
Drop remaining getSlice methods from temporal field value providers
Rewrite getVariableNameTypesMapping to new Type
Cleanup and fixes in handling of VirtualStates around loop exits merging
Extra method instead of base implementation of next
Move across the import checks
Remove (read|write)SortBuilder
Fix creating views for tables names that need quoting  Table names may contain special characters and should be quoted when formatting SQL queries. For example, creating a view with this query fails: SELECT count(*) FROM "$test"
Minor refactoring: remove duplicated code
Follows changes in kernel (-ReturnFilter -> Predicate<Position>)
Pull-up code. No need for this to go all the way to the Endpoint.
Deleting unused imports
turned requestedSessionId into a settable property
Issue #1604. Remote bag. Fix embedded serialization
include last value in cause when error occurs in takeUntil(predicate)
Deprecate Iterators.emptyIterator() in Guava, because it always has a decent replacement even when not on Java 7. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=66299891
Fix @RequestBody argument processing for null Content-Type  Since the changes introduced in SPR-12778, some `@RequestBody` args would not be properly processed in some cases:  * requests with an empty body * no Content-Type header defined  This typically happens when GET requests are mapped on a handler dealing with POST requests and HTTP bodies.  This change makes sure that the `RequestResponseBodyMethodProcessor` is only involved for requests that:  * have a Content-Type defined * OR are HTTP requests eligible for an HTTP body (PUT, POST, PATCH)  Issue: SPR-13176 Fixes spring-projects/spring-boot#3313
Revert my previously not so clever implementation. If there is an executor being used, then one shall expect that the executor is reporting the numbers of threads itself, and it should no longer be the responsibility of the connector
We should let a client change the client id on a connection even if it was set on the connection factory.
Mark methods final if they are used in constructors. #1555  Fixes `OverridableMethodCallDuringObjectConstruction` inspection violations.  Description: >Reports any calls to overridable methods of the current class during object construction. A call is during object construction if it is made inside a constructor, in an non-static instance initializer, in a non-static field initializer or inside a clone(), readObject() or readObjectNoData() method. Methods are overridable if they are not declared final, static or private. Such calls may result in subtle bugs, as the object is not guaranteed to be initialized before the method call occurs.
Profiler: new metric "server.network.requests" as the sum of binary and HTTP requests
KAFKA-6148; ClassCastException in connectors that include kafka-clients packages (#4457)  Exclusion for packages that need not be loaded in isolation needs to be extended to all the `org.apache.kafka` packages (that do not belong to transforms and the other whitelisted packages). Most notably, this refers to any classes in `kafka-clients` package.   Reviewers: Randall Hauch <rhauch@gmail.com>, Jason Gustafson <jason@confluent.io>
Internal: Deguice IndicesService  Almost all the dependencies of indices service are already created outside of guice. This change deguices MetaStateService, and then IndicesService.
CLOUDSTACK-1332: Pass IPv6 DNS to VR
* SecureChatServerHandler should use ChannelGroup where possible * Moved MapBackedSet and its test class to org.jboss.netty.util becuase it's used only there
fixed parent propagation of configuration in OrientDBConfig, issue #7728
HtmlUnitDriver: Throwing NoSuchWindowException if the current window was closed.
Removed unused imports
Change CharSource.wrap(...).toString() to use Ascii.truncate and increase the maximum number of characters to truncate at. Also change ByteSource.wrap(...).toString() to truncate the hexadecimal representation of the byte array. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=59155734
Renamed @WebTests to @WebTest  @WebTests has been renamed to @WebTest so that the Gradle build does not attempt to run it as a JUnit test.
Adding licence header to files to make the build pass
ensure mongo/redis ticket registries handle crypto ops
[FLINK-10089][tests] Update FlinkKafkaConsumerBaseMigrationTest for 1.5
Sorting out imports.
Remove unused imports  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Add context to RealAndroidDevice.rmFiles() errors  Summary: This will just hide higher stack frames and include a message that we were trying to delete files on a particular device (with its id).  Reviewed By: asp2insp  fbshipit-source-id: f301f92
Remove redundant getFrameSlotKind method
added log statements
Renamed LeftCurlyCheck to AbstractLeftCurlyCheck. Completely happy with the name. :-)
Handle merging of attribute repositories and authn source correctly for all authentication schemes
3.x: add marbles to X.fromSupplier (#6531)
Fix SQL CONTAINS with lists of lists  Resolves: #8653
Remove unused PhasePosition.HIGH_LEVEL.
Enable Docker in the PortableDirectRunner  Add an EnvironmentType which allows the PortableDirectRunner to construct either in-process environments or docker environments.
removed unused method DeoptimizingNode.isCallSiteDeoptimization()
Fix a bug in the regex that matches native library file names.  Summary: iknowregex  Test Plan: Added a unit test.
Optimized scalar observeOn/subscribeOn
WW-4688 Excludes "java.ext.dirs" when scanning for actions
Adding license headers to make the build pass
Enables implementations of the BlobContainer interface to (#19749)  conform with the requirements of the writeBlob method by throwing a FileAlreadyExistsException if attempting to write to a blob that already exists. This change means implementations of BlobContainer should never overwrite blobs - to overwrite a blob, it must first be deleted and then can be written again.  Closes #15579
Remove ToolchainProvider from constructor of AndroidPrebuiltAarDescription  Summary: Instead use `ToolchainProvider` from `BuildRuleCreationContext`.  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: bfc1f4a
Reverted correct size() calculation because of the performance penalty that would come with it. A solution to/existence of size() will have to revisited later
Move PlanPrinter to sql.planner.planPrinter package  extraction of inner-classes as package-private top-level classes will follow.
Avoid background sync on relocated primary (#40800)  There were some test failures caused by the background retention lease sync running on a relocated primary. This commit fixes the situation that triggered the assertion and reactivates the failing test.  Closes #40731
Unused imports Tidy error handling
Changed all configuration files to be visible  Original commit: elastic/x-pack-elasticsearch@f1db8b43bb79c3478e5761f2028f0aab1c767b55
CLOUDSTACK-8833: Fixed  Generating url and migrate volume to another storage , resulting two entry in UI and listvolume is not working for that volume Update the volume id in volume_store_ref table to newly created volume for migration  (cherry picked from commit 42b89278e9386b8bc90e36fb600d7730e676ae72) Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>
Mark RemovalListener and Weigher as Java 8 FunctionalInterfaces  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=143461582
- Gaurd access to dispatched list ( a sync was missing). - Added better exception messages to know what happened when a slave subscription gets out of sync with the master. - Implemented a simpler isFull()
Update special-cases of GroupAlsoByWindow to use getOutputTimestamp  ----Release Notes---- [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=99225882
pass CallTarget name to Truffle-generated StructuredGraphs
Fixed nullshape indexing. Closes #3310
Tweaks necessary to make common.collect build in Java 8. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=65201740
Added allowIpod to IOSApplicationConfiguration  Added a new variable to IOSAppConfig called allowIpod in order to be able to play the game without stopping the background music from iPod app. Also, modified the constructor of IOSAudio to pass the IOSApplicationConfiguration from IOSApplication.
Move schema guard to global dependencies.
support for inner classes (local/member) in meta API
Bug fix with the ldap principal id when no attributes are found if they are resolved elsewhere via person directory, etc.
Recognize that the reason for an early completion might be cancellation rather than exception. This fixes the bug "com.google.common.util.concurrent.AbstractFuture$Cancellation cannot be cast to com.google.common.util.concurrent.AbstractFuture$Failure"  TODO(cpovirk): Write basher tests at some point. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=96784416
Simplify getting topic connection
SimonStewart: Marking failing chrome tests as ignored to green the build.  r16358
Remove some default methods and annotations  Summary: Not needed  Reviewed By: ttsugriy  fbshipit-source-id: b3ea341993
Support username and metadata in TransactionData events
CAMEL-8561: Better component docs summary of components - we use javadoc from the endpoint class instead of component so its in the same source file as @UriEndpoint.
Texture, fixed filter on reload.
Minor fixes to the javadoc.
Fixed the doc for the network offerings
Adding close connection support to HttpClient to combat hanging open files  Added a .close() method to org.openqa.selenium.remote.http.HttpClient interface.  Added a call to the client's .close() method from the HttpCommandExecutor class when a org.openqa.selenium.remote.DriverCommand.QUIT is sent.  Implemented the .close() method in org.openqa.selenium.remote.internal.ApacheHttpClient which taps the connectionManager and closes idle connections.  Fixes #1080  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Add support for splitting a compressed source for uncompressed files  This adds support for splitting the file if the file name does not end with one of the supported compression formats (currently gz and bz2) and the delegate source also supports splitting.  This is for Apache Beam.  ----Release Notes----  [] ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=114894950
Use supplier to pass rules to exclude around AndroidBinary  Summary: This will allow to pass `rulesToExclude` to `AndroidBinaryGraphEnhancer` from `AndroidInstrumentationApkDescription` as a supplier which will be used in the following changes to avoid the instantiation the whole set.  Reviewed By: jtorkkola  shipit-source-id: 6a39074075
Rename CorsConfigurationMapping to UrlBasedCorsConfigurationSource  Issue: SPR-13192
Remove the annotation output of the abi targets from the source folders  Summary: This avoids adding duplicate classes to IntelliJ.  Reviewed By: asp2insp  fbshipit-source-id: b4b19109ee
Made sure that named filters and queries defined in a wrapped query and filter are not lost.  Closes #6871
Account for inner classes in test filtering  Summary: Test filtering does not work if you ask the test runner to run something like com.facebook.buck.rules.CachingBuildEngineTest$OtherTests  Test Plan: manual  Reviewed By: aiked  fbshipit-source-id: 9051ecf
Useful iterator util fromEnd
Fix usage of "parent" as a projection name in SQL  Resolves: #8565
Cleanup logger declarations for shard compaction
java/com/google/common: CL generated with data from dead-code analysis using //devtools/scythe:remove_dead_code ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=68103937
2.x: Add empty source clauses to javadocs of combineLatest operators accepting unspecified number of sources. This commit resolves #5412 (#5413)
Add isLinked method to ResolvedJavaType
Replace ResolvedJavaType.isFinal with more meaningful and correct isLeaf
Polishing  Issue: SPR-10469
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=55110 Small performance improvements Patch provided by Adrian Nistor
Composite transform lambdas via PTransform::compose
Mapping updates on objects should propagate `include_an_all`. #20051  Today you can't update `include_an_all` on an existing object. The bug affects 2.x too.
Minor tweaks to tests to reduce memory usage WW-1715
bug 10429: Enable redundant virtual router for 2.2.9  status 10429: resolved fixed
doh - added the correct headers
TraceRA: handle ShadowedRegisterValue correctly.
make entries in diagnostics zip file have relative path names
Remove unused SourcePathResolver from CxxInferCaptureTransitive  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: bbceadb
Removed unused imports.
Issue #2137: Make test for FileTabCharacter locale and OS independent
HIVE-7605: add more javadoc to HivePrivilegeObject (Thejas Nair via Jason Dere)
Include current date and time in Chrome trace filename  Summary: Does what it says on the tin.  Test Plan: Unit test included. Ran 'buck project', confirmed trace file had expected format.
STORM-1017: Ignore ignoreZkOffsets for trident.
Moved some of the http tests to jetty to avoid online lookup as it failis sporatic on some of the TC servers.
Fix some failing tests. No regression in Tomcat/Jasper, just need to take account of changes in test framework.
Shutdown and release log files, and bad collector report file.
tell the PendingMessageCursor how many messages you want - for more efficent polling from store
Fix robolectric res_directories paths.  Summary: The RobolectricTest rule was using PathSourcePath.toString to construct the paths list that got passed to the runner. The way the string was constructed ended up depending on whether the ProjectFileSystem rootPath was terminated with a slash or not. The tests didn't catch this because they were using a FakeProjectFilesystem with an empty root path. The fix is to have RobolectricTest use the resolver to convert a SourcePath to a Path and then a String.  Test Plan: build buck, run robolectric tests, make sure they pass.
encrypt oidc tokens support
[hotfix][history] Read/Write MultipleJobsDetails instead of manual JSON
[feature] tear down Truffle compiler threads
add some missing @Nullable  Summary: @public Add some missing Nullable annotations following Eradicate warnings  Test Plan: Buck CI  Reviewed By: Coneko, dreiss  fbshipit-source-id: b4318a8
GROOVY-7134: Fix potential NPE and reorder tests for faster execution
Document guideline to design TruffleLanguage with language-agnostic initialization  A TruffleLanguage should provide a language-agnostic interface to be able to be usable in multi-language environments. Language-specific front-ends or launchers, for instance, emulating existing implementations, should be realized externally to the PolyglotEngine.  This change fixes also minor issues in existing comments.  Co-Author: Jaroslav Tulach <jaroslav.tulach@oracle.com> Signed-off-by: Stefan Marr <git@stefan-marr.de>
[streaming] UserTaskInvokable usage added to JobGraphBuilder
Remove direct implementation declaration of SupportsInputBasedRuleKey interface for ModernBuildRules.  Summary: `ModernBuildRule` already implements `SupportsInputBasedRuleKey` interface so no need to directly depend on `SupportsInputBasedRuleKey` from Rules.  Reviewed By: styurin  fbshipit-source-id: ba4b2bf1eb
Some fixes regarding numeric values being indexed as strings
DRILL-976: Fix extract second to return only second portion of interval; exclude hours, minutes
SyncedFlushResponse to implement ToXContentObject (#31155)  The response currently implements ToXContentFragment although the only time it's used it is supposed to print out a complete object rather than a fragment. Note that this is the client version of the response, used only in the high-level client.
clear pixMap page to remove texture artifacts
spring: Remove annotations from interfaces and abstract classes  Signed-off-by: Rohit Yadav <bhaisaab@apache.org>
Moved EigenSeedgenerator plus test into spectral package because it is only used by SpectralKMeansDriver.
HIVE-7314 : Wrong results of UDF when hive.cache.expr.evaluation is set (Navis reviewed by Ashutosh Chauhan)
Remove LLVMAddress null pointer singelton.
Thirdparty tests go in the thirdparty package   r5641
ensure backup metadata is cleaned up for service matches
added unit test based on user forum reported issue
Adjust serialization versions after backport   Relates #29533
Prevent possible NPE (from the testbeans branch, but unrelated).
Expand debug logging for authentication / realms (elastic/x-pack-elasticsearch#641)  Users currently have difficulty diagnosing authentication failures. Some logging messages mislead them, and in other cases there are unexpected behaviours that are not logged at all. These additional DEBUG log messages and change some existing messages in an attempt to alleviate that problem.  Original commit: elastic/x-pack-elasticsearch@c6ea98b038c1d0ca2b2ae4eae93497fcb848ff0b
@Autowired-driven ObjectFactory/Provider resolution works in non-singleton beans as well  Issue: SPR-9181
Fix suite scope random initializaation (#37163)  The initialization of a suite scope cluster had some sideffects on subsequent runs which causes issues when tests must be reproduced. This moves the suite scope initialization to a privte random context.  Closes #36202
Use UTF-8 as the default encoding
Auto-unwrap SessionFactoryBuilder-created proxies  SessionFactory proxies created by (Annotation)SessionFactoryBuilder now implement InfrastructureProxy to ensure they are automatically unwrapped for transaction resource management purposes.  Issue: SPR-8492
Make LocalPartitionGenerator implement PartitionFunction
Closes #4129, added Controllers#getListeners()
More detailed description of the expected behavior when evaluating interactive and non-interactive sources
Removed redundant version checks in transport serialization (#4731 leftover)
SL: repeating node should implement SLStatementNode for a proper toString implementation.
Use protected constructors in abstract classes. #1555  Fixes `NonProtectedConstructorInAbstractClass` inspection violations.  Description: >Reports constructors in abstract classes that are not declared protected, package-protected or private.
move GEP construction into the facade
added BytecodeParser.parsingReplacement field to distinguish parsing method replacements (or snippets) from normal method parsing
bug 10579: disable pool vm sync and disable hostTrack for XenServer,  status 10579: resolved fixed  reviewed-by: alex  Conflicts:      core/src/com/cloud/hypervisor/xen/resource/CitrixResourceBase.java
Changed "Gets the" to "Returns the" - Requested by @trustin
Add missing TextQueryBuilder and FuzzyQueryBuilder properties
Some Args extend AbstractDescriptionArg  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 72531cc
Helper method to enable `dir` cache in an integration test.  Test Plan: buck test --all
Moved tint logic from Skin to tint(Color) on each drawable class.  #2705
Make the version of the remote node accessible on a transport channel (#23019)  This commit adds a new method to the TransportChannel that provides access to the version of the remote node that the response is being sent on and that the request came from. This is helpful for serialization of data attached as headers.
Change return type and add nullable check for DepsAwareExecutor  Summary: We should return more specific ImmutableList and check for nonNull in DepsAwareTask.getStatus  Reviewed By: styurin, ttsugriy  fbshipit-source-id: c22dc24784
added Fingerprint points to assist debugging replay compilation
Revised indexer implementation  Issue: SPR-11890
fixed JSP ErrorsTag to avoid invalid "*.errors" id, using form object name as id prefix instead (SPR-7258)
Fix SKIP behavior on SELECT expand(out()) queries  Resolves: #5854
SimpleIdProvider zap page before releasing page  This is something that the real freelist already does and we rely on this behavior.
Cleanup of grouping in the dump.  Added a "Truffle::" prefix for all truffle dumps, and removed the "callRoot()" group in the Graal dump (for Truffle compilations).
DispatcherServlet and ServletWrapping/ForwardingController accept any HTTP method by default  Issue: SPR-4799
Always upstream full memcache messages.  This changeset is related to #2182, which exposes the failure in the http codec, but the memcache codec works very similar. In addition, better failure handling in the decoder has been added.
Remove unused SourcePathResolver from CxxInferCaptureTransitive  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: bbceadb
Revert "Revert "Make DirectHeaderMap use relative paths""  Summary: This reverts commit a1eabbd300fefa83d7f061b592ee1a7aa020dbda.  Original commit doesn't seem to actually break header map lookups, the ndk just has a bad clang.  Reviewed By: ttsugriy  fbshipit-source-id: e4ff698055
Improve error if Indices Permission is too complex (elastic/x-pack-elasticsearch#4239)  If a user has roles that grant access to a large number of disparate index patterns, then the resulting Automaton can become large and too costly to determinise. This happens rarely, and is usually a sign of a poorly implemented security model, so we have no immediate plans to change the implementation. However the resulting error message is not clear and does not provide sufficient information for users to resolve the underlying problem.  This commit catches the underlying exception and provides a more specific error message, with DEBUG logging of the offending index patterns.  Original commit: elastic/x-pack-elasticsearch@532be70efcde63df8f96d62bce343a21662c2278
Add arrayKlassOffset field to HotSpotVMConfig.
Genrule: Remove unused SourcePathResolver  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 47ca111
Access java options through toolchain in AndroidLibraryDescription  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: 31cf506
Add @Beta annotation to new subSet/subMap methods. ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=109435892
UCDetector clean-up  - Remove unused code  - Use final where appropriate
clean up collections and singleton to prevent serialization issues
Close Index API should force a flush if a sync is needed (#37961)  This commit changes the TransportVerifyShardBeforeCloseAction so that it issues a  forced flush, forcing the translog and the Lucene commit to contain the same max seq  number and global checkpoint in the case the Translog contains operations that were  not written in the IndexWriter (like a Delete that touches a non existing doc). This way  the assertion added in #37426 won't trip.  Related to #33888
Remove bogus DataSource test from JpaTransactionManagerTests
Rename CovarianceAggregation  This is to allow introducing FloatCovarianceAggregation.
[fixed] license headers for jogl backend
[scene2d.ui] Changed widgets to use Actor#hasKeyboardFocus.
renamed qa package o.e.plugin.ingest to o.e.ingest  This way InternalTemplateService constructor can be set back to package private visibility
rename getRemoteCpuTime to getRemoteCpuTimeMs  Summary: Use millis for this.  Reviewed By: rajyengi  fbshipit-source-id: b7c801fd93
#119 Add missing license headers
Use SystemPropertyUtil to access system properties  Motivation:  We should use SystemPropertyUtil to access system properties and so always handle SecurityExceptions.  Modifications:  Use SystemPropertyUtil everywhere.  Result:  Better and consist handling of SecurityException.
Make round() return NaN when input is NaN  This was a regression in a recent change: 54eeef93
Remove Beta annotations.  Summary: We don't really take them into consideration.  Test Plan: CI  Reviewed By: bolinfest  fbshipit-source-id: 2c7d07a
Rename SSAUtils->SSAUtils.
Pass StandardJavaFileManagerFactory into Javac from caller  Summary: Instead of clearing a 'default' factory inside Javac, we now pass the final value into it.  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 280f30b
Replace "fail(...); return x;" with "throw new AssertionFailedError(...);" This eliminates some unreachable code that the compiler couldn't prove was unreachable. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=59341803
Saml validation now forcing service match
Add component documentation.
don't discard original exception (suspiciously/possibly eclipse-generated)
STORM-616 : removing unintended changes.
JAVADOC: Updated source files with comments after merge with master
Bind file rename executor as ListeningExecutorService  - Also use cached thread pool and bounded executor to reduce memory footprint for thread management
Remove References to Instant#now in the DirectRunner  The DirectRunner should use exclusively the configured clock to determine the processing time.
CAS-1474: Removed unneeded prop from handler.
[fixed] UnsafeBuffers everywhere. TRacking in BufferUtils should help boiling down where native memory goes missing. Use unsafe buffers from now on as Android is a silly little bunny that counts direct ByteBuffers against your Java heap.
added transaction state tostring methods for debugging
KAFKA-5996; JsonConverter generates Mismatching schema DataException (#4523)  JsonConverter should use object equality rather than reference equality in `convertToJson`.  Reviewers: Bartlomiej Tartanus <bartektartanus@gmail.com>, Randall Hauch <rhauch@gmail.com>, Jason Gustafson <jason@confluent.io>
Expose JoinFilterFunctionCompiler cache stats via JMX
Revised NoSuchBeanDefinitionException message for proper array class names  Issue: SPR-14595
Transport: Clarifying the role of AbstractBootstrap#bind()  This small changeset clarifies the role of AbstractBootstrap#bind(), especially when not used in a ServerBoostrap context.
[hotfix] Make KeyGroupsStateHandle implement StreamStateHandle
Bug 62829 - Allow specifying Proxy server scheme for HTTP request sampler, Advanced tab and command line option  Fix error if scheme is empty Bugzilla Id: 62829
Add side input assertions to ExecutableStageMatcher
DefaultJavaLibrary: Pass in ZipArchiveDependencySupplier rather than creating it  Summary: I'm working toward changing Java compilation so that we can create the source ABI partway through compilation and allow a module's dependents to start compiling while `javac` finishes creating the full JAR for the module.  With that available, library compilation might be started by either the `CalculateAbiFromSource` rule or the `DefaultJavaLibrary` one, depending on whether source ABIs are enabled. If we left it up to the rule to create the supplier (and, say, forgot to do so), dep file keys would cease to function. Factoring it out prevents us from getting that wrong. (Or, more accurately, is the result of having gotten it wrong and debugged it for longer than I should have.)  Test Plan: CI  Reviewed By: asp2insp  fbshipit-source-id: 7953a3d
javadoc, with override and inheritdoc flags
Use Supplier for StreamInput#readOptionalStreamable  This commit changes the signature of StreamInput#readOptionalStreamable to accept a Supplier to create new streamables rather than requiring callers to construct new instances. This has the advantage of avoiding an allocation in cases when the stream indicates the resulting streamable is null
[chromedriver] Expose chromedriver "execute CDP command" command
Fix handling of missing columns in Parquet Reader
Add removeIfExists() method to DefaultChannelPipeline  Motivation:  Sometimes it is very convenient to remove the handler from pipeline without throwing the exception in case those handler doesn't exist in the pipeline.  Modification:  Added 3 overloaded methods to DefaultChannelPipeline, but not added to ChannelHandler due to back compatibility.  Result:  Fixes #7662
tokenMetadata should be updated before removing obsolete pending ranges, and unset bootstrapped flag when decommission is complete.  patch by Jaakko Laine and jbellis for CASSANDRA-435
Move string to BuildTarget conversion to a more appropriate class to avoid cyclic dependencies.  Summary: String->BuildTarget conversion is the BuildTargetParser's job. This diff also helps avoid cyclic dependencies in future work.  Test Plan: CI  Reviewed By: ruibm  fbshipit-source-id: e1b6d75
Fix InliningLog docs, and change the way BytecodePositionWithId is computed.
Move TimeValue into elasticsearch-core project (#29486)  This commit moves the `TimeValue` class into the elasticsearch-core project. This allows us to use this class in many of our other projects without relying on the entire `server` jar.  Relates to #28504
Bug 52150 - FileServer has 3 confusingly similar methods to set the file base  Step 1, make all methods use same exception for same cause (replace IOException by IllegalStateException) and impact callers.
Fix match_phrase_prefix query with single term on _all field (#20471)  * Fix match_phrase_prefix query with single term on _all field  This change fixes the match_phrase_prefix query when a single term is queried on the _all field. It builds a prefix query instead of an AllTermQuery which would not match any prefix.  Fixes #20470  * Add missing change
improvement for CAMEL-3 so that boolean b = in.getHeader("foo", boolean.class); does not throw a NPE for a missing header; instead false is returned for missing values
Sorting out imports.
Removed need for state after on load indexed, and new bytecodes.
Minor tweaks to tests to reduce memory usage WW-1715
Make MultiTermQueryBuilder an interface again  This PR is against the query-refactoring branch.  Closes #12074
Move tests into *.test packages.
Fix a few typos  Minor changes to fix typos. Small adjustment to add a couple commas.
Add getSingleValue to ValueBlock
Remove unused StepContext name methods
NaaS: Remove IsServiceProvider() functions  If the element is the service provider for this network, then can be tell from network offering. We don't need these functions in the interface.
Update license header for recently modified files  Issue: SPR-7763, SPR-10140, SPR-10132, SPR-10093, SPR-10103
CLOUDSTACK-1332: Pass IPv6 DNS to VR
start SelectorManager after all the selector registration is done, to workaround a bug in some linux environments.  (Debian etch under vmware player or under EC2 seem to exhibit this problem consistently.)  the bug symptom is, the selector register hangs indefinitely even though the select() call is only for 100ms (after which it should stop blocking and let the register through). patch by jbellis; reviewed by Eric Evans for #97
updated test cases
Cleanup: removal of unused imports
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
Add user to DISCONNECT in StompSubProtocolHandler  Issue: SPR-12215
TraceRA: rename LinearScanOptimizeSpillPositionPhase -> TraceLinearScanOptimizeSpillPositionPhase.
Add getAccessStamp() to AbstractWriteNode.
Use AbstractReferenceCounted to clean up the codes for codec-memcache  Motivation:  Some duplicated methods in message types of codec-memcache can be cleaned using AbstractReferenceCounted.  Modifications:  Use AbstractReferenceCounted to avoid duplicated methods.  Result:  Duplicated methods are cleaned.
Temporary workaround for JDK 8 test compilation/execution problem  Issue: SPR-9639
Issue #1555: Fix various typos  Fixes some `SpellCheckingInspection` inspection violations.  Description: >Spellchecker inspection helps locate typos and misspelling in your code, comments and literals.
Move BuildRuleWithBinary to apple package  Summary: Moving `BuildRuleWithBinary` to `com.facebook.buck.apple` package where it's only used.  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: 44f9c99
Added license headers
Renamed ReactiveHttpOutputMessage dataBufferFactory() method to bufferFactory()
Validate types for IN subquery expression
test: install a new signed license when running index BWC tests  This change now installs a signed license that has been generated at runtime so the BWC tests can run without hitting licensing issues. The x-pack BWC tests pull in the full cluster state, which contains the trial license from when the indices and state was generated. After the trial license period and grace period issues arise with the tests.  Closes elastic/elasticsearch#3858  Original commit: elastic/x-pack-elasticsearch@1c79e874e5033aedac14e7913fa9d194b62f56c9
We should prefer heap buffers when using the OIO transport to reduce memory copies.  Motivation:  When using the OIO transport we need to act on byte[] when writing and reading from / to the underyling Socket. So we should ensure we use heap buffers by default to reduce memory copies.  Modifications:  Ensure we prefer heap buffers by default for the OIO transport.  Result:  Possible less memory copies.
disabled control-flow-based inlining
adding missing finals
HHH-6335 : Change PojoEntitySpecifics to use JavaType for entity and proxy classes
versions: add default `isVersionRoot` implementation  Summary: This reduces some duplication by adding a default implementation of `VersionRoot.isVersionRoot()`.  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: 56d04f9
GROOVY-8604: Cache the parameterized type for better performance(closes #721)
Make unused Loads simplify in more cases  If they require a check, just replace them with this check.
Consistent use of LinkedHashSet for interfaces (since interface order may matter in subtle cases)
Get rid of functions returning trivial method references  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: c0cd0f1
Allow for reuse of key visitor classes in tooling  Based on https://github.com/SpringSource/spring-framework/pull/263
Remove circular dependency between IndicesService and IndicesStore
Revert of "Now commit now uses a read lock instead of write lock on memory storage"
Added lastTransactionCommitTimestampWhenStarted to interface
Exists API can send response body, closes #2072.
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=48424 Based on a patch by Ivan Ensure that the ObjectNames for the Connectors are always generated using the same method
Introduce mayNullCheckSkipConversion method in ConvertNode interface. Move address lowering after fixed read phase.
clean up xenserver resource code
GROOVY-4818: JsonSlurper's methods are package private
Update "configuration changed" message  Summary: The current message indicates that buckd is restarting when it really isn't. Instead, let people know that the caches are being dropped and that builds will be slower.  Reviewed By: cjhopman  fbshipit-source-id: b97d243b5d
Cache objects for out of process build  Summary: Instead of creating and destroying these objects, we may cache them. Also, tune the number of outer processes to be CORES/4: these processes are multithreaded themselves and according to my benchmarks, the fastest mode for 8 core machine is when we have 2 outer processes for javac. The results are:     buck build buck -c java.location=IN_PROCESS    takes 1m 5s     buck build buck -c java.location=OUT_OF_PROCESS    takes 1m 22s  Test Plan: CI  Reviewed By: marcinkosiba  fbshipit-source-id: 121312e
Deprecate cancellation and task control things in org.neo4j.helpers.
MAHOUT-1258: Another shot at findbugs and checkstyle - removed unused imports
Resolve ${} placeholders in @ImportResource  Update ConfigurationClassParser to resolve any ${} placeholders from @ImportResource values.  Issue: SPR-10686
TIKA-314: Initial support for JPEG EXIF metadata extraction  Add license headers, generics
Wrote more information about how you should NOT mirror relationships in opposite directions because it somehow would increase performance.
add diagram for new takeUntil variant and a few other related javadoc tweaks and remove a troublesome unicode ligature from SpscArrayQueue.java that's causing a compiler warning
* Added ChunkedInput.isEndOfInput() and changed the contract of ChunkedInput.nextChunk() and hasNextChunk() to support slow streams
java_test: don't cache classpath argsfile using library rule key  Summary: There were a few issues caching this: 1) Since `JavaTest` is a child of `DefaultJavaLibrary`, it was using    the latter's rule-key and input-based-rule-key.  This is a problem    since the rule keys for `DefaultJavaLibrary` are explicitly non-    transitive, whereas the classpath argsfile includes the all the transitive    libs.  This means we could get a cache hit via the input-based-rule-key    and pull down an argsfile that doesn't take into account updates to    the transitive classpath. 2) The paths the JARs under the android SDK are absolute, so we don't    want to cache these.  Also, with cross-cell support incoming, that'll    likely be another source of absolute paths.  Since generating the classpath file is relatively cheap, this diff changes `JavaTest` to use post-build-steps instead, which run even on cache hits, meaning we don't have to cache the classpath argsfile.  Test Plan: Ran a `java_test`, changed a transitive dependency and verified it was reflected in the classpath argsfile, even when we get a cache hit.
Finally working item-based Hadoop recommender
[FLINK-2158] Add support for null to the DateSerializer  This closes #780
Add the ability to query metrics on PipelineResult  All runners currently implement this by throwing an UnsupportedOperationException.
Fix unit test placing output files like "null.java" in the project directory
Removed unused imports
CAS-1475: Deprecated and added logs.
Polishing test annotation declarations and JavaDoc.
Update legacy test stuff too.
Add more variants of ByteBufAllocator.ioBuffer() / Update Javadoc
STORM-1341 Let topology have own heartbeat timeout for multilang subprocess  * config name: topology.subprocess.timeout.secs * if it's not specified, supervisor.worker.timeout.secs will be used
Add ClientRequest.attribute(String)  This commit adds the attribute(String) convenience method to the ClientRequest class. It also adapts the Basic Authentication filter to use it.
Put nonoss under Spring framework
Switch to using a varargs syntax in CommandRunner.  Summary: We use the array syntax for the final argument for CommandRunner.runCommand. If we use the varargs syntax, calling the method becomes cleaner.  Test Plan: buck test --all
2.x: Single.subscribe(BiConsumer) consistent isDisposed (#5277)
HOTFIX: ChangeLoggingKeyValueStore.name() returns null  This class doesn't need to override this method as it is handled appropriately by the super class  Author: Damian Guy <damian.guy@gmail.com>  Reviewers: Guozhang Wang <wangguoz@gmail.com>  Closes #2397 from dguy/hotfix-npe-state-store
Add license headers.  r1471
Remove redundant overrides
Make phi_convict_threshold a float. Patch by Harish Doddi, reviewed by brandonwilliams for CASSANDRA3910
Merging capabilities to options should be fluent
fix broadcastAddress and fix for Ec2MultiRegionSnitch.reconnect patch by Vijay; reviewed by Brandon Williams for CASSANDRA-3835
Update to the tests for better stability on some platforms.
[BEAM-5945] add reverse
Removed a strange comment and renamed the MapUtil methods to better names
add nodeprobe cancelpending
Migrate SelectorKey to use BuildTarget  Summary: This is a part in a series of changes to migrate configuration targets to use `BuildTarget`.  Reviewed By: bobyangyf  shipit-source-id: aa55d25b25
Remove cxx platforms from CxxGenruleDescription constructor  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: 80b9fff
Added more debug info to thrift http request workflow  Summary: Two of the possible failures are: - during connecting - while downloading the artifact  We add more logs in case there's a failure in one of those situations.  Test Plan: CI  fbshipit-source-id: 7956702
WW-4674 Uses the same logic as in Dispatcher to control handling exception
Aggregations: Sibling Pipeline Aggregations can now be nested in SingleBucketAggregations  Closes #11379
Replace magic -3 with proper consonstant var
Get color diagnostic option directly from passed in tool  Summary: Instead of passing it down via preprocessor/compiler delegate, into ToolCommand, into Step, just get the args from the tool, which is already passed into the step.  Test Plan: CI  Reviewed By: beefon  fbshipit-source-id: 18d6399
Add attributes to WebFlux WebSocketSession  Issue: SPR-16212
AlexeiBarantsev: Ignoring tests for the browsers that don't support yet 'true or null' paradigm for boolean attributes  r16981
Fixed a race condition problem. Also lowered amount of data being streamed in one test to allow to be executed on a lower-end machine
Log unresolved exceptions at error level
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
fix the typo in the Traffic example java docs.  ----Release Notes----  [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=90761527
[BEAM-316] Add file scheme support in TextIO
CAMEL-4758: Improved javadoc. Thanks to Glen Mazza for patch.
Add BuckCellManager.getCells()  Summary: Provide API to list buck's known cells.  Reviewed By: IanChilds  fbshipit-source-id: 079f1fb74f
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
add javadoc fixes for oidc tests
don't discard original exception (suspiciously/possibly eclipse-generated)
clean up attribute release policy for R&S
Implement vector abs.
Revert "mute failing filerealm hash caching tests (#42304)"  This reverts commit 8907dc9598667a1fa29be0ba22c7030ebee1101b.
Cli tools: make sure that the status code is returned from scripts  The status code wasn't returned from java mains (always 0), also it got lost anyway within our scripts that are calling the java mains.  Relates to elastic/elasticsearch#142  Original commit: elastic/x-pack-elasticsearch@db6248660557b0b8d6525ee039c1302d27e54e25
fixed dirty database left in thread local in case of error on constructor.
Disable artifact cache during project generation.  Test Plan: CI
Comand line flag for enabling forced splits.  By default, we use only the heuristic splits.
Change JavaBinary blacklist to use Pattern.  Summary: Alter JavaBinary to use Pattern instead of String for its blacklist. Pattern was missing from the RuleKeyBuilder so I added it there. It's just the toString representation of the Pattern.  Since the Set is ImmutableSet it will preserve the ordering each time.  Test Plan: * CI  Reviewed By: marcinkosiba  fbshipit-source-id: 36438fe
rename object() to getValue() in LoadHubNode
Polish Hibernate support and tests   - Fix Javadoc in HibernateTemplate so that it compiles in Eclipse.  - Suppress generics warnings in HibernateTemplateTests.  - Remove unnecessary deprecation warning suppression in constructor for    LocalSessionFactoryBuilder.
Making sure that all C++ libs that generate AppleExtensions and the results dylib are statically linked (instead of *.dylibs).  Summary: Making sure that all C++ libs that generate AppleExtensions and the results dylib are statically linked (instead of *.dylibs).  Test Plan: buck test
Code clean up to use braces and java 7 features
Make Javac a Tool  Summary: Because it is a tool, you see.  Test Plan: buck test --all
Add an escaper for makefile strings  Summary: This adds an escaper for values placed on the right-hand side of assignments in GNU-style makefiles, and is useful for makefile generation for use with the Android NDK.  GNU makefiles use an interesting escaping strategy, where the escape sequence (i.e. backslash) must itself be escaped *only* if it precedes a character that needs to be escaped (e.g. so a backslash in the original string won't necessarily be escaped).  Test Plan: added some tests; generated some Android.mk files
Issue #4165: Split and Organize Checkstyle inputs by Test for ExplicitInitializationCheckTest
Removed unused imports and an unused local variable reported by Eclipse
CAMEL-4258 CAMEL-4259 enable the tests after upgrade to CXF 2.4.2
Rename query.initial-hash-partitions property  Rename the query.initial-hash-partitions to query.hash-partition-count to match the session property name
MAHOUT-1258: Another shot at findbugs and checkstyle - removed unused imports
Strip isPrime benchmarks from Guava, since isPrime itself is @GoogleInternal. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=69012929
Remove unused imports idnetified by Eclipse
Rename WebTestClientConnectorTests to match class name
Prepend -Xlinker to linker flags in project generation.  Summary: Buck prepends -Xlinker to linker_flags during building. This makes project generation have the same behaviour.  Test Plan: CI
Fixed comments and allow the use of <connectionFactory> and <xaConnectionFactory> in xbean files.
Make the deprecation messaging on legacy index APIs more consistent.
Thread entire QueryEnvironment through QueryExpression.parse  Summary: In order to introduce parse-time resolution of target literals, we will have to pass the environment down to access the context (including the cell)  Test Plan: Functionality unchanged; existing tests pass  Reviewed By: illicitonion  fbshipit-source-id: 8828bce
Fixed several JavaDoc warnings (mostly due to the removal of the AbstractModifierGui). Removed two unused methods from MenuFactory (unused due to the removal of the AbstractModifierGui).
Make Rule tests use Memo and Lookup
Add detectHandlerMethodsInAncestorContexts property to AbstractHandlerMethodMapping.
Add support for setting ip address for web server
Remove $Id keyword from files in catalina/startup/**
Remove unused SourcePathResolver from UnzipAar  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 4d9f1ff
Add getRawSlice to BlockCursor interface
Make NoSuchBufferException message more useful
#! Make up session across searches and clicks
unregister mbean on flush.  patch by daishi; reviewed by jbellis for CASSANDRA-157
Add ImmutableBiMap.Builder.put(Entry) overload, which had previously not been overridden from ImmutableMap.Builder.  Now, it correctly returns ImmutableBiMap.Builder. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=75833810
Moved HtmlStripCharFilterFactory to analyis.common package like the other factories.
Mapping updates on objects should propagate `include_an_all`. #20051  Today you can't update `include_an_all` on an existing object. The bug affects 2.x too.
Drop deprecationLogger from AbstractComponent (#34859)  Drops the `deprecationLogger` from `AbstractComponent`, moving it to places where we need it. This saves us from building a bunch of `DeprecationLogger`s that we don't need.  Relates to #34488
Watcher: Allow more tags for HTML sanitizer in tables (elastic/elasticsearch#2350)  This allows the colspan/rowspan attr on td/tr as well as border/cellpadding attrs on table elements.  Original commit: elastic/x-pack-elasticsearch@e0b989f0ac23ce17c99d7616d4b3bd2e585116a9
Refactor duo config for authN
Remove deprecated code
Make the list of encoders available where they are needed
Expose Obj-C Generated Header  Summary: This diff introduces a new build rule to create the Swift Generated Obj-C Header.  Test Plan: Tested in future integration test  Reviewed By: dinhviethoa  fbshipit-source-id: b044614
Don't check accessible in the #capacity method (#7830)  Motivation: The `#ensureAccessible` method in `UnpooledHeapByteBuf#capacity` used to prevent NPE if buffer is released and `array` is `null`. In all other implementations of `ByteBuf` the accessible is not checked by `capacity` method. We can assign an empty array to `array` in the `deallocate` and don't worry about NPE in the `#capacity`. This will help reduce the number of repeated calls of the `#ensureAccessible` in many operations with `UnpooledHeapByteBuf`.  Modifications: 1. Remove `#ensureAccessible` call from `UnpooledHeapByteBuf#capacity`. Use the `EmptyArrays#EMPTY_BYTES` instead of `null` in `#deallocate`.  2. Fix access checks in `AbstractUnsafeSwappedByteBuf` and `AbstractByteBuf#slice` that relied on `#ensureAccessible` in `UnpooledHeapByteBuf#capacity`. This was found by unit tests.  Result: Less double calls of `#ensureAccessible` for `UnpooledHeapByteBuf`.
Ticket metadata abstracted into methods
Use shard as a name of lucene index part  Update storage layout name to reuse agreed terminology.
Make parameters of Parser.getTargetNodeRawAttributes explicit  Summary: This will refactored later and explicit parameters make future refactoring easier.  Reviewed By: bobyangyf  fbshipit-source-id: b965f22409
Adding licence header to files to make the build pass
Fix ResourceUrlProvider path check in getForRequestUrl  Prior to this change, getForRequestUrl implementation would only work for applications with a non-empty servlet path. So web applications mapped to "/" would trigger a IllegalStateException while checking the current request against the request path within the current mapping.  This change relaxes this and only check that the path within mapping is within the request URL.  Issue: SPR-12158
Consistent use of LinkedHashSet for interfaces (since interface order may matter in subtle cases)
Remove "presto" from uris
fixed @MVC processing of parameter-level annotations to work with interface-based proxies again (SPR-7483)
Bug 57193: Remove self-closing elements like <p/> or <br/>. Bugzilla Id: 57193
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
Add getElementCoders to UnionCoder  This is an explicit method on UnionCoder that is completely unrelated to the serialization and deserialization of the Coder.
Make Javac a Tool  Summary: Because it is a tool, you see.  Test Plan: buck test --all
Notify the listener immediately when added to SharedDiscoveryCoreClient
Renamed a method and added javadoc.
Remove unused method.  Test Plan: CI  Reviewed By: ruibm  fbshipit-source-id: d73c730
Expose struct function in extension files  Summary: This is needed to support common ways to abstract Python-like modules. This is also how skylib is exposing all of its fuctionality.  Test Plan: CI  Reviewed By: styurin  fbshipit-source-id: c457b24
Coder.structuralValue(T) should never throw  In the worst case, encoding to a byte array should never fail due to IO.
Plugins: Add ScriptService to dependencies available for plugin components
move default value wrapper into support package (rather then interceptor)
Rename authentication test classes to reflect the actual test case. The JUnit classes test the opposite of what their original names suggest.  Signed-off-by: Gregor Zurowski <gregor@zurowski.org>
change default behavior
HIVE-5883: Plan is deserialized more often than necessary on Tez (in container reuse case) (Gunther Hagleitner)
Rename flushAndWrite() to writeAndFlush()  - Related: #2066
Flink runner: specify checkpointTimeout  through PipelineOptions.
Add an option to set the stack size
Replace ExpressionAnalysis.getColumnReferences with isColumnReference
[added] proper license headers
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
Update javadoc with @since
test classes cleanup (fixed warnings and typos)
Fix a few typos  Minor changes to fix typos. Small adjustment to add a couple commas.
Move lexer predicates test to TestSemPredEvalLexer
[fixed] added Application.log(tag, message, exception). Not so fancy on desktop but who cares :D
Use standard ASF license header
Return unmodifiable collections from methods. #1555  Fixes `ReturnOfCollectionField` inspection violations.  Description: >Reports any attempt to return an array or Collection field from a method. Since the array or Collection may have its contents modified by the calling method, this construct may result in an object having its state modified unexpectedly. While occasionally useful for performance reasons, this construct is inherently bug-prone.
fix heisenbug in RecoveryManager2Test where a compaction could add back a new sstable to the "cleared" ColumnFamilyStore patch by jbellis; reviewed by junrao for CASSANDRA-463
Reduced duplicated code regarding reading of multi-value properties from neo4j config
TIKA-416: Out-of-process text extraction  More javadocs and some cleanup.
https://issues.apache.org/jira/browse/AMQ-4108 - fix unit test regression, QueueMasterSlaveTest,  related to https://issues.apache.org/jira/browse/AMQ-4005 and the dual impl of broker service aware. the auto created locker was not getting its broker service init. flakyness in test related to exponential backoff tool long for reconnect
CLOUDSTACK-1862 Added vm ip address info in the list PF rules response  Signed-off-by: Abhinandan Prateek <aprateek@apache.org>
Prevent cases when exception during locks client close causing transaction to be never released into the pool, and stuck with closing status forever.
Remove some unneeded unboxing, unneeded methods, made some stuff private that can be
MAHOUT-1258: Another shot at findbugs and checkstyle - removed unused imports
CAMEL-13150: Add command "exchangeProperty" for dateExpression in ExpressionBuilder (#2741)
Use standard ASF license header
encrypt oidc tokens support
More JDK8 api change fixes.
Added forceGetRaw to the RecordStore interface.
Cleanup: Ensure no logic is executed in the constructor  The SignatureService tried to access the system key file in the constructor, which could lead to endless loops. This PR moves the service into a AbstractLifecycleComponent to keep the constructor dumb.  Relates elastic/elasticsearch#517  Original commit: elastic/x-pack-elasticsearch@b1e5bfe98c519caaeab87163940482562ebd2e4b
Add missing @since tag
tweak since versions
Enable IndexActionTests and WatcherIndexingListenerTests (#38738)  fix tests to use clock in milliseconds precision in watcher code make sure the date comparison in string format is using same formatters some of the code was modified in #38514 possibly because of merge conflicts  closes #38581
Migrate Executor-less Futures callback methods to the ones with an Executor, while applying MoreExecutors.directExecutor() for identical behavior.  For more information, see [] []  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=155174706
GROOVY-3046: Groovy should provide an @Immutable annotation to make creating immutable objects easy (javadoc)
Clean up javadoc
WW-1453  Simple cleanup items   - remove duplicate and/or unused imports   - change static access to class, not instance
moved the CamelClient into the core Camel API package
Refactoring. Remove PACKAGE_NAME constant.
Change array and map agg tests to create correct block types
print out short description of tool in help  Summary: Modify help output to include short description of the invoked command  Test Plan: `buck`, `buck --help`, `buck help --help`, `buck audit`, `buck help audit`  Reviewed By: sbalabanov  fbshipit-source-id: 9f72db4
Order by assigned id when everything else matches
Minor cleanup  Removes unused field in Protocol Server no longer extends Protocol, instead static imports needed methods from there DechunkingChannelBuffer.readAndThrowFailureResponse() no longer returns Throwable and the corresponding  usage is now gone
Fixed tests with durations on throttling and others
Java api: restore support for minimumShouldMatch and disableCoord in TermsQueryBuilder   TermsQueryParser still parses those values although deprecated. These need to be present in the java api as well to get ready for the query refactoring, where the builders are the intermediate query format that we parse our json queries into. Whatever the parser supports need to be supported by the builder as well.  Closes #12870
Anchor InstanceOf to branches  This allows the anchor to be optimized
Remove unused SourcePathResolver from AndroidManifest  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 09e36d4
made sure to use the class name as database name in distributed tests
Add max_tasks_per_stage session property  And coresponding stage.max-tasks-per-stage configuration property
Lazily resolve the default exception CacheResolver  This is a rework of 314b069 that may still lead to issue if a Cacheable annotated bean is inspected on startup. Instead of resolving the default exception CacheResolver if a cache operation is parsed, we resolve it as late as possible (i.e. when an exception is thrown and the relevant exception cache needs to be resolved)  Issue: SPR-12850
apply patch for: https://issues.apache.org/jira/browse/AMQ-4121  Allows for more user customization of MemoryUsage if desired.
Minor cleanup.
Added @UriParams for camel-twitter
Fix default config file location in code to match usage elsewhere
CAMEL-11379: Optimise - core type converters to be invoked faster
dont throw exceptions. return flags instead
Added Actor#firstAscendant.
[FLINK-5532] [streaming api] Make marker window assigners for aligned window ops non-extendable  Makes the TumblingAlignedProcessingTimeWindows and the SlidingAlignedProcessingTimeWindows final so that users cannot extend them.  This closes #3180
Fix build  Original commit: elastic/x-pack-elasticsearch@474e5e7a9a5adfc561f6719f4bca349ff7329b15
Truffle: simpler, more consistent toString for DirectCallNode subclasses.
Allow VM-specific lowering of FixedGuardNode
javadoc corrections patch by dbrosius; reviewed by jbellis for CASSANDRA-3063
Use datasource resolver for procedure graph database service.
Copy all transitive frameworks of the particular bundle types into the bundles  Summary: After removing the phase of copying subframeworks into framework bundles, apps became broken if they are launched outside of Xcode session/derived data. This is because app bundle basically didn't contain these frameworks anymore. This diff fixes this issue by adding all transitive frameworks into copy phase for generated Xcode project.  Test Plan: CI, added unit test. Generate project for Mac app with frameworks Build it using Xcode Move the app bundle to Desktop and double-click it there, app should launch normally.  Tested building Color Picker extension. It still had Frameworks included, and launched correctly.  Reviewed By: ryu2, darknoon  fb-gh-sync-id: 3f618b2
Synchronized between 4.1 and master (part 3)  Motivation:  4 and 5 were diverged long time ago and we recently reverted some of the early commits in master.  We must make sure 4.1 and master are not very different now.  Modification:  Fix found differences  Result:  4.1 and master got closer.
Truffle: further fixes to the new CallNode.
MarshallingView unwraps JAXBElement value for Marshaller.supports(Class) check  Issue: SPR-11827
minor javadoc improvements
Avoid missed signals on a default promise  Motivation:  Today when awaiting uninterruptibly on a default promise, a race condition can lead to a missed signal. Quite simply, the check for whether the condition holds is not made inside a lock before waiting. This means that the waiting thread can enter the wait after the promise has completed and will thus not be notified, thus missing the signal. This leads to the waiting thread to enter a timed wait that will only trip with the timeout elapses leading to unnecessarily long waits (imagine a connection timeout, and the waiting thread missed the signal that the connection is ready).  Modification:  This commit fixes this missed signal by checking the condition inside a lock. We also add a test that reliably fails without the non-racy condition check.  Result:  Timed uninterruptible waits on default promise will not race against the condition and possibly wait longer than necessary.
better method name, to correspond to addLast
Removed unused imports in camel-core
Finished all merges and unit testing
Use Supplier for StreamInput#readOptionalStreamable  This commit changes the signature of StreamInput#readOptionalStreamable to accept a Supplier to create new streamables rather than requiring callers to construct new instances. This has the advantage of avoiding an allocation in cases when the stream indicates the resulting streamable is null
Removed unused imports
SimonStewart: Move chrome tests to junit4  r16029
fix #360, add check for empty buffer; also add unit test for this scenario
an API-only option (doesn't make sense on the command line) that tells the ProxyHandler to assume it is being chained even if http.proxyHost is not set. This is useful for java 5 systems that use the new ProxySelector API instead of relying on old crappy system properties  r3524
Use URI vs URL accessing File from classpath.  URL escapes special characters such as spaces which causes the resource to not be found when used to create a File object.  Use URI.  Closes #5915
Remove unflavoredNodes parameter in TargetGraph constructor.  Summary: TargetGraph is always created with a map mapping all unflavoured targets to a node with either that target, or a flavoured target based on it.  Test Plan: CI
Introduce mayNullCheckSkipConversion method in ConvertNode interface. Move address lowering after fixed read phase.
add internal origin to delete by query
Move EmbeddedGraphDatabase to internal pkgs
Added JavaDoc for ChannelFuture and its related types
HIVE-13628: Support for permanent functions - error handling if no restart (Vikram Dixit K, reviewed by Gunther Hagleitner)
Adjust to Streams.copy moving into elasticsearch-core (elastic/x-pack-elasticsearch#4263)  In https://github.com/elastic/elasticsearch/pull/29322 Streams.copy was moved into the elasticsearch-core project, this is the x-pack side of it.  Original commit: elastic/x-pack-elasticsearch@5803b8a04204e200b91e59018818509231bfa670
Update of committed tx id now only done in Transaction.doCommit().
Make DocWriteResponse a ToXContentObject  This involved changing also index, delete, update so that bulk can print them out in its own format.
Fixes due to changes in master branch.
Handle unresolved view name
Some toString methods for easier widget inspection.
Make sure all public classes/interfaces in common.graph have @Beta and @since.  Also, a little bit of narcissism :) add myself to authors to the main interfaces (Graph/Network/MutableGraph/MutableNetwork). I normally wouldn't list myself first but the convention seems to be alphabetical order. ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=125691964
Removed unused imports
Rename OperatorFromIterable to OnSubscribeFromIterable
replaced Service marker interface with non-standard META-INF directory names to differentiate JVMCI providers from standard service providers META-INF/services/ files for Options provider are now generated directly from files in META-INF/jvmci.options/
Use 500MB message size limit  Summary: Currently, we don't really implement streaming on the server side and so we pass even very large files in a single message. Just increase the limit for now.  Reviewed By: ttsugriy  fbshipit-source-id: 668b887
Add a static constructor to GrpcStateService
Updates to Javadoc
Updated Truffle-SL to new codegen API.
Remove $Id keyword from files in catalina/startup/**
ContextTestSupport supports many RouteBuilders to be tested Tests without test methods made abstract so eclipse doesn't complain when executing them
SPR-7354 - Added equivalent of JAX-RS @Consumes to Spring MVC
Add Functions.forSupplier(Supplier).  Revision created by MOE tool push_codebase. MOE_MIGRATION=1834
Fix reset of result sets on LET statements and projections
Get rid of a deprecated method in ProjectFilesystem.  Summary: And use `Path`.
Add default logging columns from remote config.  Test Plan: CI  Reviewed By: alisdair04  fbshipit-source-id: 36cf33e
Fixed regression with fallback for non-resolvable property type
Adding close connection support to HttpClient to combat hanging open files  Added a .close() method to org.openqa.selenium.remote.http.HttpClient interface.  Added a call to the client's .close() method from the HttpCommandExecutor class when a org.openqa.selenium.remote.DriverCommand.QUIT is sent.  Implemented the .close() method in org.openqa.selenium.remote.internal.ApacheHttpClient which taps the connectionManager and closes idle connections.  Fixes #1080  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Use URLDecoder for query params in WebFlux  Issue: SPR-15860
fixed cs issues by removing unused certs
Clean up tests
Removing the log "Creating action graph"  Summary: - It's going to show later anyway when it actually needs to do it. - It was showing when not appropriate (for example in buck clean). - There's a two second-delay before showing the buck parsing phase.  Reviewed By: ttsugriy  fbshipit-source-id: 8218fac
Remove a dependency on Java 6 that accidentally got introduced
Add Javadoc for main interfaces/classes
CAMEL-12352 - make system property uppercase if given lowercase in simple expression
removed redundant arrays
graph size verification: cleanups
Describe a necessity to copy frame arguments in nodes tagged with RootTag.
revised "ClassUtils.isAssignable" semantics to cover primitives vs wrappers in both directions (SPR-7610)
Review comments.
Implementing clear for content editable blocks in HtmlUnit driver
Unused imports.
Do not trim checkpoints position after last transaction during recovery  Previously transaction log truncation was using position after last transaction commit entry. In a cases when there were checkpoint entries it meant that they were removed after recovery completion. Now we will use position till which cursor was able to read transaction log file - and that includes all the checkpoint entries.
Fix match_phrase_prefix query with single term on _all field (#20471)  * Fix match_phrase_prefix query with single term on _all field  This change fixes the match_phrase_prefix query when a single term is queried on the _all field. It builds a prefix query instead of an AllTermQuery which would not match any prefix.  Fixes #20470  * Add missing change
Make maximum page size for queues configurable
AbstractTraceInterceptor provides logExceptionStackTrace flag and writeToLog delegates  Issue: SPR-15763 (cherry picked from commit aa0d7a6)
Remove legacy hive.bucket-writing config property
Add WorkProcessor#transformProcessor method  This methods allows to write more streamlined transformations of the processor itself, e.g:  processor.transformProcessor(WorkProcessorUtils::flatten)
PrebuiltCxxLibrarys can export frameworks  Summary: if a static library depends on some frameworks, there was no way to export that up the tree. Now the frameworks keyword is added so that dependencies also require them  Reviewed By: Coneko  fbshipit-source-id: 9d53590
Remove unused SourcePathResolver from NdkLibrary  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 6236b7d
CLOUDSTACK-6476: Basic Zone with Multiple Pods Setup: DHCP server doesnt get deployed in the pod where the VM gets deployed  Changes: PodId in which the router should get started was not being saved to the DB due to the VO's setter method not following the setXXX format. So when planner loaded the router from DB, it always got podId as null and that would allow planner to deploy the router in any pod. If the router happens to start in a different pod than the user VM, the Vm fails to start since the Dhcp service check fails.  Fixed the VO's setPodId method, that was causing the DB save operation fail.
Revert my previously not so clever implementation. If there is an executor being used, then one shall expect that the executor is reporting the numbers of threads itself, and it should no longer be the responsibility of the connector
Have ProjectFileSystemView support reading attributes  Reviewed By: bobyangyf  fbshipit-source-id: 7391713b25
Remove Cell.getAbsolutePathToBuildFileUnsafe(BuildTarget)  Summary: This is a part in a series of changes to remove ParserConfig-related information from Cell.  Reviewed By: bobyangyf  fbshipit-source-id: 3719ffc3fb
Replace withoutCell() with getCellRelativePath()  Summary: withoutCell() is a super-powerful function that makes it really hard to restrict the state of build targets. We only need it to construct paths that don't include the cell name...  Update some comments to make it clear what things include cell names vs not.  Reviewed By: bobyangyf  shipit-source-id: d3ef9a8a8b
Added some links into the example code
Resync fails to notify on unavaiable exceptions (#33615)  We fail to notify the resync listener if the resync replication hits a shard unavailable exception. Moreover, we no longer need to swallow these unavailable exceptions.  Relates #28571 Closes #33613
Deprecate Direct Access to Scheduler Implementations  This enforces the convention of using `Schedulers.*` and then makes the RxJavaDefaultSchedulers plugin more reliable.
moved WordTypes from c.o.g.word.phases to c.o.g.word
Move MockDirectories into o.e.test.store
Add MaterializedResult.toPage()
Rename PagesHashStrategy compare to compareSortChannelPositions
Add QueryStateMachine.getFailureInfo to avoid creation of QueryInfo
Add closeQuietly(InputStream) and closeQuietly(Reader). ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=61085980
Use LinkedHashmap to preserve insert order  In several places in the spring-webmvc module, URL patterns / objects relationships are kept in `HashMap`s. When matching with actual URLs, the algorithm uses a pattern comparator to sort the matching patterns and select the most specific. But the underlying collection implementation does not keep the original order which can lead to inconsistencies.  This commit changes the underlying collection implementation to `LinkedHashmap`s, in order to keep the insert order if the comparator does not reorder entries.  Issue: SPR-13798
Rename KeyGenerator#extract => #generate
Fixed minor problems with unit tests
Don't let VMsync touch the VM if VM has been scheduled for HA but HA is not yet running.
Use ExecutorService execute instead of submit so that Errors in EventBus subscribers propagate out  Summary: `ExecutorService.submit` will swallow any exceptions if the FutureTask it returns is not used, or the ExecutorService doesn't override `afterExecute`. From the [docs](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/ThreadPoolExecutor.html#afterExecute-java.lang.Runnable-java.lang.Throwable-): `Note: When actions are enclosed in tasks (such as FutureTask) either explicitly or via methods such as submit, these task objects catch and maintain computational exceptions, and so they do not cause abrupt termination.`  Reviewed By: jkeljo  fbshipit-source-id: fe52b51f50
Determine key from configured alias for undertow    Closes gh-8245
- Add an extra async IO flag I used for testing. - Blocking should block.
Avoid null-pointer exceptions for cases where LLVMAsForeignNode returns null.
[CAMEL-13114] Provide single Cookie header for multiple cookies
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
Fix bing_tile_coordinates function to produce row block  Previously, bing_tile_coordinates was producing a IntArrayBlock of length 2 to represent ROW(INTEGER, INTEGER). This no longer works since RowBlockBuilder.appendStructure method now requires a row block as of 630ec959c4e29d09c3b46cba2085e320d815f1ac.
Make sorting unconditional in followup to CASSANDRA-10162
Fulltext addon, small cleanups
Rename internal repository actions to be internal (#36244)  This is a follow-up to #36086. It renames the internal repository actions to be prefixed by "internal". This allows the system user to execute the actions.  Additionally, this PR stops casting Client to NodeClient. The client we have is a NodeClient so executing the actions will be local.
Optimize resolveType by reducing the invocations of String.format
DefaultHttp2FrameWriter ping payload size check  Motivation: The HTTP/2 spec states that the ping frame length must be 8 and is otherwise an error https://tools.ietf.org/html/rfc7540#section-6.7. The DefaultHttp2FrameReader enforces this, but the DefaultHttp2FrameWriter allows invalid frames to be written. We should not allow invalid ping frames to be written to the network.  Modifications: - DefaultHttp2FrameWriter checks the frame size to be 8, or throws an exception  Result: Fixes https://github.com/netty/netty/issues/3721
Use a String instead of an enum for the option category
Added license info
Log unresolved exceptions at error level
make wordcounttopology and exclamationtopology run in remote mode
Refactoring, less guava, more standard JDK
CAMEL-8852: Camel JCR doesnt include Connection to a repository workspace except the default one
Resolve `ndk-build` properly on Windows  Summary: The method on `ExecutionContext`, which was only called by this code, didn't handle file extensions properly.  This removes that method, and adds a method on `ExecutableFinder` to do the right thing.  Test Plan: Ran `NdkLibraryIntegrationTest` and see that it got further.
Small fix to test and toString(); add helpful check for bad use of item/user pref array
fix issue with oauth user authentication where attributes and uid werent mapped
Update copyright year of changed files
Ensure tomcat on the classpath does not imply web application
Polishing: fix some compiler warnings
Polish modifier declaration ordering    Follow that Java language specification.
Use factoryBeanObjectType attribute to find factory bean to replace    Previously, MockitoPostProcessor would fail to replace a factory bean  with a mock if the factory bean didn't return a matching type from  getObjectType(). This prevented Spring Data respoitories from being  replaced with a mock as Spring Data's repository factory beans  generally do not know the specific repository type that they will  produce when MockPostProcesser (a bean factory post-processor) is  running.    Spring Data has been updated to add a factoryBeanObjectType attribute  to its factory bean definitions. MockitoPostProcessor has been updated  to look for FactoryBeans with this attribute and to use its value  to determine whether or not the factory bean produces a bean of the  required type and, therefore, should be replaced with a mock.    Closes gh-6541
Add defaultLocale to AcceptHeaderLocaleResolver  Issue: SPR-14312
Add isExecuted method to Call.
Fix parsing of value with comma    Closes gh-12297
Quick Javadoc cleanup to restore snapshot building.
Changes to Javadoc to remove doclint errors and warnings    JDK 8 introduced doclint to the javadoc tool:  http://openjdk.java.net/jeps/172    Unfortunately, this causes deployments to fail under JDK 8, due  to javadoc doclint errors.    Not all warning messages were removed, but `mvn javadoc:jar` now  completes without an early failure.    Further discussion will be required to decide on how to approach the  doclint warnings.
[Dubbo-#2162]Correct the reference retries default value 0 to 2 (#2183)    * Correct the reference retries default value 0 to 2  * fix the unit test error
Polish 'Make sure exception tag values are not empty in web metrics'    Closes gh-13187
Docs and actuator endpoints can be enabled when endpoints.enabled=false    Previously, if endpoints.enabled was false setting  endpoints.docs.enabled=true or endpoints.actuator.enabled=true would  have no effect as their entire configuration class was conditional  on endpoints.enabled being true.    This commit updates the conditions on the configuration class so that  it is conditional on either the actuator or docs endpoint being enabled.    Closes gh-5007
Restore that fields shadow fields from super class    This commit restores the shadowing behaviour of JUnit 4.12. Some users  of JUnit 4 have tests that rely on this behaviour. Their tests would  fail with JUnit 4.13.    This commit finally reverts 39b8a92d24e6c81e4fc614cdf13003ce17bbc166.  Some parts have already been reverted by  ed6813d3bbe2da4d67892f73e641fa80ab4d126e.
Add test for executing Calls at most once
Add test for executing Calls at most once
Polish ConditionalOn annotations    Update ConditionalOn annotations :  - Use consistent attribute names for OnClass and OnMissingClass  - Update javadoc  - Rename tests to reflect the annotation rather than the interface
Add boolean flag spring.rabbit.listener.useTransactionManager    If set *and* there is a transaction manager in the context, then the  listener container created by Spring Boot will use the transaction  manager to execute the listeners.    Fixes gh-3432 (by virtue of not requiring a JtaTransactionManager any  more).
Move most tls tests to Junit 5 (#6380)
Configure Cassandra JMX Reporting    Allow Cassandra JMX reporting to be configured via a property, and  disable it by default since it won't work with Dropwizard metrics 4.    Also update some of our own tests to explicitly disable it.    Closes gh-14778
Polish 'Trim whitespace when coercing to a LogLevel'    Closes gh-15143
Improve transaction manager detection    Switch the condition used to trigger the creation of a transaction  manager from the default name to the actual type.    Fixes gh-3012
Apply RSocket server customizers to netty web server    This commit applies `ServerRSocketFactoryCustomizer` beans to RSocket  setups when the RSocket server is being plugged into an existing Reactor  Netty web server.    Fixes gh-18208
Allow to configure Kafka Listener's onlyLogRecordMetadata    See gh-24582
Apply customizers to build when created embedded Mongo client    Closes gh-11132
Polishing: fix a number of compiler warnings reported by Eclipse
Rename nested *AutoConfiguration classes to *Configuration    Closes gh-12989
Use Collections.addAll(...) instead of for loops    Replace various for loops which add items to collections with calls  to Collections.addAll(...).    Fixes gh-2277
Avoid early init of CacheManager    This commit restructures the Cache auto-configuration to avoid an early  init on CacheManager (and potentially all its infrastructure). Rather  than adding a dependency on the validator bean, this commit relies on  the fact CacheAspectSupport checks if a CacheManager is available in the  afterSingletonsInstantiated callback. In this case, a simple bean with  a postconstruct callback is enough.    Closes gh-13038
Make standard JSON builder customiser classes package-private    Closes gh-14399
Apply server customizer beans automatically    See gh-16584
Allow Thymeleaf's LayoutDialect to be overridden    Closes gh-5151
Polish 'Remove redundant interface modifiers'    Closes gh-15694
Ignore unbound collection properties if collection bound    As of Spring Boot 2.0, if Collection properties are specified in  multiple property sources, only the elements from the property source  with the highest precedence are used for binding. This caused an  `UnboundConfigurationPropertiesException` if the size of the collection  from the higher order property source was smaller and `ignoreUnknownFields`  was set to true.    This commit ignores unbound collection properties if the  collection was properly bound.    Fixes gh-16290
Fix checkstyle issues in samples    Fix checkstyle issues with samples following the  spring-javaformat upgrade.    See gh-13932
GenericException compatible with 2.6.x or lower version (#5800)    fixes #4675
refresh configCenter before start
GenericException compatible with 2.6.x or lower version (#5800)    fixes #4675
support accepting external configuration from application.
Forbid response bodies on HTTP 204 and 205 responses.
Fix annotation docs to advertise string converters.
Use standard exception cause handling in RetrofitError.    Improves RetrofitError.toString() output.
Fix annotation docs to advertise string converters.
Allow Multipart requests with parts of unknown length
Remove some old toString overloads which are no longer used.
readability enhancement and assert check for proxy object (#3048)
support multiple default registries and protocols
Add support for @GrabResolver to AetherGrapeEngine    @GrabResolver can now be used to add a repository to the list that is  used for dependency resolution. Any repository that is added via the  annotation will then be available for the lifetime of the  AetherGrapeEngine instance. In reality, this equates to the lifetime  of the Boot application. This is in keeping with the documented default  behaviour [1]: 'By default, the grape subsystem is shared globally, so  added resolvers will become available for any subsequent grab calls'.    [1] - http://groovy.codehaus.org/api/groovy/lang/GrabResolver.html    [bs-345]  [60145036]
Removed unnecessary SuppressWarnings
#946 - Updated TemporaryFolder.newFolder() to give a better error message if a path contains a slash
Restore that fields shadow fields from super class    This commit restores the shadowing behaviour of JUnit 4.12. Some users  of JUnit 4 have tests that rely on this behaviour. Their tests would  fail with JUnit 4.13.    This commit finally reverts 39b8a92d24e6c81e4fc614cdf13003ce17bbc166.  Some parts have already been reverted by  ed6813d3bbe2da4d67892f73e641fa80ab4d126e.
Cleanup TemporaryFolderUsageTest and add it to AllTests suite
Autowiring rejects self references to a factory method on the same bean as well  Issue: SPR-12018
Polish some Map operations    Closes gh-15103
Configure RouteMatcher at the RSocketStrategies level    After a change in Spring Framework (see  spring-projects/spring-framework#23314), the `RouteMatcher` to be used  with the RSocket infrastructure is configured on the `RSocketStrategies`  directly.    This commit moves the auto-configuration of the  `PathPatternRouteMatcher` from the message handling parts to the RSocket  strategy one.    Closes gh-17571
Allow counter names like counter-foo    Checking for a prefix 'counter.' is more correct than 'counter' because  the readers (repositories) assume the former prefix is there.    Fixes gh-3801
Ensure RestTemplate interceptors remain mutable    Fixes gh-4553
Reverse priority of property sources when extracting sub properties    (cherry picked from commit 300e570f)  Fixes gh-2261  See gh-1259    Conflicts:   <tab> spring-boot/src/test/java/org/springframework/boot/bind/RelaxedPropertyResolverTests.java
Allow data unit to be specified on the constructor parameter    See gh-21746
Polish 'Bind StatsD queue gauges'    Closes gh-12124
Allow recursive list binding when iterable source    Further refine recursive binding rules so that Lists are supported when  the underlying source is iterable.    Close gh-10702
Fixes #427 inconsistent javadoc for test rules  The examples for some test rules used    public TestRule chain= RuleChain...    whereas others did not refer to TestRule, they used the class name.  Changed all of those who refered to TestRule to use the class name.
Fix request factory used with TestRestTemplate withBasicAuth    This commit updates the behavior of withBasicAuth on TestRestTemplate  by trying to use the same request factory type as the underlying restTemplate.  If creation of a new instance of the configured request factory class fails,  it falls back to the `ClientHttpRequestFactorySupplier`.    See gh-15982
[Dubbo-4147] restore the metadata store key change (#4170)
Tweak javadocs in SprinApplicationBuilder
Using TetClass.getAnnotatedFieldValues in order to get classRule fields (fixes issue #258
moved new test to 'running' subpackage
move getExporterMap() to the abstract class
Fix spelling mistakes in comment, 'Transfort' to 'Transporter' (#5414)
Use header delay instead of body delay before status line (#4011)    * Use header delay instead of body delay before status line
performance tuning: avoid address resolve (#4220)
Add test for executing Calls at most once
[Dubbo-#2162]Correct the reference retries default value 0 to 2 (#2183)    * Correct the reference retries default value 0 to 2  * fix the unit test error
remove unused imports
Deprecate APIs that use Hamcrest classes.    Users should use the java-hamcrest library instead.    Closes #1150.
completely remove 'default.' prefix of URL key (#4222)
Small format changes in script and monitor packages  Just three files - just adding {}s to if and for statements or making them single line.
Polish modifier order    See gh-12019
Do not leak body in intermediate buffers to converters    Multiple calls to source() would create a new BufferedSource which, when a single byte was read, would cache data in its buffer which would be lost on a subsequent call to source(). Calls to source() will now always return the same BufferedSource ensuring data cannot be lost.
Fix relaxed binding of SI JMX config    Instead of using an expression for JMX-related properties, this commit  properly honors relaxed binding.    Closes gh-6184
