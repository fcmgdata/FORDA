avoid unnecessary autoboxing
Suppress warnings in Gradle build
Raise exception on missing request parameters  Issue: SPR-10193
Use DataBuffer.write in CharSequenceEncoder  Since SPR-17558, `DataBuffer` now offers a new method to write Strings to them. This commit makes `CharSequenceEncoder` use that.  Issue: SPR-17558
UndertowServerHttpRequest: suspend reading when no demand  - When there is no demand for reading, the implementation should suspend reading otherwise useless events will be send by Undertow to the registered read listener. - There is not need to wait for an event for reading/writing after calling resumeReads/resumeWrites
Set SameSite default to Lax  Issue: SPR-16418
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
Expose empty annotation array as empty AnnotationAttributes array  Closes gh-22405
changed the way services are loaded/saved. removed unneeded load op
Revert "Introduce Ordered#NOT_ORDERED"  This reverts commit da914bcfb4599ebf746ea477c691ed99c4842ed0 and also removes the use of Ordered#NOT_ORDERED from EnableTransactionManagement and ProxyTransactionManagementConfiguration in favor of defaulting to Ordered#LOWEST_PRIORITY, which is actually the default that results when no 'order' attribute is specified in XML.
Support Date to String in JodaTimeConverters  Update JodaTimeConverters in include support for Date to String conversion.  The JodaTimeFormattingTests and DateFormattingTests have been extended to ensure that Date to String conversion is supported with or without Joda.  Issue: SPR-10198
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
Suppress warnings and remove unused imports
Raise exception on missing request parameters  Issue: SPR-10193
Return 415 on bad request body content-type  Issue: SPR-10982
added further conversion tests (triggered by 3.0.6 backports)
Support Date to String in JodaTimeConverters  Update JodaTimeConverters in include support for Date to String conversion.  The JodaTimeFormattingTests and DateFormattingTests have been extended to ensure that Date to String conversion is supported with or without Joda.  Issue: SPR-10198
Expose empty annotation array as empty AnnotationAttributes array  Closes gh-22405
Allow setting timeout in ResponseBodyEmitter  Issue: SPR-13104
Replace Promises.error->Streams.fail, concatMap->map
avoid unnecessary autoboxing
Tests: improve logging of external node version and build  The BWC tests also run against a snapshot build of previous release branches. Upon a failure it's important to know what commit exactly was used.  Closes #10111
Proper use of setComplete in ContextPathCompositeHandler  Issue: SPR-17144
Suppress warnings in Gradle build
Return paths ending with / in root representation  This avoids an unnecessary redirect, for drivers that (properly) follow hyperlinks.
Fixed SPR issue reference and aligned exception messages  Issue: SPR-11592
Add reset() to MockRestServiceServer  Issue: SPR-14306
Revert "Introduce Ordered#NOT_ORDERED"  This reverts commit da914bcfb4599ebf746ea477c691ed99c4842ed0 and also removes the use of Ordered#NOT_ORDERED from EnableTransactionManagement and ProxyTransactionManagementConfiguration in favor of defaulting to Ordered#LOWEST_PRIORITY, which is actually the default that results when no 'order' attribute is specified in XML.
Support Date to String in JodaTimeConverters  Update JodaTimeConverters in include support for Date to String conversion.  The JodaTimeFormattingTests and DateFormattingTests have been extended to ensure that Date to String conversion is supported with or without Joda.  Issue: SPR-10198
Provide alternative message code resolver styles  Introduce new 'style' property to DefaultMessageCodesResolver allowing for alternative message styles. Current styles are PREFIX_ERROR_CODE and POSTFIX_ERROR_CODE. The default style retains existing behavior.  Issue: SPR-9707
Throw exception if TxMgr cannot be retrieved for @Transactional test  Prior to this commit, a @Transactional integration test would silently be executed without a transaction if the transaction manager could not be retrieved from the application context -- for example, it no such bean was defined or if multiple beans were present but none satisfied the qualifier.  This commit addresses this issue by throwing an IllegalStateException if the PlatformTransactionManager cannot be retrieved for a @Transactional test.  Issue: SPR-13895
Throw exception if TxMgr cannot be retrieved for @Transactional test  Prior to this commit, a @Transactional integration test would silently be executed without a transaction if the transaction manager could not be retrieved from the application context -- for example, it no such bean was defined or if multiple beans were present but none satisfied the qualifier.  This commit addresses this issue by throwing an IllegalStateException if the PlatformTransactionManager cannot be retrieved for a @Transactional test.  Issue: SPR-13895
Suppress warnings in Gradle build
Suppress warnings and remove unused imports
Support Date to String in JodaTimeConverters  Update JodaTimeConverters in include support for Date to String conversion.  The JodaTimeFormattingTests and DateFormattingTests have been extended to ensure that Date to String conversion is supported with or without Joda.  Issue: SPR-10198
Throw exception if TxMgr cannot be retrieved for @Transactional test  Prior to this commit, a @Transactional integration test would silently be executed without a transaction if the transaction manager could not be retrieved from the application context -- for example, it no such bean was defined or if multiple beans were present but none satisfied the qualifier.  This commit addresses this issue by throwing an IllegalStateException if the PlatformTransactionManager cannot be retrieved for a @Transactional test.  Issue: SPR-13895
Throw exception if TxMgr cannot be retrieved for @Transactional test  Prior to this commit, a @Transactional integration test would silently be executed without a transaction if the transaction manager could not be retrieved from the application context -- for example, it no such bean was defined or if multiple beans were present but none satisfied the qualifier.  This commit addresses this issue by throwing an IllegalStateException if the PlatformTransactionManager cannot be retrieved for a @Transactional test.  Issue: SPR-13895
avoid unnecessary autoboxing
PropertyPlaceholderConfigurer is compatible with Spring 2.5 extensions such as GigaSpaces again (SPR-6514)
clean up the Eclipse warnings of camel-spring
Polish @Conditional Javadoc and tests
UndertowServerHttpRequest: suspend reading when no demand  - When there is no demand for reading, the implementation should suspend reading otherwise useless events will be send by Undertow to the registered read listener. - There is not need to wait for an event for reading/writing after calling resumeReads/resumeWrites
WebClient throws ClassCastException for bodyToMono(ParameterizedTypeReference)  Prior to this commit, the `WebClient` always throws a `ClassCastException` when an error occurs in `bodyToMono(ParameterizedTypeReference)``, and not the expected exception, as set up by `onStatus`  Issue: SPR-16025
Polish @Conditional Javadoc and tests
Support empty body in Jackson2JsonDecoder.decodeToMono  Prior to this commit, extracting an HTTP response with an empty body and no Content-Type header using the WebClient would:  * trigger the use of the Jackson2JsonDecoder * throw a NoSuchElementException because of the use of `Flux.single()`  This commit changes this behavior to `Flux.singleOrEmpty()` to avoid throwing exceptions for empty Flux instances.  Issue: SPR-14582
added further conversion tests (triggered by 3.0.6 backports)
ContextLoaderListener extends ContextLoader
Expose empty annotation array as empty AnnotationAttributes array  Closes gh-22405
Suppress warnings in Gradle build
Throw exception if TxMgr cannot be retrieved for @Transactional test  Prior to this commit, a @Transactional integration test would silently be executed without a transaction if the transaction manager could not be retrieved from the application context -- for example, it no such bean was defined or if multiple beans were present but none satisfied the qualifier.  This commit addresses this issue by throwing an IllegalStateException if the PlatformTransactionManager cannot be retrieved for a @Transactional test.  Issue: SPR-13895
HttpEntity and its subclasses insist on same target type for equality  Issue: SPR-12910
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
Return 415 on bad request body content-type  Issue: SPR-10982
Investigate claim on SO regarding ctx cache in TCF  This commit introduces a test that investigates a claim made on Stack Overflow regarding context caching in the TestContext Framework (TCF).
Investigate claim on SO regarding ctx cache in TCF  This commit introduces a test that investigates a claim made on Stack Overflow regarding context caching in the TestContext Framework (TCF).
SPR-8448 Remove URI template vars from the model before appending to query string in RedirectView
Revert "Introduce Ordered#NOT_ORDERED"  This reverts commit da914bcfb4599ebf746ea477c691ed99c4842ed0 and also removes the use of Ordered#NOT_ORDERED from EnableTransactionManagement and ProxyTransactionManagementConfiguration in favor of defaulting to Ordered#LOWEST_PRIORITY, which is actually the default that results when no 'order' attribute is specified in XML.
Suppress warnings in Gradle build
Investigate claim on SO regarding ctx cache in TCF  This commit introduces a test that investigates a claim made on Stack Overflow regarding context caching in the TestContext Framework (TCF).
Support Date to String in JodaTimeConverters  Update JodaTimeConverters in include support for Date to String conversion.  The JodaTimeFormattingTests and DateFormattingTests have been extended to ensure that Date to String conversion is supported with or without Joda.  Issue: SPR-10198
Support Date to String in JodaTimeConverters  Update JodaTimeConverters in include support for Date to String conversion.  The JodaTimeFormattingTests and DateFormattingTests have been extended to ensure that Date to String conversion is supported with or without Joda.  Issue: SPR-10198
avoid unnecessary autoboxing
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
Suppress warnings in Gradle build
avoid unnecessary autoboxing
Support @Validated at method level for overriding validation groups  Issue: SPR-9174
Throw exception if TxMgr cannot be retrieved for @Transactional test  Prior to this commit, a @Transactional integration test would silently be executed without a transaction if the transaction manager could not be retrieved from the application context -- for example, it no such bean was defined or if multiple beans were present but none satisfied the qualifier.  This commit addresses this issue by throwing an IllegalStateException if the PlatformTransactionManager cannot be retrieved for a @Transactional test.  Issue: SPR-13895
Avoid java.util.stream.Stream usage in hot paths  Prior to this commit, profiling sessions would show that using `java.util.stream.Stream` in some hot code paths creates significant garbage.  Where streams aren't really required, this commit turns those snippets into imperative logic  because those are likely to be called once or multiple times per request.  Closes gh-22341
Expose empty annotation array as empty AnnotationAttributes array  Closes gh-22405
Expose empty annotation array as empty AnnotationAttributes array  Closes gh-22405
Support Date to String in JodaTimeConverters  Update JodaTimeConverters in include support for Date to String conversion.  The JodaTimeFormattingTests and DateFormattingTests have been extended to ensure that Date to String conversion is supported with or without Joda.  Issue: SPR-10198
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
Return 415 on bad request body content-type  Issue: SPR-10982
Suppress warnings and remove unused imports
Add reset() to MockRestServiceServer  Issue: SPR-14306
Add reset() to MockRestServiceServer  Issue: SPR-14306
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
avoid unnecessary autoboxing
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
Defensive initialization of AsyncXMLInputFactory  Aalto's InputFactoryImpl already disables loading of external entities by default (property "javax.xml.stream.isSupportingExternalEntities"). This commit goes further by applying the same defensive measures as we do elsewhere for XMLInputFactory, which disables DTD completely. Arguably there is no good reason to enable that by default in WebFlux.
Add reset() to MockRestServiceServer  Issue: SPR-14306
Add reset() to MockRestServiceServer  Issue: SPR-14306
BasicAuthorizationInterceptor belongs to http.client.support  Issue: SPR-14412
added further conversion tests (triggered by 3.0.6 backports)
Raise exception on missing request parameters  Issue: SPR-10193
Support Date to String in JodaTimeConverters  Update JodaTimeConverters in include support for Date to String conversion.  The JodaTimeFormattingTests and DateFormattingTests have been extended to ensure that Date to String conversion is supported with or without Joda.  Issue: SPR-10198
Suppress warnings and remove unused imports
Add reset() to MockRestServiceServer  Issue: SPR-14306
Rename test classes to avoid confusion
Support Date to String in JodaTimeConverters  Update JodaTimeConverters in include support for Date to String conversion.  The JodaTimeFormattingTests and DateFormattingTests have been extended to ensure that Date to String conversion is supported with or without Joda.  Issue: SPR-10198
Expose empty annotation array as empty AnnotationAttributes array  Closes gh-22405
Investigate claim on SO regarding ctx cache in TCF  This commit introduces a test that investigates a claim made on Stack Overflow regarding context caching in the TestContext Framework (TCF).
Remove unintended dependency on Servlet API in SockJS  Add a factory method in ServerHttpRequest for creating a ServerHttpAsyncRequestControl.
Support Date to String in JodaTimeConverters  Update JodaTimeConverters in include support for Date to String conversion.  The JodaTimeFormattingTests and DateFormattingTests have been extended to ensure that Date to String conversion is supported with or without Joda.  Issue: SPR-10198
Move Predicates util to com.facebook.presto.util.MorePredicates
Modify actual & preferred partitioning for GroupIdNode  Default behavior for GroupId was to pass down parent partitioning preferences unchanged and also pass up child actual partitioning unchanged. However:  - Children of the GroupId plan node do not have access to new symbols (i.e. passthrough symbols) that are generated by the GroupId. These must be translated. - We cannot pass through preferences for symbols that are modified by GroupId (i.e. the set difference of the distinct and common grouping columns). These must be removed.
Add year check to Presto server startup  * Rename PrestoJvmRequirements to PrestoServerRequirements * Verify that the year is current, to avoid issues with third party   libraries  Testing: mvn clean install; manually verified on server with incorrect year
SPR-8448 Remove URI template vars from the model before appending to query string in RedirectView
Return final operator stats on task completion  Also added isFinal() method to OperatorInfo to reduce the amount of data that is transferred to the coordinator when this happens.
Use an EnumMap instead of a HashMap when the key is an enum
Pull up common code
TIKA-1074: catch Exception not Throwable, and restore interrupt bit for InterruptedExc
polishing  Updating pull request for SPR-9541
[java] Deleting unused imports
Remove unintended dependency on Servlet API in SockJS  Add a factory method in ServerHttpRequest for creating a ServerHttpAsyncRequestControl.
(AnnotationAware)OrderComparator supports null values again  Issue: SPR-15823
Consistent use of Class<?>
Porting improvement for restful 2 to allow id parameters WW-1939
SimonStewart: Move chrome tests to junit4  r16029
Migrate map_values to new scalar framework
Add year check to Presto server startup  * Rename PrestoJvmRequirements to PrestoServerRequirements * Verify that the year is current, to avoid issues with third party   libraries  Testing: mvn clean install; manually verified on server with incorrect year
AlexeiBarantsev: Allowing to enable/disable native events in FirefoxDriver using Capabilities  r17238
Fix bug where hive.bucket-execution is not honored  Before this fix, * If bucketExecutionEnabled is true, insert into bucketed table would work   (as if bucketExecutionWriting is enabled); * If bucketExecutionEnabled is false, insert would either fail or create a   corrupted partition in an existing table.
Return final operator stats on task completion  Also added isFinal() method to OperatorInfo to reduce the amount of data that is transferred to the coordinator when this happens.
Adding an option to start Firefox in headless mode
Suppress warnings and remove unused imports
Support Date to String in JodaTimeConverters  Update JodaTimeConverters in include support for Date to String conversion.  The JodaTimeFormattingTests and DateFormattingTests have been extended to ensure that Date to String conversion is supported with or without Joda.  Issue: SPR-10198
Throw exception for delete from unpartitioned Hive table
ContextLoaderListener extends ContextLoader
Partial fix for https://issues.apache.org/bugzilla/show_bug.cgi?id=47577 Remove unused imports.
Add year check to Presto server startup  * Rename PrestoJvmRequirements to PrestoServerRequirements * Verify that the year is current, to avoid issues with third party   libraries  Testing: mvn clean install; manually verified on server with incorrect year
Avoid java.util.stream.Stream usage in hot paths  Prior to this commit, profiling sessions would show that using `java.util.stream.Stream` in some hot code paths creates significant garbage.  Where streams aren't really required, this commit turns those snippets into imperative logic  because those are likely to be called once or multiple times per request.  Closes gh-22341
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
TIKA-371: Excel formatting depends on the default locale  Set the locale in a few more test cases to avoid environment-specific test results
llow setting parser options in test query runner
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
Further locking optimizations for the retrieval of non-singleton beans  Issue: SPR-12250
Consistent use of Class<?>
Do not accept number for RFC2822/ISO8601/Custom temporal field decoders
Handle non-equijoins with negated expressions  Normalize join criteria to support expressions like "not(l.x = r.x)"
Inlining JUnit4TestBase.waitFor since it is used in one place.
Add Servlet 3.1 methods to mock request  Issue: SPR-11492
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
some new supporting methods for the ConfigurationTree
Ignoring and unignoring tests to match current state of Marionette (Nightly)
Rename test classes to avoid confusion
Remove some unneeded unboxing, unneeded methods, made some stuff private that can be
Move Predicates util to com.facebook.presto.util.MorePredicates
Ignoring and unignoring tests to match current state of Marionette (Nightly)
Deleting all ignores for REMOTE, they all pass for me with legacy FirefoxDriver
Update FileExtensionContentTypeResolver  Rename to MappingContentTypeResolver and replace "fileExtension" with "key" in methods to be more general (e.g. file extension or query param). Also switch from List to Set for the return values.
Fix: use correct return type in Javadoc documentation (#6344)
accept Set<?> instead of Set<Object> (SPR-6742)
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=55110 Small performance improvements Patch provided by Adrian Nistor
Reverted a little bit of the Locale stuff.  I really think it is better to use the default locale for normal operations and only defeat that in testing.  Otherwise, we really are treading on toes.
SimonStewart: Move chrome tests to junit4  r16029
added further conversion tests (triggered by 3.0.6 backports)
Improve memory accounting in top N
bug 7611: get directPodBased default network when deploy vm with no networkId specified status 7611: resolved fixed
Raise exception on missing request parameters  Issue: SPR-10193
Add Servlet 3.1 methods to mock request  Issue: SPR-11492
Support Date to String in JodaTimeConverters  Update JodaTimeConverters in include support for Date to String conversion.  The JodaTimeFormattingTests and DateFormattingTests have been extended to ensure that Date to String conversion is supported with or without Joda.  Issue: SPR-10198
Migrate array_sort() to new scalar framework
Correctly handle errors from url_decode  This makes the function work with try().
Add config option for task info refresh max wait
get rid of unwanted setter methods in scheduler api
Add config option for task info refresh max wait
PropertyPlaceholderConfigurer is compatible with Spring 2.5 extensions such as GigaSpaces again (SPR-6514)
Score the new safari options too
Add version display
Explicit notes on transaction phase processing  Issue: SPR-15323
Throw exception for delete from unpartitioned Hive table
added further conversion tests (triggered by 3.0.6 backports)
Add session attributes to SimpMessageHeaderAccessor  This change exposes the WebSocketSession attributes through a message header. The StompSubProtocolHandler adds this to incoming messages. For now messaging handling  methods can access the map via @Header, e.g.:  @Header(StompHeaderAccessor.SESSION_ATTRIBUTES) Map<String, Object> attrs) {  Issue: SPR-11566
Print request body in PrintingResultHandler in Spring MVC Test  Prior to this commit, the PrintingResultHandler used by the various print() and log() methods in Spring MVC Test printed the response body but not the request body.  Since request bodies are sometimes generated programmatically, however, it can be beneficial to have the dynamically generated request body logged as well.  This commit therefore prints the request body in PrintingResultHandler by delegating to the recently introduced getContentAsString() method in MockHttpServletRequest.  Issue: SPR-14717
Avoid java.util.stream.Stream usage in hot paths  Prior to this commit, profiling sessions would show that using `java.util.stream.Stream` in some hot code paths creates significant garbage.  Where streams aren't really required, this commit turns those snippets into imperative logic  because those are likely to be called once or multiple times per request.  Closes gh-22341
Canonicalize ValuesNode as it may contain correlated symbols  Fixes #11047
AnnotationMatchingPointcut uses AnnotatedElementUtils.hasAnnotation  For consistency with AnnotationAsyncExecutionInterceptor (based on AnnotatedElementUtils.findMergedAnnotation) which is the main companion of AnnotationMatchingPointcut's checkInherited mode.  Issue: SPR-16933
Tests for @Enable/@ComponentScan without @Configuration  Issue: SPR-10660
apache licence headers
Rename test classes to avoid confusion
[STORM-2741] Add in config options for metrics consumer cpu and memory
Add session attributes to SimpMessageHeaderAccessor  This change exposes the WebSocketSession attributes through a message header. The StompSubProtocolHandler adds this to incoming messages. For now messaging handling  methods can access the map via @Header, e.g.:  @Header(StompHeaderAccessor.SESSION_ATTRIBUTES) Map<String, Object> attrs) {  Issue: SPR-11566
2.x: Add missing @Test annotation on tests (#4597)  * 2.x: Add missing @Test annotation on tests  * Fix test
Add license headers.  r1471
Throw exception for delete from unpartitioned Hive table
Adding an option to start Firefox in headless mode
rename to isSuggestOnly
UndertowServerHttpRequest: suspend reading when no demand  - When there is no demand for reading, the implementation should suspend reading otherwise useless events will be send by Undertow to the registered read listener. - There is not need to wait for an event for reading/writing after calling resumeReads/resumeWrites
Deleting all ignores for REMOTE, they all pass for me with legacy FirefoxDriver
UndertowServerHttpRequest: suspend reading when no demand  - When there is no demand for reading, the implementation should suspend reading otherwise useless events will be send by Undertow to the registered read listener. - There is not need to wait for an event for reading/writing after calling resumeReads/resumeWrites
avoid unnecessary autoboxing
UndertowServerHttpRequest: suspend reading when no demand  - When there is no demand for reading, the implementation should suspend reading otherwise useless events will be send by Undertow to the registered read listener. - There is not need to wait for an event for reading/writing after calling resumeReads/resumeWrites
Fixed WebExtensions installation  Fixed installation of new firefox webextension built with new WebExtension API i.e. the one which contains manifest.json instead of install.rdf  Fixes #4093  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
WW-1453  Simple cleanup items   - remove duplicate and/or unused imports   - change static access to class, not instance
Add QueryStateMachine.getFailureInfo to avoid creation of QueryInfo
Partial fix for https://issues.apache.org/bugzilla/show_bug.cgi?id=47577 Remove unused imports.
Add getOutputVariables to pass through PlanNodes  The following PlanNodes output the same symbols (variables) as their source: EnforceSignelRowNode, FilterNode, LimitNode, SampleNode, SortNode and TopNNode.
Allow setting timeout in ResponseBodyEmitter  Issue: SPR-13104
StringBuffer -> StringBuilder for o.a.c.deploy
Fix for https://issues.apache.org/bugzilla/show_bug.cgi?id=47161 Correctly report maxThreads Note 6.0.x will need a different fix as it still uses threadpools
Add some finals
Suppress warnings in Gradle build
Further locking optimizations for the retrieval of non-singleton beans  Issue: SPR-12250
Add QueryStateMachine.getFailureInfo to avoid creation of QueryInfo
Restore proper use of CacheLoader  Since Guava 11, CacheLoader is only invoked with a LoadingCache but the GuavaCache wrapper is always invoking getIfPresent(), available on the main Guava Cache interface.  Update GuavaCache#get to check for the presence of a LoadingCache and call the appropriate method.  Issue: SPR-12842
fixed some generics related warnings and did a little re-formatting
Remove unnecessary type parameter
TIKA-655: IWorkPackageParser / IWorkParser not registering properly  Work around the CI build failures caused by the CloseShieldInputStream unexpectedly disabling the mark support of a given input stream.
Allow setting timeout in ResponseBodyEmitter  Issue: SPR-13104
Update javadoc with @since
Update javadoc with @since
Reverted a little bit of the Locale stuff.  I really think it is better to use the default locale for normal operations and only defeat that in testing.  Otherwise, we really are treading on toes.
Add author attribution for htmlEscape methods  Issue: SPR-9293
Clarify the use of sessionTransacted  This commit clarifies the role of the external transactionManager for a DMLC and the relationship with the sessionTransacted flag  Issue: SPR-9200
WW-1453  Simple cleanup items   - remove duplicate and/or unused imports   - change static access to class, not instance
Align code between connectors in preparation for pulling code up to the superclass No need to close the AJP connection if there was no error
Add year check to Presto server startup  * Rename PrestoJvmRequirements to PrestoServerRequirements * Verify that the year is current, to avoid issues with third party   libraries  Testing: mvn clean install; manually verified on server with incorrect year
Add a session property to disable planning with table node partitioning
Tests for @Enable/@ComponentScan without @Configuration  Issue: SPR-10660
added further conversion tests (triggered by 3.0.6 backports)
Add zip of a collection of Observables
SimonStewart: Move chrome tests to junit4  r16029
JasonLeyba:  The DriverFactory should consider whether javascript is enabled when looking for a match.  r7894
Add missing timeout in web-reactive IntegrationTests
Remove unintended dependency on Servlet API in SockJS  Add a factory method in ServerHttpRequest for creating a ServerHttpAsyncRequestControl.
Remove unintended dependency on Servlet API in SockJS  Add a factory method in ServerHttpRequest for creating a ServerHttpAsyncRequestControl.
Expose empty annotation array as empty AnnotationAttributes array  Closes gh-22405
Preventing augmentation of subclasses of RemoteWebDriver. Fixes issue 6681
Proper use of setComplete in ContextPathCompositeHandler  Issue: SPR-17144
EranMes on behalf of EmmaSoderberg: Add support for server log type.  r17668
Return final operator stats on task completion  Also added isFinal() method to OperatorInfo to reduce the amount of data that is transferred to the coordinator when this happens.
ObserveOn scheduled unsubscription
Improve memory accounting in top N
Add QueryStateMachine.getFailureInfo to avoid creation of QueryInfo
Use an EnumMap instead of a HashMap when the key is an enum
UndertowServerHttpRequest: suspend reading when no demand  - When there is no demand for reading, the implementation should suspend reading otherwise useless events will be send by Undertow to the registered read listener. - There is not need to wait for an event for reading/writing after calling resumeReads/resumeWrites
Add blocking mode tweak, as I accidentally found out blocking does make a difference.
Throw exception for delete from unpartitioned Hive table
Update FileExtensionContentTypeResolver  Rename to MappingContentTypeResolver and replace "fileExtension" with "key" in methods to be more general (e.g. file extension or query param). Also switch from List to Set for the return values.
[STORM-2741] Add in config options for metrics consumer cpu and memory
Shortening firefox profile textual representation in capabilities. Fixes issue 6445
Support Date to String in JodaTimeConverters  Update JodaTimeConverters in include support for Date to String conversion.  The JodaTimeFormattingTests and DateFormattingTests have been extended to ensure that Date to String conversion is supported with or without Joda.  Issue: SPR-10198
Revert "Introduce Ordered#NOT_ORDERED"  This reverts commit da914bcfb4599ebf746ea477c691ed99c4842ed0 and also removes the use of Ordered#NOT_ORDERED from EnableTransactionManagement and ProxyTransactionManagementConfiguration in favor of defaulting to Ordered#LOWEST_PRIORITY, which is actually the default that results when no 'order' attribute is specified in XML.
avoid unnecessary autoboxing
Suppress warnings in Gradle build
Raise exception on missing request parameters  Issue: SPR-10193
Fixed issues on management of iterators and collections as result set. SQL Union now is lighter and accepts dupicates (use set() to remove them)
Enables implementations of the BlobContainer interface to (#19749)  conform with the requirements of the writeBlob method by throwing a FileAlreadyExistsException if attempting to write to a blob that already exists. This change means implementations of BlobContainer should never overwrite blobs - to overwrite a blob, it must first be deleted and then can be written again.  Closes #15579
Support empty body in Jackson2JsonDecoder.decodeToMono  Prior to this commit, extracting an HTTP response with an empty body and no Content-Type header using the WebClient would:  * trigger the use of the Jackson2JsonDecoder * throw a NoSuchElementException because of the use of `Flux.single()`  This commit changes this behavior to `Flux.singleOrEmpty()` to avoid throwing exceptions for empty Flux instances.  Issue: SPR-14582
CAMEL-9309: Make it easier to turn on|off java transport over http
Changed "Gets the" to "Returns the" - Requested by @trustin
avoid unnecessary autoboxing
UndertowServerHttpRequest: suspend reading when no demand  - When there is no demand for reading, the implementation should suspend reading otherwise useless events will be send by Undertow to the registered read listener. - There is not need to wait for an event for reading/writing after calling resumeReads/resumeWrites
Support Date to String in JodaTimeConverters  Update JodaTimeConverters in include support for Date to String conversion.  The JodaTimeFormattingTests and DateFormattingTests have been extended to ensure that Date to String conversion is supported with or without Joda.  Issue: SPR-10198
Remove some unneeded unboxing, unneeded methods, made some stuff private that can be
Hotfix compilation error and missing generics
Remove unused code  Motivation:  Cleanup PlatformDependent* and remove unused code.  Modifications:  Code cleanup  Result:  Removed unused code
avoid unnecessary autoboxing
Add value() attribute to @Payload
Fix REST tests for composite indexes
Suppress warnings and remove unused imports
Tests for @Enable/@ComponentScan without @Configuration  Issue: SPR-10660
Expose empty annotation array as empty AnnotationAttributes array  Closes gh-22405
Tests for @Enable/@ComponentScan without @Configuration  Issue: SPR-10660
Return 415 on bad request body content-type  Issue: SPR-10982
Add reset() to MockRestServiceServer  Issue: SPR-14306
avoid unnecessary autoboxing
Suppress warnings in Gradle build
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
added further conversion tests (triggered by 3.0.6 backports)
Suppress warnings in Gradle build
Remove DispatcherHandler static factory methods  The typical way to load DispatcherHandler is to use WebHttpHandlerBuilder#applicationContext which also detecs filters, exception handlers, as well as other beans that are injected into every ServerWebExchange -- custom session manager, localecontext resolver, codecs for form data, multipart data, etc  WebHttpHandlerBuilder is the preferred and way so removing the ones on DispatcherHandler. They could always be added back later.
Raise exception on missing request parameters  Issue: SPR-10193
Add reset() to MockRestServiceServer  Issue: SPR-14306
Support Date to String in JodaTimeConverters  Update JodaTimeConverters in include support for Date to String conversion.  The JodaTimeFormattingTests and DateFormattingTests have been extended to ensure that Date to String conversion is supported with or without Joda.  Issue: SPR-10198
avoid unnecessary autoboxing
DRILL-2583, DRILL-3428: Catch exceptions, and throw UserException#dataReadError with more context. This closes #161  + Added convenient method to UserException for String.format(...)
[FLINK-3218] Fix overriding of user parameters when merging Hadoop configurations  This closes #1496
[BEAM-551] Add support for native PubSubIO
Fix issue with StompSubProtocolHandler initialization  This change ensures that StompSubProtocolHandler is injected with an ApplicationEventPublisher for both the Java and XML config.  Issue: SPR-11825
Minor: added utility methods
Automatic messageType detection for ChannelInboundMessageHandlerAdapter
Automatic messageType detection for ChannelInboundMessageHandlerAdapter
CAMEL-9309: Make it easier to turn on|off java transport over http
Reverted a little bit of the Locale stuff.  I really think it is better to use the default locale for normal operations and only defeat that in testing.  Otherwise, we really are treading on toes.
Changes to support the removal of the now callable in core (elastic/elasticsearch#3685)  Fixes to x-plugins code now that DateMathParser accepts a LongSupplier rather than a Callable to get the value of now  Relates to elastic/elasticsearchelastic/elasticsearch#20796  Original commit: elastic/x-pack-elasticsearch@99fc47a8a7ea34669196c89b175bf57d796197f1
[BEAM-551] Add support for native PubSubIO
Add TRACE, CONNECT, and PATCH http methods (#31035)  This is related to #31017. That issue identified that these three http methods were treated like GET requests. This commit adds them to RestRequest. This means that these methods will be handled properly and generate 405s.
SPR-8448 Remove URI template vars from the model before appending to query string in RedirectView
Make String.format() calls, aside from those used in log statements, specify a Locale for consistent behavior.
Fixed WebExtensions installation  Fixed installation of new firefox webextension built with new WebExtension API i.e. the one which contains manifest.json instead of install.rdf  Fixes #4093  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Remove some unneeded unboxing, unneeded methods, made some stuff private that can be
Fixed WebExtensions installation  Fixed installation of new firefox webextension built with new WebExtension API i.e. the one which contains manifest.json instead of install.rdf  Fixes #4093  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Fixed bug on concurrent management of server admin client interface
Add Servlet 3.1 methods to mock request  Issue: SPR-11492
Suppress warnings and remove unused imports
Raise exception on missing request parameters  Issue: SPR-10193
Raise exception on missing request parameters  Issue: SPR-10193
SPR-8448 Remove URI template vars from the model before appending to query string in RedirectView
Expose empty annotation array as empty AnnotationAttributes array  Closes gh-22405
UndertowServerHttpRequest: suspend reading when no demand  - When there is no demand for reading, the implementation should suspend reading otherwise useless events will be send by Undertow to the registered read listener. - There is not need to wait for an event for reading/writing after calling resumeReads/resumeWrites
Use DataBuffer.write in CharSequenceEncoder  Since SPR-17558, `DataBuffer` now offers a new method to write Strings to them. This commit makes `CharSequenceEncoder` use that.  Issue: SPR-17558
Using IOChannelUtils to resolve file path
Investigate claim on SO regarding ctx cache in TCF  This commit introduces a test that investigates a claim made on Stack Overflow regarding context caching in the TestContext Framework (TCF).
Allow setting compaction strategy via JMX. Patch by brandonwilliams, reviewed by jbellis for CASSANDRA-3452
Revert "Introduce Ordered#NOT_ORDERED"  This reverts commit da914bcfb4599ebf746ea477c691ed99c4842ed0 and also removes the use of Ordered#NOT_ORDERED from EnableTransactionManagement and ProxyTransactionManagementConfiguration in favor of defaulting to Ordered#LOWEST_PRIORITY, which is actually the default that results when no 'order' attribute is specified in XML.
Impermanent graph database deletes directories as well as files so that the directory gets completely wiped out.  Also added an @After which shuts down the db (which in turn deletes the directory) in the tests for it.
Missing commit: fix compilation issues and broken guava import.
Using IOChannelUtils to resolve file path
WW-1453  Simple cleanup items   - remove duplicate and/or unused imports   - change static access to class, not instance
Test: add AWI#enableShield() to decide if shield should run and let AWI#shieldEnabled() return whether shield is running in the test cluster  Original commit: elastic/x-pack-elasticsearch@698900d0028637a85d55329458787429f808bb72
ca: Fixes #2877 mgmt server cert should have all addrs of default nic (#2879)  This fixes the default RootCA provider implementation to initiate and issue certificate for mgmt server on startup for all the IP addresses on the default nic of that host.  Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>
Automatic messageType detection for ChannelInboundMessageHandlerAdapter
Rename method in MessageBrokerConfigurer
WW-1453  Simple cleanup items   - remove duplicate and/or unused imports   - change static access to class, not instance
More plugin tests
Using IOChannelUtils to resolve file path
CAMEL-8526: Add more EIP as specialized mbeans
UndertowServerHttpRequest: suspend reading when no demand  - When there is no demand for reading, the implementation should suspend reading otherwise useless events will be send by Undertow to the registered read listener. - There is not need to wait for an event for reading/writing after calling resumeReads/resumeWrites
Enables implementations of the BlobContainer interface to (#19749)  conform with the requirements of the writeBlob method by throwing a FileAlreadyExistsException if attempting to write to a blob that already exists. This change means implementations of BlobContainer should never overwrite blobs - to overwrite a blob, it must first be deleted and then can be written again.  Closes #15579
added further conversion tests (triggered by 3.0.6 backports)
