Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Rename Import*AutoConfiguration classes    Rename Import*AutoConfiguration classes to AutoConfigure*.    Fixes gh-5692
Allow path with / in JolokiaMvcEndpoint    See gh-3629
Improve handling of reserved characters in MetaInfResourceManager    Previously, MetaInfResourceManager that we use with Undertow to serve  static resources from jar's META-INF/resources did not correctly  handle characters in the path that should be percent-encoded when  used in a URL.    This commit updates MetaInfResourceManager to encode the path before  it is used to create a URL. Prior to this encoding, encoded slashes  (%2F) are decoded as, unlike other encoded characters in the request's  URL, encoded slashes are not decoded prior to calling the  ResourceManager.    Fixes gh-17853
Fix packages and annotations used in sample    Update a few of the samples to correct the packages used in tests and  to make use of the `@SpringBootApplication` annotation.
Allow custom AbstractHealthIndicator warning logs    Update `AbstractHealthIndicator` so that the warning message can be  customized. Also updated our existing indicators with better messages.    Fixes gh-11880
Change package name in sample
Remove autowired injection of HealthIndicators into HealthEndpoint    Moved into EndpointAutoConfiguration
Support binding to collection with EnumSet values    Fixes gh-15539
[bs-140] Extract framework-provided @ConfigurationProperties into @Bean    Allows @ConfigurationProperties beans to be declared explicitly (to set default values)    [#50804109]
Source formatting and clean-up
Fix matching of SNAPSHOT artifacts when customizing layers    Previously the artifact's version was used. In an artifact's version,  SNAPSHOT is replaced with the timestamped version number of a specific  snapshot. As a result, it no longer matches the *:*:*SNAPSHOT pattern.    This commit replaces switches to using the artifact's base version.  This preserves the SNAPSHOT in the version number. For non-snapshot  artifacts, the version and base version are identical.    Fixes gh-23533
Re-register SpringApplication listeners in context once it is available    Fixes gh-1141
Use OutputCapture for log tests and disable ANSI    Refactor JavaLoggerSystemTests to make use of OutputCapture and ensure  that captured output never includes ANSI symbols.
Polish 'Add separate property for Redis read and connection timeout'    See gh-23137
Mark auto-configured `JdbcTemplate` as primary    This commit marks the auto-configured `JdbcTemplate` as `Primary`. Spring  session creates its own so we could end up with two in a fully auto  configured context.    Closes gh-6717
Allow CompositeHealthIndicator to be created with a Map as before    See gh-4965
Expose all endpoints under /cloudfoundryapplication    Regardless of whether the web endpoints have been enabled or not,  all endpoints for which beans are created need to be exposed in a  CF environment under /cloudfoundryapplication.    Closes gh-10673
Fix auto-configuration order for Spring Data Rest    Update Rest, Hypermedia and HttpMessageConverter auto-configuration to  ensure beans are created in the correct order.    Prior to this commit the MappingJackson2HttpMessageConverter bean would  not be created because Spring Data Rest's TypeConstrained versions had  already been registered.    Fixes gh-1729
Use supplier-aligned type information for FactoryBean type resolution  Issue: SPR-17063
Drop blocking RedisReactiveHealthIndicator calls    Update `RedisReactiveHealthIndicator` so that `getReactiveConnection`  is not called directly since it blocks.    Fixed gh-16756
Guard IntegrationJmxConfiguration if no mBeanServer is available    Closes gh-12966
Add @SuppressWarnings('serial')
Optimize reactor operators in actuator support    This commit uses native Reactor operators `Mono.fromCallable` and  `subscribeOn` for better performance and support.    Fixes gh-17452
Use String indexOf(char) and lastIndexOf(char) where possible    Closes gh-11416
Remove the second parameter of substring() if possible    Closes gh-5720
Make properties to sanitize configurable in EnvironmentEndpoint.    Add 'key' to default keys that will be sanitized. fixes #1027
Use random port for DevTools tests    Change the `RemoteApplicationLauncher` to use a random port and also  protect against an NPE if the launch fails.
Disable child context's /error endpoint if disabled in parent    Previously, EndpointWebMvcChildContextConfiguration would attempt to  create a /error endpoint, irrespective of whether or not the parent  had such an endpoint. If the endpoint was disabled in the parent this  would cause a failure due to the absence of an ErrorAttributes bean.    This commit updates EndpointWebMvcChildContextConfiguration to make  the creation of its /error endpoint conditional on the existence of  an ErrorAttributes bean.    Closes gh-4164
Don't resolve ConfigurationProperties placeholders    Revert commit 3ad43e0d445d15f03f92f758ced5ee5c64484806 to give us  a little more time to consider how this will impact tooling.
Ensure that condition evaluator uses runner\xe2\x80\x99s class loader    Closes gh-13319
Expose Validator bean    This commit improves ValidationAutoConfiguration so that a `Validator`  bean is exposed if JSR 303 is available. This has the side effect of  automatically enable Spring Data Couchbase's entity validation rather  than requiring to expose a `Validator` bean.    Closes gh-5178
Ignore parent contexts in message source auto-configuration    This commit applies the changes made in 68b55ad to 1.2.x (it was  originally only made in 1.0.x and master). It also adds some tests.    Closes gh-3803
Test compression with invalid content type for all webservers    Closes gh-18338
Fix property detection in SpringApplicationBuilder    Update SpringApplicationBuilder so that properties of the form  `abc=d:e:f` are correctly parsed. Prior to this commit the `:` delimiter  would always be chosen over `=`, even if `=` occurred first.    Fixes gh-6121
Add auto-configuration support for ReactiveGridFsTemplate    See gh-16467
Fix rebase from master
Ensure that condition evaluator uses runner\xe2\x80\x99s class loader    Closes gh-13319
Polish 'Retrieve javax.cache.CacheManager using Bean ClassLoader'    Closes gh-13338
Add Binder backed CloudPlatform.isEnforced method    Update `CloudPlatform` with a new `isEnforced` method that's backed  by a `Binder` rather than the `Environment`. We'll require this when  we overhaul our external config data processing logic.    Closes gh-22498
Avoid early init of CacheManager    This commit restructures the Cache auto-configuration to avoid an early  init on CacheManager (and potentially all its infrastructure). Rather  than adding a dependency on the validator bean, this commit relies on  the fact CacheAspectSupport checks if a CacheManager is available in the  afterSingletonsInstantiated callback. In this case, a simple bean with  a postconstruct callback is enough.    Closes gh-13038
Add Binder backed CloudPlatform.isEnforced method    Update `CloudPlatform` with a new `isEnforced` method that's backed  by a `Binder` rather than the `Environment`. We'll require this when  we overhaul our external config data processing logic.    Closes gh-22498
Polish 'Ignore spock.lang annotations when creating test context cache key'    See gh-8252
Add 'client-name' property to specify a Redis client name    See gh-17330
Make all @Bean methods public    Fixes gh-1571
Always auto-configure pool metadata providers    Import DataSourcePoolMetadataProvidersConfiguration from  DataSourceAutoConfiguration so that PoolMetadataProviders are configured  even if actuator is not used.
Replace some String.length() checks with String.isEmpty()    Closes gh-10451
Fix injection point with proxied DataSource    Prior to this commit, the `ApplicationContext` couldn't start with a  JDK-proxied `HikariDataSource` as the JMX auto-configuration was  attempting to inject a (too narrowed) `HikariDataSource`.    This commit rather injects a regular `DataSource` and attempt to unwrap  it as a `HikariDataSource`.    Closes gh-12271
Add User-defined type support for Cassandra    Configure `SimpleUserTypeResolver` if a keyspace is set to resolve  User-defined types.    Closes gh-7523
Add User-defined type support for Cassandra    Configure `SimpleUserTypeResolver` if a keyspace is set to resolve  User-defined types.    Closes gh-7523
Add Redis Sentinel database support    See gh-12556
Disable resource cache when DevTools is enabled    Closes gh-3794  Closes gh-3739
Add support for selecting the Redis client to use    See gh-22569
Add support to detect Kubernetes platform in CloudPlatform    Closes gh-15537
Improve Couchbase repository support    Previously, if Couchbase was available on the classpath but not  configured, Spring Boot would attempt to scan the project for  repositories anyway.    This commit makes sure that it only happens if an infrastructure  bean required is present. The tests have also been rewritten to better  reflect what would happen in practice.    Closes gh-5349
Protect PluginApplicationActions against absent plugin classes    Closes gh-24526
Forwarded header auto-config should be conditional on missing bean    See gh-5677
Support binding to collection with EnumSet values    Fixes gh-15539
Add User-defined type support for Cassandra    Configure `SimpleUserTypeResolver` if a keyspace is set to resolve  User-defined types.    Closes gh-7523
Support binding to collection with EnumSet values    Fixes gh-15539
Polish 'Optimize SystemEnvironmentPropertyMapper'    Introduce a new `ConfigurationPropertyName.ofIfValid` method to  save us needing to throw and catch an exception unnecessarily.    See gh-21523
Make intermediate classes of public classes public    Backport gh-12590 to 1.5.x and also pick up a few classes that were  missed. This commit also makes a few properties bound classes public.    Closes gh-17337
Make the AutoConfigurationReportEndpoint path a bit shorter
Fix http status code with unknown log level    This commit changes the http status code to 400 when an unknown log level  is specified.    Closes gh-8798  See gh-8813
Support binding to collection with EnumSet values    Fixes gh-15539
Fix Invalid target for Validator error    Update `PropertiesConfigurationFactory` so that the validator is only  set when it supports the target object.    Fixes gh-8149
Extract lists in VCAP_APPLICATION (e.g. uris)    Fixes gh-1773
Remove a nested TransactionProperties    Remove a few nested `TransactionProperties` that should have been  deleted in commit f22744c748.    See gh-7561  Closes gh-7786
Use static-locations properties to locate favicon    Closes gh-5751
Try to convert value in MapBinder    Fixes gh-11493
Honour custom bean name generator for non-web applications    Closes gh-6160
Improve DefaultCookieSerializer auto-configuration    Spring Session's own configuration support (i.e.  SpringHttpSessionConfiguration) will configure the default  DefaultCookieSerializer with rememberMeRequestAttribute if  SpringSessionRememberMeServices bean has been detected in the  application context.    In contrast, Spring Boot's auto-configured DefaultCookieSerializer does  not do this which results in a different out-of-the-box experience for  users that rely on Spring Session's remember-me integration.    This commit improves Spring Session DefaultCookieSerializer  auto-configuration to match Spring Session's behavior and make the  auto-configured DefaultCookieSerializer aware of  SpringSessionRememberMeServices bean.    See gh-16513
Update to latest 1.3 code
Rename classes and package in new OAuth2 and Actuator sample    Closes gh-8058
Update CLI to work around Framework's early adoption of Bismuth-SR1
Do not change availability on close unless context is active    Previously, an AvailabilityChangeEvent was published when the servlet  and reactive web server application contexts were closed, irrespective  of whether or not the context was active. This caused problems when  the context was not active due to a refresh failure as the event  publication could then trigger bean creation and post-processing that  relied upon beans that had been destroyed when cleaning up after the  refresh failure. The most commonly seen symptom was a missing  importRegistry bean that is required by ImportAwareBeanPostProcessor.    This commit updates the two web server application contexts to only  publish the availability change event if the context is active.    Fixes gh-21588
Delay property source initialization till LoggingSystem is initialized    Previously, the initialization of StandardServletEnvironment's  property sources in SpringBootServletInitializer led to debug logging  calls being made before the LoggingSystem had been initialized. As a  result, the system's default configuration was used and, in the case  of Logback at least, the debug logging was output to System.out  in a war deployment.    This commit updates SpringBootServletInitializer to delay the  initialization of StandardServletEnvironment's property sources until  after the LoggingSystem has been initialized, but still in time for  active profiles to be configured via servlet context parameters  (see gh-9972).    Closes gh-13736
Suppress debug log output during Logback initialization    Closes gh-12071
Apply eclipse formatting and cleanup rules
Deprecate exceptionIfInvalid    This commit deprecates the `exceptionIfInvalid` feature as we have now a  way to select the `@ConfigurationProperties` object to validate (i.e. add  `@Validated` on them).    Closes gh-8027
Add 'client-name' property to specify a Redis client name    See gh-17330
Polish 'Optimize SystemEnvironmentPropertyMapper'    Introduce a new `ConfigurationPropertyName.ofIfValid` method to  save us needing to throw and catch an exception unnecessarily.    See gh-21523
Ignore unbound collection properties if collection bound    As of Spring Boot 2.0, if Collection properties are specified in  multiple property sources, only the elements from the property source  with the highest precedence are used for binding. This caused an  `UnboundConfigurationPropertiesException` if the size of the collection  from the higher order property source was smaller and `ignoreUnknownFields`  was set to true.    This commit ignores unbound collection properties if the  collection was properly bound.    Fixes gh-16290
Replace convention mappings with PropertyState and Provider    Closes gh-9891
Remove unnecessary use of @Autowired in the samples
Polish 'Add Log Output when DevTools restart is disabled'    Closes gh-14807
Use RelaxedDataBinder for excludes    Update `EnableAutoConfigurationImportSelector` to directly use the  RelaxedDataBinder when obtaining excludes. This removes the need for  the additional getProperties method on RelaxedPropertyResolver.    See gh-4352
Fix detection of WebApplicationType with context class    Closes gh-14589
Add redirection to actuator endpoint    If a request to the actuator endpoint ends with a slash with Spring  HATEOAS on the classpath, an empty array of links is returned whereas  a request without the slash returns a response with all the expected  links to the actuator's other endpoints.    This commit adds an automatic redirection so that both URIs return the  expected result.    Closes gh-4575
Support case insensitive value for Cassandra's SchemaAction    Closes gh-8903
Make intermediate classes of public classes public    Backport gh-12590 to 1.5.x and also pick up a few classes that were  missed. This commit also makes a few properties bound classes public.    Closes gh-17337
Drop RepackageTask.getDependencies()    Drop `RepackageTask.getDependencies` from the gradle plugin in favor of  exposing `getLibraries()` and using the callback.  Drop getDependencies
Fix property prefix    This commit fixes the prefix for the WebClient and WebDriver auto-config  so that it complies with the prefix set on `AutoconfigureWebMvc`    Closes gh-6727
Change DataSourceHealthIndicator details from 'hello' to 'result'    Closes gh-15136
Update admin MBean to only be ready when its own context is ready    Previously, if there was a hierarchy of SpringApplications, the admin  MBean would report that the application was ready as soon as any  application in the hierarchy was ready. This could lead to a client  trying to query a property in the environment before it's available.    This commit updates the MBean registrar to that the MBean only reports  that the application is ready when the context that contains the  registrar has refreshed and fired its ApplicationReadyEvent.    Closes gh-6362
Replace some String.length() checks with String.isEmpty()    Closes gh-10451
Align ordering of BootJar and BootWar archive entries    Previously, the ordering of the entries in an archive produced by  BootJar was different to the ordering of the entries in an archive  produced by BootWar. The latter placed application classes before  any nested jars, whereas the former was the other way around.    This commit updates BootJar to use the same ordering as BootWar and  adds tests to verify that the ordering is the following:    1. Loader classes  2. Application classes (BOOT-INF/classes or WEB-INF/classes)  3. Nested jars (BOOT-INF/lib or WEB-INF/lib)  4. Provided nested jars in a war (WEB-INF/lib-provided)    The tests also verify that the position of a library is not affected  by it requiring unpacking.    See gh-11695  See gh-11696
Replace convention mappings with PropertyState and Provider    Closes gh-9891
Fix welcome page support in WebFlux    Prior to this commit, the welcome page support implemented in gh-9785  would override existing index views in both annotation and functional  variants.    This comes from the fact that the feature was implemented as a  `RouterFunction` configured in the main `RouterFunctionMapping` bean.  Due to ordering issues between mappings, this would override existing  application mappings in some cases.    This commit ensures that the welcome page `RouterFunction` is  contributed to the context in its own handler mapping, ordered after the  application ones.    Fixes gh-21909
Align ordering of BootJar and BootWar archive entries    Previously, the ordering of the entries in an archive produced by  BootJar was different to the ordering of the entries in an archive  produced by BootWar. The latter placed application classes before  any nested jars, whereas the former was the other way around.    This commit updates BootJar to use the same ordering as BootWar and  adds tests to verify that the ordering is the following:    1. Loader classes  2. Application classes (BOOT-INF/classes or WEB-INF/classes)  3. Nested jars (BOOT-INF/lib or WEB-INF/lib)  4. Provided nested jars in a war (WEB-INF/lib-provided)    The tests also verify that the position of a library is not affected  by it requiring unpacking.    See gh-11695  See gh-11696
Remove use of deprecated Gradle API from plugin's public API    This commit removes the use of the incubating PropertyState and  Provider API that was introduced in Gradle 4.0 and deprecated in  Gradle 4.3. A not-deprecated-but-still-incubating replacement was  introduced in Gradle 4.3. The short life of PropertyState and Provider  has made me wary of using an incubating Gradle API in our public API  as it may not be stable for long. Therefore, this commit does not move  to the replacement as it is incubating. Instead, it falls back to  using Gradle's convention mapping. This is internal API, but its use  is not part of our public API and I perceive the risk of using it to  be lower than using the deprecated and/or incubating API alternatives.    Closes gh-11640
Register any EventListener beans with auto-configured SessionFactory    Closes gh-7531
Polish 'Test the Gradle plugin against Gradle 4.10.3 and 5.1.1'    Closes gh-15791
Add HANA to the lookup of well-known databases    See gh-15125
Add HANA to the lookup of well-known databases    See gh-15125
Defer disabling registry until Tomcat server is being created    Closes gh-16498
Move main test annotation processor to test package
Expose MongoDB's replica set name    Closes gh-20391
Fix auto-configuration order for Spring Data Rest    Update Rest, Hypermedia and HttpMessageConverter auto-configuration to  ensure beans are created in the correct order.    Prior to this commit the MappingJackson2HttpMessageConverter bean would  not be created because Spring Data Rest's TypeConstrained versions had  already been registered.    Fixes gh-1729
Validate Spring Session has been configured    This commit validates that a `SessionRepository` has been configured if  Spring Boot is meant to auto-configure one.    Closes gh-5943
Fix DefaultPropertiesPropertySource package tangle    Relocate `DefaultPropertiesPropertySource` to fix a package tangle.    Closes gh-23383
Remove Servlet API dependency from SecurityProperties    A dependency on the Servlet API (the filter's dispatcher types) causes  a failure when Spring Security is used in a non-web application.    This commit removes the dependency on javax.servlet.DispatcherType  in favour of using a Set of Strings. SecurityFilterAutoConfiguration,  which is only enabled for web applications, is the responsible for  converting each String to a DispatcherType.    Closes gh-4505
Ensure DispatcherServlet is available in a deployed WAR    The DispatcherServletAutoConfiguration had a condition on it that  meant it wasn't used at all if there was no EmbeddedServletContainerFactory.  It's amazing that any WAR ever deployed.    Also added some info logging to servlet and filter registrations.
Fix request factory used with TestRestTemplate withBasicAuth    This commit updates the behavior of withBasicAuth on TestRestTemplate  by trying to use the same request factory type as the underlying restTemplate.  If creation of a new instance of the configured request factory class fails,  it falls back to the `ClientHttpRequestFactorySupplier`.    See gh-15982
Expose Validator bean    This commit improves ValidationAutoConfiguration so that a `Validator`  bean is exposed if JSR 303 is available. This has the side effect of  automatically enable Spring Data Couchbase's entity validation rather  than requiring to expose a `Validator` bean.    Closes gh-5178
Don't limit collection sizes in property binding    Update PropertiesConfigurationFactory so that collections can grow  beyond 256 items. Prior to this commit configuration property binding  used the default `DataBinder.autoGrowNestedPaths` setting of 256.    Fixes gh-6436
Throw exception if classpath*: is used    Update `ConfigFileApplicationListener` to throw a better exception if  `classpath*:` is used as a location.    Closes gh-21168
Address deprecation warnings
Polish copyright date on changed files
Refine AliasFor usage    This commit makes sure to use `getAliasedStringArray` rather than  `getStringArray` as the latter does not work with ASM. While this will  probably be fixed in the core framework, this commit also adds dedicated  tests with ASM to ensure that the code works as expected.    Closes gh-6337
Move limit and shuffle functions to IterableUtils
Fix break bug in for/foreach loops.
GROOVY-3481: Groovy Support for annotations on local variable declarations
Use time with nanosecond resolution calculated at the executing node to measure the time that contexts are held open  Closes #12345
Modify actual & preferred partitioning for GroupIdNode  Default behavior for GroupId was to pass down parent partitioning preferences unchanged and also pass up child actual partitioning unchanged. However:  - Children of the GroupId plan node do not have access to new symbols (i.e. passthrough symbols) that are generated by the GroupId. These must be translated. - We cannot pass through preferences for symbols that are modified by GroupId (i.e. the set difference of the distinct and common grouping columns). These must be removed.
Add missing license headers on new files.
Follows changes in kernel (-ReturnFilter -> Predicate<Position>)
allow subdomain access parent domain's network
GROOVY-2524: Javadoc typos for DefaultGroovyMethods
clean up hz instance config
Set cursor exception inside GenericKeyState  ... instead of in CompositeGenericKey to get more details about error.
Inline SubscriptionHelper.isCancelled() (#6263)
Adds shrink check that original index is deleted
Fix more inspector warnings introduced by recent mergences
Update copyright year, author tags, and Javadoc
OM-DSL: Annotations can have SOURCE retention.
Use JDK Supplier for OperatorContext info supplier
Small clean up.
For filters aggs, make sure that rewrites preserve other_bucket. (#32921)
Add replaceAllChars method
Revert to Boolean.valueof()
include isValid in Assumption.toString(); minor javadoc fix.
Remove unneeded instanceof.
Fixed problem with LET and variable output
Revert "Fix failing test"  This reverts commit c01f45fa59db126e928affccad596eca45c8c202.
better support for "embedded" token types (binaries) when parsing
Add support for querying materialized views in postgresql connector
Use correct primary term for replicating NOOPs (#25128)  NOOPs should be, same as for indexing operations, written on the replica using the original operation term instead of the current term of the replica.
option values are either initialized upon creation or they must provide a lazily initialized value
Fixed bug reported in ML by Andreas on the caching of indexed values. This fix should reduce also the memory occupied by the index nodes as well
Remove some unneeded unboxing, unneeded methods, made some stuff private that can be
Remove unused SourcePathResolver from NdkLibrary  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 6236b7d
Refactoring: HTTP/1.1 - HTTP/2 alignment  Change StreamOutputBuffer to implement HttpOutputBuffer
Add some Javadoc
[buck][i18n] Remove unused isStoreStringsAsAssets from FilteredResourcesProvider interface  Summary: Looks like no one is using this interface any more so we can clean up your TODO.  Test Plan: build buck
@Deprecate a method as it's not needed anymore
Fix node method parsing with cached fields. (GR-16366)
Rename leftovers after NullConnector
Added method to allow creation of new methods on-the-fly.
Reduced timeouts from 60 to 10 minutes to avoid long CI hangs
Added forceGetRaw to the RecordStore interface.
JsBundleGenrule: Add vars for resources and misc  Summary: Adds more environment variables to `js_bundle_genrule`:  - `RES_DIR` points to the resources directory - `MISC_DIR` exposes the `misc` directory of the bundle  Test Plan: new unit tests  Reviewed By: fromcelticpark  fbshipit-source-id: 551a443
CAMEL-1812: Removed the remaining @author tags.
Convert UserLocalConfiguration to @BuckStyleValue  Summary: - migrates to the new style of immutable - replaces `.of()` with constructor calls  Reviewed By: bobyangyf  fbshipit-source-id: 04a72ab932
[updated] scene2d widgets to have a size after being constructed. This is just so people are less confused when using widgets without Table. Call pack() if you change the size of a widget after construction and aren't using Table!
Fixed closing of messages.log for real
TIKA-468: Missing Silde-Count metadata for PPT files
Move JVM vendor detection to a global constant. Fix detection of Sun/Oracle JVM that only worked for older Sun branded JVMs.
bug 12364:  fixed export template with swift  status 12364: resolved fixed
Ensure Gdx.graphics/input/etc. are correct when resize calls render
Allow explicit exceptions for arraylength
Name added methods in NodeFactory appropriately
SimonStewart: Upgrading to HtmlUnit 2.4  r6037
Add better error message when analyzer created without tokenizer or analyzer type (#18455)  Closes #15492
Clean up warnings in spring-test   - Deleted unused imports.   - Switched from junit.framework.Assert to org.junit.Assert, since the    former is deprecated as of JUnit 4.11.   - Suppressed warnings for continued deprecated usage of    junit.framework.Assert.
Improved speed test group
Make Channel*Invoker package private
Use the Option annotation to specify CLI options for the sampler.
DRILL-1140: Add cast function from Timestamp to Time
Remove setters (#2300)  * WIP, build failing because of dependencies  * Make variable final  * Add java doc
Add support for ValueProvider in JdbcIO.DataSourceConfiguration methods  Allows JdbcIO transforms to be fully templatized by providing ValueProvider support for the following methods: - create - withConnectionProperties - withPassword - withUsername
More common AcknowledgedRestResponseActionListener  Introduced use of AcknowledgedRestResponseActionListener in put/delete index template
Acquire AllRelationshiCursor in the StorageLayer
Watcher: Ensure correct method is used to read secure settings (#31753)  As SecureSetting is extended from Setting, you can easily accidentally use `SecureSetting.simpleString()` to read a secure setting instead of `SecureSetting.secureString()`. This commit changes this behaviour in some watcher notification services.
bug 9411: 1. adding storage pool fails, remove the entry in DB 2. in introduce SR, create pbd for master host  status 9411: resolved fixed
remove global phase metric, replaced with per-phase metrics
Enhance TargetNode equality to work with multiple repos  Summary: It's entirely possible for each repo to have targets with duplicate names, but which represent different rules. Currently when we build the Target Graph we only use the build target was for comparison, & this means that we're ignoring the repo the target is in. Fix that.  Test Plan: buck test --all
SimonStewart: Cleaning up some imports  r16101
More code examples in Javadoc for TupleConstructor and ToString  Based on discussion on the dev mailing list on how to include code example from the MrHaki Groovy Goodness blog series. Instead of external link the code samples from the blog posts are included in the Javadoc comments.  See also: * http://groovy.329449.n5.nabble.com/Re-GitHub-groovy-pull-request-Link-to-MrHaki-s-blog-in-TupleConstructor-jav-tp5731382.html
Remove IndexService dep. from IndexShard  there is no reason for the index shard to hold on to it's corresponding index service. This dependency is unnecessary.
[TEST] Use the correct renamed setting and make the default value setting private
Marked Jackson 1.x support classes as deprecated
Do not recompute existing annotatedSuperInfo
Only write out modified persistence windows (AbstractPersistenceWindow only).
Provide 'with implementationType' overloads  Provided overloaded versions of `forField` and `forMethodParameter` that accept a `ResolvableType` implementation type (as opposed to a Class).  Primarily added to allow resolution against implementation types that have been created programmatically using `forTypeWithGenerics`.  Issue: SPR-11218
Rest improvements (#2113)  * Use DeferredResult in TGT creating endpoint  * Fix tests  * Create Jackson Writer only once  * Use StringBuilder over Formatter as it's almost 10x faster (355707.814 ops/s vs 2652050.343 ops/s)  * Add TODOs for tasks  * Extract stirng constants  * Do all the concatenations we can on start up. Add an initial capacity to the StringBuilder  * Iterate over values as keys are not used  * Log error in one line  * Remove TODO  * Cleaning checkstyle  * Do not use DeferredResult as we need to test it deeply  * Fix tests for non DeferredResult implementation
Propagate cxx.ldflags to Xcode project  Summary: This adds values in `cxx.ldflags` to `OTHER_LDFLAGS` field for generated xcconfigs. This brings `ldflags` on par with `cxx.cflags`(set to `OTHER_CFLAGS`) and `cxx.cxxflags` (set to `OTHER_CPLUSPLUSFLAGS`). Closes https://github.com/facebook/buck/pull/1756  Reviewed By: milend  Pulled By: milend  fbshipit-source-id: 0d9b81a
SQL: Make error msg for validation of 2nd arg of PERCENTILE[_RANK] consistent (#37937)  Use `first` and `second` instead of `1st` and `2nd`.
cxx: make C/C++ tests runnable via `buck run`  Test Plan: `buck run ..` on `cxx_test` target  Reviewed By: aiked  fbshipit-source-id: c0cfd4b
add progress to indices status API
Fix tests that passed invalid input to DynamicDestinations
Store complete canSafepoint status in LoopEndNode, propagate value from LoopBeginNode eagerly
runtime in Stopwatch rule for Performace tests
2.x: Improve JavaDoc of XObserver types. (#5841)  * 2.x: Improve JavaDoc of XObserver types.  * Use "disposing", add missing space  * Add more explanation about throwing exceptions.
Added new flag for compiler only flags to [cxx] section of .buckconfig  Summary: This diff provides a new flag 'compiler_flag' to the [cxx] section which is combined with the compiler flags but not the preprocessor flags from the config file.  Test Plan: Unit tests:  CxxPlatforms.combinesPreprocessAndCompileFlagsIsDefault CxxPlatforms.compilerOnlyFlagsNotAddedToPreprocessor
Improve Javadoc in SQL script support classes
adding missing finals
Include off-heap metadata size in MemoryWalker.RuntimeCompiledMethodAccess.
WW-4095 WW-4094 Changes how pattern is compiled to be once per instance and changes default regexp to match underscore
Also allow to override how direct ByteBuffers are freed
up sync from 6.0 http://svn.apache.org/viewvc?view=rev&rev=555310
Make otest tool optional in Apple platforms  Summary: Xcode 7 no longer ships `SenTestingKit` or its test runner `otest`, so this commit makes the `otest` tool optional and throws an exception if a test tries to use it when it's not present.  Test Plan: Updated unit tests. `ant java-test -Dtest.class=AppleCxxPlatformsTest`
more logging on region and endpoint used
Fixed compilation warnings for javadoc
Added eventIdentifier to SlaveContext
Adding close connection support to HttpClient to combat hanging open files  Added a .close() method to org.openqa.selenium.remote.http.HttpClient interface.  Added a call to the client's .close() method from the HttpCommandExecutor class when a org.openqa.selenium.remote.DriverCommand.QUIT is sent.  Implemented the .close() method in org.openqa.selenium.remote.internal.ApacheHttpClient which taps the connectionManager and closes idle connections.  Fixes #1080  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Restored log lines to TRACE for notification post alias creation and open/close index Introduced specific log level for those in OpenCloseIndexTests#testCloseOpenAliasMultipleIndices
Fix FakeProjectFilesystem.getFilesUnderPath()  Summary: `FakeProjectFilesystem.getFilesUnderPath()` is broken in a bunch of ways currently. It had no tests, so it sadly regressed.  1) `ProjectFilesystem.walkRelativeFileTree()` is polymorphic, but the most general version of the API which takes an `EnumSet<FileVisitOption>` was private, so `FakeProjectFilesystem` could not override it.  2) `ProjectFilesystem.getFilesUnderPath()` incorrectly converted the project-relative path to an absolute path before passing it to `ProjectFilesystem.walkRelativeFileTree()`. That method requires a project-relative path.  3) `FakeProjectFilesystem.getFilesUnderPath()` was implemented to always return the empty set.  Test Plan: New test added. Confirmed it failed until I fixed all above issues.
Cache: exists() called / rel. path support
Minor improvements in the local and the queue scheduler
Migrate NOT_EQUAL operator for arrays to new framework
Report diagnostics to the user if the failure would have prevented ABI gen from even attempting  Summary: We'd be swallowing parse errors.  Test Plan: Updated integration test  Reviewed By: dreiss  fbshipit-source-id: 6035c6d
Add default method getColumnTypes to SystemTable
resolve unit test failures from changes via: https://issues.apache.org/activemq/browse/AMQ-2034 - only use sync for close if in xa tx, this may need some rework for managed tck case
Remove reference to CLOUDSDK_EXTRA_SCOPES.  ----Release Notes---- Datasore uses platform scope set by gcloud, no need to set extra scopes. [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=92730361
Adapting to merging GetField and SearchHitField to DocumentField (elastic/x-pack-elasticsearch#1860)  Follow up to changes in https://github.com/elastic/elasticsearch/pull/25361  Original commit: elastic/x-pack-elasticsearch@5b1ca009f6376605c1f105daa14fe289f559e330
[java] Moving marionette specific test to the corresponding class
Make Hive view error message a constant
Remove `ElasticsearchIllegalArgumentException` and `ElasticsearchIllegalStateException` in favor of the JDK one  Related to https://github.com/elastic/elasticsearch/issues/10794  Closes #204.
Clean up styling issues and useless casts
HIVE-4954: PTFTranslator hardcodes ranking functions (Edward Capriolo via Brock Noland)
refactor to move commit logic control inside the database implementation
ConfiguredCompilerFactory: Switch default on trackClassUsage  Summary: Since most languages don't implement this, it should be opt-in rather than opt-out.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: 3fae032
After transactions were applied in recovery NeoStore is asked to rebuild id generators
sulong: rename LLVMScanner#parseBitcodeBlock to #parseBitcode
Mark more properties for serialization in MBR  Summary: Adds some missing properties to the serialised state.  Reviewed By: cjhopman  fbshipit-source-id: c68b1b855f
Renames class to match pattern used in Tiles
Small fix to test and toString(); add helpful check for bad use of item/user pref array
break down of strategy to composable parts
CAMEL-1433: only 2 options for include/exclude file name pattern based on regex.
Fix match_phrase_prefix query with single term on _all field (#20471)  * Fix match_phrase_prefix query with single term on _all field  This change fixes the match_phrase_prefix query when a single term is queried on the _all field. It builds a prefix query instead of an AllTermQuery which would not match any prefix.  Fixes #20470  * Add missing change
Move InMemoryStateInternals to runners/core-java
[hotfix] [checkpoints] Remove never used method 'close()' on CheckpointStreamFactory  The fact that the method was never called (and never implemented) strongly suggests that it should be removed, otherwise someone might eventually end up implementing it for a new state backend and wonder why it is never called.
Use unwrapped cause to determine if node is closing (#39723)  We need to unwrap and use the actual cause when determining if the node with primary shard is shutting down because TransportService will throw a TransportException wrapped in a SendRequestTransportException.  Relates #39584
[streaming] [api-breaking] Minor DataStream cleanups  - Removed unused constructor parameter. - Updated outdated and wrong connection javadocs.  Closes #825
Do not use Streams in Block/Pages implementations  While Streams often offer more readable code, they have certain performance implications and therefore should be avoided in execution.
Use BuildContext's SourcePathResolver from WriteStringTemplateRule  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: af2da38
https://issues.apache.org/jira/browse/AMQ-3205 - Update ActivationSpec, patch applied with thanks
Remove ThreadSafe annotation from OperatorContext and DriverContext
fix usage of deprecated apis
ExternalUUID control: enforce checking uuid validity by defining checkUUID method in the corresponding absract class, and performing the check during API command dispatching
Updates license headers
Fixes due to changes in master branch.
Issue #2161: unify test input locations for coding package
Adding a method to enable insecure cert support via FirefoxOptions
Move verification of valid final CacheResultType earlier  Summary: Currently this is only verified in the console eventbus listener. By that point we've lost a lot of the context of how this got set to this value.  Add a couple places much earlier that will verify this.  Reviewed By: philipjameson  fbshipit-source-id: 2a2f488b4c
Removed unused imports
Added explicit note on thread safety to JdbcTemplate variants  Issue: SPR-11478
When getting display data from a runtime parameter, don't call get().
Fix errors reported by javadoc  Motivation:  Javadoc reports errors about invalid docs.  Modifications:  Fix some errors reported by javadoc.  Result:  A lot of javadoc errors are fixed by this patch.
AbstractCxxLibrary: don't extend `NativeTestable`  Summary: This belongs on the actual concrete classes, rather than the base interface for C/C++ libs.  Test Plan: CI  Reviewed By: Coneko  fb-gh-sync-id: 6b2b888
Replaced `new HashMap` with `Maps.newHashMap` in our codebase.
Use DataBufferUtils.compose and remove writeAggregator  Use DataBufferUtils.compose instead of writeAggregator to combine multiple data buffers into one, as the write aggregator would not work when the initial data buffer did not have enough capacity to contain all subsequent buffers.  Removed writeAggregator, as it is no longer needed.  Issue: SPR-16365
Update lookup od neostore data source in data source manager to use last available database as a default database; update extension lookup to use NeoStoreDataSource directly.
Fixed bug on using remote indexes reported in ML
Add resource_union_package for android_binary  Summary: When I committed "Add resource_union_package for android_library", I forgot that we do our own R.java generation for the uber R.java, rather than using the one from aapt.  This makes resource_union_package work on android_binary (for uber R.java) to make sure those resource ids are available at runtime.  Test Plan: Ran the app in question, rather than just building it. :)
removed no longer necessary method: CodeCacheProvider.getSizeOfLockData()
CAMEL-5857: Add server side enrycption algorithm option to s3 producer. Thanks to Scott LePage for the patch.
Two way sync with moe (#1108)  * Enable v12 for GMS auth and add v12 visibilitys for it, FamilyLink, and libraries/kids. This is all building up to upgrading FamilyLink to v12.  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=167909893  * fix a Moe sync directive error  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=169141166  * Replace occurrences of Wrapped.valueOf(...) with Wrapped.parseWrapped(...) where the value will be immediately unboxed anyway.  The change removes small-but-pervasive inefficiencies from creating and immediately discarding instances of the wrapped value, as well as removing unnecessary syntax.  More information: go/lsc-immediateunboxing  Tested:     tap_presubmit: http://test/OCL:189509157:BASE:189708880:1521556795490:d7b0a09a     Some tests failed; test failures are believed to be unrelated to this CL  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=189880661  * Fix bug that MediaHttpDownloader couldn't specify a size larger than 4G.  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=192165502
Internal: resolve a few compiler warnings  @NotThreadSafe is not a valid standard java annotation. Removed unused method and empty @param javadoc annotation  Original commit: elastic/x-pack-elasticsearch@3583bcfa66362f5b3b99e7f6d33df5b985d9c688
revised TypedValue toString representation (SPR-7569)
Remove unnecessary semicolons  ----Release Notes---- [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=100697339
Added Group#removeActor(Actor, boolean) to avoid unfocusing an actor that is still in the stage.  closes #2901
Removed some System.outs
Use configured time zone for logging in test harness  This commit fixes a problem where configured time zone for log files was not used for the user log. `Neo4jRule` used to ignore the `dbms.db.timezone` setting. Thus neo4j.log and debug.log contained different time zone offsets in logged timestamps.
fix tests with json and yaml registries
Allow recursive directory traversal to be configured  Right now there is no way to configure this value, even if Hive is configured to support recursive directory traversal/subdirectories. This commit exposes the variable through a HiveClientConfig value.
Moved some of the http tests to jetty to avoid online lookup as it failis sporatic on some of the TC servers.
Add better validation error message and a dedicated test
Throw exception for delete from unpartitioned Hive table
Mark PValue and PValueBase Internal  These should not be referred to as their abstract types by users, and PipelineRunners won't interact with PValues that aren't PCollections or PCollectionViews.
move SearchExtParser back to o.e.search package  The parser is now needed only for sub fetch phases, but doesn't have to be strictly connected to them, it could be used for something else as well potentially
minor refactor: slightly earlier return for some AST transform validation checks
SPR-5866 - RestTemplate - access to Request Headers
Remove unused imports idnetified by Eclipse
rebase as file conflict with #5089
CAMEL-4713: Added certFilename option. Thanks to Scott Cranton for the patch.
added fix for CAMEL-1375
Remove Predicates.always{True,False} obsoleted by Guava
add getDocument() function
Use Splitter instead of String.split, in InternetDomainName.  RELNOTES=n/a  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=193087177
Removing extra empty lines
[javadocs, network] Add javadocs to SpanningRecordSerializer and RecordSerializer
reformat  Revision created by MOE tool push_codebase. MOE_MIGRATION=2324
Cache success type included as part of machine readable log.  Summary: In the case of a cache hit, this will allow us to determine the type of cache hit, e.g. default rule key, input-based rule key, etc.  Test Plan: added new unit tests  Reviewed By: aiked  fbshipit-source-id: 24c3ce2
Fix for transactional state leaking into cache
[#4755] Make WebSocketClientCompressionHandler @Sharable  Motivation:  WebSocketClientCompressionHandler is stateless so it should be @Sharable.  Modifications:  Add @Sharable annotation to WebSocketClientCompressionHandler, make constructor private and add static field to get the instance.  Result:  Less object creation.
Reduced debug output
add CompletedTasks to CompactionManager.  patch by jbellis
Change BinaryBuildRule.getExecutableCommand to return List of arguments instead of formatted string.  Summary: Change getExecutableCommand to return something easier for ProcessBuilder to work with.  Test Plan: buck test --all
Do not create ParserPythonInterpreterProvider in PerBuildState  Summary: This is a part in a series of changes to reduce complexity in `PerBuildState`.  Removing creation of `ParserPythonInterpreterProvider` from `PerBuildState` and require all clients to create it.  Reviewed By: ttsugriy  fbshipit-source-id: 21a7d39
plugins: fix print of url when it contains spaces
Fix more inspector warnings introduced by recent mergences
Add Resource.readableChannel()  Added readableChannel() to Resource, which returns a java.nio.ReadableByteChannel. The default implementation uses Channels.newChannel() to create a channel based on what is returned from getInputStream(). Subclasses have more effecient, file-based implementations.  Issue: SPR-14698
Remove debug logging
Replace ResolvedJavaType.isFinal with more meaningful and correct isLeaf
Added comments for the search builder classes on how to use them
Changed return type to application/json for CONNECT, QUERY, DOCUMENT and CLUSTER as requested by A.Madrid via ML
Remove unused method ActionFuture.getRootFailure()  Closes #14214
make Token serializable again for JMX
Update SessionDisconnectEvent  SessionDisconnectEvent now extends AbstractSubProtocolEvent.  Issue: SPR-12156
moved distance measures to utils class, as they will be generally useful, even in some non-clustering based code
DefaultPromise make listeners not volatile  Motivation: DefaultPromise has a listeners member variable which is volatile to allow for an optimization which makes notification of listeners less expensive when there are no listeners to notify. However this change makes all other operations involving the listeners member variable more costly. This optimization which requires listeners to be volatile can be removed to avoid volatile writes/reads for every access on the listeners member variable.  Modifications: - DefaultPromise listeners is made non-volatile and the null check optimization is removed  Result: DefaultPromise.listeners is no longer volatile.
removed empty bytes from the serliazation bytes resutl. issue #681
Bulk API: Rename `index` to `_index`, `type` to `_type` and `id` to `_id`, closes #421.
Convert ProvisioningProfileStore to an immutable  Summary: Reducing boilerplate  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: 3396655
Factor out a ChannelActionListener (#33819)  We use similar / same concepts in SerachTransportService and HandledTransportAction but both duplicate the efforts with slightly different implementation details. This streamlines sending responses / exceptions back to a channel in an ActionListener with appropriate logging.
Script: bound HTTP session object in context
CLOUDSTACK-1862 Added vm ip address info in the list PF rules response  Signed-off-by: Abhinandan Prateek <aprateek@apache.org>
Updated to no longer use deprecated junit.framework.Assert
[fixed] FileHandle, getting the child of an empty relative path. [added] String constructors for Texture and TextureAtlas to load an internal file. [added] Empty camera constructors.
added test and test docs for comments in xls and xlsx; lack of tests detected during work on TIKA-1380
Move ParseBuckProfilerReportEvent to an appropriate package.  Summary: Otherwise an attempt to add a dependency on it leads to cyclic deps.  Reviewed By: jtorkkola  fbshipit-source-id: a4c9665
TypeElement.getSuperclass when the superclass is parameterized by an array type  Summary: To support generating ABIs from source, we'll be implementing most of the `javax.lang` interfaces using just the information provided by the Compiler Tree API (`com.sun.source.tree`).  This commit adds support for superclasses that are parameterized types, parameterized by array types.  Test Plan: New unit test  Reviewed By: asp2insp  fbshipit-source-id: c8a97fa
Tracks SCAN_COMPLETE in PhaseTracker
rename default compiler config to basic to match configuration name
Avoid AssertionError when closing engine (#43638)  Lucene throwing an AlreadyClosedException when closing the engine is fine, and should not trigger an AssertionError.  Closes #43626
[added] OpenAL native to LWJGL. [removed] newTexture method that takes a ByteBuffer. It's all going away anyway.
Remove Statement from ResourceGroupSelector.match()
Revert "Added improved debugging for incorrect message handling."  This reverts commit 95c36934adc838666aebb2200d7ee6a647d01a49.  Since there's no longer a specific need for it.
CAMEL-12664 - Moved getConnection to Endpoint
Fix missing @Override annotation in presto-main
Renamed ChannelBuffer.writePlaceholder to writeNul
Revert "Consistent naming style for enum"  This reverts commit 4feafc4a5226c6307f5a9b36665d8fe8d8a05072.
Revert "Use ImageStage Enum instead of specific methods to represent run-context."  This reverts commit a75fd00fc074a1e3107e86ce5eb031595c7bbb36.
Polish Javadoc for messaging annotations
bug 8249 : save combined persistent and run-time id into worker to help worker VM GC
Add missing line to license header
relaxed warning about ambiguous setters to only be logged in case of actual write access (SPR-6399)
Revert "All SFBuilder setters return 'this' & use varargs"  This reverts commit 0e2ce565c9ef64d97299836a3b979b2cf85de759.
#NAME?
Removing extra empty lines
Adding missing license header
CLOUDSTACK-2536: fix the regression introduced by 4c81ea69c4e8326cc81a0e2607f6a6d99645ce5f
Pass CxxTest its SourcePathResolver from runTests context  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 648fb82
[streaming] uuid update
Do not accept number for RFC2822/ISO8601/Custom temporal field decoders
Rewrite getVariableNameTypesMapping to new Type
Cleanup and fixes in handling of VirtualStates around loop exits merging
Making checkstyle happy
Move across the import checks
Replace (read|write)Rescorer with (read|write)NamedWriteable
Fix creating views for tables names that need quoting  Table names may contain special characters and should be quoted when formatting SQL queries. For example, creating a view with this query fails: SELECT count(*) FROM "$test"
Minor refactoring: remove duplicated code
Follows changes in kernel (-ReturnFilter -> Predicate<Position>)
Pull-up code. No need for this to go all the way to the Endpoint.
removing never fully implemented reference to getting 'Session logs'
turned requestedSessionId into a settable property
removed not needed save from ridbag classes.
include last value in cause when error occurs in takeUntil(predicate)
Deprecate Iterators.emptyIterator() in Guava, because it always has a decent replacement even when not on Java 7. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=66299891
Fix @RequestBody argument processing for null Content-Type  Since the changes introduced in SPR-12778, some `@RequestBody` args would not be properly processed in some cases:  * requests with an empty body * no Content-Type header defined  This typically happens when GET requests are mapped on a handler dealing with POST requests and HTTP bodies.  This change makes sure that the `RequestResponseBodyMethodProcessor` is only involved for requests that:  * have a Content-Type defined * OR are HTTP requests eligible for an HTTP body (PUT, POST, PATCH)  Issue: SPR-13176 Fixes spring-projects/spring-boot#3313
Revert my previously not so clever implementation. If there is an executor being used, then one shall expect that the executor is reporting the numbers of threads itself, and it should no longer be the responsibility of the connector
We should let a client change the client id on a connection even if it was set on the connection factory.
Issue #6821: remove IDEA suppressions fix for violation 'Redundant suppression'
Profiler: new metric "server.network.requests" as the sum of binary and HTTP requests
KAFKA-5579: check for null  Author: Jeremy Custenborder <jcustenborder@gmail.com>  Reviewers: Randall Hauch <rhauch@gmail.com>, Ewen Cheslack-Postava <ewen@confluent.io>  Closes #3517 from jcustenborder/KAFKA-5579
refactor node data location of index and shard into common code
Fixed few coverity reported issues around concurrency, null checks
Fix some unused imports and warnings
option to control default index null values behaviour added #5770
HtmlUnitDriver: Throwing NoSuchWindowException if the current window was closed.
CAMEL-13337 - Lets skip the tests for the moment
Change CharSource.wrap(...).toString() to use Ascii.truncate and increase the maximum number of characters to truncate at. Also change ByteSource.wrap(...).toString() to truncate the hexadecimal representation of the byte array. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=59155734
Stop referencing deprecated @TransactionConfiguration in Javadoc
Added licence header
Properties model documentation. Wip...
[FLINK-10089][tests] Update FlinkKafkaConsumerBaseMigrationTest for 1.5
Sorting out imports.
adding TakesScreenshot to WebElement, not going down the Augmentor route right now since that is setup just for WebDriver.  If someone really really likes the augmentor pattern, they can update it to also take into consideration WebElements and look at the Parent Driver instance's capabilities to determine which roles (interfaces) should be applied. I don't really care for it much and would rather get an exception from the driver that it is not implemented :)
Add context to RealAndroidDevice.rmFiles() errors  Summary: This will just hide higher stack frames and include a message that we were trying to delete files on a particular device (with its id).  Reviewed By: asp2insp  fbshipit-source-id: f301f92
Introduce old createFunctionDescriptor method as createAndRegisterFunctionDescriptor
added log statements
Renamed LeftCurlyCheck to AbstractLeftCurlyCheck. Completely happy with the name. :-)
clean up formatting and reconciliation of oidc services on authZ
Improving Javadoc of flattenAsFlowable and flattenAsObservable methods (#6276) (#6408)
Fix SQL CONTAINS with lists of lists  Resolves: #8653
Remove unused PhasePosition.HIGH_LEVEL.
Enable Docker in the PortableDirectRunner  Add an EnvironmentType which allows the PortableDirectRunner to construct either in-process environments or docker environments.
Further improvements to IGV. Make displayed names of nodes shorter.
Version Parsing Support  for Release Candidates  Summary: The Android SDK makes their version numbers a tiny bit more complicated by adding a `_rc#`.  This change adds support to parsing that and doing the correct comparison.  Addresses part of #326  Test Plan: added a unit test
Fix for back pressure on the alternate subscription.
WW-4688 Excludes "java.ext.dirs" when scanning for actions
Revert "Unconditionally set the auth store location in server"  We have at least one customer who requires the ability to set the location of the auth file.  This reverts commit e28225459d4d623f2b61c7d98aa4f159b849d6d0.
Enables implementations of the BlobContainer interface to (#19749)  conform with the requirements of the writeBlob method by throwing a FileAlreadyExistsException if attempting to write to a blob that already exists. This change means implementations of BlobContainer should never overwrite blobs - to overwrite a blob, it must first be deleted and then can be written again.  Closes #15579
Access java options through toolchain in AndroidBuildConfigDescription  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: 7a73259
Fixed a NPE issue which could be thrown in IndexHits#size(), more specifically CombinedIndexHits#size()
Move PlanPrinter to sql.planner.planPrinter package  extraction of inner-classes as package-private top-level classes will follow.
Avoid background sync on relocated primary (#40800)  There were some test failures caused by the background retention lease sync running on a relocated primary. This commit fixes the situation that triggered the assertion and reactivates the failing test.  Closes #40731
Add script name for debugging purpose
Remove ScriptDocValues.EMPTY.  Instead the default implementation is used, but on top of empty (Bytes|Long|Double|GeoPoint)Values. This makes sure there is no inconsistency between documents depending on whether other documents in the segment have values or not.  Close #5646
CLOUDSTACK-8833: Fixed  Generating url and migrate volume to another storage , resulting two entry in UI and listvolume is not working for that volume Update the volume id in volume_store_ref table to newly created volume for migration
Mark RemovalListener and Weigher as Java 8 FunctionalInterfaces  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=143461582
patch for https://issues.apache.org/activemq/browse/AMQ-1585
Getters for unexposed WindowFn fields
pass CallTarget name to Truffle-generated StructuredGraphs
Apply slop correctly if phrase query is wrapped in a filtered query.  If a phrase query is wrapped in a filtered query due to type filtering slop was not applied correctly. Also if the default field required a type filter the filter was not applied.  Closes #4356
Make ImmutableCollection.contains abstract, and fix some embarrassing oversights of where it should have been overridden. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=75849013
add Apache headers to new files  stupid
Move schema guard to global dependencies.
support for inner classes (local/member) in meta API
Cleaned up formatting
Recognize that the reason for an early completion might be cancellation rather than exception. This fixes the bug "com.google.common.util.concurrent.AbstractFuture$Cancellation cannot be cast to com.google.common.util.concurrent.AbstractFuture$Failure"  TODO(cpovirk): Write basher tests at some point. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=96784416
Simplify getting topic connection
SimonStewart: Marking failing chrome tests as ignored to green the build.  r16358
Use BuildContext's SourcePathResolver in Zip  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 72445d6
Support username and metadata in TransactionData events
CAMEL-8561: Better component docs summary of components - we use javadoc from the endpoint class instead of component so its in the same source file as @UriEndpoint.
Texture, fixed filter on reload.
Passing the HostAccess instances through the builders
return netmask in listStorageNetworkIpRangeCmd
Adding close connection support to HttpClient to combat hanging open files  Added a .close() method to org.openqa.selenium.remote.http.HttpClient interface.  Added a call to the client's .close() method from the HttpCommandExecutor class when a org.openqa.selenium.remote.DriverCommand.QUIT is sent.  Implemented the .close() method in org.openqa.selenium.remote.internal.ApacheHttpClient which taps the connectionManager and closes idle connections.  Fixes #1080  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Pass PipelineOptions to createWriter in Sinks.  ----Release Notes---- [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=90175467
Use supplier to pass rules to exclude around AndroidBinary  Summary: This will allow to pass `rulesToExclude` to `AndroidBinaryGraphEnhancer` from `AndroidInstrumentationApkDescription` as a supplier which will be used in the following changes to avoid the instantiation the whole set.  Reviewed By: jtorkkola  shipit-source-id: 6a39074075
Rename CorsConfigurationMapping to UrlBasedCorsConfigurationSource  Issue: SPR-13192
Add annotation output of the abi target to the source folders  Summary: Add annotation output path of the abi target (if exists) to the source folders so that intellij can find the generated source code.  Reviewed By: asp2insp  fbshipit-source-id: b0b7899c8d
Apply slop correctly if phrase query is wrapped in a filtered query.  If a phrase query is wrapped in a filtered query due to type filtering slop was not applied correctly. Also if the default field required a type filter the filter was not applied.  Closes #4356
Account for inner classes in test filtering  Summary: Test filtering does not work if you ask the test runner to run something like com.facebook.buck.rules.CachingBuildEngineTest$OtherTests  Test Plan: manual  Reviewed By: aiked  fbshipit-source-id: 9051ecf
Useful iterator util fromEnd
Fix by Sorel Johann to Indexes and SQL engine
Copy user metadata on ORC rewrite in Raptor connector
java/com/google/common: CL generated with data from dead-code analysis using //devtools/scythe:remove_dead_code ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=68103937
2.x: Add empty source clauses to javadocs of combineLatest operators accepting unspecified number of sources. This commit resolves #5412 (#5413)
Add isLinked method to ResolvedJavaType
Replace ResolvedJavaType.isFinal with more meaningful and correct isLeaf
Polishing  Issue: SPR-10469
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=55110 Small performance improvements Patch provided by Adrian Nistor
Migrated the beam-sdks-java-io-kinesis module to TestPipeline as a JUnit rule.
Mapping updates on objects should propagate `include_an_all`. #20051  Today you can't update `include_an_all` on an existing object. The bug affects 2.x too.
WW-4165 Checks if dynamic attributes don't overlap tag attributes This can be done only in a component as when dynamic attributes are set by a container on the tag, the component wasn't instantiated yet - it will be created in doStartTag method which is called after all attributes were set
bug 9154: Update addVirtualMachineIntoNetwork to accept routers as parameter
doh - added the correct headers
TraceRA: handle ShadowedRegisterValue correctly.
make entries in diagnostics zip file have relative path names
java thrift: create src.zip parent directory before building.  Test Plan: We already have an integration test for this, but it can't run since we don't have thrift on laptops.
Removed unused imports
Issue #2137: Make test for FileTabCharacter locale and OS independent
HIVE-8685 DDL operations in WebHCat set proxy user to null in unsecure mode (Eugene Koifman, reviewed by Thejas M Nair)
Include current date and time in Chrome trace filename  Summary: Does what it says on the tin.  Test Plan: Unit test included. Ran 'buck project', confirmed trace file had expected format.
STORM-1017: Ignore ignoreZkOffsets for trident.
Moved some of the http tests to jetty to avoid online lookup as it failis sporatic on some of the TC servers.
Fix some failing tests. No regression in Tomcat/Jasper, just need to take account of changes in test framework.
Shutdown and release log files, and bad collector report file.
tell the PendingMessageCursor how many messages you want - for more efficent polling from store
Fix robolectric res_directories paths.  Summary: The RobolectricTest rule was using PathSourcePath.toString to construct the paths list that got passed to the runner. The way the string was constructed ended up depending on whether the ProjectFileSystem rootPath was terminated with a slash or not. The tests didn't catch this because they were using a FakeProjectFilesystem with an empty root path. The fix is to have RobolectricTest use the resolver to convert a SourcePath to a Path and then a String.  Test Plan: build buck, run robolectric tests, make sure they pass.
Cleaning up interceptors in oauth and oidc
[FLINK-5345] [core] Migrate various cleanup calls to concurrency-safe directory deletion
Set heap base and lower thread-local load/store to compressible nodes in single-threaded mode
Error prone fixes  Summary: Activate error prone on Buck by adding these lines to .buckconfig:  ``` [tools]   javac_jar = third-party/error_prone_ant-2.0.15.jar   compiler_class_name = com.google.errorprone.ErrorProneJavaCompiler [java]   extra_arguments = "-Xep:OptionalEquality:OFF" ```  Put `error_prone_ant-2.0.15.jar` to `third-party` directory, run `buck build buck` and fix the problem flagged by error prone. Closes https://github.com/facebook/buck/pull/1043  Reviewed By: k21  fbshipit-source-id: 7c99e6b
GROOVY-7134: Fix potential NPE and reorder tests for faster execution
Document guideline to design TruffleLanguage with language-agnostic initialization  A TruffleLanguage should provide a language-agnostic interface to be able to be usable in multi-language environments. Language-specific front-ends or launchers, for instance, emulating existing implementations, should be realized externally to the PolyglotEngine.  This change fixes also minor issues in existing comments.  Co-Author: Jaroslav Tulach <jaroslav.tulach@oracle.com> Signed-off-by: Stefan Marr <git@stefan-marr.de>
[streaming] Jobgraphbuilder connect update with partitioning
Change RawTargetNode to use UnconfiguredBuildTarget  Summary: This class doesn't require target configuration.  Reviewed By: bobyangyf  fbshipit-source-id: 749852f8e1
Fixed a NPE issue which could be thrown in IndexHits#size(), more specifically CombinedIndexHits#size()
DRILL-1898: Add compare_to function for boolean type
SyncedFlushResponse to implement ToXContentObject (#31155)  The response currently implements ToXContentFragment although the only time it's used it is supposed to print out a complete object rather than a fragment. Note that this is the client version of the response, used only in the high-level client.
[changed] TexturePacker, made image index require an underscore (eg image_1.png).
Fixed the bug in allocator where cluster was added to avoid set as pod
Moved EigenSeedgenerator plus test into spectral package because it is only used by SpectralKMeansDriver.
HIVE-7314 : Wrong results of UDF when hive.cache.expr.evaluation is set (Navis reviewed by Ashutosh Chauhan)
Introduce an option to make Sulong only parse a file and not execute it
Thirdparty tests go in the thirdparty package   r5641
ensure backup metadata is cleaned up for service matches
added unit test based on user forum reported issue
Adjust serialization versions after backport   Relates #29533
Prevent possible NPE (from the testbeans branch, but unrelated).
Expand debug logging for authentication / realms (elastic/x-pack-elasticsearch#641)  Users currently have difficulty diagnosing authentication failures. Some logging messages mislead them, and in other cases there are unexpected behaviours that are not logged at all. These additional DEBUG log messages and change some existing messages in an attempt to alleviate that problem.  Original commit: elastic/x-pack-elasticsearch@c6ea98b038c1d0ca2b2ae4eae93497fcb848ff0b
SPR-9498: don't make assumptions about equality if ConversionService has failed  The failure of the conversion service is not fatal, but the check that was in there (line 248) was inadequate to detect the cases that could already be handled by the default property editors.  This code path was also not tested anywhere in spring-beans tests until now.
Fix suite scope random initializaation (#37163)  The initialization of a suite scope cluster had some sideffects on subsequent runs which causes issues when tests must be reproduced. This moves the suite scope initialization to a privte random context.  Closes #36202
Use UTF-8 as the default encoding
Revert "Implement SessionFactoryImplementor in SF proxies"  This reverts commit 08ccd19c76a71be3edf98f1a7f62cdd73ae98c9b.  Issue: SPR-8469
Make LocalPartitionGenerator implement PartitionFunction
Closes #4129, added Controllers#getListeners()
More detailed description of the expected behavior when evaluating interactive and non-interactive sources
Make tests work with multiple nodes.  Original commit: elastic/x-pack-elasticsearch@68004e1d6c7ba885632e18981d1a6a5912aa8308
SL: repeating node should implement SLStatementNode for a proper toString implementation.
Use protected constructors in abstract classes. #1555  Fixes `NonProtectedConstructorInAbstractClass` inspection violations.  Description: >Reports constructors in abstract classes that are not declared protected, package-protected or private.
move GEP construction into the facade
Do not inline into methods that need a Graal replacement in the new partial evaluator.
bug 10579: disable pool vm sync and disable hostTrack for XenServer,  status 10579: resolved fixed  reviewed-by: alex  Conflicts:      core/src/com/cloud/hypervisor/xen/resource/CitrixResourceBase.java
More Javadoc based on community feed back
Remove deprecated methods in SimpleQueryStringBuilder (#36341)  The `useAllFields`methods have already been deprecated in 6.0 and are save to remove in 7.0.
Some Args extend AbstractDescriptionArg  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 72531cc
Helper method to enable `dir` cache in an integration test.  Test Plan: buck test --all
Moved tint logic from Skin to tint(Color) on each drawable class.  #2705
Make the version of the remote node accessible on a transport channel (#23019)  This commit adds a new method to the TransportChannel that provides access to the version of the remote node that the response is being sent on and that the request came from. This is helpful for serialization of data attached as headers.
Change return type and add nullable check for DepsAwareExecutor  Summary: We should return more specific ImmutableList and check for nonNull in DepsAwareTask.getStatus  Reviewed By: styurin, ttsugriy  fbshipit-source-id: c22dc24784
simplified NodeEventListener implementations by having all events routed to a single method by default
Revised indexer implementation  Issue: SPR-11890
Add encoding for the default action in FormTag  Issue: SPR-11426
Fixed bug on FLATTEN and LIMIT
SimpleIdProvider zap page before releasing page  This is something that the real freelist already does and we rely on this behavior.
Cleanup of grouping in the dump.  Added a "Truffle::" prefix for all truffle dumps, and removed the "callRoot()" group in the Graal dump (for Truffle compilations).
DispatcherServlet and ServletWrapping/ForwardingController accept any HTTP method by default  Issue: SPR-4799
codec-http2: Mark requests as chunked in Http2ServerDowngrader  Motivation:  Http2ServerDowngrader doesn't mark chunked requests as chunked, even though the natural conversion from http/2 requests to http/1.1 requests is to chunked ones.  Modifications:  Mark requests that aren't already complete as chunked.  Result:  Requests will be chunked, and can later be aggregated if necessary.
Remove unused SourcePathResolver from CxxInferCapture  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: dfa27b7
Revert "Revert "Make DirectHeaderMap use relative paths""  Summary: This reverts commit a1eabbd300fefa83d7f061b592ee1a7aa020dbda.  Original commit doesn't seem to actually break header map lookups, the ndk just has a bad clang.  Reviewed By: ttsugriy  fbshipit-source-id: e4ff698055
Improve error if Indices Permission is too complex (elastic/x-pack-elasticsearch#4239)  If a user has roles that grant access to a large number of disparate index patterns, then the resulting Automaton can become large and too costly to determinise. This happens rarely, and is usually a sign of a poorly implemented security model, so we have no immediate plans to change the implementation. However the resulting error message is not clear and does not provide sufficient information for users to resolve the underlying problem.  This commit catches the underlying exception and provides a more specific error message, with DEBUG logging of the offending index patterns.  Original commit: elastic/x-pack-elasticsearch@532be70efcde63df8f96d62bce343a21662c2278
Add arrayKlassOffset field to HotSpotVMConfig.
Genrule: Remove unused SourcePathResolver  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 47ca111
JavaBinary: Remove unused SourcePathResolver  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: b13c299
Update testers to recognize that null may be a restricted element
UCDetector clean-up  - Remove unused code  - Use final where appropriate
clean up collections and singleton to prevent serialization issues
Close Index API should force a flush if a sync is needed (#37961)  This commit changes the TransportVerifyShardBeforeCloseAction so that it issues a  forced flush, forcing the translog and the Lucene commit to contain the same max seq  number and global checkpoint in the case the Translog contains operations that were  not written in the IndexWriter (like a Delete that touches a non existing doc). This way  the assertion added in #37426 won't trip.  Related to #33888
Remove bogus DataSource test from JpaTransactionManagerTests
Rename NullableBigintState to NullableLongState
[fixed] license headers for jogl backend
[scene2d.ui] Changed widgets to use Actor#hasKeyboardFocus.
renamed qa package o.e.plugin.ingest to o.e.ingest  This way InternalTemplateService constructor can be set back to package private visibility
Show localfallback stats in simplified console output  Summary: Everyone should see fallback stats because it may mean something is broken in RE.  Reviewed By: jeffdunn  fbshipit-source-id: b7173ebda5
#113 Add missing license header
Use SystemPropertyUtil to access system properties  Motivation:  We should use SystemPropertyUtil to access system properties and so always handle SecurityExceptions.  Modifications:  Use SystemPropertyUtil everywhere.  Result:  Better and consist handling of SecurityException.
Make round() return NaN when input is NaN  This was a regression in a recent change: 54eeef93
Remove Beta annotations.  Summary: We don't really take them into consideration.  Test Plan: CI  Reviewed By: bolinfest  fbshipit-source-id: 2c7d07a
Add ValuePositionProcedure and corresponding forEach methods.
DefaultJavaLibraryBuilder: Bring sanity to classesToRemoveFromJar  Summary: `classesToRemoveFromJar` existed both in `JavacOptions` and as a separate field in `DefaultJavaLibrary`. Only the one in `JavacOptions` was doing anything. It doesn't look like anything was broken by this (anything that set the field did so by copying the value from `JavacOptions`), but it certainly was confusing.  This commit makes the field the definitive source.  Test Plan: Existing `DefaultJavaLibraryIntegrationTest` and `CalculateAbiFromSourceIntegrationTest`.  Reviewed By: dreiss  fbshipit-source-id: 6ad49d6
Move indexMap to a more logical location. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=76448806
Saml validation now forcing service match
Add component documentation.
ad more info when rejecting execution
Revert " STORM-586: TridentKafkaEmitter should catch updateOffsetException."  This reverts commit 65e9f0c814b2cddc772880042259b66194fd6fb7.
updated docs; removed abstract component annotation
Use newConcurrentHashSet and newIdentityHashSet
Remove References to Instant#now in the DirectRunner  The DirectRunner should use exclusively the configured clock to determine the processing time.
CAS-1474: Removed unneeded prop from handler.
Add bufferOwned to IndexBufferObject and VertexBufferObjectWithVAO to allow externally managed buffers like other classes allow.
added transaction state tostring methods for debugging
KAFKA-3864: make field.get return field's default value when needed  And not the containing struct's default value.  The contribution is my original work and that I license the work to the project under the project's open source license.  ewencp  Author: Rollulus <roelboel@xs4all.nl>  Reviewers: Ewen Cheslack-Postava <ewen@confluent.io>  Closes #1528 from rollulus/kafka-3864
Expose JoinFilterFunctionCompiler cache stats via JMX
Revised NoSuchBeanDefinitionException message for proper array class names  Issue: SPR-14595
Transport: Clarifying the role of AbstractBootstrap#bind()  This small changeset clarifies the role of AbstractBootstrap#bind(), especially when not used in a ServerBoostrap context.
[FLINK-5327] Remove IOException from StateObject::getStateSize  This closes #2993
Move Argument creation to superclass
Add side input assertions to ExecutableStageMatcher
DefaultJavaLibrary: Pass in ZipArchiveDependencySupplier rather than creating it  Summary: I'm working toward changing Java compilation so that we can create the source ABI partway through compilation and allow a module's dependents to start compiling while `javac` finishes creating the full JAR for the module.  With that available, library compilation might be started by either the `CalculateAbiFromSource` rule or the `DefaultJavaLibrary` one, depending on whether source ABIs are enabled. If we left it up to the rule to create the supplier (and, say, forgot to do so), dep file keys would cease to function. Factoring it out prevents us from getting that wrong. (Or, more accurately, is the result of having gotten it wrong and debugged it for longer than I should have.)  Test Plan: CI  Reviewed By: asp2insp  fbshipit-source-id: 7953a3d
moved validation annotations to the parent
Use Supplier for StreamInput#readOptionalStreamable  This commit changes the signature of StreamInput#readOptionalStreamable to accept a Supplier to create new streamables rather than requiring callers to construct new instances. This has the advantage of avoiding an allocation in cases when the stream indicates the resulting streamable is null
[chromedriver] Expose chromedriver "execute CDP command" command
Fix handling of missing columns in Parquet Reader
Add removeIfExists() method to DefaultChannelPipeline  Motivation:  Sometimes it is very convenient to remove the handler from pipeline without throwing the exception in case those handler doesn't exist in the pipeline.  Modification:  Added 3 overloaded methods to DefaultChannelPipeline, but not added to ChannelHandler due to back compatibility.  Result:  Fixes #7662
tokenMetadata should be updated before removing obsolete pending ranges, and unset bootstrapped flag when decommission is complete.  patch by Jaakko Laine and jbellis for CASSANDRA-435
Use UnconfiguredBuildTargetFactory to create build targets in RuleKeyDivergenceRunnerFactory  Summary: Using `EmptyTargetConfiguration` as a placeholder, will be fixed later.  Reviewed By: bobyangyf  fbshipit-source-id: b05ba41890
Remove GraphBuilderContext.addWithInputs.  GraphBuilderContext.addWithInputs() and GraphBuilderContext.add() are equivalent. They both call GraphBuilderTool.append(). GraphBuilderContext.addWithInputs() used to call GraphBuilderTool.recursiveAppend() but that was removed in 48d9d363d0e78dad51d1b5a6c87ddbfe6df4cece when the semantic of append() changed and it was made recursive and  recursiveAppend() was removed.
Fix handling of fractional byte size value settings (#37172)  This commit addresses an issue when setting a byte size value setting using a value that has a fractional component when converted to its string representation. For example, trying to set a byte size value setting to a value of 1536 bytes is problematic because internally this is converted to the string "1.5k". When we go to get this setting, we try to parse "1.5k" back to a byte size value, which does not support fractional values. The problem is that internally we are relying on a method which loses the unit when doing the string conversion. Instead, we are going to use a method that does not lose the unit and therefore we can roundtrip from the byte size value to the string and back to the byte size value.
Ensure subclasses use the readResolve() method
Ignore script fields when size is 0 (#31917)  This change adds a check so that when parsing the search source, script fields are  ignored when the requested search result size is 0. This helps with e.g. clients like  Kibana that sends a list of script fields that they may need for convenience, but they don't require any hits. Before this change, user sometimes ran into confusing behaviour,  e.g. the script compilation limit to breaking although no hits were requested.  Closes #31824
improvement for CAMEL-3 so that boolean b = in.getHeader("foo", boolean.class); does not throw a NPE for a missing header; instead false is returned for missing values
Sorting out imports.
Removed need for state after on load indexed, and new bytecodes.
WW-2623 Struts 2.1.3 omnibus ticket o optimzed imports
Make MultiTermQueryBuilder an interface again  This PR is against the query-refactoring branch.  Closes #12074
Move tests into *.test packages.
Fix a few typos  Minor changes to fix typos. Small adjustment to add a couple commas.
Remove type from BlockEncoding
Remove unused StepContext name methods
NaaS: Remove IsServiceProvider() functions  If the element is the service provider for this network, then can be tell from network offering. We don't need these functions in the interface.
Update license header for recently modified files  Issue: SPR-7763, SPR-10140, SPR-10132, SPR-10093, SPR-10103
CLOUDSTACK-1332: Pass IPv6 DNS to VR
rename getDefaultToken -> getInitialToken patch by jbellis; reviewed by Jun Rao for CASSANDRA-65
updated test cases
Update xmlsecurity tests to use the junit4 based camel test support. Fixed minor warnings.
Autowiring rejects self references to a factory method on the same bean as well  Issue: SPR-12018
Add more javadocs
minor mbean error handling improvements; slightly clearer uber test names
Make TargetNode implement HasBuildTarget.  Summary: So that we can use the convenient HasBuildTarget.TO_TARGET function.  Test Plan: buck test --all
Remove unnecessarily general generic type bound  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 1bbc81a
PemPrivateKey.toPem(...) should throw IllegalArgumentException when Pâ¦ (#8253)  * PemPrivateKey.toPem(...) should throw IllegalArgumentException when PrivateKey which does not support encoding is used.  Motivation:  At the moment when a PrivateKey is used that does not support encoding we throw a NPE when trying to convert the key. We should better throw an IllegalArgumentException with the details about what key we tried to encode.  Modifications:  - Check if PrivateKey.getEncoded() returns null and if so throw an IllegalArgumentException - Add unit test.  Result:  Better handling of non-supported PrivateKey implementations.
CAS-1249  update code to use ClientInfo and ClientInfoHodler which already include support for using an alternative header.  This makes it consistent with the other code.
[inlining] no need for the suspense about return value
Index and remote + tx: fixed bug reported by Curtis in ML
[CAMEL-13040] Move modules to core/ folder
Avoid running on CI as its not reliable to run there
Handle bad STOMP messages in StompSubProtocolHandler  Issue: SPR-11277
TraceRA: rename LinearScanOptimizeSpillPositionPhase -> TraceLinearScanOptimizeSpillPositionPhase.
Add getAccessStamp() to AbstractWriteNode.
Use AbstractReferenceCounted to clean up the codes for codec-memcache  Motivation:  Some duplicated methods in message types of codec-memcache can be cleaned using AbstractReferenceCounted.  Modifications:  Use AbstractReferenceCounted to avoid duplicated methods.  Result:  Duplicated methods are cleaned.
Temporary workaround for JDK 8 test compilation/execution problem  Issue: SPR-9639
Issue #1555: Fix various typos  Fixes some `SpellCheckingInspection` inspection violations.  Description: >Spellchecker inspection helps locate typos and misspelling in your code, comments and literals.
Use requireRule in AppleTestDescription.  Summary: Use requireRule in AppleTestDescription to get the test host.  Test Plan: CI  Reviewed By: marcinkosiba  fb-gh-sync-id: 2b16556 fbshipit-source-id: 2b16556
Updated license headers
Refine Jackson canEncode() / canDecode() implementation  This commit refine Jackson canEncode() / canDecode() implementation by using ObjectMapper canSerialize() / canDeserialize() methods.  Issue: SPR-14748
Short term fix for UNION ordering expectation
properly deal with overriding parent's tearDown method  Original commit: elastic/x-pack-elasticsearch@0edd4b1e2061e34da867896eed93d6480b372669
Make NioByteUnsafe.read() respect ChannelConfig.maxMessagesPerRead and adjust the default from 16 to 1  - Fixes #1486 - Decreased the default from 16 to 1 because unnecessary extra read on req-res protocols results in lower throughput due to extra syscalls.
rename CheckCastElimination option to ConditionalElimination
adding missing finals
HHH-6488 Renaming JandexHelper#getValkueAsEnum to JandexHelper#getEnumValue  Also adding a test to JandexHelperTest which tests retrieving a unknown annotation parameter
Allow libraries to be CxxPreprocessorDeps for stubs files  Summary: Changes the vanilla HaskellLibrary instance to also be a CppPreprocessorDep. Pulls in the stubs directory generated from the `HaskellCompilerRule` associated with the library. I more-or-less just copied what the `PrebuiltHaskellLibrary` was doing and generated a `HaskellCompilerRule` to pull the stubs directory.  Reviewed By: andrewjcg  fbshipit-source-id: f5d47cd
GROOVY-8604: Cache the parameterized type for better performance(closes #721)
Make unused Loads simplify in more cases  If they require a check, just replace them with this check.
Consistent use of LinkedHashSet for interfaces (since interface order may matter in subtle cases)
Don't convert source paths to strings when ordering.  Test Plan: CI  Reviewed By: beefon  fb-gh-sync-id: e6bcd11
Allow for reuse of key visitor classes in tooling  Based on https://github.com/SpringSource/spring-framework/pull/263
Plugins: Allow for plugins to implement onModule method that will be automatically injected with the relevant module type, closes #1613.
Issue when removed file attempted to be restored with error was fixed.
Lock node on deletion
make this less syntactically confusing
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=48424 Based on a patch by Ivan Ensure that the ObjectNames for the Connectors are always generated using the same method
Introduce mayNullCheckSkipConversion method in ConvertNode interface. Move address lowering after fixed read phase.
Started refctoring the remaining XenServer resources     - Just cleaning the formating
GROOVY-4818: JsonSlurper's methods are package private
Update "configuration changed" message  Summary: The current message indicates that buckd is restarting when it really isn't. Instead, let people know that the caches are being dropped and that builds will be slower.  Reviewed By: cjhopman  fbshipit-source-id: b97d243b5d
Cache objects for out of process build  Summary: Instead of creating and destroying these objects, we may cache them. Also, tune the number of outer processes to be CORES/4: these processes are multithreaded themselves and according to my benchmarks, the fastest mode for 8 core machine is when we have 2 outer processes for javac. The results are:     buck build buck -c java.location=IN_PROCESS    takes 1m 5s     buck build buck -c java.location=OUT_OF_PROCESS    takes 1m 22s  Test Plan: CI  Reviewed By: marcinkosiba  fbshipit-source-id: 121312e
Deprecate cancellation and task control things in org.neo4j.helpers.
moved distance measures to utils class, as they will be generally useful, even in some non-clustering based code
Resolve ${} placeholders in @ImportResource  Update ConfigurationClassParser to resolve any ${} placeholders from @ImportResource values.  Issue: SPR-10686
TIKA-314: Initial support for JPEG EXIF metadata extraction  Add license headers, generics
Wrote more information about how you should NOT mirror relationships in opposite directions because it somehow would increase performance.
add diagram for new takeUntil variant and a few other related javadoc tweaks and remove a troublesome unicode ligature from SpscArrayQueue.java that's causing a compiler warning
Fixed issue: NETTY-308 ChunkedInput implementations send only the first chunk
java_test: don't cache classpath argsfile using library rule key  Summary: There were a few issues caching this: 1) Since `JavaTest` is a child of `DefaultJavaLibrary`, it was using    the latter's rule-key and input-based-rule-key.  This is a problem    since the rule keys for `DefaultJavaLibrary` are explicitly non-    transitive, whereas the classpath argsfile includes the all the transitive    libs.  This means we could get a cache hit via the input-based-rule-key    and pull down an argsfile that doesn't take into account updates to    the transitive classpath. 2) The paths the JARs under the android SDK are absolute, so we don't    want to cache these.  Also, with cross-cell support incoming, that'll    likely be another source of absolute paths.  Since generating the classpath file is relatively cheap, this diff changes `JavaTest` to use post-build-steps instead, which run even on cache hits, meaning we don't have to cache the classpath argsfile.  Test Plan: Ran a `java_test`, changed a transitive dependency and verified it was reflected in the classpath argsfile, even when we get a cache hit.
ISSUE-432 add option for --itemsFile from Hui
Remove naive verification of tuple size  This verification will not work. Think of spaces or escaped ? I think it's easier for users to parse the SQLException  Author: Moritz Schubotz <github@ckurs.de>  Closes #116 from physikerwelt/patch-1 and squashes the following commits:  69a3d2a [Moritz Schubotz] Remove associated test as well b51b4f0 [Moritz Schubotz] Remove naive verification of tuple size
Spark tests: force spark runner  They were somehow using the DirectRunner before.
add import for BaseTest so tool tests compile. it all appears to compile and tool tests pass.
Removed unused imports
CAS-1475: removed dynamic random id from shib id gen to allow for persistence.
Polishing test annotation declarations and JavaDoc.
Update legacy test stuff too.
Add more variants of ByteBufAllocator.ioBuffer() / Update Javadoc
add shell bolt pending limit in fresh branch
Add ClientRequest.attribute(String)  This commit adds the attribute(String) convenience method to the ClientRequest class. It also adapts the Basic Authentication filter to use it.
convert existing singleton objects into Spring loadable bean components
Switch to using a varargs syntax in CommandRunner.  Summary: We use the array syntax for the final argument for CommandRunner.runCommand. If we use the varargs syntax, calling the method becomes cleaner.  Test Plan: buck test --all
2.x: Single.subscribe() to report isDisposed() true on success/error (#5163)
HOTFIX: ChangeLoggingKeyValueStore.name() returns null  This class doesn't need to override this method as it is handled appropriately by the super class  Author: Damian Guy <damian.guy@gmail.com>  Reviewers: Guozhang Wang <wangguoz@gmail.com>  Closes #2397 from dguy/hotfix-npe-state-store
Add license headers.  r1471
Remove redundant overrides
Make phi_convict_threshold a float. Patch by Harish Doddi, reviewed by brandonwilliams for CASSANDRA3910
Merging capabilities to options should be fluent
fix broadcastAddress and fix for Ec2MultiRegionSnitch.reconnect patch by Vijay; reviewed by Brandon Williams for CASSANDRA-3835
fix for: https://issues.apache.org/jira/browse/AMQ-3929
[BEAM-5945] add reverse
Removed a strange comment and renamed the MapUtil methods to better names
replace valueOf with parse patch by Dave Brosius; reviewed by jbellis for CASSANDRA-1864
Migrate SelectorKey to use BuildTarget  Summary: This is a part in a series of changes to migrate configuration targets to use `BuildTarget`.  Reviewed By: bobyangyf  shipit-source-id: aa55d25b25
cxx_genrule: support versioning  Summary: Few changes to support versioning: - Add version tag - Use `withAppendedFlavors()` instead of `withFlavors()`.  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: dd1dda7
Added more debug info to thrift http request workflow  Summary: Two of the possible failures are: - during connecting - while downloading the artifact  We add more logs in case there's a failure in one of those situations.  Test Plan: CI  fbshipit-source-id: 7956702
WW-3562 - FileUploadInterceptor: File not uploaded when file is empty (0 bytes)
Aggregations: Sibling Pipeline Aggregations can now be nested in SingleBucketAggregations  Closes #11379
Updated to provide the local id for the tx Start entry.
Get color diagnostic option directly from passed in tool  Summary: Instead of passing it down via preprocessor/compiler delegate, into ToolCommand, into Step, just get the args from the tool, which is already passed into the step.  Test Plan: CI  Reviewed By: beefon  fbshipit-source-id: 18d6399
Add attributes to WebFlux WebSocketSession  Issue: SPR-16212
Mark failing Marionette tests as Ignored or NotYetImplemented
Fixed a race condition problem. Also lowered amount of data being streamed in one test to allow to be executed on a lower-end machine
Log unresolved exceptions at error level
Lower log level for ResponseStatusException  Issue: SPR-16049
fix the typo in the Traffic example java docs.  ----Release Notes----  [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=90761527
[BEAM-316] Add file scheme support in TextIO
Polished javadoc and added note about done UoW from PollingConsumer
Add BuckCellManager.getCells()  Summary: Provide API to list buck's known cells.  Reviewed By: IanChilds  fbshipit-source-id: 079f1fb74f
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
Cleaning up interceptors in oauth and oidc
Honor time delay when retrying recoveries  In some places we want to delay the start of a shard recovery because the source node is not ready to receive. At the moment the retry logic ignores the time delay parameter (`retryAfter`) causing a busy waiting like scenario. This is fixed in this commit.  Closes #6226
clean up attribute release policy for R&S
Implement vector abs.
Revert "mute failing filerealm hash caching tests (#42304)"  This reverts commit 8907dc9598667a1fa29be0ba22c7030ebee1101b.
CliTool: Do not leave invalid lines in roles file  Removing all roles from a user result in an invalid line left in the roles file. This commit simply removes the user from the roles file in that case.  Original commit: elastic/x-pack-elasticsearch@c1f4a961fded11aeab1ddedf6d2b4df67a037fec
Fix of compilation failures.
Disable artifact cache during project generation.  Test Plan: CI
Revert "One call target can only take up 20% of splitting budget."  This reverts commit 69176b7b59ce35b8fb46fc53b1964bdb9ea6d5f3.
Change JavaBinary blacklist to use Pattern.  Summary: Alter JavaBinary to use Pattern instead of String for its blacklist. Pattern was missing from the RuleKeyBuilder so I added it there. It's just the toString representation of the Pattern.  Since the Set is ImmutableSet it will preserve the ordering each time.  Test Plan: * CI  Reviewed By: marcinkosiba  fbshipit-source-id: 36438fe
Improvements to the Stamp infrastructure. New methods Stamp#improveWith, Stamp#tryImproveWith, Stamp#isIllegal.
Polishing  Issue: SPR-11291
Make some methods publicly accessible  Summary: These methods will be required by further refactoring to better support dSYMs  Test Plan: CI  Reviewed By: Coneko  fb-gh-sync-id: cd1a0bf fbshipit-source-id: cd1a0bf
Fixed WebExtensions installation  Fixed installation of new firefox webextension built with new WebExtension API i.e. the one which contains manifest.json instead of install.rdf  Fixes #4093  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Make Javac a Tool  Summary: Because it is a tool, you see.  Test Plan: buck test --all
Add a powershell escaper function  Summary: This adds a function to escape arguments to be passed to window's powershell.  Future diffs will transition uses of `escapeAsBashString` to use a platform-aware variant that will use this on windows.  Test Plan: - manually tested several combinations in power shell - added some test cases
Issue #4165: Split and Organize Checkstyle inputs by Test for ExplicitInitializationCheckTest
Move classes from org.apache to org.apache.tomcat
CAMEL-4258 CAMEL-4259 enable the tests after upgrade to CXF 2.4.2
Rename query.initial-hash-partitions property  Rename the query.initial-hash-partitions to query.hash-partition-count to match the session property name
MAHOUT-1258: Another shot at findbugs and checkstyle - removed unused imports
Strip isPrime benchmarks from Guava, since isPrime itself is @GoogleInternal. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=69012929
Remove unused imports idnetified by Eclipse
Minor: added timer sleep between concurrent tests
Prepend -Xlinker to linker flags in project generation.  Summary: Buck prepends -Xlinker to linker_flags during building. This makes project generation have the same behaviour.  Test Plan: CI
Fixed comments and allow the use of <connectionFactory> and <xaConnectionFactory> in xbean files.
Reduce the amount of javadoc warnings.
fix exception handling for QueryCommand  Summary: This used to be a catch all, which would suppress all backtraces. What's worse, not all exception have string messages, so this handler will actually fail when handling some kind of exceptions.  Instead, catch only the checked exceptions, and rethrow them as `HumanReadableExceptions`.  Test Plan: This internal failure now gives a relevant backtrace:    $ buck query '%Ss' ''  This query exception gives a nice message:    $ buck query 'deps(1,2,3)'  Reviewed By: aiked  fbshipit-source-id: 8b33d56
Adding error message when illegal file chosen as save file Fixed bug that could erase previous test plan files when "New" is selected.
Lookup.resolveGroup returns a Stream instead of List  Stream doesn't enforce any materialization of plan nodes
FreeMarkerView and ResourceBundle/XmlViewResolver can be initialized with ServletContext only (e.g. for testing)
Made the default threads 100 rather than 2 * available cores.
Deprecate InstanceListener, InstanceEvent and InstanceSupport prior to removal
Aapt2 support for android_prebuilt_aar and react_native_library (2nd try)  Summary: Both of these produce Android resources, so they must be able to supply aapt2_compile rules to work with aapt2.  ReactNativeLibraryGraphEnhancer being in a separate package means that Aapt2Compile and AAPT2_COMPILE_FLAVOR need to be public.  Unlike the first land attempt, in ReactNativeLibraryGraphEnhancer, we append the aapt2 flavor to the AndroidResource rule so that we don't get target collisions with different RN flavors.  Test Plan: CI. Built and ran FB4A with it.  fbshipit-source-id: c78f69d
Expand all types to produce a 64bit hash code
Make NoSuchBufferException message more useful
#! Make up session across searches and clicks
unregister mbean on flush.  patch by daishi; reviewed by jbellis for CASSANDRA-157
Change HashBasedTable to be backed by LinkedHashMaps so iteration order is deterministic. ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=127625411
add kstem also to the static shared token filters
Mapping updates on objects should propagate `include_an_all`. #20051  Today you can't update `include_an_all` on an existing object. The bug affects 2.x too.
Switch to ES shaded Preconditions instead of guava
Watcher: Allow more tags for HTML sanitizer in tables (elastic/elasticsearch#2350)  This allows the colspan/rowspan attr on td/tr as well as border/cellpadding attrs on table elements.  Original commit: elastic/x-pack-elasticsearch@e0b989f0ac23ce17c99d7616d4b3bd2e585116a9
Refactor duo config for authN
Remove deprecated code
Make the list of encoders available where they are needed
Expose Obj-C Generated Header  Summary: This diff introduces a new build rule to create the Swift Generated Obj-C Header.  Test Plan: Tested in future integration test  Reviewed By: dinhviethoa  fbshipit-source-id: b044614
Fix redundant or missing checks and other inconsistencies in ByteBuf impls (#9119)   Motivation  There are a few minor inconsistencies / redundant operations in the ByteBuf implementations which would be good to fix.  Modifications  - Unnecessary ByteBuffer.duplicate() performed in CompositeByteBuf.nioBuffer(int,int) - Add missing checkIndex(...) check to ReadOnlyByteBufferBuf.nioBuffer(int,int) - Remove duplicate bounds check in ReadOnlyByteBufferBuf.getBytes(int,byte[],int,int) - Omit redundant bounds check in UnpooledHeapByteBuf.getBytes(int,ByteBuffer)  Result  More consistency and slightly less overhead
Ticket metadata abstracted into methods
Use shard as a name of lucene index part  Update storage layout name to reuse agreed terminology.
Disable profiling in Parser.getTargetNodeRawAttributes  Summary: This is always called with disabled profiling.  Reviewed By: bobyangyf  fbshipit-source-id: 00d681b93f
Added licence header
Fix ResourceUrlProvider path check in getForRequestUrl  Prior to this change, getForRequestUrl implementation would only work for applications with a non-empty servlet path. So web applications mapped to "/" would trigger a IllegalStateException while checking the current request against the request path within the current mapping.  This change relaxes this and only check that the path within mapping is within the request URL.  Issue: SPR-12158
Suppressing unchecked and serial warnings.
Add more split information to PrioritizedSplitRunner
SPR-6978 - Dispatcher fails to invoke handler method when request method conflicts with request path
Fixed some JavaDoc errors and better naming Patch by Graham Russell Part 3 https://github.com/apache/jmeter/pull/118
Cleanup: bulk removal of unused imports
use waitOnFuture more often
Add buck config option for ProcessTracker  Test Plan: Verify that ProcessTracker gets instantiated only when adding the buck config option:      [log]         process_tracker_enabled = True  Reviewed By: marcinkosiba  fbshipit-source-id: 4f2d90e
Replace uses of log4j with slf4j
Move TruffleStackTraceElement#{fillIn,getStackTrace} to TruffleStackTrace  * Where they logically belong.
[Minor] Use Java-style array declaration
Updated OProfiler. Added getContext API
CAMEL-8561: Better component docs summary of components - we use javadoc from the endpoint class instead of component so its in the same source file as @UriEndpoint.
Process monitor refresh interval setting  This commit converts the process monitor refresh interval setting "monitor.process.refresh_interval" to the new settings infrastructure.
further javadoc commenting
Remove isKeyed property of InProcess Bundles  The property of keyedness belongs to a PCollection. A BundleFactory propogates the key as far as possible, but does not track if a bundle is keyed.
Make Javac a Tool  Summary: Because it is a tool, you see.  Test Plan: buck test --all
Notify the listener immediately when added to SharedDiscoveryCoreClient
further modifications for this issue :  http://www.nabble.com/setBody%28el%28-%29%29-creates-null-body-tf4805396s22882.html#a13747750 to ensure that we don't ever accidentally create an OUT message when we don't want/need one
Remove unused method.  Test Plan: CI  Reviewed By: ruibm  fbshipit-source-id: d73c730
Expose struct function in extension files  Summary: This is needed to support common ways to abstract Python-like modules. This is also how skylib is exposing all of its fuctionality.  Test Plan: CI  Reviewed By: styurin  fbshipit-source-id: c457b24
Coder.structuralValue(T) should never throw  In the worst case, encoding to a byte array should never fail due to IO.
Plugins: Add ScriptService to dependencies available for plugin components
move default value wrapper into support package (rather then interceptor)
CAMEL-8687 Fixed the rfc5424 structured data issue in camel-syslog
change default behavior
HIVE-4954: PTFTranslator hardcodes ranking functions (Edward Capriolo via Brock Noland)
Rename flushAndWrite() to writeAndFlush()  - Related: #2066
Flink runner: specify checkpointTimeout  through PipelineOptions.
Add an option to set the stack size
Quote identifiers when formatting expressions  This is to avoid issues with identifiers that are also SQL keywords
Added license headers
Only allow rebalance operations to run if all shard store data is available  This commit prevents running rebalance operations if the store allocator is still fetching async shard / store data to prevent pre-mature rebalance decisions which need to be reverted once shard store data is available. This is typically happening on rolling restarts which can make those restarts extremely painful.  Closes #14387
AMQ-4122 - add log warning if lease will expire due to mal configuration
TIKA-1074: remove future proofing for InterruptedException
cxx: allow configuration shared library extension used for C/C++ platforms  Reviewed By: adamjernst, ttsugriy  fbshipit-source-id: c7900cd
Remove inaccurate Javadoc on Setting constructor  The 'Setting' constructor has some outdated Javadoc that suggested that it would automatically apply 'Property.NodeScope' if no scope is supplied, but no scope is added in that case.
Encapsulate posting to BuckEventBus in ExecutionContext...  Summary: ...where it makes sense. There's still a bunch of direct calls to `BuckEventBus.post`, but only where `ExecutionContext` is not available. Perhaps, I can send out a similar diff for `BuildContext`.  Test Plan: ant test
add serialized version ids
Implement read streaming in grpc client and test server  Summary: ^  Reviewed By: ttsugriy  fbshipit-source-id: 170f01eb37
Added quick test for boolean eval
Update Network.asGraph()'s edge value methods to be consistent with how they're defined in the interfaces. Update tests to fail with the old implementation.  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=130683572
Consistent exclusion of bridge methods in annotation post-processors (for Java 8 compatibility)  Issue: SPR-12187
Add "articles" setting to specify a list of stopword for the ElisionFilter.
Rename SimpleEdgesConnecting to EdgesConnecting to be consistent with our naming pattern for NetworkConnections (*NetworkConnections and *MultiNetworkConnections).  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=130551638
There was no need to introduce a thread local to avoid event recursion
Replace 1.0 with 0.10 in @since statements
[TEST] better test start and end messages  print when cleaning up also for SingleNodeTests distinguish between after suite and after test cleanup
Update Javadoc of AsyncHandlerInterceptor  Issue: SPR-12608, SPR-12720
more tests  [git-p4: depot-paths = "//depot/code/antlr4/main/": change = 9103]
Add Application#getListener()
Use standard ASF license header
Fixed mistakes in Javadoc comments
merge from 0.8
UDC only sends aggregate store file size
TIKA-416: Out-of-process text extraction  More javadocs and some cleanup.
https://issues.apache.org/jira/browse/AMQ-3973 - data.db not calculated in store size
Added deviceId parameter to the NicResponse. This information can be useful for the user if he wants to see the order of the networks in his vm
Close page cursor when disposing the relationship cursor
WW-4710 Restrict access to HttpParameters.toMap
MAHOUT-1258: Another shot at findbugs and checkstyle - removed unused imports
CAMEL-13150: Add command "exchangeProperty" for dateExpression in ExpressionBuilder (#2741)
Use standard ASF license header
encrypt oidc tokens support
More JDK8 api change fixes.
Added forceGetRaw to the RecordStore interface.
Changed the cached hashing algorithm for cached realms  Now the passwords are hashed in-memory using SHA2 by default (instead of original bcrypt). Also, it's now possible to configure the in-memory hashing algorithm.  Original commit: elastic/x-pack-elasticsearch@e2d1b3116be994cdfcf09b2ebe6de1d3254a2cf6
Polish Javadoc for ZoneIdEditor & TimeZoneEditor
tweak since versions
Correct ILM metadata minimum compatibility version (#40569)  The ILM metadata minimum compatibility version was not set correctly, which can cause issues in mixed-version clusters.
Migrate Executor-less Futures callback methods to the ones with an Executor, while applying MoreExecutors.directExecutor() for identical behavior.  For more information, see [] []  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=155174706
MINOR: JavaDoc improvements for RangeAssignor (#4079)
Clean up javadoc
Updates header with license
CAMEL-13102: Move camel-dataformat out of camel-core
Refactoring. Remove PACKAGE_NAME constant.
Change array and map agg tests to create correct block types
Make the lifetime of BuildInfoStoreManager longer than the CommandThreadManager  Summary: BuildRule futures can outlive the CachingBuildEngine, for various reasons (perhaps they ignore InterruptedException, for example).  This creates a problem when the CachingBuildEngine closes, and in turn closes its BuildInfoStores, since those long-lived futures can later attempt to write to the now-closed Store.  Fix this situation by making the BuildInfoStoreManager a long-lived object; placing it in CommandParams allows it to be easily propagated to the creation sites of CachingBuildEngines, and it naturally outlives the CommandThreadManager, which will reap all of the BuildRule futures when it shuts down.  Test Plan: RocksDBBuildInfoStore no longer segfaults on Ctrl-C  Reviewed By: marcinkosiba  fbshipit-source-id: 46617a9
test case for default authz strategy
Minor cleanup  Removes unused field in Protocol Server no longer extends Protocol, instead static imports needed methods from there DechunkingChannelBuffer.readAndThrowFailureResponse() no longer returns Throwable and the corresponding  usage is now gone
Fixed tests with durations on throttling and others
has_parent builder: exception message/param fix (#31182)  has_parent builder throws exception message that it expects a `type` while parser excepts `parent_type`
Anchor InstanceOf to branches  This allows the anchor to be optimized
Remove unused SourcePathResolver from AndroidManifest  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 09e36d4
made sure to use the class name as database name in distributed tests
Cleanup grouping AST classes
Lazily resolve the default exception CacheResolver  This is a rework of 314b069 that may still lead to issue if a Cacheable annotated bean is inspected on startup. Instead of resolving the default exception CacheResolver if a cache operation is parsed, we resolve it as late as possible (i.e. when an exception is thrown and the relevant exception cache needs to be resolved)  Issue: SPR-12850
Fix for https://issues.apache.org/activemq/browse/AMQ-1790
Minor cleanup.
CAMEL-7066 Supported to setting the proxy from camel-twitter uri
Fix default config file location in code to match usage elsewhere
added fix for CAMEL-1375
dont throw exceptions. return flags instead
Added Actor#firstAscendant.
[FLINK-5532] [streaming api] Make marker window assigners for aligned window ops non-extendable  Makes the TumblingAlignedProcessingTimeWindows and the SlidingAlignedProcessingTimeWindows final so that users cannot extend them.  This closes #3180
Fix build  Original commit: elastic/x-pack-elasticsearch@474e5e7a9a5adfc561f6719f4bca349ff7329b15
Truffle: simpler, more consistent toString for DirectCallNode subclasses.
Allow VM-specific lowering of FixedGuardNode
move cache classes to cassandra.cache package. patch by jbellis; reviewed by goffinet for CASSANDRA-688
Use datasource resolver for procedure graph database service.
Include Info.plist in generated Xcode projects  Summary: Add Info.plist in the generated Xcode file pbxproj (so Info.plist is shown in Xcode File Explorer)  Test Plan: Unit Test:  (In buck top directory)      buck test --all or       buck test -f ProjectGeneratorTest test/com/facebook/buck/apple
Synchronized between 4.1 and master (part 3)  Motivation:  4 and 5 were diverged long time ago and we recently reverted some of the early commits in master.  We must make sure 4.1 and master are not very different now.  Modification:  Fix found differences  Result:  4.1 and master got closer.
Truffle: further fixes to the new CallNode.
MarshallingView unwraps JAXBElement value for Marshaller.supports(Class) check  Issue: SPR-11827
minor javadoc improvements
Avoid missed signals on a default promise  Motivation:  Today when awaiting uninterruptibly on a default promise, a race condition can lead to a missed signal. Quite simply, the check for whether the condition holds is not made inside a lock before waiting. This means that the waiting thread can enter the wait after the promise has completed and will thus not be notified, thus missing the signal. This leads to the waiting thread to enter a timed wait that will only trip with the timeout elapses leading to unnecessarily long waits (imagine a connection timeout, and the waiting thread missed the signal that the connection is ready).  Modification:  This commit fixes this missed signal by checking the condition inside a lock. We also add a test that reliably fails without the non-racy condition check.  Result:  Timed uninterruptible waits on default promise will not race against the condition and possibly wait longer than necessary.
better method name, to correspond to addLast
Removed the useless imports of camel-core
Finished all merges and unit testing
Add segment attributes to the `_segments` API. (#26157)  This contains information about whether high compression was enabled for instance.  Closes #26130
Removed unused imports
AlexeiBarantsev: Moving ExecutableTest to a more appropriate package  r18082
Correctly throw IndexOutOfBoundsException when writerIndex < readerIndex  Motivation:  If someone invoke writeByte(), markWriterIndex(), readByte() in order first, and then invoke resetWriterIndex() should be throw a IndexOutOfBoundsException to obey the rule that the buffer declared "0 <= readerIndex <= writerIndex <= capacity".  Modification:  Changed the code writerIndex = markedWriterIndex; into writerIndex(markedWriterIndex); to make the check affect  Result: Throw IndexOutOfBoundsException if any invalid happened in resetWriterIndex.
an API-only option (doesn't make sense on the command line) that tells the ProxyHandler to assume it is being chained even if http.proxyHost is not set. This is useful for java 5 systems that use the new ProxySelector API instead of relying on old crappy system properties  r3524
[TEST] Improve HTTP support in TestClusters  This commit disalbes HTTP for all the suite and test scope tests since it's an unused / unneeded module which takes time to startup. This also uses a JVM private port range for HTTP ports to ensure there are no cross JVM conflicts.
Remove unflavoredNodes parameter in TargetGraph constructor.  Summary: TargetGraph is always created with a map mapping all unflavoured targets to a node with either that target, or a flavoured target based on it.  Test Plan: CI
Introduce mayNullCheckSkipConversion method in ConvertNode interface. Move address lowering after fixed read phase.
add internal origin to delete by query
Move StoreFile to same package as StoreType
Added JavaDoc for handler.codec.frame package.
HIVE-13902 : [Refactor] Minimize metastore jar dependencies on task nodes (Ashutosh Chauhan via Sergey Shelukhin)  Signed-off-by: Ashutosh Chauhan <hashutosh@apache.org>
Adjust to Streams.copy moving into elasticsearch-core (elastic/x-pack-elasticsearch#4263)  In https://github.com/elastic/elasticsearch/pull/29322 Streams.copy was moved into the elasticsearch-core project, this is the x-pack side of it.  Original commit: elastic/x-pack-elasticsearch@5803b8a04204e200b91e59018818509231bfa670
Change name of method
Make DocWriteResponse a ToXContentObject  This involved changing also index, delete, update so that bulk can print them out in its own format.
Fixes due to changes in master branch.
Handle unresolved view name
Widget toString methods obsolete since Group got an improved toString.
Graph[Builder].java et al.: fix representation of angle brackets in Javadoc.  *sigh*  cgdecker@, we will need to cherrypick this one too for the v20 release.  :(  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=137161301
Fixed CS for Camel-FTP
Rename OperatorFromIterable to OnSubscribeFromIterable
replaced Service marker interface with non-standard META-INF directory names to differentiate JVMCI providers from standard service providers META-INF/services/ files for Options provider are now generated directly from files in META-INF/jvmci.options/
Use 500MB message size limit  Summary: Currently, we don't really implement streaming on the server side and so we pass even very large files in a single message. Just increase the limit for now.  Reviewed By: ttsugriy  fbshipit-source-id: 668b887
Use non-deprecated version of Futures.transform
Remove unintended dependency on Servlet API in SockJS  Add a factory method in ServerHttpRequest for creating a ServerHttpAsyncRequestControl.
UseSpecializations is now turned off for the generic specialization in WriteLocalNode.
Correct broken HTML in Javadoc comment. <engine> -> &lt;engine&gt;
CAMEL-6981: Include customId attribute in route model XML so we can know if the id is auto assigned or custom id.
SPR-5726: Unexpected @RequestMapping semantics when class-level and method-level mappings used together
Add missing @NullableDecl on the fields "instance" in Suppliers.  RELNOTES=n/a.  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=179706506
Fix reset of result sets on LET statements and projections
Get rid of a deprecated method in ProjectFilesystem.  Summary: And use `Path`.
Coordinator should exit if the BuildJob.BuildStatus is set to FINISHED or FAILED.  Summary: [stampede] Coordinator should exit if the BuildJob.BuildStatus is set to FINISHED or FAILED.  Test Plan: ci  Reviewed By: stepancheg  fbshipit-source-id: 17d493d
Fixed regression with fallback for non-resolvable property type
Adding close connection support to HttpClient to combat hanging open files  Added a .close() method to org.openqa.selenium.remote.http.HttpClient interface.  Added a call to the client's .close() method from the HttpCommandExecutor class when a org.openqa.selenium.remote.DriverCommand.QUIT is sent.  Implemented the .close() method in org.openqa.selenium.remote.internal.ApacheHttpClient which taps the connectionManager and closes idle connections.  Fixes #1080  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Use URLDecoder for query params in WebFlux  Issue: SPR-15860
fixed CS issues with line endings
Fix checkstyle: removed unused imports
Show materialized files count only per server  Summary: Removed materialized files count from the main stats line in stampede builds. It shouldn't be there, it's noise for most devs. Also, it was summing (same) files materialized on all minions, it's more useful per minion.  Test Plan: Ran an example build: https://pxl.cl/bsNp  Reviewed By: ruibm  fbshipit-source-id: fb300ed
Remove a dependency on Java 6 that accidentally got introduced
Add Javadoc for main interfaces/classes
CAMEL-12352 - make system property uppercase if given lowercase in simple expression
removed redundant arrays
graph size verification: cleanups
Run eclipseformat.
CAMEL-290.  Patch applied with thanks!
Review comments.
Ignoring some HtmlUnitDriver tests that fail in IE compatibility mode
Unused imports.
Some file path fixes in tests for Windows
Fix match_phrase_prefix query with single term on _all field (#20471)  * Fix match_phrase_prefix query with single term on _all field  This change fixes the match_phrase_prefix query when a single term is queried on the _all field. It builds a prefix query instead of an AllTermQuery which would not match any prefix.  Fixes #20470  * Add missing change
Make maximum page size for queues configurable
Consistent use of Class<?>
Remove unused variable  Pull request: https://github.com/prestodb/presto/pull/6174
Add WorkProcessor#transformProcessor method  This methods allows to write more streamlined transformations of the processor itself, e.g:  processor.transformProcessor(WorkProcessorUtils::flatten)
PrebuiltCxxLibrarys can export libraries  Summary: if a static library depends on other libraries (e.g. libsqlite3.dylib), there was no way to export that up the tree. Now the `libraries` keyword list those that any dependencies should include  Reviewed By: Coneko  fbshipit-source-id: 5f0a727
Remove unused SourcePathResolver from GenAidl  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: e6c78f3
CLOUDSTACK-6476: Basic Zone with Multiple Pods Setup: DHCP server doesnt get deployed in the pod where the VM gets deployed  Changes: PodId in which the router should get started was not being saved to the DB due to the VO's setter method not following the setXXX format. So when planner loaded the router from DB, it always got podId as null and that would allow planner to deploy the router in any pod. If the router happens to start in a different pod than the user VM, the Vm fails to start since the Dhcp service check fails.  Fixed the VO's setPodId method, that was causing the DB save operation fail.
Add equals() and hashCode() methods to Util.MatchResult for completeness.
Add a utility method in ProjectFilesystem to glob files under a path.  Test Plan: unit test
Move Cell.getAbsolutePathToBuildFileUnsafe to ParserConfig  Summary: This is a part in a series of changes to remove ParserConfig-related information from Cell.  Reviewed By: sbalabanov  fbshipit-source-id: ecb4b70d32
remove getBaseNameWithSlash from BuildTarget  Summary: This is a rarely used method whose callsites should probably operate directly with paths instead of strings.  Test Plan: CI  Reviewed By: asp2insp  fbshipit-source-id: c68f9cd
Comment clean up as advised
Added more parameter to PersistentTaskPlugin#getPersistentTasksExecutor(...)
Deprecate Direct Access to Scheduler Implementations  This enforces the convention of using `Schedulers.*` and then makes the RxJavaDefaultSchedulers plugin more reliable.
implemented alternative implementation for loading the exception object from the thread at the start of an exception dispatcher
[TEST] Move XContentTestUtils.java into o.e.test folder  Classes referenced by the Test base classes must be under this package otherwise the test jar can't be used in a 3rd party application.
Create bounded varchar type for varchar hive columns
Rename PagesHashStrategy compare to compareSortChannelPositions
Add QueryStateMachine.getFailureInfo to avoid creation of QueryInfo
Implement CharSink.writeLines(Stream[, String]).  []  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=152418428
Use LinkedHashmap to preserve insert order  In several places in the spring-webmvc module, URL patterns / objects relationships are kept in `HashMap`s. When matching with actual URLs, the algorithm uses a pattern comparator to sort the matching patterns and select the most specific. But the underlying collection implementation does not keep the original order which can lead to inconsistencies.  This commit changes the underlying collection implementation to `LinkedHashmap`s, in order to keep the insert order if the comparator does not reorder entries.  Issue: SPR-13798
SPR-7971 + add target object to KeyGenerator
Added more missing types to list of RPC types
Don't let VMsync touch the VM if VM has been scheduled for HA but HA is not yet running.
Remove code that uses Console class from BuckQueryEnvironment.  Summary: The Console class uses the System.out.println at the end. Use the BuckEventBus instead that is nicer to the super console.  Reviewed By: ttsugriy  fbshipit-source-id: 3436492
[SSL/TLS] filter out unsupported ciphers before setting the cipher list  This change filters out unsupported ciphers before setting the ciphers on the SSLEngine. The unsupported ciphers are logged in a message at the error level. If none of the specified ciphers are supported, then an exception will be thrown.  Closes elastic/elasticsearch#698  Original commit: elastic/x-pack-elasticsearch@68cf47ec19cbf2a252762238a57eeac67211fbae
- Add an extra async IO flag I used for testing. - Blocking should block.
Rename 'LLVMMemory.getObjectMask' to 'LLVMMemory.getDerefHandleObjectMask'.
CAMEL-7999: More components include documentation
Introduce ProjectFilesystemDelegate.getDetailsForLogging()  Summary: This supersedes what was done in D5620740 to add more details in the Chrome trace about the `ProjectFilesystemDelegate` that was used. In particular, I worry about misspelling `eden.disable_sha1_fast_path` and it not having the desired effect, so this is a simple way to verify it.  Test Plan: Do a Buck build in Eden with and without `--config eden.disable_sha1_fast_path=true` and run the following after each run and verify it has the expected output:  ``` jq '[.[] | select(.name=="ProjectFilesystemDelegate")]' buck-out/log/build.trace ```  Reviewed By: ttsugriy  fbshipit-source-id: 6b54cca
[GeoSpatial] Add xxHash64 operator to Bing Tiles  In particular, this enables operators like approx_distinct which requires the object to be xxHashable.
replace valueOf with parse patch by Dave Brosius; reviewed by jbellis for CASSANDRA-1864
Fulltext addon, small cleanups
Remove request type parameter from CCR actions  Relates #31405
Fix missing @Override annotation in presto-main
DefaultHttp2FrameWriter ping payload size check  Motivation: The HTTP/2 spec states that the ping frame length must be 8 and is otherwise an error https://tools.ietf.org/html/rfc7540#section-6.7. The DefaultHttp2FrameReader enforces this, but the DefaultHttp2FrameWriter allows invalid frames to be written. We should not allow invalid ping frames to be written to the network.  Modifications: - DefaultHttp2FrameWriter checks the frame size to be 8, or throws an exception  Result: Fixes https://github.com/netty/netty/issues/3721
Use a String instead of an enum for the option category
Add missing apache headers
Log unresolved exceptions at error level
STORM-741: Allow users to pass a config value to perform impersonation.
adding TakesScreenshot to WebElement, not going down the Augmentor route right now since that is setup just for WebDriver.  If someone really really likes the augmentor pattern, they can update it to also take into consideration WebElements and look at the Parent Driver instance's capabilities to determine which roles (interfaces) should be applied. I don't really care for it much and would rather get an exception from the driver that it is not implemented :)
CAMEL-7999: Add more labels to components.
Resolve `ndk-build` properly on Windows  Summary: The method on `ExecutionContext`, which was only called by this code, didn't handle file extensions properly.  This removes that method, and adds a method on `ExecutableFinder` to do the right thing.  Test Plan: Ran `NdkLibraryIntegrationTest` and see that it got further.
Small fix to test and toString(); add helpful check for bad use of item/user pref array
Clean up web application response builders
Update copyright year of changed files
Add spring.*.enabled for MVC view resolvers    Since we use a composite ViewResolver glbally by default it can be  awkward to switch off the view technology that you have on the classpath  but aren't actually using.
Enable Neo4J's open in view interceptor by default    Closes gh-7943
Clean up deprecation and unused code warnings
Check that SessionScope is available early
Add defaultLocale to AcceptHeaderLocaleResolver  Issue: SPR-14312
Add @Documented to the new annotations.
Fix parsing of value with comma    Closes gh-12297
Quick Javadoc cleanup to restore snapshot building.
Changes to Javadoc to remove doclint errors and warnings    JDK 8 introduced doclint to the javadoc tool:  http://openjdk.java.net/jeps/172    Unfortunately, this causes deployments to fail under JDK 8, due  to javadoc doclint errors.    Not all warning messages were removed, but `mvn javadoc:jar` now  completes without an early failure.    Further discussion will be required to decide on how to approach the  doclint warnings.
[Dubbo-#2162]Correct the reference retries default value 0 to 2 (#2183)    * Correct the reference retries default value 0 to 2  * fix the unit test error
Polish 'Make sure exception tag values are not empty in web metrics'    Closes gh-13187
Fix HAL browser entry point with contextPath    Previously, if the `contextPath` of the application wasn't the root, the  HAL browser could not initialize since the `entryPoint` was referring to  an invalid location.    This commit makes sure to take the `contextPath` into account.    Closes gh-5814
shorten line, renamed var, removed unnecessary empty array in varargs.
Encapsulate more behavior inside ServiceMethod. (#2665)
Add test for executing Calls at most once
Apply eclipse formatting and cleanup rules
Add boolean flag spring.rabbit.listener.useTransactionManager    If set *and* there is a transaction manager in the context, then the  listener container created by Spring Boot will use the transaction  manager to execute the listeners.    Fixes gh-3432 (by virtue of not requiring a JtaTransactionManager any  more).
Move most http2 tests to Junit 5 (#6378)
Configure Cassandra JMX Reporting    Allow Cassandra JMX reporting to be configured via a property, and  disable it by default since it won't work with Dropwizard metrics 4.    Also update some of our own tests to explicitly disable it.    Closes gh-14778
Trim trailing whitespace from value of logging.config    Closes gh-22078
Improve transaction manager detection    Switch the condition used to trigger the creation of a transaction  manager from the default name to the actual type.    Fixes gh-3012
Apply RSocket server customizers to netty web server    This commit applies `ServerRSocketFactoryCustomizer` beans to RSocket  setups when the RSocket server is being plugged into an existing Reactor  Netty web server.    Fixes gh-18208
Allow to configure Kafka Listener's onlyLogRecordMetadata    See gh-24582
Apply customizers to build when created embedded Mongo client    Closes gh-11132
Remove unnecessary semicolons    Closes gh-13144
Rename nested *AutoConfiguration classes to *Configuration    Closes gh-12989
Use Collections.addAll(...) instead of for loops    Replace various for loops which add items to collections with calls  to Collections.addAll(...).    Fixes gh-2277
Make Flyway and Liquibase endpoints conditional on a single candidate    Previously, auto-configuration of the Flyway and Liquibase endpoints  would fail if there were multiple Flyway or Spring Liquibase beans  in the application context.    This commit updates them so that they are now conditional on a single  candidate.    Closes gh-6609
Polish 'Apply context and connector customizer beans to Tomcat factories'    Closes gh-15492
Apply context and connector customizer beans to Tomcat factories    See gh-15492
Apply spring.jackson.* config to HypermediaAutoConfiguration\xe2\x80\x99s ObjectMapper    Previously, HypermediaAutoConfiguration would trigger the creation of  an ObjectMapper bean named _halObjectMapper. This bean did not have the  spring.jackson.* configuration applied to it, however its presence  would revent JacksonAutoConfiguration from creating its  ObjectMapper. This left the user with an ObjectMapper that did not  honour the spring.jackson.* configuration.    This commit updates HypermediaAutoConfiguration to use the  Jackson2ObjectMapperBuilder that may have been created by  JacksonAutoConfiguration. If the builder exists it is used to configure  the _halObjectMapper bean.    Fixes gh-1949
Polish 'Reorder modifiers to comply with the JLS'    Closes gh-12432
Added exceptionIfInvalid attribute to @ConfigurationProperties    Default behaviour unchanged, but if you want to ignore validation errors  you can switch them off for indivdual beans now.    Fixes gh-144
Fix checkstyle issues in samples    Fix checkstyle issues with samples following the  spring-javaformat upgrade.    See gh-13932
support method sync timeout (#4436)    fixes #4435
refresh configCenter before start
GenericException compatible with 2.6.x or lower version (#5800)    fixes #4675
register metadata config on ConfigManager
Drop cookies that contain ASCII NULL and other bad characters.    Closes https://github.com/square/okhttp/issues/2939
Add @Documented attribute to all annotations.
Use standard exception cause handling in RetrofitError.    Improves RetrofitError.toString() output.
Changes to make JDK 8 doclint happy.
Allow Multipart requests with parts of unknown length
Exposes RestAdapter#createProvider, to allow custom service wrappers.
readability enhancement and assert check for proxy object (#3048)
support multiple default registries and protocols
Add support for @GrabExclude to AetherGrapeEngine    @GrabExclude can now be used to exclude certain transitive dependencies.  In Aether (Maven), exclusions are applied to an individual dependency  rather than being global. In Grape, exclusions are global.  AetherGrapeEngine adheres to the Grape convention by applying every  exclusion create by @GrabExclude to every dependency, effectively making  them global.
Override toString() with meaningful implementation.    The new implementation provides more useful information.
temporary tree folders
getAnnotatedMethodValues/Field return modifiable collection: no internal data to protect
Cleanup TemporaryFolderUsageTest and add it to AllTests suite
Autowiring rejects self references to a factory method on the same bean as well  Issue: SPR-12018
Polish some Map operations    Closes gh-15103
Configure RouteMatcher at the RSocketStrategies level    After a change in Spring Framework (see  spring-projects/spring-framework#23314), the `RouteMatcher` to be used  with the RSocket infrastructure is configured on the `RSocketStrategies`  directly.    This commit moves the auto-configuration of the  `PathPatternRouteMatcher` from the message handling parts to the RSocket  strategy one.    Closes gh-17571
Allow counter names like counter-foo    Checking for a prefix 'counter.' is more correct than 'counter' because  the readers (repositories) assume the former prefix is there.    Fixes gh-3801
Ensure RestTemplate interceptors remain mutable    Fixes gh-4553
Reverse priority of property sources when extracting sub properties    (cherry picked from commit 300e570f)  Fixes gh-2261  See gh-1259    Conflicts:   <tab> spring-boot/src/test/java/org/springframework/boot/bind/RelaxedPropertyResolverTests.java
Allow data unit to be specified on the constructor parameter    See gh-21746
Restore behavior of management.metrics.export.simple.enabled    See gh-12106
Allow recursive list binding when iterable source    Further refine recursive binding rules so that Lists are supported when  the underlying source is iterable.    Close gh-10702
Several javadoc referred to MethodRule when they should have referred to TestRule
Fix request factory used with TestRestTemplate withBasicAuth    This commit updates the behavior of withBasicAuth on TestRestTemplate  by trying to use the same request factory type as the underlying restTemplate.  If creation of a new instance of the configured request factory class fails,  it falls back to the `ClientHttpRequestFactorySupplier`.    See gh-15982
[Dubbo-4147] restore the metadata store key change (#4170)
Polish @deprecated javadoc and link to replacements where available    Closes gh-6765
TestClass.getAnnotatedFieldValues(...) throws exception with helpful message for non static fields (fixes issue #257).
moved new test to 'running' subpackage
move getExporterMap() to the abstract class
Fix spelling mistakes in comment, 'Transfort' to 'Transporter' (#5414)
Fail with clear message when missing scheme or host for HttpUrl.Builder.toString.
performance tuning: avoid address resolve (#4220)
Remove some old toString overloads which are no longer used.
[Dubbo-2353]fix Invalid property 'interfaceName' of bean class [org.apache.dubbo.config.spring.ServiceBean]#2353 (#2418)    * add getter and setter for ServiceConfig's interfaceName property#2353    * add interfaceName to ignoreAttributeNames and change the unit test    * delete the demo source code and update the unit test    * unchange ServiceConfig    * update unit test    * update unit test
remove unused imports
* Removed empty line in ExpectedException  * Moved CauseMatcher to ResultMatchers and splitted it up in two  matchers (failureIs and causedBy)  * Added tests for both matchers
completely remove 'default.' prefix of URL key (#4222)
replace magic string 'dubbo' with constants (#3602)
Remove explicit constructor super() calls    Closes gh-11068
Add isExecuted method to Call.
Fix relaxed binding of SI JMX config    Instead of using an expression for JMX-related properties, this commit  properly honors relaxed binding.    Closes gh-6184
