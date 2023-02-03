Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Clean up warnings in spring-test
Remove unused imports
Deleting a method used in a single test only.
Use lambda expressions for lazy instantiation (#1911)  Issue: SPR-17074
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Fixed regression with fallback for non-resolvable property type
make this less syntactically confusing
Deprecate/move CGLIB methods AopUtils=>ClassUtils  isCglibProxy* methods in AopUtils are useful in lower-level modules, i.e. those that cannot depend on .aop.  Therefore copied these methods to ClassUtils; deprecated the existing ones in AopUtils and now delegating to the new location; switched all usage of AopUtils#isCglibProxy* within the framework to use ClassUtils#isCglibProxy* instead.
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
Move AdviceMode from .config to .annotation package
[Spring Boot] Tuned configuration callback execution order.
RESOLVED - issue SPR-6444: TaskExecutor not initialized in task namespace
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Use supplier-aligned type information for FactoryBean type resolution  Issue: SPR-17063
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
Strong references to mapped exception handler methods  Issue: SPR-15907
Add checkNotModified support for view resolution  Issue: SPR-14522
Use lambda expressions for lazy instantiation (#1911)  Issue: SPR-17074
Simplify String concatenation
Strong references to mapped exception handler methods  Issue: SPR-15907
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Modify how SpringConfigurator finds Endpoint singleton  First try the endpoint type name converted to property Then try @Component value  Issue: SPR-10605
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Use streams and lambdas in spring-test where feasible  Issue: SPR-13188
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Investigate issue with @ComponentScan as meta-annotation  This commit introduces unit and integration tests that attempt to reproduce the issue claimed by the reporter in SPR-11557. However, the tests pass without any problems.  Issue: SPR-11557
Add JdbcTestUtils.deleteRowsInTableWhere method  Issue: SPR-10302
Throw exception if TxMgr cannot be retrieved for @Transactional test  Prior to this commit, a @Transactional integration test would silently be executed without a transaction if the transaction manager could not be retrieved from the application context -- for example, it no such bean was defined or if multiple beans were present but none satisfied the qualifier.  This commit addresses this issue by throwing an IllegalStateException if the PlatformTransactionManager cannot be retrieved for a @Transactional test.  Issue: SPR-13895
Polish Javadoc for TestContext
Add getTargetDataSource to TransactionAwareCacheDecorator  Issue: SPR-15479
Delete unused imports
Segregate tests that depend on the jmxmp: protocol  This commit introduces TestGroup#JMXMP and adds assumptions to related tests accordingly. These tests require the jmxoptional_remote jar on the classpath, and are run nightly in the SPR-PERF build.  Issue: SPR-8089
Throw exception if TxMgr cannot be retrieved for @Transactional test  Prior to this commit, a @Transactional integration test would silently be executed without a transaction if the transaction manager could not be retrieved from the application context -- for example, it no such bean was defined or if multiple beans were present but none satisfied the qualifier.  This commit addresses this issue by throwing an IllegalStateException if the PlatformTransactionManager cannot be retrieved for a @Transactional test.  Issue: SPR-13895
[Spring Boot] Tuned configuration callback execution order.
Cleanup of duplicate semicolons  Issue: SPR-15654
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
[Spring Boot] Tuned configuration callback execution order.
Use supplier-aligned type information for FactoryBean type resolution  Issue: SPR-17063
[Spring Boot] Tuned configuration callback execution order.
polish  Remove unused imports
AbstractAutowireCapableBeanFactory avoids early FactoryBean instantiation on currently created configuration bean  Issue: SPR-12141
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Tests for @Lazy Validator setup  Issue: SPR-15807
SPR-7354 - Added equivalent of JAX-RS @Consumes to Spring MVC
Fix binary compatibility for SmartApplicationListener  Making sure that `GenericApplicationListenerAdapter` implements `SmartApplicationListener` again as older code may try to cast an instance to `SmartApplicationListener`.  Issue: SPR-8201
Use streams and lambdas in spring-test where feasible  Issue: SPR-13188
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Don't use single letter catch variables  Update existing catch blocks to ensure that `ex` is always used in preference to `e` or `t` as the variable name.  Issue: SPR-16968
SPR-17492: FastByteArrayOutputStream.read byte-to-int conversion
Cleanup of duplicate semicolons  Issue: SPR-15654
Resolve ${} placeholders in @ImportResource  Update ConfigurationClassParser to resolve any ${} placeholders from @ImportResource values.  Issue: SPR-10686
generic ApplicationListener event type gets detected through proxy as well
Added test for inconsistency between read and write method  Issue: SPR-11361
Delete unused imports
Update to latest Reactor 3.1 API changes  Issue: SPR-15318
Delete unused imports
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Delete unused imports
Cleanup of duplicate semicolons  Issue: SPR-15654
Add checkNotModified support for view resolution  Issue: SPR-14522
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Fix annotation styling issues  Update all annotations so that each is on its own line and consistently use the short form (i.e. don't use `value=`) when possible.  Issue: SPR-16968
Change this "try" to a try-with-resources  Closes gh-1671
CAMEL-8478: IdempotentRepository - Add clear operation, fix clear operation in RedisIdempotentRepository
@Scheduled supports java.time.Duration format for its delay attributes  Issue: SPR-15455
Support for bean refs in event SpEL condition  Issue: SPR-13814
Polish "Join identical catch branches"  Closes gh-2052
Implement java.io.Closeable where appropriate  Issue: SPR-9962
Use streams and lambdas in spring-test where feasible  Issue: SPR-13188
Cleanup of duplicate semicolons  Issue: SPR-15654
Update copyright header
Rename WebTestClientConnectorTests to match class name
Cleanup of duplicate semicolons  Issue: SPR-15654
generic ApplicationListener event type gets detected through proxy as well
Use lambda expressions for lazy instantiation (#1911)  Issue: SPR-17074
Add checkNotModified support for view resolution  Issue: SPR-14522
Implement java.io.Closeable where appropriate  Issue: SPR-9962
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Delete unused imports
@Scheduled supports java.time.Duration format for its delay attributes  Issue: SPR-15455
MatchableHandlerMapping extends HandlerMapping and lives in web.servlet.handler now  Issue: SPR-14321
EventListenerMethodProcessor accepts internal configuration classes  Issue: SPR-17160
improve performance of projection instantiation
Cleanup of duplicate semicolons  Issue: SPR-15654
Clean up warnings in spring-test
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
Refactoring. Remove PACKAGE_NAME constant.
TIKA-468: Missing Silde-Count metadata for PPT files
Cleanup of duplicate semicolons  Issue: SPR-15654
[java] Deleting unused imports
Include response headers in RestTemplate exceptions  Default HTTP error exceptions thrown from RestTemplate now include response headers in addition to the response body. In particular, this enables inspection of the Content-Type header allowing manual deserialization of the response body without guessing as to the content type.   - introduce HttpStatusCodeException#getResponseHeaders  - add constructor with headers param for HttpStatusCodeException,    HttpClientErrorException and HttpServerErrorException  - preserve exsisting constructor signatures  - mark HttpHeaders as Serializable  - generate new serialVersionUID where needed  Issue: SPR-7938
Increased ResolvableType unit test coverage  Issue: SPR-11034
ScriptUtils.executeSqlScript logs SQLWarnings at debug level  Issue: SPR-13959
WW-4095 WW-4094 Changes how pattern is compiled to be once per instance and changes default regexp to match underscore
Adding close connection support to HttpClient to combat hanging open files  Added a .close() method to org.openqa.selenium.remote.http.HttpClient interface.  Added a call to the client's .close() method from the HttpCommandExecutor class when a org.openqa.selenium.remote.DriverCommand.QUIT is sent.  Implemented the .close() method in org.openqa.selenium.remote.internal.ApacheHttpClient which taps the connectionManager and closes idle connections.  Fixes #1080  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Migrate array_greater_than_or_equal operator to new scalar framework
Add default method getColumnTypes to SystemTable
[java] Moving marionette specific test to the corresponding class
Make Arrayblock, MapBlock, RowBlock support mayHaveNull
Remove ThreadSafe annotation from OperatorContext and DriverContext
Adding an option to start Firefox in headless mode
PropertySource implementations perform conversion to String arrays via StringUtils (getting rid of EMPTY_NAMES_ARRAY)
Suppress warnings in spring-expression tests
Throw exception for delete from unpartitioned Hive table
MatchableHandlerMapping extends HandlerMapping and lives in web.servlet.handler now  Issue: SPR-14321
Remove unused imports idnetified by Eclipse
Add broadcast system partitioning  Although not actually a partitioning this make it posible to require a partitioning declaration in all cases.
Avoid java.util.stream.Stream usage in hot paths  Prior to this commit, profiling sessions would show that using `java.util.stream.Stream` in some hot code paths creates significant garbage.  Where streams aren't really required, this commit turns those snippets into imperative logic  because those are likely to be called once or multiple times per request.  Closes gh-22341
Improve shutdown responsiveness of SubProtocolWSH  Proactively notify all active WebSocket sessions when a shutdown is progress. Sessions then can ignore further attempts to send messages and also stop stop trying to flush messages right away.
TIKA-712: master slide's text is now extracted
Remove unnecessary class loader from resource group plugin
Introduce alias for 'value' attribute in @Payload  This commit introduces 'expression' as an alias for 'value' in @Payload.  Issue: SPR-11393
relaxed warning about ambiguous setters to only be logged in case of actual write access (SPR-6399)
Revert "All SFBuilder setters return 'this' & use varargs"  This reverts commit 0e2ce565c9ef64d97299836a3b979b2cf85de759.
Do not accept number for RFC2822/ISO8601/Custom temporal field decoders
Handle non-equijoins with negated expressions  Normalize join criteria to support expressions like "not(l.x = r.x)"
Deleting unused imports
turned requestedSessionId into a settable property
Support CharSequence for response body  Issue: SPR-13423
Clarify expected behaviour if the sendfile doesn't complete in-line and fix and associated bug in the NIO refactoring.
Refactor concrete WebDriverException#getSupportUrl's  Extract urls to constants.  Signed-off-by: Daniel Davison <daniel.jj.davison@gmail.com>
Stop referencing deprecated @TransactionConfiguration in Javadoc
WW-4688 Excludes "java.ext.dirs" when scanning for actions
Move PlanPrinter to sql.planner.planPrinter package  extraction of inner-classes as package-private top-level classes will follow.
SimonStewart: Marking failing chrome tests as ignored to green the build.  r16358
Adding close connection support to HttpClient to combat hanging open files  Added a .close() method to org.openqa.selenium.remote.http.HttpClient interface.  Added a call to the client's .close() method from the HttpCommandExecutor class when a org.openqa.selenium.remote.DriverCommand.QUIT is sent.  Implemented the .close() method in org.openqa.selenium.remote.internal.ApacheHttpClient which taps the connectionManager and closes idle connections.  Fixes #1080  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
MatchableHandlerMapping extends HandlerMapping and lives in web.servlet.handler now  Issue: SPR-14321
2.x: Add empty source clauses to javadocs of combineLatest operators accepting unspecified number of sources. This commit resolves #5412 (#5413)
Polishing  Issue: SPR-10469
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=55110 Small performance improvements Patch provided by Adrian Nistor
Minor tweaks to tests to reduce memory usage WW-1715
Refactoring use of a deprecated method
Explicit support of String[] value resolution  This commit adds an explicit support for String array for value resolution. <util:properties> switches the 'locations' property to a String array in 662d8aa and this broke expression evaluation.  Issue: SPR-12391
Make LocalExchange aware of writer finish
bug 10579: disable pool vm sync and disable hostTrack for XenServer,  status 10579: resolved fixed  reviewed-by: alex  Conflicts:      core/src/com/cloud/hypervisor/xen/resource/CitrixResourceBase.java
Add encoding for the default action in FormTag  Issue: SPR-11426
Ordered WebMvcConfigurer interceptor registrations  Issue: SPR-15620
Remove bogus DataSource test from JpaTransactionManagerTests
Rename CovarianceAggregation  This is to allow introducing FloatCovarianceAggregation.
Categorize error for rand(<=0)
Bind file rename executor as ListeningExecutorService  - Also use cached thread pool and bounded executor to reduce memory footprint for thread management
add methods for serializing individual objects
Expose OrderingCompiler cache stats via JMX
Revised NoSuchBeanDefinitionException message for proper array class names  Issue: SPR-14595
[chromedriver] Expose chromedriver "execute CDP command" command
Minor tweaks to tests to reduce memory usage WW-1715
Fix a few typos  Minor changes to fix typos. Small adjustment to add a couple commas.
Add getRawSlice to BlockCursor interface
InjectionPoint propagated for shortcut bean name resolution as well  Issue: SPR-14400
Add user to DISCONNECT in StompSubProtocolHandler  Issue: SPR-12215
Use MockitoJUnitRunner from Mockito 2's preferred location  Issue: SPR-14880
Introduce ServerRequest.methodName()  This commit introduces a methodName() method to the ServerRequest, returning the String name of the method. This method is useful for non-standard HTTP methods.
Validate types for IN subquery expression
Polishing  Issue: SPR-11910
Resolve ${} placeholders in @ImportResource  Update ConfigurationClassParser to resolve any ${} placeholders from @ImportResource values.  Issue: SPR-10686
added missed Apache lisense headers to the chm tests
Polishing test annotation declarations and JavaDoc.
STORM-741: Allow users to pass a config value to perform impersonation.
Add ClientRequest.attribute(String)  This commit adds the attribute(String) convenience method to the ClientRequest class. It also adapts the Basic Authentication filter to use it.
2.x: Single.subscribe(BiConsumer) consistent isDisposed (#5277)
Add license headers.  r1471
Remove redundant overrides
Merging capabilities to options should be fluent
WW-4110 Marks AOP support as deprecated
Update to latest Reactor 3.1 API changes  Issue: SPR-15318
AlexeiBarantsev: Ignoring tests for the browsers that don't support yet 'true or null' paradigm for boolean attributes  r16981
Refactor the usage of Undertow ByteBufferPool  - lazy allocate the PooledByteBuffer, only if there is a request body   for reading - close the PooledByteBuffer once the request finishes
avoid unnecessary autoboxing
Propagate wrapped exception in SessionFactoryUtils  Improve stack traces in certain Hibernate failure cases by properly chaining the cause exception.  Issue: SPR-7933
Fixed WebExtensions installation  Fixed installation of new firefox webextension built with new WebExtension API i.e. the one which contains manifest.json instead of install.rdf  Fixes #4093  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Remove unnecessary duplication
Add a field to query statistics  When a query finishes, if we fail to fetch the final stats, we log the completion event with the latest available stats. Add a flag indicating that the logged stats are not complete.
Remove unused imports idnetified by Eclipse
Lookup.resolveGroup returns a Stream instead of List  Stream doesn't enforce any materialization of plan nodes
SPR-8448 Remove URI template vars from the model before appending to query string in RedirectView
Deprecate InstanceListener, InstanceEvent and InstanceSupport prior to removal
Improve error reporting. - Be more precise about the location of the file with the error - Don't swallow exceptions
Rename method for clarity
Fix ResourceUrlProvider path check in getForRequestUrl  Prior to this change, getForRequestUrl implementation would only work for applications with a non-empty servlet path. So web applications mapped to "/" would trigger a IllegalStateException while checking the current request against the request path within the current mapping.  This change relaxes this and only check that the path within mapping is within the request URL.  Issue: SPR-12158
LazySingletonAspectInstanceFactoryDecorator uses shared singleton mutex  Issue: SPR-14241
Remove "presto" from uris
Rename KeyGenerator#extract => #generate
fixed some generics related warnings and did a little re-formatting
Replace ExpressionAnalysis.getColumnReferences with isColumnReference
tika-server: fix compilation under Java 1.5 - remove @Override on interface implementations
Consistent exclusion of bridge methods in annotation post-processors (for Java 8 compatibility)  Issue: SPR-12187
Update javadoc with @since
TIKA-416: Out-of-process text extraction  More javadocs and some cleanup.
Minor tweaks to tests to reduce memory usage WW-1715
Polish Javadoc for ZoneIdEditor & TimeZoneEditor
add more comments
WW-1453  Simple cleanup items   - remove duplicate and/or unused imports   - change static access to class, not instance
Refactoring. Remove PACKAGE_NAME constant.
Add flag to restore legacy array_agg behavior  The flag is named experimental.legacy-array-agg, which is default to be false. When it is set to true, array_agg will ignore the null values.
Cleanup grouping AST classes
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
Implementing clear for content editable blocks in HtmlUnit driver
Add WorkProcessor#transformProcessor method  This methods allows to write more streamlined transformations of the processor itself, e.g:  processor.transformProcessor(WorkProcessorUtils::flatten)
ComputationScheduler -> EventLoopsScheduler  - This implementation is used by Schedulers.computation() but is actually a pool of event loops, so renaming.
Properly account for time spent creating page source  The isFinished() method for the table scan operators was creating the page source which is not tracked by Driver. Instead, the page source should only be created in the getOutput() method.
Add QueryStateMachine.getFailureInfo to avoid creation of QueryInfo
Use an EnumMap instead of a HashMap when the key is an enum
SPR-7971 + add target object to KeyGenerator
Be a little more precise in the use of generics. Porting this to Tomcat 7 where <> is not allowed highlighted an issue.
[GeoSpatial] Add xxHash64 operator to Bing Tiles  In particular, this enables operators like approx_distinct which requires the object to be xxHashable.
Add checkNotModified support for view resolution  Issue: SPR-14522
STORM-741: Allow users to pass a config value to perform impersonation.
adding TakesScreenshot to WebElement, not going down the Augmentor route right now since that is setup just for WebDriver.  If someone really really likes the augmentor pattern, they can update it to also take into consideration WebElements and look at the Parent Driver instance's capabilities to determine which roles (interfaces) should be applied. I don't really care for it much and would rather get an exception from the driver that it is not implemented :)
Refine BeanPostProcessorChecker condition  Previously, adding `@EnableAsync` on a blank application would lead to an info message stating that `ProxyAsyncConfiguration` is not eligible for getting processed by all BeanPostProcessors. Concretely, this is ok as such internal configuration is not meant to be a target of such post processing.  Revisit the condition for non infrastructure bean only. Add the infrastructure role to a set of internal configuration, including the `ProxyAsyncConfiguration`.  Issue: SPR-12761
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Use lambda expressions for lazy instantiation (#1911)  Issue: SPR-17074
Use supplier-aligned type information for FactoryBean type resolution  Issue: SPR-17063
Add defaultLocale to AcceptHeaderLocaleResolver  Issue: SPR-14312
Minor: added OServer.isActive() to know when the server is running
Cleanup of duplicate semicolons  Issue: SPR-15654
CAMEL-9309: Make it easier to turn on|off java transport over http
Add links to page that explains The Observable Contract
CLOUDSTACK-10360: Change the method name. (#2598)  The method is named as "scoped" that seems to whether the variable config is scoped in _scopedStorages or not. Actually, the method tries to find a storage of which scope equals to the scope of config. So that, the method name "findStorage" should be more clear than "scoped".
[Spring Boot] Tuned configuration callback execution order.
Refine BeanPostProcessorChecker condition  Previously, adding `@EnableAsync` on a blank application would lead to an info message stating that `ProxyAsyncConfiguration` is not eligible for getting processed by all BeanPostProcessors. Concretely, this is ok as such internal configuration is not meant to be a target of such post processing.  Revisit the condition for non infrastructure bean only. Add the infrastructure role to a set of internal configuration, including the `ProxyAsyncConfiguration`.  Issue: SPR-12761
Make inner classes static where possible.
Add missing final modifiers
[TEST] ObjectPath to support parsing yaml or json that have an array as root object  ObjectPath used a Map up until now for the internal representation of its navigable object. That works in most of the cases, but there could also be an array as root object, in which case a List needs to be used instead of a Map. This commit changes the internal representation of the object to Object which can either be a List or a Map. The change is minimal as ObjectPath already had the checks in place to verify the type of the object in the current position and navigate through it.    Note: The new test added to ObjectPathTest uses yaml format explicitly as auto-detection of json format works only for a json object that starts with '{', not if the root object is actually an array and starts with '['.
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Reasonable defaults for MultipartHttpMessageWriter  MultipartHttpMessageWriter is now configured to handle JSON and XML out of the box.
Repeat/retry: fixed unbounded downstream requesting above Long.MAX_VALUE
polish  Remove unused imports
[Spring Boot] Tuned configuration callback execution order.
Refine BeanPostProcessorChecker condition  Previously, adding `@EnableAsync` on a blank application would lead to an info message stating that `ProxyAsyncConfiguration` is not eligible for getting processed by all BeanPostProcessors. Concretely, this is ok as such internal configuration is not meant to be a target of such post processing.  Revisit the condition for non infrastructure bean only. Add the infrastructure role to a set of internal configuration, including the `ProxyAsyncConfiguration`.  Issue: SPR-12761
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Polishing along with SPR-10301
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Make MediaType serializable  Issue: SPR-8738
Investigate issue with @ComponentScan as meta-annotation  This commit introduces unit and integration tests that attempt to reproduce the issue claimed by the reporter in SPR-11557. However, the tests pass without any problems.  Issue: SPR-11557
Suppress warnings in Gradle build
SPR-8429 Add test cases for missing header, cookie, and pathvar values
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
Automatic messageType detection for ChannelInboundMessageHandlerAdapter
3.x: JavaDocs: clarify create emitters are per consumer (#6535)
Added HttpMessage.setHeader(String, String)
Avoid missed signals on a default promise  Motivation:  Today when awaiting uninterruptibly on a default promise, a race condition can lead to a missed signal. Quite simply, the check for whether the condition holds is not made inside a lock before waiting. This means that the waiting thread can enter the wait after the promise has completed and will thus not be notified, thus missing the signal. This leads to the waiting thread to enter a timed wait that will only trip with the timeout elapses leading to unnecessarily long waits (imagine a connection timeout, and the waiting thread missed the signal that the connection is ready).  Modification:  This commit fixes this missed signal by checking the condition inside a lock. We also add a test that reliably fails without the non-racy condition check.  Result:  Timed uninterruptible waits on default promise will not race against the condition and possibly wait longer than necessary.
Query String: Add `lenient` flag to support *value* parse failures, closes #1932.
Add TRACE, CONNECT, and PATCH http methods (#31035)  This is related to #31017. That issue identified that these three http methods were treated like GET requests. This commit adds them to RestRequest. This means that these methods will be handled properly and generate 405s.
SPR-8448 Remove URI template vars from the model before appending to query string in RedirectView
Remove unused StepContext name methods
Fix Assert.instanceOf exception message  Update the exception message used when Assert.instanceOf fails such that it expects the provided message to end with '.'. This reverts commit 5874383ef081bb52a872dd49d63e5b542fbf20ca which caused the implementation to be at odds with the JavaDoc and the previous release.  The updated code also has the benefit of protecting against a null message.  Issue: SPR-10269
Remove unused StepContext name methods
Consolidate use of assertFileExists
Issue #2271: Remove underscores from method names
Cleanup of duplicate semicolons  Issue: SPR-15654
CAMEL-11963: camel-spring-boot - Actuator endpoints for MVC should only trigger if web application
correctly handle ParseException from Formatter for String->String case (SPR-8944)
RESOLVED - issue SPR-6444: TaskExecutor not initialized in task namespace
Clean up warnings in spring-test
Refine BeanPostProcessorChecker condition  Previously, adding `@EnableAsync` on a blank application would lead to an info message stating that `ProxyAsyncConfiguration` is not eligible for getting processed by all BeanPostProcessors. Concretely, this is ok as such internal configuration is not meant to be a target of such post processing.  Revisit the condition for non infrastructure bean only. Add the infrastructure role to a set of internal configuration, including the `ProxyAsyncConfiguration`.  Issue: SPR-12761
[Spring Boot] Added support for multiple conversion services.
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
Made StrutsJunit4 classes abstract
Add reset() to MockRestServiceServer  Issue: SPR-14306
TIKA-468: Missing Silde-Count metadata for PPT files
Polishing  Issue: SPR-11910
Log name of test for WebSocket integration tests  This makes it easier to trace log output on the CI server where the output is per class.
JUnit tests: add @RunWith annotation
Explicitly use e.getMessage() for log message formatting  patch by Zhao Yang; reviewed by Stefan Podkowinski for CASSANDRA-13723
CAMEL-7999: Added missing name to JAXB in the DSL for the resequencer config types
[CORE] Remove leftover unused constants
ca: Fixes #2877 mgmt server cert should have all addrs of default nic (#2879)  This fixes the default RootCA provider implementation to initiate and issue certificate for mgmt server on startup for all the IP addresses on the default nic of that host.  Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>
[CORE] Remove leftover unused constants
Clean up warnings in Gradle build
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=48230 Remove unused imports. Patch provided by sebb.
[CALCITE-1394] Javadoc warnings due to CoreMatchers.containsString and mockito-all  Change occurrences of CoreMatchers.containsString to StringContains.containsString, and CoreMatchers.startsWith to StringStartsWith.startsWith, to be compatible with the version of hamcrest inside mockito-all.
HIVE-13902 : [Refactor] Minimize metastore jar dependencies on task nodes (Ashutosh Chauhan via Sergey Shelukhin)  Signed-off-by: Ashutosh Chauhan <hashutosh@apache.org>
Small format changes in script and monitor packages  Just three files - just adding {}s to if and for statements or making them single line.
Consistent abstract declaration for utility classes (plus polishing)  Issue: SPR-16968
CAMEL-7312: Added type converter for file/is -> properties
Resolve ${} placeholders in @ImportResource  Update ConfigurationClassParser to resolve any ${} placeholders from @ImportResource values.  Issue: SPR-10686
