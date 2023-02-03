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
Polish timed operators and remove useTimer()
Suppress warning in SpringFailOnTimeoutTests
Suppress rawtypes warning for createReferenceArray
Fix missing space in assertion message
Performance improvement  Use entrySet instead of keySet followed by a lookup per key as the former is more efficient.  Issue: SPR-12363
Support @Scheduled as a merged composable annotation  Issue: SPR-13973
Implement MessagingException.toString()  Issue: SPR-15091 Closes gh-1284
Ignore JRuby template tests (not compatible with JDK 9 yet)  Issue: SPR-13344
Port fix bug 29727. Changes to env-entry values should take effect on web-app reload.
Add missing super in test  Closes gh-814
Initialize JNDI to fix failing Environment test  Issue: SPR-12223
Polished. This closes #1745
mute testDifferentRolesMaintainPathOnRestart  See https://github.com/elastic/elasticsearch/issues/23728
Suppress warning in SpringFailOnTimeoutTests
Use AtomicInteger instead of local synchronization around int field  Issue: SPR-11103
API-level switch to force alwaysProxy to true  r3811
The use of Utils was there because the method was originally in the Utils class. Now that it is in TikaConfig, using TikaConfig is preferable.
Improve Javadoc for ContextLoaderUtils  - class-level Javadoc now mentions application context initializers. - avoided and suppressed warnings in method-level Javadoc.  Issue: SPR-10232
Change tests in AbstractTestQueries  so that each group/join key correspond to multiple rows
Fixing a test, new mockito version is more accurate with null values.
TIKA-312: TikaCLI can't print metadata  Patch by Maxim Valyanskiy
JasonLeyba: Removing unnecessary import from r15214 that broke the build.  r15216
SimonStewart: Backing out change to the firefox driver test suite  r6128
removed filter for classes from the JPA providers package for EclipseLink (SPR-6040)
accounted for feedback. reorganized class
Avoid extra Block creation in map to json cast
Revert r1694715. Something isn't quite right. Revertiung until I figure out what I broke.
Use Comparator.comparing in EliminateCrossJoins
Refactor to use sqlVarbinaryHex in TestVarbinaryFunctions
Compensate for Eclipse vs Sun compiler discrepancy  Eclipse allows autoboxing on type inference; Sun javac does not. This means that variables assigned from calls to AnnotationAttributes#getNumber should consistently use object wrappers as opposed to number primitives. There was only one such instance anyway, and has now been updated accordingly.
Set LowResourcesMaxIdleTime in Grid to avoid timeout of 'forever'. Fixes issue 6770.
SPR-6087: Updated Javadoc for HandlerInterceptor to indicate invocation order of afterCompletion() methods
Rename test to make way for a genuine unit test
some code cleanup
Fixed java client's serialization of NetworkConnection. (#3125)
Minor cleanup of PartitionedOutputOperator
Fix failures in testAllOpenSSLCiphersMapped() after changes to how unit test reports cipher names in r1615205 Start to fix testOpenSSLCipherAvailability() but more work required
additional javadoc enhancements for lift & compose
Optimize map_concat to skip empty map  Performance before: Benchmark                     (mapConfig)  Mode  Cnt     Score     Error  Units BenchmarkMapConcat.mapConcat   left_empty  avgt   20  1838.641 Â± 145.909  ns/op BenchmarkMapConcat.mapConcat  right_empty  avgt   20  1515.713 Â±  96.888  ns/op BenchmarkMapConcat.mapConcat   both_empty  avgt   20   615.368 Â±  57.051  ns/op BenchmarkMapConcat.mapConcat    non_empty  avgt   20  2753.727 Â± 503.407  ns/op  Performance After: Benchmark                     (mapConfig)  Mode  Cnt     Score     Error  Units BenchmarkMapConcat.mapConcat   left_empty  avgt   20   392.266 Â±  38.556  ns/op BenchmarkMapConcat.mapConcat  right_empty  avgt   20   376.552 Â±  32.928  ns/op BenchmarkMapConcat.mapConcat   both_empty  avgt   20    55.276 Â±   7.683  ns/op BenchmarkMapConcat.mapConcat    non_empty  avgt   20  3043.951 Â± 553.951  ns/op
Move MockMultHtServReqTests to correct package  This commit relocates MockMultipartHttpServletRequestTests to the appropriate package.
Remove unused import.  Remove unused import.  As far as I can tell, com.sun.javafx.util.Logging was added by accident. Having this class should not be required to build the Selenium source code.
Allows empty string as a action name
Make SimpleTypedSet.FOUR_MEGABYTES private
Review of r1457429: Make logic more clear. No functional change.
Refactor provider lookup in RecordSinkManager
Briefly describe the parser, and link to the wiki for more details
Tweak formatting. Fix an IDE nit.
SimonStewart: Make the IE driver consistent with the chrome and firefox drivers  r10506
Reduce call site of ExpressionAnalyzer.analyzeExpressions
Aspect actually applies in PersistenceExceptionTranslationPostProcessorTests  Issue: SPR-14457
DouniaBerrada: Adding exception for cases where the JS did not finish executing.  r15562
Record "started" counter for queries that fail to parse  In the last release we started tracking parsing failures for error categorization, but the change was missing the call to increment the started counter.  As a result, the started and completed counters get permanently out of sync and cause the number of running queries to be reported as 0.
Disable new RcFileReader until GC issues are resolved
Remove unused method from OrcRecordReader
fixes issue for locating newly installed chrome versions  Signed-off-by: Luke Inman-Semerau <luke.semerau@gmail.com>
SimonStewart: Deprecating setSelected and toggle on WebElement  r12457
Canonicalize equi join conditions for inner joins  This reduces number of unique symbols in query plan and allows other optimizations to be applied (e.g: running multiple joins in the same stage which operate on same partitions after canonicalization)
Remove unused MAX_POWER_OF_TEN_INT_VALUE from UnscaledDecimal128Arithmetic
Export waiting time counters
Java Client: Making extracted methods visible for integration tests   r5435
Split plan into fragments only at remote exchanges
Updated Javadoc: date format patterns SPR-17366
WW-1317   - changes in javadoc (uses dojo tooltip attributes as example)
Remove unused import
increase time out to make linux build pass on a slow machine  r3298
refined Resource "exists()" check for HTTP URLs to always return false for 404 status (SPR-7881)
JSP FormTag calculates proper default form action even when using a rewrite filter on WebSphere (SPR-7067)
ignore failing test for now - andy c to look at next wk
Make FixedWidthBlockBuilder.getSizeInBytes() more accurate  Previously we included the full capacity of the sliceOutput and valueIsNull buffers, even if they were empty
EranMes: Refactoring the test to use TestWaiter.  r12031
Ensure correct use of EffectivePredicateExtractor  Correct use is via `EffectivePredicateExtractor#extract` method.
Add split level selection stats
Adding El Capitan (OS X 10.11) to Platform  Signed-off-by: Daniel Davison <daniel.jj.davison@gmail.com>
support overriding default port by means of the selenium.port property  r3425
add @since section to doOnRequest() javadocs
Update @since tag for StreamUtils
Record "started" counter for queries that fail to parse  In the last release we started tracking parsing failures for error categorization, but the change was missing the call to increment the started counter.  As a result, the started and completed counters get permanently out of sync and cause the number of running queries to be reported as 0.
Deprecate unused methods  I doubt these methods will ever be useful, so deprecate them before possible removal.
Missing @Test annotation  Signed-off-by: Simon Stewart <simon.m.stewart@gmail.com>
Size BlockBuilder appropriately in map_keys  Previously we allocated one row worth of space per byte of input
Update test for changes in xwork
add missing @Override annotation
No logical change: remove unused import
Revert timeout change (no effect).
SimonStewart: There seems to be an odd problem when emulating 'type' into a rich text area. Falling back to using sendKeys directly  r12156
Delete print statement from unit test.
Remove isOpen assertion when sending WebSocket message  Issue: SPR-14138
Log compaction before we commit the transaction
use same method names everywhere
SimonStewart: Clean up imports of the Renderer class  r16856
SimonStewart: Making the focus event on anything bar input elements for HtmlUnit, which already fires the event for INPUTs  r5724
WW-3848 adds warning message that the FilterDispatcher is deprecated and can produce errors when used with other web stacks
Skip null options when converting back to argv
Ensure correct use of EffectivePredicateExtractor  Correct use is via `EffectivePredicateExtractor#extract` method.
made conversion service pluggable
Remove unnecessary synchronized block
Optimize ReflectionUtils.isCglibRenamedMethod  Optimize ReflectionUtils.isCglibRenamedMethod by removing the regular expression.  Issue: SPR-12227
allow for converting a property value based on the corresponding property name (SPR-7386)
Java tests: An attempt to nail down a test that fails for an unknown reason
Refined tests for FactoryBean return type resolution on @Bean methods  Issue: SPR-11842
WW-3601 - switches to /struts/ and /static/ patterns instead of /struts and /static to handle static content
Allow aggregation of an empty TupleStream
Remove duplicate @since tags in EmbeddedDatabaseBuilder
Add head tag model to freemarker available models
added validation to registermetrics to have timebucketSizeInSecs >= 1
Remove unnecessary code in ExchangeClient.scheduleRequestIfNecessary  This condition is covered by the check below it
Catch less specific exception to deal with intermittent failures with OpenJDK
Add simple join test
initialize port to 0 to avoid an NPE later on when args are checked
Rename test class to match tested functionality
Test against CGLIB memory leak for method injection  This commit introduces a test in XmlBeanFactoryTests that verifies that CGLIB generated subclasses for method injected beans are reused across bean factories for identical bean definitions. In other words, by verifying that the same CGLIB generated class is reused for identical bean definitions, we can be certain that Spring is no longer generating identical, duplicate classes that consume memory in the VM.  Issue: SPR-10785, SPR-11420
EranMes: When a Point instance is printed, the output will now be useful.  r12351
Delete unused import
[java] Adding some debug trace to figure out why W3CRemoteDriverTest.shouldPreferMarionette fails on travis
DouniaBerrada: Cleanup for android   r10357
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
Rename method since equals() has a specific meaning that doesn't seem the right fit for this use case. This also stops the IDE complaining that hashCode() needs to be overridden because equals has been.
OperatorDoOnRequest.ParentSubscriber should be static class
A better way to get default value
Construct proper literal for DATE in LiteralInterpreter.toExpression
AbstractApplicationContext.isRunning() avoids IllegalStateException  Issue: SPR-13667
Use DefaultTraversalVisitor in DependencyExtractor  Use DefaultTraversalVisitor in DependencyExtractor, thanks to that it is able to return correlated names as dependants.
Uses new way to access TileContainer
2.x: update Obs.just(2..10) & switchOnNextDelayError marbles (#5651)
Implement hashCode and equals for ErrorCode
grid: remove rewrite of Presto-Opera capability opera.binary
WW-4168 Added if statement in method isChecked to verify that the String Array of checkBox name values is not null.
Add support for AssignUniqueId to CostCalculator
Make SymbolsExtractor#extractOutputSymbols accept Lookup
Further refinement on PR-201
Remove some completed TODOs Tidy up the Javadoc
Add test to reproduce SPR-15271
Deleting empty methods deprecated in 2.xxx (long ago)
[java] Isolating a test that uses non-standard capabilities
Fix drop table test to use correct table
Unignoring a test that passes in all browsers. Fixes issue 2709
Improve subscription removal in SubscriptionRegistry  Avoid using destination pattern based search when removing sessions or subscriptions from DefaultSubscriptionRegistry and use only session and subscription ids.  Issue: SPR-11930
If a remote end does not explicitly state JavaScript support we suppose it's a "normal" browser that supports JavaScript
Require non-empty values for TxMgr qualifiers & bean names
TIKA-1955: Updated check to read from stream to avoid misreporting due to blocking
Consider a null ClassLoader (typically the bootstrap CL) as cache-safe  Issue: SPR-11606 (cherry picked from commit a4a2e80)
Added SourceHttpMessageConverter as a default.
Deprecate the Old Create Method
Restoring FirefoxOptions.getBinary method to not return null always.
WW-3067 Add a configuration constant to turn on/off the logging of missing properties by OGNL
Make JettyAppServer attempt to lookup a non-loopback address  This makes the proxy tests pass in Firefox, which likes to always bypass a proxy for local addreesses.
TIKA-844 Add an internal TagBag property type constructor, patch from Ray Gauss
STORM-3180 Total executors in Cluster Summary in main UI page is not exposed even a topology is running  * rename the field of /cluster/summary output: totalExecutors to executorsTotal
Fixed the tests in storm-starter that do not use the actual TupleImpl but mock everything themselves
STORM-3109: Fixed incorrect conversion from relative path to absolute path for STORM_LOCAL_DIR
Polish Javadoc for @Transactional
Polished. This closes #1745
Remove STOMP relay integration test  The test was verifying that when a DISCONNECT frame is sent to the broker, there will be no further messages on the clientOutboundChannel.  This is generally true, however in some cases when the broker receives a DISCONNECT it may close its connection fast enough (before we do) in which case we send an ERROR message downstream to ensure the WebSocket side is cleaned up. Either way the downstream should be idempotent with regards to cleaning up sessions.
Suppress rawtypes warning for createReferenceArray
[FLINK-11718] Make RpcEndpoint#start method final to prevent changing its behaviour  This closes #7808.
Use Sting.valueOf() instead of toString() to allow use in Unit tests (where selected item might be null)
[TEST] distributor direcotory is only used if multiple datapath are configured
Remove unnecessary word
Remove unused import in MockHttpServletRequestBuilderTests
Use junit 5
Rename SchedulerGroup to Computations and its methods to avoid confusion
Polished. This closes #1745
WW-4210 Extends annotation to allow use class instead of string
Remove matching ancient cruft in Config
Another silly build issue.
Add a .toString() method to RoutingNode  Previously this would log:  ``` [2015-02-24 11:13:45,105][TRACE][cluster.routing.allocation.allocator] [Poltergeist] Try moving shard [[test][2], node[HFn4dJ7fQAyfSAB8BquaSQ], [R], s[STARTED]] from [org.elasticsearch.cluster.routing.RoutingNode@6df2c498] ```  Now it will log:  ``` [2015-02-25 11:32:45,182][TRACE][cluster.routing.allocation.allocator] [Solarr] Try moving shard [[my_index][2], node[HDhbU4D9Rx27MSr_72bmWQ], [P], s[STARTED]] from [routingNode ([Solarr][HDhbU4D9Rx27MSr_72bmWQ][Xanadu.domain][192.168.0.4], [5 assigned shards])] ```
Don't throw exception if daemon isn't running, just return false for isRPCServerRunning() patch by goffinet; reviewed by slebresne for CASSANDRA-2721
Attempt to repro ReflectionUtils performance issue  Issue: SPR-10197
Index Update Settings API does not update settings in real time, closes #1807.
OperatorScan should check for MAX_VALUE on request
CAMEL-10735: Mark stuff for deprecate
CAMEL-10222: Merging changes
Do not run VCS commands when it's not enabled in configuration  Summary: VCS commands are executed even when gathering them is not enabled in the configuration. For example, every command in Buck repository triggers hg commands.  Reviewed By: philipjameson  fbshipit-source-id: 7c0a0914ae
Resolve build issues
CAMEL-10034: Camel health in camel-spring-boot should be optional. Thanks to Nicola Ferraro for reporting.
FreeMarkerConfigurationFactory falls back to SpringTemplateLoader on any exception  Issue: SPR-15445
CAMEL-10034: Camel health in camel-spring-boot should be optional. Thanks to Nicola Ferraro for reporting.
1. Do not hardcode the path to output directory. It can be controlled via build.properties. 2. Cleanup after the test.
Extend wait time to 20s in SecurityIntegTest  This kind of sucks, because we shouldn't have to wait that long for tests to run. But they're failing CI with some regularity, and we rely on these integration tests.  Original commit: elastic/x-pack-elasticsearch@3f4acb2a32d01dce6f94fbecc5e70529664631f2
Dereference atomic ref before identity comparison. (#4072)  This returns false 100% of the time otherwise.
The interface SpringApplicationConfiguration is deprecated  From @SpringApplicationConfiguration(classes=MyConfig.class) to @SpringBootTest(classes=MyConfig.class) Note: https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-1.4.0-M2-Release-Notes
Update copyright header  Closes gh-1343
Add a flag for loading a tagger in the LexicalizedParserServer
AbstractApplicationEventMulticaster only caches if event type and source type are cache-safe  Issue: SPR-11606
Polish "Align RdbmsOperation javadoc with jdbcTemplate defaults"  Closes gh-22572
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
Deprecate remaining parts of helpers.FuturesAdapter.
Remove unnecessary Runnable wrapping in NamedThreadFactory as is done by Netty.  Patch by Alex Petrov; reviewed by Dinesh Joshi for CASSANDRA-15008
Add a debounced 5 second delay to after-command GC  Summary: GC is run after a command to return memory to the system after long running commands.  If commands are invoked in quick succession, such as for queries invoked by scripts, the full GC may affect the latency of the next command being run.  This change schedules the after-command GC to happen after 5 seconds after the last command is run. If another command is run within that interval, the GC is further pushed back.  Test Plan: Run commands in quick succession, see that gc does not trigger via VM telemetry.  Reviewed By: illicitonion  fbshipit-source-id: 43f215c
Java Client: Making extracted methods visible for integration tests   r5435
doc: fix documentation for METHOD_REF token
Fixed problem with parallel execution
disables connectTest that fails silently avoind creation of jacoco report
Revert "disabled new http test cases, where failing probably on server overload"  This reverts commit 8dfbacb9a258ef85c731af372b87369d412ff558.
Changed use of AssertThrows to @Test(expected = ...)
Enabled an ignored test, which didn't have to be ignored (the comment wasn't true anymore)
Huge refactoring on GraphDB: - changed class names in vertex and edge - Optimized memory consumption by removing nested records - Optimized speed in ORecord.equals() and hashCode(): now avoid field checks (experimental)
removed unnecessary import
[BEAM-7083] Remove non-functional pipeline option for Java environment URL  The Java environment URL is now passed in the environment config. DefaultJavaEnvironmentUrl in PortablePipelineOptions is dead code.
Add javadoc to describe this method.
Index Update Settings API does not update settings in real time, closes #1807.
Tidy up getting headers in HttpMessage  This makes `getHeaders(String)` properly case-insensitive.
Rounding out the functional tests for the security rules stuff.
doc: fix documentation for METHOD_REF token
Better error message
Remove unused array declarations. #1555  Fixes `MismatchedArrayReadWrite` inspection violations in test code.  Description: >Reports any array fields or variables whose contents are read but not written, or written but not read. Such mismatched reads and writes are pointless, and probably indicate dead, incomplete or erroneous code.
Use JUnit ExpectedException rule in AntPathMatcherTests
MINOR: Implement toString() in config validator classes (#5401)
Remove matching ancient cruft in Config
Propagate the nested exception when an EventListener init fails
Accessing special Data class, not the test class
[TIKA-2472] Implementing Metadata#hashCode
Update OHttpRequestWrapper.java  re #4123
Added getters for fs.path, fs.mount and fs.dev in node stats api  Closes #4004
convert supplied value to list when isn't iterable  when user supply a not iterable value for list in ListUIBean, then convert it to a single member list (instead of a null value as before versions do)
@After in EndToEndRunner  Summary: Part of bringing EndToEndRunner more consistent with the default JUnit runner  Reviewed By: bobyangyf  fbshipit-source-id: b44f135
Rename tests  Summary: Renamed few tests to reflect object names.  Reviewed By: rajyengi  fbshipit-source-id: eb364df083
Un-ignore RequestMapping test for handling "" paths  Issue: SPR-15653
Test: Fix SearchTransformTests suite error  Original commit: elastic/x-pack-elasticsearch@03568dce090db993e9dae8ac0ced3fd2b19b7864
Internal: MulticastChannel should wait on receiver thread to stop during shutdown  This was signaled by our tests which shutdown class and check for thread leakage.  Closes #7835
Prevent empty calls to ACAC #register and #scan
[TEST] skip benchmark tests for now
Accept empty Content-Type header  Issue: SPR-12173
Test: Fix SearchTransformTests suite error  Original commit: elastic/x-pack-elasticsearch@03568dce090db993e9dae8ac0ced3fd2b19b7864
Fix a mistake (I think, Philippe confirm this?)
Default start_rpc to true in Config
TIKA-1027: Allow null values when setting metadata
Copy the resolver configuration when cloning Bootstrap  Motivation:  Bootstrap.clone() does not copy the resolver configuration.  Modifications:  Copy the resolver configuration when cloning.  Result:  Bug fixed
Add some test cases for null handling
Contribution by Luca Molino about to ignore tabs while parsing JSON
Add javadoc to getEstimatedSizeBytes  based on code comment in BoundedReadFromUnboundedSource.java
add a note on the rest pre processor
Remove final from try-with-resources, fixes #805  This is temporary fix. Proper solution is to update cobertura-maven-plugin to 2.7.
Another bit of logging.  Did the server ever get started at all?  r2164
Remove unused code from superconsole.  Reviewed By: bobyangyf  fbshipit-source-id: 5047882fc7
2.x: Add exception message in SingleFromCallable (#4508)
Remove matching ancient cruft in Config
ImportAwareBeanPostProcessor registered with ROLE_INFRASTRUCTURE
Includes global-allowed-methods instead of overriding them
Use Sting.valueOf() instead of toString() to allow use in Unit tests (where selected item might be null)
CAMEL-10034: Camel health in camel-spring-boot should be optional. Thanks to Nicola Ferraro for reporting.
Revert "disabled new http test cases, where failing probably on server overload"  This reverts commit 8dfbacb9a258ef85c731af372b87369d412ff558.
properly print JVM version
RecoveryMonitor#lastSeenAccessTime should be volatile (#36781)  This local field is accessed on multiple threads and is nonvolatile so theoretically could yield stale values. Not sure it does in practice.
Adds test case for issue #4301
Introduce tests for Spring Boot issue 885  This commit introduces unit tests that attempt to reproduce the problem described in Spring Boot issue 885; however, the tests pass and therefore do not confirm the reported problem.  See: https://github.com/spring-projects/spring-boot/issues/885
Remove explicit generic type arguments
@since version currently only 2.0
Unwrap invocation target exception from QuidemTest#test
better detailed message
[TEST] RepeatOnExceptionRule to rethrow unexpected exception  In case an exception was caught by the repeat rule, the retry mechanism would kick in only if the exception was the expected one. If not an NPE got thrown, while we should rather just bubble it up to the caller. This makes `NettyTransportMultiPortTests` run from a plane. An assumption would kick in to make sure that the test gets ignored but the `AssumptionViolationException` was caught and not properly re-thrown.
MAHOUT-1259 toString() method of SequentialAccessSparseVector has closing brace missing for empty vector (by Abhinav M Kulkarni)
Adds test case for issue #4301
[CALCITE-1751] Disable the flapping pig-adapter test  Closes apache/calcite#424
remove empty comments
setContext to test name during test   r4312
Show actual script in Tree View Listener etc
remove infinite loop
HOTFIX: Fix optional import in ConsumerCoordinator (#6953)  This was caused by back-to-back merging of #6854 (which removed the Optional import) and #6936 (which needed the import).  Reviewers: Jason Gustafson <jason@confluent.io>
https://issues.apache.org/jira/browse/AMQ-5563  Added fix to update the documentation to reflect correct defaults.
mute testDifferentRolesMaintainPathOnRestart  See https://github.com/elastic/elasticsearch/issues/23728
Display data: minor cleanups  * wrong @Nullable * Remove unused function
Test: disable locale parsing test that is broken with some randomized values  See https://github.com/elastic/elasticsearch/issues/26425
retrocompatibility restored with old apu
OperatorScan should check for MAX_VALUE on request
Introduce tests for Spring Boot issue 885  This commit introduces unit tests that attempt to reproduce the problem described in Spring Boot issue 885; however, the tests pass and therefore do not confirm the reported problem.  See: https://github.com/spring-projects/spring-boot/issues/885
Javadoc in MockMvcClientHttpRequestFactoryTests  The Javadoc in MockMvcClientHttpRequestFactoryTests had been copied and pasted from WebAppResourceTests. This commit updates the documentation in MockMvcClientHttpRequestFactoryTests to reflect what the tests do.
Remove unnecessary word
remove silly throws decl
Deleted unused resourceLoader field in Jaxb2Marshaller
JDBCSampler is a sampler
add helper for registering decorators
Retain the order the URLs were added in when calculating the result for getURLs()
