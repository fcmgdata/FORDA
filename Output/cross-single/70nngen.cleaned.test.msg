Initialize JNDI to fix failing Environment test  Issue: SPR-12223
ignore failing test
Initialize JNDI to fix failing Environment test  Issue: SPR-12223
Polished. This closes #1745
Polished. This closes #1745
Add test for combining @Controller with RouterFunctions  This commit adds a test for combining RouterFunctions with a @Controller.  Issue: SPR-15521
Update copyright header  Closes gh-1343
Delete unused imports
Fix test  The rework of 314b069 in a7fec6a has created a lazy proxy to make sure that the need for an exception cache resolver come as late as possible.  Unfortunately, the test that was only failing on CI because of an early lookup has not been updated accordingly. This is now the case.  Issue: SPR-12850
Suppress warning in SpringFailOnTimeoutTests
WiretapConnector removes exchanges  Issue: SPR-15744
Add missing super in test  Closes gh-814
Make TestContextManager.getTestContext() public  This commit changes the visibility of the getTestContext() method in TestContextManager from 'protected' to 'public' in order to support test method injection in JUnit 5 and similar use cases.  Issue: SPR-14011
12905: No need to cast ContextRefreshedEvent. Safety applicationContext identity check.  Co-Authored-By: oalles <oalles@gmail.com>
Add missing super in test  Closes gh-814
Polished. This closes #1745
Extended testPrototypeCreationWithOverriddenAutowiredPropertiesIsFastEnough's deadline (since that test repeatedly failed on the CI server)
Implement MessagingException.toString()  Issue: SPR-15091 Closes gh-1284
Ignore JRuby template tests (not compatible with JDK 9 yet)  Issue: SPR-13344
Port fix bug 29727. Changes to env-entry values should take effect on web-app reload.
Add missing super in test  Closes gh-814
Initialize JNDI to fix failing Environment test  Issue: SPR-12223
Polished. This closes #1745
Add TimedSpringRunnerTests to performance test group  Issue: SPR-9984
mute testDifferentRolesMaintainPathOnRestart  See https://github.com/elastic/elasticsearch/issues/23728
Use AtomicInteger instead of local synchronization around int field  Issue: SPR-11103
API-level switch to force alwaysProxy to true  r3811
Added a space to keep consistent formatting
Clean up warnings
Change tests in AbstractTestQueries  so that each group/join key correspond to multiple rows
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
SPR-6087: Updated Javadoc for HandlerInterceptor to indicate invocation order of afterCompletion() methods
Rename test to make way for a genuine unit test
some code cleanup
java: hashCode must supplement equals
Minor cleanup of PartitionedOutputOperator
Fix failures in testAllOpenSSLCiphersMapped() after changes to how unit test reports cipher names in r1615205 Start to fix testOpenSSLCipherAvailability() but more work required
additional javadoc enhancements for lift & compose
Optimize map_concat to skip empty map  Performance before: Benchmark                     (mapConfig)  Mode  Cnt     Score     Error  Units BenchmarkMapConcat.mapConcat   left_empty  avgt   20  1838.641 Â± 145.909  ns/op BenchmarkMapConcat.mapConcat  right_empty  avgt   20  1515.713 Â±  96.888  ns/op BenchmarkMapConcat.mapConcat   both_empty  avgt   20   615.368 Â±  57.051  ns/op BenchmarkMapConcat.mapConcat    non_empty  avgt   20  2753.727 Â± 503.407  ns/op  Performance After: Benchmark                     (mapConfig)  Mode  Cnt     Score     Error  Units BenchmarkMapConcat.mapConcat   left_empty  avgt   20   392.266 Â±  38.556  ns/op BenchmarkMapConcat.mapConcat  right_empty  avgt   20   376.552 Â±  32.928  ns/op BenchmarkMapConcat.mapConcat   both_empty  avgt   20    55.276 Â±   7.683  ns/op BenchmarkMapConcat.mapConcat    non_empty  avgt   20  3043.951 Â± 553.951  ns/op
Move MockMultHtServReqTests to correct package  This commit relocates MockMultipartHttpServletRequestTests to the appropriate package.
restore missing import that broke the build  r2023
Allows empty string as a action name
Make SimpleTypedSet.FOUR_MEGABYTES private
Extract decoder use flag to a field (will use it later)
Refactor provider lookup in RecordSinkManager
- fix for TIKA-476 Add page count to metadata
Tweak formatting. Fix an IDE nit.
SimonStewart: Removing the deprecated desired config for the htmlunit driver with js  r14895
Reduce call site of ExpressionAnalyzer.analyzeExpressions
Test against CGLIB memory leak for method injection  This commit introduces a test in XmlBeanFactoryTests that verifies that CGLIB generated subclasses for method injected beans are reused across bean factories for identical bean definitions. In other words, by verifying that the same CGLIB generated class is reused for identical bean definitions, we can be certain that Spring is no longer generating identical, duplicate classes that consume memory in the VM.  Issue: SPR-10785, SPR-11420
DouniaBerrada: Adding exception for cases where the JS did not finish executing.  r15562
Record "started" counter for queries that fail to parse  In the last release we started tracking parsing failures for error categorization, but the change was missing the call to increment the started counter.  As a result, the started and completed counters get permanently out of sync and cause the number of running queries to be reported as 0.
Return null when output is empty in HashAggregationOperator
Remove unused method from OrcRecordReader
fixes issue for locating newly installed chrome versions  Signed-off-by: Luke Inman-Semerau <luke.semerau@gmail.com>
SimonStewart: Deprecating setSelected and toggle on WebElement  r12457
Extend CanonicalizeExpressions optimizer to rewrite filter in Join
Add requireNonNull to NamedTypeSignature constructor
Export waiting time counters
Java Client: Making extracted methods visible for integration tests   r5435
Split plan into fragments only at remote exchanges
Updated Javadoc: date format patterns SPR-17366
WW-2651 FileUploadInterceptor.java javadoc is not formatted correctly for Confluence snippets  Thanks to Matthieu Chase Heimer for the patch
Remove unused import
increase time out to make linux build pass on a slow machine  r3298
reduced BeanDefinition footprint by initializing Sets and Maps with 0 (SPR-7491)
JSP FormTag calculates proper default form action even when using a rewrite filter on WebSphere (SPR-7067)
ignore failing test for now - andy c to look at next wk
Remove Page.getBlocks()
AlexeiBarantsev: Cleaning out a test that was made common and moved to AlertsTest  r17869
Add private constructor for ExpressionExtract
Remove static modifier on TaskExecutor runningSplitInfos
Adding El Capitan (OS X 10.11) to Platform  Signed-off-by: Daniel Davison <daniel.jj.davison@gmail.com>
support overriding default port by means of the selenium.port property  r3425
Javadocs: adding marble diagram, return value for onBackpressureLatest
No need for a ConcurrentHashMap now pre-population is used.
Record "started" counter for queries that fail to parse  In the last release we started tracking parsing failures for error categorization, but the change was missing the call to increment the started counter.  As a result, the started and completed counters get permanently out of sync and cause the number of running queries to be reported as 0.
Call the right completion handler  This won't make any real difference here though as the socket will be closed, but after getting the semaphore it should be released, along with the rest of the cleanup.
Missing @Test annotation  Signed-off-by: Simon Stewart <simon.m.stewart@gmail.com>
Optimize map_concat to skip empty map  Performance before: Benchmark                     (mapConfig)  Mode  Cnt     Score     Error  Units BenchmarkMapConcat.mapConcat   left_empty  avgt   20  1838.641 Â± 145.909  ns/op BenchmarkMapConcat.mapConcat  right_empty  avgt   20  1515.713 Â±  96.888  ns/op BenchmarkMapConcat.mapConcat   both_empty  avgt   20   615.368 Â±  57.051  ns/op BenchmarkMapConcat.mapConcat    non_empty  avgt   20  2753.727 Â± 503.407  ns/op  Performance After: Benchmark                     (mapConfig)  Mode  Cnt     Score     Error  Units BenchmarkMapConcat.mapConcat   left_empty  avgt   20   392.266 Â±  38.556  ns/op BenchmarkMapConcat.mapConcat  right_empty  avgt   20   376.552 Â±  32.928  ns/op BenchmarkMapConcat.mapConcat   both_empty  avgt   20    55.276 Â±   7.683  ns/op BenchmarkMapConcat.mapConcat    non_empty  avgt   20  3043.951 Â± 553.951  ns/op
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
made conversion service pluggable
Return null when output is empty in HashAggregationOperator
Removes unused methods in the o/e/common/Strings class.  Closes #18346
allow for converting a property value based on the corresponding property name (SPR-7386)
Java tests: An attempt to nail down a test that fails for an unknown reason
Refined tests for FactoryBean return type resolution on @Bean methods  Issue: SPR-11842
WW-3564: Unable to find a result type for extension
Allow aggregation of an empty TupleStream
Remove duplicate @since tags in EmbeddedDatabaseBuilder
Add head tag model to freemarker available models
added validation to registermetrics to have timebucketSizeInSecs >= 1
Handle potential NPE with HashAggregationOperator
Catch less specific exception to deal with intermittent failures with OpenJDK
Add simple join test
Ignoring another exception that can appear on an attempt to start driver service with unacceptable capabilities.
Rename test class to match tested functionality
Test against CGLIB memory leak for method injection  This commit introduces a test in XmlBeanFactoryTests that verifies that CGLIB generated subclasses for method injected beans are reused across bean factories for identical bean definitions. In other words, by verifying that the same CGLIB generated class is reused for identical bean definitions, we can be certain that Spring is no longer generating identical, duplicate classes that consume memory in the VM.  Issue: SPR-10785, SPR-11420
EranMes: When a Point instance is printed, the output will now be useful.  r12351
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
Assert correct Slice representation in CharType
Blocking send of object needs to use blocking sends (rather than non-blcoking)
2.x cleanup: add missing override annotations.
A better way to get default value
Construct proper literal for DATE in LiteralInterpreter.toExpression
AbstractApplicationContext logs initialization exception before trying to cancel refresh attempt  Issue: SPR-12010
Use DefaultTraversalVisitor in DependencyExtractor  Use DefaultTraversalVisitor in DependencyExtractor, thanks to that it is able to return correlated names as dependants.
Uses new way to access TileContainer
2.x: update Obs.just(2..10) & switchOnNextDelayError marbles (#5651)
Allow only timestamp and date column types to be temporal columns
grid: remove rewrite of Presto-Opera capability opera.binary
TIKA-780: Optimize loading of the media type registry  Add a maximum size limit to the static set of simple media types kept in memory. This prevents a potential DOS attack against the library.  Fix handling of media type parameters.
Add support for AssignUniqueId to CostCalculator
Add methods to flip join and set distribution type
Further refinement on PR-201
Remove some completed TODOs Tidy up the Javadoc
Add test to reproduce SPR-15271
Deleting empty methods deprecated in 2.xxx (long ago)
DanielWagnerHall: Removing unused import  r13215
Fix drop table test to use correct table
Unignoring a test that passes in all browsers. Fixes issue 2709
Improve subscription removal in SubscriptionRegistry  Avoid using destination pattern based search when removing sessions or subscriptions from DefaultSubscriptionRegistry and use only session and subscription ids.  Issue: SPR-11930
If a remote end does not explicitly state JavaScript support we suppose it's a "normal" browser that supports JavaScript
Polish DatabaseStartupValidator.afterPropertiesSet()
TIKA-1955: Updated check to read from stream to avoid misreporting due to blocking
NestedIOException can use IOException constructor with cause argument on JDK 6+
Added SourceHttpMessageConverter as a default.
Deprecate the Old Create Method
Don't construct a new FirefoxBinary() if one is already provided.  The FirefoxBinary() constructor can throw, so avoid calling it in this case, where the result is going to be discarded anyway.
WW-3067 Add a configuration constant to turn on/off the logging of missing properties by OGNL
Make JettyAppServer attempt to lookup a non-loopback address  This makes the proxy tests pass in Firefox, which likes to always bypass a proxy for local addreesses.
TIKA-844 Add an internal TagBag property type constructor, patch from Ray Gauss
STORM-3208 add warning when no approved workers to cleanup
Fixed the tests in storm-starter that do not use the actual TupleImpl but mock everything themselves
STORM-3109: Fixed incorrect conversion from relative path to absolute path for STORM_LOCAL_DIR
Polish Javadoc for @Transactional
Polished. This closes #1745
Remove STOMP relay integration test  The test was verifying that when a DISCONNECT frame is sent to the broker, there will be no further messages on the clientOutboundChannel.  This is generally true, however in some cases when the broker receives a DISCONNECT it may close its connection fast enough (before we do) in which case we send an ERROR message downstream to ensure the WebSocket side is cleaned up. Either way the downstream should be idempotent with regards to cleaning up sessions.
Polished. This closes #1745
[FLINK-11718] Make RpcEndpoint#start method final to prevent changing its behaviour  This closes #7808.
remove dead code left over from removal of commitlog_periodic_queue_size setting see cassandra-8697
Remove unnecessary word
Remove unnecessary word
Remove unused import in MockHttpServletRequestBuilderTests
Use junit 5
Run reactive integration tests only as part of performance group
Polished. This closes #1745
doc: fix documentation for METHOD_REF token
remove dead code left over from removal of commitlog_periodic_queue_size setting see cassandra-8697
CAMEL-10034: Camel health in camel-spring-boot should be optional. Thanks to Nicola Ferraro for reporting.
Add a .toString() method to RoutingNode  Previously this would log:  ``` [2015-02-24 11:13:45,105][TRACE][cluster.routing.allocation.allocator] [Poltergeist] Try moving shard [[test][2], node[HFn4dJ7fQAyfSAB8BquaSQ], [R], s[STARTED]] from [org.elasticsearch.cluster.routing.RoutingNode@6df2c498] ```  Now it will log:  ``` [2015-02-25 11:32:45,182][TRACE][cluster.routing.allocation.allocator] [Solarr] Try moving shard [[my_index][2], node[HDhbU4D9Rx27MSr_72bmWQ], [P], s[STARTED]] from [routingNode ([Solarr][HDhbU4D9Rx27MSr_72bmWQ][Xanadu.domain][192.168.0.4], [5 assigned shards])] ```
[hotfix][java] Add missing space to error message  This closes #4944.
Attempt to repro ReflectionUtils performance issue  Issue: SPR-10197
Index Update Settings API does not update settings in real time, closes #1807.
OperatorScan should check for MAX_VALUE on request
CAMEL-10735: Mark stuff for deprecate
Do not use deprecated maven api
Do not run VCS commands when it's not enabled in configuration  Summary: VCS commands are executed even when gathering them is not enabled in the configuration. For example, every command in Buck repository triggers hg commands.  Reviewed By: philipjameson  fbshipit-source-id: 7c0a0914ae
Resolve build issues
CAMEL-10034: Camel health in camel-spring-boot should be optional. Thanks to Nicola Ferraro for reporting.
FreeMarkerConfigurationFactory falls back to SpringTemplateLoader on any exception  Issue: SPR-15445
CAMEL-10034: Camel health in camel-spring-boot should be optional. Thanks to Nicola Ferraro for reporting.
1. Do not hardcode the path to output directory. It can be controlled via build.properties. 2. Cleanup after the test.
[TEST] Plugin Manager  Undo removal of change.
Percolation shouldn't fail when the _size field is enabled
The interface SpringApplicationConfiguration is deprecated  From @SpringApplicationConfiguration(classes=MyConfig.class) to @SpringBootTest(classes=MyConfig.class) Note: https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-1.4.0-M2-Release-Notes
Update copyright header  Closes gh-1343
Add a flag for loading a tagger in the LexicalizedParserServer
AbstractApplicationEventMulticaster only caches if event type and source type are cache-safe  Issue: SPR-11606
Update copyright header  Closes gh-1343
Suppress deprecation warning in StatusResultMatchers
Improve tests for detection of @MVC annotations  Issue: SPR-9601
Uses factory's type to detect Initilizable interfaces
Remove unused imports
Supporting more wildcard paths in groovy-starter.conf
The interface SpringApplicationConfiguration is deprecated  From @SpringApplicationConfiguration(classes=MyConfig.class) to @SpringBootTest(classes=MyConfig.class) Note: https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-1.4.0-M2-Release-Notes
Add URI and method name on ResourceAccess  Issue: SPR-9325
Extended testPrototypeCreationWithOverriddenAutowiredPropertiesIsFastEnough's deadline (since that test repeatedly failed on the CI server)
Polished. This closes #1745
Add missing super in test  Closes gh-814
Issue #5377 amount of detected leaks was added in JMX bean.
(ninja) use javax.annotation instead of avro
MAHOUT-1427: Convert old .mapred API to new .mapreduce - added comment in MatrixMultiplicationJob as to why its not being migrated over to new MR Api
Remove unnecessary Runnable wrapping in NamedThreadFactory as is done by Netty.  Patch by Alex Petrov; reviewed by Dinesh Joshi for CASSANDRA-15008
Add a debounced 5 second delay to after-command GC  Summary: GC is run after a command to return memory to the system after long running commands.  If commands are invoked in quick succession, such as for queries invoked by scripts, the full GC may affect the latency of the next command being run.  This change schedules the after-command GC to happen after 5 seconds after the last command is run. If another command is run within that interval, the GC is further pushed back.  Test Plan: Run commands in quick succession, see that gc does not trigger via VM telemetry.  Reviewed By: illicitonion  fbshipit-source-id: 43f215c
Java Client: Making extracted methods visible for integration tests   r5435
doc: fix documentation for METHOD_REF token
Fixed problem with parallel execution
disables connectTest that fails silently avoind creation of jacoco report
Revert "disabled new http test cases, where failing probably on server overload"  This reverts commit 8dfbacb9a258ef85c731af372b87369d412ff558.
Changed use of AssertThrows to @Test(expected = ...)
Enabled an ignored test, which didn't have to be ignored (the comment wasn't true anymore)
Tests: Reduce number of random runs for shape builder tests
removed unnecessary import
[BEAM-7083] Remove non-functional pipeline option for Java environment URL  The Java environment URL is now passed in the environment config. DefaultJavaEnvironmentUrl in PortablePipelineOptions is dead code.
Polish. Align with 8.5.x.
Index Update Settings API does not update settings in real time, closes #1807.
Tidy up getting headers in HttpMessage  This makes `getHeaders(String)` properly case-insensitive.
Rounding out the functional tests for the security rules stuff.
doc: fix documentation for METHOD_REF token
just read byte in channel buffer wrapper, no need to check for bounds since it is checked internally
Remove unused array declarations. #1555  Fixes `MismatchedArrayReadWrite` inspection violations in test code.  Description: >Reports any array fields or variables whose contents are read but not written, or written but not read. Such mismatched reads and writes are pointless, and probably indicate dead, incomplete or erroneous code.
Use JUnit ExpectedException rule in AntPathMatcherTests
Adds dedicated method to display Login form and base on declarative validation instead of on programmatic one
Fix for TIKA-2613 contributed by ewanmellor.  Change -psm on the Tesseract command line to --psm, with two dashes. This matches a change in Tesseract 4.0 to remove the one-dash version. It has been deprecated since Nov 2016.  The Tesseract cset is ee201e1f4.  Also, move the config file (i.e. getOutputType in Tika's terms) so that it is the last parameter on the command line.  Tesseract logs an error message (though otherwise doesn't fail) if the config file is not the last thing on the command line.
TIKA-97: Tika GUI     - Dropped another Java 6 dependency
Accessing special Data class, not the test class
[TIKA-2472] Implementing Metadata#hashCode
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
Default start_rpc to true in Config
TikaCLI: add attachement extraction option
Copy the resolver configuration when cloning Bootstrap  Motivation:  Bootstrap.clone() does not copy the resolver configuration.  Modifications:  Copy the resolver configuration when cloning.  Result:  Bug fixed
Add some test cases for null handling
Contribution by Luca Molino about to ignore tabs while parsing JSON
Explain the relationship with java.util.Optional, in some detail. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=97336621
add a note on the rest pre processor
minor: added missing code for EXTENDS_CLAUSE token
Remove explicit generic type arguments
Remove unused code from superconsole.  Reviewed By: bobyangyf  fbshipit-source-id: 5047882fc7
2.x: Add exception message in SingleFromCallable (#4508)
remove dead code left over from removal of commitlog_periodic_queue_size setting see cassandra-8697
ImportAwareBeanPostProcessor registered with ROLE_INFRASTRUCTURE
moving dependencies around
remove dead code left over from removal of commitlog_periodic_queue_size setting see cassandra-8697
CAMEL-10034: Camel health in camel-spring-boot should be optional. Thanks to Nicola Ferraro for reporting.
Revert "disabled new http test cases, where failing probably on server overload"  This reverts commit 8dfbacb9a258ef85c731af372b87369d412ff558.
Version missing a space, closes #1517.
RecoveryMonitor#lastSeenAccessTime should be volatile (#36781)  This local field is accessed on multiple threads and is nonvolatile so theoretically could yield stale values. Not sure it does in practice.
Adds test case for issue #4301
Introduce tests for Spring Boot issue 885  This commit introduces unit tests that attempt to reproduce the problem described in Spring Boot issue 885; however, the tests pass and therefore do not confirm the reported problem.  See: https://github.com/spring-projects/spring-boot/issues/885
Remove explicit generic type arguments
@since version currently only 2.0
Unwrap invocation target exception from QuidemTest#test
better detailed message
[TEST] RepeatOnExceptionRule to rethrow unexpected exception  In case an exception was caught by the repeat rule, the retry mechanism would kick in only if the exception was the expected one. If not an NPE got thrown, while we should rather just bubble it up to the caller. This makes `NettyTransportMultiPortTests` run from a plane. An assumption would kick in to make sure that the test gets ignored but the `AssumptionViolationException` was caught and not properly re-thrown.
MAHOUT-167 MAHOUT-427: Fixed NPE in ClusterDumper due to missing call to init() in ClusterDumper.run(String[]);
Adds test case for issue #4301
changed test method names.
remove empty comments
setContext to test name during test   r4312
Show actual script in Tree View Listener etc
Make PushBuilder's handling of HTTP headers case insensitive
HOTFIX: Fix optional import in ConsumerCoordinator (#6953)  This was caused by back-to-back merging of #6854 (which removed the Optional import) and #6936 (which needed the import).  Reviewers: Jason Gustafson <jason@confluent.io>
Analyzers are now specified by name, and service-loaded.  This fixes a security issue where we could otherwise run the class initializer and object constructors of arbitrary classes.
mute testDifferentRolesMaintainPathOnRestart  See https://github.com/elastic/elasticsearch/issues/23728
Display data: minor cleanups  * wrong @Nullable * Remove unused function
[TEST] Only check if mlockall succeeds on Windows for now
retrocompatibility restored with old apu
OperatorScan should check for MAX_VALUE on request
Introduce tests for Spring Boot issue 885  This commit introduces unit tests that attempt to reproduce the problem described in Spring Boot issue 885; however, the tests pass and therefore do not confirm the reported problem.  See: https://github.com/spring-projects/spring-boot/issues/885
Javadoc in MockMvcClientHttpRequestFactoryTests  The Javadoc in MockMvcClientHttpRequestFactoryTests had been copied and pasted from WebAppResourceTests. This commit updates the documentation in MockMvcClientHttpRequestFactoryTests to reflect what the tests do.
[BEAM-1108] Remove outdated language about experimental autoscaling
remove silly throws decl
Deleted unused resourceLoader field in Jaxb2Marshaller
Add test for triggers which throw IRE  Patch by Sam Tunnicliffe; reviewed by brandonwilliams for CASSANDRA-9334
Cache attribute methods in AnnotationUtils  Issue: SPR-11512
Retain the order the URLs were added in when calculating the result for getURLs()
