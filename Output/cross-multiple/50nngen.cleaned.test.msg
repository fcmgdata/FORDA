EventListenerMethodProcessor accepts internal configuration classes  Issue: SPR-17160
Clean up warnings in spring-test
Move Body[Inserter|Extractor] to web.reactive.function
Improve diagnostics for invalid testGroup values
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
Fixed regression with fallback for non-resolvable property type
improve performance of projection instantiation
EventListenerMethodProcessor accepts internal configuration classes  Issue: SPR-17160
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
Move AdviceMode from .config to .annotation package
[Spring Boot] Tuned configuration callback execution order.
RESOLVED - issue SPR-6444: TaskExecutor not initialized in task namespace
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Use supplier-aligned type information for FactoryBean type resolution  Issue: SPR-17063
polish  Remove unused imports
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
Strong references to mapped exception handler methods  Issue: SPR-15907
Replace Promises.error->Streams.fail, concatMap->map
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
Consistent use of JDK 7 AssertionError with root cause  Issue: SPR-13188
Strong references to mapped exception handler methods  Issue: SPR-15907
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Update SpringConfiguration to support beans by type  Issue: SPR-10605
Support for bean refs in event SpEL condition  Issue: SPR-13814
Use streams and lambdas in spring-test where feasible  Issue: SPR-13188
Move AdviceMode from .config to .annotation package
Investigate issue with @ComponentScan as meta-annotation  This commit introduces unit and integration tests that attempt to reproduce the issue claimed by the reporter in SPR-11557. However, the tests pass without any problems.  Issue: SPR-11557
property placeholders can deal with nested expressions which happen to use the same suffix (SPR-7098)
Throw exception if TxMgr cannot be retrieved for @Transactional test  Prior to this commit, a @Transactional integration test would silently be executed without a transaction if the transaction manager could not be retrieved from the application context -- for example, it no such bean was defined or if multiple beans were present but none satisfied the qualifier.  This commit addresses this issue by throwing an IllegalStateException if the PlatformTransactionManager cannot be retrieved for a @Transactional test.  Issue: SPR-13895
Polish Javadoc for TestContext
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Implement java.io.Closeable where appropriate  Issue: SPR-9962
Fixed javadoc links
Throw exception if TxMgr cannot be retrieved for @Transactional test  Prior to this commit, a @Transactional integration test would silently be executed without a transaction if the transaction manager could not be retrieved from the application context -- for example, it no such bean was defined or if multiple beans were present but none satisfied the qualifier.  This commit addresses this issue by throwing an IllegalStateException if the PlatformTransactionManager cannot be retrieved for a @Transactional test.  Issue: SPR-13895
[Spring Boot] Tuned configuration callback execution order.
avoid unnecessary autoboxing
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
Evaluate @Cacheable(condition) once per method invocation only  Issue: SPR-17024
[Spring Boot] Tuned configuration callback execution order.
Use MockitoJUnitRunner from Mockito 2's preferred location  Issue: SPR-14880
AbstractAutowireCapableBeanFactory avoids early FactoryBean instantiation on currently created configuration bean  Issue: SPR-12141
Polishing  Issue: SPR-11910
Resolve ${} placeholders in @ImportResource  Update ConfigurationClassParser to resolve any ${} placeholders from @ImportResource values.  Issue: SPR-10686
SPR-7354 - Added equivalent of JAX-RS @Consumes to Spring MVC
Fix binary compatibility for SmartApplicationListener  Making sure that `GenericApplicationListenerAdapter` implements `SmartApplicationListener` again as older code may try to cast an instance to `SmartApplicationListener`.  Issue: SPR-8201
EventListenerMethodProcessor accepts internal configuration classes  Issue: SPR-17160
Renamed 'name' attribute to 'scopeName' (in order to avoid common override conflicts)  Issue: SPR-13239
Don't use single letter catch variables  Update existing catch blocks to ensure that `ex` is always used in preference to `e` or `t` as the variable name.  Issue: SPR-16968
improve performance of projection instantiation
[Spring Boot] Tuned configuration callback execution order.
RESOLVED - issue SPR-6444: TaskExecutor not initialized in task namespace
Use supplier-aligned type information for FactoryBean type resolution  Issue: SPR-17063
Allow access to applied property sources  Add PropertySourcesPlaceholderConfigurer.getAppliedPropertySources() to allow access to the PropertySources that were actually applied.  Issue: SPR-10545
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
Clean up warnings due to removal of legacy Jackson support
polish  Remove unused imports
Investigate issue with @ComponentScan as meta-annotation  This commit introduces unit and integration tests that attempt to reproduce the issue claimed by the reporter in SPR-11557. However, the tests pass without any problems.  Issue: SPR-11557
polish  Remove unused imports
avoid unnecessary autoboxing
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
Add missing break statements to stop looping when result is known  Closes gh-22573
Add missing @since tag
Change this "try" to a try-with-resources  Closes gh-1671
CAMEL-8478: IdempotentRepository - Add clear operation, fix clear operation in RedisIdempotentRepository
@Scheduled supports java.time.Duration format for its delay attributes  Issue: SPR-15455
Support for bean refs in event SpEL condition  Issue: SPR-13814
Polish "Join identical catch branches"  Closes gh-2052
Implement java.io.Closeable where appropriate  Issue: SPR-9962
Use streams and lambdas in spring-test where feasible  Issue: SPR-13188
Return 415 on bad request body content-type  Issue: SPR-10982
Update copyright header
Rename WebTestClientConnectorTests to match class name
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
generic ApplicationListener event type gets detected through proxy as well
Polishing  Issue: SPR-11910
Remove factory methods from  WebReactiveConfigurer  This commit removes factory methods for `RequestMappingHandlerMapping` and `RequestMappingHandlerAdapter` from `WebReactiveConfigurer`. `WebReactiveConfigurer` should promote only common customizations; those factory methods should be overridden when extending `WebReactiveConfigurationSupport`, in advanced configuration scenarios.
Implement java.io.Closeable where appropriate  Issue: SPR-9962
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
polish  Remove unused imports
@Scheduled supports java.time.Duration format for its delay attributes  Issue: SPR-15455
MatchableHandlerMapping extends HandlerMapping and lives in web.servlet.handler now  Issue: SPR-14321
Implement java.io.Closeable where appropriate  Issue: SPR-9962
improve performance of projection instantiation
Remove field no longer used after previous commit  Issue: SPR-11516
Clean up warnings in spring-test
Investigate issue with @ComponentScan as meta-annotation  This commit introduces unit and integration tests that attempt to reproduce the issue claimed by the reporter in SPR-11557. However, the tests pass without any problems.  Issue: SPR-11557
EventListenerMethodProcessor accepts internal configuration classes  Issue: SPR-17160
Stop suppressing warnings for deleted deprecations  This commit removes the use of @SuppressWarnings("deprecation") for code in the spring-test module that no longer references deprecated code.  Issue: SPR-10499
[Spring Boot] Tuned configuration callback execution order.
Support Date to String in JodaTimeConverters  Update JodaTimeConverters in include support for Date to String conversion.  The JodaTimeFormattingTests and DateFormattingTests have been extended to ensure that Date to String conversion is supported with or without Joda.  Issue: SPR-10198
Move limit and shuffle functions to IterableUtils
Modify actual & preferred partitioning for GroupIdNode  Default behavior for GroupId was to pass down parent partitioning preferences unchanged and also pass up child actual partitioning unchanged. However:  - Children of the GroupId plan node do not have access to new symbols (i.e. passthrough symbols) that are generated by the GroupId. These must be translated. - We cannot pass through preferences for symbols that are modified by GroupId (i.e. the set difference of the distinct and common grouping columns). These must be removed.
Convert tests to java.util.Optional
SPR-8429 Add test cases for missing header, cookie, and pathvar values
Improve QueryBuilder to support VARCHAR condition
Testing HTTP/2 5.1.2 Make maxConcurrentStream configurable so it can be tested I have a test for maxConcurrentStreams that works but it appears to be triggering some flow control bugs I need to iron out. Meanwhile, here are the fixes for the maxConcurrentStreams bugs it did find. Ensure headers payload is swallowed if the stream is rejected due to maxConcurrentStreams Only decrement active stream count when a stream goes inactive
Now need to close both streams
TIKA-468: Missing Silde-Count metadata for PPT files
Clean up warnings in spring-test
[java] Deleting unused imports
Implement java.io.Closeable where appropriate  Issue: SPR-9962
Increased ResolvableType unit test coverage  Issue: SPR-11034
ScriptUtils.executeSqlScript logs SQLWarnings at debug level  Issue: SPR-13959
WW-4095 WW-4094 Changes how pattern is compiled to be once per instance and changes default regexp to match underscore
Adding close connection support to HttpClient to combat hanging open files  Added a .close() method to org.openqa.selenium.remote.http.HttpClient interface.  Added a call to the client's .close() method from the HttpCommandExecutor class when a org.openqa.selenium.remote.DriverCommand.QUIT is sent.  Implemented the .close() method in org.openqa.selenium.remote.internal.ApacheHttpClient which taps the connectionManager and closes idle connections.  Fixes #1080  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Migrate array_greater_than_or_equal operator to new scalar framework
Remove deprecated method in ConnectorSplitSource
[java] Moving marionette specific test to the corresponding class
Make Arrayblock, MapBlock, RowBlock support mayHaveNull
Remove ThreadSafe annotation from OperatorContext and DriverContext
Adding an option to start Firefox in headless mode
PropertySource implementations perform conversion to String arrays via StringUtils (getting rid of EMPTY_NAMES_ARRAY)
Make EvaluationException more informative  Update EvaluationException to expose the toDetailedString() method as the exception message. The simple message can now be accessed via the new getSimpleMessage() method.  Issue: SPR-10938
Throw exception for delete from unpartitioned Hive table
MatchableHandlerMapping extends HandlerMapping and lives in web.servlet.handler now  Issue: SPR-14321
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=48230 Remove unused imports. Patch provided by sebb.
Prevent accidental treatment of GroupReference as real PlanNode
PropertySource implementations perform conversion to String arrays via StringUtils (getting rid of EMPTY_NAMES_ARRAY)
Improve shutdown responsiveness of SubProtocolWSH  Proactively notify all active WebSocket sessions when a shutdown is progress. Sessions then can ignore further attempts to send messages and also stop stop trying to flush messages right away.
Found existing comments test in TestParsers; clean up earlier tests for comments in xls and xlsx
Remove unnecessary class loader from resource group plugin
Introduce alias for 'value' attribute in @Payload  This commit introduces 'expression' as an alias for 'value' in @Payload.  Issue: SPR-11393
@Resource names may use ${...} placeholders (SPR-5656)
Revert "All SFBuilder setters return 'this' & use varargs"  This reverts commit 0e2ce565c9ef64d97299836a3b979b2cf85de759.
Do not accept number for RFC2822/ISO8601/Custom temporal field decoders
Handle non-equijoins with negated expressions  Normalize join criteria to support expressions like "not(l.x = r.x)"
Deleting unused imports
Add Servlet 3.1 methods to mock request  Issue: SPR-11492
Support CharSequence for response body  Issue: SPR-13423
Remove unnecessary method
Refactor concrete WebDriverException#getSupportUrl's  Extract urls to constants.  Signed-off-by: Daniel Davison <daniel.jj.davison@gmail.com>
Stop suppressing warnings for deleted deprecations  This commit removes the use of @SuppressWarnings("deprecation") for code in the spring-test module that no longer references deprecated code.  Issue: SPR-10499
WW-4688 Excludes "java.ext.dirs" when scanning for actions
Move Predicates util to com.facebook.presto.util.MorePredicates
HtmlUnit: disabling broken tests
Adding close connection support to HttpClient to combat hanging open files  Added a .close() method to org.openqa.selenium.remote.http.HttpClient interface.  Added a call to the client's .close() method from the HttpCommandExecutor class when a org.openqa.selenium.remote.DriverCommand.QUIT is sent.  Implemented the .close() method in org.openqa.selenium.remote.internal.ApacheHttpClient which taps the connectionManager and closes idle connections.  Fixes #1080  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
MatchableHandlerMapping extends HandlerMapping and lives in web.servlet.handler now  Issue: SPR-14321
2.x: Add empty source clauses to javadocs of combineLatest operators accepting unspecified number of sources. This commit resolves #5412 (#5413)
removed @since 3.0--no point if its not consistent and whole package is 3.0 anyway
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=55110 Small performance improvements Patch provided by Adrian Nistor
Added context destroyed for servlet context holder WW-1466
Refactoring use of a deprecated method
Explicit support of String[] value resolution  This commit adds an explicit support for String array for value resolution. <util:properties> switches the 'locations' property to a String array in 662d8aa and this broke expression evaluation.  Issue: SPR-12391
Make LocalExchange aware of writer finish
bug 10869: always allocate first ip address from the range for the dhcp server. status 10869: resolved fixed  Here is the flow (design is approved by Will Chan):  1) If user specifies custom ip address, and this ip is not the first ip in the range, the dhcp server gets the ip. 2) If user specifies custom ip address, and this ip is the first ip in the range, the dhcp server will get the random ip address from the range. 2) If user doesn't specify custom ip address, we always try to allocate first ip address from the range for the dhcp server; if this ip is already allocated, the dhcp server will get the random ip from the range.  This will work for:  * domR's Guest network * dhcp's Direct network
Add encoding for the default action in FormTag  Issue: SPR-11426
Ordered WebMvcConfigurer interceptor registrations  Issue: SPR-15620
Remove bogus DataSource test from JpaTransactionManagerTests
Rename CovarianceAggregation  This is to allow introducing FloatCovarianceAggregation.
Categorize error for rand(<=0)
Bind file rename executor as ListeningExecutorService  - Also use cached thread pool and bounded executor to reduce memory footprint for thread management
add methods for serializing individual objects
Move StatementResource to its own package
Revised NoSuchBeanDefinitionException message for proper array class names  Issue: SPR-14595
[chromedriver] Expose chromedriver "execute CDP command" command
Using IOChannelUtils to resolve file path
Fix a few typos  Minor changes to fix typos. Small adjustment to add a couple commas.
Add getRawSlice to BlockCursor interface
InjectionPoint propagated for shortcut bean name resolution as well  Issue: SPR-14400
Clean up warnings in spring-websocket
Use MockitoJUnitRunner from Mockito 2's preferred location  Issue: SPR-14880
Polish HttpRequestBuilder API  This commit makes messageEncoders a required argument for building a client request - those are needed to actually encode the body object as a reactive stream to be written to the HTTP request body.  Removed raw types usage in DefaultHttpRequestBuilder.  DefaultHttpRequestBuilder now uses a UriTemplateHandler to expand URI templates + variables into a concrete URI.  Fixes #80, fixes #85, fixes #86
Validate types for IN subquery expression
Polishing  Issue: SPR-11910
Resolve ${} placeholders in @ImportResource  Update ConfigurationClassParser to resolve any ${} placeholders from @ImportResource values.  Issue: SPR-10686
add missing license headers  Patch by eevans
Fix outdated Javadoc in the TestContext framework  Fixed outdated Javadoc regarding support for 'annotated classes' in the TestContext Framework.
New method in the Tuple interface "boolean isTuple()" for easier handling of TickTuples.
Support overriding, removing headers in ClientRequest  This commit adds two Consumer based methods to ClientRequest that allow for direct manipulation of the underlying headers or cookies map. As such, these methods can be used to override or remove existing entries.  Issue: SPR-15635
2.x: Make Flowable.fromCallable consitent with the other fromCallables (#6158)  2.x: Make Flowable.fromCallable consistent with the other fromCallables
Add license headers.  r1471
Expand all types to produce a 64bit hash code
Merging capabilities to options should be fluent
WW-4110 Marks AOP support as deprecated
Don't use single letter catch variables  Update existing catch blocks to ensure that `ex` is always used in preference to `e` or `t` as the variable name.  Issue: SPR-16968
AlexeiBarantsev: Ignoring tests for the browsers that don't support yet 'true or null' paradigm for boolean attributes  r16981
Return SslInfo only if X509Certificate[] present  Issue: SPR-16842
avoid unnecessary autoboxing
Propagate wrapped exception in SessionFactoryUtils  Improve stack traces in certain Hibernate failure cases by properly chaining the cause exception.  Issue: SPR-7933
Fixed WebExtensions installation  Fixed installation of new firefox webextension built with new WebExtension API i.e. the one which contains manifest.json instead of install.rdf  Fixes #4093  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Remove unnecessary duplication
Add a field to query statistics  When a query finishes, if we fail to fetch the final stats, we log the completion event with the latest available stats. Add a flag indicating that the logged stats are not complete.
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=48230 Remove unused imports. Patch provided by sebb.
Factor out Rule#isEnabled(Session)
SPR-7081 - Add ignoreJafMediaTypes to ContentNegotiatingViewResolver
Deprecate InstanceListener, InstanceEvent and InstanceSupport prior to removal
Improve error reporting. - Be more precise about the location of the file with the error - Don't swallow exceptions
Rename method for clarity
Fix ResourceUrlProvider path check in getForRequestUrl  Prior to this change, getForRequestUrl implementation would only work for applications with a non-empty servlet path. So web applications mapped to "/" would trigger a IllegalStateException while checking the current request against the request path within the current mapping.  This change relaxes this and only check that the path within mapping is within the request URL.  Issue: SPR-12158
LazySingletonAspectInstanceFactoryDecorator uses shared singleton mutex  Issue: SPR-14241
Remove "presto" from uris
Lazily resolve the default exception CacheResolver  This is a rework of 314b069 that may still lead to issue if a Cacheable annotated bean is inspected on startup. Instead of resolving the default exception CacheResolver if a cache operation is parsed, we resolve it as late as possible (i.e. when an exception is thrown and the relevant exception cache needs to be resolved)  Issue: SPR-12850
fixed some generics related warnings and did a little re-formatting
Replace ExpressionAnalysis.getColumnReferences with isColumnReference
TIKA-346: ZipParser throws "invalid compression method" error for some archives
Consistent exclusion of bridge methods in annotation post-processors (for Java 8 compatibility)  Issue: SPR-12187
Update javadoc with @since
TIKA-416: Out-of-process text extraction  More javadocs and some cleanup.
Remove some unneeded unboxing, unneeded methods, made some stuff private that can be
Polish Javadoc for ZoneIdEditor & TimeZoneEditor
add more comments
WW-1453  Simple cleanup items   - remove duplicate and/or unused imports   - change static access to class, not instance
Now need to close both streams
Add flag to restore legacy array_agg behavior  The flag is named experimental.legacy-array-agg, which is default to be false. When it is set to true, array_agg will ignore the null values.
Cleanup grouping AST classes
Lazily resolve the default exception CacheResolver  This is a rework of 314b069 that may still lead to issue if a Cacheable annotated bean is inspected on startup. Instead of resolving the default exception CacheResolver if a cache operation is parsed, we resolve it as late as possible (i.e. when an exception is thrown and the relevant exception cache needs to be resolved)  Issue: SPR-12850
SPR-7031 - MappingJacksonJsonView should add headers for no-caching
minor javadoc improvements
SimonStewart: Move chrome tests to junit4  r16029
ResultType.EXCEPTION and ResultType.ERROR are handled the exact same way, so remove one of them and simplify some code.
Handle unresolved view name
Remove unintended dependency on Servlet API in SockJS  Add a factory method in ServerHttpRequest for creating a ServerHttpAsyncRequestControl.
SPR-7354 - Added equivalent of JAX-RS @Consumes to Spring MVC
Increased ResolvableType unit test coverage  Issue: SPR-11034
Adding close connection support to HttpClient to combat hanging open files  Added a .close() method to org.openqa.selenium.remote.http.HttpClient interface.  Added a call to the client's .close() method from the HttpCommandExecutor class when a org.openqa.selenium.remote.DriverCommand.QUIT is sent.  Implemented the .close() method in org.openqa.selenium.remote.internal.ApacheHttpClient which taps the connectionManager and closes idle connections.  Fixes #1080  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Proper use of setComplete in ContextPathCompositeHandler  Issue: SPR-17144
Unignoring more passing tests for HtmlUnitDriver
Add WorkProcessor#transformProcessor method  This methods allows to write more streamlined transformations of the processor itself, e.g:  processor.transformProcessor(WorkProcessorUtils::flatten)
ComputationScheduler -> EventLoopsScheduler  - This implementation is used by Schedulers.computation() but is actually a pool of event loops, so renaming.
Properly account for time spent creating page source  The isFinished() method for the table scan operators was creating the page source which is not tracked by Driver. Instead, the page source should only be created in the getOutput() method.
Add QueryStateMachine.getFailureInfo to avoid creation of QueryInfo
Use an EnumMap instead of a HashMap when the key is an enum
SPR-7971 + add target object to KeyGenerator
Remove unnecessary method
Fix bing_tile_coordinates function to produce row block  Previously, bing_tile_coordinates was producing a IntArrayBlock of length 2 to represent ROW(INTEGER, INTEGER). This no longer works since RowBlockBuilder.appendStructure method now requires a row block as of 630ec959c4e29d09c3b46cba2085e320d815f1ac.
Rename field in HandlerResult
add more comments
adding TakesScreenshot to WebElement, not going down the Augmentor route right now since that is setup just for WebDriver.  If someone really really likes the augmentor pattern, they can update it to also take into consideration WebElements and look at the Parent Driver instance's capabilities to determine which roles (interfaces) should be applied. I don't really care for it much and would rather get an exception from the driver that it is not implemented :)
Polish "Join identical catch branches"  Closes gh-2052
Removed TestGroup.LONG_RUNNING marker from Groovy and JRuby tests
Add missing @since tag
[Spring Boot] Tuned configuration callback execution order.
Use supplier-aligned type information for FactoryBean type resolution  Issue: SPR-17063
Issue #3065: expanded message test to all locales
Use explicit charset in test code. #1555  Fixes some `ImplicitDefaultCharsetUsage` inspection violations.  Description: >Reports method and constructor calls which implicitly use the platform's default charset. These can produce different results on (e.g. foreign language) systems that use a different default charset, resulting in unexpected behaviour.
Support empty body in Jackson2JsonDecoder.decodeToMono  Prior to this commit, extracting an HTTP response with an empty body and no Content-Type header using the WebClient would:  * trigger the use of the Jackson2JsonDecoder * throw a NoSuchElementException because of the use of `Flux.single()`  This commit changes this behavior to `Flux.singleOrEmpty()` to avoid throwing exceptions for empty Flux instances.  Issue: SPR-14582
CAMEL-9309: Make it easier to turn on|off java transport over http
Clarification for using Object in UserAggregation
CLOUDSTACK-10360: Change the method name. (#2598)  The method is named as "scoped" that seems to whether the variable config is scoped in _scopedStorages or not. Actually, the method tries to find a storage of which scope equals to the scope of config. So that, the method name "findStorage" should be more clear than "scoped".
Introduce ServerRequest.methodName()  This commit introduces a methodName() method to the ServerRequest, returning the String name of the method. This method is useful for non-standard HTTP methods.
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
Make inner classes static where possible.
Polish: follow naming convention
Remove redundant 'new' expression in constant array creation
[Spring Boot] Tuned configuration callback execution order.
Reasonable defaults for MultipartHttpMessageWriter  MultipartHttpMessageWriter is now configured to handle JSON and XML out of the box.
Repeat/retry: fixed unbounded downstream requesting above Long.MAX_VALUE
polish  Remove unused imports
[Spring Boot] Tuned configuration callback execution order.
Support Date to String in JodaTimeConverters  Update JodaTimeConverters in include support for Date to String conversion.  The JodaTimeFormattingTests and DateFormattingTests have been extended to ensure that Date to String conversion is supported with or without Joda.  Issue: SPR-10198
[Spring Boot] Added support for multiple conversion services.
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Use streams and lambdas in spring-test where feasible  Issue: SPR-13188
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
PropertySource implementations perform conversion to String arrays via StringUtils (getting rid of EMPTY_NAMES_ARRAY)
Investigate issue with @ComponentScan as meta-annotation  This commit introduces unit and integration tests that attempt to reproduce the issue claimed by the reporter in SPR-11557. However, the tests pass without any problems.  Issue: SPR-11557
Suppress warnings in Gradle build
Move AdviceMode from .config to .annotation package
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Rename WebTestClientConnectorTests to match class name
Fixed event listener caching through equals/hashCode on SyntheticParameterizedType  Issue: SPR-13540
[Spring Boot] Tuned configuration callback execution order.
MAHOUT-1258: Another shot at findbugs and checkstyle - removed unused imports
[FLINK-4875] [metrics] Use correct operator name  This closes #2676.
Remove some unneeded unboxing, unneeded methods, made some stuff private that can be
KAFKA-3840; Allow clients default OS buffer sizes  Follow up on KAFKA-724 (#1469) to allow OS socket buffer sizes auto tuning for both the broker and the clients.  Author: Sebastien Launay <sebastien@opendns.com>  Reviewers: Sriharsha Chintalapani <harsha@hortonworks.com>, Grant Henke <granthenke@gmail.com>, Ismael Juma <ismael@juma.me.uk>  Closes #1507 from slaunay/enhancement/os-socket-buffer-size-tuning-for-clients
Return unmodifiable collections from methods. #1555  Fixes `ReturnOfCollectionField` inspection violations.  Description: >Reports any attempt to return an array or Collection field from a method. Since the array or Collection may have its contents modified by the calling method, this construct may result in an object having its state modified unexpectedly. While occasionally useful for performance reasons, this construct is inherently bug-prone.
Support encodeUrl mechanism via ServerHttpResponse  Issue: SPR-14529
Drops support for handleUnknownAllowedMethod as it was added to satisfy test
3.x: JavaDocs: clarify create emitters are per consumer (#6535)
Use explicit charset in test code. #1555  Fixes some `ImplicitDefaultCharsetUsage` inspection violations.  Description: >Reports method and constructor calls which implicitly use the platform's default charset. These can produce different results on (e.g. foreign language) systems that use a different default charset, resulting in unexpected behaviour.
Add read timeouts to http module (#27713)  We currently do not have any server-side read timeouts implemented in elasticsearch. This commit adds a read timeout setting that defaults to 30 seconds. If after 30 seconds a read has not occurred, the channel will be closed. A timeout of value of 0 will disable the timeout.
Query String: Add `lenient` flag to support *value* parse failures, closes #1932.
Small format changes in script and monitor packages  Just three files - just adding {}s to if and for statements or making them single line.
SPR-6786: added more checks for quality factors & charsets
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
Consolidate use of assertFileExists
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
Consolidate use of assertFileExists
minor: removed exceptions not thrown
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
Suppress warnings and remove unused imports
correctly handle ParseException from Formatter for String->String case (SPR-8944)
RESOLVED - issue SPR-6444: TaskExecutor not initialized in task namespace
Use LinkedHashmap to preserve insert order  In several places in the spring-webmvc module, URL patterns / objects relationships are kept in `HashMap`s. When matching with actual URLs, the algorithm uses a pattern comparator to sort the matching patterns and select the most specific. But the underlying collection implementation does not keep the original order which can lead to inconsistencies.  This commit changes the underlying collection implementation to `LinkedHashmap`s, in order to keep the insert order if the comparator does not reorder entries.  Issue: SPR-13798
Strong references to mapped exception handler methods  Issue: SPR-15907
Polishing  Issue: SPR-11910
polish  Remove unused imports
Made StrutsJunit4 classes abstract
Add reset() to MockRestServiceServer  Issue: SPR-14306
TIKA-468: Missing Silde-Count metadata for PPT files
Polishing  Issue: SPR-11910
DRILL-2651: Increase JDBC tests' timeout time.  Added overriding timeout rule for test that have been timing out increasingly: - TestJdbcMetadata - Drill2128GetColumnsDataTypeNotTypeCodeIntBugsTest
Update 2.3 store file to include legacy indexes to check legacy index migrations.
Explicitly use e.getMessage() for log message formatting  patch by Zhao Yang; reviewed by Stefan Podkowinski for CASSANDRA-13723
CAMEL-7999: Added missing name to JAXB in the DSL for the resequencer config types
[CORE] Remove leftover unused constants
ca: Fixes #2877 mgmt server cert should have all addrs of default nic (#2879)  This fixes the default RootCA provider implementation to initiate and issue certificate for mgmt server on startup for all the IP addresses on the default nic of that host.  Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>
[CORE] Remove leftover unused constants
Clean up warnings in Gradle build
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=48230 Remove unused imports. Patch provided by sebb.
[CALCITE-1394] Javadoc warnings due to CoreMatchers.containsString and mockito-all  Change occurrences of CoreMatchers.containsString to StringContains.containsString, and CoreMatchers.startsWith to StringStartsWith.startsWith, to be compatible with the version of hamcrest inside mockito-all.
MAHOUT-999, Creating directories to write Clustering Policies. For both KMeans and FuzzyK. All Junit Tests Pass. Clusters-Reuters.sh kmeans and fuzzyk both run successfully.
Small format changes in script and monitor packages  Just three files - just adding {}s to if and for statements or making them single line.
Polishing  Issue: SPR-11910
Replace 'utf=8' str with StandardCharset  Summary: safer  Reviewed By: rajyengi  fbshipit-source-id: ae0770d52d
Resolve ${} placeholders in @ImportResource  Update ConfigurationClassParser to resolve any ${} placeholders from @ImportResource values.  Issue: SPR-10686
