Initialize JNDI to fix failing Environment test  Issue: SPR-12223
Fixing encoding of payload passed by hub to a node
Initialize JNDI to fix failing Environment test  Issue: SPR-12223
Polished. This closes #1745
Polished. This closes #1745
Add test for combining @Controller with RouterFunctions  This commit adds a test for combining RouterFunctions with a @Controller.  Issue: SPR-15521
Allow JAXB to be registered next to plain Jackson  Issue: SPR-14336
Delete unused imports
Suppress warning in SpringFailOnTimeoutTests
Suppress warning in SpringFailOnTimeoutTests
WiretapConnector removes exchanges  Issue: SPR-15744
Fixed build by suppressing unchecked warnings
Make TestContextManager.getTestContext() public  This commit changes the visibility of the getTestContext() method in TestContextManager from 'protected' to 'public' in order to support test method injection in JUnit 5 and similar use cases.  Issue: SPR-14011
12905: No need to cast ContextRefreshedEvent. Safety applicationContext identity check.  Co-Authored-By: oalles <oalles@gmail.com>
Follow up fix for PR #1168
Use ArrayList instead of LinkedList
Delete dead code in spring-webmvc
Implement MessagingException.toString()  Issue: SPR-15091 Closes gh-1284
CAS-1377: Added integration tests
Port fix bug 29727. Changes to env-entry values should take effect on web-app reload.
Cleaning up unused imports.
Assign Jetty SockJS tests to "performance" test group  This change designates Jetty SockJS integration tests to run as part of the "performance", but not the main "publication", CI build due to recurring low-level failures suspected to be Jetty issues, e.g. "java.io.IOException: Cannot append to finished buffer" or "java.io.IOException: Out of order Continuation frame encountered".  The tests will still run at once a day with the performance build but should not fail the main build with false negatives. Also note that an Undertow variant of the exact same tests, which hasn't been failing, will continue to run as part of the main build.
Polished. This closes #1745
Suppress warning in SpringFailOnTimeoutTests
Suppress warning in SpringFailOnTimeoutTests
Use AtomicInteger instead of local synchronization around int field  Issue: SPR-11103
add setReusingBrowserSessions to allow turning on browser session caching from server instances which are not created w/ a command line  r3323
Patch from TIKA-1412 from Andrzej Bialecki - Handle ODF setup case of TikaInputStream from stream with no open container
Clean up warnings
Remove unnecessary tests
Fixing a test, new mockito version is more accurate with null values.
If a mimetype is handeld by a composite parser, report the underlying parser against the type (TIKA-1270)
DanielWagnerHall: Removing unused import  r13215
EranMes: Removing InterruptedException from a test  r9975
removed filter for classes from the JPA providers package for EclipseLink (SPR-6040)
accounted for feedback. reorganized class
Avoid extra Block creation in map to json cast
Revert r1694715. Something isn't quite right. Revertiung until I figure out what I broke.
Use Comparator.comparing in EliminateCrossJoins
Add RowPagesBuilder.getTypesWithoutHash()
Compensate for Eclipse vs Sun compiler discrepancy  Eclipse allows autoboxing on type inference; Sun javac does not. This means that variables assigned from calls to AnnotationAttributes#getNumber should consistently use object wrappers as opposed to number primitives. There was only one such instance anyway, and has now been updated accordingly.
Set LowResourcesMaxIdleTime in Grid to avoid timeout of 'forever'. Fixes issue 6770.
Add missing text to CachingResourceTransformer Javadoc
Rename test to make way for a genuine unit test
WW-3044 Replace code by similar code in commons lang
java: hashCode must supplement equals
Use Comparator.comparing in EliminateCrossJoins
Revert r1694715. Something isn't quite right. Revertiung until I figure out what I broke.
additional javadoc enhancements for lift & compose
Size BlockBuilder appropriately in array_remove  Previously we allocated one row worth of space per byte of retained input
CAS-1377: Added integration tests
restore missing import that broke the build  r2023
Allows empty string as a action name
Make SimpleTypedSet.FOUR_MEGABYTES private
Extract decoder use flag to a field (will use it later)
Update memory allocation when finishing in HashAggregationOperator
- fix for TIKA-476 Add page count to metadata
Quick hack to avoid NPE when running with an APR/native SSL connector and listing enabled ciphers.
Fixing possible ClassCastException if version is an integer number
Reduce call site of ExpressionAnalyzer.analyzeExpressions
Refined tests for FactoryBean return type resolution on @Bean methods  Issue: SPR-11842
DouniaBerrada: Adding exception for cases where the JS did not finish executing.  r15562
Add missing synchronization for HttpRemoteTask.addSplits
Add RowPagesBuilder.getTypesWithoutHash()
Remove unused method from OrcRecordReader
fixes issue for locating newly installed chrome versions  Signed-off-by: Luke Inman-Semerau <luke.semerau@gmail.com>
SimonStewart: Deprecating setSelected and toggle on WebElement  r12457
Implement predicate pushdown for exchange
Add requireNonNull to NamedTypeSignature constructor
Export waiting time counters
setContext to test name during test   r4312
Split plan into fragments only at remote exchanges
Updated Javadoc: date format patterns SPR-17366
WW-2651 FileUploadInterceptor.java javadoc is not formatted correctly for Confluence snippets  Thanks to Matthieu Chase Heimer for the patch
Remove unused import
increase time out to make linux build pass on a slow machine  r3298
Use Map.getOrDefault in getSqlType implementation  Issue: SPR-15238
JSP FormTag calculates proper default form action even when using a rewrite filter on WebSphere (SPR-7067)
Remove STOMP relay integration test  The test was verifying that when a DISCONNECT frame is sent to the broker, there will be no further messages on the clientOutboundChannel.  This is generally true, however in some cases when the broker receives a DISCONNECT it may close its connection fast enough (before we do) in which case we send an ERROR message downstream to ensure the WebSocket side is cleaned up. Either way the downstream should be idempotent with regards to cleaning up sessions.
Remove Page.getBlocks()
AlexeiBarantsev: Cleaning out a test that was made common and moved to AlertsTest  r17869
SimplifyExpressions drop filter if the predicate is just TRUE
Remove static modifier on TaskExecutor runningSplitInfos
Adding support for OSX mojave to grid (#6552)  Add a `MOJAVE` constant to the `Platform` enum.  Fixes: #6467
setContext to test name during test   r4312
Javadocs: adding marble diagram, return value for onBackpressureLatest
Increase randomness in SocketUtils
Add GET method to /v1/memory endpoint
Call the right completion handler  This won't make any real difference here though as the socket will be closed, but after getting the semaphore it should be released, along with the rest of the cleanup.
Missing @Test annotation  Signed-off-by: Simon Stewart <simon.m.stewart@gmail.com>
Size BlockBuilder appropriately in array_remove  Previously we allocated one row worth of space per byte of retained input
Update test for changes in xwork
add missing @Override annotation
No logical change: remove unused import
Revert timeout change (no effect).
SimonStewart: There seems to be an odd problem when emulating 'type' into a rich text area. Falling back to using sendKeys directly  r12156
Return toReturn.  Return toReturn.  It seems clear from the code and the name of the method, getAndClearScreenshot, that this is the intended behavior.
Remove isOpen assertion when sending WebSocket message  Issue: SPR-14138
Log compaction before we commit the transaction
use same method names everywhere
SimonStewart: Clean up imports of the Renderer class  r16856
Adding version number to the capabilities returned by htmlunitdriver. Fixes issue 7110
FilterDispatcher not always calling ActionContextCleanUp.cleanUp(Request) o applied patch submitted by Jasper Rosenberg  Issue Number: WW-1816
RemoteWebDriver should not add its own information to the recreated server exception, it makes harder to read exception messages.
Make DecorrelatedNode#getCorrelatedPredicates public
fixed some tests that will now break because int/long can be treated as boolean.  May need to change again if real numbers get the same treatment.
Free DriverContext memory at failure
Fields are declared at the top of the class. (#35891)  Fields should be declared at the top of the class, before any method declarations, constructors, initializers or inner classes.
Consider enum subclasses as simple value types as well  Issue: SPR-16278
Ignoring one more test in htmlunit
Refined tests for FactoryBean return type resolution on @Bean methods  Issue: SPR-11842
WW-3564: Unable to find a result type for extension
Allow aggregation of an empty TupleStream
Remove duplicate @since tags in EmbeddedDatabaseBuilder
Add head tag model to freemarker available models
Added debugging info to ShellSpout and pulled in latest upstream master.
Fix memory accounting in ParallelHashBuildOperator  Use same logic as for HashBuilderOperator
Correct error in r1666072 "return true" was originally "continue" that would have continued the for loop and was, in fact, unnecessary since it was at the end of the loop.
Add simple join test
Ignoring another exception that can appear on an attempt to start driver service with unacceptable capabilities.
Rename test class to match tested functionality
Additional GenericConversionService Tests
improve ByCssSelector#toString  Change the string to a more meaningful "cssSelector". It is also more consistent with the other By's #toString methods.  Signed-off-by: Luke Inman-Semerau <luke.semerau@gmail.com>
Delete unused import
[java] Adding some debug trace to figure out why W3CRemoteDriverTest.shouldPreferMarionette fails on travis
DouniaBerrada: Reducing polling time for JS execution   r10169
Remove avro usage in DataOutputTest
protect against nonexistent suite file  r3285
TikaCLI: add attachement extraction option
Avoid extra Block creation in map to json cast
AlexeiBarantsev: Adding @throws clause to switchTo().alert()  r13980
Update for Gump now these are known Ciphers
java: Decreasing visibility of a method that is used in tests only
Javadocs: adding marble diagram, return value for onBackpressureLatest
Add missing access check.
Add RowPagesBuilder.getTypesWithoutHash()
Blocking send of object needs to use blocking sends (rather than non-blcoking)
OperatorDoOnRequest.ParentSubscriber should be static class
A better way to get default value
Construct proper literal for DATE in LiteralInterpreter.toExpression
AbstractApplicationContext logs initialization exception before trying to cancel refresh attempt  Issue: SPR-12010
Simplify generated code for boxing void
Uses new way to access TileContainer
2.x: Add marbles for Observable (12/06) (#5755)
Add additional test for TypedSet  This test makes the API usage more clear.
grid: remove rewrite of Presto-Opera capability opera.binary
WW-4168 Added if statement in method isChecked to verify that the String Array of checkBox name values is not null.
Add union support to optimizer tests PlanBuilder
Add Assignments.identity(Symbol...) method
Further refinement on PR-201
Javadoc This complete the org.apache.coyote package which is now warning free
Add test to reproduce SPR-15271
Deleting empty methods deprecated in 2.xxx (long ago)
Ignoring another test, Firefox regression, see https://bugzilla.mozilla.org/show_bug.cgi?id=1410799
Fix table creation tests for Cassandra and Kafka
Unignoring a test that passes in all browsers. Fixes issue 2709
Moved unsubscribe out the gate
If a remote end does not explicitly state JavaScript support we suppose it's a "normal" browser that supports JavaScript
Polish DatabaseStartupValidator.afterPropertiesSet()
TIKA-275: Parse context  Use an explicit parsing context in the Tika facade.
NestedIOException can use IOException constructor with cause argument on JDK 6+
renamed UriUtilsTest to UriUtilsTests
Deprecate the Old Create Method
Don't construct a new FirefoxBinary() if one is already provided.  The FirefoxBinary() constructor can throw, so avoid calling it in this case, where the result is going to be discarded anyway.
WW-3067 Add a configuration constant to turn on/off the logging of missing properties by OGNL
Make JettyAppServer attempt to lookup a non-loopback address  This makes the proxy tests pass in Firefox, which likes to always bypass a proxy for local addreesses.
TIKA-844 Add an internal TagBag property type constructor, patch from Ray Gauss
STORM-3129: Fixed startTime assignment to using Storm Time util.
Fixed the tests in storm-starter that do not use the actual TupleImpl but mock everything themselves
STORM-2245: integration-test constant compilation failure
SPR-8725 Change modifier in WebMvcConfigurationSupport methods from package private to public.  Use of package private @Bean methods can cause issues if the class is extended and the sub-class is in a different package. This is  covered in detail in SPR-8756.
Polished. This closes #1745
Remove STOMP relay integration test  The test was verifying that when a DISCONNECT frame is sent to the broker, there will be no further messages on the clientOutboundChannel.  This is generally true, however in some cases when the broker receives a DISCONNECT it may close its connection fast enough (before we do) in which case we send an ERROR message downstream to ensure the WebSocket side is cleaned up. Either way the downstream should be idempotent with regards to cleaning up sessions.
Polish "Refactor duplicated code"  Closes gh-1445
WW-4168 Added if statement in method isChecked to verify that the String Array of checkBox name values is not null.
remove dead code left over from removal of commitlog_periodic_queue_size setting see cassandra-8697
Improved exception message in WritableTypeInfo.
deactivate running of javadoc example which is just a partial example
Restored static imports in Observable.
Add a missing call to parent constructors.  Follow-up to #44591.
Run reactive integration tests only as part of performance group
Polished. This closes #1745
Compilation failure after the merge
remove dead code left over from removal of commitlog_periodic_queue_size setting see cassandra-8697
Another silly build issue.
Add a .toString() method to RoutingNode  Previously this would log:  ``` [2015-02-24 11:13:45,105][TRACE][cluster.routing.allocation.allocator] [Poltergeist] Try moving shard [[test][2], node[HFn4dJ7fQAyfSAB8BquaSQ], [R], s[STARTED]] from [org.elasticsearch.cluster.routing.RoutingNode@6df2c498] ```  Now it will log:  ``` [2015-02-25 11:32:45,182][TRACE][cluster.routing.allocation.allocator] [Solarr] Try moving shard [[my_index][2], node[HDhbU4D9Rx27MSr_72bmWQ], [P], s[STARTED]] from [routingNode ([Solarr][HDhbU4D9Rx27MSr_72bmWQ][Xanadu.domain][192.168.0.4], [5 assigned shards])] ```
https://issues.apache.org/jira/browse/AMQ-3894 - remove requirement for destination property enforced by spring - for a default entry there is no need for a destination
Attempt to repro ReflectionUtils performance issue  Issue: SPR-10197
Index Update Settings API does not update settings in real time, closes #1807.
OperatorScan should check for MAX_VALUE on request
CAMEL-10735: Mark stuff for deprecate
Do not use deprecated maven api
Do not run VCS commands when it's not enabled in configuration  Summary: VCS commands are executed even when gathering them is not enabled in the configuration. For example, every command in Buck repository triggers hg commands.  Reviewed By: philipjameson  fbshipit-source-id: 7c0a0914ae
Replaced java6 treemap with OMVRBTreeMemory
minor reactor server impl to fulfill core introspection
Implement MessagingException.toString()  Issue: SPR-15091 Closes gh-1284
Use public AssumptionViolatedException in Assume  JUnit 4.12 created a 'public' version of the previously 'internal' AssumptionViolatedException.  This commit upgrades Spring's Assume class to use this new public version.
1. Do not hardcode the path to output directory. It can be controlled via build.properties. 2. Cleanup after the test.
[TEST] Plugin Manager  Undo removal of change.
Percolation shouldn't fail when the _size field is enabled
The interface SpringApplicationConfiguration is deprecated  From @SpringApplicationConfiguration(classes=MyConfig.class) to @SpringBootTest(classes=MyConfig.class) Note: https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-1.4.0-M2-Release-Notes
Allow JAXB to be registered next to plain Jackson  Issue: SPR-14336
Since the address is exposed to sub-components, expose the port as well.
Add accessor methods to HttpPutFormContentFilter  Issue: SPR-14503
Use Map.getOrDefault in getSqlType implementation  Issue: SPR-15238
Handle exceptions properly in SpringJUnit4ClassRunner  JUnit 4.9 introduced a regression in BlockJUnit4ClassRunner.runChild() such that exceptions thrown from methodBlock() cause the current test execution to abort immediately. As a result, the failing test method is unrooted, and subsequent test methods are never invoked. Furthermore, RunListeners registered with JUnit are not properly notified.  In conjunction with SPR-11908, SpringJUnit4ClassRunner was updated to use the aforementioned changes to BlockJUnit4ClassRunner.runChild(). Consequently, SpringJUnit4ClassRunner now suffers from the same regression.  This commit addresses this issue by ensuring that any exceptions thrown during the invocation of methodBlock() are properly wrapped in a JUnit Fail Statement.  Issue: SPR-12613
catch ConversionFailedException and fallback to default container conversion logic rather than propogate exception
Uses factory's type to detect Initilizable interfaces
Remove unused imports
Supporting more wildcard paths in groovy-starter.conf
The interface SpringApplicationConfiguration is deprecated  From @SpringApplicationConfiguration(classes=MyConfig.class) to @SpringBootTest(classes=MyConfig.class) Note: https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-1.4.0-M2-Release-Notes
Provide more accurate error message
Extended testPrototypeCreationWithOverriddenAutowiredPropertiesIsFastEnough's deadline (since that test repeatedly failed on the CI server)
Polished. This closes #1745
Polished. This closes #1745
KAFKA-4725; Stop leaking messages in produce request body when requests are delayed  This change is in response to [KAFKA-4725](https://issues.apache.org/jira/browse/KAFKA-4725).  When a produce request is received, if the user/client is exceeding their produce quota, the response will be delayed until the quota is refilled appropriately.  Unfortunately, the request body is still referenced in the callback which in turn leaks the messages contained within the request.  This change allows the `KafkaApis` method to take ownership of the request body from the `RequestChannel.Request` object.  I am not sure whether this breaks other invariants which are assumed within other parts of Kafka.  Author: Tim Carey-Smith <tim@spork.in>  Reviewers: Ismael Juma <ismael@juma.me.uk>, Jun Rao <junrao@gmail.com>  Closes #2496 from halorgium/fix-throttled-response-leak
(ninja) use javax.annotation instead of avro
fixed a bug where the context wasn't getting updated (for changing variables)
Remove unnecessary Runnable wrapping in NamedThreadFactory as is done by Netty.  Patch by Alex Petrov; reviewed by Dinesh Joshi for CASSANDRA-15008
Add a debounced 5 second delay to after-command GC  Summary: GC is run after a command to return memory to the system after long running commands.  If commands are invoked in quick succession, such as for queries invoked by scripts, the full GC may affect the latency of the next command being run.  This change schedules the after-command GC to happen after 5 seconds after the last command is run. If another command is run within that interval, the GC is further pushed back.  Test Plan: Run commands in quick succession, see that gc does not trigger via VM telemetry.  Reviewed By: illicitonion  fbshipit-source-id: 43f215c
Add setEntityResolver(URL). This uses the URL as the bas to resolve relative URLs
[GEO] Updating javadoc for XShapeCollection  XShapeCollection has an incorrect description left over from when the relate method was overridden. This one line commit corrects the description.
Fixed problem with parallel execution
Another bit of logging.  Did the server ever get started at all?  r2164
Revert "disabled new http test cases, where failing probably on server overload"  This reverts commit 8dfbacb9a258ef85c731af372b87369d412ff558.
Changed use of AssertThrows to @Test(expected = ...)
Enabled an ignored test, which didn't have to be ignored (the comment wasn't true anymore)
Tests: Reduce number of random runs for shape builder tests
cleaned up `HttpExporterUtils`  Original commit: elastic/x-pack-elasticsearch@2db95799ea1cbe071b980f5a1c8fcd0386cd0c4d
Observable javadoc cleanup (#5992)  The sample code in the Observable javadoc erroneously uses onNext(Integer t) for a DisposableObserver<String> This has been corrected to be onNext(String t)
CAMEL-84: improved error message for exception
Index Update Settings API does not update settings in real time, closes #1807.
Tidy up getting headers in HttpMessage  This makes `getHeaders(String)` properly case-insensitive.
Rounding out the functional tests for the security rules stuff.
Deprecate FastStack in favor of ArrayDeque, issue #86
Use NoSuchBufferException instead of IllegalArgumentException
Defensive error reporting when StandardAnnotationMetadata introspects declared methods  Issue: SPR-13791
Use JUnit ExpectedException rule in AntPathMatcherTests
@Override not allowed on interface methods (how did this work before?)
Fix for TIKA-2613 contributed by ewanmellor.  Change -psm on the Tesseract command line to --psm, with two dashes. This matches a change in Tesseract 4.0 to remove the one-dash version. It has been deprecated since Nov 2016.  The Tesseract cset is ee201e1f4.  Also, move the config file (i.e. getOutputType in Tika's terms) so that it is the last parameter on the command line.  Tesseract logs an error message (though otherwise doesn't fail) if the config file is not the last thing on the command line.
TIKA-97: Tika GUI     - Dropped another Java 6 dependency
Accessing special Data class, not the test class
- fix for TIKA-476 Add page count to metadata
Fixed issue 336 thanks to the patch by the reporter
Added getters for fs.path, fs.mount and fs.dev in node stats api  Closes #4004
Check and put entry into `handleCache` atomically
Remove asserts as the same asserts are made in instance() anyway. This reduces the nr of ThreadLocal.get() calls.
Rename tests  Summary: Renamed few tests to reflect object names.  Reviewed By: rajyengi  fbshipit-source-id: eb364df083
Un-ignore RequestMapping test for handling "" paths  Issue: SPR-15653
Test: Fix SearchTransformTests suite error  Original commit: elastic/x-pack-elasticsearch@03568dce090db993e9dae8ac0ced3fd2b19b7864
Internal: MulticastChannel should wait on receiver thread to stop during shutdown  This was signaled by our tests which shutdown class and check for thread leakage.  Closes #7835
Refined tests for FactoryBean return type resolution on @Bean methods  Issue: SPR-11842
[TEST] skip benchmark tests for now
Change IndexPrimaryShardNotAllocatedException from 409 (RestStatus.CONFLICT) to 500 (RestStatus.INTERNAL_SERVER_ERROR)  Closes #7632, Closes #7987
Test: Fix SearchTransformTests suite error  Original commit: elastic/x-pack-elasticsearch@03568dce090db993e9dae8ac0ced3fd2b19b7864
Fix a mistake (I think, Philippe confirm this?)
Add @Override markers
TikaCLI: add attachement extraction option
It's more correct to remove the connector handler in ClientBootstrap
Add some test cases for null handling
Contribution by Luca Molino about to ignore tabs while parsing JSON
Updated JdkVersion regarding Java 9 support   - JdkVersion#JAVA_19 is now properly set to 6 instead of 5.  - Javadoc for getMajorJavaVersion() now references currently supported    Java versions.
Remove the @NonNull annotation from Function (#5449)  As per per the discussion in #5447
minor: added missing code for EXTENDS_CLAUSE token
Re-interrupt thread when handling InterruptedException
Remove unused code from superconsole.  Reviewed By: bobyangyf  fbshipit-source-id: 5047882fc7
2.x: Add exception message in SingleFromCallable (#4508)
remove dead code left over from removal of commitlog_periodic_queue_size setting see cassandra-8697
ImportAwareBeanPostProcessor registered with ROLE_INFRASTRUCTURE
remove dead code left over from removal of commitlog_periodic_queue_size setting see cassandra-8697
remove dead code left over from removal of commitlog_periodic_queue_size setting see cassandra-8697
DanielWagnerHall: Removing random TODO and destaticing a method  r7466
Revert "disabled new http test cases, where failing probably on server overload"  This reverts commit 8dfbacb9a258ef85c731af372b87369d412ff558.
Version missing a space, closes #1517.
RecoveryMonitor#lastSeenAccessTime should be volatile (#36781)  This local field is accessed on multiple threads and is nonvolatile so theoretically could yield stale values. Not sure it does in practice.
Making sure the index can start in existing (clean) DB directory
Polish contribution  Closes gh-1292 Issue: SPR-15188
Remove explicit generic type arguments
@since version currently only 2.0
Unwrap invocation target exception from QuidemTest#test
better detailed message
[TEST] Check if worker if null to prevent NPE on double stopping
MAHOUT-167 MAHOUT-427: Fixed NPE in ClusterDumper due to missing call to init() in ClusterDumper.run(String[]);
Adds test case for issue #4301
changed test method names.
Change IndexPrimaryShardNotAllocatedException from 409 (RestStatus.CONFLICT) to 500 (RestStatus.INTERNAL_SERVER_ERROR)  Closes #7632, Closes #7987
setContext to test name during test   r4312
Show actual script in Tree View Listener etc
remove infinite loop
HOTFIX: Fix optional import in ConsumerCoordinator (#6953)  This was caused by back-to-back merging of #6854 (which removed the Optional import) and #6936 (which needed the import).  Reviewers: Jason Gustafson <jason@confluent.io>
Analyzers are now specified by name, and service-loaded.  This fixes a security issue where we could otherwise run the class initializer and object constructors of arbitrary classes.
CAMEL-13141: Make using advice-with easier by using lambda route builder directly on the AdviceWithRouteBuilder.
removed unused imports
Add missing newline at end of SetsTests.java  This commit adds a missing newline to the end of SetsTests.java after the closing curly brace.
Expose number of "live" nodes
OperatorScan should check for MAX_VALUE on request
Uses factory's type to detect Initilizable interfaces
Javadoc in MockMvcClientHttpRequestFactoryTests  The Javadoc in MockMvcClientHttpRequestFactoryTests had been copied and pasted from WebAppResourceTests. This commit updates the documentation in MockMvcClientHttpRequestFactoryTests to reflect what the tests do.
[BEAM-1108] Remove outdated language about experimental autoscaling
remove silly throws decl
Deleted unused resourceLoader field in Jaxb2Marshaller
No need for this empty tearDown method, so remove it.
Cache attribute methods in AnnotationUtils  Issue: SPR-11512
Retain the order the URLs were added in when calculating the result for getURLs()
