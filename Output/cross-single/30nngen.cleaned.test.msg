Initialize JNDI to fix failing Environment test  Issue: SPR-12223
Fixing encoding of payload passed by hub to a node
Initialize JNDI to fix failing Environment test  Issue: SPR-12223
Make TestContextManager.getTestContext() public  This commit changes the visibility of the getTestContext() method in TestContextManager from 'protected' to 'public' in order to support test method injection in JUnit 5 and similar use cases.  Issue: SPR-14011
12905: No need to cast ContextRefreshedEvent. Safety applicationContext identity check.  Co-Authored-By: oalles <oalles@gmail.com>
Add test for combining @Controller with RouterFunctions  This commit adds a test for combining RouterFunctions with a @Controller.  Issue: SPR-15521
Allow JAXB to be registered next to plain Jackson  Issue: SPR-14336
Delete unused imports
Fix test  The rework of 314b069 in a7fec6a has created a lazy proxy to make sure that the need for an exception cache resolver come as late as possible.  Unfortunately, the test that was only failing on CI because of an early lookup has not been updated accordingly. This is now the case.  Issue: SPR-12850
Short-circuit logic should be used in boolean contexts
WiretapConnector removes exchanges  Issue: SPR-15744
Make TestContextManager.getTestContext() public  This commit changes the visibility of the getTestContext() method in TestContextManager from 'protected' to 'public' in order to support test method injection in JUnit 5 and similar use cases.  Issue: SPR-14011
Make TestContextManager.getTestContext() public  This commit changes the visibility of the getTestContext() method in TestContextManager from 'protected' to 'public' in order to support test method injection in JUnit 5 and similar use cases.  Issue: SPR-14011
12905: No need to cast ContextRefreshedEvent. Safety applicationContext identity check.  Co-Authored-By: oalles <oalles@gmail.com>
Follow up fix for PR #1168
Use ArrayList instead of LinkedList
Delete dead code in spring-webmvc
Implement MessagingException.toString()  Issue: SPR-15091 Closes gh-1284
CAS-1377: Added integration tests
Allow GeckoDriverService to be extended.  Note that this is the case for other driver services.  Signed-off-by: Luke Inman-Semerau <luke.semerau@gmail.com>
Cleaning up unused imports.
Added SourceHttpMessageConverter as a default.
Polish "Refactor duplicated code"  Closes gh-1445
[TEST] Remove debug leftover
Make TestContextManager.getTestContext() public  This commit changes the visibility of the getTestContext() method in TestContextManager from 'protected' to 'public' in order to support test method injection in JUnit 5 and similar use cases.  Issue: SPR-14011
fixed ambiguous reference to Entry type
protect against nonexistent suite file  r3285
TIKA-386: Tika relies on X11  Capture the reported NoClassDefFoundError and wrap it into a more appropriate TikaException
Polish Javadoc for TestContext
Remove unnecessary tests
Fixing a test, new mockito version is more accurate with null values.
If a mimetype is handeld by a composite parser, report the underlying parser against the type (TIKA-1270)
DanielWagnerHall: Removing unused import  r13215
EranMes: Make the Firefox test more reliable until we fix issue 1708.  r12741
Add setter for defaultPersistenceUnitRootLocation  This commit adds a setter for the default persistence unit's defaultPersistenceUnitRootLocation attribute.
Polish Javadoc for TestContext
Avoid extra Block creation in map to json cast
First pass at updating unmapped list for Oracle
Remove VisibleForTesting annotation in createSqlTaskExecution  The method needs to be package-private so that SqlTaskExecutionFactory can access it, so it's not more visible than it already needs to be.
Add comment to TestPositionLinks
Remove obsolete suppression of deprecation warning
Set LowResourcesMaxIdleTime in Grid to avoid timeout of 'forever'. Fixes issue 6770.
Add missing text to CachingResourceTransformer Javadoc
Align 9.0.x and 8.5.x.
WW-3044 Replace code by similar code in commons lang
Fixing FirefoxBinary to json conversion
Categorize RejectedExecutionException in StateMachine
First pass at updating unmapped list for IBM
additional javadoc enhancements for lift & compose
Optimize array_intersect using PageBuilder
CAS-1377: Added integration tests
SimonStewart: Adding chrome support to the remote webdriver  r7452
Allows empty string as a action name
Make SimpleTypedSet.FOUR_MEGABYTES private
Extract decoder use flag to a field (will use it later)
Make PagesIndex.clear() free memory
another npe in PDFParser
Minor optimisation - remove unnecessary call.
Fixing possible ClassCastException if version is an integer number
Categorize expression analysis errors
Deleting unused imports.
[java] Adding some debug trace to figure out why W3CRemoteDriverTest.shouldPreferMarionette fails on travis
Add missing synchronization for HttpRemoteTask.addSplits
Throw PrestoException with HIVE_BAD_DATA code for corrupt RC files
Export waiting time counters
fixes issue for locating newly installed chrome versions  Signed-off-by: Luke Inman-Semerau <luke.semerau@gmail.com>
SimonStewart: Deprecating setSelected and toggle on WebElement  r12457
Remove DesugaringOptimizer.visitApply  This partially backs out 7846e86. A few queries in AbstractTestQueries otherwise fails planning.
Add requireNonNull to NamedTypeSignature constructor
Export waiting time counters
setContext to test name during test   r4312
Split plan into fragments only at remote exchanges
Updated Javadoc: date format patterns SPR-17366
WW-2651 FileUploadInterceptor.java javadoc is not formatted correctly for Confluence snippets  Thanks to Matthieu Chase Heimer for the patch
Use the i18n strings from the correct package
increase time out to make linux build pass on a slow machine  r3298
component-scan's scoped-proxy attribute applies to scope-annotated singleton beans as well (SPR-6683)
JSP FormTag calculates proper default form action even when using a rewrite filter on WebSphere (SPR-7067)
Remove STOMP relay integration test  The test was verifying that when a DISCONNECT frame is sent to the broker, there will be no further messages on the clientOutboundChannel.  This is generally true, however in some cases when the broker receives a DISCONNECT it may close its connection fast enough (before we do) in which case we send an ERROR message downstream to ensure the WebSocket side is cleaned up. Either way the downstream should be idempotent with regards to cleaning up sessions.
Add equals and hashcode methods to ConnectorNewTableLayout
AlexeiBarantsev: Cleaning out a test that was made common and moved to AlertsTest  r17869
SimplifyExpressions drop filter if the predicate is just TRUE
Remove static modifier on TaskExecutor runningSplitInfos
Adding support for OSX mojave to grid (#6552)  Add a `MOJAVE` constant to the `Platform` enum.  Fixes: #6467
setContext to test name during test   r4312
more javadoc changes to correspond with recent method changes
Restored API getLoadProperties
Add GET method to /v1/memory endpoint
Call the right completion handler  This won't make any real difference here though as the socket will be closed, but after getting the semaphore it should be released, along with the rest of the cleanup.
Missing @Test annotation  Signed-off-by: Simon Stewart <simon.m.stewart@gmail.com>
Make PagesIndex.clear() free memory
Update test for changes in xwork
add curly brackets (formatting)  - add curly brackets around single line conditional statements
No logical change: remove unused import
- Fix version number.
SimonStewart: Removing the deprecated newWebElement method. Again  r15063
Fixing test to run on any platform (IE is available on Windows only)
Remove isOpen assertion when sending WebSocket message  Issue: SPR-14138
Log compaction before we commit the transaction
use same method names everywhere
The next release is not Selenium for Workgroups
Adding version number to the capabilities returned by htmlunitdriver. Fixes issue 7110
FilterDispatcher not always calling ActionContextCleanUp.cleanUp(Request) o applied patch submitted by Jasper Rosenberg  Issue Number: WW-1816
Apply Filip's better patch for https://issues.apache.org/bugzilla/show_bug.cgi?id=45212 Map.entrySet() should return entries, not values
Make DecorrelatedNode#getCorrelatedPredicates public
fixed some tests that will now break because int/long can be treated as boolean.  May need to change again if real numbers get the same treatment.
Make PagesIndex.clear() free memory
Cache external class lookup
Consider enum subclasses as simple value types as well  Issue: SPR-16278
Deleting unused imports
Improve tests for detection of @MVC annotations  Issue: SPR-9601
Remove unused imports
Allow aggregation of an empty TupleStream
fixed embedded database exception test
WW-1764 Rename fremarker tag model "comboBox" to "combobox"
STORM-342: add exception as cause when re-thrown
Fix memory accounting in ParallelHashBuildOperator  Use same logic as for HashBuilderOperator
Correct error in r1666072 "return true" was originally "continue" that would have continued the for loop and was, in fact, unnecessary since it was at the end of the loop.
Rename test class to match tested functionality
Ignoring another exception that can appear on an attempt to start driver service with unacceptable capabilities.
Rename test class to match tested functionality
Improve tests for detection of @MVC annotations  Issue: SPR-9601
Let WindowsUtils.killPID() kill the whole process tree  Signed-off-by: Andreas Tolf Tolfsen <andreastt@opera.com>
Delete unused import
[java] Adding some debug trace to figure out why W3CRemoteDriverTest.shouldPreferMarionette fails on travis
Creating directory for results file. Fixes issue 6520
Remove avro usage in DataOutputTest
protect against nonexistent suite file  r3285
TikaCLI: add attachement extraction option
Avoid extra Block creation in map to json cast
SimonStewart: Preparing to remove the 'isJavascriptEnabled' method.  r11967
Whoops. Remove debug code.
[java] Adding some debug trace to figure out why W3CRemoteDriverTest.shouldPreferMarionette fails on travis
startWith(observable) marble diagram
Correct error in r1666072 "return true" was originally "continue" that would have continued the for loop and was, in fact, unnecessary since it was at the end of the loop.
Add missing @Test annotations in TestGeoFunctions
As an additional cleanup, don't write any empty message when flushing and there's no data to flush.
use LinkedList to buffer the sequenceâs items  LinkedList has guaranteed constant insertion time when appending to the end of the list, whereas ArrayList takes O(1) amortized, since a reallocation might be necessary to insert further items. Since no capacity was specified for the buffer, on Hotspot this would cause the array to reallocate after the first 10 insertions, on Android after the first insertion (since Androidâs ArrayList uses a default capacity of zero.)  Since the buffer is copied to an ArrayList before emission, subscriber performance when working with the list should remain unaffected.  Refs #1141
A better way to get default value
Consider instance size when calculating estimated size
#NAME?
Make REAL work in MAP
WW-4168 Added if statement in method isChecked to verify that the String Array of checkBox name values is not null.
2.x: Add marbles for Observable (12/06) (#5755)
Add additional test for TypedSet  This test makes the API usage more clear.
Write distributor status to response
WW-4168 Added if statement in method isChecked to verify that the String Array of checkBox name values is not null.
Add missing support for UnionNode to DistributedExecutionPlanner
Add Assignments.identity(Symbol...) method
TIKA-1128: normalize newlines before assert
Javadoc This complete the org.apache.coyote package which is now warning free
Test for expected behavior of getAllMergedAnnotations vs findAllMergedAnnotations  Issue: SPR-15271
Deleting empty methods deprecated in 2.xxx (long ago)
Do not use SauceDriver to check the effective platform as that will fail when running locally
Fix table creation tests for Cassandra and Kafka
Ignoring unstable test (fails on travis)
Moved unsubscribe out the gate
If a remote end does not explicitly state JavaScript support we suppose it's a "normal" browser that supports JavaScript
Polish DatabaseStartupValidator.afterPropertiesSet()
TIKA-275: Parse context  Use an explicit parsing context in the Tika facade.
Property actually throws exception for no write method found  Issue: SPR-15507
renamed UriUtilsTest to UriUtilsTests
Deprecate the Old Create Method
Try and set profile for xpi driver if necessary
WW-1764 Rename fremarker tag model "comboBox" to "combobox"
Improving stability of the test
TIKA-275: Parse context  Use an explicit parsing context in the Tika facade.
STORM-3129: Fixed startTime assignment to using Storm Time util.
Fixed the tests in storm-starter that do not use the actual TupleImpl but mock everything themselves
Refactor - simplify
SPR-8725 Change modifier in WebMvcConfigurationSupport methods from package private to public.  Use of package private @Bean methods can cause issues if the class is extended and the sub-class is in a different package. This is  covered in detail in SPR-8756.
Polish "Refactor duplicated code"  Closes gh-1445
Remove STOMP relay integration test  The test was verifying that when a DISCONNECT frame is sent to the broker, there will be no further messages on the clientOutboundChannel.  This is generally true, however in some cases when the broker receives a DISCONNECT it may close its connection fast enough (before we do) in which case we send an ERROR message downstream to ensure the WebSocket side is cleaned up. Either way the downstream should be idempotent with regards to cleaning up sessions.
Polish "Refactor duplicated code"  Closes gh-1445
WW-4168 Added if statement in method isChecked to verify that the String Array of checkBox name values is not null.
remove dead code left over from removal of commitlog_periodic_queue_size setting see cassandra-8697
No logical change: remove unused import
deactivate running of javadoc example which is just a partial example
Fixes BackupServiceIT to properly close log channel after latest changes
changed test method names.
Run reactive integration tests only as part of performance group
use varargs for scan method as well
Compilation failure after the merge
remove dead code left over from removal of commitlog_periodic_queue_size setting see cassandra-8697
Another silly build issue.
Add a .toString() method to RoutingNode  Previously this would log:  ``` [2015-02-24 11:13:45,105][TRACE][cluster.routing.allocation.allocator] [Poltergeist] Try moving shard [[test][2], node[HFn4dJ7fQAyfSAB8BquaSQ], [R], s[STARTED]] from [org.elasticsearch.cluster.routing.RoutingNode@6df2c498] ```  Now it will log:  ``` [2015-02-25 11:32:45,182][TRACE][cluster.routing.allocation.allocator] [Solarr] Try moving shard [[my_index][2], node[HDhbU4D9Rx27MSr_72bmWQ], [P], s[STARTED]] from [routingNode ([Solarr][HDhbU4D9Rx27MSr_72bmWQ][Xanadu.domain][192.168.0.4], [5 assigned shards])] ```
https://issues.apache.org/jira/browse/AMQ-3894 - remove requirement for destination property enforced by spring - for a default entry there is no need for a destination
changed test method names.
Index Update Settings API does not update settings in real time, closes #1807.
2.x: Add exception message in SingleFromCallable (#4508)
Deprecate FastStack in favor of ArrayDeque, issue #86
Do not use deprecated maven api
Do not run VCS commands when it's not enabled in configuration  Summary: VCS commands are executed even when gathering them is not enabled in the configuration. For example, every command in Buck repository triggers hg commands.  Reviewed By: philipjameson  fbshipit-source-id: 7c0a0914ae
Replaced java6 treemap with OMVRBTreeMemory
Cleaning up unused imports.
Implement MessagingException.toString()  Issue: SPR-15091 Closes gh-1284
Use public AssumptionViolatedException in Assume  JUnit 4.12 created a 'public' version of the previously 'internal' AssumptionViolatedException.  This commit upgrades Spring's Assume class to use this new public version.
Remove STOMP relay integration test  The test was verifying that when a DISCONNECT frame is sent to the broker, there will be no further messages on the clientOutboundChannel.  This is generally true, however in some cases when the broker receives a DISCONNECT it may close its connection fast enough (before we do) in which case we send an ERROR message downstream to ensure the WebSocket side is cleaned up. Either way the downstream should be idempotent with regards to cleaning up sessions.
[TEST] Plugin Manager  Undo removal of change.
Dereference atomic ref before identity comparison. (#4072)  This returns false 100% of the time otherwise.
Cleaning up unused imports.
Allow JAXB to be registered next to plain Jackson  Issue: SPR-14336
Since the address is exposed to sub-components, expose the port as well.
ExposeInvocationInterceptor declares itself as PriorityOrdered now  Issue: SPR-12351
Allow JAXB to be registered next to plain Jackson  Issue: SPR-14336
Handle exceptions properly in SpringJUnit4ClassRunner  JUnit 4.9 introduced a regression in BlockJUnit4ClassRunner.runChild() such that exceptions thrown from methodBlock() cause the current test execution to abort immediately. As a result, the failing test method is unrooted, and subsequent test methods are never invoked. Furthermore, RunListeners registered with JUnit are not properly notified.  In conjunction with SPR-11908, SpringJUnit4ClassRunner was updated to use the aforementioned changes to BlockJUnit4ClassRunner.runChild(). Consequently, SpringJUnit4ClassRunner now suffers from the same regression.  This commit addresses this issue by ensuring that any exceptions thrown during the invocation of methodBlock() are properly wrapped in a JUnit Fail Statement.  Issue: SPR-12613
catch ConversionFailedException and fallback to default container conversion logic rather than propogate exception
Reduce memory usage by EmbeddedChannel  Motivation:  When using an EmbeddedChannel often it either does inbound or outbound processing which means we only often need one queue.  Modifications:  Lazy init the inbound and outbound message queues.  Result:  Less memory usage.
Remove unused imports
prep for user js injection support  r2647
The interface SpringApplicationConfiguration is deprecated  From @SpringApplicationConfiguration(classes=MyConfig.class) to @SpringBootTest(classes=MyConfig.class) Note: https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-1.4.0-M2-Release-Notes
FreeMarkerConfigurationFactory falls back to SpringTemplateLoader on any exception  Issue: SPR-15445
Ignore Pong messages in StompSubProtocolHandler  Issue: SPR-12728
Make TestContextManager.getTestContext() public  This commit changes the visibility of the getTestContext() method in TestContextManager from 'protected' to 'public' in order to support test method injection in JUnit 5 and similar use cases.  Issue: SPR-14011
12905: No need to cast ContextRefreshedEvent. Safety applicationContext identity check.  Co-Authored-By: oalles <oalles@gmail.com>
Issue #5377 amount of detected leaks was added in JMX bean.
(ninja) use javax.annotation instead of avro
remove infinite loop
Remove unnecessary Runnable wrapping in NamedThreadFactory as is done by Netty.  Patch by Alex Petrov; reviewed by Dinesh Joshi for CASSANDRA-15008
Add a debounced 5 second delay to after-command GC  Summary: GC is run after a command to return memory to the system after long running commands.  If commands are invoked in quick succession, such as for queries invoked by scripts, the full GC may affect the latency of the next command being run.  This change schedules the after-command GC to happen after 5 seconds after the last command is run. If another command is run within that interval, the GC is further pushed back.  Test Plan: Run commands in quick succession, see that gc does not trigger via VM telemetry.  Reviewed By: illicitonion  fbshipit-source-id: 43f215c
avoid NPE when a stack element has no file name
[GEO] Updating javadoc for XShapeCollection  XShapeCollection has an incorrect description left over from when the relate method was overridden. This one line commit corrects the description.
Fixed problem with parallel execution
AwaitsFix GatewayIndexStateIT#testJustMasterNode  Relates #44416.
[TEST] Mute SharedClusterSnapshotRestoreIT.testParallelRestoreOperationsFromSingleSnapshot  This was supposed to be muted in #44675 and its backports but that PR accidentally muted another test.  Relates #44671
Changed use of AssertThrows to @Test(expected = ...)
Do not run JavaBinaryIntegrationTest on Winodws  Summary: We don't do anything but android native code on Windows currently, so we have no reason to run this test on that platform.  Test Plan: `ant test -D"test.class"="JavaBinaryIntegrationTest"`
Tests: Reduce number of random runs for shape builder tests
Remove unused imports
Observable javadoc cleanup (#5992)  The sample code in the Observable javadoc erroneously uses onNext(Integer t) for a DisposableObserver<String> This has been corrected to be onNext(String t)
Add javadocs to ProcessUtil
Index Update Settings API does not update settings in real time, closes #1807.
Tidy up getting headers in HttpMessage  This makes `getHeaders(String)` properly case-insensitive.
HIVE-19077: Handle duplicate ptests requests standing in queue at the same time - addendum
#9 -v CLI flag for querying the installed Checkstyle version Fixed formatting issue.
Use NoSuchBufferException instead of IllegalArgumentException
GROOVy-6471: add a priviledged action wrapper for getDeclaredMethods
Use JUnit ExpectedException rule in AntPathMatcherTests
Only resolve host if explicitly allowed.  We have some settings that prevent host name resolution which should be repected by InetSocketTransportAddress#getHost() to only resolve if allowed or desired.
remove dead code left over from removal of commitlog_periodic_queue_size setting see cassandra-8697
remove silly throws decl
Accessing special Data class, not the test class
MAHOUT-944:lucene2seq - removed unused import
Fixed issue 336 thanks to the patch by the reporter
remove silly throws decl
Check and put entry into `handleCache` atomically
Use new API for getAllNodes but close properly
Refactoring: moving an auxiliary class from the top level to inner class
Un-ignore RequestMapping test for handling "" paths  Issue: SPR-15653
Test: Fix SearchTransformTests suite error  Original commit: elastic/x-pack-elasticsearch@03568dce090db993e9dae8ac0ced3fd2b19b7864
close the index input in any case when computing length
use varargs for scan method as well
[TEST] skip benchmark tests for now
remove unused method
Used ExpectedError instead of Exception to tell that the failure is expected obviously
Fix a mistake (I think, Philippe confirm this?)
Added methods for JavaSamplers to be able to get and put objects to share with other classes running in the same thread. PR: Obtained from: Submitted by:     Reviewed by:     CVS: ---------------------------------------------------------------------- CVS: PR: CVS:   If this change addresses a PR in the problem report tracking CVS:   database, then enter the PR number(s) here. CVS: Obtained from: CVS:   If this change has been taken from another system, such as NCSA, CVS:   then name the system in this line, otherwise delete it. CVS: Submitted by: CVS:   If this code has been contributed to Apache by someone else; i.e., CVS:   they sent us a patch or a new module, then include their name/email CVS:   address here. If this is your work then delete this line. CVS: Reviewed by: CVS:   If we are doing pre-commit code reviews and someone else has CVS:   reviewed your changes, include their name(s) here. CVS:   If you have not had it reviewed then delete this line.
Add javadocs to ProcessUtil
It's more correct to remove the connector handler in ClientBootstrap
Changed use of AssertThrows to @Test(expected = ...)
Defines a new constant to limit collection auto growth
Add an important notice about future migration issue in SimpleChannelInboundHandler.  - Related: #1590
Deprecate FastStack in favor of ArrayDeque, issue #86
#9 -v CLI flag for querying the installed Checkstyle version Fixed formatting issue.
Remove explicit generic type arguments
Remove unused code from superconsole.  Reviewed By: bobyangyf  fbshipit-source-id: 5047882fc7
2.x: Add exception message in SingleFromCallable (#4508)
remove dead code left over from removal of commitlog_periodic_queue_size setting see cassandra-8697
Return NO_CONTENT instead of GONE when get results times out
remove dead code left over from removal of commitlog_periodic_queue_size setting see cassandra-8697
remove dead code left over from removal of commitlog_periodic_queue_size setting see cassandra-8697
Reorder the methods of the class and remove useless javadoc. Part of #332 Contributed by Graham Russell
CAS-1414: added missing final keywords
Version missing a space, closes #1517.
[FLINK-1042] Changed ClassLoader field to be transient.  Serialization of the `RuntimeStatefulSerializerFactory` fails because the field `ClassLoader loader` is not serializable. The fix makes the field `transient`.  Author: Fabian Hueske <fhueske@apache.org>  Closes #92 from fhueske/StatefulSerializerFactoryFix and squashes the following commits:  c01cc27 [Fabian Hueske] [FLINK-1042] Changed ClassLoader field to be transient.
Remove STOMP relay integration test  The test was verifying that when a DISCONNECT frame is sent to the broker, there will be no further messages on the clientOutboundChannel.  This is generally true, however in some cases when the broker receives a DISCONNECT it may close its connection fast enough (before we do) in which case we send an ERROR message downstream to ensure the WebSocket side is cleaned up. Either way the downstream should be idempotent with regards to cleaning up sessions.
Polish contribution  Closes gh-1292 Issue: SPR-15188
Remove explicit generic type arguments
@since version currently only 2.0
Unwrap invocation target exception from QuidemTest#test
better detailed message
[TEST] Print tests.jvms and tests.client.ratio if set  We need to print options that can modify stream of events we need to print it otherwise a seed might not reproduce the failure in the tests.
Reduced the number of isConnected() calls in AbstractChannel.toString()
Shutdown database after tests.
changed test method names.
indices cluster state service should execute as one of the first listeners its preferable to execute the indices cluster state service as quickly as possible, as one of the first listeners, so it will apply the cluster state to the local state potentially, it should even execute before it state is "visible" (through the state call), but that's another change...
setContext to test name during test   r4312
Show actual script in Tree View Listener etc
remove infinite loop
remove infinite loop
Analyzers are now specified by name, and service-loaded.  This fixes a security issue where we could otherwise run the class initializer and object constructors of arbitrary classes.
CAMEL-13141: Make using advice-with easier by using lambda route builder directly on the AdviceWithRouteBuilder.
removed unused imports
Another bit of logging.  Did the server ever get started at all?  r2164
minor: added missing code for EXTENDS_CLAUSE token
2.x: Add exception message in SingleFromCallable (#4508)
Remove deprecated removetoken command from nodetool
Javadoc in MockMvcClientHttpRequestFactoryTests  The Javadoc in MockMvcClientHttpRequestFactoryTests had been copied and pasted from WebAppResourceTests. This commit updates the documentation in MockMvcClientHttpRequestFactoryTests to reflect what the tests do.
[hotfix][java] Add missing space to error message  This closes #4944.
remove silly throws decl
Deleted unused resourceLoader field in Jaxb2Marshaller
Ignore non HTTP Samplers
Fix for TIKA-2613 contributed by ewanmellor.  Change -psm on the Tesseract command line to --psm, with two dashes. This matches a change in Tesseract 4.0 to remove the one-dash version. It has been deprecated since Nov 2016.  The Tesseract cset is ee201e1f4.  Also, move the config file (i.e. getOutputType in Tika's terms) so that it is the last parameter on the command line.  Tesseract logs an error message (though otherwise doesn't fail) if the config file is not the last thing on the command line.
Remove unused imports
