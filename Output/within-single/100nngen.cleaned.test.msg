Verify that @EnableIntegrationMBeanExport can set custom JMX domain    Add a test to JmxAutoConfigurationTests which verifies that  @EnableIntegrationMBeanExport can be used on a @Configuration class  to customize the default domain used for MBeans created by Spring  Integration. See https://jira.spring.io/browse/SPR-12128.    Closes gh-1451
Fix occasional Jetty test failures    Update `DefaultServletWebServerFactoryCustomizerTests` so that the Jetty  access log tests use the default timezone. Prior to this commit it was  possible that running the tests outside of UTC could result in Jetty  throwing a 'negative delay' IllegalArgumentException.    See gh-8819
Remove redundant @ConfigurationProperties annotation    See gh-7397
Update tests to look for snippets in correct location    See gh-23598
Update tests to look for snippets in correct location    See gh-23598
Allow RouterFunction parameterized with different types    This commit allows *any* type of `RouterFunction` to be injected in the  WebFlux.fn auto-configuration; previously the `RouterFunction<T>` would  restrict injected beans to a single parameterized type.    Doing requires using the `RouterFunction.andOther` method to collect  them.    Fixes gh-9181
Polish 'Avoid NPE in PropertyMappingContextCustomizer'    See gh-9914
Remove useless import
Refactor NettyWebServer with BlockingNettyContext    This commit leverages the new `BlockingNettyContext` in reactor-netty  and simplifies the server lifecycle management.    Closes gh-9698
Align test with change to exception in latest Framework snapshots
Polish 'Remove a redundant dash in TestPropertyValues.Type'    Closes gh-11156
Use non-blocking I/O for Docker API    This commit changes the NamedPipeSocket used for communication with  a local Docker daemon to use a non-blocking AsynchronousByteChannel  instead of a blocking RandomAccessFile, modeled after a similar  change to the docker-java project. This eliminates the potential for  a blocking call to hang indefinitely.    Fixes gh-21672
Remove start/stop integration test    This test is not useful in this context.    Closes gh-9889
Fix test broken by additional customizer    See gh-16498
Remove empty test    The caching behaviour when using ImportAutoConfiguration is covered  by tests in spring-boot-test-auto-configuration, specifically by  ImportsContextCustomizerFactoryWithAutoConfigurationTests.    See gh-7953
Remove unecessary Jackson dependency in trace filter
Rename TraceWebFilterAutoConfigurationTest    Rename TraceWebFilterAutoConfigurationTest to  TraceWebFilterAutoConfigurationTests
Remove v[N/A] log output
Assign on order to OnPropertyCondition    Closes gh-7144
Avoid double-reg when a Servlet or Filter implements ServletContextInitializer    See gh-4902
Fix JDK7 method order-dependent issues in SRCCT  SpringRunnerContextCacheTests suffers from JDK7-related non-determinism in values returned from Class#getDeclaredMethods(), which in turn affects JUnit and its execution of @Test methods.  This commit addresses this issue by introducing an OrderedMethodsSpringJUnit4ClassRunner that sorts the test methods alphabetically, which is actually required for SpringRunnerContextCacheTests to work properly.  Issue: SPR-9789
Fix accidental banner regression    Fix accidental regression introduced when I tweaked the updated  banner support (commit aaed87d1).    See gh-5636
Polish 'Add duration support for setConnectTimeout and setReadTimeout'    Closes gh-13355
Move AnsiOutputApplicationListenerTests    Move AnsiOutputApplicationListenerTests to the correct package.
Use currentHealth consistently in getHealth()    Closes gh-9832
Remove empty test    The caching behaviour when using ImportAutoConfiguration is covered  by tests in spring-boot-test-auto-configuration, specifically by  ImportsContextCustomizerFactoryWithAutoConfigurationTests.    See gh-7953
Use a random server port in the Couchbase sample\xe2\x80\x99s tests
Remove a test doing nothing    Closes gh-5673
Remove unused configuration map    Remove the configuration map defined in `GroovyTemplateProperties` which  isn't used. Ironically, that configuration map was exposed with the exact  same prefix as `GroovyMarkupConfigurer`, which broke IDEs support since  two entries had the exact same prefix.    Fixes gh-2840
Increase ESRestTestCase.waitForClusterStateUpdatesToFinish time out to 30s  It is set to 10 sec but sometimes it takes the cluster longer to settle.
make test more deterministic
remove duplicate rule which led to double scoring  r3344
GraalCompiler.emitLowLevel: prepend "LowLevel" to tier scopes.
Cache Skylark globals.  Summary: Previously all Skylark extension globals would be repeatedly setup for each individual extension file, which is wasteful, especially since some of that work is using reflection under the hood.  Reviewed By: styurin  fbshipit-source-id: 1d85b96
Fix comparison of double value with zero. #1555  Fixes `FloatingPointEquality` inspection violation.  Description: >Reports floating-point values being compared with an == or != operator. Floating point values are inherently inaccurate, and comparing them for exact equality is almost never the desired semantics. This inspection ignores comparisons with zero and infinity literals.
Add toString for HiveOutputTableHandle
test: also assert deprecation warning after clusters have been closed.
CAMEL-3905: Polished error message in camel-cache. Thanks to Piotr for the patch.
The use of Utils was there because the method was originally in the Utils class. Now that it is in TikaConfig, using TikaConfig is preferable.
set query cache to null
Improve Javadoc for ContextLoaderUtils  - class-level Javadoc now mentions application context initializers. - avoided and suppressed warnings in method-level Javadoc.  Issue: SPR-10232
Use SocketWrapper provided write method
Change tests in AbstractTestQueries  so that each group/join key correspond to multiple rows
CAMEL-11862: Added unit test
removed unused vars
CAMEL-5074: Improved javadoc
Clean up imports
InstrumentationTestLanguage:  support RootNode.getName()
Fixing a test, new mockito version is more accurate with null values.
TIKA-294: TikaCLI always uses System.in for input  Patch by Ken Krugler.
Clarifies in Javadocs that SpannerIO currently does not support streaming.
remove the index entry on oldColumn when new column is a tombstone patch by jbellis; reviewed by Sam Tunnicliffe for CASSANDRA-5395
Add test to check that plugin NamedWriteables are registerd with TransportClient
use slf4j api for logging
[java] Deleting unused imports
removed unused imports
Rename class CamelMvcRoutesEndpointTest to CamelRoutesMvcEndpointTest  Signed-off-by: Gregor Zurowski <gregor@zurowski.org>
snapshot path is accountId + volumeid
SimonStewart: Backing out change to the firefox driver test suite  r6128
DRILL-4159: Remove trailing space
removed filter for classes from the JPA providers package for EclipseLink (SPR-6040)
CAS-1386: Fix IV handling for ClearPass in clustered environments  Force lowercase of username in case-sensitive hashing
https://issues.apache.org/jira/browse/AMQ-6083 - ignore test scenario on leveldb store
Enable trace logging in CCR retention lease tests  These tests are failing somewhat mysteriously, indicating that when we renew retention leaess during a restore that our retention leases that we added before starting the restore suddenly do not exist. To make sense of this, this commit enables trace logging.
Removed useless import.
AbstractChannel: hashCode() now returns the channel's ID  Requested by @trustin  Signed-off-by: Cruz Julian Bishop <cruzjbishop@gmail.com>
Disabling deletion of all indices does not work when using _all, closes #1834.
mark the default static initializer as synthetic
Use SecuritySettings constants instead of hard-coded values
Fixed issue 343 with the patch by the issue reporter
Polish Javadoc for TestContext
Do not log on explicit no unsafe again  Motivation:  Users should not see a scary log message when Netty is initialized if Netty configuration explicitly disables unsafe. The log message that produces this warning was previously guarded but the guard was lost.  Modifications:  This commit brings back the guard against the scary log message if unsafe is explicitly disabled.  Result:  No log message is produced when unsafe is unavailable because Netty was told to not look for it.
Use privateGetPublicMethods() as it is simpler and more direct for this case
applied patch for CAMEL-105 from Aaron Crickenberger with thanks!
Simplify formatting in geo-IP test case  This commit cleans up the formatting in a geo-IP processor factory test case so that the code does not consume a silly number of lines.
Forgot to close the channel
Fix up checkstyle
Avoid extra Block creation in map to json cast
Improve parsing for line comments  Summary: Line comments must end in a line break, so enforce in their parser definition.  Reviewed By: IanChilds  fbshipit-source-id: 9e3f167443
add jmxPort to stress args (ninja)
CAMEL-12575:NPE on GET request with Content-Type header
Ensure that both statement and cursor are closed
MAHOUT-504: reworded error message in cluster mapper for clarity
remove duplicate code  Summary: Just remove duplicate code.  Test Plan: CI  Reviewed By: illicitonion  fbshipit-source-id: 36ff096
Fix GLFrameBuffer  Allows graphic card which supports GL_EXT_packed_depth_stencil to pack depth and stencil.
Make the parents/children methods return an empty set in case of no parents or children
CAMEL-6555 Removed the useless option setting
Remove unused method.  Reviewed By: jtorkkola  fbshipit-source-id: d1070349ca
Use requredRule instead of getRule when doing a cache lookup  Summary: When doing a cache lookup use requiredRule instead of getRule. requiredRule retrieve the buildRule. If no rules are associated with the target, compute it by transforming the TargetNode associated with this build target using the TargetNodeToBuildRuleTransformer associated with this instance.  Test Plan: `arc nano` and `buck build mode/iphonesimulator --distributed wilde`  ``` ~/local/buck/buck-out/gen/programs/buck.pex build --distributed -c cache.key_seed=${RANDOM} -c sandcastle.tenant_id=ruibm -c stampede.always_wait_for_remote_build_before_proceeding_locally=true --buck-binary ~/local/buck/buck-out/gen/programs/buck.pex stampede/example:stampede_folly_folly Parsing buck files: finished in 13.4 sec (100%) Creating action graph: finished in 2.2 sec (100%) StampedeId=[stampede3996288215093575337] Distributed Build: finished in 02:42.6 min (100%) local status: succeeded; remote status: finished_successfully, 2138/2138 jobs, 16.9% cache miss Downloaded 816 artifacts, 7.52 Mbytes Building: finished in 02:43.0 min (100%) 1942/1942 jobs, 1942 updated, 0.0% cache miss   Total time: 02:58.7 min ```  Reviewed By: ruibm  fbshipit-source-id: f1c38d3
Add io.netty.noJdkZlibEncoder system property  Related issue: #2821  Motivation:  There's no way for a user to change the default ZlibEncoder implementation.  It is already possible to change the default ZlibDecoder implementation.  Modification:  Add a new system property 'io.netty.noJdkZlibEncoder'.  Result:  A user can disable JDK ZlibEncoder, just like he or she can disable JDK ZlibDecoder.
Revert r1694715. Something isn't quite right. Revertiung until I figure out what I broke.
- Compatibility with Eclipse 3.2 (sort of, the flag doesn't mean the same thing, with the new one   doing some new unknown stuff).
Remove unused constant from AndroidLibraryDescription  Summary: Dead code  Reviewed By: cjhopman  fbshipit-source-id: a5171575c3
Logging the entire query string; crucial bit of logging   r3571
KAFKA-2813; selector doesn't close socket connection on non-IOExceptions  Patched Selector.poll() to close the connection on any exception.  Author: Jun Rao <junrao@gmail.com>  Reviewers: Guozhang Wang <wangguoz@gmail.com>, Gwen Shapira <cshapi@gmail.com>  Closes #501 from junrao/KAFKA-2813
bug 10422: accidentally removed the code for sourceTemplate id when the the volume is created out of template. Checking it in. status 10422: resolved fixed
#46 Date Type autodetection: test to reproduce error
beef up Javadoc
add NativeTransform test assertions
Use Comparator.comparing in EliminateCrossJoins
python: create parent dir for in-place binary  Test Plan: CI  Reviewed By: Coneko  fb-gh-sync-id: 53b9256
UnsafeArrayCopyNode: location identity must be ANY_LOCATION as it lowers to snippets containing nodes with ANY_LOCATION
Final sync with upstream master
Mute the 'arc focus' nudge when generating a Project View  Test Plan: `buck test //test/com/facebook/buck/ide/intellij/projectview && buck test //test/com/facebook/buck/ide/intellij`  fbshipit-source-id: c55e36e
Move a test that loads models to the itest directory
Refactor to use sqlVarbinaryHex in TestVarbinaryFunctions
Don't clear down thread counts at end of test
Fix https://bz.apache.org/bugzilla/show_bug.cgi?id=57837 Add text/css to the default for compressableMimeType
Replace getRuleOptionalWithType..addToIndex with computeIfAbsent in CxxInferEnhancer  Summary: This fixes potentiall race conditions when constructing action graph in parallel.  Also inlined some now trivial functions.  Test Plan: CI  fbshipit-source-id: c52ea80
Add a random date within a specific date range function : Fix checkstyle File does not end with a newline
Fixed broken link in ParDo JavaDoc.  ----Release Notes----  [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=92196092
added a CharSequence#getAt method to avoid ambigouty problems
Add more information to asserts and assert on the result of refresh.
Add an NPE guard
Camel-AWS EC2: Change Producer error messages
minor: added missing code for EXTENDS_CLAUSE token
Null check list before hiding.
Issue #1555: Remove usage of obsolete junit.framework.Assert  Fixes `UseOfObsoleteAssert` inspection violations.  Description: >Reports any calls to methods from the junit.framework.Assert class. This class is obsolete and the calls can be replaced by calls to methods from the org.junit.Assert class.
Add informative Instant formatter to BoundedWindow
Remove pointless Javadoc that replaced the far more useful Javadoc from the Interface
Forgot clearGui() for this element
Updated the documentation for the find method: returns null if no element matches and respecting the order of the collections iterator
Reduced sleep interval to poll for closed output channels
Adds missing bit from the original CLVM patch 263216caa5b548099451f669fae918ed63608fd7 (https://reviews.apache.org/r/6470/) regarding 'patchDisk' in createPatchVbd. This same patch should apply cleanly to both master and 4.0 branches  RB: https://reviews.apache.org/r/6615/ Send-by: shadowsor@gmail.com
@Scope is now allowed on methods (for use in conjunction with @Bean)
Set LowResourcesMaxIdleTime in Grid to avoid timeout of 'forever'. Fixes issue 6770.
https://issues.apache.org/jira/browse/AMQ-4118 - polish test
CLOUDSTACK-2923: Delete Secondary storage of a Zone was giving NPE bcz we were still refering to the object. Instead log that the cpvm and ssvm cant be created bcz sec storage is not available
v4: fix generated attribute name for wildcards (_track__wild instead of _track_.)  [git-p4: depot-paths = "//depot/code/antlr4/main/": change = 9390]
#NAME?
Attempt at fixing the flaky AndroidXmlFileIntegrationTest.  Summary: `AndroidXmlFileIntegrationTest` fails once in a while with this stack trace: ``` FAIL  20.0s  4 Passed   1 Failed   com.facebook.buck.android.AndroidXmlFileIntegrationTest FAILURE testRenamingAStringBuildsAllRules: There was no build log entry for target //java/com/sample/lib:lib java.lang.AssertionError: There was no build log entry for target //java/com/sample/lib:lib         at org.junit.Assert.fail(Assert.java:88)         at com.facebook.buck.testutil.integration.BuckBuildLog.getLogEntryOrFail(BuckBuildLog.java:132)         at com.facebook.buck.testutil.integration.BuckBuildLog.assertTargetBuiltLocally(BuckBuildLog.java:69)         at com.facebook.buck.android.AndroidXmlFileIntegrationTest.testRenamingAStringBuildsAllRules(AndroidXmlFileIntegrationTest.java:117)         at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)         at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57)         at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)         at java.lang.reflect.Method.invoke(Method.java:606)         at org.junit.runners.model.FrameworkMethod$1.runReflectiveCall(FrameworkMethod.java:47)         at org.junit.internal.runners.model.ReflectiveCallable.run(ReflectiveCallable.java:12)         at org.junit.runners.model.FrameworkMethod.invokeExplosively(FrameworkMethod.java:44)         at org.junit.internal.runners.statements.InvokeMethod.evaluate(InvokeMethod.java:17)         at org.junit.internal.runners.statements.RunBefores.evaluate(RunBefores.java:26)         at org.junit.rules.ExternalResource$1.evaluate(ExternalResource.java:48)         at org.junit.rules.RunRules.evaluate(RunRules.java:20)         at com.facebook.buck.junit.BuckBlockJUnit4ClassRunner$SameThreadFailOnTimeout$1.call(BuckBlockJUnit4ClassRunner.java:118)         at com.facebook.buck.junit.BuckBlockJUnit4ClassRunner$SameThreadFailOnTimeout$1.call(BuckBlockJUnit4ClassRunner.java:114)         at java.util.concurrent.FutureTask.run(FutureTask.java:262)         at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145)         at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615)         at java.lang.Thread.run(Thread.java:744)  ====STANDARD ERR==== close failed in file object destructor: sys.excepthook is missing lost sys.stderr ```  I believe this is because `JavaUtilsLoggingBuildListener` doesn't flush the log contents. This diff changes that.  Test Plan: Run `buck clean && buck test --all` a bunch of times and verify the test never fails.
added NullResultPrinter to suppress the output
Ensure provided temp data store is started
SPR-5986 - Error in pointing links about versions for documentation and content
Make getLogFilePath() public  Summary: We need to make this method public since we're implementing a way to upload logs to a internal infrastructure when a command is done.  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: e5894ca
Fix test broken by update to encoding. Generally, it is far too difficult to re-encode characters that were encoded in the original URKL when they didn't need to be.
[BEAM-282] Remove the RunnableOnService from testPassThroughThenCleanupExecuted()
Describing the purpose of debugger's tags
2.x: Expand the documentation of the Flowable.lift() operator (#5863)
Get these tests passing on my Mac
Refactor: rename.
Akka phi accrual failure detector config.  Marked internal, defaults and descriptions copied over from Akka config.
MINOR: Put state args in correct order named repartition test (#6114)  Another system test that needs to be updated with states in the correct order  Reviewers: Guozhang Wang <wangguoz@gmail.com>
Limited default fetch plan when load a user/role (users could attach arbitrary records to OUser and ORole)
it's not possible in new groovy to get a method closure from a property. See MetaClass:621
set correct info message
Attach cause to ComException on Client.start  This is to enable more investigation of a rare flaky failure of IndexOperationsIT.
updated javadoc on arrayutil
Fixed java client's serialization of NetworkConnection. (#3125)
Add toString to OperatorContext
Bind protocol version to V3  When for some reason Cassandra cluster hasn't manage to report the actual supported version of the protocol, driver selects the most recent V4 protocol, which is not supported by the 2.1 version of Cassandra. Former version of DataStax driver has been swallowing this exception, what then lead to NoHostAvailableException, and intermittent hangs.
Fix failures in testAllOpenSSLCiphersMapped() after changes to how unit test reports cipher names in r1615205 Start to fix testOpenSSLCipherAvailability() but more work required
Retry Unit Test from #879  From https://github.com/Netflix/RxJava/issues/879
Remove pseudo-dependency to zlib for jniplatforms
Remove @Beta from Strings.common{Pre,Suf}fix. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=31180208
Javadocs for cache operator
Remove tests rendered unnecessary when context.xml files were moved from appBase to configBase
In JdbcAdapterTest, remember to release lock if updates yield an exception
Add some tests for annotation values of type Class  Summary: (Reapplying this commit after the stack was reverted; this commit was not related to the failure.)  `StubJar` is going to be gaining the ability to generate stub jars based on `TypeElement`s.  This commit closes some test holes. No bugs found, but good to have the coverage.  Test Plan: New unit tests  Reviewed By: asp2insp  fbshipit-source-id: 4638e1d
Adjust Lucene version for 6.7  Relates #37088
Improve error message  Issue: SPR-16214
Remove unthrown Exception
Automated g4 rollback of changelist 65602026.  *** Reason for rollback ***  This commit caused several test failures, so rollback until a forward-fix can be integrated.  *** Original change description ***  Remove the callAllGets 'feature' of CombinedFuture.  This should only be necessary for buggy future implementation. *** ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=65624847
Size BlockBuilder appropriately in array_remove  Previously we allocated one row worth of space per byte of retained input
Fix CID 1114611 Check the right variable
comment use of synchronization in BytecodeParser.maybeEagerlyResolve
Memoize target platform in PerBuildStateFactory  Reviewed By: bobyangyf  fbshipit-source-id: 79026701d6
User suggested patch for MorphaAnnotator
[TEST] RecoveryWithConcurrentIndexing test (#40733)  Due to https://github.com/elastic/elasticsearch/issues/40731
Inserted an empty line
Clean up docs in By  Hand-applying most of the changes from #5714 because the merge isn't automatic after previous cleanups.  Thanks to User253489 for the changes.
Clean up warnings in Gradle build output
No logical changes: remove unused import
Clean-up post init/destroy lifecycle refactoring Allow Loader objects to be restarted
Don't create ABIs from source if postprocessing classes  Summary: A postprocessing step might modify the class files, rendering a source-based ABI incorrect.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: a7a774f
Remove @deprecation keyword on AbstractUnsafe.ensureOpen(...)  Motivation:  e84567004324c0bfd04b0ca9e1e182ed89394b16 marked AbstractUnsafe.ensureOpen(...) as deprecated for no reason.  Modifications:  Remove `@deprecation`  Result:  Remove incorrect annotation
template, api: fix format desc, add OVA format  Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>  This closes #331  (cherry picked from commit 666263e84de3959866592ed68010b394d36229a2) Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>
Differentiate between the top and non-top FrameState bci when computing BytecodePositionWithId.
Try to fix string. SVN seems to swallow the comment sometimes...
Limit jackson leakage to annotations  ----Release Notes----  [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=93775397
make CompositesIndex.IndexEntry static to reduce footprint
Fixed Javadoc of LifeCycleAwareChannelHandler * Some handlers (e.g. SslHandler, ZlibEncoder) need to store its context somewhere, and they needed to implement both beforeAdd() and channelOpen() because beforeAdd() is not called if pipeline is not attached.  This led to code duplication.  To address this issue, ChannelPipeline now always calls the life cycle listeners whether it is attached or not
GROOVY-4062: Add getBytes to InputStream, URL and File (patch thanks to jeremi Joslin) GROOVY-2945: Binary counterpart to setText(File, String)
CLOUDSTACK-9905:VPN Gateway with Public Subnet
Allows empty string as a action name
Test file loading
https://issues.apache.org/jira/browse/AMQ-5605  Attempt to resolve high CPU usage after error by ensuring that the transport is disposed along with the fire of the local error.
KristianRosenvold: Now also compiles  r13642
Make TypedSize.getEstimatedSize more accurate  Previously we excluded the size of the instance itself, which is significant since this is used in grouped aggregations. Also, we only included the logical size of the BlockBuilder rather than the full retained size
Record both stacktraces in case of IllegalStateException
improve failover transport failure message to include client port, which makes will make it easier to debug things in multi-connection clients
better exception message when failing to parse a specific field
remove the listnetwork, which causes mgt server uses 100% cpu, if you have 600 records in networks table
[Test] Fix InternalStatsTests  After recent changes in InternalStats#doXContentBody the corresponding xContent output of the parsed aggregation needed to be changed in a similar way.
JTTTest: add optional 'bind' and 'noProfile' parameters
Make timer run as daemon  so it doesn't prevent normal shutdown by exiting from main().
Test: add document indexing back to testCancellationCleansTempFiles   It was lost during a merge conflict in 796aa5c3fe2424390a8edee604cd292b8afdf514
Added default RMI name of the shell to reflect the default name of the shell client. Out of the box experience is important.
fixed a bug found by Ronald Garret. clone() method needs to instantiate the parser. peter
Show warning about invalid jarfiles if --verbose is used
Remove deprecated code
Review of r1457429: Make logic more clear. No functional change.
Rename to fit expected naming convention
Refactor provider lookup in RecordSinkManager
Revert: [buildengine][easy] SupportsInputBasedRuleKey.isSupported to accept BuildEngineAction  Summary: This reverts commit [buildengine][easy] SupportsInputBasedRuleKey.isSupported to accept BuildEngineAction.  fbshipit-source-id: f7182cef69
Remove pointless Javadoc block
Add test to assert that preconditions are met before moving on to the rest of the checks.
Make RegexLanguage public so its options are exposed by launchers
Fixed issue on deletion of null records
Pass context to all methods in case needed later Use same order of saving as superclass
Remove unused variable
bug 7950: removed IPAssoc usage events for system account status 7950: resolved fixed
Remove spaces.
Fixed CS for Camel-test
Standalone runner expects path.home to be set  With elasticsearch 2.0, `path.home` must be set now. Standalone Runner (test) is using elasticsearch CLI which relies on `Environment` to be set.  It produces now:  ``` Exception in thread "main" java.lang.IllegalStateException: path.home is not configured     at org.elasticsearch.env.Environment.<init>(Environment.java:99)     at org.elasticsearch.node.internal.InternalSettingsPreparer.prepareEnvironment(InternalSettingsPreparer.java:85)     at org.elasticsearch.common.cli.CliTool.<init>(CliTool.java:107)     at org.elasticsearch.common.cli.CliTool.<init>(CliTool.java:100)     at org.elasticsearch.index.mapper.attachment.test.standalone.StandaloneRunner.<init>(StandaloneRunner.java:170)     at org.elasticsearch.index.mapper.attachment.test.standalone.StandaloneRunner.main(StandaloneRunner.java:175)     at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)     at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57)     at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)     at java.lang.reflect.Method.invoke(Method.java:606)     at com.intellij.rt.execution.application.AppMain.main(AppMain.java:140) ```  Closes #167.
Switch buck project default to not build targets unless --build is defined  Summary: Building all modules when doing buck proejct is not a good decision in retrospect. If one wants to see generated code, they are better off building the modules they need and not waiting for all of them in the wrong moment. The solution is just flipping the default, and requiring someone to add `--build` when they want this. I kept the original flag to now break people's commands in the meantime.  Test Plan: Run `buck project <target>` with and without --build, see that nothing is built without `--build` mentioned.  fbshipit-source-id: a9fe298
CAMEL-9965: Add javadoc about streaming problem
made it easier to reuse the CamelResourceConfig class
Relaxing protection on buildOption so subclasses can use it
CAMEL-9118: camel-pgevent, use pg_notify for sending notifications with postgres verion 9 and above. Thanks to James Lindstorff for the patch.
IndexProxy extends IndexConfigProvider  ... instead of defining it's own indexConfig() method.
additional Boxing tests
Applied patch from Tom Vijlbrief for AMQ-724
Camel-Hazelcast Kubernetes example: removed deprecated method usage
wrote a test to answer question on mailing list, shows wildcard subscription with STOMP
Keep metaclass changes in built script instances
Show file encoding
Ensure all reasons for stopping the test are logged
Fixed issue #49 about Prepared statement. Now OrientDB supports two syntaxes: 1) select from Profile where name = ? and surname = ? 2) select from Profile where name = :name and surname = :surname  Where:  1) is bound by position of arguments 2) is bound by argument names (map)
add @Override annotation
CLOUDSTACK-8911: VM start job got stuck in loop looking for suitable host
A little tuning using AtomicLong instead of synchronized method when generating an unique id
Clean up imports
Only wait 1 second for connections to stop. When killing a stale  connection - if stop doesn't complete - it hangs the broker.
SimonStewart: Removing the deprecated desired config for the htmlunit driver with js  r14895
Remove shameful System.out.println
Avoid NPE when doing CFS.scrubDataDirectories
Increase size of response that is written and reduce data read before client drops the connection in an attempt to get this test passing with APR in Gump. Currently the entire reponse is written (and buffered somewhere in the network stack) before the client drops the connection.
[hotfix] Reduce string concatenations in ExecutionVertex
Fixed db upgrade issue for 229-2210 firewall rules
[FLINK-2604] [runtime] Adds synchronization to stop method of ZooKeeperLeaderElectionService
Acquire read lock before accessing guarded map  Summary: Infer flagged this up as missing lock  Test Plan: CI  Reviewed By: marcinkosiba  fbshipit-source-id: 66d88d2
Removed routingSlip headerName attribute in the Spring XML as its not been used at all.
Reduce call site of ExpressionAnalyzer.analyzeExpressions
reuse a shared UrlPathHelper instance in order to avoid reinstantiation overhead (SPR-7269)
AbstractChannel: hashCode() now returns the channel's ID  Requested by @trustin  Signed-off-by: Cruz Julian Bishop <cruzjbishop@gmail.com>
remove unused import because of the previous pushed commit
Unused import removed
more scan tests to try and recreate the context missing failure, no luck yet...
The withMimeType method is obsolete. Use the Builder's mimeType one.
Fix JDK7 method order-dependent issues in SRCCT  SpringRunnerContextCacheTests suffers from JDK7-related non-determinism in values returned from Class#getDeclaredMethods(), which in turn affects JUnit and its execution of @Test methods.  This commit addresses this issue by introducing an OrderedMethodsSpringJUnit4ClassRunner that sorts the test methods alphabetically, which is actually required for SpringRunnerContextCacheTests to work properly.  Issue: SPR-9789
CLOUDSTACK-316: if public network is not specified, set to guest network
Add missing compilation final dimension to successor array in LLVMTerminatorNode
Remove isFinishing check when calling back to activities  We decided it's sufficient for the callback to be safe as long as the caller unsubscribes in onDestroy
CLOUDSTACK-7348 InvalidParameter Exception while executing scale vm.  We do not throw the exceptions any more, so added info in the logs to say what happend to this command.  Signed-off-by: Rajani Karuturi <rajanikaruturi@gmail.com>
Add version info to deprecation markers
Remove @author tag - it should have been removed in the original commit
Corrected package and some imports in CppTarget.java.
DouniaBerrada: Adding exception for cases where the JS did not finish executing.  r15562
Camel-Kafka: Schema Registry docs modified
update slow test for ssplit changes
AwaitsFix GeoShapeQueryTests#testPointsOnly #27454
Fixed ActorGestureListener pan and zoom for rotation and scale.  closes #3157
Use ImmutableMap instead of LinkedHashMap
c* uses commons-lang3, not commons-lang
GROOVY-9080: MarkupTemplateEngine uses invalid XML entity for escaping double quotes
Remove code highlighted as unused by UCDetector
Mute FilterAggregatorTests#testRandom  Relates #37743
Remove unnecessary check for boolean  `musics.get(i).wasPlaying` is a boolean value, no need to use `== true` to check it.
Correctly release message in MemcacheClientHandler that is used in the memcache example. (#8119)  Motivation:  MemcacheClientHandler.channelRead(...) need to release the frame after it prints out its content to not introduce a memory leak.  Modifications:  Call release() on the frame.  Result:  Example has no leak any more.
Added Kafka Topic as Stream ID for emitted tuples
Add @Override markers
Unmute test after fix  Original commit: elastic/x-pack-elasticsearch@cceb3e723726b8db1d0e565c488bf88ebb69d520
Issue #3731: expand documentation on METHOD_REF token
CLOUDSTACK-3351: Fix add cluster API to set right hypervisor type  Signed-off-by: Abhinandan Prateek <aprateek@apache.org>
Made server startup timeout test use platform-specific directory separators
Add a system property that disables Javassist
Record "started" counter for queries that fail to parse  In the last release we started tracking parsing failures for error categorization, but the change was missing the call to increment the started counter.  As a result, the started and completed counters get permanently out of sync and cause the number of running queries to be reported as 0.
Make sure to call destroy() on close  AircompressorDecompressor::destroy() is a nop, so for now this is not a problem, but destroy() returns codecs to the pool for HadoopDecompressors so it has to be called to prevent leaks.
remove mention of old maintenance mode setting
added missing artifact call that would add the file to cache  Summary: AndroidAppModularity needed to record the artifact output of the file so it would be saved by the cache. This has been fixed.  Test Plan: verified cache  Reviewed By: asp2insp  fbshipit-source-id: 55cdfa4
Better naming, and new test  ... using to compare 0.19 and 0.20 so want in both.
add more context to canonicalization error
Make TokenVocabParser fields `protected final`
PropertySourcesPropertyResolver provides logKeyFound template method  Issue: SPR-14370
add auditing support to saml2 for responses
TIKA-89: Rename MimeType and MimeTypes  Keep media type parameters in an unmodifiable sorted map.
pass the right settings to the listener
Throw UOE from compressible bytes stream reset  A compressible bytes output stream is a stream output which supports a reset method. However, compressible bytes output streams are unusual in that the current implementation sometimes supports a reset (if the stream is not compressed) and sometimes does not support a rest (if the stream is compressed). This inconsistent behavior is puzzling and instead we should simply always throw an unsupported operation exception.  Relates #27564
Remove unused getProgress method from OrcRecordReader
Depend on EnglishGrammaticalRelations
Removed debug println
fixes issue for locating newly installed chrome versions  Signed-off-by: Luke Inman-Semerau <luke.semerau@gmail.com>
Fix javadoc to correctly explain how ChannelDuplexHandler.deregister(...) works. (#8577)  Motivation:  We had an error in the javadoc which was most likely caused by copy and paste.  Modifications:  Fix javadoc.  Result:  Correct javadoc.
include all mode setting messages at debug level
Remove empty line
Make MasterClient connection errors be logged as debug instead of info  They are rather low-level, benign, and have little context attached. They sound scary, but people should really not worry about them.
Specify constant-time behavior for HashCode.equals(). ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=92925537
Remove unused import from o.e.c.h.MessageDigests
use high transport type when sending the cluster state
Increase the test timeout for PageCacheTest#rewindâ¦
Add missing license file to ThreadPoolTypeSettingsValidatorTests.java
bumps version to stable 3.0.0m1 for release
fixed the CS error
SimonStewart: Deprecating setSelected and toggle on WebElement  r12457
[hotfix] Improve ParameterTool exception  This closes #2057
https://issues.apache.org/jira/browse/AMQ-4118 - polish test
Add to test Groovy675_Bug.groovy
Add license header to Maps
Push for eu-west-2 issue
project: support expanding location macros  Summary: Previously, we'd fail when seeing macros in linker flags.  This now properly expands them in project generation.  Test Plan: working on testing locally...  Reviewed By: dinhviethoa  fbshipit-source-id: 39c24f0
Remove unused import
Fix error messages in `Parser` to use unix-style paths  Summary: This adds consistency in how we talk about paths.  Test Plan: `ant test -D"test.class"="ParserTest"` now passes on Windows
Correctly determine if DoFn has an anonymous class in ParDo
Use RestToXContentListener in painless execute action rest action. (#39638)
Minor: fixed wrong message on different protocol version
Add version 6.0.0-rc1
CAMEL-4444: What a cool jira number :). Fixed issue with doneFile option on FTP component. Thanks to Olivier for the patch.
Mute ShrinkIndexIT.testCreateShrinkIndexToN on Windows  Relates: #33857
JsFile: Use SourcePathResolver to look up paths  Summary: This enables killing the getPathToOutput method.  Test Plan: CI  Reviewed By: plamenko  fbshipit-source-id: ca155af
bug 13023: fixed listAccounts to return all accounts the user is authorized to see status 13023: resolved fixed
Add Lookup resolution to the PlanNodeSearcher
enables old lucene operator until all will be migrated
beef up Javadoc
Trim parameter names in TypeSignature parser
fixed missing import resulting from merging with master
always use the max score across the shards in suggest response
Add utility method to get the latest version of the previous minor
Export waiting time counters
Use selenum.defaultBrowser if one is specified   r5416
Forwarding Enter key char in Lwjgl3Input
adjusting the DocsGenerator
Removed unused imports
Split plan into fragments only at remote exchanges
use the name of the configuration variable rather than the name of the command
Remove ineffective assert statement.
Annotate Http2ServerDowngrader with @UnstableApi  Motivation:  Everything in the http2 package should be considered unstable for now  Modifications:  Add missing annotation on Http2ServerDowngrader  Result:  Clearly mark class as unstable.
Log uncaught exceptions from scheduled once tasks  `ScheduledThreadPoolExecutor` allows you to schedule tasks to run once or periodically at the future. If such a task throws an exception, that exception is caught and reported in the future that `ScheduledThreadPoolExecutor#schedule` returns. However, we typically do not capture the future / do not test it for errors. This results in exception being swallowed and not reported. To mitigate this we now wrap any command in a LoggingRunnable  (already used for periodic tasks).  Also, RunnableCommand is changed not to swallow exception but percolate them further for reporting by the future.  Closes #15824
New OrientGraphFactory.drop() method
Revert "Exploit DiscoveryNode immutability..."  This reverts commit e76038e076bb66fd4deac62cd8f2ffd9d423cea6.
Added test case for property MAX
Updated Javadoc: date format patterns SPR-17366
WW-1317   - changes in javadoc (uses dojo tooltip attributes as example)
Add unit test for loopsSimulateTailRecursion
Compile on Java8. Fixes #2149
The NIO connector is hard-coded to use the JSSE SSL implementation so just use it directly. This patch allows the JSSE dependency in the SSL abstraction to be removed (this will be in a later patch).
increase time out to make linux build pass on a slow machine  r3298
Relaxed procedure existence check on Oracle (for non-exposed synonyms)  Issue: SPR-16478
Add test case for [CALCITE-685]  Currently throws AssertionError: "Correlation variable $cor0 should be defined" in EnumerableRelImplementor.getCorrelVariableGetter.
MINOR: Print offset and size in sendFetches  Author: Guozhang Wang <wangguoz@gmail.com>  Reviewers: Jason Gustafson <jason@confluent.io>  Closes #3063 from guozhangwang/KMinor-more-logging-in-fetcher
[hotfix][tests] Make SynchronousCheckpointTest create StreamTask instance in the main task's thread
Revert "Summary: Use hypervisor as clock source for system vms"  removing due to CLOUDSTACK-2872, ubuntu 12.04's libvirt isn't new enough  This reverts commit c7ebcb4e8c287ae88d2f6e6d71cc536612a5e635.
PR comment: Correct validate query for GenericNativeIndexReader  It does support composite queries.
Remove unused items
push down btree keyEnd fetching to where it's needed"
Issue #2604: Refactoring of SingleLineJavadoc to resolve LocalVariableName violation
Camel-AWS: Lets use AbstractAWSKMS in the AWS KMS Client Mock for tests
Avoided to format message if log debug is disabled
Removed useless import.
Minor: Removed dump of distributed exception in any case
minor improvement in object creation
Remove last reference to ServerFactory
Created a copy of listener to avoid concurrent modification exception
Add additional comment on data block sizes properties evaluation lifecycle. Remove old not used method.
improved report for failing tests
Switch the AJP connector to NIO by default too
Remove build description from ConfigSettingDescription  Summary: No longer needed.  Reviewed By: ttsugriy  fbshipit-source-id: a6620d297b
Also display tool-tip for the label
Log the unsanitized redirect URL to facilitate abuse investigations.
Update SDK to correctly set replaceJobId on the Job.  ----Release Notes---- Update SDK to correctly set replaceJobId on the Job instead of the Create request.  [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=99302893
GROOVY-5146: Improve javadoc for VariableExpression
Register all the installed file system providers at image build time.
HHH-3712 : correct SQLServerDialect to extend AbstractTransactSQLDialect
[hotfix] Correct preconditions check in TypeExtractor#getBinaryOperatorReturnType
Use ConcurrentHashMap instead of HashMap with sync.
Ensure CachingBuildEngine uses a ConcurrentHashMap for buildInfoStores  Summary: BuildInfoStores depends on computeIfAbsent being called exactly once for each key, which isn't guaranteed by ConcurrentMap.  From reading the guava source, newConcurrentMap should be returning a ConcurrentHashMap anyways, so this probably doesn't cause any problems "in practice", but it's better to be explicit that this behavior is desired.  Test Plan: local builds, CI  Reviewed By: marcinkosiba  fbshipit-source-id: 6cbd0bb
WW-2800 Added setters for response, request and context.
use stream instead of iterator to simplify logic a bit
temp added ignore on 2 new failing tests until time to investigate
Better check for classes that must not be initialized during image generation
Make FixedWidthBlockBuilder.getSizeInBytes() more accurate  Previously we included the full capacity of the sliceOutput and valueIsNull buffers, even if they were empty
Adds license header
CAS-1422 SamlUtils Should Restrict DocType Declaration and Entities via Feature Disabling
Update FPSLogger to use nanoTime.   "currentTimeMillsis" pulls time from the system clock and should not be used to measure elapsed time. Other processes like NTP, or the user, can alter the system clock and the time returned can unexpectedly shift and create bizarre and intermittent behavior.  "nanoTime" is a measure of nanoseconds from some arbitrary time point and is safe for measuring elapsed time.  The results of this bug are rather benign â worst case the time is changed back and you would not get a framerate log message for that time, or until the user restarts the program. However, this flavor of bug can cause significant intermittent issues if present in other areas if the user is unfortunate enough to have his clock changed while he is playing (this happens more than you may think thanks to NTP keeping our system clocks in sync.)  See:  http://docs.oracle.com/javase/7/docs/api/java/lang/System.html#nanoTime%28%29 http://docs.oracle.com/javase/7/docs/api/java/lang/System.html#currentTimeMillis%28%29
add the exception as well to the logging
Make field STANDARD_ESCAPES final
[TEST] Verify the flush reponse
tidied up the debugging code
Fixing use of deprecated method
Remove duplicated code
Add split level selection stats
guard against npe on error condition
make scheduler more quiet in DEBUG mode as its default polls twice per sec.
[hotfix] Suppress restarts if rescaling operation fails
Adding El Capitan (OS X 10.11) to Platform  Signed-off-by: Daniel Davison <daniel.jj.davison@gmail.com>
change to avoid NPEs
support overriding default port by means of the selenium.port property  r3425
Fix usage of @type:"d" in JSON from queries to determine embedded element type
[TEST] Turn off double write check for restore
add iterator based on specific index
Allow message send to finish before shutting down the executor
add term filter toString
updated the VerticalPanel to allow different background peter
javadocs: add "since" reminder; minor text changes
Avoid using deprecated methods in StringEncoder
OptionProcessor needs to find the type parameter of an OptionValue field declaration
Fix logic error that meant that unpackWARs was ignored if a WAR failed to deploy (since the Context is an instance of FailedContext in that case)
Support Unicode escape sequences in JavaUnicodeInputStream with indirection (multiple 'u' characters) (fixes #287)
Re-enabled HATxTest  test
Fix query started accounting with failed queries
added missing linebreak
Use a different separator in `Wid`  `#` is a reserved character in the URL spec and must be escaped to be used. This change uses `-` instead.  Fixes: elastic/elasticsearch#467  Original commit: elastic/x-pack-elasticsearch@a75eb89cb8f5d34dc0a881df543c96ef89489619
Added Troy's suggestion that we set properties on a non-Script derived script
cleanup imports, fixup compilation tentative
Removed an unused import
CLOUDSTACK-8656: reorganise sychronized block
Allow signal handler to be uninstalled separately from the shutdown hook
Deprecate unused methods  I doubt these methods will ever be useful, so deprecate them before possible removal.
Skipped tests not capable running on CI servers.
Fixed computing space glyph when a font has no space glyph and padding is used.
better exception message
Fixed Coverity Issue: Unintentional Integer FLow
Parallel native index population enabled by default
Whitelist org.graalvm.compiler.options.OptionType in LazyInitializationTest
CAMEL-8763: Default error handler should use default redelivery delay of 1 sec
Make it simpler to determine which version of state was used to calculate health
Test: increased logging  Original commit: elastic/x-pack-elasticsearch@8f95a6068344e3de32245773f9f09880194822c2
change CrossValidateTestOptions to work with the DVParser as a reranker
allow ovm migrate
Remove duplicate code which is invoked twice (#5039)  Reviewers: Ismael Juma <ismael@juma.me.uk>, Guozhang Wang <wangguoz@gmail.com>
[java] Ignoring again a test failed because of marionette regression
Ahem, compilation error
CAMEL-13388: Wrong removing parameters logic in ServiceComponent.
minor refactor - one line too many last time
MINOR: fix JavaDoc in SegmentIterator  Author: Matthias J. Sax <matthias@confluent.io>  Reviewers: Guozhang Wang <wangguoz@gmail.com>  Closes #2364 from mjsax/hotfix
cleaning up test
Size BlockBuilder appropriately in map_keys  Previously we allocated one row worth of space per byte of input
[ML-Data Frame] Add data frame transform cluster privileges to HLRC (#43879)  Adds the monitor_data_frame_transforms and manage_data_frame_transforms cluster privileges to the high level rest client.  The ALL_ARRAY variable is only used in randomized tests at the within the Elasticsearch code, so it's not a major problem that these cluster privileges weren't added from the start.  But since ALL_ARRAY is public HLRC users may be using it to find out which cluster privileges exist, so it's best that it contains them all.
Throttling - HTTP Status 302 should not be reported as failure (#2687)  HTTP status code 302 = Moved Temporarily should not be recorded as submission failure by any throttling interceptor. This status code corresponds to a redirect after a successful authentication, which normally happens if the 'service' parameter is used (this is the normal way of using CAS).
Don't calculate max direct memory twice in PlatformDependent  Motivation:  I'm not sure if trivial changes like this are interesting :-) But I noticed that the PlatformDependent.maxDirectMemory0() method is called twice unnecessarily during static initialization (on the default path at least).  Modifications:  Use constant MAX_DIRECT_MEMORY already set to the same value instead of calling maxDirectMemory0() again.  Result:  A surely imperceivable reduction in operations performed at startup.
Minor change to makig logging consistent
add missing @Override annotation
remove System.out.println in Table.java
More documentation on state management
Remove un-used import
Verify that control flow graph is valid after partial evaluation  Otherwise the error will be reported later in the compilation pipeline, which is confusing.
Read/write by multiple threads outside sync - needs to be volatile
Fixed a test which failed if REL_GRAB_SIZE was set to 1... the test wasn't written properly
Use getInvokes() in TruffleBoundaryPhase.
Changed TaskOperationFailure#getCause() return type from Trowable to Exception.
Fix excessive concurrency when running tests with buck internal test runner  Summary: I inadvertently increased concurrency of tests run with buck internal test runner.  It used to be limited by virtual cpu resoures (num processors), but my changes caused it to be no longer resource aware, and it was running with the concurrency equal to number of threads in the pool instead. This is usually higher than num processors. This contributes to test flakiness.  A more comprehensive fix will come in the future.  Test Plan: visualscrutiny  fbshipit-source-id: cea07c4
Procedure compiler version and disable test output
[Test] Mute EqualsTests..testBranch(Not)EqualsDefAndPrimitive   It fails regurlarly and it is tracked by https://github.com/elastic/elasticsearch/issues/21801
HHH-2762 : Added StatefulPersistenceContext.getProxiesByKey() (needed for testing non-flushed changes)
Fixes a rare test timing issue  Multiple threads tried modifying the same unsynchronized ArrayList. This created a race condition seen on certain machines/OSes in rare occasions. Refactored to have an internal class for the thread, each instance having a volatile field with the result instead.
No logical change: remove unused import
Fix CREATE USER command  wrong management of quoted role names  Resolves: #6216
Remove deprecated code
Minor Boolean expression simplification  Signed-off-by: Laszlo Hornyak <laszlo.hornyak@gmail.com>
Rename one of the CachingBuildEngine.processBuildRule  Summary: Caching BuildEngine has two "processBuildRule" functions that are not logically doing the same work (one does basically everything around building a single rule and the other handles a small subset of that). Rename the inner one to buildOrFetchFromCache.  Test Plan: CI  Reviewed By: marcinkosiba  fbshipit-source-id: 2ea5ad0
More optimistic initial line buffer size
Revert "Restore lost Node#start no-op check"  This reverts commit ddfa3a661510f25c2ce431dfd6fb86ac11eb8888.
fail on malformed sort
Minor: Removed dump of distributed exception in any case
Only release write lock if it was grabbed
make testTimeoutSendExceptionWithDelayedResponse less timing sensitive
Code refactoring: moved static properties to the top
Revert timeout change (no effect).
CAMEL-8005 Added a simple unit test for it
[TEST] remove AwaitsFix from testSnapshotSucceedsAfterSnapshotFailure, turns out the issue is specific to Java 9 v143
Speedup TestHiveFileBasedSecurity  Instead of creating the entire TPCH table set it is enough to create one small table, such as nation.  After closing a query executor reference must be nullified to prevent memory leaks.
Log assertion errors with a lower criticality  Part of #376 on github
Fixed Coverity Issues Reported
No logical changes - removing unused `static` and adding whitespace
ConditionalElimination: only clear the state on loop exits if the graph needs to remain in loop closed form
[removed] fugly warning.
merge from 0.4 branch
add autofail to yet another test that seems to stop the nightly build
give the cleaner almost double the time to clean up the sessions (a whopping 9 more ms). Hopefull will deflake this test in CI.
Unneeded version check was removed.
decode url first before adding to the list
ported fix to trunk :  http://issues.apache.org/activemq/browse/AMQ-1173
Add inline comment to prevent confusion
Updating test assertion (#34040)
Remove isOpen assertion when sending WebSocket message  Issue: SPR-14138
Log compaction before we commit the transaction
use same method names everywhere
Removed constants found in HaConfig anyway
SimonStewart: Clean up imports of the Renderer class  r16856
fix issue on schema snapshot managment for schemafull documents.
CLOUDSTACK-4551: Migrating the data volume from NFS to local storage ,underlying disk offering is not changed. Even though the volume may get migrated from shared to local storage, it is not possible to update the disk offering. The fix is to disallow migration from shared to local store.
Summary: Use hypervisor as clock source for system vms  BUG-ID: CLOUDSTACK-2492 Bugfix-for: 4.1,master Signed-off-by: Marcus Sorensen <marcus@betterservers.com> 1368635782 -0600
HtmlUnit: Determining visibility does not require javascript in general  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Easy: Remove unused @Value.Enclosing from NdkCxxPlatforms  Summary:In the diff `Fix pmd rules for buck style immutable in nested objects`, yiding factored out an enclosed immutable value type from `NdkCxxPlatforms`.  However, the class is still annotated with `Value.Enclosing` even though it no longer holds any immutable value types.  This removes the annotation, since there are no enclosed immutable value types.  Test Plan: CI  Reviewed By: yiding  fb-gh-sync-id: cc45e7e shipit-source-id: cc45e7e
CAS-930 Add @NotNull annotation to facilitate identification of component wiring problems that should manifest at deployment time instead of runtime.
Retain the order the URLs were added in when calculating the result for getURLs()
format doubles with %f
Fixed hang when submitting mappings and no changes are made  Added missing listener call before return  Closes #3381
added tests on already existend duplicate in case of batch, issue #4045
[hotfix][runtime] Add @VisibleForTesting to Execution#markFinished()
CLOUDSTACK-7283: listUsers - for regular user, only return the caller info. If there are more users under the same account, their information should never be returned
Added support for ranges, e.g. "10-20" which are translated into int[2] Refactored so that networking is easy to mock Implemented Listeners helper for listener management Removed all Message subclasses - variations now handled through headers instead
Minor: remove warning
change MIN_SANE_LIVE_RATIO logging to debug patch by jbellis for CASSANDRA-5377
Work-around to release threadlocal ActionContext in init and destroy  WW-2167
removed use of @Alias in Thread.isInterrupted() substitution
[BEAM-6244] Restore validate
Test: Run refresh before the search on metadata occurs.  Original commit: elastic/x-pack-elasticsearch@2097f01458d82c3c9a97410dad3deb707ad8c039
Remove some dead-code and cleanup
Use karaf 2.3.3
Support passing of metadata to OResult with OContextualRecordId
factored out getSuperType
Skip null options when converting back to argv
Added method for rolling back all of a slaves transactions (the master side calls it when a slave has gone down)
speed up a test which fails some time on slow CI servers
Remove redundant Lookup#resolve call
Handle header-only libraries when doing library merging  Summary: The old version of the logic was throwing an exception.  Now, just do an explicit check for libraries that don't produce shared objects.  Test Plan: Built Facebook with library merging.  Reviewed By: andrewjcg  fbshipit-source-id: a8c90fc
improvements for CAMEL-619 to avoid showing null nodeID and to show the body java class too
made conversion service pluggable
add sourceRef to SearchHit
Replace getStaticLabel with getLabelResource
Correctly detect LastHttpContent after encoding
Remove unnecessary synchronized block
Adapting to change in ESClientYamlSuiteTestCase api
Use field that was unused and remove suppression. #1555  Fixes `SuppressionAnnotation` inspection violations in test code.  Description: >Reports any inspection suppression comments or annotations.
Short cut simple int constant materialization diamonds in the graph builder.
Buck plugin disable buttons if server isn't connected  Summary: Disable all actions if the server isn't connected, since we may lose information if we don't get the messages  Test Plan: Tested by connecting/disconnecting from the server.  Reviewed By: jimpurbrick  fbshipit-source-id: 71b6965
Cleanup a potential resource leak
Handle multiple occurrence of DelayClassInitialization & RerunClassInitialization
OperatorMatches caches compiled patterns  Issue: SPR-12610
ShadowingClassLoader can be constructed without default excludes  Issue: SPR-15439
[java] Deleting unused imports
ReadNode.push, remove useless check
Add @Beta to new method that hasn't yet been API reviewed.  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=131302300
Refined tests for FactoryBean return type resolution on @Bean methods  Issue: SPR-11842
Mute testRecoverMissingAnalyzer  Tracked at #40867
Minor change to allow (use-at-your-own-risk) access to internal data structure of in-memory model.
Removing duplicated import  Original commit: elastic/x-pack-elasticsearch@1618ec79d4c8cafb639d4cfc0bb2e9afea3e1ae2
Add synchronized to close of WorkerProcessProtocolZero  Summary: Buck is crashing here occasionally. I suspect the close is called multiple times and is racey. Add a synchronized so `isClosed` will be update properly and maybe we can get a stacktrace from the Precondition failure.  Reviewed By: styurin  fbshipit-source-id: dfbc693ca0
sonar : fix squid:S2157 Add a "clone()" method to this class
Increase the timeout of LocalTransportThreadModelTest to 1 minute
allocate _poolIds before use
CLOUDSTACK-6181: Allow RBD volumes to be resized  We don't need an external script to investigate the format of the RBD volume, we only have to ask Libvirt to resize the volume and that will ask librbd to do so.
updated test case to check: https://issues.apache.org/jira/browse/AMQ-4149 could not reproduce issue.
added missing @Test annotation
Increase process timeout in unit tests.
Add 5.6.11 version constant.
increase timeout for External sort test.
Make iterator static
Removed unused imports
Solves WW-3582 - moves call to handleValidToken() method outside of lock on session object
test: do not use deprecated shard preferences (elastic/x-pack-elasticsearch#2630)  This commit makes sure that we won't use the deprecated shard preferences.  Relates elastic/elasticsearch#26335  Original commit: elastic/x-pack-elasticsearch@273e968407d428b1b70157f4799f8d0fa61d9147
Allow aggregation of an empty TupleStream
Remove duplicate @since tags in EmbeddedDatabaseBuilder
Set the spans on the leaves as well as internal nodes to better match the documentation
Bugfix for iOS File.exists().
Save URL separately from samplerData
Updated javadocs for soTimeout. (#2770)
Added new test case with IN operator and ()
Add head tag model to freemarker available models
added validation to registermetrics to have timebucketSizeInSecs >= 1
Bug 12618 - Making usage data commands use their own socket instead of locking all activity to process data.
add workaround for test failre on missig script executor
Fix AwarenessAllocationIT.testAwarenessZones test  This test sometimes fails because the first node is elected as master and waits 30s for incoming joins but in the meanwhile the 3 other nodes form a cluster on their side. The index will be created and its shards allocated on these 3 nodes, then the test checks for the number of shards on each node (it should be 2 or 3) but because the first node has not fully join the cluster yet one node will have 5 shards.   closes #13305
add an option for name as well as _name for filtering allocation
[TEST] Fix failure in SearchFieldsTests.testUidBasedScriptFields.  Sorting fails on unmapped fields so the new propagation delay of the mappings exposed this issue. I added explicit mappings as part of index creation to fix it.
[FLINK-10399] Use String#isEmpty() to check for empty string.
AOT: ResolveDynamicConstantNode is missing NodeInfo allowedUsageTypes annotation
Implement toString in LLVMType
GROOVY-2200: AllTestSuite should supports excludes pattern as well as current includes pattern
Remove unused code.
Handle potential NPE with HashAggregationOperator
Fixed an issue: Netty-14 (IllegalArgumentException when creating a dynamic buffer with 0 estimatedLength) * Allowed zero initial capacity * Made the exception message more specific
Catch less specific exception to deal with intermittent failures with OpenJDK
SQL: format() function now supports configured database's TZ
Add simple join test
bug 13679: cosmetic fix to remove NPE warning message from log. Reviewed-By: anthony
initialize port to 0 to avoid an NPE later on when args are checked
Added onSnapshotCreated method
Rename test class to match tested functionality
Bug 60650 - AbstractBackendListenerClient does not reset UserMetric between runs  Bugzilla Id: 60650
Add regression test for antlr/antlr4#6 (NullPointerException in getMissingSymbol)
add GroovyObjectSupport as type
Minor: added read stream as string method
Test against CGLIB memory leak for method injection  This commit introduces a test in XmlBeanFactoryTests that verifies that CGLIB generated subclasses for method injected beans are reused across bean factories for identical bean definitions. In other words, by verifying that the same CGLIB generated class is reused for identical bean definitions, we can be certain that Spring is no longer generating identical, duplicate classes that consume memory in the VM.  Issue: SPR-10785, SPR-11420
Mute PermissionsIT#testWhen[...]ByILMPolicy (#41858)  Relates #41440
Add zero copy support in reactor-based WebClient  This commit makes Reactor Netty `WebClient` instances support zero-copy requests by implementing `ZeroCopyHttpOutputMessage`.  The implementation leverages the optimized `sendFile` mechanism if available.
Add host verification for CheckRouterCommand  We only send CheckRouterCommand to the hosts managed by current management server.
EranMes: When a Point instance is printed, the output will now be useful.  r12351
Ignores insubordinate test, to be reviewed later
Adding documentation to Polygon
Add a TODO
Add missing case in switch. #1555  Fixes `EnumSwitchStatementWhichMissesCases` inspection violation.  Description: >Reports switch statements over enumerated types which do not include all of the enumerated type's elements as cases.
Delete unused import
Additional comment describing the block ordering and alignment.
DanielWagnerHall: Making element equality and hashCode consistent.  This makes the /element/:id/equals/:other command obsolete.  Leaving the handlers in for backwards compatibility.  r14281
DouniaBerrada: Cleanup for android   r10357
Remove comments used to debug
we need to watch out for content types like "text/html; charset=..."   r2743
TIKA-411: Generate list of supported and detected types automatically  Add a --list-supported-types option to the Tika CLI and implement a basic listing of known types, aliases and matching parser classes
Mute PKI REST authentication failure test  This test is failing for days, possibly due to a change in core Elasticsearch. This commit marks this test as awaits fix.  Original commit: elastic/x-pack-elasticsearch@f519c2a7ee9903976341c0ff980f8af73b76da28
Add missing null check
Remove unwanted debug dumping.
Support OnTimerContext in ByteBuddyDoFnInvokerFactory
Add ChannelBufferHolder.toString()
Revert "BEAM-5933: avoid memory allocation in hashCode call"  Fixes BEAM-6407.
CAMEL-11703 - Camel-AWS: Use builders instead of different constructors - AWS SimpleEmail
Adds timed wait on ResponseFuture so it is more frequently scheduled
Remove unnecessary calls. Closing the socket recycles the processor which in turn recycles the buffers.
[TEST] Add discovery-multicast to PluginManagerIT
Avoid extra Block creation in map to json cast
Ensure protocol case (http: vs. HTTP:) won't matter even on JDK 1.3.  PR: 21615
Run JavaInteropTest in polyglot context.
TestCompiler: Disable annotation processor auto-discovery  Summary: `javac`'s automatic discovery of annotation processors on the classpath can cause unpleasant surprises. Buck's own code (`Jsr199Javac`) disables it when building, but `TestCompiler` wasn't disabling it for tests.  Test Plan: CI  Reviewed By: styurin  fbshipit-source-id: 8809cec
Patch by Luca Molino to fix a bug on alter class to rename it
Explicitly ignore empty tokens in the value of VirtualWebappLoader#virtualClasspath
Make HitCounts a  static class.
Remove unused import.
[BEAM-5658] remove noop equals override from ExecutionStateTracker
Added --help option
Increase timeout for assertSeqNos  Helps with tests that do async translog syncing
HOTFIX: fix off-by-one stream offset commit  guozhangwang  Author: Yasuhiro Matsuda <yasuhiro@confluent.io>  Reviewers: Guozhang Wang  Closes #372 from ymatsuda/commit_offset
Migrate TestCustomFunctions to AbstractTestFunctions
AlexeiBarantsev: Adding @throws clause to switchTo().alert()  r13980
Add test for implicit casts for type in evaluated execute methods.
Tests: fixed problem on run single tests with memory database
Choose the nearest snap value instead of the first.  This allows using a slider which only hits the snap values when dragged.
Update for Gump now these are known Ciphers
[FLINK-11334] Add good EnumSerializer.toString()  This makes it easier to understand failing tests where serializers are being compared.
Make the cumulation field in ByteToMessageDecoder package private to hide it
Only opens a file once for writing
Don't create ABIs from source if postprocessing classes  Summary: A postprocessing step might modify the class files, rendering a source-based ABI incorrect.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: a7a774f
SimonStewart: You can now reuse the Actions object  r12189
remove some unused imports
Allow to access memoryAddress of wrapped ByteBuf for ReadOnlyByteBuf  Motivation:  We should allow to access the memoryAddress of the wrapped ByteBuf when using ReadOnlyByteBuf for peformance reasons. If a user act on a memoryAddress its his responsible anyway to do nothing "stupid".  Modifications:  Delegate to wrapped ByteBuf.  Result:  Less performance overhead for various operations and also when writing to a native transport (which needs the memoryAddress).
Add a comment to clarify the simplification.
make it clear that DetailAST is not meant to be extended by Check authors
Change the extension point for CompilerTreeApiTest  Summary: One of the overloads of `CompilerTreeApiTest.compile` used to be the thing to override if you wanted to do something no matter how the compiler was invoked. After `initCompiler` was added, one if its overloads became a better place, but I neglected to make it so.  Now I need it in a new test, so here we are.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: 2932ac1
Added license headers
Javadocs: adding marble diagram, return value for onBackpressureLatest
Issue 609: revert wrong change on cert tests
add 0.18.5 version
Make Infer capture rules depend on the preprocessor  Summary: Infer rules add the `PreprocessorDelegate` to the rule key so they need to depend on the preprocessor, otherwise they might fail when they try to hash the preprocessor script (in case it is generated by another rule).  Test Plan: Run Infer capture with a genrule-generated preprocessor script.  Reviewed By: Coneko  fb-gh-sync-id: 16cb256 fbshipit-source-id: 16cb256
Added a test case for the KernelExtension contract test.
HIVE-4602 Enable running all hive e2e tests under vectorization. (Tony Murphy via omalley)
Related issue: NETTY-116 HTTP issues including chunked request / response patch * Applied Dave's patch for HttpMessageDecoder
Set succeed when skipping already preloaded asset
Restore constant for default size to be plain 8 instead of unrelated Byte.SIZE
merging fix for GROOVY-3274 to 1.7.x
Make ExoPackageInstaller.installFile() a bit more generic.  Summary: Do not hard code the "secondary-dex" directory so that it can be used to install a file to any arbitrary location under dataRoot.  Test Plan: buck test --all buck install <exopackage_target>
nit fix: CxxBuckConfig.UNFLAVORED_CXX_SECTION  Summary: Semantically, in all use cases it prefixes nothing and works as a usual/standard section.  Test Plan: CI  Reviewed By: stepancheg  fbshipit-source-id: ecd0e37
Added support for ranges, e.g. "10-20" which are translated into int[2] Refactored so that networking is easy to mock Implemented Listeners helper for listener management Removed all Message subclasses - variations now handled through headers instead
HOTFIX: AddOffsetsToTxnResponse using incorrect schema in parse  The parse method was incorrectly referring to `ApiKeys.ADD_PARTITIONS_TO_TXN`  Author: Damian Guy <damian.guy@gmail.com>  Reviewers: Ismael Juma <ismael@juma.me.uk>, Jason Gustafson <jason@confluent.io>  Closes #3056 from dguy/hotfix-add-offsets-to-txn-response
Javadoc. Method doesn't throw EOFException anymore.
[TEST] return empty array if AbstractQueryTestCase#currentTypes is null  This is important to allow any test to use RandomQueryBuilder#createQuery() since some of the query builders that are used in this test test the length of the types array and otherwise will thow NPE if the test is not a subclass of AbstractQueryTestCase.
HIVE-10116 : CBO (Calcite Return Path): RelMdSize throws an Exception when Join is actually a Semijoin [CBO branch] (Jesus Camacho Rodriguez via Ashutosh Chauhan)
removed Java 1.5 compatibility issues
Add missing access check.
this test takes too long in hudson, reduce the amount of messages processed, quantity does not add much to the test
Remove unused import.
added method to check for key existence
use long math for long values
Mute RecoveryWhileUnderLoadIT#testRecoverWhileUnderLoadAllocateReplicasRelocatePrimariesTest  Tracked in #37895.
Updated Observable API
Refactor parser to use global frame for rules  Summary: This way rule definitions can be reused in multiple environments. In particular this will be used when parsing extension files.  Test Plan: CI  Reviewed By: styurin  fbshipit-source-id: 2cc4640
Change the SingleFilePageSwapperFactory implementation name from striped to single, because we might want to stripe over files later
DX RegisterSpec optimization for de-interning: mapSourceRegisters  Summary: [Forward Port of 160a87fc81adcc091836b15c54c380069bdf90c5] An upcoming change will make the RegisterSpec class not interned as a part of making DX in-process safe.  PhiInsn.mapSourceRegisters is currently doing an "==" check to determine whether to call SsaMethod.onSourceChanged.  Without interning, that check might fail where it would have previously succeeded (for two equivalent but not reference-equal RegisterSpecs), resulting in an unnecessary call to onSourceChanged.  (I don't know if this can *actually* happen.)  This diff optimizes that case by doing an early exit if the new and old source have the same register.  Inspection of the method shows that when this is the case, it just removes the instruction from a list, then adds it right back.  This diff should be correct and safe on its own, but it seems unlikely to have any benefit as long as RegisterSpec is interned.  Test Plan: ant dx-tests
Assert correct Slice representation in CharType
Let Groovy Console syntax highlight the trait keyword
Remove superfluous validation of incoming states  This commit removes a superfluous check when validing incoming cluster states. The check in question prevents out-of-order cluster states from the same master from entering the queue. However, such out-of-order cluster states will be cleaned from the queue when a commit message for that cluster state arrives or a commit message for any higher-versioned cluster state arrives.
[Monitoring] LocalExporter should catch synchronous exceptions (#36606)  In the unlikely scenario that `LocalExporter::resolveBulk` throws an exception, then we should mark the `listener` as having failed.
[TEST] Plugin Manager  Undo removal of change.
MINOR: add unit test for Utils.murmur2 (#5926)
remove some unused imports
Remove an unused include
(#1045) clarify javadocs to accurately describe currently-intended behavior of sample()
Add support for notify periodic event of cluster.
Remove the irrelevant AIO channel options
remove unused imports
Use Java's built-in way of joining collections.  Reviewed By: styurin  fbshipit-source-id: 5d770888f4
Update assertion in delete event listener to count down latch only if file name matches expectations Do not throw assertion arror from listener.
Refactor with a view to using a common method for text and binary blocking messages.
[examples] Add toString() method to accumulator
ReadTimeoutHandler - missing ) within JavaDoc example (#8645)  Motivation:  improve docs  Modification:  ReadTimeoutHandler - missing ) within JavaDoc example  No logic/unit tests affected
update WordCountCounters for SuperColumn refactor
sorting out javadoc, promoted isWritable() to this interface (for now)
fix for make sure that http command support multiple languages
[BEAM-5658] Remove @Nullable param that always has checkNotNull
Fix handling of grammars in the default package (resolves antlr/antlr4#94)
Read/write by multiple threads outside sync - needs to be volatile
Fixed linkage error with junit
Simplify Subscription Chain
* added default bindings to the script being executed inside <groovy/> tag   - ant : an instance of groovy.util.AntBuilder that knows about the current ant project  - project : the current ant project  - properties : a Map of ant properties, e.g. properties['java.vendor']  - target : the owning target that invoked this groovy script  - task : the wrapping task, can access anything needed in org.apache.tools.ant.Task, e.g. task.log("Problem...")  e.g. <groovy>  ant.echo("hello world")  ant.jar(destfile:"foo.jar", basedir="classes") </groovy>
A better way to get default value
Test that SimpleDoFnRunner wraps exceptions in startBundle and finishBundle
Skip retry when creating Hive RecordReader  We do not retry for other readers. File system implementations already retry when necessary and have more context to handle it correctly.
Add substitution for Module.getResourceAsStream()
r/m unused BUFSIZE patch by jbellis; reviewed by Eric Evans for CASSANDRA-424
Remove excessive whitespace
Ensure path to Javac jar is encoded in rule key  Summary: When the Jsr199Javac amends the RuleKey, it currently disregards whether or not the compiler being used comes from the OS or from a user-supplied JAR. Since the two compilers may differ in their behaviour, it seems wise to encode this data in the RuleKey.  Test Plan: buck test --all
Simplify decimal type test
CAMEL-8270 Added an unit test for it
[Tests] Muting RatedRequestsTests#testXContentParsingIsNotLenient
Add missing @XmlAttribute in model
AbstractApplicationContext.isRunning() avoids IllegalStateException  Issue: SPR-13667
add logging for debugging.  The default value for local.storage.path does not exists by default in CentOS 6. By default, this results in NullPointerException silently. Without this log message, administrator can't figure out the reason at all.  Signed-off-by: Edison Su <sudison@gmail.com>
Optimise - Is a tiny faster as the extra add is not needed as we dont use the returned value.
Update ODocument.java  Add to toMap function for ODocument
Change link to OrderingExplained to GitHub location.  It got reverted to the Google Code location by the doc change. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=95780221
Add missing call to handleThrowable
Expose executor. Required so Servlet 3 Async implementation can use the container thread pool when a new thread needs to be dispatched. (e.g. from AsyncContext.start(Runnable)
Extend mocking tests to cover EasyMock. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=66920336
Use DefaultTraversalVisitor in DependencyExtractor  Use DefaultTraversalVisitor in DependencyExtractor, thanks to that it is able to return correlated names as dependants.
prefactor for PR#430 (copy an example in the javadoc that would otherwise be lost)
Uses new way to access TileContainer
Make SocksServer example compatible with `curl --socks5-hostname`  Motivation:  Socks5 proxy supports resolve domain at the server side. When testing with curl, the SocksServer in example package only works for proxy request with IP, not with domain name (`--socks5` vs `--socks5-hostname`). As curl is widely used, it should work with the example provided.  Modifications:  Passing address and port to the Socks5CommandResponse, so that it works for curl.  Result:  `curl --socks5-hostname` works as expected.
Start mock appender for capturing logger  The base test case class has been adapted to assert that no warn nor error messages are logged to the Log4j status logger. An issue that exists in x-pack uncovered by this change is that the mock appender in the capturing logger was never started. This commit addresses this issue.  Relates elastic/elasticsearch#3988  Original commit: elastic/x-pack-elasticsearch@8fc0b99bae4c4ef75c6c627f82e54de7b3bdda78
full error reporting
CAMEL-5542: Timer component. Changed delay to be 1000 by default.
Final Local Variable Check, extended acceptable tokens
Improve error message when failing to load class usage files  Summary: Changes the wrapped exception to a BuckUncheckedExecutionException to get the nice context printing from that. Also resolves the full path so there's no need to know what cell the failure was from.  Test Plan: I hit this error in testing (and it actually threw an NPE because the thrown exception had no localized message). This change gave a much better error.  Reviewed By: styurin  fbshipit-source-id: c2d066b
2.x: update Obs.just(2..10) & switchOnNextDelayError marbles (#5651)
Maybe die before trying to log cause  This commit reorders a maybe die check and a logging statement for the following reasons:  - we should die as quickly as possible if the cause is fatal  - we do not want the JVM to be so broken that when we try to log    another exception is thrown (maybe another out of memory exception)    and then the maybe die is never invoked  - maybe die will log the cause anyway if the cause is fatal so we only    need to log if the cause is not fatal
Add validation to ErrorCode
Expose source ID for desktop usage.  http://www.java-gaming.org/topics/libgdx-request-expose-openal-sourceids/30788/view.html
Fix exception assertions in MetaDataStateFormatTests.testLoadState  Got broken with the change in #16850
Removing unneeded cast
Add a newBuildTarget() method to ProjectWorkspace.  Summary: This convenience method facilitates creating a `BuildTarget` with the correct filesystem/cell underneath.  Test Plan: Used in an upcoming integration test.  Reviewed By: Coneko  fb-gh-sync-id: c4ce6b6
WW-4168 Added if statement in method isChecked to verify that the String Array of checkBox name values is not null.
Fix DB warnings - txn: Commit called when it is not a transaction: -NetworkServiceImpl.dedicateGuestVlanRange:3050
Remove extra explicit type
avoid repetitive BoxNode virtualization
annotate UnsafeCastNode as deprecated
Remove import for java.util.Formatter since it's needed only for the javadoc. ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=108184450
Further to [CALCITE-604], add "synchronized"
Correct method name in log message
2.x: Expand the documentation of the Flowable.lift() operator (#5863)
Add test for new HTTP GUI
Make SymbolsExtractor#extractOutputSymbols accept Lookup
Fix result set serialisation (null OType)
Avoid potential NPE in error message
added workinf folder creation to test
Further refinement on PR-201
CLOUDSTACK-5145 : Added permission checks while deleting network ACLs
Make Write Barrier abstract class
DRILL-773: Add test for aggregate function with drill custom function The actual fix is in Optiq.
Remove some completed TODOs Tidy up the Javadoc
IPv6: Disable password and userdata service for ipv6 for now  Would add support later.
[minor] Use MemoryPersistenceAdapter for testing when choice of persistence adapter is indifferent
Mark PathResourceTests as deprecated (along with PathResource)  Issue: SPR-17320
CAMEL-4938: Undo the unintended changes with Thread.sleep() and enableJMX() calls.
removes custom implementation for setDelegate
bug 10435: use "hostName" instead of "name" as a search filed in listSystemVms status 10435: resolved fixed
add simple vm properties test
EranMes: Marking the methods removed in r14625 as deprecated, and logging the fact that they are.  r14627
AlexeiBarantsev: Fixing import of Sets class from the wrong place to a better one  r17833
Fix license messaging for Logstash functionality (elastic/x-pack-elasticsearch#3268)  * Fix license messaging for Logstash functionality  With a Basic license, users are still able to perform CRUD operations on the `.logstash` index, therefore manage their Logstash pipelines. However, Logstash itself will not pick up any changes from this index and act on them. With an expired license Logstash functionality continues to operate as normal.  * Fixing messages after feedback  * Removing extraneous tabs at end of line  * Fixing typo  Original commit: elastic/x-pack-elasticsearch@bc069cf00ff865056ee53fd3e7c79b325c68dcee
Fix drop table test to use correct table
Ignoring recently added test in legacy Firefox driver
Bug 5419: use transaction lock instead of global lock when performing domain deletion operation
make the cached compile scripts a soft map
Added an unit test for camel-http redirect according to the mailing list
Forced close of storage on delete()
Add a flag to turn on debug output easier
Easy: Remove unused @Value.Enclosing from NdkCxxPlatforms  Summary:In the diff `Fix pmd rules for buck style immutable in nested objects`, yiding factored out an enclosed immutable value type from `NdkCxxPlatforms`.  However, the class is still annotated with `Value.Enclosing` even though it no longer holds any immutable value types.  This removes the annotation, since there are no enclosed immutable value types.  Test Plan: CI  Reviewed By: yiding  fb-gh-sync-id: cc45e7e shipit-source-id: cc45e7e
Improve subscription removal in SubscriptionRegistry  Avoid using destination pattern based search when removing sessions or subscriptions from DefaultSubscriptionRegistry and use only session and subscription ids.  Issue: SPR-11930
Cut and paste error
Rename unit test so it looks like a unit test  Original commit: elastic/x-pack-elasticsearch@d2d39ad50bb1a638461f1e2aed21110b732ea5e0
Fix assertion error about mixed relative and absolute paths  Summary: Running `buck project --combined-project TARGET` was failing with `java.lang.IllegalArgumentException: Both paths must be absolute or both paths must be relative.` This patch fixes the error by replacing the offending call to `MorePaths.relativize` with a call to `PathRelativizer.outputDirToRootRelative`.  Test Plan: `buck project --combined-project TARGET`
If a remote end does not explicitly state JavaScript support we suppose it's a "normal" browser that supports JavaScript
Compare as Longs rather than using autounboxing
HIVE-3057: metastore.HiveMetaStore should set the thread local raw store to null in shutdown() (Travis Crawford via Ashutosh Chauhan)
Remove BWC serialization logic for pre 2.2 nodes (#19810)  This change removes all pre 2.2 logic from InternalSearchResponse serialization. It's unneeded in 5.0 since we require full cluster restart
Adds an explicit generic in a test
allow controllable stack dump in ExceptionUtil.java
Added tests to install the server on a path with strange characters and space in it
Migrate IndicesExistsIT to Zen2 (#37526)  This test was actually passing, for the wrong reason: it asserts a `MasterNotDiscoveredException` is thrown, expecting this to be due to a failure to perform state recovery, but in fact it's thrown because the node is not correctly bootstrapped.
Changed the priority of delete-index action to URGENT  All index meta data API's have urgent priority when it comes to cluster state updates. We'd like to remove indices asap to avoid things like unnecessary shards relocations
HIVE-17265: Cache merged column stats from retrieved partitions (Jesus Camacho Rodriguez, reviewed by Ashutosh Chauhan) (addendum)
HTTP/2 HPACK Encoder remove unsued import
[FLINK-9352] Choose initial checkpoint delay randomly to reduce I/O pressure  By choosing the initial checkpoint delay randomly from [minPauseBetweenCheckpoints, baseInterval] we avoid that multiple restarting jobs have synchronized checkpoints. This can cause otherwise significant I/O pressure.  This closes #6092.
Defunct import in ModelDissector
Refined exception message  Issue: SPR-14609 (cherry picked from commit ab68673)
remove unused method
Parallel query: fixed issue with transactions  When transactions are running, the parallel doesnât work because the way the database is cloned between threads It doesnât take in account the transaction data structures in db.copy()
TIKA-1955: Updated check to read from stream to avoid misreporting due to blocking
Add Javadoc comments to LLVMFunctionRegistry
ASM annotation visitor defensively accesses enum constants  Issue: SPR-15442
[hotfix][runtime] Add @Nullable to ExecutionJobVertex#getSlotSharingGroup()
Dialog, fixed focus issues.
Ninja: remove redundant check for null
Fix up some raw types
fix for GROOVY-2535 (add missing line number information)
More robust evaluation after training model
Add workaround for missing delete key events.  In Jelly Bean, the behavior when hitting delete on the soft keyboard was changed so it does not send key events in certain circumstances. We want the key events so we send them ourselves.
[no jira] extend the timeout b/c it was on the margins
fix error message spelling with cql select statements patch by rvieira reviewed by dbrosius for cassandra-5647
[TEST] replace SizeFunction with Function<Integer, Integer>
Clean up warnings
Deprecate manWithIndex  If we leave mapWithIndex then we should have âwithIndexâ on many other operators. Instead of this, an Observable should just be zipped with an infinite stream of numbers and the zip function provides the index. This keeps the API surface area smaller and provides the desired behavior on all operators.
[hotfix][tests] Removed unused field
Reduce visibility of recently added method
attempt to fix wal shoutdown issue
[ML] Kill process after executor has shutdown (elastic/x-pack-elasticsearch#3958)  Original commit: elastic/x-pack-elasticsearch@4c58aa51bf99e9bb624212668812b4fd57184aa9
Ignores this test for now... zoo keeper is not stable in test environment yet.
Reflection exceptions in memory cofiguration were moved to debug level.
DanielWagnerHall: Removing unused imports  r12777
WW-3067 Add a configuration constant to turn on/off the logging of missing properties by OGNL
Group private static fields together No code change
[TEST] Add test that shows how to use a classic pull-parser with the object parser
Avoid an unnecessary session ID change notice.  Notice of changed session ID by JvmRouteBinderValve is unnecessary to BackupManager.  In BackupManager, change of session ID is replicated by the call of a setId() method.
AndroidLibrary.Builder: Hoist addition of DummyRDotJava dependency out of the BuilderHelper  Summary: TSIA  Test Plan: CI  Reviewed By: asp2insp  fbshipit-source-id: 3026266
Make it easier to test that the right response was returned
Fix the creation of the file in the test. The test was failing when there is a space in the path.
More logging when PubsubJsonIT fails
DRILL-2548: JDBC Driver - check for bad data from server and prevent SqlException
[Test] Fix remaining static objects after running tests  Test framework detects when static objects are not released when running tests. This commit remove usage of static objects when possible.
find references command: improved find speed
Replace manual array unboxing with ArrayUtils.toPrimitive(). #1538
Remove unused code in HgCmdLineInterfaceIntegrationTest  Summary: Unused code  Reviewed By: styurin  fbshipit-source-id: 21731872c0
Support IndicesModule list constructor  Original commit: elastic/x-pack-elasticsearch@c88e2b82b70a49e21bcca66f2712ac88efeb0e9b
remove debug comment
Removing misleading log messages. Fixes issue 6392
deal with deleted ends in ConvertDeoptimizeToGuardPhase
Backported the harden synced-flush PR to v6.3.0  Relates #28464
Make JettyAppServer attempt to lookup a non-loopback address  This makes the proxy tests pass in Firefox, which likes to always bypass a proxy for local addreesses.
Add test that uses UrlConnection stub cacheControl (findbugs)
Faster code for setters
update background task manager shutdown check to include timeout pool  Summary: check that timeout thread pool is terminated when checking that manager is properly shut down (test function)  Reviewed By: styurin  fbshipit-source-id: 90c830c756
Checks page cursor out-of-bounds after reading/writing tree state
Add 2.2.1 to the version lookup table
javadoc for BBU.clone
Add an NPE guard
Added missing iOS device  Added the missing Wi-Fi Only iPad Pro to IOSDevice
Allow to use NIOFSDirectory as directory implementations for lucene indexes  Add "default_directory_factory" feature toggle in DirectoryFactory to be able to choose between default directory factory and NIOFSDirectory for lucene indexes directory.
Update assertion in delete event listener to count down latch only if file name matches expectations Do not throw assertion arror from listener.
added a CharSequence#getAt method to avoid ambigouty problems
Removed a nice System.out and printStackTrace() which, of course, shouldn't be there
don't throw exceptions when you can't add host
Adding WOFF2 media type.  Bootstrap uses this file format, which is then filtered out in apps framework since this type isn't defined. ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=122743223
Remove DirCache logs about hit/miss, as we geting them from CachingBuildEngine  Summary: These are rarely used logs, and we get almost the same information from CachingBuildEngine logs  Test Plan: CI  Reviewed By: marcinkosiba  fbshipit-source-id: 6a2926d
If you change something, at least run it once before checking it in, come on
&= is needless as stoppedAll is true Added TODO waiting for answer from sebb on dev mailing list Bugzilla Id: 53418
TIKA-844 Add an internal TagBag property type constructor, patch from Ray Gauss
STORM-3180 Total executors in Cluster Summary in main UI page is not exposed even a topology is running  * rename the field of /cluster/summary output: totalExecutors to executorsTotal
Deprecated unused code.
remove unused imports
Avoid NPEs so tests fail rather than error
Fixed a bug with javac
Added asserts to make sure ChannelHandlers are removed from the pipeline
Query DSL: prefix query to support _id, closes #1648. (fix support analysis for prefix is configured)
Remove unused private method, issue #744  All violations of PMD rule [UnusedPrivateMethod](http://pmd.sourceforge.net/pmd-5.2.3/pmd-java/rules/java/unusedcode.html#UnusedPrivateMethod) are fixed.
Code cleanup in mocking storm-starter tests
Add the piece of information that I really wanted last time. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=88115213
[TEST] added @AwaitsFix to failing StringTermsTests while I work on a fix
CloudStack CLOUDSTACK-4160 listUcsManagers API needs to be able to take in id parameter
Added logging when removing orphan constraint indexes on startup
CloudStack-1267: initialize log4j in agent main()
[FLINK-10881] Use cancelWithSavepoint in SavepointITCase test.  This closes #7833.
fix check for rememberMe in authentication (#3869)  Fix a problem that kept remember-me authentication from working when logging in to a service protected with mfa-duo.   The test in CookieRetrievingCookieGenerator() for the presence of AUTHENTICATION_ATTRIBUTE_REMEMBER_ME in the authentication object was always failing, because an unnecessary CollectionUtils.wrapSet() was being used before checking the value. This would result in a TGC being saved with session lifetime, even when the "Remember Me" box was checked.  To test: select the "Remember Me" box when logging in to a service that requires duo-mfa; check the lifetime of the TGC cookie in the browser.
Add some minimal documentation for NERFeatureFactory's distsim
addressed review comments
Rebuild Xcode symlink trees on Buck version change  Summary:   * If the Buck version changes, rebuild all header symlink trees we create when     we generate an Xcode project. This makes sure that the trees are up to date     even if the logic that builds them changes.  Test Plan:   * Use a different Buck version, check that all header symlink trees are     recreated even if their contents do not change.
Polish Javadoc for @Transactional
[removed] fugly warning.
HIVE-5978 : Rollups not supported in vector mode. (Jitendra Nath Pandey via Ashutosh Chauhan)
Updated the documentation for the find method: returns null if no element matches and respecting the order of the collections iterator
Remove v[N/A] log output
Tests for missing placeholders during binding    Add a test to ensure that that there is a hard failure when trying to  bind properties with missing placeholders.    Closes gh-8693
Add missing @Deprecated annotation    Closes gh-15113
follow up for #3376 (#3377)
check the metadataServiceExporter when exec ShutdownHookCallbacks (#5650)
Tweak Javadoc for Part to use something other than RequestBody.
Correct `@Path` documentation.    * Clarify that replacement happens in a single segment.  * Reference the `encoded` property correctly.
Use AssertJ in JooqExceptionTranslatorTests
Remove some tests.    We don't have to test the test and failure naming for tests with  @Parameter annotation again, because it is not different from the test  that sets the parameters via constructor.
Adapt to MonoProcessor deprecations in Reactor    This commit updates our usage of `MonoProcessor` after the deprecations  introduced in reactor/reactor-core#1053
Ensure Undertow session timeout is set correctly    Assume that Undertow uses -1 for 'no expiry'.    See gh-2084
Document that OkHttpClient is thread-safe    While investigating a race-condition, I was momentarily worried when I  couldn't find any documentation actually stating that OkHttpClient is  thread-safe, apart from this Google+ post:    https://plus.google.com/118239425803358296962/posts/5nzAvPaitHu    ...if I'm not the only person asking this question, probably best to  document it.
Revert 'fix wrong check of InvokerListener when export a service (fix issue_6269) (#6271)'    This reverts commit 91989cae508f8482f31ac335879da4a5975661c8.
Adapt to MockClientHttpResponse no longer accepting a null body
Make parameterized assertion error extend assertion error
fix:add space , optimize log output (#605)
Renamed Dummy class to ClassWithoutSorterAnnotation    Incomplete - task : Issue 551: Resolve sensitive equality in  MethodSorter test.
Remove code duplication
Don't hold a lock on the connection when writing settings. (#3867)    This breaks our concurrency rules. Fortunately it's only academic; only  MockWebServer ever writes settings, and it only does so in very specialized  tests.
Ensure endpoint definition Class is an interface.
Make optimizedLaunch property name more consistent    See gh-18702
Avoid resize in ClassUtils.java (#5009)
Make constants static
Only throw PortInUseException if port is set    Refine the `PortInUseException` logic in `NettyWebServer` to only throw  an exception if the port is set. The prevents a misleading exception  from being thrown when a domain socket is being used.    Closes gh-24529
Polish 'Replace indexOf() with a call to the contains()'    Closes gh-15559
Print the java version being used on startup    See gh-21559
Attempt to fix failing log tests
Exercise overload of RequestBody.create() that takes a ByteString    There is currently no test coverage for it.
Define all HTTP2 error codes (#3756)
Fix CacheAutoConfiguration relative order for Couchbase    This commit fixes the auto-configuration of the Couchbase caching  support by configuring the cache once Spring Data Couchbase has gotten  a chance to be processed.    Closes gh-22542
Polish 'Auto-configure ReactiveStringRedisTemplate if necessary'    Closes gh-16604
Add missing bean property getters
Remove @Lazy injection for HttpMessageConverters    This commit turns a lazy injection point for `HttpMessageConverters`  into an `ObjectProvider`-backed injection.    This allows to lazily rely on that bean without creating for it; in some  environments, such proxy creation can lead to issues like SPR-16990.    See gh-13785
Polish 'Rename NoneOfNestedConditions to NoneNestedConditions in example docs'    See gh-22207
Use fast exceptions in hasMoreElements in LaunchedURLClassLoader    When nested jars are being used, hasMoreElements requires opening a  connection for an entry in every nested jar. If that entry doesn't  exist, a FileNotFoundException is thrown to indicate that a particular  jar doesn't contain the requested entry. This exception is used to  indicate the lack of an entry and is then swallowed, i.e. its stack  trace is of no importance. This means that the performance of  hasMoreElements can be improved by switching on fast exceptions while  it's being called. When fast exceptions are switched on a general  purpose pre-initialized FileNotFoundException is thrown rather than  creating a new FileNotFoundException instance each time.    In certain situations, the use of fast exceptions as described above  can improve performance fairly significantly. The JRE's default SAAJ  implementation uses META-INF/services-based discovery for _every_  request that's handled by Spring Web Services. Each discovery attempt  results in hasMoreElements being called making its performance  critical to throughput.    See gh-3640
Add X-Application-Context header to identify app
Update FilteredClassPathRunner so that JUnit rules work    Previously, the tests class and any JUnit annotations it contained were  loaded by a different class loader to JUnit. This meant that the JUnit  annotations were loaded twice and @Rule-annotated fields were not found.  This commit updates FitleredClassPathRunner to use a custom class loader  that ensures that any org.junit.* classes are only loaded by a single  class loader.
Remove ResourceUtils.getURL logging config check    Remove `ResourceUtils.getURL` checking from `LoggingApplicationListener`  so that logging systems can implement custom location support.    Prior to this commit, we checked in the listener if the specified config  location could be opened as a URL. This unfortunately prevents Log4J  extensions such as `log4j-spring-cloud-config-client` from implementing  configurable SSL and credentials support.    See gh-22946
Precompile current dir pattern in Handler    Closes gh-11321
Fix `SessionAutoConfiguration` ordering    This commit updates `SessionAutoConfiguration` to ensure it is processed  after `MongoDataAutoConfiguration` and  `MongoReactiveDataAutoConfiguration`, instead of `MongoAutoConfiguration`  and `MongoReactiveAutoConfiguration`. This is required in order for  MongoDB Session auto-configuration to work, since  `MongoSessionConfiguration` and `MongoReactiveSessionConfiguration` are  conditional on `MongoOperations` and `ReactiveMongoOperations` beans,  respectively.    Closes gh-11054
Improve error handling in SpringPackageScanClassResolver    Previously, SpringPackageScanResolver was handling as subset of the  failures that Liquibase\xe2\x80\x99s DefaultPackageScanResolver handles. This could  lead to a failure due to a LinkageError in certain environments.    This commit updates SpringPackageScanClassResolver to align its error  handling with what Liquibase does.    Fixes gh-1853
Polish 'Narrow the event types ConfigFileApplicationListener supports'    Closes gh-9628
Update field that\xe2\x80\x99s checked reflectively to match Spring MVC\xe2\x80\x99s internals
Align tests for OAuth properties adapter with changes in Spring Security    Closes gh-13185
Revert ZK client change
Remove assert check to continue with execute.
Remove unused imports (#4443)
Remove unnecessary Runnable wrapping in NamedThreadFactory as is done by Netty.  Patch by Alex Petrov; reviewed by Dinesh Joshi for CASSANDRA-15008
add cache for ReflectUtils DUBBO-13    git-svn-id: http://code.alibabatech.com/svn/dubbo/trunk@126 1a56cb94-b969-4eaa-88fa-be21384802f2
Updated gson recipe to close response body.
Corrected javadoc of the Cookie persistent() method:   - It was claiming that returns true if the cookie expires and the end of the session and really is the opposite behavior.
Add an accessor, Call.isCanceled().    Closes https://github.com/square/okhttp/issues/912
Fix the user agent test so it works with a different user agent string    The important thing is that the Version.userAgent() string is used and  not the exact string.
Add tests to confirm HEAD response bodies are empty.    OkHttp never returns null bodies for any request. But empty response  bodies are fine.    Closes: https://github.com/square/okhttp/issues/2879
We don't have resource leaks in interceptor crashes anymore.    Yay stream allocations.    Closes: https://github.com/square/okhttp/issues/1502
Mark a racy test with @Ignore.    We've seen this fail consistently on Travis, and very rarely  on my desktop. Ignore it until it can be investigated fully.    https://github.com/square/okhttp/issues/90
Fix the user agent test so it works with a different user agent string    The important thing is that the Version.userAgent() string is used and  not the exact string.
Remove duplicated 'the' from javadoc
Ensure endpoint definition Class is an interface.
Return null as error body when response is absent    Was throwing an NPE for lack of null check on response before trying to  access the given response body.    Fixes #488
Ensure a real platform is present for Android detection.
Add comment for now-deprecated Response constructor.
Handle h2 vs http/1.1 event ordering differences (#3504)    * Handle h2 vs http/1.1 event ordering differences    * remove sout    * additional test case    * dont change client, change server protocols    * refactor test
Hide a 2.0 API that was left public.
Remove unecessary cast.
[Performance tuning] improve InvokerInvocationHandler#invoke (#5403)
Only deprecate ExpectedException.none()    Instead of deprecating the whole class, now only the factory method is  deprecated and points to `assertThrows()`. This will make it easier to  temporarily suppress the exception for codebases that use it  extensively by adding an intermediate factory method of their own.    Resolves #1609.
Refactored logic out of failDueToMissingException    Refactored message decision logic out of failDueToMissingException into  its own method missingExceptionMessage.
Postpone checkSubConfig logic in ReferenceConfig (#5226)
use stringutils to remove duplicate code in ProtocolUtils.java (#5558)
make consul registry suppor ACL (#6313)    * make consul registry suppor ACL
temporarily ignore UT ZookeeperMetadataReportTest
Change `Fetcher` to use '!= -1' logic in buffered reads.    Closes #65
Add documentation for AndroidLog.
org.apache.dubbo.rpc.RpcContext.getFuture() cannot work in Filter. (#4504)    fixes #4499
Formatting changes    Space between 'if' and '(', '!expression' instead of 'expression ==  false'
Rename tests  Summary: Renamed few tests to reflect object names.  Reviewed By: rajyengi  fbshipit-source-id: eb364df083
remove unused imports in MethodSorterTest
Fixed MethodSorter test case for default sorter.    Adjusted test of Default Sorter so that its equality check only   deals with actually declared methods, fixing issue 551 for this  test case.    Incomplete - task : Issue 551: Resolve sensitive equality in  MethodSorter test.
enhance unit test (#2898)    * enhance unit test    * enhance unit test    * enhance
Add a few more binding tests    See gh-2304
Remove deleted BothTest from AllTests
Make compilable under Java 1.5.
Added test for issue #219
set reference bean definition target type (#5710)    Co-authored-by: quzijing <quzijing@oppo.com>
Use constants to replace literal
Revert the MetadataReport
Avoid creating multiple BeanNameViewResolver beans    ErrorMvcAutoConfiguration creates a BeanNameViewResolver bean in case  the user has used @EnabledWebMvc and disabled WebMvcAutoConfiguration.  If the user hasn\xe2\x80\x99t used @EnabledWebMvc, WebMvcAutoConfiguration will  creates its BeanNameViewResolver and override the one that\xe2\x80\x99s already  been defined by ErrorMvcAutoConfiguration.    This commit makes WebMvcAutoConfiguration\xe2\x80\x99s BeanNameViewResolver  definition conditional on there being no existing BeanNameViewResolver  bean definition.    Closes gh-5354
deleted extra space
Rename userName parameter to username in Credentials (#3781)
Allow optional content-type for RequestBody.create with file param
Correct the javadoc code tag
TLSv1 supports TLS extensions so they should be enabled    Follow up to:  https://github.com/square/okhttp/pull/1196.    Combined with an NPN bug (18705877) on Android this is the  reason why fallback connections started failing on Android  after the COMPATIBLE_TLS was changed to be TLSv1.    [The NPN bug means that once enabled on a socket from an  SSLContext then NPN must be configured for every subsequent  socket otherwise some of the NPN state will still be set,  but some will be missing, leading to negotiation issues].    The implication of this change is that the follow up request  after a handshake failure may now be HTTP/2 or SPDY  (or HTTP/1.1). Previous to this change they would always  have been HTTP/1.1.    Previous to pull 1196 they would also have been  HTTP/1.1 because COMPATIBLE_TLS was SSLv3.
Only use one thread for MockSpdyPeer.
Fix up HttpResponseCacheTest.setIfModifiedSince test to work with GMT timezone format in if-modified-since header
When invalid sizes are used to initialize the ArrayList, don't crash with an uncaught exception
Add a construtor to accept address and protocol for RegistryConfig.
Fix problem when parsing override rule
Replace string by Constants. (#1506)    Replace string by Constants.
Remove redundant cast.
Update copyright header of changed files
Test to confirm OkHttp doesn't loop when a request body throws.    Test to reproduce the issue discussed here:  https://github.com/square/okhttp/pull/4523
We're 4.7 now
Responding to review comment
avoids reusing Executor's Thread instances
Add test for @ConfigurationProperties    Various parent context topologies are tried to ensure that the properties  are bound sensibly.    [#50804109] Allow @ConfigurationProperties beans to be declared  explicitly (to set default values)
Enhanced TextRunnerTest to catch missing return values.
Use <? super T> in Assert.assertThat    As the Matcher is only a consumer, ? super T is more appropriate.  Otherwise, a Matcher<Object> cannot be used with a String actual, for example.
Delegate to existing deserialization method.
Give InitializationError a useful message. JUnit itself does not use the message,  but having a useful message makes debugging runners easier.
Removed unnecessary @SuppressWarnings    Signed-off-by: Kent Beck <kent@threeriversinstitute.org>
Correcting the collection used when printing out the skipped converter factories when constructing the exception message
Test that non-static data points are flagged failures
Improve test method name.    Replace `assumeNotNullSingleNullThrowsException` by  `assumeNotNullThrowsExceptionForNullArray` because it is more clear.
Annotate ExpectedException with @Deprecated. (#1597)    The Javadoc already indicates that it is deprecated.
Add getter for log level.
to meet new onResponse signature: return directly
Sort added router list before set the 'routers' field of the RouterChain (#3969)
use consul with group and version (#4755)    fix #4309
Added setProperty(name, value, default) method: sets prop unless default, removes otherwise
rename access log in unit test from 'alibaba' to 'alibaba.log' so that it cannot be committed by accident. (#2051)
ignore unstable test test_normal_channel_close_wait_gracefully
re-enable testCustomExecutor (#2913)
Use urlString for Request.toString()
Prefer Executor.execute() over Executor.submit().    I fixed most of these 2 years ago when it was problematic, but I missed  one.
Added 2 tests for methodValues and fieldValues functionality.    The tests cover both the matching case (field/method is of  expected type) as well as the non matching case.    Removed static class ManyMethod (an unused fixture).
Polish 'Align TestRestTemplate Javadoc with documentation'    See gh-21318
Add a link to assertThrows in exception testing    Provide information about alternatives to the expected parameter which  can be used to overcome the limitations of expected.    This is an improvement for JUnit 4.13 to the fix for #806  (84dcb64cf07eba08fd7ef4de3a6aaf21f4944157).
Close all servers/ports after tests finish (#2755)
Assign an order to OnResourceCondition    Closes gh-7145
Close all servers/ports after tests finish (#2755)
Remove redundant cast.
ignore unstable test test_normal_channel_close_wait_gracefully
