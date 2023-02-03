Make management.port default to server.port
Replace getParameterTypes().length with getParameterCount()    Closes gh-10377
Test support for HTTP range requests to endpoints returning a Resource    Closes gh-9978
Polish and reinstate usage of FileSystemUtils.deleteRecursively    Closes gh-9942
Polish 'Remove usage of `HttpStatus` in Web Endpoints'    Closes gh-10350
Polish 'Improve Spring Session sample'    Closes gh-10351
Remove usage of `HttpStatus` in Web Endpoints    See gh-10350
Duplicate values should bind properly to List    Fixes gh-10106
[bs-87] Add /dump endpoint    * Just dumps ThreadInfo, simple but effective  * Implementation is part of TraceEndpoint    [Fixes #49056831]
Remove runComponents from SpringApplication    It was basically duplicating run(Object[], String[]) - unless  there is some harm in registering a non-component with the context  that I haven't seen yet.
Polish 'Fix handling of empty/null arguments'    Closes gh-9916
Rework Lettuce configuration to use new client pooling config API    Closes gh-9538
Rework health response structure to eliminate chance of key clashes    Previously, if a health's details contained a key named status (either  because an indicator bean was named statusHealthIndicator or an  indicator added an entry named status to its details) this would  clash with the health's own status as the details were serialized as  siblings of the status field.    This commit updates Health to remove @JsonAnyGetter from getDetails().  This means that all of a Health's details will now be nested within  a separate details field, thereby preventing a possible clash with  the status field.    Closes gh-10249
Restore `endpoints.env.keys-to-sanitize` binding    Closes gh-10174
Add 'onClass' condition on web server auto-configurations    This commit adds new Conditional annotations on auto-configurations  creating the Servlet/Reactive web servers. These conditions only depend  on request primitives used by the servers themselves and aren't  framework specific.    Closes gh-10163
Discover endpoints in parent context    Closes gh-10144
Close reactive Redis connection after health check    Closes gh-10153
Change default order of AutoConfigureOrder to 0    Previously, AutoConfigureOrder defaulted to Ordered.LOWEST_PRECEDENCE.  This made is impossible for an individual auto-configuration to  indicate that it wanted to go 'last', i.e. after any  auto-configuration classes that didn't not specify an order, or  specified an order other than LOWEST_PRECEDENCE.    This commit changes to default to 0, allowing a single   auto-configuration to easily indicate that it should go last.     Closes gh-10142
Allow an operation to specify the media types that it produces    Closes gh-10118
Polish adapt to and from Mono conversion    See gh-10112
Avoid substring() invocation when the result is itself    Closes gh-10077
Make BootRunIntegrationTests compatible with Java 9    Closes gh-10019
Improve structure of Flyway endpoint response, add missing properties    Closes gh-9973
Wait for process to exit when stopping DevTools integration test apps
Require separate management port to use management context path of /    Closes gh-9898
Revert 'Nested Map should not bind to null'    This reverts commit 5406567783ab2cc2dd9295c7b2281a0d086f4f41.
Fix compatibility with JUnit's ExpectedException    This commit ensures that an exception that is thrown as part of the  `ContextConsumer` callback is thrown as is.    Closes gh-9878
Polish 'Allow to customize OkHttpClient.Builder'    Closes gh-9669
Allow to customize OkHttpClient.Builder    This commit enables to auto-configure OkHttpClient.Builder in  InfluxDbAutoConfiguration if it is available.    See gh-9669
Add system property support to TestPropertyValues    Update `TestPropertyValues` so that it can also be used to update  system properties.  Properties are set before the call is made and  restored to their previous value afterwards.    Fixes gh-9792
Expose AssertionErrors as is    Closes gh-9760
Add support to ContextLoader for configuring context's parent    Closes gh-9749
Polish 'Align with breaking API changes in RedisCacheManager'    Closes gh-9734
Polish 'Rename HCP to SAP'    Closes gh-9747
Rename HCP to SAP    See gh-9747
Allow to specify multiple auto-configs in autoConfigFirst
Properly set redis password for Cluster and Sentinel config    Closes gh-9583
Upgrade to Tomcat 8.5.16    This commit uses the replacement for deprecated APIs in 8.5.16 to ease  a forward compatibility with Tomcat 9    Closes gh-9611
Remove dead code
Add prefix to all properties in maven plugin    This commit add prefix `spring-boot` to all Mojo's properties.    See gh-9567
Alias spring.datasource.name to Hikari's poolName property    Closes gh-9547
Set Lettuce shutdown timeout properly    We now properly set the Lettuce client shutdown for unpooled and pooled  configuration.    See gh-9526
Configure Derby to write its log in the target directory
Polish 'Use Redis client configuration to configure connection factories'    In particular, the Lettuce code is not using the new builder API when  pooling is required. This will be fixed in a future milestone.    Closes gh-9510
Add SAP Hana Cloud Platform to CloudPlatform    Closes gh-9487
Fix `QuartzAutoConfigurtion` failure with multiple `Executor` beans    `QuartzAutoConfigurtion` currently blows up if there are multiple  `Executor` beans in the context.    This commit changes the configuration to retrieve `Executor` bean using  `ObjectProvider#getIfUnique` which won't fail in scenarios where there  are multiple `Executor` beans with none marked as `@Primary`.    Closes gh-9434
Replace `WebMvcRegistrationsAdapter` with default methods    Closes gh-9340
Clear configurationProperty from context before bind    Fixes gh-9295
Add support for binding to immutable collection    Fixes gh-9290
Allow nested square brackets in map key when binding    Fixes gh-3202
Use try-with-resources to close resources automatically    See gh-8045
Display unconditional classes in auto-config endpoint    Closes gh-9227
Modify return on post /loggers to HTTP 204    This commit alter the return http status code from 200 to 204.    Closes gh-8919
Add missing tests for Collection and Map binders
Restrict scalars in MapBinder to java.lang    Fixes gh-9209
Make SpringApplicationJsonEnvironmentPostProcessor origin aware    Closes gh-8932
Remove redundant uses of @NestedConfigurationProperty    Closes gh-9216
Avoid exposing `spring.resources.favicon-locations` as a property    Closes gh-9214
Properties treated as Map<String, String> for bind    Fixes gh-9152
Improve `HashMapSessionConfiguration`    This commit updates `MapSessionRepository` bean definition return type  and applies equivalent change to `SessionAutoConfigurationTests`.    These changes also ensure compatibility with Spring Session 2.0 which  will merge `ExpiringSession` API with `Session` API.    Closes gh-9145
Remove redundant ordering from ImportBeanDefinitionRegistrar implementations    Closes gh-8603
Make argument ordering consistent across web server initialized events
Update port file writer to support reactive servers    Closes gh-8531
Stop setting org.jboss.logging.provider when using Logback    This fix for gh-1928 to address a problemw with Log4j was to set  a system property that forces JBoss Logging to use SLF4J. This has the  unwanted side-effect of crashing Glassfish. We no longer support Log4j  so gh-1928 is no longer a concern. However, you can shoot yourself in  the foot by having Logback and Log4j2 on the classpath in that  particular order, but the latter has to be without its  log4j-slf4j-impl module. At this point you don't get any warnings or  error output at startup, but JBoss Logging uses Log4j2 while  everything else uses SLF4J and Logback. As a result, any logging  that's performed through JBoss Logging is silently lost.    Given the problems caused by setting the system property, and the  contrived nature of the arrangement that's necessary to cause a  problem when the property isn't set, this commit updates  LogbackLoggingSystem so that the system property is no longer set.    Closes gh-8669
Replace lambdas with method references    Closes gh-9049
Polish configuration properties and binder    Fix a few issues and try a few more things to improve performance.    See gh-9000
Add missing tests
Don't rely on ConfigurationPropertyName exceptions    Update `ConfigurationPropertySourcesPropertySource` to no longer use  `try/catch` when checking for valid names. A new `isValid` method has  been introduced to `ConfigurationPropertyName` which is offers better  performance.    Fixes gh-9058
Ignore nested with NoUnboundElementsBindHandler    Update `NoUnboundElementsBindHandler` to also support ignoring  nested properties. This change is required to allow the  `NoUnboundElementsBindHandler` to be used alongside the  `IgnoreNestedPropertiesBindHandler`.    See gh-9000
Use new configuration properties in samples    Update `spring-boot-samples` to use the new configuration properties  support.    See gh-9000
Use new configuration properties in devtools    Update `spring-boot-devtools` to use the new configuration properties  support.    See gh-9000
Use new configuration properties in spring-boot-test    Update `spring-boot-test` to use the new configuration properties  support.    See gh-9000
Make Audit events MVC endpoint `after` parameter required    Closes gh-9002
Deprecate relaxed property concepts    Deprecate `RelaxedDataBinder`, `RelaxedPropertyResolver` and related  classes in preparation for the updated configuration properties binder  work.    See gh-9000
Fix WebClientTest calls    Update calls to WebClientTest following upstream changes.
Harmonize Solr status health details    This commit renames the `solrStatus` property of the Solr health indicator  to `status` and its type. This is now an integer corresponding to the  status Solr sent rather than a String that can be 'OK' when all is well.    Closes gh-8878
Make sure Admin MBean works also with webflux    This commit improves `SpringApplicationAdminMXBeanRegistrar` so that it  work with traditional Servlet-based app but also with Spring WebFlux.    Closes gh-8533
Use JDK hashCode() variants for primitives    See gh-8768
Update WebFlux auto-configuration following recent API changes
React to the Java plugin being applied rather than always applying it
Revert 'Change default for new_generator_mappings to true'    This reverts commit 735dbc4583480475d1299ca56bb5eb0f609a7267.
Change default for new_generator_mappings to true    Closes gh-7612
Fix Configuration processor test tangle    Move `Metadata` test class to fix a package tangle in the test code.    Fixes gh-8613
Remove useless checked exception throw clause
Hide javax.servlet.SessionTrackingMode    The server's session can now be configured in both a servlet and a  reactive environment. The latter has not requirement on the servlet API  and this commit removes the requirement to the `SessionTrackingMode`  enum.    Closes gh-8402
Move RandomValuePropertySource into org.springframework.boot.env    Closes gh-8249
Align Security filter dispatcher types with Spring Security's defaults    Closes gh-8289
Align default Filter dispatcher types with the Servlet spec    The Servlet spec states that the default is REQUEST. This commit  aligns Spring Boot with that default.    Closes gh-7467
Use DefaultUriBuilderFactory instead of DefaultUriTemplateHandler    Closes gh-8247
Restore couchbase support    This commit effectively reverts the changes that were applied to  workaround the breakage in spring-data-couchbase.    Closes gh-8200
Reuse `ConfigurationProperties` bean defined in parent    This commit makes sure that if a `ConfigurationProperties` annotated bean  already exists in the parent context, a new one is not created in the  child anymore.    This makes sure that a single bean exists in a parent/child hierarchy if  `@EnableConfigurationProperties` is processed in both context on the same  class.    Closes gh-8187
Clear system property in SpringApplicationTests    See gh-8101  Closes gh-8161
Remove usage of Assert.notNull(Object)    This commit updates the Spring Boot codebase to adapt to the removal of  `Assert.notNull(Object)` in SPR-15196.    See gh-8140
Replace and remove deprecated API usage
Use directExecutorService instead of sameThreadExecutor  sameThreadExecutor is deprecated in Guava 20. 
Fix incorrect stream property derivations from GroupIdNode  AddExchanges and AddLocalExchanges were inconsistent in the way that properties were derived for the GroupIdNode. StreamPropertyDerivations incorrectly passed through all child properties, when in fact the GroupIdNode destroys partitioning properties on grouping columns that are not common to all grouping sets. In some cases this led to incorrect results. We now use the same logic in PropertyDerivations and StreamPropertyDerivations. 
Fix compilation error due to airlift change  Airlift 0.113 changed some interfaces to use Java's Optional instead of Guava's, which broke some usages when we updated to that version 
Polish PathVariableMapMethodArgumentResolver  Return an empty map when there are no path variables, rather than raising an exception. This is consistent with similar resolvers for extracting headers and request parameters.  Issue: SPR-9289 
Fix streaming for JDBC-based connectors  Because the JDBC base query builder was changed in #4651 to use prepared statements, the JdbcClient instance has no chance to to customize creation of the statement.  Here we add a new method, getPreparedStatement, that implementors can override. The query builder buildSql function uses this function to create new prepared statements, rather than creating them directly on the connection object.  Since #4651 the JDBC connectors no longer use getStatement, so these have been removed both from JdbcClient and all implementors, and proper getPreparedStatement methods have been added to the MySQL and PostgreSQL connectors. 
Revert processing change  The close refactoring is enough to ensure connections are properly closed.
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=55171 If the client closed the connection, the write of any remainign data in the buffer in AbstractServletOutputStream would fail but the remote endpoint was not notified. This meant that blocking writes would block for ever eventually locking up the entire server.  
TIKA-476: Add page count to metadata  Use the xmpPTg:NPages property for the MS Office page count metadata  
Suppress warnings in tests  This commit suppresses warnings in test classes that were polluting the Gradle build output. 
Deleting unused imports
Reflect 3.2=>3.1.2 backports in @since tags etc  Issue: SPR-9443, SPR-6847, SPR-9446, SPR-9444, SPR-9439, SPR-9302,        SPR-9507, SPR-9238, SPR-9397, SPR-9406, SPR-9502 
ResolvableType.getType() returns ParameterizedType when built with forClassWithGenerics  Issue: SPR-12701 
Polish EmbeddedDatabaseBuilder  Minor improvements made during the triage of SPR-8817 
Improving parsing of extension list to be more intuitive WW-1715   
Java: Using CloseableHttpClient instead HttpClient to get rid of deprecated method calls 
Use USE_NULL_FLAG for null convention in RowDistinctFromOperator  RowDistinctFromOperator should conform to the calling convention for IS DISTINCT FROM. 
Refactor SystemTable isDistributed interface 
[java] Adding a test for extension installation and deinstallation in Firefox
Add proper getPositions implementation to specialty Blocks 
Change nanosBetween method  If the result of "end - start" is negative it is rather an incorrect measurement. Therefore it should not be recorded. 
Refactoring constructor that accepts FirefoxProfile 
Use write aggregator from DataBufferUtils  This commit uses the newly introduced write aggregator from DataBufferUtils throughout WebFlux.  Issue: SPR-16351 
Allow customization of SpEL method resolution  This change introduces a protected ReflectiveMethodResolver#getMethods, allowing subclasses to specify additional static methods not declared directly on the type being evaluated. These methods then become candidates for filtering by any registered MethodFilters and ultimately become available within for use within SpEL expressions.  Issue: SPR-9038 
Remove need for canHandle(...) in RecordSinkProvider 
SPR-6976 - Add debug log for HttpMessageConverter usage  
Remove unused imports  
Create VALUES with row values  This is often necessary in tests to have VALUES filled with some data rows, otherwise `QueryCardinalityUtil` will deem VALUES as scalar, affecting testing conditions. 
Add writableChannel to WritableResource  This commit introduces a `writableChannel()` method to `WritableResource`, defaulting to `Channels.newChannel`, but with overrides for file-based resources. 
Use SESSION_NOT_RELIABLE when no messages received  When a WebSocket session is closed after not having received any messages, we'll use SESSION_NOT_RELIABLE to indicate to other parts of the session closing code not to send anything further (e.g. SockJS "Go Away!" frame).  Issue: SPR-11884 
TIKA-704: PDF and Outlook docs embedded in MS Word documents not parsed  Remove hidden Yamaha manual from the EmbeddedPDF.docx test file.  
Remove support for session properties as selection criteria 
Add basic javadoc to spring-messaging annotations 
report error in case of constructor-arg index ambiguity (SPR-6329) 
All SFBuilder setters return 'this' & use varargs  Touch up a few setter methods across the SessionFactoryBuilder hierarchy that were still returning void.  Use varargs... syntax wherever possible. 
Remove extranous non-null checks executer per row 
Fix SQL formatting and view creation for grouping sets  View creation failed for some queries containing grouping sets due to the SQL not round-tripping. The formatted SQL had the expressions de-duplicated and arranged in an arbitrary order. 
DavidBurns removing the rest of the SetSelected and Toggle code so trunk can build  r13463 
Prepared for backport to 4.3.20 and 5.0.10  Issue: SPR-17295 
Check HTTP method before raising 415  This commit moves the check whether an HTTP method supports request body up to the base class so that all sub-classes can benefit (not just @RequestBody).  Issue: SPR-13176 
Take into account that executors can be provided, standard and non standard thread pool executors through config or programmatically. Hence we want to expose the correct values for curThread and curThreadBusy    
Fixing HtmlUnitDriver to enter RETURN and ENTER to a text area. Fixes issue 5890 
Rename WebTEL to ServletTEL  Renamed WebTestExecutionListener to ServletTestExecutionListener.
Add missing javadoc tags, remove unused code and add some logging  
Move iterative rule tests from rule/test/ to rule/  The rule.test package is for the testing framework, not for the tests themselves. 
ignoring some htmlunit tests to get travis to pass 
Revert "Java: Using CloseableHttpClient instead HttpClient to get rid of deprecated method calls"  This reverts commit a01061a0bc7fe553caaeb1b0add2f92be87f2672. 
Ignore path parameters in request mappings  Before this change the presence of path params (e.g. "/foo;q=1/bar") expected the request mapping to contain a URI variable in the place of semicolon content (e.g. either "/{foo}/bar" or "/{foo};{fooParams}").  The change ensures path params are ignored in @RequestMapping patterns so that "/foo/bar" matches to "/foo;q=1/bar" as well as "/foo;q=1;p=2/bar".  Along with this change, the RequestMappingHandlerMapping no longer defaults to having semicolon content removed from the URL, which means @MatrixVariable is supported by default without the need for any further configuration.  Issue: SPR-10234 
2.x: add missing 'the' to the changed sentences of 5413
polish / code review of data source embedded and init 
Call super() for consistency even if it is not strictly necessary.  Currently the call is idempotent.   
Fixed parsing of name for ognl when no id is specified and using name value WW-1617   
Tests: Fixing AbstractTest and some tests failing because the web pages evolved  r5114 
Consider primary attribute with getBean(Class)  Update DefaultListableBeanFactory.getBean(Class<?> beanClass) to consider the 'primary' attribute of bean definitions. This makes getBean() behave in the same way as autowiring.  Issue: SPR-7854 
Remove unused putIfAbsent interface 
CLOUDSTACK-9025: Fixed can't create usable template from snapshot in Xenserver and Vmware  Fix also reverts below commit as below solution making assumption about hypervisor which are not applicable in case of XenServer and VmWare  Revert "CLOUDSTACK-8964: Can't create template or volume from snapshot"  This reverts commit ccf5d75cfbe769b34c021ab3653ed318cae25933. 
Prepend context/servlet path to FormTag action  The Form tag now fills in the context and servlet path if not present in the specified action.  Issue: SPR-8684 
Allow custom instances of WebJarAssetLocator  This commit allows to configure a custom WebJarAssetLocator in WebJarResourceResolvers.  Issue: SPR-14092 
Clean up warnings in tests in spring-jdbc 
Rename HistogramAggregation s/Numeric/Double/  This is to allow introduction of FloatHistogramAggregation 
Make round() of infinity return infinity  It was previously returning Long.MAX_VALUE due to how Java's Math.round() behavior. 
Revert to BoundedExecutor  We are seeing weird scheduling latencies with BoundedThreadPool. 
rename commit on rotatingtransactionalstate to cleanupbefore 
Add counter for POST requests to statement resource  This counter makes it easier to monitor large spikes in the incoming query rate. This counter is incremented prior to potentially expensive operations in SqlQueryManager (which has its own counters). 
Expose ResolvableType in NoSuchBeanDefinitionException  This commit improves NoSuchBeanDefinitionException to expose a full ResolvableType rather than a raw class if a lookup by type failed. This allows to know more about the underlying type and is typically useful when a collection or map is required as the relevant generic type is the actual bean that wasn't found.  Issue: SPR-14831 
[3450] Added bindings for custom ChromeDriver commands (GET_NETWORK_CONDITIONS, SET_NETWORK_CONDITIONS and DELETE_NETWORK_CONDITIONS) that allows client code to utilize built-in throttling functionality. (#3479)  
Adding tests to ensure results are overridden correctly WW-2559   
Polish AbstractContextLoaderInitializer and subclasses  This commit polishes the Javadoc and assertion failure messages for AbstractContextLoaderInitializer and its subclasses. 
Remove unused methods from Block 
Restore default transaction manager by name lookup  Fix a regression introduced by 961574bd17b that prevents a proper lookup of the default transaction manager by name as the absence of a qualifier is represented by an empty string (passing the faulty null check).  Issue: SPR-12577 
Always set heart-beat header in STOMP CONNECTED frames  Since SPR-10954, the SimpleBrokerMessageHandler supports `heart-beats`.  Even if the STOMP spec states that the `heart-beat` header is OPTIONAL, and if absent considered as `heart-beat: 0,0`, some clients rely on this to be set in CONNECTED frames.  This commit adds this header information even if no task scheduler/heart-beat have been configured.  See: https://stomp.github.io/stomp-specification-1.2.html#Heart-beating  Issue: SPR-10954 
Clean up Spring MVC Test Framework code   - Formatting  - Suppress warnings  - Remove unused imports 
Renamed getSupportedMimeTypes() in [En|De]coder  Renamed getSupportedMimeTypes() to getEncodableMimeTypes and getDecodableMimeTypes. This will allow for both Encoder and Decoder to be implemented in the same class.  This issue fixes #113. 
Fix JOINs that have ORDER BY rand()  Previously "Only deterministic expressions may be considered for rewrite" exception was thrown 
Remove unused imports 
Disallow empty @PropertySource(value = {})  Previously, a user could specify an empty array of resource locations to the @PropertySource annotation, which amounts to a meaningless no-op.  ConfigurationClassParser now throws IllegalArgumentException upon encountering any such misconfiguration. 
Add license headers to PhoneExtractingContentHandler and its test.  
Document meta-annotation support in the TCF  - Completed Javadoc for MetaAnnotationUtils. - Added Javadoc notes to multiple annotations in the TCF, pointing out   which annotations can be used as meta-annotations.  Issue: SPR-11109 
fix topology.metrics.consumer.register validation: Map, not String The topology.metrics.consumer.register is a list of hashes, but its schema was StringsValidator. Added a 'MapsValidator' (list of Map) and fixed the schema. 
Use Credentials object instead of 2 attributes for Basic Authentication  This commit changes the usage of two separate attributes (username and password) into one: a single `Credentials` object. Additionally, the attributes key under which the credentials are stored is changed to be specific to Basic Authentication, in order to allow for other sorts of authentication later.  Issue: SPR-15764 
2.X: Fix disposed LambdaObserver onError to route to global error handler (#6036)  
Add license headers.  r1472 
Make equality checks for standard type classes faster  Treat the standard types as singletons, which allows us to implement equals() with reference equality. 
Make AbstractCapabilities.asMap return `Map<String, Object>`  Co-variant return types mean that this is legal to do in Java, and it makes dealing with the output of these things easier.  With hindsight, it would have been better to use a different return type for `asMap` in the first place. Maybe we can fix this in Selenium 4. 
Changing request encoding to apply to file uploads, allowing zero-sized file uploads  WW-1324   
Switch to suspended mode before demand  After this commit, Tomcat and Undertow WebSocketSession imlpementations start out in suspended mode and wait for demand.  The JettyWebSocketSession is capable of suspending but it doesn't seem to work if invoked before any messages are received. That may become an issue if there is a case where no demand appears long enough for more messages to accumulate than we can hold.  UnderowServerHttpRequest would ideally also start in suspended mode but that also doesn't work. It is not an issue in this case since we can ignore the read notifications.  Servlet API requires a proactive check before it calls you back so there is no need to suspend.  Issue: SPR-16207 
No logical changes: Fix warnings and remove unused imports  - Fix warning of varargs null calling - Remove unused imports  Signed-off-by: Simon Stewart <simon.m.stewart@gmail.com> 
Handle AsyncListener.onComplete in Servlet adapter  Typically the Mono<Void> from the HttpHandler also reflects the completion of the request and response body processors and at that point invoking AsyncContext#complete() from HandlerResultSubscriber should be sufficient.  This commit explicitly propagates the AsyncListener.onComplete event to the request and response body processors for added safety. Technically as mentioned those processors should have completed but depending on how the controller is written there is a possibility the body processors may not have completed.  Issue: SPR-14772 
Restore log level for resolved exceptions  The fix for SPR-17178 switched from debug to warn level warning for all sub-classes of AbstractHandlerExceptionResolver where the request concerned the DefaultHandlerExceptionResolver only.  This commit restores the original DEBUG level logging that was in AbstractHandlerExceptionResolver from before SPR-17178. In addition DefaultHandlerExceptionResolver registers a warnLogCategory by default which enables warn logging and hence fulfilling the original goal for SPR-17178.  Issue: SPR-17383 
Exception for OSIV deferred close with async requests  OSIV deferred close mode is not supported with async requests and is unlikely to be what's the desired. This change adds an exception with a message stating this.  Issue: SPR-8517 
[java] Installing Firefox extensions in the same form as they provided, either as a file or as a directory. With the release of Firefox 62 Mozilla discontinued support for unpacked sideloaded extensions in Release channel. Users must themselves choose proper format to use in their tests depending on the browser version they run tests in. 
Clean up unused imports for the tc6 source tree  
Remove unused config 
Clean up unused imports and variables  
Add Lookup#resolveGroup method and make Lookup#resolve depricated  In the future, equivalence based memo would store multiple plan nodes per group. Therefore resolve() that returns singleton should be unused. 
SPR-8524 Add flag to AbstractCachingViewResolver to suppress subsequent resolution of unresolved view names. 
Deprecate unused code identified by FindBugs  
Deprecate unused method on internal Jar abstraction  
- Call onClose before actually closing anything (sending a close message closes the endpoint). - If onClose throws an exception, call onError. - After using a blocking send, clear the client buffer in case it gets reused (I have no idea why this is needed ...).  
Polish WebJarsResourceResolver  Follow up to accb8519fd - same fix when resolving missing resources or resolving a public URL for these resources. 
Moved executor null check to AsyncExecutionInterceptor, allowing AbstractAsyncExecutionAspect to fall back to sync execution (as in 3.2.1)  Issue: SPR-10636 
Add fetch task instance id directly from SqlTaskManager  Currently when the task instance id is needed the caller asks for the entire task info, which is very expensive to compute, and then the caller extracts the single id field. 
renamed ValueWrapperImpl to SimpleValueWrapper (for use in Cache implementations) 
refactoring ValidateGroup -> ValidationGroup 
Fix bug when rewriting NegativeExpression  It was discarding the rewritten subexpression of an arithmetic negation 
For places formatting numbers in fixed formats, or case-insensitive comparing Ascii strings, use Locale.ROOT not Locale.getDefault() to ensure predictable behaviour, and avoid issues in locales like Turkish. TIKA-1387  
Fix regression in static setter method support  The intention of ExtendedBeanInfo, introduced with SPR-8079 in v3.1.0.M2, was to support dependency injection against non-void returning write methods. However, it also inadvertently introduced support for injection against static setter methods.  When use of ExtendedBeanInfo was made optional with SPR-9723 in v3.2.0.M2, ExtendedBeanInfo continued to support static write methods, but its new BeanInfoFactory-based approach to testing whether or not a given bean class contains candidate write methods was written in a fashion exclusive of static methods, and this thereby introduced a regression - a regression in an otherwise undocumented and unintended feature, but a regression nevertheless.  The reporting of SPR-10115 proves that at least one user has come to depend on this behavior allowing injection against static write methods, and so this commit fixes the regression by ensuring that the candidacy test includes standard and non-void setter methods having a static modifier.  Issue: SPR-10115, SPR-9723, SPR-8079 
TIKA-60 - Rename Microsoft parser classes  
TIKA-416: Out-of-process text extraction  Rename ForkSerializer to ForkObjectInputStream to better reflect its current role  
WW-769   - added javadoc to method populateComponentHtmlId in Form     and FormButton    
Added further author tags  Issue: SPR-1528 
Fixed javadoc formatting. 
WW-3023 Use ClassLoaderUtils to resolve the class in ConcentionServiceImpl  thanks to Travis Rein for the patch    
Fix issue in connector refactoring identified by Gump. Ensure UpgradeProcessors are unmapped from sockets once the connection is closed.  
Limit the number of values for min/max n functions  min_n/max_n or min_by_n/max_by_n functions do not check the value of n before creating the corresponding heaps for the states. This led to production failure due to OOM when n is big enough. This patch enforces n to be no greater than 10000. 
Clean up computation of grouping expression candidates  The code was iterating over the list and calling indexOf to compute a stream of indexes from 0 to N only to then invoke a function that would get the Nth element in the list. 
fix CI build  Prior to this commit, AnnotatedJCacheableService contained an annotated method demonstrating a failure scenario. This could break depending on the order of the methods array as AopUtils creates the proxy if the pointcut matches by checking each method.  On the CI server, the first method was this invalid use case so checking if the proxy has to be created lead to an unexpected exception. This scenario has been moved to its own private class now. 
MarshallingView explicitly skips BindingResult when searching for a model object  Just implementing common custom subclass behavior out-of-the-box...  Issue: SPR-11417 
javadocs: withLatestFrom diagram, @since annotations, standardize on formatting and terminology, add compiler nags for missing content 
SimonStewart: Cleaning up import statements  r16116 
use SeleniumServer.getDefaultPort() instead of SeleniumServer.DEFAULT_PORT so as to get the port named by the system prop selenium.port; this allows users to easily reset which port they are using (e.g., on a shared machine where not everyone can have port 4444).  r3450 
Update to latest Reactor snapshot 
Rename beforeRead/Write() to resolveRead/WriteHints()  This commit also removes the ServerHttpResponse parameter, not needed here since it is possible to override the write() method.  Issue: SPR-14557 
Minor fix to name of attribute used to store FlashMap instances. 
Protect against NPE when resolving generic array  Update ResolvableType to check that the resolved component type from a generic array is not null before attempting to use it to generate the resolved array class.  Issue: SPR-11044 
SimonStewart: Fixing the Augmenter so that it doesn't attempt to copy final fields  r11827 
Add ServerHttpResponse.addCookie method  This commit adds a `addCookie(ResponseCookie)` method to the reactive `ServerHttpResponse` interface.  Issue: SPR-15523 
AlexeiBarantsev: Enabling a couple of tests for HtmlUnitDriver that pass green in my local environment  r17098 
Add WorkProcessor#flatten method  This method enables flattening of WorkProcessors created directly by WorkProcessor#create It is also less complex then previous flatTransform implementation 
Scheduler instances should be or behave like singletons  - remove the Func0 factory signature for Scheduler creation. 
Rename an argument in JoinFilterFunction for clarity 
Small refactor to SqlQueryExecution  SqlQueryScheduler#getStageInfo is guaranteed to be not null 
Polish: Maps with keys that are enum values should be replaced with EnumMap 
Clear expression caches on context shutdown  Issue: SPR-12691 
Continue some casual experimentation with HTTP/2. Apparently there is a "deadlock" with reads in some cases [like when shutting down and there's a blocked read, it's visible with the testsuite; I'll work on it].  
Add distinct from operator for BingTile type  Types with "equal" operator should also have "distinct from" operator, just like they do for "not equal" operator. 
Log and handle unresolved exceptions  Before this change use of ExceptionHandlingWebHandler did ensure no error signals are allowed to escape (hence relying on runtime behavior).  This change ensures the same is done even when ExceptionHandlingWebHandler is not configured for use, at the lowest level which is the WebToHttpHandlerAdapter. 
added javadoc and fixed some bad indentation 
Add `toJson` to various classes  The reflective call to `toJson` was a relatively late addition in the development of Selenium. It is now time to use it. 
Fix compatibility with JDK9    Cast runtime object retrieved reflectively to their public interface  counterpart.    See gh-7226
Update ConditionalOnJava and its usage now that Boot requires Java 8    Closes gh-6982
Suppress Neo4J-related deprecation warnings    See gh-6976
Address warnings caused by deprecations in Spring Framework 5    See gh-6977
[bs-14] Ensure all servlet context initializers are called    Misuse of TreeSet in EmbeddedWebApplicationContext corrected  (use List and Comparator instead of TreeSet).    [Fixes #48055339]
Fix #1411 Java Locale use '_' split language, country, variant. (#1413)
`URL` overload for `Retrofit.Builder#baseUrl`    Functionally does nothing, just somewhat cleaner to be able to do `baseUrl(URL)` than `baseUrl(URL#toString());` if handling a `URL` rather than `String`.  Used `HttpUrl.get(String)` as `HttpUrl.get(URL)` returns null instead of throwing an exception.
Support escaped characters in BasicJsonParser    This commit adds the ability to have escaped characters, like the quote,  when using the BasicJsonParser. It also adds a short test for escaped  quotes.    Closes gh-14521
Fix inconsistencies in javadocs.    These changes were made with consistency in mind, in relation to the rest of the project:   - Change self-closing <p/> tags to regular <p> tags.   - Add missing <p> tags.
Update multipart documentation.
Support protocol config for reference annotation (#1675)
Make sure exception tag values are not empty in web metrics    See gh-13187
Add external-file-property to LogFileMvcEndpoint    Add an additional property to LogFileMvcEndpoint to allow log files to  be read from an external location. This is helpful when a launch.script  is used to start the boot-application and the logfile is written by a  redirect of stdout/stderr.    Fixes gh-4255  Closes gh-4836
Prefer interfaces over concrete classes    Makes code easier to scan by removing unnecessary noise.
Add some missing Nullable annotations
Use a dummy value to further validation optional delegation    Prior to this other things might cause a null value. This ensures the value can only come from only place.
Reformat code using Spring code formatter plugin
Improve startup times    Improve startup times (although not by much) by adding more background  pre-initializers and lazily evaluating the whitelabel SpEL view.    See gh-6177
Move connection tests to Junit 5 (#6376)
Fix mapping of Cassandra's idle-timeout and heartbeat-interval    Previous to this commit the connection idle timeout and heartbeat  interval were mapped to seconds whereas Cassandra expects ms for all  duration types.    This commit fixes the mapping and removes the default duration unit  since it should be considered ms like every other duration properties.    Closes gh-23249
Polish 'Debug mode is not logging web and sql related loggers'    Closes gh-16018
Do not enable cglib if spring.aop.proxy-target-class is configured    This commit makes sure to honour the `spring.aop.proxy-target-class`  property if set by the user. Previously, the  `PersistenceExceptionTranslationPostProcessor` was always configured to  use cglib, regardless of the value of that property.    Closes gh-8887
Polish RSocket support
Polish 'Add configuration property for Spring Kafka's missingTopicsFatal'    Closes gh-16740
Polish 'Allow customization of MongoClientSettings.Builder'    Closes gh-9341
Generate default values from Duration and Period .ZERO    Closes gh-23082
Align with changes in latest Integration snapshots    See gh-22729
Remove use of regular expressions in Spring profile-based doc matching    Closes gh-1309
Report non-matching outer class conditions    Update ConditionEvaluationReport so that, whenever a negative outcome  is added for a source, any existing outcomes for inner classes of that  source are updated with a non-matching outcome that indicates that the  outer configuration did not match.    Conditions are evaluated in two phases; PARSE_CONFIGURATION first and  REGISTER_BEAN second. If a parent classÃ¢ÂÂs conditions match in  PARSE_CONFIGURATION then its inner classes will have their  PARSE_CONFIGURATION conditions evaluated. If they all match, the inner  class will be reported as a positive match in the auto-configuration  report even if the outer class does not match as a result of the  subsequent evaluation of a REGISTER_BEAN condition.    Fixes gh-2122
Rename preferred-mapper property so its clear it only applies to JSON    preferred-mapper has been renamed to preferred-json-mapper to make it  clear that it only affects the JSON mapper and that the XML mapper  that will be used (if any) is unaffected    See gh-2247
Order char encoding filter so it sets encoding before request is read    For the character encoding filter to work, it's vital that it sets  the request's encoding before any other filters attempt to read the  request. This commit updates the order of  OrderedCharacterEncodingFilter to be HIGHEST_PRECEDENCE and improves  the existing test to check that the ordering is as required.    Closes gh-3912
Apply spring.jackson.* config to Spring Data REST object mappers    Closes gh-1698
No-op ResetMocksTestExecutionListener when Mockito is not present    Closes gh-11508
Drop ignoreNestedProperties attribute from @ConfigurationProperties    Closes gh-8657
Align with API changes in latest Spring Data Kay snapshots    See gh-7461
Add comments for gRPC implementations
Add 'getUniqueServiceKey' to keep backward compatibility.
duplicate decrease for ExecuteLimitFilter onError (#4380)
Add spring annotation support for ConfigCenter.
Inject a leading . for better matching under JavaNetCookieJar    Closes: https://github.com/square/okhttp/issues/2549
Documentation for endpoint resolving on a base URL.
Remove deprecated error identifier.    This whole class is probably going to die or morph, but killing off tech debt before major refactorings makes me feel good.
Update documentation for handling of @Field and @Part values.
Rename 'pair' to 'field' to match annotation.    Closes #206.
Reset thread name to idle when not in use.    Closes #188.
remove unnecessary null check  before instance of (#4321)    Signed-off-by: jimin.jm <develope97>
move isMetaMethod to MethodUtils (#4387)
Honour ext and classifier on @Grabbed dependencies    We currently honour type, but ignore ext. Aether doesn't make a  distinction between the two so a Grab that specifies both type and ext  but with different values is considered to be an error.    Fixes #995
For #855, remove FrameworkMethod.getParameterSignatures()    Having this method in place made a class from the 'core' of JUnit  (org.junit.runners.model) depend on something from 'experimental' --  a dependency going in the wrong direction.
Replaced IllegalArgumentException for IOException    It's more consistent to throw an IOException instead of an  IllegalArgumentException
Remove usages of FrameworkMember as a raw type. (#1596)
Fix regression in TemporaryFolder.newFolder(String) for paths with slashes. (#1402)    In JUnit 4.11, newFolder(String) was changed to no longer support paths  with a file separator. This has been fixed. The overload of newFolder()  that supports passing in multiple strings still does not allow strings  containing file separators.
Add @Override annotations
Align SessionsEndpoint with Spring Session API improvements    This commit aligns SessionsEndpoint with  FindByIndexNameSessionRepository API improvements that simplifies  retrieval of sessions by principal name.    Closes gh-14124
Configure PathPattern for RSocket routing    This commit configures a `PathPatternRouteMatcher` in the RSocket  support if spring-web is on the classpath. This `RouteMatcher`  implementation is more efficient than the `SimpleRouteMatcher`, which is  based on the `AntPathMatcher`.    Closes gh-16865
Align counter behaviour between metric exporters    The MetricCopyExporter has had the capability for a while to keep  track of counters internally. This change aligns that with the  PrefixMetricGroupExporter.    Fixes gh-5762
Set UserDetailsService in default AuthenticationManagerBuilder    Only affects the default AuthenticationManagerBuilder (so when users  are not overriding the default global user details). Makes the  UserDetailsService effectively available as it would be if we used  AuthenticationManagerBuilder.inMemoryAuthentication() as a  shared object in the HttpSecurity.    Fixes gh-3152
Fix ordering of keys in PropertySourcesPropertyValues    Since @ConfigurationProperties binding uses a single instance of  PropertySourcesPropertyValues per bean, there doesn't seem to be  any issue with using a normal LinkedHashMap. Then the order  passed in as PropertySources will be preserved.    Fixes gh-2487
Use deterministic ordering of JavaBean methods    Update `JavaBeanBinder` so that methods and fields are sorted before  being processed. This ensures that setters are called in a deterministic  order, rather than the unspecified and variable order that reflection  provides.    Fixes gh-24068
Add group property to DynatraceProperties    See gh-19369
Optimize checks for java classes in Binder    Closes gh-13567
Fix issue 30. Make TestWatcher abstract.
Polish 'Fix request factory used with withBasicAuth'    Fixes gh-15982
make metadata key contain : when version and group is empty (#4465)
Typos in Javadocs
Throw exception with helpful message if annotated field is not public (fixes issue #260).
Move TestClassTest to package org.junit.runners.model.    It is common to add tests to the same package as the class under test.
typo for AccessLogFilter (#3633)
Class comment error (#3481)
Remove unnecessary use of grouping parentheses    Let's remove warnings found by errorprone.    - attempt  ```  okhttp/okhttp/src/test/java/okhttp3/CallTest.java:2056: warning: [UnnecessaryParentheses] Unnecessary use of grouping parentheses              sink.writeUtf8('attempt ' + (attempt++));                                          ^      (see https://errorprone.info/bugpattern/UnnecessaryParentheses)    Did you mean 'sink.writeUtf8('attempt ' + attempt++);'?  ```    - isEaualTo  ```  okhttp/src/test/java/okhttp3/OkHttpClientTest.java:287: warning: [UnnecessaryParentheses] Unnecessary use of grouping parentheses        assertThat(expected.getMessage()).isEqualTo(('protocols must not contain null'));                                                    ^      (see https://errorprone.info/bugpattern/UnnecessaryParentheses)  ```
Refactor: remove NetUtils.getHostAddress() and relace it with NetUtils.getLocalHost() (#5526)
Add Retrofit.Builder.adapterFactories(). (#2486)
Simplify code with Lambda (#4834)    Simplify code with Lambda
Remove unused import for unit test (#4976)    * clear unused import
Rename withStacktrace() to isException()/isThrowable()    Following suggestion by @sf105
fix #4587: enhance url equals (#6706)
refactor some string operations with StringUtils (#5112)    refactor string empty check statements.
When pool autocommit is disabled, inform Hibernate    Starting with Hibernate 5.2.10, the JPA property  `hibernate.connection.provider_disables_autocommit` should be set to true  when the datasource has autocommit disabled in order to improve  performance.    See gh-9737
Remove redundant throws.
Add @IntegrationComponentScan auto-configuration    Update Spring Integration auto-configuration so that  `@IntegrationComponentScan` from `AutoConfigurationPackages` is  implicitly applied. Prior to this commit `@MessagingGateway` interfaces  would only get picked up if `@IntegrationComponentScan` was added  alongside with the `@SpringBootApplication`.    Fixes gh-2037  Closes gh-7718
