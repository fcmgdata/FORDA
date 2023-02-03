make this less syntactically confusing
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
Improve diagnostics for invalid testGroup values
[Spring Boot] Tuned configuration callback execution order.
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
Fixed regression with fallback for non-resolvable property type
improve performance of projection instantiation
Use streams and lambdas in spring-test where feasible  Issue: SPR-13188
[Spring Boot] Tuned configuration callback execution order.
Move AdviceMode from .config to .annotation package
[Spring Boot] Tuned configuration callback execution order.
RESOLVED - issue SPR-6444: TaskExecutor not initialized in task namespace
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Use supplier-aligned type information for FactoryBean type resolution  Issue: SPR-17063
Removed TestGroup.LONG_RUNNING marker from Groovy and JRuby tests
Implement java.io.Closeable where appropriate  Issue: SPR-9962
Update SpringConfiguration to support beans by type  Issue: SPR-10605
Change this "try" to a try-with-resources  Closes gh-1671
Add addAll(MultiValueMap)  This commit introduces a new method for MultiValueMap: addAll, which adds all values of a given map (cf putAll, which replaces existing values).
Change this "try" to a try-with-resources  Closes gh-1671
avoid ConcurrentModificationException when iterating attribute names (SPR-7557)
Suppress warnings in Gradle build
Update SpringConfiguration to support beans by type  Issue: SPR-10605
Support for bean refs in event SpEL condition  Issue: SPR-13814
Use streams and lambdas in spring-test where feasible  Issue: SPR-13188
Move AdviceMode from .config to .annotation package
Investigate issue with @ComponentScan as meta-annotation  This commit introduces unit and integration tests that attempt to reproduce the issue claimed by the reporter in SPR-11557. However, the tests pass without any problems.  Issue: SPR-11557
Support overriding, removing headers in ClientRequest  This commit adds two Consumer based methods to ClientRequest that allow for direct manipulation of the underlying headers or cookies map. As such, these methods can be used to override or remove existing entries.  Issue: SPR-15635
Throw exception if TxMgr cannot be retrieved for @Transactional test  Prior to this commit, a @Transactional integration test would silently be executed without a transaction if the transaction manager could not be retrieved from the application context -- for example, it no such bean was defined or if multiple beans were present but none satisfied the qualifier.  This commit addresses this issue by throwing an IllegalStateException if the PlatformTransactionManager cannot be retrieved for a @Transactional test.  Issue: SPR-13895
Throw exception if TxMgr cannot be retrieved for @Transactional test  Prior to this commit, a @Transactional integration test would silently be executed without a transaction if the transaction manager could not be retrieved from the application context -- for example, it no such bean was defined or if multiple beans were present but none satisfied the qualifier.  This commit addresses this issue by throwing an IllegalStateException if the PlatformTransactionManager cannot be retrieved for a @Transactional test.  Issue: SPR-13895
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Suppress warnings and remove unused imports
Suppress warnings and remove unused imports
Throw exception if TxMgr cannot be retrieved for @Transactional test  Prior to this commit, a @Transactional integration test would silently be executed without a transaction if the transaction manager could not be retrieved from the application context -- for example, it no such bean was defined or if multiple beans were present but none satisfied the qualifier.  This commit addresses this issue by throwing an IllegalStateException if the PlatformTransactionManager cannot be retrieved for a @Transactional test.  Issue: SPR-13895
[Spring Boot] Tuned configuration callback execution order.
avoid unnecessary autoboxing
Reorganized order of auto-config modules
Inferred generics for newSetFromMap arrangements  Issue: SPR-13188
AbstractAutowireCapableBeanFactory avoids early FactoryBean instantiation on currently created configuration bean  Issue: SPR-12141
[Spring Boot] Added support for multiple conversion services.
Use MockitoJUnitRunner from Mockito 2's preferred location  Issue: SPR-14880
AbstractAutowireCapableBeanFactory avoids early FactoryBean instantiation on currently created configuration bean  Issue: SPR-12141
Suppress warnings in Gradle build
Use supplier-aligned type information for FactoryBean type resolution  Issue: SPR-17063
SPR-7354 - Added equivalent of JAX-RS @Consumes to Spring MVC
Fix binary compatibility for SmartApplicationListener  Making sure that `GenericApplicationListenerAdapter` implements `SmartApplicationListener` again as older code may try to cast an instance to `SmartApplicationListener`.  Issue: SPR-8201
improve performance of projection instantiation
Renamed 'name' attribute to 'scopeName' (in order to avoid common override conflicts)  Issue: SPR-13239
Don't use single letter catch variables  Update existing catch blocks to ensure that `ex` is always used in preference to `e` or `t` as the variable name.  Issue: SPR-16968
improve performance of projection instantiation
[Spring Boot] Tuned configuration callback execution order.
RESOLVED - issue SPR-6444: TaskExecutor not initialized in task namespace
Use supplier-aligned type information for FactoryBean type resolution  Issue: SPR-17063
SPR-8448 Remove URI template vars from the model before appending to query string in RedirectView
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
Don't use single letter catch variables  Update existing catch blocks to ensure that `ex` is always used in preference to `e` or `t` as the variable name.  Issue: SPR-16968
improve performance of projection instantiation
Investigate issue with @ComponentScan as meta-annotation  This commit introduces unit and integration tests that attempt to reproduce the issue claimed by the reporter in SPR-11557. However, the tests pass without any problems.  Issue: SPR-11557
Revert "Introduce Ordered#NOT_ORDERED"  This reverts commit da914bcfb4599ebf746ea477c691ed99c4842ed0 and also removes the use of Ordered#NOT_ORDERED from EnableTransactionManagement and ProxyTransactionManagementConfiguration in favor of defaulting to Ordered#LOWEST_PRIORITY, which is actually the default that results when no 'order' attribute is specified in XML.
avoid unnecessary autoboxing
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
Suppress warnings in Gradle build
Don't use single letter catch variables  Update existing catch blocks to ensure that `ex` is always used in preference to `e` or `t` as the variable name.  Issue: SPR-16968
[Spring Boot] Tuned configuration callback execution order.
[Spring Boot] Tuned configuration callback execution order.
@Scheduled supports java.time.Duration format for its delay attributes  Issue: SPR-15455
Support for bean refs in event SpEL condition  Issue: SPR-13814
Expose empty annotation array as empty AnnotationAttributes array  Closes gh-22405
Implement java.io.Closeable where appropriate  Issue: SPR-9962
Use streams and lambdas in spring-test where feasible  Issue: SPR-13188
Added httpOnly cookie ResultMatcher
Implement java.io.Closeable where appropriate  Issue: SPR-9962
Added httpOnly cookie ResultMatcher
Don't use single letter catch variables  Update existing catch blocks to ensure that `ex` is always used in preference to `e` or `t` as the variable name.  Issue: SPR-16968
implement new interface method
avoid unnecessary autoboxing
Reasonable defaults for MultipartHttpMessageWriter  MultipartHttpMessageWriter is now configured to handle JSON and XML out of the box.
Implement java.io.Closeable where appropriate  Issue: SPR-9962
prefer use of varargs over arrays in bean property setters (for programmatic consumption)
prefer use of varargs over arrays in bean property setters (for programmatic consumption)
Delete unused imports in spring-test
@Scheduled supports java.time.Duration format for its delay attributes  Issue: SPR-15455
Add helper method to ResourceHandlerRegistry
Implement java.io.Closeable where appropriate  Issue: SPR-9962
improve performance of projection instantiation
Remove field no longer used after previous commit  Issue: SPR-11516
avoid ConcurrentModificationException when iterating attribute names (SPR-7557)
Allow access to applied property sources  Add PropertySourcesPlaceholderConfigurer.getAppliedPropertySources() to allow access to the PropertySources that were actually applied.  Issue: SPR-10545
Tests for @Enable/@ComponentScan without @Configuration  Issue: SPR-10660
RESOLVED - issue SPR-6444: TaskExecutor not initialized in task namespace
Fixed regression with fallback for non-resolvable property type
Implement java.io.Closeable where appropriate  Issue: SPR-9962
Bind file rename executor as ListeningExecutorService  - Also use cached thread pool and bounded executor to reduce memory footprint for thread management
Modify actual & preferred partitioning for GroupIdNode  Default behavior for GroupId was to pass down parent partitioning preferences unchanged and also pass up child actual partitioning unchanged. However:  - Children of the GroupId plan node do not have access to new symbols (i.e. passthrough symbols) that are generated by the GroupId. These must be translated. - We cannot pass through preferences for symbols that are modified by GroupId (i.e. the set difference of the distinct and common grouping columns). These must be removed.
Convert tests to java.util.Optional
SPR-8429 Add test cases for missing header, cookie, and pathvar values
Support INSERT for MySQL and PostgreSQL connectors
Pull up common code
Pull up common code
TIKA-468: Missing Silde-Count metadata for PPT files
Rename test classes to avoid confusion
[java] Deleting unused imports
Javadoc fine-tuning for 4.2
AnnotationAwareOrderComparator is able to sort Class objects as well  Issue: SPR-10152
Introduce execute(DataSource) in ResrcDbPopulator  To simplify common use cases, this commit introduces a new execute(DataSource) method in ResourceDatabasePopulator that complements the existing populate(Connection) method.  Issue: SPR-11629
Added better detection of existing namespaces by requiring an ending slash on the match WW-1523
Adding close connection support to HttpClient to combat hanging open files  Added a .close() method to org.openqa.selenium.remote.http.HttpClient interface.  Added a call to the client's .close() method from the HttpCommandExecutor class when a org.openqa.selenium.remote.DriverCommand.QUIT is sent.  Implemented the .close() method in org.openqa.selenium.remote.internal.ApacheHttpClient which taps the connectionManager and closes idle connections.  Fixes #1080  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Migrate map_concat to new scalar framework
Remove deprecated method in ConnectorSplitSource
[java] Moving marionette specific test to the corresponding class
Make Arrayblock, MapBlock, RowBlock support mayHaveNull
Remove ThreadSafe annotation from OperatorContext and DriverContext
Adding an option to start Firefox in headless mode
Suppress warnings and remove unused imports
Make EvaluationException more informative  Update EvaluationException to expose the toDetailedString() method as the exception message. The simple message can now be accessed via the new getSimpleMessage() method.  Issue: SPR-10938
Throw exception for delete from unpartitioned Hive table
MatchableHandlerMapping extends HandlerMapping and lives in web.servlet.handler now  Issue: SPR-14321
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=48230 Remove unused imports. Patch provided by sebb.
Prevent accidental treatment of GroupReference as real PlanNode
Avoid java.util.stream.Stream usage in hot paths  Prior to this commit, profiling sessions would show that using `java.util.stream.Stream` in some hot code paths creates significant garbage.  Where streams aren't really required, this commit turns those snippets into imperative logic  because those are likely to be called once or multiple times per request.  Closes gh-22341
Clean up warnings in spring-websocket
TIKA-1445 Use assertContains, and fix a problem with the ForkParser integration tests
Remove unnecessary class loader from resource group plugin
Introduce alias for 'value' attribute in @Payload  This commit introduces 'expression' as an alias for 'value' in @Payload.  Issue: SPR-11393
@Resource names may use ${...} placeholders (SPR-5656)
Modified services to include authz strategy field
Do not accept number for RFC2822/ISO8601/Custom temporal field decoders
Handle non-equijoins with negated expressions  Normalize join criteria to support expressions like "not(l.x = r.x)"
Deleting unused imports
Add Servlet 3.1 methods to mock request  Issue: SPR-11492
MatchableHandlerMapping extends HandlerMapping and lives in web.servlet.handler now  Issue: SPR-14321
Remove unnecessary method
Refactor concrete WebDriverException#getSupportUrl's  Extract urls to constants.  Signed-off-by: Daniel Davison <daniel.jj.davison@gmail.com>
Move tests to spring-test module  When Spr9799XmlConfigTests and Spr9799AnnotationConfigTests were created, there were issues with the classpath related to slf4j dependencies that made it impossible for these classes to reside in the spring-test module. Consequently, these tests were added to the spring-test-mvc module. However, the issues with slf4j have since been resolved in the Gradle build, and this commit therefore moves these test classes to the spring-test module where they belong.  Issue: SPR-9799
Drops support for handleUnknownAllowedMethod as it was added to satisfy test
Move Predicates util to com.facebook.presto.util.MorePredicates
HtmlUnit: disabling broken tests
Adding close connection support to HttpClient to combat hanging open files  Added a .close() method to org.openqa.selenium.remote.http.HttpClient interface.  Added a call to the client's .close() method from the HttpCommandExecutor class when a org.openqa.selenium.remote.DriverCommand.QUIT is sent.  Implemented the .close() method in org.openqa.selenium.remote.internal.ApacheHttpClient which taps the connectionManager and closes idle connections.  Fixes #1080  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Configure view controllers with ApplicationContext  Issue: SPR-13762
2.x: Add blockingSubscribe JavaDoc clarifications (#5984)
Introduce execute(DataSource) in ResrcDbPopulator  To simplify common use cases, this commit introduces a new execute(DataSource) method in ResourceDatabasePopulator that complements the existing populate(Connection) method.  Issue: SPR-11629
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=55110 Small performance improvements Patch provided by Adrian Nistor
WW-4995 Add trimBody attribute to set tag
Refactoring use of a deprecated method
Explicit support of String[] value resolution  This commit adds an explicit support for String array for value resolution. <util:properties> switches the 'locations' property to a String array in 662d8aa and this broke expression evaluation.  Issue: SPR-12391
Improve memory accounting in top N
bug 7611: get directPodBased default network when deploy vm with no networkId specified status 7611: resolved fixed
Add encoding for the default action in FormTag  Issue: SPR-11426
Configure view controllers with ApplicationContext  Issue: SPR-13762
Remove bogus DataSource test from JpaTransactionManagerTests
Migrate array cardinality to scalar framework
Take expression compiler from QueryRunner in FunctionAssertions
Bind file rename executor as ListeningExecutorService  - Also use cached thread pool and bounded executor to reduce memory footprint for thread management
add methods for serializing individual objects
Move StatementResource to its own package
InjectionPoint propagated for shortcut bean name resolution as well  Issue: SPR-14400
[chromedriver] Expose chromedriver "execute CDP command" command
Add version display
Restore lenient null return value for ConditionContext.getBeanFactory()  Includes nullable return value for getClassLoader() with corresponding notes in applicable javadoc.  Issue: SPR-16866
Add getRawSlice to BlockCursor interface
InjectionPoint propagated for shortcut bean name resolution as well  Issue: SPR-14400
Clean up warnings in spring-websocket
Use MockitoJUnitRunner from Mockito 2's preferred location  Issue: SPR-14880
Avoid java.util.stream.Stream usage in hot paths  Prior to this commit, profiling sessions would show that using `java.util.stream.Stream` in some hot code paths creates significant garbage.  Where streams aren't really required, this commit turns those snippets into imperative logic  because those are likely to be called once or multiple times per request.  Closes gh-22341
Validate types for IN subquery expression
Implement java.io.Closeable where appropriate  Issue: SPR-9962
implement new interface method
apache licence headers
Rename test classes to avoid confusion
New method in the Tuple interface "boolean isTuple()" for easier handling of TickTuples.
Support overriding, removing headers in ClientRequest  This commit adds two Consumer based methods to ClientRequest that allow for direct manipulation of the underlying headers or cookies map. As such, these methods can be used to override or remove existing entries.  Issue: SPR-15635
2.x: Make Flowable.fromCallable consitent with the other fromCallables (#6158)  2.x: Make Flowable.fromCallable consistent with the other fromCallables
Add license headers.  r1471
Make Arrayblock, MapBlock, RowBlock support mayHaveNull
Deleting deprecated (in 3.6) methods
The rest of the fix for TrainLogistic
Don't use single letter catch variables  Update existing catch blocks to ensure that `ex` is always used in preference to `e` or `t` as the variable name.  Issue: SPR-16968
AlexeiBarantsev: Ignoring tests for the browsers that don't support yet 'true or null' paradigm for boolean attributes  r16981
Minor refactoring in Tomcat/Jetty adapters
avoid unnecessary autoboxing
avoid unnecessary autoboxing
Fixed WebExtensions installation  Fixed installation of new firefox webextension built with new WebExtension API i.e. the one which contains manifest.json instead of install.rdf  Fixes #4093  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Refactoring. Move Mapper. Preparation for further mapper related refactoring to follow.
Add a field to query statistics  When a query finishes, if we fail to fetch the final stats, we log the completion event with the latest available stats. Add a flag indicating that the logged stats are not complete.
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=48230 Remove unused imports. Patch provided by sebb.
Factor out Rule#isEnabled(Session)
SPR-7081 - Add ignoreJafMediaTypes to ContentNegotiatingViewResolver
Deprecate InstanceListener, InstanceEvent and InstanceSupport prior to removal
Improve error reporting. - Be more precise about the location of the file with the error - Don't swallow exceptions
SpotBugs: Make inner classes static where possible
Fix ResourceUrlProvider path check in getForRequestUrl  Prior to this change, getForRequestUrl implementation would only work for applications with a non-empty servlet path. So web applications mapped to "/" would trigger a IllegalStateException while checking the current request against the request path within the current mapping.  This change relaxes this and only check that the path within mapping is within the request URL.  Issue: SPR-12158
relaxed @AspectJ detection check (for CGLIB subclasses to still be recognized as an aspect)
Add QueryStateMachine.getFailureInfo to avoid creation of QueryInfo
Restore proper use of CacheLoader  Since Guava 11, CacheLoader is only invoked with a LoadingCache but the GuavaCache wrapper is always invoking getIfPresent(), available on the main Guava Cache interface.  Update GuavaCache#get to check for the presence of a LoadingCache and call the appropriate method.  Issue: SPR-12842
fixed some generics related warnings and did a little re-formatting
Validate types for IN subquery expression
TIKA-346: ZipParser throws "invalid compression method" error for some archives
Added test for inconsistency between read and write method  Issue: SPR-11361
Update javadoc with @since
TIKA-416: Out-of-process text extraction  More javadocs and some cleanup.
Remove some unneeded unboxing, unneeded methods, made some stuff private that can be
Implement java.io.Closeable where appropriate  Issue: SPR-9962
Clarify the use of sessionTransacted  This commit clarifies the role of the external transactionManager for a DMLC and the relationship with the sessionTransacted flag  Issue: SPR-9200
WW-1453  Simple cleanup items   - remove duplicate and/or unused imports   - change static access to class, not instance
Align code between connectors in preparation for pulling code up to the superclass No need to close the AJP connection if there was no error
Add flag to restore legacy array_agg behavior  The flag is named experimental.legacy-array-agg, which is default to be false. When it is set to true, array_agg will ignore the null values.
Rename rewriteQualifiedNamesToSymbolReferences  QualifiedNameReference no longer exists so the name of method seem to be obsolete. This commit updates this name of this method to refer that it rewrites Identifiers to SymbolReferences.
Tests for @Enable/@ComponentScan without @Configuration  Issue: SPR-10660
SPR-8448 Remove URI template vars from the model before appending to query string in RedirectView
minor javadoc improvements
SimonStewart: Move chrome tests to junit4  r16029
ResultType.EXCEPTION and ResultType.ERROR are handled the exact same way, so remove one of them and simplify some code.
Changed from interval() to intervalMillis()
Remove unintended dependency on Servlet API in SockJS  Add a factory method in ServerHttpRequest for creating a ServerHttpAsyncRequestControl.
SPR-7354 - Added equivalent of JAX-RS @Consumes to Spring MVC
Fixed regression with fallback for non-resolvable property type
Adding close connection support to HttpClient to combat hanging open files  Added a .close() method to org.openqa.selenium.remote.http.HttpClient interface.  Added a call to the client's .close() method from the HttpCommandExecutor class when a org.openqa.selenium.remote.DriverCommand.QUIT is sent.  Implemented the .close() method in org.openqa.selenium.remote.internal.ApacheHttpClient which taps the connectionManager and closes idle connections.  Fixes #1080  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Don't use single letter catch variables  Update existing catch blocks to ensure that `ex` is always used in preference to `e` or `t` as the variable name.  Issue: SPR-16968
Unignoring tests passing in updated HtmlUnit driver
Remove unnecessary accessor method
Removed unused interface
Improve memory accounting in top N
Add QueryStateMachine.getFailureInfo to avoid creation of QueryInfo
Use an EnumMap instead of a HashMap when the key is an enum
SPR-7971 + add target object to KeyGenerator
Remove unnecessary method
Fix bing_tile_coordinates function to produce row block  Previously, bing_tile_coordinates was producing a IntArrayBlock of length 2 to represent ROW(INTEGER, INTEGER). This no longer works since RowBlockBuilder.appendStructure method now requires a row block as of 630ec959c4e29d09c3b46cba2085e320d815f1ac.
Rename field in HandlerResult
New method in the Tuple interface "boolean isTuple()" for easier handling of TickTuples.
adding TakesScreenshot to WebElement, not going down the Augmentor route right now since that is setup just for WebDriver.  If someone really really likes the augmentor pattern, they can update it to also take into consideration WebElements and look at the Parent Driver instance's capabilities to determine which roles (interfaces) should be applied. I don't really care for it much and would rather get an exception from the driver that it is not implemented :)
Nested properties support for field-based validation  This commit validates that the changes introduced in 8221c9abc5 are indeed allowing DirectFieldBindingResult to support nested validation paths.  Issue: SPR-10623
Removed TestGroup.LONG_RUNNING marker from Groovy and JRuby tests
[Spring Boot] Tuned configuration callback execution order.
Change this "try" to a try-with-resources  Closes gh-1671
Use supplier-aligned type information for FactoryBean type resolution  Issue: SPR-17063
Issue #3065: expanded message test to all locales
Removed unused imports
Support empty body in Jackson2JsonDecoder.decodeToMono  Prior to this commit, extracting an HTTP response with an empty body and no Content-Type header using the WebClient would:  * trigger the use of the Jackson2JsonDecoder * throw a NoSuchElementException because of the use of `Flux.single()`  This commit changes this behavior to `Flux.singleOrEmpty()` to avoid throwing exceptions for empty Flux instances.  Issue: SPR-14582
CAMEL-9309: Make it easier to turn on|off java transport over http
Use t instead of value to allow for IDE naming (#4907)
Fix default idle timeout configuration  Idle timeout in the HttpClient applies to the entire lifetime of the connecto, and is not tied to a single request.  This makes the idle timeout act more like a socket keep alive timeout, so this should always be larger than the request timeout.
[Spring Boot] Tuned configuration callback execution order.
Implement java.io.Closeable where appropriate  Issue: SPR-9962
Make inner classes static where possible.
Hotfix compilation error and missing generics
Recycler will produce npe error when multiple recycled at different thread  Motivation:  Recycler may produce a NPE when the same object is recycled multiple times from different threads.  Modifications:  - Check if the id has changed or if the Stack became null and if so throw an IllegalStateException - Add unit test  Result:  Fixes https://github.com/netty/netty/issues/8220.
[Spring Boot] Tuned configuration callback execution order.
Reasonable defaults for MultipartHttpMessageWriter  MultipartHttpMessageWriter is now configured to handle JSON and XML out of the box.
Repeat/retry: fixed unbounded downstream requesting above Long.MAX_VALUE
improve performance of projection instantiation
[Spring Boot] Tuned configuration callback execution order.
Nested properties support for field-based validation  This commit validates that the changes introduced in 8221c9abc5 are indeed allowing DirectFieldBindingResult to support nested validation paths.  Issue: SPR-10623
Tests for @Enable/@ComponentScan without @Configuration  Issue: SPR-10660
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Use streams and lambdas in spring-test where feasible  Issue: SPR-13188
Add addAll(MultiValueMap)  This commit introduces a new method for MultiValueMap: addAll, which adds all values of a given map (cf putAll, which replaces existing values).
Suppress warnings in Gradle build
Inferred generics for newSetFromMap arrangements  Issue: SPR-13188
Investigate issue with @ComponentScan as meta-annotation  This commit introduces unit and integration tests that attempt to reproduce the issue claimed by the reporter in SPR-11557. However, the tests pass without any problems.  Issue: SPR-11557
Suppress warnings in Gradle build
Move AdviceMode from .config to .annotation package
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Use MockitoJUnitRunner from Mockito 2's preferred location  Issue: SPR-14880
Tests for @Enable/@ComponentScan without @Configuration  Issue: SPR-10660
[Spring Boot] Added support for multiple conversion services.
Remove some unneeded unboxing, unneeded methods, made some stuff private that can be
[FLINK-4875] [metrics] Use correct operator name  This closes #2676.
Remove some unneeded unboxing, unneeded methods, made some stuff private that can be
[FLINK-4875] [metrics] Use correct operator name  This closes #2676.
Remove calls to simple getters within classes. #1555  Fixes `CallToSimpleGetterInClass` inspection violations.  Description: >Reports any calls to a simple property getter from within the property's class. A simple property getter is defined as one which simply returns the value of a field, and does no other calculation. Such simple getter calls may be safely inlined, at a small performance improvement. Some coding standards also suggest against the use of simple getters for code clarity reasons.
Support encodeUrl mechanism via ServerHttpResponse  Issue: SPR-14529
Drops support for handleUnknownAllowedMethod as it was added to satisfy test
Next round of javadocs cleanup and fixes. Also limit the visibility of FailedChannelFuture
Use explicit charset in test code. #1555  Fixes some `ImplicitDefaultCharsetUsage` inspection violations.  Description: >Reports method and constructor calls which implicitly use the platform's default charset. These can produce different results on (e.g. foreign language) systems that use a different default charset, resulting in unexpected behaviour.
Remove ThreadSafe annotation from OperatorContext and DriverContext
Query String: Add `lenient` flag to support *value* parse failures, closes #1932.
Drops support for handleUnknownAllowedMethod as it was added to satisfy test
SPR-8448 Remove URI template vars from the model before appending to query string in RedirectView
fix bad merge for parent field mapper, and change most field types to be pkg-private and final
Reintroduce deletion of test directories for passing tests.  This now includes a workaround for the problem that we see when deleting test directories on Windows for tests that memory-map files.  Conflicts:     community/kernel/src/main/java/org/neo4j/kernel/impl/util/FileUtils.java
Clear dummyMetricsSink before test
Fixed WebExtensions installation  Fixed installation of new firefox webextension built with new WebExtension API i.e. the one which contains manifest.json instead of install.rdf  Fixes #4093  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
minor: removed exceptions not thrown
Don't use single letter catch variables  Update existing catch blocks to ensure that `ex` is always used in preference to `e` or `t` as the variable name.  Issue: SPR-16968
Suppress warnings and remove unused imports
Use streams and lambdas in spring-test where feasible  Issue: SPR-13188
generic ApplicationListener event type gets detected through proxy as well
RESOLVED - issue SPR-6444: TaskExecutor not initialized in task namespace
Implement java.io.Closeable where appropriate  Issue: SPR-9962
[Spring Boot] Added support for multiple conversion services.
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Using IOChannelUtils to resolve file path
Add reset() to MockRestServiceServer  Issue: SPR-14306
TIKA-468: Missing Silde-Count metadata for PPT files
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Clear dummyMetricsSink before test
Update 2.3 store file to include legacy indexes to check legacy index migrations.
Explicitly use e.getMessage() for log message formatting  patch by Zhao Yang; reviewed by Stefan Podkowinski for CASSANDRA-13723
Remove some unneeded unboxing, unneeded methods, made some stuff private that can be
2.x: Check runnable == null in *Scheduler.schedule*(). (#5748)  * 2.x: Check runnable == null in *Scheduler.schedule*().  * "run is null".  * sudo "run is null".
ca: Fixes #2877 mgmt server cert should have all addrs of default nic (#2879)  This fixes the default RootCA provider implementation to initiate and issue certificate for mgmt server on startup for all the IP addresses on the default nic of that host.  Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>
Remove calls to simple getters within classes. #1555  Fixes `CallToSimpleGetterInClass` inspection violations.  Description: >Reports any calls to a simple property getter from within the property's class. A simple property getter is defined as one which simply returns the value of a field, and does no other calculation. Such simple getter calls may be safely inlined, at a small performance improvement. Some coding standards also suggest against the use of simple getters for code clarity reasons.
[FLINK-4875] [metrics] Use correct operator name  This closes #2676.
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=48230 Remove unused imports. Patch provided by sebb.
[TEST] remove status matcher and hasStatus assertion  All it does is checking the status code of a response, which can be done with a single line in each test
MAHOUT-999, Creating directories to write Clustering Policies. For both KMeans and FuzzyK. All Junit Tests Pass. Clusters-Reuters.sh kmeans and fuzzyk both run successfully.
Reduce diff between ByteChunk and CharChunk No functional change
[Spring Boot] Tuned configuration callback execution order.
Replace 'utf=8' str with StandardCharset  Summary: safer  Reviewed By: rajyengi  fbshipit-source-id: ae0770d52d
Investigate issue with @ComponentScan as meta-annotation  This commit introduces unit and integration tests that attempt to reproduce the issue claimed by the reporter in SPR-11557. However, the tests pass without any problems.  Issue: SPR-11557
