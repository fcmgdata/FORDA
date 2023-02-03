CAS-1377: Added integration tests
Cleaning up unused imports.
Initialize JNDI to fix failing Environment test  Issue: SPR-12223
Add missing spring boot tests
Cleaning up unused imports.
Add test for combining @Controller with RouterFunctions  This commit adds a test for combining RouterFunctions with a @Controller.  Issue: SPR-15521
Property actually throws exception for no write method found  Issue: SPR-15507
Revert "[TEST] Enable trace logging for translog recovery"  This reverts commit 52d53e658f786d1e0717c3f63676de00426599cb.
Add missing spring boot tests
CAMEL-13141: Make using advice-with easier by using lambda route builder directly on the AdviceWithRouteBuilder.
minimized local MockServletContext dependencies
Cleaning up unused imports.
[TEST] add mapping to MoreLikeThisActionTests to make sure doc mapper exists on all shards / nodes
Cleaning up unused imports.
CAMEL-10222: Renamed class to exclude it from surefire tests
add curly brackets (formatting)  - add curly brackets around single line conditional statements
Cleaning up unused imports.
Property actually throws exception for no write method found  Issue: SPR-15507
CAS-1377: Added integration tests
CAMEL-2941 changed the osgi detection log as Claus suggested
Remove STOMP relay integration test  The test was verifying that when a DISCONNECT frame is sent to the broker, there will be no further messages on the clientOutboundChannel.  This is generally true, however in some cases when the broker receives a DISCONNECT it may close its connection fast enough (before we do) in which case we send an ERROR message downstream to ensure the WebSocket side is cleaned up. Either way the downstream should be idempotent with regards to cleaning up sessions.
Initialize JNDI to fix failing Environment test  Issue: SPR-12223
Adding default constructor call WW-1753
CAMEL-13141: Make using advice-with easier by using lambda route builder directly on the AdviceWithRouteBuilder.
[TEST] add mapping to MoreLikeThisActionTests to make sure doc mapper exists on all shards / nodes
fixed ambiguous reference to Entry type
include commented-out Selenese above xlator's output  r2355
If a mimetype is handeld by a composite parser, report the underlying parser against the type (TIKA-1270)
ConcurrentModel.addAttribute javadoc: null value not supported  Issue: SPR-16831
Add test for INNER join with only unequality join conjuncts
Unignoring one more test in marionette, and fixing calls to deprecated methods.
If a mimetype is handeld by a composite parser, report the underlying parser against the type (TIKA-1270)
No logical change: remove unused import
EranMes: Make the Firefox test more reliable until we fix issue 1708.  r12741
added missing setter method for the "valueSeparator" property (SPR-7429)
sorting out javadoc, promoted isWritable() to this interface (for now)
Avoid extra Block creation in map to json cast
First pass at updating unmapped list for Oracle
Split plan into fragments only at remote exchanges
Fix typo and improve LiteralParameter error message
Handle exceptions properly in SpringJUnit4ClassRunner  JUnit 4.9 introduced a regression in BlockJUnit4ClassRunner.runChild() such that exceptions thrown from methodBlock() cause the current test execution to abort immediately. As a result, the failing test method is unrooted, and subsequent test methods are never invoked. Furthermore, RunListeners registered with JUnit are not properly notified.  In conjunction with SPR-11908, SpringJUnit4ClassRunner was updated to use the aforementioned changes to BlockJUnit4ClassRunner.runChild(). Consequently, SpringJUnit4ClassRunner now suffers from the same regression.  This commit addresses this issue by ensuring that any exceptions thrown during the invocation of methodBlock() are properly wrapped in a JUnit Fail Statement.  Issue: SPR-12613
Remove unused annotations and unthrown exceptions
Polish MessageBodyClientHttpResponseWrapper  Added missing copyright clause and fixed @since version.
Reduce boilerplate code.
Minor: Changed imports to get compiled
Fixing FirefoxBinary to json conversion
Categorize RejectedExecutionException in StateMachine
First pass at updating unmapped list for IBM
Added MSDN links
Remove redundant "else"
CAS-1377: Added integration tests
Cleaning up imports. No logical changes.
remove unused method
Use RLE block for constant values in OrcPageSource
Simplify a loop
If Driver creation fails, fail the query
TIKA-615 - Update the new parser to use AbstractParser
Remove another instance of extra socket close
server: Making a copy of capabilities object to prevent its modification if a user registers a custom driver provider with his own capabilities
Don't canonicalize ON criteria in Join analysis  Canonicalization of the ON criteria for Join will be handled by CanonicalizeExpressions optimizer in optimization phase later.
CAS-1377: Added integration tests
[java] Adding some debug trace to figure out why W3CRemoteDriverTest.shouldPreferMarionette fails on travis
Make failAbandonedQueries method more robust  When we fail the abandoned queries if for some reason an exception is thrown for a query the rest of the queries will not be processed. This change fixes that.
If Driver creation fails, fail the query
Export waiting time counters
Make `AbstractCapabilities` implement `toJson`  The capabilities subclasses were the only thing using `asMap` for serialisation to JSON. Everywhere else, we use `toJson`. Might as well make it consistent.
Deprecating the old HasTouchScreen too
Make methods private in ShowStatsRewrite where possible
Add requireNonNull to NamedTypeSignature constructor
Export waiting time counters
SimonStewart: Exceptions propagate up the stack  r13149
Split plan into fragments only at remote exchanges
Provide ConfigurationClass#toString implementation  For ease during debugging; prompted while fixing SPR-8761.
WW-2651 FileUploadInterceptor.java javadoc is not formatted correctly for Confluence snippets  Thanks to Matthieu Chase Heimer for the patch
Use the i18n strings from the correct package
Make i18n test a bit faster by opening the i18n url just once at the beginning   r4123
component-scan's scoped-proxy attribute applies to scope-annotated singleton beans as well (SPR-6683)
AbstractRequestLoggingFilter supports logging of request headers  Issue: SPR-14245
Remove STOMP relay integration test  The test was verifying that when a DISCONNECT frame is sent to the broker, there will be no further messages on the clientOutboundChannel.  This is generally true, however in some cases when the broker receives a DISCONNECT it may close its connection fast enough (before we do) in which case we send an ERROR message downstream to ensure the WebSocket side is cleaned up. Either way the downstream should be idempotent with regards to cleaning up sessions.
Clean up unused variable in BenchmarkArrayAggregation
AlexeiBarantsev: Cleaning out a test that was made common and moved to AlertsTest  r17869
If Driver creation fails, fail the query
Don't log stack trace for expected task failures
Tidy up getting headers in HttpMessage  This makes `getHeaders(String)` properly case-insensitive.
SimonStewart: Exceptions propagate up the stack  r13149
Javadocs for MissingBackpressureException (#1800)
Increase randomness in SocketUtils
Export waiting time counters
Followup to r1336516 Add Javadoc (as asked by sebb) and avoid looking up a volatile field twice
Missing @Test annotation  Signed-off-by: Simon Stewart <simon.m.stewart@gmail.com>
Make PagesIndex.clear() free memory
add log statement
add curly brackets (formatting)  - add curly brackets around single line conditional statements
No logical change: remove unused import
Fix the version ID for v5.6.10. (#29570)
SimonStewart: Removing some printlns  r12767
AlexeiBarantsev: Updating imports for Hamcrest 1.3  r17554
Avoid use of double constructor of BigDecimal  Codacy warns about an Error Prone [1] use of the double constructor of BigDecimal in tests. The reason given is that it is a source of precision loss if the number does not have an exact double representation. The recommendation is to use the String constructor of BigDecimal instead as it does not require using a lossy argument.  This commit contains the following changes:   - replace usage of the double constructor of BigDecimal with the    String constructor of BigDecimal in JdbcTemplateQueryTests  - update the copyright year   [1] http://errorprone.info/bugpattern/BigDecimalLiteralDouble  Issue: SPR-15077
Delete staging files in the background on startup
made package private
JasonLeyba: Use the JSON libraries to create the response string.    r7494
Enabled an ignored test, which didn't have to be ignored (the comment wasn't true anymore)
Extracts creating new instances into dedicated methods to allow override them
Use directExecutor().  Guava 18 deprecated sameThreadExecutor() and split the use case into two options: newDirectExecutorService() and directExecutor(). Use directExecutor() as we don't need ExecutorService#shutdown semantics and this has a positive performance impact.  Signed-off-by: Luke Inman-Semerau <luke.semerau@gmail.com>
Make PagesIndex.clear() free memory
fixed some tests that will now break because int/long can be treated as boolean.  May need to change again if real numbers get the same treatment.
Make PagesIndex.clear() free memory
#NAME?
ConcurrentModel.addAttribute javadoc: null value not supported  Issue: SPR-16831
Unignoring one more test in marionette, and fixing calls to deprecated methods.
CAS-1377: Added integration tests
remove infinite loop
Checksum aggregate function for decimail(p,s)  No product changes needed, added testing to prove it works.
fixed embedded database exception test
make key depend on context loader, so they don't get shared between apps
add support for "error" command in ShellSpout
Fix memory accounting in ParallelHashBuildOperator  Use same logic as for HashBuilderOperator
Remove another instance of extra socket close
Remove redundant "else"
DanielWagnerHall: Add null check  r9794
Split plan into fragments only at remote exchanges
Add test for combining @Controller with RouterFunctions  This commit adds a test for combining RouterFunctions with a @Controller.  Issue: SPR-15521
Let WindowsUtils.killPID() kill the whole process tree  Signed-off-by: Andreas Tolf Tolfsen <andreastt@opera.com>
CAS-1377: Added integration tests
[java] Adding some debug trace to figure out why W3CRemoteDriverTest.shouldPreferMarionette fails on travis
Removing @Test annotation from a nont-test method. It seems that nobody runs this test since 2012
KAFKA-8011: Fix for race condition causing concurrent modification exception (#6338)  In the RegexSourceIntegrationTest#testRegexMatchesTopicsAWhenCreated() and RegexSourceIntegrationTest#testRegexMatchesTopicsAWhenDeleted() a race condition exists where the ConsumerRebalanceListener in the test modifies the list of subscribed topics when the condition for the test success is comparing the same array instance against expected values.  This PR should fix this race condition by using a CopyOnWriteArrayList which guarantees safe traversal of the list even when a concurrent modification is happening.  Reviewers: Guozhang Wang <wangguoz@gmail.com>
Remove old and unused modalDialogTest references throughout code, and server xlator.  r3994
TikaCLI: add attachement extraction option
Avoid extra Block creation in map to json cast
Deprecating the old HasTouchScreen too
Neither Oracle nor IBm JREs support these new ciphers
Make `AbstractCapabilities` implement `toJson`  The capabilities subclasses were the only thing using `asMap` for serialisation to JSON. Everywhere else, we use `toJson`. Might as well make it consistent.
startWith(observable) marble diagram
Remove another instance of extra socket close
If Driver creation fails, fail the query
Remove parentheses around return values
OperatorDoOnRequest.ParentSubscriber should be static class
STORM-342: add exception as cause when re-thrown
Clean up unused variable in BenchmarkArrayAggregation
Provide ConfigurationClass#toString implementation  For ease during debugging; prompted while fixing SPR-8761.
Make REAL work in MAP
WW-3672: Wrong mime-type for csv media
2.x: Add marbles for Observable (12/06) (#5755)
Use RLE block for constant values in OrcPageSource
Write distributor status to response
WW-1699 added J2EE 5 compatibility to the StrutsMockServletContext  Contributor: Stepan Koltsov Reviewed By: Tom Schneider
Add union support to optimizer tests PlanBuilder
Include slice object overhead in size calculation
If a mimetype is handeld by a composite parser, report the underlying parser against the type (TIKA-1270)
Add documentation to NonReentrantLock
Remove @MVC test with multiple matches  RequestMappingHandlerMapping currently picks the first match and does have logic to deal with selecting the best match. This caused a random test failure depending on which controller method was matched first. This change removes the test.
SimonStewart: Removing an unused field  r14876
Missing @Test annotation  Signed-off-by: Simon Stewart <simon.m.stewart@gmail.com>
Fix table creation tests for Cassandra and Kafka
Ignoring IE6-only test failure for CSS
Use isEmpty() instead of size()==0, use StringBuilder instead of StringBuffer, use chained append() calls instead of string concatenation, add @Override annotations
Fix FatJarMain to use case insensitive env variables on Windows  Summary: Env variables are case insensitive on Windows, fixing `FatJarMain` to search for a variable ignoring the case.  Reviewed By: LLITCHEV  fbshipit-source-id: a43f2140f4
Polish DatabaseStartupValidator.afterPropertiesSet()
TIKA-153: Allow passing of files or memory buffers to parsers  Add hasFile() and hasLength() predicates to allow downstream code to avoid potentially expensive operations.
Property actually throws exception for no write method found  Issue: SPR-15507
Add test for combining @Controller with RouterFunctions  This commit adds a test for combining RouterFunctions with a @Controller.  Issue: SPR-15521
Used 'subscribeOn' instead of 'observeOn'
Fixing FirefoxBinary to json conversion
add curly brackets (formatting)  - add curly brackets around single line conditional statements
AlexeiBarantsev: Cleaning out a test that was made common and moved to AlertsTest  r17869
Defines a new constant to limit collection auto growth
Remove obsolete code
Fixed the tests in storm-starter that do not use the actual TupleImpl but mock everything themselves
modifying config for RAS example topology
Skip default Content-Length if Transfer-Encoding header has been set  Issue: SPR-15212
#NAME?
Remove STOMP relay integration test  The test was verifying that when a DISCONNECT frame is sent to the broker, there will be no further messages on the clientOutboundChannel.  This is generally true, however in some cases when the broker receives a DISCONNECT it may close its connection fast enough (before we do) in which case we send an ERROR message downstream to ensure the WebSocket side is cleaned up. Either way the downstream should be idempotent with regards to cleaning up sessions.
Remove unnecessary null check
[hotfix] Add Check for Keyed Operator in getInternalTimerService()
Restore method signature in ViewControllerRegistration  Issue: SPR-12016
Remove an unused import
Add a couple of right parens to JavaDoc ...  Summary: Just noticed a couple of mistakes, on my way to do something else  Test Plan: No changes to executable code  Reviewed By: styurin  fbshipit-source-id: 404e94d
Removed broken assertion from cypher doc tests
Gave the test class a better name.
Add test for combining @Controller with RouterFunctions  This commit adds a test for combining RouterFunctions with a @Controller.  Issue: SPR-15521
Delegate ComponentScanBDP environment to scanner  Enables @Profile filtering within ComponentScanBeanDefinitionParser
minor: added missing code for EXTENDS_CLAUSE token
KAFKA-4056: Kafka logs values of sensitive configs like passwords  In case of unknown configs, only list the name without the value  Author: Mickael Maison <mickael.maison@gmail.com>  Reviewers: Jaikiran, Gwen Shapira, Grant Henke, Ryan Pridgeon, Dustin Cote  Closes #1759 from mimaison/KAFKA-4056
Add ServerSentEvent#toString()
Added QueryStringEncoder.toString()
explain how to specify a keyspace
Removed useless code
Index Update Settings API does not update settings in real time, closes #1807.
2.x: Add exception message in SingleFromCallable (#4508)
remove infinite loop
Increase randomness in SocketUtils
OperatorDoOnRequest.ParentSubscriber should be static class
Replaced java6 treemap with OMVRBTreeMemory
Log view exception in DispatcherServlet  Issue: SPR-10340
Handle exceptions properly in SpringJUnit4ClassRunner  JUnit 4.9 introduced a regression in BlockJUnit4ClassRunner.runChild() such that exceptions thrown from methodBlock() cause the current test execution to abort immediately. As a result, the failing test method is unrooted, and subsequent test methods are never invoked. Furthermore, RunListeners registered with JUnit are not properly notified.  In conjunction with SPR-11908, SpringJUnit4ClassRunner was updated to use the aforementioned changes to BlockJUnit4ClassRunner.runChild(). Consequently, SpringJUnit4ClassRunner now suffers from the same regression.  This commit addresses this issue by ensuring that any exceptions thrown during the invocation of methodBlock() are properly wrapped in a JUnit Fail Statement.  Issue: SPR-12613
Log view exception in DispatcherServlet  Issue: SPR-10340
Initialize JNDI to fix failing Environment test  Issue: SPR-12223
[TEST] Plugin Manager  Undo removal of change.
Remove an unused import
Cleaning up unused imports.
Property actually throws exception for no write method found  Issue: SPR-15507
Since the address is exposed to sub-components, expose the port as well.
ExposeInvocationInterceptor declares itself as PriorityOrdered now  Issue: SPR-12351
Avoid use of double constructor of BigDecimal  Codacy warns about an Error Prone [1] use of the double constructor of BigDecimal in tests. The reason given is that it is a source of precision loss if the number does not have an exact double representation. The recommendation is to use the String constructor of BigDecimal instead as it does not require using a lossy argument.  This commit contains the following changes:   - replace usage of the double constructor of BigDecimal with the    String constructor of BigDecimal in JdbcTemplateQueryTests  - update the copyright year   [1] http://errorprone.info/bugpattern/BigDecimalLiteralDouble  Issue: SPR-15077
Handle exceptions properly in SpringJUnit4ClassRunner  JUnit 4.9 introduced a regression in BlockJUnit4ClassRunner.runChild() such that exceptions thrown from methodBlock() cause the current test execution to abort immediately. As a result, the failing test method is unrooted, and subsequent test methods are never invoked. Furthermore, RunListeners registered with JUnit are not properly notified.  In conjunction with SPR-11908, SpringJUnit4ClassRunner was updated to use the aforementioned changes to BlockJUnit4ClassRunner.runChild(). Consequently, SpringJUnit4ClassRunner now suffers from the same regression.  This commit addresses this issue by ensuring that any exceptions thrown during the invocation of methodBlock() are properly wrapped in a JUnit Fail Statement.  Issue: SPR-12613
Log view exception in DispatcherServlet  Issue: SPR-10340
fixed ambiguous reference to Entry type
Log view exception in DispatcherServlet  Issue: SPR-10340
Fix Sonar warnings : Move the "index.html" string literal on the left side of this string comparison. Move the "content" string literal on the left side of this string comparison.
Deleting unused imports.
Release DataBuffers in FreeMarkerView  When template processing throws an exception, we must ensure that `DataBuffers` are properly released to avoid memory leaks.  Issue: SPR-15966
Add test for combining @Controller with RouterFunctions  This commit adds a test for combining RouterFunctions with a @Controller.  Issue: SPR-15521
Cleaning up unused imports.
Use ArrayList instead of LinkedList
Remove unused import from o.e.c.h.MessageDigests
(ninja) use javax.annotation instead of avro
Bug 53782 - Enhance JavaSampler handling of JavaSamplerClient cleanup to use less memory Fix NPE in distributed tests Bugzilla Id: 53782
Issue #7723 static was removed from memory consumption counter.
Add a debounced 5 second delay to after-command GC  Summary: GC is run after a command to return memory to the system after long running commands.  If commands are invoked in quick succession, such as for queries invoked by scripts, the full GC may affect the latency of the next command being run.  This change schedules the after-command GC to happen after 5 seconds after the last command is run. If another command is run within that interval, the GC is further pushed back.  Test Plan: Run commands in quick succession, see that gc does not trigger via VM telemetry.  Reviewed By: illicitonion  fbshipit-source-id: 43f215c
Fixed Zip issue with infinite streams.
Remove Comment  This comment is no longer correct. 1420 was resolved.
Export waiting time counters
Mute NoMasterNodeIT.testNoMasterActionsWriteMasterBlock test (#39689)  Relates #39688
DouniaBerrada: Removing existing configurations in the UrlMapper when adding a new one.   r10041
Changed use of AssertThrows to @Test(expected = ...)
Fixed issue #3765 by creating a variable timeout based on TX size
Increase default cluster timeout for tests  Due to running tests in a heavily parallel fashion now, the timeout must increase. One test affected by this is:  CoreToCoreCopySnapshotIT     #shouldBeAbleToDownloadToNewInstanceAfterPruning
Improved error reporting to include the whole Exception stack trace, etc. in the Error SampleResult's responseData.
move unused code to src/test
Add javadocs to ProcessUtil
When creating an index, fail properly on classpath error
Tidy up getting headers in HttpMessage  This makes `getHeaders(String)` properly case-insensitive.
Add test for triggers which throw IRE  Patch by Sam Tunnicliffe; reviewed by brandonwilliams for CASSANDRA-9334
minor: added missing code for EXTENDS_CLAUSE token
Minor typo in exception message
Category methods need to be sorted properly so we apply the correct one.
Gave the test class a better name.
Remove XmlExpectationsHelper hard XML Unit requirement  Update XmlExpectationsHelper to use an inner class for XML Unit calls so that the XML Unit dependency remains optional.  Issue: SPR-15156
Fix for TIKA-2613 contributed by ewanmellor.  Change -psm on the Tesseract command line to --psm, with two dashes. This matches a change in Tesseract 4.0 to remove the one-dash version. It has been deprecated since Nov 2016.  The Tesseract cset is ee201e1f4.  Also, move the config file (i.e. getOutputType in Tika's terms) so that it is the last parameter on the command line.  Tesseract logs an error message (though otherwise doesn't fail) if the config file is not the last thing on the command line.
remove silly throws decl
Removed unnecessary warnings suppression
Forgot to remove import
Server HTTP protocol: fixed GET query command with nested elements that require an active connection
remove silly throws decl
added a test case and fix for http://issues.apache.org/activemq/browse/CAMEL-206
Handle exceptions properly in SpringJUnit4ClassRunner  JUnit 4.9 introduced a regression in BlockJUnit4ClassRunner.runChild() such that exceptions thrown from methodBlock() cause the current test execution to abort immediately. As a result, the failing test method is unrooted, and subsequent test methods are never invoked. Furthermore, RunListeners registered with JUnit are not properly notified.  In conjunction with SPR-11908, SpringJUnit4ClassRunner was updated to use the aforementioned changes to BlockJUnit4ClassRunner.runChild(). Consequently, SpringJUnit4ClassRunner now suffers from the same regression.  This commit addresses this issue by ensuring that any exceptions thrown during the invocation of methodBlock() are properly wrapped in a JUnit Fail Statement.  Issue: SPR-12613
Refactoring: moving an auxiliary class from the top level to inner class
Gave the test class a better name.
Gave the test class a better name.
NullPointerException when asking for null valued json field when fetching search request, closes #1749.
added setMetadataReaderFactory method
Ignores test while we are using the naive raft log
remove unused method
Re-enable some critical tests
switch to overall build number, set by Build All Java
Removed useless synchronized
Add javadocs to ProcessUtil
Restore method signature in ViewControllerRegistration  Issue: SPR-12016
Changed use of AssertThrows to @Test(expected = ...)
Defines a new constant to limit collection auto growth
More Servlet 3.1 Javadoc
Make the default constructor of CombinedChannelHandler protected
remove final for static methods
Remove explicit generic type arguments
Add nullable to AabBuilderStep.resolve  Reviewed By: jtorkkola  fbshipit-source-id: 93097707c4
When creating an index, fail properly on classpath error
KAFKA-4056: Kafka logs values of sensitive configs like passwords  In case of unknown configs, only list the name without the value  Author: Mickael Maison <mickael.maison@gmail.com>  Reviewers: Jaikiran, Gwen Shapira, Grant Henke, Ryan Pridgeon, Dustin Cote  Closes #1759 from mimaison/KAFKA-4056
Return NO_CONTENT instead of GONE when get results times out
Allows modify params on coping
Allows modify params on coping
Consider enum subclasses as simple value types as well  Issue: SPR-16278
CAS-1414: added missing final keywords
bump lucene version after backport
move unused code to src/test
Remove STOMP relay integration test  The test was verifying that when a DISCONNECT frame is sent to the broker, there will be no further messages on the clientOutboundChannel.  This is generally true, however in some cases when the broker receives a DISCONNECT it may close its connection fast enough (before we do) in which case we send an ERROR message downstream to ensure the WebSocket side is cleaned up. Either way the downstream should be idempotent with regards to cleaning up sessions.
Polish contribution  Closes gh-1292 Issue: SPR-15188
MipMapTest: added ui.act in render method
Rename test to match pattern, fix leaking statement.
remove infinite loop
better detailed message
[TEST] add mapping to MoreLikeThisActionTests to make sure doc mapper exists on all shards / nodes
Use ArrayList instead of LinkedList
Enabled an ignored test, which didn't have to be ignored (the comment wasn't true anymore)
[TEST] add mapping to MoreLikeThisActionTests to make sure doc mapper exists on all shards / nodes
Deprecate helpers.Format.
Add more field conveniences to Schema.Builder
update for: https://issues.apache.org/jira/browse/AMQ-4180 remove debug code
remove infinite loop
remove infinite loop
Analyzers are now specified by name, and service-loaded.  This fixes a security issue where we could otherwise run the class initializer and object constructors of arbitrary classes.
[TEST] add mapping to MoreLikeThisActionTests to make sure doc mapper exists on all shards / nodes
add concurrent sets to progressByHost (CASSANDRA-6129)
Call file.toURI().toURL() outside of the entry iteration loop.  It turns out that this sequence may end up stat'ing the jar, which can significantly slow things down. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=86990876
minor: added missing code for EXTENDS_CLAUSE token
2.x: Add exception message in SingleFromCallable (#4508)
Count full context transitions in statistics
Document default locale in MockHttpServletRequest  This commit updates the class-level Javadoc for MockHttpServletRequest with information regarding the default locale for the mocked server.  Issue: SPR-11701
Rephrased a note about when reltypes are actually persistent in underlying storage (changed from "created" to "persisted").
remove silly throws decl
Release DataBuffers in FreeMarkerView  When template processing throws an exception, we must ensure that `DataBuffers` are properly released to avoid memory leaks.  Issue: SPR-15966
Ignore non HTTP Samplers
Adds toString implementations
Retain the order the URLs were added in when calculating the result for getURLs()
