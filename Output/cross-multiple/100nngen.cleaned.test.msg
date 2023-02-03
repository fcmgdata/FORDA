Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Clean up warnings in spring-test
Remove unused imports
Deleting a method used in a single test only.
Polish: Lambdas should be replaced with method references
Rename class CamelMvcRoutesEndpoint to CamelRoutesMvcEndpoint  Signed-off-by: Gregor Zurowski <gregor@zurowski.org>
Rename class CamelMvcRoutesEndpoint to CamelRoutesMvcEndpoint  Signed-off-by: Gregor Zurowski <gregor@zurowski.org>
Fixed regression with fallback for non-resolvable property type
make this less syntactically confusing
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
[Spring Boot] Tuned configuration callback execution order.
Move AdviceMode from .config to .annotation package
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Set ResponseStatusExceptionResolver.messageSource in the MVC Java config  Issue: SPR-12380
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Use supplier-aligned type information for FactoryBean type resolution  Issue: SPR-17063
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
Polish: Lambdas should be replaced with method references
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
Simplify String concatenation
Added readonly version of HttpHeaders
Rename class CamelMvcRoutesEndpoint to CamelRoutesMvcEndpoint  Signed-off-by: Gregor Zurowski <gregor@zurowski.org>
Modify how SpringConfigurator finds Endpoint singleton  First try the endpoint type name converted to property Then try @Component value  Issue: SPR-10605
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Stop suppressing warnings for deleted deprecations  This commit removes the use of @SuppressWarnings("deprecation") for code in the spring-test module that no longer references deprecated code.  Issue: SPR-10499
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Investigate issue with @ComponentScan as meta-annotation  This commit introduces unit and integration tests that attempt to reproduce the issue claimed by the reporter in SPR-11557. However, the tests pass without any problems.  Issue: SPR-11557
Add JdbcTestUtils.deleteRowsInTableWhere method  Issue: SPR-10302
Throw exception if TxMgr cannot be retrieved for @Transactional test  Prior to this commit, a @Transactional integration test would silently be executed without a transaction if the transaction manager could not be retrieved from the application context -- for example, it no such bean was defined or if multiple beans were present but none satisfied the qualifier.  This commit addresses this issue by throwing an IllegalStateException if the PlatformTransactionManager cannot be retrieved for a @Transactional test.  Issue: SPR-13895
Polish Javadoc for TestContext
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Implement java.io.Closeable where appropriate  Issue: SPR-9962
Segregate tests that depend on the jmxmp: protocol  This commit introduces TestGroup#JMXMP and adds assumptions to related tests accordingly. These tests require the jmxoptional_remote jar on the classpath, and are run nightly in the SPR-PERF build.  Issue: SPR-8089
Delete trailing whitespace in spring-test
[Spring Boot] Tuned configuration callback execution order.
Cleanup of duplicate semicolons  Issue: SPR-15654
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
[Spring Boot] Tuned configuration callback execution order.
Use supplier-aligned type information for FactoryBean type resolution  Issue: SPR-17063
Rename class CamelMvcRoutesEndpoint to CamelRoutesMvcEndpoint  Signed-off-by: Gregor Zurowski <gregor@zurowski.org>
Clean up warnings in spring-web tests
AbstractAutowireCapableBeanFactory avoids early FactoryBean instantiation on currently created configuration bean  Issue: SPR-12141
Rename class CamelMvcRoutesEndpoint to CamelRoutesMvcEndpoint  Signed-off-by: Gregor Zurowski <gregor@zurowski.org>
Tests for @Lazy Validator setup  Issue: SPR-15807
SPR-7354 - Added equivalent of JAX-RS @Consumes to Spring MVC
Fixed event listener caching through equals/hashCode on SyntheticParameterizedType  Issue: SPR-13540
Polish: Lambdas should be replaced with method references
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Don't use single letter catch variables  Update existing catch blocks to ensure that `ex` is always used in preference to `e` or `t` as the variable name.  Issue: SPR-16968
SPR-17492: FastByteArrayOutputStream.read byte-to-int conversion
[Spring Boot] Tuned configuration callback execution order.
Resolve ${} placeholders in @ImportResource  Update ConfigurationClassParser to resolve any ${} placeholders from @ImportResource values.  Issue: SPR-10686
generic ApplicationListener event type gets detected through proxy as well
SPR-6021 - Allow for using MultiValueMap in GET request for mapping multiple request params
Delete unused imports
Update to latest Reactor 3.1 API changes  Issue: SPR-15318
Use StringJoiner where possible to simplify String joining
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Delete unused imports
Cleanup of duplicate semicolons  Issue: SPR-15654
Add checkNotModified support for view resolution  Issue: SPR-14522
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Polish: Lambdas should be replaced with method references
Change this "try" to a try-with-resources  Closes gh-1671
CAMEL-8478: IdempotentRepository - Add clear operation, fix clear operation in RedisIdempotentRepository
@Scheduled supports java.time.Duration format for its delay attributes  Issue: SPR-15455
Support for bean refs in event SpEL condition  Issue: SPR-13814
Nested properties support for field-based validation  This commit validates that the changes introduced in 8221c9abc5 are indeed allowing DirectFieldBindingResult to support nested validation paths.  Issue: SPR-10623
Implement java.io.Closeable where appropriate  Issue: SPR-9962
Delete unused imports
[Spring Boot] Tuned configuration callback execution order.
Update copyright header
Rename WebTestClientConnectorTests to match class name
Rename class CamelMvcRoutesEndpoint to CamelRoutesMvcEndpoint  Signed-off-by: Gregor Zurowski <gregor@zurowski.org>
generic ApplicationListener event type gets detected through proxy as well
Use lambda expressions for lazy instantiation (#1911)  Issue: SPR-17074
Add checkNotModified support for view resolution  Issue: SPR-14522
Implement java.io.Closeable where appropriate  Issue: SPR-9962
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Delete unused imports
@Scheduled supports java.time.Duration format for its delay attributes  Issue: SPR-15455
Consistently avoid close() call on Servlet OutputStream  Issue: SPR-11413
EventListenerMethodProcessor accepts internal configuration classes  Issue: SPR-17160
improve performance of projection instantiation
Cleanup of duplicate semicolons  Issue: SPR-15654
Switch to Jackson 2 in unit tests  Prior to this commit, some unit tests were using Spring's Jackson 1.x implementations. Now Jackson 2.x implementations are the default ones used in unit tests.  Even if Jackson 1.x support is deprecated, Jackson 1.x unit tests are kept.  Issue: SPR-11121
Delete unused imports
EventListenerMethodProcessor accepts internal configuration classes  Issue: SPR-17160
Stop suppressing warnings for deleted deprecations  This commit removes the use of @SuppressWarnings("deprecation") for code in the spring-test module that no longer references deprecated code.  Issue: SPR-10499
[Spring Boot] Tuned configuration callback execution order.
EventListenerMethodProcessor accepts internal configuration classes  Issue: SPR-17160
Move limit and shuffle functions to IterableUtils
Modify actual & preferred partitioning for GroupIdNode  Default behavior for GroupId was to pass down parent partitioning preferences unchanged and also pass up child actual partitioning unchanged. However:  - Children of the GroupId plan node do not have access to new symbols (i.e. passthrough symbols) that are generated by the GroupId. These must be translated. - We cannot pass through preferences for symbols that are modified by GroupId (i.e. the set difference of the distinct and common grouping columns). These must be removed.
Convert tests to java.util.Optional
SPR-8429 Add test cases for missing header, cookie, and pathvar values
Improve QueryBuilder to support VARCHAR condition
Refactoring: HTTP/1.1 - HTTP/2 alignment  Change StreamOutputBuffer to implement HttpOutputBuffer
Add some Javadoc
TIKA-468: Missing Silde-Count metadata for PPT files
Cleanup of duplicate semicolons  Issue: SPR-15654
[java] Deleting unused imports
Marked Jackson 1.x support classes as deprecated
Provide 'with implementationType' overloads  Provided overloaded versions of `forField` and `forMethodParameter` that accept a `ResolvableType` implementation type (as opposed to a Class).  Primarily added to allow resolution against implementation types that have been created programmatically using `forTypeWithGenerics`.  Issue: SPR-11218
Improve Javadoc in SQL script support classes
WW-4095 WW-4094 Changes how pattern is compiled to be once per instance and changes default regexp to match underscore
Adding close connection support to HttpClient to combat hanging open files  Added a .close() method to org.openqa.selenium.remote.http.HttpClient interface.  Added a call to the client's .close() method from the HttpCommandExecutor class when a org.openqa.selenium.remote.DriverCommand.QUIT is sent.  Implemented the .close() method in org.openqa.selenium.remote.internal.ApacheHttpClient which taps the connectionManager and closes idle connections.  Fixes #1080  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Migrate NOT_EQUAL operator for arrays to new framework
Add default method getColumnTypes to SystemTable
[java] Moving marionette specific test to the corresponding class
Make Arrayblock, MapBlock, RowBlock support mayHaveNull
Remove ThreadSafe annotation from OperatorContext and DriverContext
Adding a method to enable insecure cert support via FirefoxOptions
Use DataBufferUtils.compose and remove writeAggregator  Use DataBufferUtils.compose instead of writeAggregator to combine multiple data buffers into one, as the write aggregator would not work when the initial data buffer did not have enough capacity to contain all subsequent buffers.  Removed writeAggregator, as it is no longer needed.  Issue: SPR-16365
Suppress warnings in spring-expression tests
Throw exception for delete from unpartitioned Hive table
SPR-5866 - RestTemplate - access to Request Headers
Remove unused imports idnetified by Eclipse
Add broadcast system partitioning  Although not actually a partitioning this make it posible to require a partitioning declaration in all cases.
Add ByteBuf leak detection @Rule  This commit introduces a JUnit rule that detects ByteBuf leaks in subclasses of AbstractDataBufferAllocatingTestCase.
Clean up spring-websocket imports  spring-websocket is full of unused imports. This commit removes all unused imports from spring-websocket.
TIKA-712: master slide's text is now extracted
Refactor ResourceGroupSelector injection
Introduce alias for 'value' attribute in @Payload  This commit introduces 'expression' as an alias for 'value' in @Payload.  Issue: SPR-11393
relaxed warning about ambiguous setters to only be logged in case of actual write access (SPR-6399)
Revert "All SFBuilder setters return 'this' & use varargs"  This reverts commit 0e2ce565c9ef64d97299836a3b979b2cf85de759.
Do not accept number for RFC2822/ISO8601/Custom temporal field decoders
Fix creating views for tables names that need quoting  Table names may contain special characters and should be quoted when formatting SQL queries. For example, creating a view with this query fails: SELECT count(*) FROM "$test"
implement local and session storage for w3c
turned requestedSessionId into a settable property
Support CharSequence for response body  Issue: SPR-13423
Fix NPE to use Http11NioProtocol handler with default parameters! # example: <Executor name="tomcatThreadPool" namePrefix="catalina-exec-"          maxThreads="150" minSpareThreads="4"/> <Connector executor="tomcatThreadPool"                port="8080" protocol="org.apache.coyote.http11.Http11NioProtocol"                 connectionTimeout="20000"                 redirectPort="8443" />  Used at MAC OS X with "-Djava.net.preferIPv4Stack=true"  I am not sure that default returns are correct!
HtmlUnitDriver: Throwing NoSuchWindowException if the current window was closed.
Renamed @WebTests to @WebTest  @WebTests has been renamed to @WebTest so that the Gradle build does not attempt to run it as a JUnit test.
WW-4688 Excludes "java.ext.dirs" when scanning for actions
Move PlanPrinter to sql.planner.planPrinter package  extraction of inner-classes as package-private top-level classes will follow.
SimonStewart: Marking failing chrome tests as ignored to green the build.  r16358
Adding close connection support to HttpClient to combat hanging open files  Added a .close() method to org.openqa.selenium.remote.http.HttpClient interface.  Added a call to the client's .close() method from the HttpCommandExecutor class when a org.openqa.selenium.remote.DriverCommand.QUIT is sent.  Implemented the .close() method in org.openqa.selenium.remote.internal.ApacheHttpClient which taps the connectionManager and closes idle connections.  Fixes #1080  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Rename CorsConfigurationMapping to UrlBasedCorsConfigurationSource  Issue: SPR-13192
2.x: Add empty source clauses to javadocs of combineLatest operators accepting unspecified number of sources. This commit resolves #5412 (#5413)
Polishing  Issue: SPR-10469
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=55110 Small performance improvements Patch provided by Adrian Nistor
Minor tweaks to tests to reduce memory usage WW-1715
Thirdparty tests go in the thirdparty package   r5641
Explicit support of String[] value resolution  This commit adds an explicit support for String array for value resolution. <util:properties> switches the 'locations' property to a String array in 662d8aa and this broke expression evaluation.  Issue: SPR-12391
Add getRawHash method to GroupByHash
bug 10579: disable pool vm sync and disable hostTrack for XenServer,  status 10579: resolved fixed  reviewed-by: alex  Conflicts:      core/src/com/cloud/hypervisor/xen/resource/CitrixResourceBase.java
Add encoding for the default action in FormTag  Issue: SPR-11426
Ordered WebMvcConfigurer interceptor registrations  Issue: SPR-15620
Remove bogus DataSource test from JpaTransactionManagerTests
Rename CovarianceAggregation  This is to allow introducing FloatCovarianceAggregation.
Make round() return NaN when input is NaN  This was a regression in a recent change: 54eeef93
Bind file rename executor as ListeningExecutorService  - Also use cached thread pool and bounded executor to reduce memory footprint for thread management
added transaction state tostring methods for debugging
Expose OrderingCompiler cache stats via JMX
Revised NoSuchBeanDefinitionException message for proper array class names  Issue: SPR-14595
[chromedriver] Expose chromedriver "execute CDP command" command
WW-2623 Struts 2.1.3 omnibus ticket o optimzed imports
Fix a few typos  Minor changes to fix typos. Small adjustment to add a couple commas.
Remove type from BlockEncoding
InjectionPoint propagated for shortcut bean name resolution as well  Issue: SPR-14400
Add user to DISCONNECT in StompSubProtocolHandler  Issue: SPR-12215
Temporary workaround for JDK 8 test compilation/execution problem  Issue: SPR-9639
Polish: Lambdas should be replaced with method references
Short term fix for UNION ordering expectation
Polishing  Issue: SPR-11910
Resolve ${} placeholders in @ImportResource  Update ConfigurationClassParser to resolve any ${} placeholders from @ImportResource values.  Issue: SPR-10686
TIKA-314: Initial support for JPEG EXIF metadata extraction  Add license headers, generics
Polishing test annotation declarations and JavaDoc.
STORM-741: Allow users to pass a config value to perform impersonation.
Add ClientRequest.attribute(String)  This commit adds the attribute(String) convenience method to the ClientRequest class. It also adapts the Basic Authentication filter to use it.
2.x: Single.subscribe() to report isDisposed() true on success/error (#5163)
Add license headers.  r1471
Remove redundant overrides
Merging capabilities to options should be fluent
WW-3562 - FileUploadInterceptor: File not uploaded when file is empty (0 bytes)
Check for null on the argument instead of the message  See gh-1307 Issue: SPR-15196
[java] Ignoring failed tests
Log unresolved exceptions at error level
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
Polishing  Issue: SPR-11291
Fixed WebExtensions installation  Fixed installation of new firefox webextension built with new WebExtension API i.e. the one which contains manifest.json instead of install.rdf  Fixes #4093  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Move classes from org.apache to org.apache.tomcat
Rename query.initial-hash-partitions property  Rename the query.initial-hash-partitions to query.hash-partition-count to match the session property name
Remove unused imports idnetified by Eclipse
Lookup.resolveGroup returns a Stream instead of List  Stream doesn't enforce any materialization of plan nodes
Add detectHandlerMethodsInAncestorContexts property to AbstractHandlerMethodMapping.
Deprecate InstanceListener, InstanceEvent and InstanceSupport prior to removal
Remove deprecated code
Make the list of encoders available where they are needed
Fix ResourceUrlProvider path check in getForRequestUrl  Prior to this change, getForRequestUrl implementation would only work for applications with a non-empty servlet path. So web applications mapped to "/" would trigger a IllegalStateException while checking the current request against the request path within the current mapping.  This change relaxes this and only check that the path within mapping is within the request URL.  Issue: SPR-12158
Suppressing unchecked and serial warnings.
Remove "presto" from uris
move default value wrapper into support package (rather then interceptor)
change default behavior
Replace ExpressionAnalysis.getColumnReferences with isColumnReference
Replace 1.0 with 0.10 in @since statements
Consistent exclusion of bridge methods in annotation post-processors (for Java 8 compatibility)  Issue: SPR-12187
Replace 1.0 with 0.10 in @since statements
TIKA-416: Out-of-process text extraction  More javadocs and some cleanup.
Remove some unneeded unboxing, unneeded methods, made some stuff private that can be
Polish Javadoc for ZoneIdEditor & TimeZoneEditor
MINOR: JavaDoc improvements for RangeAssignor (#4079)
WW-1453  Simple cleanup items   - remove duplicate and/or unused imports   - change static access to class, not instance
Refactoring. Remove PACKAGE_NAME constant.
Add flag to restore legacy array_agg behavior  The flag is named experimental.legacy-array-agg, which is default to be false. When it is set to true, array_agg will ignore the null values.
Add max_tasks_per_stage session property  And coresponding stage.max-tasks-per-stage configuration property
Lazily resolve the default exception CacheResolver  This is a rework of 314b069 that may still lead to issue if a Cacheable annotated bean is inspected on startup. Instead of resolving the default exception CacheResolver if a cache operation is parsed, we resolve it as late as possible (i.e. when an exception is thrown and the relevant exception cache needs to be resolved)  Issue: SPR-12850
SPR-7031 - MappingJacksonJsonView should add headers for no-caching
minor javadoc improvements
SimonStewart: Move chrome tests to junit4  r16029
Finishing rename of SeleniumProxy to SeleniumServer  r1916
Handle unresolved view name
Remove unintended dependency on Servlet API in SockJS  Add a factory method in ServerHttpRequest for creating a ServerHttpAsyncRequestControl.
SPR-7354 - Added equivalent of JAX-RS @Consumes to Spring MVC
Increased ResolvableType unit test coverage  Issue: SPR-11034
Adding close connection support to HttpClient to combat hanging open files  Added a .close() method to org.openqa.selenium.remote.http.HttpClient interface.  Added a call to the client's .close() method from the HttpCommandExecutor class when a org.openqa.selenium.remote.DriverCommand.QUIT is sent.  Implemented the .close() method in org.openqa.selenium.remote.internal.ApacheHttpClient which taps the connectionManager and closes idle connections.  Fixes #1080  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Support encodeUrl mechanism via ServerHttpResponse  Issue: SPR-14529
Unignoring more passing tests for HtmlUnitDriver
Add WorkProcessor#transformProcessor method  This methods allows to write more streamlined transformations of the processor itself, e.g:  processor.transformProcessor(WorkProcessorUtils::flatten)
Extracted ScheduledObserver as a separate class
Rename PagesHashStrategy compare to compareSortChannelPositions
Add QueryStateMachine.getFailureInfo to avoid creation of QueryInfo
Use an EnumMap instead of a HashMap when the key is an enum
SPR-7971 + add target object to KeyGenerator
Readd blocking (for now) and fix loop indexes (ooops).
[GeoSpatial] Add xxHash64 operator to Bing Tiles  In particular, this enables operators like approx_distinct which requires the object to be xxHashable.
Log unresolved exceptions at error level
STORM-741: Allow users to pass a config value to perform impersonation.
adding TakesScreenshot to WebElement, not going down the Augmentor route right now since that is setup just for WebDriver.  If someone really really likes the augmentor pattern, they can update it to also take into consideration WebElements and look at the Parent Driver instance's capabilities to determine which roles (interfaces) should be applied. I don't really care for it much and would rather get an exception from the driver that it is not implemented :)
Revised deprecation markers
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Polish: Lambdas should be replaced with method references
Use supplier-aligned type information for FactoryBean type resolution  Issue: SPR-17063
Add defaultLocale to AcceptHeaderLocaleResolver  Issue: SPR-14312
Minor: added OServer.isActive() to know when the server is running
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
CAMEL-9309: Make it easier to turn on|off java transport over http
Add links to page that explains The Observable Contract
CLOUDSTACK-10360: Change the method name. (#2598)  The method is named as "scoped" that seems to whether the variable config is scoped in _scopedStorages or not. Actually, the method tries to find a storage of which scope equals to the scope of config. So that, the method name "findStorage" should be more clear than "scoped".
[Spring Boot] Tuned configuration callback execution order.
Delete unused imports
Internal: Deguice IndicesService  Almost all the dependencies of indices service are already created outside of guice. This change deguices MetaStateService, and then IndicesService.
Add missing final modifiers
[TEST] ObjectPath to support parsing yaml or json that have an array as root object  ObjectPath used a Map up until now for the internal representation of its navigable object. That works in most of the cases, but there could also be an array as root object, in which case a List needs to be used instead of a Map. This commit changes the internal representation of the object to Object which can either be a List or a Map. The change is minimal as ObjectPath already had the checks in place to verify the type of the object in the current position and navigate through it.    Note: The new test added to ObjectPathTest uses yaml format explicitly as auto-detection of json format works only for a json object that starts with '{', not if the root object is actually an array and starts with '['.
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Use connection id in server log messages if possible  Issue: SPR-16966
[Tests] verifyThreadNames should account for new threads of shared cluster  The verifyThreadNames starts a node and checks that all new threads on the JVM are properly named. The current test uses the name of the new node which sometimes fails because our shared cluster spawns a new thread which is properly named but for not for the new name.  The commits relaxes the requirement of the test and on verify the threads are properly named (but not necessarily of the new node)
[Spring Boot] Tuned configuration callback execution order.
[Spring Boot] Tuned configuration callback execution order.
Refine BeanPostProcessorChecker condition  Previously, adding `@EnableAsync` on a blank application would lead to an info message stating that `ProxyAsyncConfiguration` is not eligible for getting processed by all BeanPostProcessors. Concretely, this is ok as such internal configuration is not meant to be a target of such post processing.  Revisit the condition for non infrastructure bean only. Add the infrastructure role to a set of internal configuration, including the `ProxyAsyncConfiguration`.  Issue: SPR-12761
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Polishing along with SPR-10301
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Inferred generics for newSetFromMap arrangements  Issue: SPR-13188
Investigate issue with @ComponentScan as meta-annotation  This commit introduces unit and integration tests that attempt to reproduce the issue claimed by the reporter in SPR-11557. However, the tests pass without any problems.  Issue: SPR-11557
Suppress warnings in Gradle build
Set ResponseStatusExceptionResolver.messageSource in the MVC Java config  Issue: SPR-12380
Set ResponseStatusExceptionResolver.messageSource in the MVC Java config  Issue: SPR-12380
Rename WebTestClientConnectorTests to match class name
Fixed event listener caching through equals/hashCode on SyntheticParameterizedType  Issue: SPR-13540
[Spring Boot] Tuned configuration callback execution order.
MAHOUT-1258: Another shot at findbugs and checkstyle - removed unused imports
[FLINK-4875] [metrics] Use correct operator name  This closes #2676.
Remove some unneeded unboxing, unneeded methods, made some stuff private that can be
KAFKA-3840; Allow clients default OS buffer sizes  Follow up on KAFKA-724 (#1469) to allow OS socket buffer sizes auto tuning for both the broker and the clients.  Author: Sebastien Launay <sebastien@opendns.com>  Reviewers: Sriharsha Chintalapani <harsha@hortonworks.com>, Grant Henke <granthenke@gmail.com>, Ismael Juma <ismael@juma.me.uk>  Closes #1507 from slaunay/enhancement/os-socket-buffer-size-tuning-for-clients
Add arguments to created exceptions. #1555  Fixes `NewExceptionWithoutArguments` inspection violations.  Description: >Reports exception instance creation without any arguments specified. When an exception is constructed without arguments it contains no information about the fault that happened, which makes debugging needlessly hard.
Correct import order
Scripting: Rename SearchScript.needsScores to needs_score (#25235)  This commit renames the needsScores method so as to make it automatically generatable, based on the name of the `_score` variable which is available in search scripts. It also adds documentation to ScriptContext to explain the naming and signature of such methods.
3.x: JavaDocs: clarify create emitters are per consumer (#6535)
Added HttpMessage.setHeader(String, String)
Avoid missed signals on a default promise  Motivation:  Today when awaiting uninterruptibly on a default promise, a race condition can lead to a missed signal. Quite simply, the check for whether the condition holds is not made inside a lock before waiting. This means that the waiting thread can enter the wait after the promise has completed and will thus not be notified, thus missing the signal. This leads to the waiting thread to enter a timed wait that will only trip with the timeout elapses leading to unnecessarily long waits (imagine a connection timeout, and the waiting thread missed the signal that the connection is ready).  Modification:  This commit fixes this missed signal by checking the condition inside a lock. We also add a test that reliably fails without the non-racy condition check.  Result:  Timed uninterruptible waits on default promise will not race against the condition and possibly wait longer than necessary.
Query String: Add `lenient` flag to support *value* parse failures, closes #1932.
Do not consider bridge methods in SpEL properties  Modify ReflectivePropertyAccessor so that it no longer considers bridge methods when finding getters or setters. This should help to prevent subtle errors that can occur when particular JDK implementations happen to return bridge methods before non-bridge methods when calling Class.getMethods()  Issue: SPR-9994
SPR-8448 Remove URI template vars from the model before appending to query string in RedirectView
Remove unused StepContext name methods
Unify the behaviour of FileSystemAbstraction.lastModified.
Remove single-matcher replacement API  This makes it more difficult for runner authors to use the discouraged API that doesn't validate ordering of replacements.
Consolidate use of assertFileExists
Issue #2271: Remove underscores from method names
Cleanup of duplicate semicolons  Issue: SPR-15654
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
correctly handle ParseException from Formatter for String->String case (SPR-8944)
Set ResponseStatusExceptionResolver.messageSource in the MVC Java config  Issue: SPR-12380
Clean up warnings in spring-test
Refine BeanPostProcessorChecker condition  Previously, adding `@EnableAsync` on a blank application would lead to an info message stating that `ProxyAsyncConfiguration` is not eligible for getting processed by all BeanPostProcessors. Concretely, this is ok as such internal configuration is not meant to be a target of such post processing.  Revisit the condition for non infrastructure bean only. Add the infrastructure role to a set of internal configuration, including the `ProxyAsyncConfiguration`.  Issue: SPR-12761
[Spring Boot] Added support for multiple conversion services.
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Made StrutsJunit4 classes abstract
Allow plugging in custom RequestExpectationManager  The MockRestServiceServer builder now has an option to plug in a custom RequestExpectationManager.  Issue: SPR-11365
TIKA-468: Missing Silde-Count metadata for PPT files
Polishing  Issue: SPR-11910
Log name of test for WebSocket integration tests  This makes it easier to trace log output on the CI server where the output is per class.
JUnit tests: add @RunWith annotation
Explicitly use e.getMessage() for log message formatting  patch by Zhao Yang; reviewed by Stefan Podkowinski for CASSANDRA-13723
CAMEL-7999: Added missing name to JAXB in the DSL for the resequencer config types
[TEST] add Tests suffix
ca: Fixes #2877 mgmt server cert should have all addrs of default nic (#2879)  This fixes the default RootCA provider implementation to initiate and issue certificate for mgmt server on startup for all the IP addresses on the default nic of that host.  Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>
[CORE] Remove leftover unused constants
Clean up warnings in Gradle build
Fixed one CS error and polished.
Add callback for publication of new cluster state  This commit adds a callback for a cluster state task executor that will be invoked if the execution of a batch of cluster state update tasks led to a new cluster state and that new cluster state was successfully published.  Closes #15482
MINOR: Remove unneeded client used API lists  Author: Jason Gustafson <jason@confluent.io>  Reviewers: Ewen Cheslack-Postava <ewen@confluent.io>, Gwen Shapira <cshapi@gmail.com>, Apurva Mehta <apurva.1618@gmail.com>, Ismael Juma <ismael@juma.me.uk>  Closes #2372 from hachikuji/minor-cleanup-used-apis
Small format changes in script and monitor packages  Just three files - just adding {}s to if and for statements or making them single line.
Rename class CamelMvcRoutesEndpoint to CamelRoutesMvcEndpoint  Signed-off-by: Gregor Zurowski <gregor@zurowski.org>
Replace 'utf=8' str with StandardCharset  Summary: safer  Reviewed By: rajyengi  fbshipit-source-id: ae0770d52d
Resolve ${} placeholders in @ImportResource  Update ConfigurationClassParser to resolve any ${} placeholders from @ImportResource values.  Issue: SPR-10686
