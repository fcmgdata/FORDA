Test that HttpMapper properties are only used when they\xe2\x80\x99re defined    Closes gh-1923
Escape backslashes so they are preserved during Properties parsing    Closes gh-12285
Remove redundant @ConfigurationProperties annotation    See gh-7397
Update tests to look for snippets in correct location    See gh-23598
Update tests to look for snippets in correct location    See gh-23598
Allow RouterFunction parameterized with different types    This commit allows *any* type of `RouterFunction` to be injected in the  WebFlux.fn auto-configuration; previously the `RouterFunction<T>` would  restrict injected beans to a single parameterized type.    Doing requires using the `RouterFunction.andOther` method to collect  them.    Fixes gh-9181
Polish 'Avoid NPE in PropertyMappingContextCustomizer'    See gh-9914
Remove useless import
Use and wait for a latch to check that the interceptor is called    Spring MVC drives the postHandle method on any interceptors after the  response has been sent to the client. This meant that there was a  race between the test receiving the response and asserting that the  interceptor had been driven and Spring MVC driving the interceptor.    This commit updates the interceptor to use a CountDownLatch to track  whether or not it's been called. The test now waits for up to 30  seconds for the latch to be decremented.    Closes gh-1997
Align test with change to exception in latest Framework snapshots
Polish 'Remove a redundant dash in TestPropertyValues.Type'    Closes gh-11156
Use non-blocking I/O for Docker API    This commit changes the NamedPipeSocket used for communication with  a local Docker daemon to use a non-blocking AsynchronousByteChannel  instead of a blocking RandomAccessFile, modeled after a similar  change to the docker-java project. This eliminates the potential for  a blocking call to hang indefinitely.    Fixes gh-21672
Remove start/stop integration test    This test is not useful in this context.    Closes gh-9889
Fix build after SPR-17034 in Spring Framework    Since SPR-17034, the core container now behaves a bit differently when  dealing with `null` beans.    Given a `null` `HandlerMapping` bean named 'resourceHandlerMapping':    * `context.getBean('resourceHandlerMapping', HandlerMapping.class)`  still returns a `NullBean`  * `ListableBeanFactory.getBeansOfType` will return a Map of all existing  beans, not including the `null` ones as values of the map.    Closes gh-13760
Rename a test method to use dir instead folder    Closes gh-4434
Use Collection.removeIf() where possible    See gh-13871
Rename missing test
Remove v[N/A] log output
Assign on order to OnPropertyCondition    Closes gh-7144
Avoid double-reg when a Servlet or Filter implements ServletContextInitializer    See gh-4902
Make tests' detection of SSL handshake failures more robust    Closes gh-12961
Fix accidental banner regression    Fix accidental regression introduced when I tweaked the updated  banner support (commit aaed87d1).    See gh-5636
Polish 'Remove usages of BasicAuthorizationInterceptor'    Closes gh-14830
Use file based loader with MockServletContext    Update SpringApplicationContextLoader so that the MockServletContext  uses FileSystemResourceLoader. This allows `/src/main/webapp` folder  to be found.    See gh-2654
Remove unecessary semicolon
Remove System.out.println()
Use a random server port in the Couchbase sample\xe2\x80\x99s tests
Remove a test doing nothing    Closes gh-5673
Remove unused configuration map    Remove the configuration map defined in `GroovyTemplateProperties` which  isn't used. Ironically, that configuration map was exposed with the exact  same prefix as `GroovyMarkupConfigurer`, which broke IDEs support since  two entries had the exact same prefix.    Fixes gh-2840
Increase ESRestTestCase.waitForClusterStateUpdatesToFinish time out to 30s  It is set to 10 sec but sometimes it takes the cluster longer to settle.
make test more deterministic
remove duplicate rule which led to double scoring  r3344
GraalCompiler.emitLowLevel: remove superfluous scopes.
Cache Skylark globals.  Summary: Previously all Skylark extension globals would be repeatedly setup for each individual extension file, which is wasteful, especially since some of that work is using reflection under the hood.  Reviewed By: styurin  fbshipit-source-id: 1d85b96
Remove usage of Cloneable from Javadoc. #1555  Fixes `UseOfClone` inspection violation.  Description: >Reports calls to and implementations of the clone() method and uses of java.lang.Cloneable. Some coding standards prohibit clone() usage, and recommend using a copy constructor or static factory method. Calls to clone() on arrays are ignored, because that is a common, correct, efficient and compact way to copy an array.
Remove unnecessary cast in PrestoS3FileSystem
mute testDifferentRolesMaintainPathOnRestart  See https://github.com/elastic/elasticsearch/issues/23728
CAMEL-3905: Polished error message in camel-cache. Thanks to Piotr for the patch.
Spotted when looking at TIKA-1617 - DefaultParser should override getAllComponentParsers to mirror getParsers behaviour when a dynamic service loader exists
set query cache to null
Introduce TestContextManager(TestContextBootstrapper) constructor  Issue: SPR-12683
Use SocketWrapper provided write method
Rewrite the very slow test for join  This test took 4 minutes to run because it cross joins two tables, now it takes 1 second.
CAMEL-11862: Added unit test
removed unused vars
CAMEL-5074: Improved javadoc
Test Counters in a particular Locale
InstrumentationTestLanguage:  support RootNode.getName()
Fixing a test, new mockito version is more accurate with null values.
TIKA-312: TikaCLI can't print metadata  Patch by Maxim Valyanskiy
Clarifies in Javadocs that SpannerIO currently does not support streaming.
r/m unused methods
[TEST] inject a random index to TestClusterService in BaseQueryTestCase#init  Some of our next queries to refactor rely on some state taken from the cluster state. That is why we need to mock cluster service and inject an index to it, the index that we simulate the execution of the queries against. The best would be to have multiple indices actually, but that would make our setup a lot more complicated, especially given that IndexQueryParseService is still per index. We might be able to improve that in the future though, for now this is as good as it gets.
add logger field for ease of debugging.  patch by jbellis
[java] Deleting unused imports
removed unused imports
Rename class CamelMvcRoutesEndpointTest to CamelRoutesMvcEndpointTest  Signed-off-by: Gregor Zurowski <gregor@zurowski.org>
snapshot path is accountId + volumeid
SimonStewart: Backing out change to the firefox driver test suite  r6128
DRILL-4159: Remove trailing space
fixed "packagesToScan" to avoid additional provider scan (SPR-8936)
CAS-1386: Fix IV handling for ClearPass in clustered environments  Force lowercase of username in case-sensitive hashing
https://issues.apache.org/jira/browse/AMQ-6083 - ignore test scenario on leveldb store
Enable trace logging in CCR retention lease tests  These tests are failing somewhat mysteriously, indicating that when we renew retention leaess during a restore that our retention leases that we added before starting the restore suddenly do not exist. To make sense of this, this commit enables trace logging.
fixed checkstyle issue by removing the unused import
Clear Channel.eventLoop on deregistration
Use IndexModule.getSettings() to get the settings.  Original commit: elastic/x-pack-elasticsearch@770f859b6cadf4c93d0069567bc5e80ee48ce1dd
mark the default static initializer as synthetic
Proper lookup for admin permission  - Added proper name to AuthSubject
Fixed issue 343 with the patch by the issue reporter
Polish Javadoc for TestContext
Warn in case of incomplete low-level API
Use privateGetPublicMethods() as it is simpler and more direct for this case
Injector should support auto-wiring so eg Spring can create bean instances that uses auto-wiring on bean constructors.
fix compile for ingest plugin lambda
Forgot to close the channel
Fix up checkstyle
Remove unused operator dependency
Add @Override to interface methods in HttpRequestSessionContext
add jmxPort to stress args (ninja)
CAMEL-12575:NPE on GET request with Content-Type header
Ensure that both statement and cursor are closed
MAHOUT-504: improved error message in Fuzzy k-Means
Do not restart daemon on cache mode change  Summary: Add some cache configuration that do not affect parsing to a set of fields that do not cause a daemon restart. This only includes some of the most commonly modified fields, especially `cache.mode` which changes when `--no-cache` is passed to Buck.  Test Plan: Run `buck build` with and without the `--no-cache` flag, check that the flag is respected but the daemon is not restarted between runs.  Reviewed By: Coneko  fb-gh-sync-id: b250ee2 fbshipit-source-id: b250ee2
Fix GLFrameBuffer  Allows graphic card which supports GL_EXT_packed_depth_stencil to pack depth and stencil.
Oops, missed this use of the MapFactory
CAMEL-6555 Removed the useless option setting
Remove unused method.  Reviewed By: jtorkkola  fbshipit-source-id: d1070349ca
Use requredRule instead of getRule when doing a cache lookup  Summary: When doing a cache lookup use requiredRule instead of getRule. requiredRule retrieve the buildRule. If no rules are associated with the target, compute it by transforming the TargetNode associated with this build target using the TargetNodeToBuildRuleTransformer associated with this instance.  Test Plan: `arc nano` and `buck build mode/iphonesimulator --distributed wilde`  ``` ~/local/buck/buck-out/gen/programs/buck.pex build --distributed -c cache.key_seed=${RANDOM} -c sandcastle.tenant_id=ruibm -c stampede.always_wait_for_remote_build_before_proceeding_locally=true --buck-binary ~/local/buck/buck-out/gen/programs/buck.pex stampede/example:stampede_folly_folly Parsing buck files: finished in 13.4 sec (100%) Creating action graph: finished in 2.2 sec (100%) StampedeId=[stampede3996288215093575337] Distributed Build: finished in 02:42.6 min (100%) local status: succeeded; remote status: finished_successfully, 2138/2138 jobs, 16.9% cache miss Downloaded 816 artifacts, 7.52 Mbytes Building: finished in 02:43.0 min (100%) 1942/1942 jobs, 1942 updated, 0.0% cache miss   Total time: 02:58.7 min ```  Reviewed By: ruibm  fbshipit-source-id: f1c38d3
Add io.netty.noJdkZlibEncoder system property  Related issue: #2821  Motivation:  There's no way for a user to change the default ZlibEncoder implementation.  It is already possible to change the default ZlibDecoder implementation.  Modification:  Add a new system property 'io.netty.noJdkZlibEncoder'.  Result:  A user can disable JDK ZlibEncoder, just like he or she can disable JDK ZlibDecoder.
Update for Gump now these are known Ciphers
- Compatibility with Eclipse 3.2 (sort of, the flag doesn't mean the same thing, with the new one   doing some new unknown stuff).
Use interface instead of concrete deprecated class.  Summary: `PathOrGlobMatcher` should be replaced with specialized `PathMatcher` children.  Reviewed By: bobyangyf  fbshipit-source-id: 578e880def
Logging the entire query string; crucial bit of logging   r3571
KAFKA-2813; selector doesn't close socket connection on non-IOExceptions  Patched Selector.poll() to close the connection on any exception.  Author: Jun Rao <junrao@gmail.com>  Reviewers: Guozhang Wang <wangguoz@gmail.com>, Gwen Shapira <cshapi@gmail.com>  Closes #501 from junrao/KAFKA-2813
bug 10422: accidentally removed the code for sourceTemplate id when the the volume is created out of template. Checking it in. status 10422: resolved fixed
Pull up EtlBaseTest.getResult()
beef up Javadoc
Swap from READ_TRANSFORM to PAR_DO_TRANSFORM
Add toString to OperatorContext
Remove existing output before creating new one in AppleDsym.  Summary: Fixes #794.  Test Plan: CI  Reviewed By: beefon  fbshipit-source-id: 6007d99
UnsafeArrayCopyNode: location identity must be ANY_LOCATION as it lowers to snippets containing nodes with ANY_LOCATION
HHH-5182 - Inject SessionFactory into "non-basic" Types
Mute the 'arc focus' nudge when generating a Project View  Test Plan: `buck test //test/com/facebook/buck/ide/intellij/projectview && buck test //test/com/facebook/buck/ide/intellij`  fbshipit-source-id: c55e36e
Move a test to itest since it relies on data files
Add test for calling varchar(x) function with varchar
Don't clear down thread counts at end of test
Add missing property
Replace getRuleOptionalWithType..addToIndex with computeIfAbsent in CxxInferEnhancer  Summary: This fixes potentiall race conditions when constructing action graph in parallel.  Also inlined some now trivial functions.  Test Plan: CI  fbshipit-source-id: c52ea80
Add a random date within a specific date range function : Fix checkstyle File does not end with a newline
Clarifies that TextIO.Write will overwrite existing files  ----Release Notes---- [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=95149056
Add @Deprecated to Collection.min()
Add more information to asserts and assert on the result of refresh.
Add an NPE guard
Camel-AWS EC2: Change Producer error messages
#9 -v CLI flag for querying the installed Checkstyle version Fixed formatting issue.
Set selection index to zero when items changed.
Issue #1555: Replace constructor with setUp() in JUnit test case  Fixes `TestCaseWithConstructor` inspection violations.  Description: >Reports on JUnit test cases with initialization logic in their constructors. Initialization of JUnit test cases should be done in setUp() methods instead.
Removes unused code from NoOpOldDoFn
Remove a TODO marker for something long since completed
Forgot clearGui() for this element
remove misleading javadoc statement
Reduced sleep interval to poll for closed output channels
Adds missing bit from the original CLVM patch 263216caa5b548099451f669fae918ed63608fd7 (https://reviews.apache.org/r/6470/) regarding 'patchDisk' in createPatchVbd. This same patch should apply cleanly to both master and 4.0 branches  RB: https://reviews.apache.org/r/6615/ Send-by: shadowsor@gmail.com
Compensate for Eclipse vs Sun compiler discrepancy  Eclipse allows autoboxing on type inference; Sun javac does not. This means that variables assigned from calls to AnnotationAttributes#getNumber should consistently use object wrappers as opposed to number primitives. There was only one such instance anyway, and has now been updated accordingly.
Set LowResourcesMaxIdleTime in Grid to avoid timeout of 'forever'. Fixes issue 6770.
fixed test case to close down the connection in between test cases to avoid duplicate clientID exceptions
CLOUDSTACK-2923: Delete Secondary storage of a Zone was giving NPE bcz we were still refering to the object. Instead log that the cpvm and ssvm cant be created bcz sec storage is not available
Initialize STGroupFile with url, not file path  - absolute file paths not reliable way to find resources on classpath - requires changes to ST4 in this PR: https://github.com/antlr/stringtemplate4/pull/199
#NAME?
Remove unnecessary hash table lookup on every perf event.  Summary: This is also causing ConcurrentModificationException on Java 9+ since previous code was essentially modifying the map while computeIf block is running.  Test Plan: CI  Reviewed By: jtorkkola  fbshipit-source-id: 3784ad3
GraphPrintVisitor implementation can now be disabled via system property
https://issues.apache.org/jira/browse/AMQ-4369 - ensure default handler in place before transport connectors are started
SPR-5986 - Error in pointing links about versions for documentation and content
Log seconds into Scribe instead of Milliseconds  Summary: Scribe needs seconds in "time" field, not milliseconds.  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 004980b
Fix test broken by update to encoding. Generally, it is far too difficult to re-encode characters that were encoded in the original URKL when they didn't need to be.
[BEAM-282] Remove the RunnableOnService from testPassThroughThenCleanupExecuted()
Describing the purpose of debugger's tags
2.x: Expand the documentation of the Flowable.lift() operator (#5863)
Get these tests passing on my Mac
Experiment: Node based budget.
Use different dispatchers for actors and for queues emitting results
MINOR: SuppressionIntegrationTest should set StreamsConfig.STATE_DIR_CONFIG (#5847)  Sets StreamsConfig.STATED_DIR_CONFIG to temp directory in SuppressionIntegrationTest, to match StreamsTestUtils.  This is a similar fix to #5826.  Reviewers: Ismael Juma <ismael@juma.me.uk>
Limited query on users and roles to retrieve only the first. This will speedup performance on large user basis
it's not possible in new groovy to get a method closure from a property. See MetaClass:621
set correct info message
some code cleanup
add missing copyright header
Fixed java client's serialization of NetworkConnection. (#3125)
Add toString to OperatorContext
Return null when output is empty in HashAggregationOperator
Fix failures in testAllOpenSSLCiphersMapped() after changes to how unit test reports cipher names in r1615205 Start to fix testOpenSSLCipherAvailability() but more work required
Retry Unit Test from #879  From https://github.com/Netflix/RxJava/issues/879
Remove pseudo-dependency to zlib for jniplatforms
De-@Betaify Optional. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=30422058
javadoc enhancements for the new doOnSubscribe() method
Remove tests rendered unnecessary when context.xml files were moved from appBase to configBase
reduce default number of restarts and down time to reduce duration
Add some tests for annotation values of type Class  Summary: (Reapplying this commit after the stack was reverted; this commit was not related to the failure.)  `StubJar` is going to be gaining the ability to generate stub jars based on `TypeElement`s.  This commit closes some test holes. No bugs found, but good to have the coverage.  Test Plan: New unit tests  Reviewed By: asp2insp  fbshipit-source-id: 4638e1d
Adjust Lucene version for 6.7  Relates #37088
Improve error message  Issue: SPR-16214
Remove unthrown Exception
Remove the callAllGets 'feature' of CombinedFuture.  This should only be necessary for buggy future implementation  This is a rollfoward. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=65725521
Optimize map_concat to skip empty map  Performance before: Benchmark                     (mapConfig)  Mode  Cnt     Score     Error  Units BenchmarkMapConcat.mapConcat   left_empty  avgt   20  1838.641 Â± 145.909  ns/op BenchmarkMapConcat.mapConcat  right_empty  avgt   20  1515.713 Â±  96.888  ns/op BenchmarkMapConcat.mapConcat   both_empty  avgt   20   615.368 Â±  57.051  ns/op BenchmarkMapConcat.mapConcat    non_empty  avgt   20  2753.727 Â± 503.407  ns/op  Performance After: Benchmark                     (mapConfig)  Mode  Cnt     Score     Error  Units BenchmarkMapConcat.mapConcat   left_empty  avgt   20   392.266 Â±  38.556  ns/op BenchmarkMapConcat.mapConcat  right_empty  avgt   20   376.552 Â±  32.928  ns/op BenchmarkMapConcat.mapConcat   both_empty  avgt   20    55.276 Â±   7.683  ns/op BenchmarkMapConcat.mapConcat    non_empty  avgt   20  3043.951 Â± 553.951  ns/op
CID-1257434 try with resource
comment use of synchronization in BytecodeParser.maybeEagerlyResolve
Remove EasyMock from CleanCommandTest  Reviewed By: ttsugriy  fbshipit-source-id: 7e3dbf1
Start working on a copy constructor test - stopped once I realized no Index supports remove() anyway
[TEST] RecoveryWithConcurrentIndexing test (#40733)  Due to https://github.com/elastic/elasticsearch/issues/40731
Inserted an empty line
Adding missing expected conditions. Fixes issue 4698
Clean up warnings in Gradle build output
No logical changes: remove unused import
Clean-up post init/destroy lifecycle refactoring Allow Loader objects to be restarted
Don't create ABIs from source if postprocessing classes  Summary: A postprocessing step might modify the class files, rendering a source-based ABI incorrect.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: a7a774f
Add missing @Override annotation
make API changeServiceForVirtualMachine work by changing @entityType of parameter serviceOfferingId to ServiceOfferingResponse
Differentiate between the top and non-top FrameState bci when computing BytecodePositionWithId.
after I updated from SVN, the string appeared to be missing the closing double quote and semicolon. fixing it so it  compiles peter lin
Decreases QUERY_LIMIT in Datastore reader from 5000 to 500 because 5000 is, per Datastore team, too high. ----Release Notes---- [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=91604673
remove System.out.println in Table.java
Fixed Javadoc of LifeCycleAwareChannelHandler * Some handlers (e.g. SslHandler, ZlibEncoder) need to store its context somewhere, and they needed to implement both beforeAdd() and channelOpen() because beforeAdd() is not called if pipeline is not attached.  This led to code duplication.  To address this issue, ChannelPipeline now always calls the life cycle listeners whether it is attached or not
GROOVY-4062: Add getBytes to InputStream, URL and File (patch thanks to jeremi Joslin) GROOVY-2945: Binary counterpart to setText(File, String)
CLOUDSTACK-191: Update checking for updateCustomerGateway  Reviewed-by: Anthony Xu  Conflicts:      server/src/com/cloud/network/vpn/Site2SiteVpnManagerImpl.java
Improves adding tokens to collection
Test file loading
https://issues.apache.org/jira/browse/AMQ-3887 - have local dispatch do safe wait till remove broker setup is complete such that producer is fully created
KristianRosenvold: Now also compiles  r13642
Make TypedSize.getEstimatedSize more accurate  Previously we excluded the size of the instance itself, which is significant since this is used in grouped aggregations. Also, we only included the logical size of the BlockBuilder rather than the full retained size
Add missing transferToInterpreterAndInvalidate
improve failover transport failure message to include client port, which makes will make it easier to debug things in multi-connection clients
better exception message when failing to parse a specific field
remove the listnetwork, which causes mgt server uses 100% cpu, if you have 600 records in networks table
Removed useless and illegal json object in the response.  Relates to #5865
JTTTest: add optional 'bind' and 'noProfile' parameters
Make timer run as daemon  so it doesn't prevent normal shutdown by exiting from main().
test: RelocationTests.testCancellationCleansTempFiles may fail due to io errors while check temp files are deleted  Windows can throw NoSuchFileException when using File.walkFileTree and deleting files concurrently. This commit changes IO exceptions into assertion error so that assertBusy will wait for them as well.
Added default RMI name of the shell to reflect the default name of the shell client. Out of the box experience is important.
applying the patch for the accesslogSampler to the 2.1 branch peter
Show warning about invalid jarfiles if --verbose is used
Remove deprecated code
Review of r1457429: Make logic more clear. No functional change.
Rename test to make way for a genuine unit test
Return null when output is empty in HashAggregationOperator
Revert: [buildengine][easy] SupportsInputBasedRuleKey.isSupported to accept BuildEngineAction  Summary: This reverts commit [buildengine][easy] SupportsInputBasedRuleKey.isSupported to accept BuildEngineAction.  fbshipit-source-id: f7182cef69
Remove pointless Javadoc block
Add test to assert that preconditions are met before moving on to the rest of the checks.
Make RegexLanguage public so its options are exposed by launchers
Fixed issue on deletion of null records
Pass result to saveResponseData
TIKA-2722 -- remove dead code and prevent potentially bad date.toString() call.
bug 7950: removed IPAssoc usage events for system account status 7950: resolved fixed
Remove spaces.
Fixed CS for Camel-test
Standalone runner expects path.home to be set  With elasticsearch 2.0, `path.home` must be set now. Standalone Runner (test) is using elasticsearch CLI which relies on `Environment` to be set.  It produces now:  ``` Exception in thread "main" java.lang.IllegalStateException: path.home is not configured     at org.elasticsearch.env.Environment.<init>(Environment.java:99)     at org.elasticsearch.node.internal.InternalSettingsPreparer.prepareEnvironment(InternalSettingsPreparer.java:85)     at org.elasticsearch.common.cli.CliTool.<init>(CliTool.java:107)     at org.elasticsearch.common.cli.CliTool.<init>(CliTool.java:100)     at org.elasticsearch.index.mapper.attachment.test.standalone.StandaloneRunner.<init>(StandaloneRunner.java:170)     at org.elasticsearch.index.mapper.attachment.test.standalone.StandaloneRunner.main(StandaloneRunner.java:175)     at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)     at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57)     at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)     at java.lang.reflect.Method.invoke(Method.java:606)     at com.intellij.rt.execution.application.AppMain.main(AppMain.java:140) ```  Closes #167.
Switch buck project default to not build targets unless --build is defined  Summary: Building all modules when doing buck proejct is not a good decision in retrospect. If one wants to see generated code, they are better off building the modules they need and not waiting for all of them in the wrong moment. The solution is just flipping the default, and requiring someone to add `--build` when they want this. I kept the original flag to now break people's commands in the meantime.  Test Plan: Run `buck project <target>` with and without --build, see that nothing is built without `--build` mentioned.  fbshipit-source-id: a9fe298
CAMEL-9965: Add javadoc about streaming problem
made it easier to reuse the CamelResourceConfig class, letting you pass in the packages as a constructor
change the private scope, add another option for required, but no default value
CAMEL-9118: camel-pgevent, use pg_notify for sending notifications with postgres verion 9 and above. Thanks to James Lindstorff for the patch.
IndexProxy extends IndexConfigProvider  ... instead of defining it's own indexConfig() method.
added extra test for guarded inlining
Applied patch from Tom Vijlbrief for AMQ-724
CAMEL-8856: Add Eviction Map Consumer Test
wrote a test to answer question on mailing list, shows wildcard subscription with STOMP
Keep metaclass changes in built script instances
Show file encoding
Ensure all reasons for stopping the test are logged
Fixed bug on mmap write for empty records
fix test method name
CLOUDSTACK-8911: VM start job got stuck in loop looking for suitable host
A little tuning using AtomicLong instead of synchronized method when generating an unique id
Clean up imports
return true if the copy works.
SimonStewart: Make the IE driver consistent with the chrome and firefox drivers  r10506
Correctly calculate checksum when using GZIP. Part of [#2168]
Avoid NPE when doing CFS.scrubDataDirectories
Increase size of response that is written and reduce data read before client drops the connection in an attempt to get this test passing with APR in Gump. Currently the entire reponse is written (and buffered somewhere in the network stack) before the client drops the connection.
[hotfix] Reduce string concatenations in ExecutionVertex
Updated schema file name for 2.2.5-2.2.6 upgrade
[hotfix] Add missing space to log message in ZooKeeperLeaderElectionService
Acquire read lock before accessing guarded map  Summary: Infer flagged this up as missing lock  Test Plan: CI  Reviewed By: marcinkosiba  fbshipit-source-id: 66d88d2
CAMEL-5746 add copy method to WireTapDefinition to let user choice if copying or not copying the origin exchange
Fix incorrect error on type mismatch for set operation  The arguments to the error message were swapped.
reuse a shared UrlPathHelper instance in order to avoid reinstantiation overhead (SPR-7269)
ChannelOutboundBuffer returns total pending write size  total pending write size may be used to optimize write batching
remove unused import because of the previous pushed commit
Unused import removed
more scan tests to try and recreate the context missing failure, no luck yet...
The withMimeType method is obsolete. Use the Builder's mimeType one.
Suppress deprecation warnings in AnnotationProcessorPerformanceTests
bug 13781: reload host detail after host reconnect status 13781: resolved fixed Reviewed-by: frank
Add missing compilation final dimension to successor array in LLVMTerminatorNode
Fixed the issue of takeLast(items, 0)
CLOUDSTACK-7348 InvalidParameter Exception while executing scale vm.  We do not throw the exceptions any more, so added info in the logs to say what happend to this command.  Signed-off-by: Rajani Karuturi <rajanikaruturi@gmail.com>
Remove deprecated method
Remove @author tag - it should have been removed in the original commit
Corrected package and some imports in CppTarget.java.
DouniaBerrada: Adding contructor for custom WebView and custom focus listener.  r15510
Removed parameter validation in constructor. Now being handled in doStart()
update slow test for ssplit changes
AwaitsFix GeoShapeQueryTests#testPointsOnly #27454
Fixed ActorGestureListener pan and zoom for rotation and scale.  closes #3157
Use ImmutableMap instead of LinkedHashMap
c* uses commons-lang3, not commons-lang
Make the new highlighter more robust
more info on failed key/column name length assert
Mark IP range aggregator test as awaits fix  This test reliably fails with the seed 4AC319F8A6B0329B.
Remove unnecessary check for boolean  `musics.get(i).wasPlaying` is a boolean value, no need to use `== true` to check it.
[ML] Fix NPE by calling super constructor that inits members. (elastic/x-pack-elasticsearch#1763)  Original commit: elastic/x-pack-elasticsearch@ee47ad832224c2e2bc0b0099d8505dca98ba0d7d
Added Kafka Topic as Stream ID for emitted tuples
Add @Override markers
Mute MlDistributedFailureIT#testFullClusterRestart()  Relates elastic/elasticsearch#25415  Original commit: elastic/x-pack-elasticsearch@01fa0e76014d0c1281370521d09db82238129c7e
doc: fix documentation for METHOD_REF token
CLOUDSTACK-3351: Fix add cluster API to set right hypervisor type  Signed-off-by: Abhinandan Prateek <aprateek@apache.org>
Uses the migration test utils from kernel
Add a system property that disables Javassist
Remove incorrect check when expiring queries  A query that's in the expiration queue will necessarily have an associated query execution, so checking whether queries.remove() returns non-null and logging an error is incorrect.
Return null when output is empty in HashAggregationOperator
Remove settings filtering for service_account in GCS repository  Related to #18945 and to this https://github.com/elastic/elasticsearch/commit/35d3bdab84fa05c71e8ae019aaf661759c8b1622#commitcomment-17914150  In GCS Repository plugin we defined a `service_account` setting which is defined as `Property.Filtered`. It's not needed as it's only a path to a file.  Closes #18946
Easy one-liner: Fix i18n-unsafe API in AaptStep  Summary: Does what it says on the tin.  Test Plan: CI  Reviewed By: ryu2, dcolascione  fb-gh-sync-id: fed06c3
Better naming, and new test  ... using to compare 0.19 and 0.20 so want in both.
Use the builder bailout.
Make TokenVocabParser fields `protected final`
PropertySourcesPropertyResolver provides logKeyFound template method  Issue: SPR-14370
SAML SLO: get metadata for requesting service only (#3058)  bug that this patch is fixing: when verifying the signature of an incoming SAML SLO request, SAML metadata for all services had to be resolved. In case another service's metadata file was unavailable at logout time, this caused an exception screen to be returned to the user and no logout to happen. Now, only the requesting service's metadata is required to validate the signature.
TIKA-89: Rename MimeType and MimeTypes  Keep media type parameters in an unmodifiable sorted map.
Fix javadoc tag. (#41329)  s/returns/return/
just read byte in channel buffer wrapper, no need to check for bounds since it is checked internally
Remove unused getProgress method from OrcRecordReader
Helpful to preserve the arguments used for building the parser
Removed debug println
Make `AbstractCapabilities` implement `toJson`  The capabilities subclasses were the only thing using `asMap` for serialisation to JSON. Everywhere else, we use `toJson`. Might as well make it consistent.
Fix javadoc to correctly explain how ChannelDuplexHandler.deregister(...) works. (#8577)  Motivation:  We had an error in the javadoc which was most likely caused by copy and paste.  Modifications:  Fix javadoc.  Result:  Correct javadoc.
cleanup parameters to handleStateRemoving.  patch by jbellis
Changed ip for testing refused ldap connection
Make MasterClient connection errors be logged as debug instead of info  They are rather low-level, benign, and have little context attached. They sound scary, but people should really not worry about them.
Specify constant-time behavior for HashCode.equals(). ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=92925537
Remove unused import from o.e.c.h.MessageDigests
compress cluster state when publishing it
Increase the test timeout for PageCacheTest#rewindâ¦
CAS-1316: Added missing copyright block
bumps version to stable 3.0.0m1 for release
Fixed CS for camel-script
SimonStewart: Updating the docs on the web element to make it clear that a freshness check is performed.  r8673
[hotfix] Improve ParameterTool exception  This closes #2057
Fix for: https://issues.apache.org/jira/browse/AMQ-4104  Let the protocol converter handle setting the version after it forwards the CONNECTED frame.
introduce isolated unit test for BuilderSupport
Add license header to Maps
Push for eu-west-2 issue
Add cxx output path validator in CxxPreprocessAndCompile  Reviewed By: aiked  fbshipit-source-id: aa33b6d71c
Remove unused import
Fix error messages in `Parser` to use unix-style paths  Summary: This adds consistency in how we talk about paths.  Test Plan: `ant test -D"test.class"="ParserTest"` now passes on Windows
Correctly determine if DoFn has an anonymous class in ParDo
Adapting RestRankEvalAction to changes in API on master
Moved socket connect after parameter settings. Is it the responsible of network slowness with Linux?
Add version 6.0.0-beta2 after release
CAMEL-5324: Improved file component to use marker file in read locks to support clustered Camel apps, with multiple file consumers competing for files on a shared drive.
Mute ShrinkIndexIT  This is tracked at https://issues.apache.org/jira/browse/LUCENE-8318
Make JSFile rules cacheable  Summary: This was added in D5283459 because it was faster to build the rules than download them. This no longer seems to be the case (see the test plan), so we can cache the rules again instead.  Reviewed By: cjhopman  fbshipit-source-id: 3e69024981
bug 13023: fixed listAccounts to return all accounts the user is authorized to see status 13023: resolved fixed
Move replaceInPredicates method under the usage
Console: aligned to the right the record count for indexes
beef up Javadoc
Remove unnessary annotations
fixed missing import resulting from merging with master
remove double setting clear
Add utility method to get the latest version of the previous minor
Export waiting time counters
Add simple name to test context   r4313
Forwarding Enter key char in Lwjgl3Input
adding support for DOUBLE proeprties
Removed unused imports
Split plan into fragments only at remote exchanges
some more refactoring
Remove ineffective assert statement.
Annotate Http2ServerDowngrader with @UnstableApi  Motivation:  Everything in the http2 package should be considered unstable for now  Modifications:  Add missing annotation on Http2ServerDowngrader  Result:  Clearly mark class as unstable.
Catch the right rejected execution exception  ThreadPool#schedule can throw a rejected execution exception. Yet, the rejected execution exception that it throws comes from the EsAbortPolicy which throws an EsRejectedExecutionException. This exception does not inherit from RejectedExecutionException so instead we must catch the former instead of the latter.
New OrientGraphFactory.drop() method
Revert "Exploit DiscoveryNode immutability..."  This reverts commit e76038e076bb66fd4deac62cd8f2ffd9d423cea6.
Added test case for property MAX
Updated Javadoc: date format patterns SPR-17366
WW-1317   - changes in javadoc (uses dojo tooltip attributes as example)
Add unit test for loopsSimulateTailRecursion
Compile on Java8. Fixes #2149
Remove unused import
slip in tests for windowFocus(), windowMaximize()  r2788
refined Resource "exists()" check for HTTP URLs to always return false for 404 status (SPR-7881)
[CALCITE-35] More test cases to guard against providing a broken fix for parenthesized join (Muhammad Gelbana)  Close apache/calcite#1228
MINOR: Print offset and size in sendFetches  Author: Guozhang Wang <wangguoz@gmail.com>  Reviewers: Jason Gustafson <jason@confluent.io>  Closes #3063 from guozhangwang/KMinor-more-logging-in-fetcher
[hotfix][tests] Make SynchronousCheckpointTest create StreamTask instance in the main task's thread
Summary: KVM - double migration can fail  Detail: Undefine VM after migration. Lingering domain definitions cause migrations back to the original host to fail, since domain already exists.  BUG-ID: CLOUDSTACK-2640 Bugfix-for: 4.1.0,4.2.0 Signed-off-by: Marcus Sorensen <marcus@betterservers.com> 1369285950 -0600
Remove cast to short to allow storing second offset correctly.
Remove unused items
push down btree keyEnd fetching to where it's needed"
Issue #2604: Refactoring of SingleLineJavadoc to resolve LocalVariableName violation
Camel-AWS: Lets use AbstractAmazonSNS in the AWS SNS Client Mock for tests
Remove warn messages: now are as debug messages
Removed useless import.
Distributed: made hazel cast configurable by using dynamic API
minor improvement in object creation
Remove last reference to ServerFactory
Fixed a NPE on document traversing
Add additional comment on data block sizes properties evaluation lifecycle. Remove old not used method.
improved report for failing tests
Switch the AJP connector to NIO by default too
Remove build description from ConfigSettingDescription  Summary: No longer needed.  Reviewed By: ttsugriy  fbshipit-source-id: a6620d297b
Also display tool-tip for the label
Log the unsanitized redirect URL to facilitate abuse investigations.
Update SDK to correctly set replaceJobId on the Job.  ----Release Notes---- Update SDK to correctly set replaceJobId on the Job instead of the Create request.  [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=99302893
GROOVY-5146: Improve javadoc for VariableExpression
Register all the installed file system providers at image build time.
Added comments. The dialect should also fix HHH-3936
[hotfix] Correct preconditions check in TypeExtractor#getBinaryOperatorReturnType
Removed a '.*' import.
Ensure CachingBuildEngine uses a ConcurrentHashMap for buildInfoStores  Summary: BuildInfoStores depends on computeIfAbsent being called exactly once for each key, which isn't guaranteed by ConcurrentMap.  From reading the guava source, newConcurrentMap should be returning a ConcurrentHashMap anyways, so this probably doesn't cause any problems "in practice", but it's better to be explicit that this behavior is desired.  Test Plan: local builds, CI  Reviewed By: marcinkosiba  fbshipit-source-id: 6cbd0bb
WW-2800 Added setters for response, request and context.
use stream instead of iterator to simplify logic a bit
ignore failing test for now - andy c to look at next wk
Better check for classes that must not be initialized during image generation
Remove Page.getBlocks()
Added license header.
CAS-1422 SamlUtils Should Restrict DocType Declaration and Entities via Feature Disabling
Update FPSLogger to use nanoTime.   "currentTimeMillsis" pulls time from the system clock and should not be used to measure elapsed time. Other processes like NTP, or the user, can alter the system clock and the time returned can unexpectedly shift and create bizarre and intermittent behavior.  "nanoTime" is a measure of nanoseconds from some arbitrary time point and is safe for measuring elapsed time.  The results of this bug are rather benign â worst case the time is changed back and you would not get a framerate log message for that time, or until the user restarts the program. However, this flavor of bug can cause significant intermittent issues if present in other areas if the user is unfortunate enough to have his clock changed while he is playing (this happens more than you may think thanks to NTP keeping our system clocks in sync.)  See:  http://docs.oracle.com/javase/7/docs/api/java/lang/System.html#nanoTime%28%29 http://docs.oracle.com/javase/7/docs/api/java/lang/System.html#currentTimeMillis%28%29
add the exception as well to the logging
Make field STANDARD_ESCAPES final
[TEST] Verify the flush reponse
Revert rev 1430160 as then camel-manual cannot build.
AlexeiBarantsev: Chrome supports file uploading, unignoring the test.  r17083
Remove duplicated code
Remove static modifier on TaskExecutor runningSplitInfos
guard against npe on error condition
make scheduler more quiet in DEBUG mode as its default polls twice per sec.
[hotfix] Pass BlobWriter into JobMaster instead of BlobServer
Add macOS Sierra (10.12) platform (#3274)
change to avoid NPEs
Add simple name to test context   r4313
Fix usage of @type:"d" in JSON from queries to determine embedded element type
[TEST] Turn off double write check for restore
add iterator based on specific index
Allow message send to finish before shutting down the executor
add toString to match_all docs
Make private vars final
javadocs: add "since" reminder; minor text changes
Avoid using deprecated methods in StringEncoder
OptionProcessor needs to find the type parameter of an OptionValue field declaration
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=38570 When checking docBase against appBase, make sure we check for an exact match against the appBase
Support Unicode escape sequences in JavaUnicodeInputStream with indirection (multiple 'u' characters) (fixes #287)
Distributed tests: writerCount is configurable now
Fix query started accounting with failed queries
Fixed Zip issue with infinite streams.
Use a different separator in `Wid`  `#` is a reserved character in the URL spec and must be escaped to be used. This change uses `-` instead.  Fixes: elastic/elasticsearch#467  Original commit: elastic/x-pack-elasticsearch@a75eb89cb8f5d34dc0a881df543c96ef89489619
Added Troy's suggestion that we set properties on a non-Script derived script
Issue #7723 LongAdder was replaced by AtomicLong
Removed an unused import
CLOUDSTACK-8656: reorganise sychronized block
resolved conflicts after merge with develop
Deprecate unused methods  I doubt these methods will ever be useful, so deprecate them before possible removal.
CAMEL-10345: Logging additional summary for routes coverage in camel-test
Fixed space width when the font reports zero and has padding.  Sometimes the simple things are the trickiest. closes #3455
fix possible problem when trying to convert a binary format to a string
CLOUDSTACK-9736: Incoherent validation and error message when you change the vm.password.length configuration parameter (#2358)  Default value introduce in schema-430to440.sql are 6 for the length  CLOUDSTACK-10111 have already the error message.
Parallel native index population enabled by default
Remove printStackTrace.
CAMEL-4576: throwException EIP now allows to create new exception instance with message with details from exchange using simple language.
Make it simpler to determine which version of state was used to calculate health
[TEST] Enable trace logging for translog recovery
change CrossValidateTestOptions to work with the DVParser as a reranker
allow ovm migrate
Remove duplicate code which is invoked twice (#5039)  Reviewers: Ismael Juma <ismael@juma.me.uk>, Guozhang Wang <wangguoz@gmail.com>
Ignore-Behaviour ignored for HtmlUnit in Test  With regards to https://github.com/SeleniumHQ/htmlunit-driver/issues/57 HtmlUnit doesn't throw UnhandledAlertException in case of Ignore. Basically an exception is totally useless at this point  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Breaks the loop
CAMEL-5657: Ensure eip shutdown thread pool when itself shutdown.
fix for 1242, the array name is no longer used to make the field name, instead the component class name is used
MINOR: fix javadoc comment of Transformer  Here's where it's called: https://github.com/apache/kafka/blob/trunk/streams/src/main/java/org/apache/kafka/streams/kstream/internals/KStreamTransform.java#L64-L67  Author: mihbor <mbor81@gmail.com>  Reviewers: Matthias J. Sax, Damian Guy, Guozhang Wang  Closes #2884 from mihbor/patch-3
Add the setters to the servlet getters in the category.
Size BlockBuilder appropriately in map_keys  Previously we allocated one row worth of space per byte of input
[ML-Data Frame] Add data frame transform cluster privileges to HLRC (#43879)  Adds the monitor_data_frame_transforms and manage_data_frame_transforms cluster privileges to the high level rest client.  The ALL_ARRAY variable is only used in randomized tests at the within the Elasticsearch code, so it's not a major problem that these cluster privileges weren't added from the start.  But since ALL_ARRAY is public HLRC users may be using it to find out which cluster privileges exist, so it's best that it contains them all.
Throttling - HTTP Status 302 should not be reported as failure (#2687)  HTTP status code 302 = Moved Temporarily should not be recorded as submission failure by any throttling interceptor. This status code corresponds to a redirect after a successful authentication, which normally happens if the 'service' parameter is used (this is the normal way of using CAS).
Warn in case of incomplete low-level API
Minor change to makig logging consistent
Moved the dynamic attributes up so that that they are available to type converters in the context
remove System.out.println in Table.java
More clarification on ChannelHandlerContext
Remove un-used import
Verify that control flow graph is valid after partial evaluation  Otherwise the error will be reported later in the compilation pipeline, which is confusing.
Needs to be volatile as it is used in double checked locking
Fixed a test which failed if REL_GRAB_SIZE was set to 1... the test wasn't written properly
Add missing null check in getIntrinsifyingPlugin changes
Changed TaskOperationFailure#getCause() return type from Trowable to Exception.
Fix excessive concurrency when running tests with buck internal test runner  Summary: I inadvertently increased concurrency of tests run with buck internal test runner.  It used to be limited by virtual cpu resoures (num processors), but my changes caused it to be no longer resource aware, and it was running with the concurrency equal to number of threads in the pool instead. This is usually higher than num processors. This contributes to test flakiness.  A more comprehensive fix will come in the future.  Test Plan: visualscrutiny  fbshipit-source-id: cea07c4
Procedure compiler version and disable test output
[Test] Mute EqualsTests..testBranch(Not)EqualsDefAndPrimitive   It fails regurlarly and it is tracked by https://github.com/elastic/elasticsearch/issues/21801
Propagate the nested exception when an EventListener init fails
Fixes a rare test timing issue  Multiple threads tried modifying the same unsynchronized ArrayList. This created a race condition seen on certain machines/OSes in rare occasions. Refactored to have an internal class for the thread, each instance having a volatile field with the result instead.
No logical change: remove unused import
Exploit DiscoveryNode immutability in toString  DiscoveryNode is immutable yet we rebuild DiscoveryNode#toString on every invocation. Most importantly, this just leads to unnecessary allocations. This is most germane to ZenDiscovery and the processing of cluster states where DiscoveryNode#toString is invoked when submitting update tasks and processing cluster state updates.  Closes #17543
Remove deprecated code
Minor Boolean expression simplification  Signed-off-by: Laszlo Hornyak <laszlo.hornyak@gmail.com>
Early-out right before executing steps.  Summary:It can take multiple seconds between scheduling the execution of a rule and submitting the execution of the steps to the executor. In such a case the 'fistFailure' early-out path was not being taken causing the build to keep going way past the first failure.  Test Plan: manual testing  Reviewed By: k21  fb-gh-sync-id: 889a545 fbshipit-source-id: 889a545
More optimistic initial line buffer size
Revert "Restore lost Node#start no-op check"  This reverts commit ddfa3a661510f25c2ce431dfd6fb86ac11eb8888.
better failure when failing to find mapping for the key field in data histogram
Distributed: made hazel cast configurable by using dynamic API
Only release write lock if it was grabbed
make testTimeoutSendExceptionWithDelayedResponse less timing sensitive
Fixed key repeat when losing focus.  closes #3083
Revert timeout change (no effect).
Fix the failing test and add one more test to cover both when/otherwise conditions.
[TEST] remove AwaitsFix from testSnapshotSucceedsAfterSnapshotFailure, turns out the issue is specific to Java 9 v143
Speedup TestHiveFileBasedSecurity  Instead of creating the entire TPCH table set it is enough to create one small table, such as nation.  After closing a query executor reference must be nullified to prevent memory leaks.
Log assertion errors with a lower criticality  Part of #376 on github
Fixed Coverity Issues Reported
No logical changes - removing unused `static` and adding whitespace
In ConditionalEliminationPhase, check whether a ValueNode does record usages; caused crashes in FastR
Adding import for TimeUtils  Forgot to add imports :/
merge from 0.4 branch
more hardening for intermittent failure
give the cleaner almost double the time to clean up the sessions (a whopping 9 more ms). Hopefull will deflake this test in CI.
Unneeded version check was removed.
decode url first before adding to the list
ported fix to trunk :  http://issues.apache.org/activemq/browse/AMQ-1173
Add inline comment to prevent confusion
Mute MonitoringIT.testMonitoringService (#39295)  Relates to #29880  This test seems only to fail in master.
Remove isOpen assertion when sending WebSocket message  Issue: SPR-14138
Log compaction before we commit the transaction
use same method names everywhere
Fix encoding set for query parameters
SimonStewart: Clean up imports of the Renderer class  r16856
fix issue on schema snapshot managment for schemafull documents.
server: volume disk offering owner checkaccess fix  Signed-off-by: Abhishek Kumar <abhishek.kumar@shapeblue.com>
CLOUDSTACK-2067 - ACS4.2 - throw LibvirtException instead of squelching it so that callers of startVM in LibvirtComputingResource know that a vm failed to start  Signed-off-by: Marcus Sorensen <marcus@betterservers.com> 1366224775 -0600
SimonStewart: Setting the default emulation of htmlunit to the latest supported firefox as the htmlunit team tell us that's the most stable  r11870
Remove unused field  Reviewed By: styurin  fbshipit-source-id: 12b7e4b02d
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
removed unused @MethodSubstitution for Object.<init>
[BEAM-7196] Add Display Data to FileIO Match/MatchAll
Test: Run refresh before the search on metadata occurs.  Original commit: elastic/x-pack-elasticsearch@2097f01458d82c3c9a97410dad3deb707ad8c039
Remove some dead-code and cleanup
Added ignore on the CamelSpringJavaconfigTest as it need to be run with Spring 3.x
deprecating untyped indexes
Truffle-DSL: fixed generic type earsure for types in the type system.
Skip null options when converting back to argv
Added method for rolling back all of a slaves transactions (the master side calls it when a slave has gone down)
Fixed unit test on slower boxes
Remove duplicated code
Use proper output path in description  Summary: RunCodeGenStep writes to getPathToOutput This step writes to getMappingPath  Test Plan: CI  Reviewed By: aiked  fbshipit-source-id: f8aef72
allow predicates to be specified in the DSL for completion of Aggregators
use new SpEL parser
add sourceRef to SearchHit
Replace getStaticLabel with getLabelResource
Correctly detect LastHttpContent after encoding
Remove unnecessary synchronized block
Adapting to change in ESClientYamlSuiteTestCase api
Issue #3891: added test support for CheckUtilsTest
don't create infopoint nodes within intrinsics
Buck plugin disable buttons if server isn't connected  Summary: Disable all actions if the server isn't connected, since we may lose information if we don't get the messages  Test Plan: Tested by connecting/disconnecting from the server.  Reviewed By: jimpurbrick  fbshipit-source-id: 71b6965
Remove warning message during dx that affects buck build progress printing  Summary: When using libraries like leakcanary dx prints warnings like ``` warning: Ignoring InnerClasses attribute for an anonymous inner class (com.squareup.haha.guava.base.Joiner$1) that doesn't come with an associated EnclosingMethod attribute. This class was probably produced by a compiler that did not target the modern .class file format. The recommended solution is to recompile the class from source, using an up-to-date compiler and without specifying any "-target" type options. The consequence of ignoring this warning is that reflective operations on this class will incorrectly indicate that it is *not* an inner class. ```  That completely stalls the buck build progress from being output to stdout. The build will silently pass/fail without any indication whatsoever due to this after being stuck  ``` [+] BUILDING...5.8s [28%] (227/495 JOBS, 227 UPDATED, 227 [45.9%] CACHE MISS) ```  This change prevents the warning from being print to the console. Closes https://github.com/facebook/buck/pull/752  Reviewed By: Coneko, dreiss  fbshipit-source-id: 0b9cda7
Add support for custom .native-image location  Environment variable NATIVE_IMAGE_USER_HOME now allows to specify a custom location for the .native-image directory.
OperatorMatches caches compiled patterns  Issue: SPR-12610
ShadowingClassLoader can be constructed without default excludes  Issue: SPR-15439
[java] Deleting unused imports
Fix for ReadNode.push which could cause some reads to float before the necessary checkcast. This would cause loading non-oops as if they were oops in some rare cases.
Add @Beta to new method that hasn't yet been API reviewed.  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=131302300
Refined tests for FactoryBean return type resolution on @Bean methods  Issue: SPR-11842
Mute testIndexDeletionWhenNodeRejoins  Tracked at #33613
Minor change to allow (use-at-your-own-risk) access to internal data structure of in-memory model.
Removing duplicated import  Original commit: elastic/x-pack-elasticsearch@1618ec79d4c8cafb639d4cfc0bb2e9afea3e1ae2
Add synchronized to close of WorkerProcessProtocolZero  Summary: Buck is crashing here occasionally. I suspect the close is called multiple times and is racey. Add a synchronized so `isClosed` will be update properly and maybe we can get a stacktrace from the Precondition failure.  Reviewed By: styurin  fbshipit-source-id: dfbc693ca0
fixed a bug where the context wasn't getting updated (for changing variables)
Increase the timeout of LocalTransportThreadModelTest to 1 minute
Revert "bug 11239: add check for hypervisor type when deploy vm, no way to deploy a vm with hypervisor type None"  This reverts commit f1e66738bb252c20a9ec1b8dffc2fd24521458dc.
CLOUDSTACK-6181: Allow RBD volumes to be resized  We don't need an external script to investigate the format of the RBD volume, we only have to ask Libvirt to resize the volume and that will ask librbd to do so.
Add a test case for durable topic unsubscribe.
ignore com.oracle.graal.compiler.test.ea.PartialEscapeAnalysisTest.testCache() as it causes problem on the gate
Improve ProcessUtil's toString method
Add unreleased 5.6.5 version number
increase timeout for External sort test.
Make iterator static
Removed unused imports
Drops unused imports
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
Re-enable LiveQuery test
Fix AwarenessAllocationIT.testAwarenessZones test  This test sometimes fails because the first node is elected as master and waits 30s for incoming joins but in the meanwhile the 3 other nodes form a cluster on their side. The index will be created and its shards allocated on these 3 nodes, then the test checks for the number of shards on each node (it should be 2 or 3) but because the first node has not fully join the cluster yet one node will have 5 shards.   closes #13305
add an option for name as well as _name for filtering allocation
Test: Not all shards maybe in a started state after the initial scroll search, but are after we do the stats call, so add ensureGreen to ensure we don't up with this discrepancy
[FLINK-10399] Use String#isEmpty() to check for empty string.
avoid recompiling a method already compiled by Graal
Implement toString in LLVMType
GROOVY-2200: AllTestSuite should supports excludes pattern as well as current includes pattern
Deprecate old method that was used to build JMX names
Handle potential NPE with HashAggregationOperator
Remove duplicate range check in AbstractByteBuf.skipBytes()
Remove test message comparison.
New sysdate() function that accepts also a date format as input. Renamed AVERAGE() to AVG()
Add distinct grouping sets tests
bug 13679: cosmetic fix to remove NPE warning message from log. Reviewed-By: anthony
initialize port to 0 to avoid an NPE later on when args are checked
Added onSnapshotCreated method
Remove redundant throws clauses
Bug 60650 - AbstractBackendListenerClient does not reset UserMetric between runs  Bugzilla Id: 60650
Add regression test for antlr/antlr4#6 (NullPointerException in getMissingSymbol)
add GroovyObjectSupport as type
Fixed issue #2030 about Backup with files >2GB (critical)
Improve tests for detection of @MVC annotations  Issue: SPR-9601
Mute PermissionsIT#testWhen[...]ByILMPolicy (#41858)  Relates #41440
Adapt ReactorHttpsServer to lates Reactor Netty changes
bug 8099: returning systemvms for direct networking status 8099: resolved fixed
EranMes: When a Point instance is printed, the output will now be useful.  r12351
Ignores insubordinate test, to be reviewed later
Frustum: add methods using floats instead of Vector3
Remove unused code
fixed Eclipse spell check errors
Delete unused import
javadoc comments for MetaObjectProtocol interface
DanielWagnerHall: Making element equality and hashCode consistent.  This makes the /element/:id/equals/:other command obsolete.  Leaving the handlers in for backwards compatibility.  r14281
DouniaBerrada: Cleanup for android   r10357
Remove comments used to debug
we need to watch out for content types like "text/html; charset=..."   r2743
TikaCLI: add attachement extraction option
Mute ApiKeyIntegTests  See https://github.com/elastic/elasticsearch/issues/41747
TraceRA: fix FixedInterval.toString for EndMarker.
Improved failure report information
Support OnTimerContext in ByteBuddyDoFnInvokerFactory
Fix broken CompositeMatcher  Motivation:  ChannelMatchers#CompositeMatcher inverts matches result.  Modifications:  Switched return values.  Result:  ChannelMatchers#CompositeMatcher will return correct results.
use artificial subtransforms of primitives
CAMEL-12268 - Camel-AWS: Lets call shutdown on the clients while stopping endpoints - AWS CW
Adds timed wait on ResponseFuture so it is more frequently scheduled
Remove unnecessary calls. Closing the socket recycles the processor which in turn recycles the buffers.
[TEST] Add discovery-multicast to PluginManagerIT
Avoid extra Block creation in array to json cast
when there's an IOException, the URL should still be set. Found this difference in the process of writing the monitor. I use the URL as the unique key for each individual serverpanel.  peter lin
Remove unnecessary reflection.
TestCompiler: Disable annotation processor auto-discovery  Summary: `javac`'s automatic discovery of annotation processors on the classpath can cause unpleasant surprises. Buck's own code (`Jsr199Javac`) disables it when building, but `TestCompiler` wasn't disabling it for tests.  Test Plan: CI  Reviewed By: styurin  fbshipit-source-id: 8809cec
Workaround for issue 1075
Explicitly ignore empty tokens in the value of VirtualWebappLoader#virtualClasspath
Use scheduled delay instead of manual one.
Remove unused import.
Construct AfterEachStateMachine from list of subtriggers
Added --help option
[TEST] Provide random instance to rarely(Random) instead of using the threadlocal one
KAFKA-4661: Improve test coverage UsePreviousTimeOnInvalidTimestamp  Author: Jeyhun Karimov <je.karimov@gmail.com>  Reviewers: Matthias J. Sax <matthias@confluent.io>, Guozhang Wang <wangguoz@gmail.com>  Closes #3288 from jeyhunkarimov/KAFKA-4661
Migrate TestCustomFunctions to AbstractTestFunctions
Deprecate `Capabilities.isJavascriptEnabled`  This provides no useful functionality over calling:  `Capabilities.is("javascriptEnabled")`  Worse, it's suggesting that browsers can be used with webdriver without JS enabled, which isn't true.
Add a failing test to demonstrate an issue with implicitly casted values by the DSL
sql: added test case after the regression on min() and max() sql functions executed as inline
Added a some logic for specifying values that the slider can snap to.
Sync with gump
[FLINK-11334] Add good EnumSerializer.toString()  This makes it easier to understand failing tests where serializers are being compared.
Correctly calculate checksum when using GZIP. Part of [#2168]
SSL certificate files should only be readable by owner.
Don't create ABIs from source if postprocessing classes  Summary: A postprocessing step might modify the class files, rendering a source-based ABI incorrect.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: a7a774f
java: Decreasing visibility of a method that is used in tests only
CAMEL-4396: XML validation errors should be logged using error listener. Thank to metatech for the patch
Made HashBasedIndex thread-safe  HashBasedIndex is an in-memory implementation of a schema index and it is used only for testing. It uses concurrent map inside but still is not completely threads-safe. For example #add() method does a non-synchronized check-then-act put in the map.  Multi-threaded index population, introduced previously, made some tests that use HashBasedIndex fail because of this issue.  This commit makes all methods in HashBasedIndex synchronized and replaces concurrent map with simple HashMap. This guarantees thread safety fo the index.
Add test for late intrinsic inlining.
removed toString() to get better coverage of DetailAST and to improve the readability of the leftmost column in the gui
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
Added a property to avoid the exception stack trace when running the console
Make ExoPackageInstaller.installFile() a bit more generic.  Summary: Do not hard code the "secondary-dex" directory so that it can be used to install a file to any arbitrary location under dataRoot.  Test Plan: buck test --all buck install <exopackage_target>
nit fix: CxxBuckConfig.UNFLAVORED_CXX_SECTION  Summary: Semantically, in all use cases it prefixes nothing and works as a usual/standard section.  Test Plan: CI  Reviewed By: stepancheg  fbshipit-source-id: ecd0e37
Added support for ranges, e.g. "10-20" which are translated into int[2] Refactored so that networking is easy to mock Implemented Listeners helper for listener management Removed all Message subclasses - variations now handled through headers instead
MINOR: MemoryRecords.sizeInBytes throws NPE when non-writable.  I just noticed that `MemoryRecords.sizeInBytes` throws NPE when MemoryRecords is non-writable. `compressor` is explicitly set to null when `writable` is false (L56) at the construction time, for instance when `MemoryRecords.readableRecords` is used.  guozhangwang Could you take a look when you have time?  Author: David Jacot <david.jacot@gmail.com>  Reviewers: Guozhang Wang  Closes #786 from dajac/kafka-npe
Bug 39580 - Add recycle option (defaults to true)
Test: Remove broken yml test feature (#31255)  The `requires_replica` yaml test feature hasn't worked for years. This is what happens if you try to use it: ```    > Throwable #1: java.lang.NullPointerException    >    at __randomizedtesting.SeedInfo.seed([E6602FB306244B12:6E341069A8D826EA]:0)    >    at org.elasticsearch.test.rest.yaml.Features.areAllSupported(Features.java:58)    >    at org.elasticsearch.test.rest.yaml.section.SkipSection.skip(SkipSection.java:144)    >    at org.elasticsearch.test.rest.yaml.ESClientYamlSuiteTestCase.test(ESClientYamlSuiteTestCase.java:321) ```  None of our tests use it.
Further to [CALCITE-604], add "synchronized"
removed Java 1.5 compatibility issues
Add missing access check.
remove shutdown hook
Remove unused import.
added method to check for key existence
use long math for long values
Tests: Mute SnapshotDisruptionIT.testDisruptionOnSnapshotInitialization  Relates #36779
Added distinctUntilChanged member methods to Observable
Refactor parser to use global frame for rules  Summary: This way rule definitions can be reused in multiple environments. In particular this will be used when parsing extension files.  Test Plan: CI  Reviewed By: styurin  fbshipit-source-id: 2cc4640
Remove additional confusing close
DX RegisterSpec optimization for de-interning: mapSourceRegisters  Summary: [Forward Port of 160a87fc81adcc091836b15c54c380069bdf90c5] An upcoming change will make the RegisterSpec class not interned as a part of making DX in-process safe.  PhiInsn.mapSourceRegisters is currently doing an "==" check to determine whether to call SsaMethod.onSourceChanged.  Without interning, that check might fail where it would have previously succeeded (for two equivalent but not reference-equal RegisterSpecs), resulting in an unnecessary call to onSourceChanged.  (I don't know if this can *actually* happen.)  This diff optimizes that case by doing an early exit if the new and old source have the same register.  Inspection of the method shows that when this is the case, it just removes the instruction from a list, then adds it right back.  This diff should be correct and safe on its own, but it seems unlikely to have any benefit as long as RegisterSpec is interned.  Test Plan: ant dx-tests
Assert correct Slice representation in CharType
Let Groovy Console syntax highlight the trait keyword
added constructor to FailedToCommitException
[Monitoring] LocalExporter should catch synchronous exceptions (#36606)  In the unlikely scenario that `LocalExporter::resolveBulk` throws an exception, then we should mark the `listener` as having failed.
Test: use less shards in SimpleQueryTests
MINOR: add unit test for Utils.murmur2 (#5926)
To fix unit test on slower servers.
Properly merge Cost.percentCorrect
make javadocs for scan() more precise (#1857)
Add support for notify periodic event of cluster.
Remove the irrelevant AIO channel options
remove unused imports
Use Java's built-in way of joining collections.  Reviewed By: styurin  fbshipit-source-id: 5d770888f4
Test cleanup.
Add a comment.
[FLINK-3840] Remove Testing Files in RocksDB Backend  We create random files on initialization to check whether we can write to the data directory. These files are also removed now.
ReadTimeoutHandler - missing ) within JavaDoc example (#8645)  Motivation:  improve docs  Modification:  ReadTimeoutHandler - missing ) within JavaDoc example  No logic/unit tests affected
update WordCountCounters for SuperColumn refactor
sorting out javadoc, promoted isWritable() to this interface (for now)
fix for make sure that http command support multiple languages
Set USES_KEYED_STATE in Dataflow when DoFn uses timers
Fix handling of grammars in the default package (resolves antlr/antlr4#94)
Restore method required for JSR 77.
Minor: changed code to adhere to the new Blueprints 1.x
Simplify Subscription Chain
* added default bindings to the script being executed inside <groovy/> tag   - ant : an instance of groovy.util.AntBuilder that knows about the current ant project  - project : the current ant project  - properties : a Map of ant properties, e.g. properties['java.vendor']  - target : the owning target that invoked this groovy script  - task : the wrapping task, can access anything needed in org.apache.tools.ant.Task, e.g. task.log("Problem...")  e.g. <groovy>  ant.echo("hello world")  ant.jar(destfile:"foo.jar", basedir="classes") </groovy>
A better way to get default value
Test that SimpleDoFnRunner wraps exceptions in startBundle and finishBundle
Skip retry when creating Hive RecordReader  We do not retry for other readers. File system implementations already retry when necessary and have more context to handle it correctly.
Add substitution for Module.getResourceAsStream()
r/m unused BUFSIZE patch by jbellis; reviewed by Eric Evans for CASSANDRA-424
[BEAM-5925] Add .withSocketAndRetryTimeout() and .withConnectTimeout() to ElasticseachIO.ConnectionConfiguration
Ensure path to Javac jar is encoded in rule key  Summary: When the Jsr199Javac amends the RuleKey, it currently disregards whether or not the compiler being used comes from the OS or from a user-supplied JAR. Since the two compilers may differ in their behaviour, it seems wise to encode this data in the RuleKey.  Test Plan: buck test --all
Categorize unsupported Hive type error
CAMEL-8270 Added an unit test for it
Fix test under windows  Silly `\r`.
readd defaulting logic
AbstractApplicationContext.isRunning() avoids IllegalStateException  Issue: SPR-13667
CLOUDSTACK-6181: Allow RBD volumes to be resized  We don't need an external script to investigate the format of the RBD volume, we only have to ask Libvirt to resize the volume and that will ask librbd to do so.
Optimise - Is a tiny faster as the extra add is not needed as we dont use the returned value.
Add API to covert ODocument to HashMap
Change link to OrderingExplained to GitHub location.  It got reverted to the Google Code location by the doc change. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=95780221
Add missing call to handleThrowable
Expose executor. Required so Servlet 3 Async implementation can use the container thread pool when a new thread needs to be dispatched. (e.g. from AsyncContext.start(Runnable)
Test that it's possible to attach a callback to a ListenableFuture<?>. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=67713851
Construct "proper literal" for CHAR in LiteralInterpreter.toExpression  "proper literal" means just a literal or a literal wrapped with a CAST. Previously, `toExpression(..., CHAR(x))` would return a "magic literal function call" which is hard to analyze.
prefactor for PR#430 (copy an example in the javadoc that would otherwise be lost)
Uses new way to access TileContainer
Ensure flowController().writePendingBytes() is triggered when writing response in example  Motivation:  We called ctx.flush() which is not correct as it will not call flowController().writePendingBytes().  Modifications:  Call flush(ChannelHandlerContext) and so also call flowController().writePendingBytes().  Result:  Correct http2 example
[Test] BackgroundIndexer uses the wrong logger  Closes #6781
full error reporting
Clean up the component document of camel-netty
Issue #4581: Reorganize token methods in GenericWhitespaceCheck
Add a call to `BuildTargets.getGenPath`.  Summary: No functional change. I just missed this when I created `getGenPath`.
2.x: update Obs.just(2..10) & switchOnNextDelayError marbles (#5651)
Maybe die before trying to log cause  This commit reorders a maybe die check and a logging statement for the following reasons:  - we should die as quickly as possible if the cause is fatal  - we do not want the JVM to be so broken that when we try to log    another exception is thrown (maybe another out of memory exception)    and then the maybe die is never invoked  - maybe die will log the cause anyway if the cause is fatal so we only    need to log if the cause is not fatal
Implement hashCode and equals for ErrorCode
Expose source ID for desktop usage.  http://www.java-gaming.org/topics/libgdx-request-expose-openal-sourceids/30788/view.html
Fix exception assertions in MetaDataStateFormatTests.testLoadState  Got broken with the change in #16850
Removing unneeded cast
Add a newBuildTarget() method to ProjectWorkspace.  Summary: This convenience method facilitates creating a `BuildTarget` with the correct filesystem/cell underneath.  Test Plan: Used in an upcoming integration test.  Reviewed By: Coneko  fb-gh-sync-id: c4ce6b6
WW-4168 Added if statement in method isChecked to verify that the String Array of checkBox name values is not null.
CLOUDSTACK-3463: [Portable IP] [EIP/ELB Zone] EIP semantics are not intact with portable IP  fix ensures that, on release of portable IP associated with 'EIP enabled' basic zone vm, a new system public IP is allocated and associated with the VM
Remove extra explicit type
Add JavaDoc to InstrumentBranchesPhase.
more specific return value on ObjectStamp.join
Remove import for java.util.Formatter since it's needed only for the javadoc. ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=108184450
Further to [CALCITE-604], add "synchronized"
Align implementation of state machine with documented transitions (allow dispatch() when in ASYNC_READ_WRITE_OP)
2.x: Expand the documentation of the Flowable.lift() operator (#5863)
Add test for new HTTP GUI
Make SymbolsExtractor#extractOutputSymbols accept Lookup
in network serializer avoid determining type if type is == -1
Avoid potential NPE in error message
Add tests for INSERT and UPDATE on a PreparedStatement via executeUpdate()
Further refinement on PR-201
CLOUDSTACK-5145 : Added permission checks while deleting network ACLs
Make Write Barrier abstract class
DRILL-1098: Add test for trim(), substring() function. Actual fix is in OPTIQ-331
Remove some completed TODOs Tidy up the Javadoc
NaaS: Add redundant router capability to virtual router
[minor] Use MemoryPersistenceAdapter for testing when choice of persistence adapter is indifferent
Add test to reproduce SPR-15271
Added an unit test of RabbitMQ endpoint based on the question mailing list
removes custom implementation for setDelegate
VPC: fixed list public ips by vpcId
add simple vm properties test
EranMes: Marking the methods removed in r14625 as deprecated, and logging the fact that they are.  r14627
AlexeiBarantsev: Fixing import of Sets class from the wrong place to a better one  r17833
Fix license messaging for Logstash functionality (elastic/x-pack-elasticsearch#3268)  * Fix license messaging for Logstash functionality  With a Basic license, users are still able to perform CRUD operations on the `.logstash` index, therefore manage their Logstash pipelines. However, Logstash itself will not pick up any changes from this index and act on them. With an expired license Logstash functionality continues to operate as normal.  * Fixing messages after feedback  * Removing extraneous tabs at end of line  * Fixing typo  Original commit: elastic/x-pack-elasticsearch@bc069cf00ff865056ee53fd3e7c79b325c68dcee
Fix table creation tests for Cassandra and Kafka
Ignoring recently added test in legacy Firefox driver
CLOUDSTACK-1675: VMSnapshot: ListVMSnapshotsCmd should not display Domain ID in the Error Message  Description:     Replace domain db id by uuid in exception message.  Signed-off-by: Mice Xia <mice_xia@tcloudcomputing.com>
[TEST] Remove test trace logging
Added the unit test of sending request/reply between the jms endpoint and jetty endpoint
Forced close of storage on delete()
Change empty leaf label to avoid weird behavior with multiword token splitting
Add missing import to JavaTestDescription  Summary: Probably a bad merge or something?  Test Plan: ant default  Reviewed By: dreiss  fbshipit-source-id: e6bcf33
Improve subscription removal in SubscriptionRegistry  Avoid using destination pattern based search when removing sessions or subscriptions from DefaultSubscriptionRegistry and use only session and subscription ids.  Issue: SPR-11930
Fixed compilation error
Rename unit test so it looks like a unit test  Original commit: elastic/x-pack-elasticsearch@d2d39ad50bb1a638461f1e2aed21110b732ea5e0
don't try to copy empty libraries since they won't be built by Xcode  Summary: Apple libraries without sources will not build an output file so do not try to copy it.  Reviewed By: dinhviethoa  fbshipit-source-id: 04d9eee0b9
If a remote end does not explicitly state JavaScript support we suppose it's a "normal" browser that supports JavaScript
Replace ArgumentNullException with NPE by using Validate.notNull instead of null check with throw.
HIVE-3057: metastore.HiveMetaStore should set the thread local raw store to null in shutdown() (Travis Crawford via Ashutosh Chauhan)
Remove BWC serialization logic for pre 2.2 nodes (#19810)  This change removes all pre 2.2 logic from InternalSearchResponse serialization. It's unneeded in 5.0 since we require full cluster restart
Adds an explicit generic in a test
allow controllable stack dump in ExceptionUtil.java
Added tests to install the server on a path with strange characters and space in it
Test: move no master node test over to only use unicast zen discovery. On the build server there is no multicast enabled.  Original commit: elastic/x-pack-elasticsearch@20eab58db1180ab20a92c0227b72b0b6d4fbcd7c
Changed the priority of delete-index action to URGENT  All index meta data API's have urgent priority when it comes to cluster state updates. We'd like to remove indices asap to avoid things like unnecessary shards relocations
HIVE-3436 :  Difference in exception string from native method causes script_pipe.q to fail on windows (Thejas Nair via Ashutosh Chauhan)
Backport of benchmark broke build  Motivation: 2a2059d97683206a23488e8c96256f2f6fb1bed0 was backported from master, and included an overriden method which does not exist in 4.1.  Modifications: - Remove the invoker method from NoPriorityByteDistributionBenchmark  Result: No more build error
[hotfix] properly encapsulate the original exception in JobClient  This closes #2890
MAHOUT-956: filter logs, crc
Refined exception message  Issue: SPR-14609 (cherry picked from commit ab68673)
remove unused method
Parallel query: fixed issue with transactions  When transactions are running, the parallel doesnât work because the way the database is cloned between threads It doesnât take in account the transaction data structures in db.copy()
TIKA-560: Improve detection of .mht, Foxmail, and OOXML files  Allow a null InputStream in ContainerAwareDetector, as specified in the Detector contract
Do not execute destructors for multiple program executions
ASM annotation visitor defensively accesses enum constants  Issue: SPR-15442
[FLINK-1478] [jobmanager] (addendum) Add eager check for null as input split host name
Dialog, fixed focus issues.
push down allocations to where they are needed
Fix up some raw types
quick fix for version before (due to a conflict cv was used instead of mv)
More robust evaluation after training model
Add workaround for missing delete key events.  In Jelly Bean, the behavior when hitting delete on the soft keyboard was changed so it does not send key events in certain circumstances. We want the key events so we send them ourselves.
[no jira] extend the timeout b/c it was on the margins
fix error message spelling with cql select statements patch by rvieira reviewed by dbrosius for cassandra-5647
Fix scaling thread pool test bug  This commit adjusts the expectation for the max number of threads in the scaling thread pool configuration test. The reason that this expectation is incorrect is because we removed the limitation that the number of processors maxes out at 32, instead letting it be the true number of logical processors on the machine. However, when we removed this limitation, this test was never adjusted to reflect the new reality yet it never arose since our tests were not running on machines with incredibly high core counts.  Relates #20874
SPR-6186: removed remaining duplicate check for @Configuration
Deprecate manWithIndex  If we leave mapWithIndex then we should have âwithIndexâ on many other operators. Instead of this, an Observable should just be zipped with an infinite stream of numbers and the zip function provides the index. This keeps the API surface area smaller and provides the desired behavior on all operators.
[FLINK-10756][runtime][tests] Wait for TM processes to shutdown
Reduce visibility of recently added method
attempt to fix wal shoutdown issue
Revert "Mutes MachineLearningTests.testNoAttributes_givenSameAndMlEnabled"  This reverts commit ca999ad569d2f1823684028b9c9cf62e82ccd675.
Ignore unreliable test.  This seems to be a problem with the test design as opposed to the behaviour. Ignoring until we fix the test.
Reflection exceptions in memory cofiguration were moved to debug level.
FrancoisReynaud: removing the leading - from parameter specified to the hub before storing them to keep consistency between user specified parameters and default parameters.  r16390
WW-3067 Add a configuration constant to turn on/off the logging of missing properties by OGNL
Group private static fields together No code change
[TEST] Add test that shows how to use a classic pull-parser with the object parser
Avoid an unnecessary session ID change notice.  Notice of changed session ID by JvmRouteBinderValve is unnecessary to BackupManager.  In BackupManager, change of session ID is replicated by the call of a setId() method.
Convert android_build_config Arg to be an Immutable  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: fe09ac1
Make it easier to test that the right response was returned
Improve fix for https://issues.apache.org/bugzilla/show_bug.cgi?id=48863 - consistently pass absolute paths to validateFile() - handle non-absolute catalina home/base
More logging when PubsubJsonIT fails
DRILL-2548: JDBC Driver - check for bad data from server and prevent SqlException
[Test] Fix remaining static objects after running tests  Test framework detects when static objects are not released when running tests. This commit remove usage of static objects when possible.
Supported fetchPlan = -2 to hide a field. Useful in JSON serializer
Replace manual array unboxing with ArrayUtils.toPrimitive(). #1538
Enable traceback output for rawmanifest  Summary: If something goes wrong with rawmanifest, we'd like to know what exactly. Log the traceback for such errors.  Test Plan: CI  Reviewed By: yiding  fbshipit-source-id: 30639f5
Support IndicesModule list constructor  Original commit: elastic/x-pack-elasticsearch@c88e2b82b70a49e21bcca66f2712ac88efeb0e9b
remove debug comment
Removing misleading log messages. Fixes issue 6392
Remove unused import.
Backported the harden synced-flush PR to v6.3.0  Relates #28464
SimonStewart: Scan the PATH for the chromedriver server  r11888
Set method in result Test non-GET method
Partial fix for GROOVY-3330 (Verifier now retains label when promoting ExpressionStatement to implicit ReturnStatement)
update background task manager shutdown check to include timeout pool  Summary: check that timeout thread pool is terminated when checking that manager is properly shut down (test function)  Reviewed By: styurin  fbshipit-source-id: 90c830c756
Prevent the CheckPointer from blocking CausalCluster Catchup.  By making the checkpointer not hold on to the PageCache monitor lock for the whole check point process.  It turned out that this behaviour could inconvenience the Causal Cluster catchup process. The CC catchup would ask the page cache warmer to list its files. To do that, the page cache warmer would call `listExistingMappings` on the page cache, and that method would also require the PageCache lock.  The fix is that the checkpointer now also uses `listExistingMappings` to grab a snapshot of the mapped files, and then flush them without holding on to the lock on the entire page cache. The `listExistingMappings` method does still take the page cache lock, but it returns much, much faster than a complete page cache flush would.
Add 2.2.1 to the version lookup table
javadoc for BBU.clone
Add an NPE guard
Added missing iOS device  Added the missing Wi-Fi Only iPad Pro to IOSDevice
Allow to use NIOFSDirectory as directory implementations for lucene indexes  Add "default_directory_factory" feature toggle in DirectoryFactory to be able to choose between default directory factory and NIOFSDirectory for lucene indexes directory.
ShutdownOnIndexUpdateIT now shutdown db when done
updated a javadoc ref
Removed a nice System.out and printStackTrace() which, of course, shouldn't be there
don't throw exceptions when you can't add host
Adding WOFF2 media type.  Bootstrap uses this file format, which is then filtered out in apps framework since this type isn't defined. ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=122743223
Remove DirCache logs about hit/miss, as we geting them from CachingBuildEngine  Summary: These are rarely used logs, and we get almost the same information from CachingBuildEngine logs  Test Plan: CI  Reviewed By: marcinkosiba  fbshipit-source-id: 6a2926d
Minor changes to make the benchmark test look more like the one submitted to DEFT
&= is needless as stoppedAll is true Added TODO waiting for answer from sebb on dev mailing list Bugzilla Id: 53418
TIKA-844 Add an internal TagBag property type constructor, patch from Ray Gauss
STORM-1311: Fixing using storm conf instead of topo conf for UI ACL check
Deprecated unused code.
Tests: Disabling another failing OpenLDAP test  Relates elastic/x-pack-elasticsearch#1823  Original commit: elastic/x-pack-elasticsearch@88ee3d3eacf6ed8858bd16b5b50206e637c7f774
Avoid NPEs so tests fail rather than error
Fixed a bug with javac
Fix failing ML test after bucket count change (elastic/x-pack-elasticsearch#2351)  Original commit: elastic/x-pack-elasticsearch@c215ba1c1637c4682ac82280365881b7439e8380
Query DSL: prefix query to support _id, closes #1648. (fix support analysis for prefix is configured)
Remove unused private method, issue #744  All violations of PMD rule [UnusedPrivateMethod](http://pmd.sourceforge.net/pmd-5.2.3/pmd-java/rules/java/unusedcode.html#UnusedPrivateMethod) are fixed.
Code cleanup in mocking storm-starter tests
Add the piece of information that I really wanted last time. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=88115213
[TEST] added @AwaitsFix to failing StringTermsTests while I work on a fix
CloudStack CLOUDSTACK-4160 listUcsManagers API needs to be able to take in id parameter
Corrects FailedIndexProxy behaviour for updates  The newly introduced `validateBeforeCommit` method in IndexProxy was implemented incorrectly in FailedIndexProxy. It threw exception instead of just ignore that call, just like `newUpdater` did. This caused unexpected temporary failures for transactions touching the same label/key combination as an attempted uniqueness constraint creation did, one that failed due to constraint violations.
CLOUDSTACK-7598: When a vm deployed by cloudstack is stopped on the hypervisor (outside cloudstack), the state of the vm is not updated in cloudstack db. The ping task was not checking for resource (host) status by default. The power state of the vms is returned as part of the resource status. Fixed the issue by making sure ping task atleast tries once to get the resource status.  (cherry picked from commit 55b4ead49594212ba55bfcf7007b0cae11bf68ba)
[FLINK-10881] Use cancelWithSavepoint in SavepointITCase test.  This closes #7833.
fix check for rememberMe in authentication (#3869)  Fix a problem that kept remember-me authentication from working when logging in to a service protected with mfa-duo.   The test in CookieRetrievingCookieGenerator() for the presence of AUTHENTICATION_ATTRIBUTE_REMEMBER_ME in the authentication object was always failing, because an unnecessary CollectionUtils.wrapSet() was being used before checking the value. This would result in a TGC being saved with session lifetime, even when the "Remember Me" box was checked.  To test: select the "Remember Me" box when logging in to a service that requires duo-mfa; check the lifetime of the TGC cookie in the browser.
Add some minimal documentation for NERFeatureFactory's distsim
addressed review comments
Rebuild Xcode symlink trees on Buck version change  Summary:   * If the Buck version changes, rebuild all header symlink trees we create when     we generate an Xcode project. This makes sure that the trees are up to date     even if the logic that builds them changes.  Test Plan:   * Use a different Buck version, check that all header symlink trees are     recreated even if their contents do not change.
GROOVY-6952: Add List.removeAt(int) and Collection.removeElement(Object)
[added] GraphicsType.Angle
HIVE-5978 : Rollups not supported in vector mode. (Jitendra Nath Pandey via Ashutosh Chauhan)
GROOVY-1746: add missing @since
Remove v[N/A] log output
Tests for missing placeholders during binding    Add a test to ensure that that there is a hard failure when trying to  bind properties with missing placeholders.    Closes gh-8693
Add missing @Deprecated annotation    Closes gh-15113
follow up for #3376 (#3377)
check the metadataServiceExporter when exec ShutdownHookCallbacks (#5650)
Tweak Javadoc for Part to use something other than RequestBody.
Tweak Javadoc for Part to use something other than RequestBody.
Avoid limitation of javac's type inferencing
Remove some tests.    We don't have to test the test and failure naming for tests with  @Parameter annotation again, because it is not different from the test  that sets the parameters via constructor.
Configure WebClient to use same address (IPv4 or IPv6) as server    Closes gh-11712
Ensure Undertow session timeout is set correctly    Assume that Undertow uses -1 for 'no expiry'.    See gh-2084
Hide a 2.0 API that was left public.
Revert 'fix wrong check of InvokerListener when export a service (fix issue_6269) (#6271)'    This reverts commit 91989cae508f8482f31ac335879da4a5975661c8.
Adapt to MockClientHttpResponse no longer accepting a null body
Make parameterized assertion error extend assertion error
fix:add space , optimize log output (#605)
Renamed getXYZ test cases to testXYZ test cases.    Incomplete - task : Resolve sensitive equality in MethodSorter test.
Use method to resolve directly to a builder.
Remove creation of synthetic accessor method.
Removing unnecessary public modifier.
Make optimizedLaunch property name more consistent    See gh-18702
Avoid resize in ClassUtils.java (#5009)
Oops, let in another change from unrelated change. Undo to avoid compile error.
Only throw PortInUseException if port is set    Refine the `PortInUseException` logic in `NettyWebServer` to only throw  an exception if the port is set. The prevents a misleading exception  from being thrown when a domain socket is being used.    Closes gh-24529
Polish 'Replace indexOf() with a call to the contains()'    Closes gh-15559
Print the java version being used on startup    See gh-21559
Attempt to fix failing log tests
Add test: OkHttpClient.Builder.protocols(...) doesn't accept null
Define all HTTP2 error codes (#3756)
Fix CacheAutoConfiguration relative order for Couchbase    This commit fixes the auto-configuration of the Couchbase caching  support by configuring the cache once Spring Data Couchbase has gotten  a chance to be processed.    Closes gh-22542
Polish 'Auto-configure ReactiveStringRedisTemplate if necessary'    Closes gh-16604
Add missing bean property getters
Remove @Lazy injection for HttpMessageConverters    This commit turns a lazy injection point for `HttpMessageConverters`  into an `ObjectProvider`-backed injection.    This allows to lazily rely on that bean without creating for it; in some  environments, such proxy creation can lead to issues like SPR-16990.    See gh-13785
Remove @ConditionalOnMissingBean check on deprecated class    Closes gh-20968
Use fast exceptions in hasMoreElements in LaunchedURLClassLoader    When nested jars are being used, hasMoreElements requires opening a  connection for an entry in every nested jar. If that entry doesn't  exist, a FileNotFoundException is thrown to indicate that a particular  jar doesn't contain the requested entry. This exception is used to  indicate the lack of an entry and is then swallowed, i.e. its stack  trace is of no importance. This means that the performance of  hasMoreElements can be improved by switching on fast exceptions while  it's being called. When fast exceptions are switched on a general  purpose pre-initialized FileNotFoundException is thrown rather than  creating a new FileNotFoundException instance each time.    In certain situations, the use of fast exceptions as described above  can improve performance fairly significantly. The JRE's default SAAJ  implementation uses META-INF/services-based discovery for _every_  request that's handled by Spring Web Services. Each discovery attempt  results in hasMoreElements being called making its performance  critical to throughput.    See gh-3640
Only try to auto-configure Jetty when jetty-webapp is on the classpath    Closes gh-4089
Update FilteredClassPathRunner so that JUnit rules work    Previously, the tests class and any JUnit annotations it contained were  loaded by a different class loader to JUnit. This meant that the JUnit  annotations were loaded twice and @Rule-annotated fields were not found.  This commit updates FitleredClassPathRunner to use a custom class loader  that ensures that any org.junit.* classes are only loaded by a single  class loader.
Remove ResourceUtils.getURL logging config check    Remove `ResourceUtils.getURL` checking from `LoggingApplicationListener`  so that logging systems can implement custom location support.    Prior to this commit, we checked in the listener if the specified config  location could be opened as a URL. This unfortunately prevents Log4J  extensions such as `log4j-spring-cloud-config-client` from implementing  configurable SSL and credentials support.    See gh-22946
Precompile current dir pattern in Handler    Closes gh-11321
Add explicit dependency to ConnectionFactory auto-configurations    This commit makes sure tht `HealthIndicatorAutoConfiguration` runs after  any producers of a `ConnectionFactory` and not only ActiveMQ. This was  identified as part of #10081: `JmsAutoConfiguration` is actually the  one that isn't necessary (spring-boot-actuator has no import on the  `org.springframework.jms` and only `javax.jms.ConnectionFactory` is used  as part of the JMS health indicator.
Improve error handling in SpringPackageScanClassResolver    Previously, SpringPackageScanResolver was handling as subset of the  failures that Liquibase\xe2\x80\x99s DefaultPackageScanResolver handles. This could  lead to a failure due to a LinkageError in certain environments.    This commit updates SpringPackageScanClassResolver to align its error  handling with what Liquibase does.    Fixes gh-1853
Defer background pre-init till the environment is prepared    Previously, background pre-init was started in response to the  application starting event. This meant that it would be running while  the logging turbo filter was in place and was rejecting all logging.  As a result, any logging performed during pre-init would be lost.    This commit changes background pre-init so that it is now started  in response to the application environment prepared event. By this  point, the logging turbo filter has been removed as the logging levels  have been configured from the environment.    Closes gh-21897
Make checkstyle happier
Align tests for OAuth properties adapter with changes in Spring Security    Closes gh-13185
Revert ZK client change
use standardcharset.utf-8 instead of literal (#3285)    * use standardcharset.utf-8 instead of literal    * remove unused import
ignore unstable test test_normal_channel_close_wait_gracefully
Supported un-registration from Profiler
retain logger instance to actually log things
Updated gson recipe to close response body.
Corrected javadoc of the Cookie persistent() method:   - It was claiming that returns true if the cookie expires and the end of the session and really is the opposite behavior.
Change Headers.Builder to be final.
Add a 3030 testcase.    Crashes Chrome.
Add tests to confirm HEAD response bodies are empty.    OkHttp never returns null bodies for any request. But empty response  bodies are fine.    Closes: https://github.com/square/okhttp/issues/2879
We don't have resource leaks in interceptor crashes anymore.    Yay stream allocations.    Closes: https://github.com/square/okhttp/issues/1502
Add a test for case insensitive content type matching.
Fix a typo in settings documentation.    Closes https://github.com/square/okhttp/issues/1105
Remove needless unchecked suppression.
Correct docs for new RetrofitError.
Document custom error body deserialization exception.    This is a less-than-ideal API but the behavior can't be changed because it's public API. We'll make error handling more robust in future versions.
Ensure a real platform is present for Android detection.
Add comment for now-deprecated Response constructor.
Handle h2 vs http/1.1 event ordering differences (#3504)    * Handle h2 vs http/1.1 event ordering differences    * remove sout    * additional test case    * dont change client, change server protocols    * refactor test
Hide a 2.0 API that was left public.
Remove unecessary cast.
[Performance tuning] improve InvokerInvocationHandler#invoke (#5403)
Removed redundant phrase from parameter name
Refactored logic out of failDueToMissingException    Refactored message decision logic out of failDueToMissingException into  its own method missingExceptionMessage.
Postpone checkSubConfig logic in ReferenceConfig (#5226)
use stringutils to remove duplicate code in ProtocolUtils.java (#5558)
enhance consul registry to support matching url between consumer and provider (#4818)
temporarily ignore UT ZookeeperMetadataReportTest
Ensure endpoint definition Class is an interface.
Add documentation for AndroidLog.
Observation of performance degradation when running under JDK 8 (#4381)
Formatting changes    Space between 'if' and '(', '!expression' instead of 'expression ==  false'
Split AccessFlagsTest methods to one test per method  Summary: This is making way for a test refactor that expects a single compilation per test.  Test Plan: Existing unit tests  Reviewed By: asp2insp  fbshipit-source-id: f076d84
Simplify matcher expression in ParameterSignatureTest
Renamed getXYZ test cases to testXYZ test cases.    Incomplete - task : Resolve sensitive equality in MethodSorter test.
re-enable testCustomExecutor (#2913)
Validate that AopAutoConfiguration back off properly    Closes gh-7694
Remove deleted BothTest from AllTests
Make getClassName more reliable when fTestClass defined.
Added test for issue #219
set reference bean definition target type (#5710)    Co-authored-by: quzijing <quzijing@oppo.com>
Use constants to replace literal
remove useless code in MergeableClusterInvoker.java (#5925)
add a null check for safety
deleted extra space
Rename userName parameter to username in Credentials (#3781)
Update JavaDoc for WebSocketListener (#3288)
Update JavaDoc for WebSocketListener (#3288)
TLSv1 supports TLS extensions so they should be enabled    Follow up to:  https://github.com/square/okhttp/pull/1196.    Combined with an NPN bug (18705877) on Android this is the  reason why fallback connections started failing on Android  after the COMPATIBLE_TLS was changed to be TLSv1.    [The NPN bug means that once enabled on a socket from an  SSLContext then NPN must be configured for every subsequent  socket otherwise some of the NPN state will still be set,  but some will be missing, leading to negotiation issues].    The implication of this change is that the follow up request  after a handshake failure may now be HTTP/2 or SPDY  (or HTTP/1.1). Previous to this change they would always  have been HTTP/1.1.    Previous to pull 1196 they would also have been  HTTP/1.1 because COMPATIBLE_TLS was SSLv3.
Stopped sending empty frame on stream initiated in sender half-closed state.    The SPDY protocol states the sender of FLAG_FIN must not send further frames  on that stream.  This change skips the sending of a final (empty) frame with  FLAG_FIN set when the stream is already half-closed because SYN_STREAM was  sent with FLAG_FIN set.
Fix up HttpResponseCacheTest.setIfModifiedSince test to work with GMT timezone format in if-modified-since header
When invalid sizes are used to initialize the ArrayList, don't crash with an uncaught exception
Postpone checkSubConfig logic in ReferenceConfig (#5226)
add AddressListener into RegistryDirectory
Replace string by Constants. (#1506)    Replace string by Constants.
Remove redundant cast.
Update copyright header of changed files
Test to confirm OkHttp doesn't loop when a request body throws.    Test to reproduce the issue discussed here:  https://github.com/square/okhttp/pull/4523
Bump to 4.14-SNAPSHOT
Responding to review comment
avoids reusing Executor's Thread instances
Add test for @ConfigurationProperties    Various parent context topologies are tried to ensure that the properties  are bound sensibly.    [#50804109] Allow @ConfigurationProperties beans to be declared  explicitly (to set default values)
Improve test method name.    Replace `assumeNotNullSingleNullThrowsException` by  `assumeNotNullThrowsExceptionForNullArray` because it is more clear.
Use <? super T> in Assert.assertThat    As the Matcher is only a consumer, ? super T is more appropriate.  Otherwise, a Matcher<Object> cannot be used with a String actual, for example.
Delegate to existing deserialization method.
MultipleFailureException cleanup.    1. Avoid creating a message unless getMessage() is called. Most of the time, the message is ignored; EachTestNotifier will create  individual failures for Throwable.  2. Constructor should make a copy of the passed in List  3. getFailures() should return an unmodifiable List
Removed unnecessary @SuppressWarnings    Signed-off-by: Kent Beck <kent@threeriversinstitute.org>
Correcting the collection used when printing out the skipped converter factories when constructing the exception message
Simplify matcher expression in ParameterSignatureTest
[TEST] fix CurrentTestFailedMarker to reset its state after each test  The currently used method `testRunStarted` is only called before any tests have been run, we need to reset that state before each test, that's why we need to use `testStarted`.
Responding to review comment
Removing unnecessary public modifier.
Observation of performance degradation when running under JDK 8 (#4381)
Sort added router list before set the 'routers' field of the RouterChain (#3969)
use consul with group and version (#4755)    fix #4309
Added setProperty(name, value, default) method: sets prop unless default, removes otherwise
rename access log in unit test from 'alibaba' to 'alibaba.log' so that it cannot be committed by accident. (#2051)
ignore unstable test test_normal_channel_close_wait_gracefully
re-enable testCustomExecutor (#2913)
Use urlString for Request.toString()
Clarify comparison test for a change in header table size.
Remove some tests.    We don't have to test the test and failure naming for tests with  @Parameter annotation again, because it is not different from the test  that sets the parameters via constructor.
Polish 'Align TestRestTemplate Javadoc with documentation'    See gh-21318
add disclaimer and example
Close all servers/ports after tests finish (#2755)
Assign an order to OnResourceCondition    Closes gh-7145
Close all servers/ports after tests finish (#2755)
Remove redundant cast.
ignore unstable test test_normal_channel_close_wait_gracefully
