Test that HttpMapper properties are only used when they\xe2\x80\x99re defined    Closes gh-1923
Ensure that new JPA-based test doesn\xe2\x80\x99t accidentally enable Bitronix
Remove redundant @ConfigurationProperties annotation    See gh-7397
Disable the use of Gradle's daemon when running compatility tests
Update Gradle versions to check compatibility with 3.5.1, 4.0, 4.1 M1    See gh-9598
Align with breaking API changes in latest Spring Framework snapshots
Polish 'Avoid NPE in PropertyMappingContextCustomizer'    See gh-9914
Remove useless import
Only throw PortInUseException if port is set    Refine the `PortInUseException` logic in `NettyWebServer` to only throw  an exception if the port is set. The prevents a misleading exception  from being thrown when a domain socket is being used.    Closes gh-24529
Align test with change to exception in latest Framework snapshots
Polish 'Remove a redundant dash in TestPropertyValues.Type'    Closes gh-11156
Cleanup temporary files after Maven plugin execution    See gh-22112
Remove start/stop integration test    This test is not useful in this context.    Closes gh-9889
Fix build after SPR-17034 in Spring Framework    Since SPR-17034, the core container now behaves a bit differently when  dealing with `null` beans.    Given a `null` `HandlerMapping` bean named 'resourceHandlerMapping':    * `context.getBean('resourceHandlerMapping', HandlerMapping.class)`  still returns a `NullBean`  * `ListableBeanFactory.getBeansOfType` will return a Map of all existing  beans, not including the `null` ones as values of the map.    Closes gh-13760
Align test with change to exception in latest Framework snapshots
Use Collection.removeIf() where possible    See gh-13871
Rename TraceWebFilterAutoConfigurationTest    Rename TraceWebFilterAutoConfigurationTest to  TraceWebFilterAutoConfigurationTests
Remove v[N/A] log output
Assign on order to OnPropertyCondition    Closes gh-7144
Avoid double-reg when a Servlet or Filter implements ServletContextInitializer    See gh-4902
Make tests' detection of SSL handshake failures more robust    Closes gh-12961
Fix accidental banner regression    Fix accidental regression introduced when I tweaked the updated  banner support (commit aaed87d1).    See gh-5636
Remove restartWithKeepAlive as it appears to be testing the container    The restartWithKeepAlive test really appears to be testing  functionality in the container, rather than our configuration of  the container. It's also not clear what role, if any, keep-alive is  playing as it's not explicitly configured in the test.
Remove accidental usage of UnsupportedOptionException    See gh-18539
Remove unecessary semicolon
Align test with change to exception in latest Framework snapshots
Use a random server port in the Couchbase sample\xe2\x80\x99s tests
Remove a test doing nothing    Closes gh-5673
Remove unused configuration map    Remove the configuration map defined in `GroovyTemplateProperties` which  isn't used. Ironically, that configuration map was exposed with the exact  same prefix as `GroovyMarkupConfigurer`, which broke IDEs support since  two entries had the exact same prefix.    Fixes gh-2840
Increase ESRestTestCase.waitForClusterStateUpdatesToFinish time out to 30s  It is set to 10 sec but sometimes it takes the cluster longer to settle.
make test more deterministic
remove duplicate rule which led to double scoring  r3344
GraalCompiler.emitLowLevel: remove superfluous scopes.
Cache Skylark globals.  Summary: Previously all Skylark extension globals would be repeatedly setup for each individual extension file, which is wasteful, especially since some of that work is using reflection under the hood.  Reviewed By: styurin  fbshipit-source-id: 1d85b96
Issue #2451: removed excess hierarchy from NoFinalizerCheck
Remove unnecessary cast in PrestoS3FileSystem
[TEST] Remove debug leftover
CAMEL-3905: Polished error message in camel-cache. Thanks to Piotr for the patch.
Add check for possible NPE in CompositeParser.
set query cache to null
Polish Javadoc for TestContextTransactionUtils
Use SocketWrapper provided write method
Rewrite the very slow test for join  This test took 4 minutes to run because it cross joins two tables, now it takes 1 second.
CAMEL-11862: Added unit test
Remove redundant size check per code review.
added minor debug logging
Test Counters in a particular Locale
InstrumentationTestLanguage:  support RootNode.getName()
Closing alert that can remain after previous test
Add TikaCLI help for the -f/--fork option previously added for TIKA-416
Clarifies in Javadocs that SpannerIO currently does not support streaming.
r/m unused methods
[TEST] Add some testlogging
remove dead field 'LAST_MIGRATION_KEY'
[java] Deleting unused imports
removed unused imports
Rename class CamelMvcRoutesEndpointTest to CamelRoutesMvcEndpointTest  Signed-off-by: Gregor Zurowski <gregor@zurowski.org>
snapshot path is accountId + volumeid
SimonStewart: Backing out change to the firefox driver test suite  r6128
in partition sender, release incoming vectors after partitioning
fixed "packagesToScan" to avoid additional provider scan (SPR-8936)
CAS-1076 mark as final ticketId parameter to deleteTicket  Marks ticketId parameter to deleteTicket() as final since ticketId assignment is not and is not expected to be modified in deleteTicket() implementation.
remove override so it builds on 1.6 as well as 1.7 java
Enable trace logging in CCR retention lease tests  These tests are failing somewhat mysteriously, indicating that when we renew retention leaess during a restore that our retention leases that we added before starting the restore suddenly do not exist. To make sense of this, this commit enables trace logging.
mark more beans conditional to allow redefinition by implementors (#2605)
Clear Channel.eventLoop on deregistration
Use IndexModule.getSettings() to get the settings.  Original commit: elastic/x-pack-elasticsearch@770f859b6cadf4c93d0069567bc5e80ee48ce1dd
getConstructors changed to getDeclaredConstructors, we ned all of them
Add more integration tests
Set soft closed only if needed
Polish Javadoc for TestContext
Warn in case of incomplete low-level API
Use privateGetPublicMethods() as it is simpler and more direct for this case
Injector should support auto-wiring so eg Spring can create bean instances that uses auto-wiring on bean constructors.
fix compile for ingest plugin lambda
Forgot to close the channel
Fix typo in TimerInternals comment.  ----Release Notes---- [] ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=114766329
Remove unused operator dependency
Remove dead code.  Test Plan: sandcastle
add jmxPort to stress args (ninja)
CAMEL-7603  camel-cxfrs need to store the security context information into the message header
Ensure that both statement and cursor are closed
log the selections
Make ExoPackageInstaller.installFile() a bit more generic.  Summary: Do not hard code the "secondary-dex" directory so that it can be used to install a file to any arbitrary location under dataRoot.  Test Plan: buck test --all buck install <exopackage_target>
Fix GLFrameBuffer  Allows graphic card which supports GL_EXT_packed_depth_stencil to pack depth and stencil.
Add a test for graph consistency; begin implementing interface for entity linking
CAMEL-6555 Removed the useless option setting
Remove unused method.  Reviewed By: jtorkkola  fbshipit-source-id: d1070349ca
Record artifact for a GwtModule.  Test Plan: Manual testing.
Add io.netty.noJdkZlibEncoder system property  Related issue: #2821  Motivation:  There's no way for a user to change the default ZlibEncoder implementation.  It is already possible to change the default ZlibDecoder implementation.  Modification:  Add a new system property 'io.netty.noJdkZlibEncoder'.  Result:  A user can disable JDK ZlibEncoder, just like he or she can disable JDK ZlibDecoder.
Update for Gump now these are known Ciphers
- Compatibility with Eclipse 3.2 (sort of, the flag doesn't mean the same thing, with the new one   doing some new unknown stuff).
Use interface instead of concrete deprecated class.  Summary: `PathOrGlobMatcher` should be replaced with specialized `PathMatcher` children.  Reviewed By: bobyangyf  fbshipit-source-id: 578e880def
Logging the entire query string; crucial bit of logging   r3571
KAFKA-2813; selector doesn't close socket connection on non-IOExceptions  Patched Selector.poll() to close the connection on any exception.  Author: Jun Rao <junrao@gmail.com>  Reviewers: Guozhang Wang <wangguoz@gmail.com>, Gwen Shapira <cshapi@gmail.com>  Closes #501 from junrao/KAFKA-2813
bug 10422: accidentally removed the code for sourceTemplate id when the the volume is created out of template. Checking it in. status 10422: resolved fixed
Pull up EtlBaseTest.getResult()
beef up Javadoc
Add NotSerializable.forUrn to key by URN for non-serializable overrides
Add toString to OperatorContext
revert D13710118  Summary: The fix to https://github.com/facebook/buck/issues/2141 broke one target.  Reviewed By: styurin  fbshipit-source-id: d274a4629f
provided runtime independent toString() for HotSpotVMConfig
[HHH-5563] (JndiInfinispanRegionFactory creates region with a stopped cache, if region previously existed) Fix compilation error as a result of merge.
Mute the 'arc focus' nudge when generating a Project View  Test Plan: `buck test //test/com/facebook/buck/ide/intellij/projectview && buck test //test/com/facebook/buck/ide/intellij`  fbshipit-source-id: c55e36e
Move a test to itest since it relies on data files
Add test for calling varchar(x) function with varchar
Don't clear down thread counts at end of test
Fix another mix-up of connectionUploadTimeout and connectionTimeout
Replace getRuleOptionalWithType..addToIndex with computeIfAbsent in CxxInferEnhancer  Summary: This fixes potentiall race conditions when constructing action graph in parallel.  Also inlined some now trivial functions.  Test Plan: CI  fbshipit-source-id: c52ea80
Add a random date within a specific date range function : Fix checkstyle File does not end with a newline
Fix a typo in Aggregator java doc  ----Release Notes---- [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=96227688
Add @Deprecated to Collection.min()
Adapt timeouts in UpdateMappingIntegrationIT  Relates to #37263 and possibly #36916
Add an NPE guard
CAMEL-13292 - Lets return the full S3Object
Added the missing period
SelectBox: maxListCount off-by-one bug quick fix  The obsolete height-fitting code has a chance to cause an off-by-one-item bug in the drop down box due to a possible precision loss from [ height -=  height % itemHeight ].  This height fitting code is obsolete and unneeded as of the patch implementing maxListCount where the height is calculated off desired number of items and not prefHeight().  This fix simply removes the old code.  This height fitting is now handled
Issue #1555: Use constant for empty array of zero length  Fixes `ZeroLengthArrayInitialization` inspection violations.  Description: >Reports on allocations of arrays with known lengths of zero. Since array lengths in Java are non-modifiable, it is almost always possible to share zero-length arrays, rather than repeatedly allocating new zero-length arrays. Such sharing may provide useful optimizations in program runtime or footprint. Note that this inspection does not report zero-length arrays allocated as static final fields, as it is assumed that those arrays are being used to implement array sharing.
Replace WindowAssignment OldDoFn by FlatMap in Flink Runner  The streaming runner had an OldDoFn that was used for assigning windows using a WindowFn. This is now done with a FlatMap.
Remove pointless Javadoc that replaced the far more useful Javadoc from the Interface
Forgot clearGui() for this element
remove misleading javadoc statement
Improved logging in utility class ExecutionStateTransition
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
Make ErrorLogRecord not crash on null message.  Summary: It's perfectly valid for a Throwable to return `null` from `getMessage`, however Optional.of will crash, whereas Optional.ofNullable won't.  Test Plan: CI  Reviewed By: k21  fbshipit-source-id: 115cb03
Fix test broken by update to encoding. Generally, it is far too difficult to re-encode characters that were encoded in the original URKL when they didn't need to be.
[BEAM-282] Remove the RunnableOnService from testPassThroughThenCleanupExecuted()
Clarify StatementTag semantics  Elaborate the intuition required for tagging nodes and give an example for the debugger.  Signed-off-by: Stefan Marr <git@stefan-marr.de>
2.x: Expand the documentation of the Flowable.lift() operator (#5863)
TextIOTest: shrink size of test data  We have assertions that the files are still big enough, so this is safe. Speeds up TextIOTest 2x.
Experiment: Node based budget.
Use different dispatchers for actors and for queues emitting results
MINOR: SuppressionIntegrationTest should set StreamsConfig.STATE_DIR_CONFIG (#5847)  Sets StreamsConfig.STATED_DIR_CONFIG to temp directory in SuppressionIntegrationTest, to match StreamsTestUtils.  This is a similar fix to #5826.  Reviewers: Ismael Juma <ismael@juma.me.uk>
Limited query on users and roles to retrieve only the first. This will speedup performance on large user basis
it's not possible in new groovy to get a method closure from a property. See MetaClass:621
set correct info message
WW-3044 Replace code by similar code in commons lang
add missing copyright header
Fixed java client's serialization of NetworkConnection. (#3125)
Add toString to OperatorContext
Return null when output is empty in HashAggregationOperator
First pass at updating unmapped list for IBM
2 new tests for OnSubscribeToObservableFuture  1) Creating an Observable from an already-cancelled Future should emit nothing (equivalent to Observable.never())    (it currently emits onError(CancellationException) 2) Creating an Observable from a Future then unsubscribeing immediately before Future.get()    unblocks should be an Observable.never().  This test already passes.
Register EPollArrayWrapper to re-run class initialization.
De-@Betaify Optional. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=30422058
javadoc enhancements for the new doOnSubscribe() method
Remove tests rendered unnecessary when context.xml files were moved from appBase to configBase
Unwrap invocation target exception from QuidemTest#test
Add some tests for annotation values of type Class  Summary: (Reapplying this commit after the stack was reverted; this commit was not related to the failure.)  `StubJar` is going to be gaining the ability to generate stub jars based on `TypeElement`s.  This commit closes some test holes. No bugs found, but good to have the coverage.  Test Plan: New unit tests  Reviewed By: asp2insp  fbshipit-source-id: 4638e1d
Add the 6.7.0 constant to the master branch  Now that the 6.x branch has been bumped to the 6.7.0 version, this commit adds knowledge of the 6.7.0 version to the master branch.
Use Publishers.zip instead of Streams.zip
Replace generic Exception with specific ones
Remove the callAllGets 'feature' of CombinedFuture.  This should only be necessary for buggy future implementation  This is a rollfoward. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=65725521
Optimize map_concat to skip empty map  Performance before: Benchmark                     (mapConfig)  Mode  Cnt     Score     Error  Units BenchmarkMapConcat.mapConcat   left_empty  avgt   20  1838.641 Â± 145.909  ns/op BenchmarkMapConcat.mapConcat  right_empty  avgt   20  1515.713 Â±  96.888  ns/op BenchmarkMapConcat.mapConcat   both_empty  avgt   20   615.368 Â±  57.051  ns/op BenchmarkMapConcat.mapConcat    non_empty  avgt   20  2753.727 Â± 503.407  ns/op  Performance After: Benchmark                     (mapConfig)  Mode  Cnt     Score     Error  Units BenchmarkMapConcat.mapConcat   left_empty  avgt   20   392.266 Â±  38.556  ns/op BenchmarkMapConcat.mapConcat  right_empty  avgt   20   376.552 Â±  32.928  ns/op BenchmarkMapConcat.mapConcat   both_empty  avgt   20    55.276 Â±   7.683  ns/op BenchmarkMapConcat.mapConcat    non_empty  avgt   20  3043.951 Â± 553.951  ns/op
CID-1257434 try with resource
comment use of synchronization in BytecodeParser.maybeEagerlyResolve
Remove event scope from RawTargetNodeToTargetNodeParsePipeline  Summary: Parent class (`ConvertingPipeline`) does that already.  Reviewed By: sbalabanov  fbshipit-source-id: 3899296582
Start working on a copy constructor test - stopped once I realized no Index supports remove() anyway
RecoveryIT.testRecoveryWithConcurrentIndexing should check for 110 docs in an upgraded cluster  Closes #27650
Inserted an empty line
Adding missing expected conditions. Fixes issue 4698
Clean up warnings in Gradle build output
FrancoisReynaud: cleanup wrong import creating compilation error  r12000
Clean-up post init/destroy lifecycle refactoring Allow Loader objects to be restarted
Don't create ABIs from source if postprocessing classes  Summary: A postprocessing step might modify the class files, rendering a source-based ABI incorrect.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: a7a774f
Do not read if a channel is inactive
listPortForwardingRules: fix typo in doc  Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>  This closes #248  (cherry picked from commit e8f8e0e3f23732559a2664b3b9573be8ef76f479) Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>
Differentiate between the top and non-top FrameState bci when computing BytecodePositionWithId.
after I updated from SVN, the string appeared to be missing the closing double quote and semicolon. fixing it so it  compiles peter lin
[BEAM-80] Swap the order of timers and elements sent to ReduceFnRunner
remove System.out.println in Table.java
More Javadoc for LifeCycleAwareChannelHandler
GROOVY-4062: Add getBytes to InputStream, URL and File (patch thanks to jeremi Joslin) GROOVY-2945: Binary counterpart to setText(File, String)
S2S VPN: CS-15932: Allow user to update customer gateway when connection state is ERROR  Conflicts:      server/src/com/cloud/network/vpn/Site2SiteVpnManagerImpl.java
Improves adding tokens to collection
Test file loading
https://issues.apache.org/jira/browse/AMQ-3887 - have local dispatch do safe wait till remove broker setup is complete such that producer is fully created
removing '-debug' command line parameter for grid hub, it isn't used anywhere.  adding fine tuned logging should be done via java logging mechanisms.
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
Replace deprecated newInstance calls  Part of #435 and Bugzilla Id: 62972
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
Allow for null URL
TIKA-2722 -- remove dead code and prevent potentially bad date.toString() call.
bug 7950: removed IPAssoc usage events for system account status 7950: resolved fixed
Remove spaces.
[Minor] Use non-deprecated JUnit API  Signed-off-by: Gregor Zurowski <gregor@zurowski.org>
Standalone runner expects path.home to be set  With elasticsearch 2.0, `path.home` must be set now. Standalone Runner (test) is using elasticsearch CLI which relies on `Environment` to be set.  It produces now:  ``` Exception in thread "main" java.lang.IllegalStateException: path.home is not configured     at org.elasticsearch.env.Environment.<init>(Environment.java:99)     at org.elasticsearch.node.internal.InternalSettingsPreparer.prepareEnvironment(InternalSettingsPreparer.java:85)     at org.elasticsearch.common.cli.CliTool.<init>(CliTool.java:107)     at org.elasticsearch.common.cli.CliTool.<init>(CliTool.java:100)     at org.elasticsearch.index.mapper.attachment.test.standalone.StandaloneRunner.<init>(StandaloneRunner.java:170)     at org.elasticsearch.index.mapper.attachment.test.standalone.StandaloneRunner.main(StandaloneRunner.java:175)     at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)     at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57)     at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)     at java.lang.reflect.Method.invoke(Method.java:606)     at com.intellij.rt.execution.application.AppMain.main(AppMain.java:140) ```  Closes #167.
Switch buck project default to not build targets unless --build is defined  Summary: Building all modules when doing buck proejct is not a good decision in retrospect. If one wants to see generated code, they are better off building the modules they need and not waiting for all of them in the wrong moment. The solution is just flipping the default, and requiring someone to add `--build` when they want this. I kept the original flag to now break people's commands in the meantime.  Test Plan: Run `buck project <target>` with and without --build, see that nothing is built without `--build` mentioned.  fbshipit-source-id: a9fe298
CAMEL-9965: Add javadoc about streaming problem
made it easier to reuse the CamelResourceConfig class, letting you pass in the packages as a constructor
Relaxing protection on buildOption so subclasses can use it
RssEndpoint throw meaningful exception when creating the producer
Tests and procedures for manual index - minor style fix
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
CAMEL-2154 set the httpClientAPI default value to be true
Clean up imports
Only wait 1 second for connections to stop. When killing a stale  connection - if stop doesn't complete - it hangs the broker.
SimonStewart: Make the IE driver consistent with the chrome and firefox drivers  r10506
SPDY: check if spdyHeadersFrame is null before adding it to out
Avoid NPE when doing CFS.scrubDataDirectories
Increase size of response that is written and reduce data read before client drops the connection in an attempt to get this test passing with APR in Gump. Currently the entire reponse is written (and buffered somewhere in the network stack) before the client drops the connection.
[hotfix] Reduce string concatenations in ExecutionVertex
bug 9891: update network_id for ExternalFirewall and ExternalLoadBalancer device_types status 9891: resolved fixed
Remove extra space after open parenthesis in InstanceConnectionInfo#toString.  This closes #416
Close rawTargetNodePipeline in PerBuildStateFactoryWithConfigurableAttributes  Summary: This needs to be closed.  Reviewed By: sbalabanov  fbshipit-source-id: 146c4ab767
CAMEL-5746 add copy method to WireTapDefinition to let user choice if copying or not copying the origin exchange
Fix incorrect error on type mismatch for set operation  The arguments to the error message were swapped.
reuse a shared UrlPathHelper instance in order to avoid reinstantiation overhead (SPR-7269)
ChannelOutboundBuffer returns total pending write size  total pending write size may be used to optimize write batching
Fixed CS for Camel-Test
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
add serializer property to StanfordCoreNLPSlowITest
AwaitsFix GeoShapeQueryTests#testPointsOnly #27454
Fixed ActorGestureListener pan and zoom for rotation and scale.  closes #3157
Use ImmutableMap instead of LinkedHashMap
Return InvalidRequest when using a keyspace that doesn't exist patch by jbellis; reviewed by pcannon for CASSANDRA-3764
Make the new highlighter more robust
Trivial ws change to trigger CI build.
Mark IP range aggregator test as awaits fix  This test reliably fails with the seed 4AC319F8A6B0329B.
Remove unnecessary check for boolean  `musics.get(i).wasPlaying` is a boolean value, no need to use `== true` to check it.
[ML] Fix NPE by calling super constructor that inits members. (elastic/x-pack-elasticsearch#1763)  Original commit: elastic/x-pack-elasticsearch@ee47ad832224c2e2bc0b0099d8505dca98ba0d7d
advance kafka offset when deserializer yields no object
Simplify. Re-name method that no longer actually initializes any ciphers.
[TEST] Use cluster state api to check whether job state is closed.  Original commit: elastic/x-pack-elasticsearch@27c9aa0c417bfa0e299f51c3c9591c660b36c137
doc: fix documentation for METHOD_REF token
CLOUDSTACK-3351: Fix add cluster API to set right hypervisor type  Signed-off-by: Abhinandan Prateek <aprateek@apache.org>
Try making the StartupTimeoutFunctionalTest less prone to spurious failure.
Add a system property that disables Javassist
Remove incorrect check when expiring queries  A query that's in the expiration queue will necessarily have an associated query execution, so checking whether queries.remove() returns non-null and logging an error is incorrect.
Return null when output is empty in HashAggregationOperator
fix build - compilation  Original commit: elastic/x-pack-elasticsearch@7508ed0c38eac583a79e317f8a52bf185b8d0d9d
Remove SourcePathResolver.deprecatedGetPath from c.f.b.android  Summary: Replace relative paths with absolute paths.  Test Plan: CI  Reviewed By: Coneko  fb-gh-sync-id: 2b0a38a
Better naming, and new test  ... using to compare 0.19 and 0.20 so want in both.
Use the builder bailout.
Make TokenVocabParser fields `protected final`
Improved warning if no properties found
SAML SLO: get metadata for requesting service only (#3058)  bug that this patch is fixing: when verifying the signature of an incoming SAML SLO request, SAML metadata for all services had to be resolved. In case another service's metadata file was unavailable at logout time, this caused an exception screen to be returned to the user and no logout to happen. Now, only the requesting service's metadata is required to validate the signature.
TIKA-89: Rename MimeType and MimeTypes  Keep media type parameters in an unmodifiable sorted map.
Fix javadoc tag. (#41329)  s/returns/return/
just read byte in channel buffer wrapper, no need to check for bounds since it is checked internally
Remove unused getProgress method from OrcRecordReader
Use IOUtils to load model file
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
Add missing license file to ThreadPoolTypeSettingsValidatorTests.java
Minor: changed website to orientdb.com
Fixed CS for camel-script
SimonStewart: Preparing to remove the 'isJavascriptEnabled' method.  r11967
[hotfix] Improve ParameterTool exception  This closes #2057
fix test case after changes in https://issues.apache.org/jira/browse/AMQ-4237 broker the tests queue MBean lookup
introduce isolated unit test for BuilderSupport
Add license header to Maps
Discovery: Only add local node to possibleMasterNodes if it is a master node.
Add cxx output path validator in CxxPreprocessAndCompile  Reviewed By: aiked  fbshipit-source-id: aa33b6d71c
Remove unused import
Fix error messages in `Parser` to use unix-style paths  Summary: This adds consistency in how we talk about paths.  Test Plan: `ant test -D"test.class"="ParserTest"` now passes on Windows
Correctly determine if DoFn has an anonymous class in ParDo
Move RestGetSettingsAction to RestToXContentListener (#31101)
Read lock is release if socket is closed.
Add version 6.0.0-beta2 after release
add defensive check (#2684)
Mute ShrinkIndexIT  This is tracked at https://issues.apache.org/jira/browse/LUCENE-8318
Easy one-liner: Fix i18n-unsafe API in AaptStep  Summary: Does what it says on the tin.  Test Plan: CI  Reviewed By: ryu2, dcolascione  fb-gh-sync-id: fed06c3
bug 13023: fixed listAccounts to return all accounts the user is authorized to see status 13023: resolved fixed
Move replaceInPredicates method under the usage
Console: aligned to the right the record count for indexes
beef up Javadoc
Remove unnessary annotations
fixed missing import resulting from merging with master
remove double setting clear
Add utility method to get the latest version of the previous minor
Export waiting time counters
SimonStewart: Putting back the exceptions thrown on setup  r13147
[removed] Unnecessary synchronize blocks in touch handlers.
adding support for DOUBLE proeprties
Removed unused imports
Split plan into fragments only at remote exchanges
some more refactoring
Remove ineffective assert statement.
No need to use a concurrent Queue with out new thread-model. See #626
Log uncaught exceptions from scheduled once tasks  `ScheduledThreadPoolExecutor` allows you to schedule tasks to run once or periodically at the future. If such a task throws an exception, that exception is caught and reported in the future that `ScheduledThreadPoolExecutor#schedule` returns. However, we typically do not capture the future / do not test it for errors. This results in exception being swallowed and not reported. To mitigate this we now wrap any command in a LoggingRunnable  (already used for periodic tasks).  Also, RunnableCommand is changed not to swallow exception but percolate them further for reporting by the future.  Closes #15824
Issue #2912. Cleared cache after graph instance is returned to the pool.
Revert "Exploit DiscoveryNode immutability..."  This reverts commit e76038e076bb66fd4deac62cd8f2ffd9d423cea6.
Added test case for property MAX
Updated Javadoc: date format patterns SPR-17366
WW-1317   - changes in javadoc (uses dojo tooltip attributes as example)
Add unit test for loopsSimulateTailRecursion
Compile on Java8. Fixes #2149
Remove unused import
get rid of Java 1.5 warning  r2519
refined Resource "exists()" check for HTTP URLs to always return false for 404 status (SPR-7881)
[CALCITE-35] More test cases to guard against providing a broken fix for parenthesized join (Muhammad Gelbana)  Close apache/calcite#1228
set the rejoinNeeded in listener's onSuccess
[hotfix][tests] Make SynchronousCheckpointTest create StreamTask instance in the main task's thread
Summary: KVM - double migration can fail  Detail: Undefine VM after migration. Lingering domain definitions cause migrations back to the original host to fail, since domain already exists.  BUG-ID: CLOUDSTACK-2640 Bugfix-for: 4.1.0,4.2.0 Signed-off-by: Marcus Sorensen <marcus@betterservers.com> 1369285950 -0600
Corrects FailedIndexProxy behaviour for updates  The newly introduced `validateBeforeCommit` method in IndexProxy was implemented incorrectly in FailedIndexProxy. It threw exception instead of just ignore that call, just like `newUpdater` did. This caused unexpected temporary failures for transactions touching the same label/key combination as an attempted uniqueness constraint creation did, one that failed due to constraint violations.
Remove unused items
fix for https://issues.apache.org/jira/browse/AMQ-3242  Make the max value actually be Short.MAX_VALUE
Issue #2604: Refactoring of SingleLineJavadoc to resolve LocalVariableName violation
Camel-AWS: Lets use AbstractAmazonSNS in the AWS SNS Client Mock for tests
Remove warn messages: now are as debug messages
Removed useless import.
Minor: server, convert db directory path in unix way
minor improvement in object creation
Remove last reference to ServerFactory
Fixed a NPE on document traversing
Add additional comment on data block sizes properties evaluation lifecycle. Remove old not used method.
improved report for failing tests
Simplify implementation of Commector.setProtocol() - swap outer and inner if() - consistent handling of null value
Remove build description from ConfigSettingDescription  Summary: No longer needed.  Reviewed By: ttsugriy  fbshipit-source-id: a6620d297b
Recommend I18N version
Log the unsanitized redirect URL to facilitate abuse investigations.
Update SDK to correctly set replaceJobId on the Job.  ----Release Notes---- Update SDK to correctly set replaceJobId on the Job instead of the Create request.  [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=99302893
GROOVY-1943 gives Reflector loader two modes in which the Reflector class is resolved different. During class definition the Reflector class is resolved to the current runtime Reflector. If not during class definition Reflector might resolve to a different class, for example if a parent loader knows an additional Groovy runtime.
Register all the installed file system providers at image build time.
HHH-3892 : restore original author
[hotfix] Correct preconditions check in TypeExtractor#getBinaryOperatorReturnType
Removed a '.*' import.
Ensure CachingBuildEngine uses a ConcurrentHashMap for buildInfoStores  Summary: BuildInfoStores depends on computeIfAbsent being called exactly once for each key, which isn't guaranteed by ConcurrentMap.  From reading the guava source, newConcurrentMap should be returning a ConcurrentHashMap anyways, so this probably doesn't cause any problems "in practice", but it's better to be explicit that this behavior is desired.  Test Plan: local builds, CI  Reviewed By: marcinkosiba  fbshipit-source-id: 6cbd0bb
WW-2800 Added setters for response, request and context.
use stream instead of iterator to simplify logic a bit
ignore failing test for now - andy c to look at next wk
Implement SVM support for Truffle libraries.
Remove Page.getBlocks()
Adds license header
CAS-1422 SamlUtils Should Restrict DocType Declaration and Entities via Feature Disabling
Update FPSLogger to use nanoTime.   "currentTimeMillsis" pulls time from the system clock and should not be used to measure elapsed time. Other processes like NTP, or the user, can alter the system clock and the time returned can unexpectedly shift and create bizarre and intermittent behavior.  "nanoTime" is a measure of nanoseconds from some arbitrary time point and is safe for measuring elapsed time.  The results of this bug are rather benign â worst case the time is changed back and you would not get a framerate log message for that time, or until the user restarts the program. However, this flavor of bug can cause significant intermittent issues if present in other areas if the user is unfortunate enough to have his clock changed while he is playing (this happens more than you may think thanks to NTP keeping our system clocks in sync.)  See:  http://docs.oracle.com/javase/7/docs/api/java/lang/System.html#nanoTime%28%29 http://docs.oracle.com/javase/7/docs/api/java/lang/System.html#currentTimeMillis%28%29
add the exception as well to the logging
Make field STANDARD_ESCAPES final
Revert "[TEST] Enable trace logging for translog recovery"  This reverts commit 52d53e658f786d1e0717c3f63676de00426599cb.
Revert rev 1430160 as then camel-manual cannot build.
AlexeiBarantsev: Chrome supports file uploading, unignoring the test.  r17083
Remove duplicated code
Remove running split info before completing its finishedFuture  ListenableFuture::get is listening on the finish of split. If a running split info is removed after it has been set to finished, There may still have remaining running split info alive. This can fail the unit test due to race.
guard against npe on error condition
added minor debug logging
[hotfix] Pass BlobWriter into JobMaster instead of BlobServer
Add macOS Sierra (10.12) platform (#3274)
change to avoid NPEs
SimonStewart: Exceptions propagate up the stack  r13149
Fix usage of @type:"d" in JSON from queries to determine embedded element type
[TEST] Turn off double write check for restore
add iterator based on specific index
Allow message send to finish before shutting down the executor
add toString to match_all docs
Make private vars final
add @since section to doOnRequest() javadocs
Avoid using deprecated methods in StringEncoder
OptionProcessor needs to find the type parameter of an OptionValue field declaration
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=38570 When checking docBase against appBase, make sure we check for an exact match against the appBase
MutableInt's compare method was messed up.
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
Fixed Coverity Issue: Unintentional Integer FLow
Parallel native index population enabled by default
Remove printStackTrace.
CAMEL-4576: throwException EIP now allows to create new exception instance with message with details from exchange using simple language.
Make it simpler to determine which version of state was used to calculate health
[TEST] Enable trace logging for translog recovery
Add a debug output method to the srparser
allow ovm migrate
Remove duplicate code which is invoked twice (#5039)  Reviewers: Ismael Juma <ismael@juma.me.uk>, Guozhang Wang <wangguoz@gmail.com>
Ignore-Behaviour ignored for HtmlUnit in Test  With regards to https://github.com/SeleniumHQ/htmlunit-driver/issues/57 HtmlUnit doesn't throw UnhandledAlertException in case of Ignore. Basically an exception is totally useless at this point  Signed-off-by: Alexei Barantsev <barancev@gmail.com>
Breaks the loop
CAMEL-5657: Ensure recipient list eip shutdown thread pool on shutdown if instructed to do so.
GROOVY-4505: Rogue line number for try/catch statement confuses IDE debuggers (merge rev 21143)
MINOR: Add missing `@Override` to `KStreamImpl.through`  Author: Ismael Juma <ismael@juma.me.uk>  Reviewers: Guozhang Wang <wangguoz@gmail.com>  Closes #1216 from ijuma/add-missing-override-to-through
Add the setters to the servlet getters in the category.
Size BlockBuilder appropriately in map_keys  Previously we allocated one row worth of space per byte of input
[ML-Data Frame] Add data frame transform cluster privileges to HLRC (#43879)  Adds the monitor_data_frame_transforms and manage_data_frame_transforms cluster privileges to the high level rest client.  The ALL_ARRAY variable is only used in randomized tests at the within the Elasticsearch code, so it's not a major problem that these cluster privileges weren't added from the start.  But since ALL_ARRAY is public HLRC users may be using it to find out which cluster privileges exist, so it's best that it contains them all.
Throttling: Convert int parameter to double before calculating thresholdRate (#3407)
Warn in case of incomplete low-level API
Minor change to makig logging consistent
Add error field names to the available params
remove System.out.println in Table.java
Rephrased the description of ChannelHandlerContext
Remove un-used import
Verify that control flow graph is valid after partial evaluation  Otherwise the error will be reported later in the compilation pipeline, which is confusing.
Needs to be volatile as it is used in double checked locking
Fixed a test which failed if REL_GRAB_SIZE was set to 1... the test wasn't written properly
Use getInvokes() in TruffleBoundaryPhase.
Clean up confusing error message on unhandled endpoint  It currently returns something like:  ``` "No feature for name [_siohgjoidfhjfihfg]" ```  Which is not the most understandable message, this changes it to be a little more readable.  Resolves #10946
Fix excessive concurrency when running tests with buck internal test runner  Summary: I inadvertently increased concurrency of tests run with buck internal test runner.  It used to be limited by virtual cpu resoures (num processors), but my changes caused it to be no longer resource aware, and it was running with the concurrency equal to number of threads in the pool instead. This is usually higher than num processors. This contributes to test flakiness.  A more comprehensive fix will come in the future.  Test Plan: visualscrutiny  fbshipit-source-id: cea07c4
Procedure compiler version and disable test output
painless: Add Jack's test
HHH-6346 : Add EntityBinding.entityTuplizerClass(); change getEntityPersisterClass() to return Class<EntityPersister>
Remove jobs from on demand job scheduler by default.
No logical change: remove unused import
Revert "Exploit DiscoveryNode immutability..."  This reverts commit e76038e076bb66fd4deac62cd8f2ffd9d423cea6.
Remove deprecated code
Minor Boolean expression simplification  Signed-off-by: Laszlo Hornyak <laszlo.hornyak@gmail.com>
Fix error-prone error  Summary: The version of guava buck is using has an annotation to verify that the result is used, so following error happens at compile time: ``` ERROR: ~/local/buck/src/com/facebook/buck/rules/BUILD:354:1: Building src/com/facebook/buck/rules/librules.jar (40 source files) failed: Worker process sent response with exit code: 1. warning: Annotation Value.Parameter is superfluous when Style(allParameters = true) src/com/facebook/buck/rules/CachingBuildEngine.java:1480: error: [CheckReturnValue] Ignored return value of method that is annotated with CheckReturnValue         HashCode.fromString(ruleKeyValue);                            ^     (see http://errorprone.info/bugpattern/CheckReturnValue)   Did you mean to remove this line? Target //src/com/facebook/buck/jvm/java:rules failed to build ``` Fix extracts verification method into a separate method to make its intent clear and suppress unnecessary check.  Test Plan: buck test ...  Reviewed By: dinhviethoa  fbshipit-source-id: 3225169
Fixed a bug where the CodecEmbedder implementations do not generate the close request - this issue prevented some encoders like ZlibEncoder from generating the footer
mute NodeTests#testCloseOnInterruptibleTask  For #41448
better failure when failing to find mapping for the key field in data histogram
[TEST] Mute failing InternalEngineTests#testSeqNoAndCheckpoints
Only release write lock if it was grabbed
Remote duplicate test from RemoteClusterServiceTests  The test `testEnsureConnected` was accidentially introduces during #24845
Fixed key repeat when losing focus.  closes #3083
Revert timeout change (no effect).
Fix the failing test and add one more test to cover both when/otherwise conditions.
[TEST] remove AwaitsFix from testSnapshotSucceedsAfterSnapshotFailure, turns out the issue is specific to Java 9 v143
Remove unnecessary import
Log assertion errors with a lower criticality  Part of #376 on github
More detailed error message when create network offering fails
No logical changes - removing unused `static` and adding whitespace
In ConditionalEliminationPhase, check whether a ValueNode does record usages; caused crashes in FastR
Removed a superfluous import
merge from 0.4 branch
remove unused imports
give the cleaner almost double the time to clean up the sessions (a whopping 9 more ms). Hopefull will deflake this test in CI.
Unneeded version check was removed.
decode url first before adding to the list
ported fix to trunk :  http://issues.apache.org/activemq/browse/AMQ-1173
Add inline comment to prevent confusion
[Monitoring] Fix MonitoringIT on Windows  Original commit: elastic/x-pack-elasticsearch@7a835c179daee79b5446d453b5e7ac6d8ffe1a81
Avoid use of double constructor of BigDecimal  Codacy warns about an Error Prone [1] use of the double constructor of BigDecimal in tests. The reason given is that it is a source of precision loss if the number does not have an exact double representation. The recommendation is to use the String constructor of BigDecimal instead as it does not require using a lossy argument.  This commit contains the following changes:   - replace usage of the double constructor of BigDecimal with the    String constructor of BigDecimal in JdbcTemplateQueryTests  - update the copyright year   [1] http://errorprone.info/bugpattern/BigDecimalLiteralDouble  Issue: SPR-15077
Log compaction before we commit the transaction
use same method names everywhere
Fix encoding set for query parameters
PatrickLightbody Let the SslRelay be used from any classes that want to extend ProxyHandler  r7951
fix issue on schema snapshot managment for schemafull documents.
server: volume disk offering owner checkaccess fix  Signed-off-by: Abhishek Kumar <abhishek.kumar@shapeblue.com>
CLOUDSTACK-2067 - ACS4.2 - throw LibvirtException instead of squelching it so that callers of startVM in LibvirtComputingResource know that a vm failed to start  Signed-off-by: Marcus Sorensen <marcus@betterservers.com> 1366224775 -0600
EranMes: Accurately relay the state of modifier keys when performing mouse actions. Unfortunately, it does not improve the functionality of combined mouse and keyboard actions tests.  r10673
Remove unused field  Reviewed By: styurin  fbshipit-source-id: 12b7e4b02d
CAS-930 Add @NotNull annotation to facilitate identification of component wiring problems that should manifest at deployment time instead of runtime.
Retain the order the URLs were added in when calculating the result for getURLs()
quell cmdline compile warning
use existing mapping when merging
Adds unit tests for named parameters containing strings with quotes.
[hotfix][runtime] Add @VisibleForTesting to Execution#markFinished()
CLOUDSTACK-7283: listUsers - for regular user, only return the caller info. If there are more users under the same account, their information should never be returned
Adds license header
Minor: remove warning
change MIN_SANE_LIVE_RATIO logging to debug patch by jbellis for CASSANDRA-5377
Work-around to release threadlocal ActionContext in init and destroy  WW-2167
removed unused @MethodSubstitution for Object.<init>
[BEAM-7196] Add Display Data to FileIO Match/MatchAll
[TEST] add a test that explicitly verifies no duplicates are created we do this test in other places in ES, but no dedicated test for it. This test was born out of the auto generate id work, but we should have this test regardless if it gets in or not
Remove some dead-code and cleanup
Added ignore on the CamelSpringJavaconfigTest as it need to be run with Spring 3.x
Fix nested projections on INSERT RETURN statement  Resolves: #8543
Truffle-DSL: fixed generic type earsure for types in the type system.
RemoteWebDriver should not add its own information to the recreated server exception, it makes harder to read exception messages.
Added method for rolling back all of a slaves transactions (the master side calls it when a slave has gone down)
Fixed unit test on slower boxes
Remove duplicated code
Move a comment in NativeLibraryMergeEnhancer  Summary: This got put in the wrong place during development.  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 25f9243
improvements for CAMEL-619 to avoid showing null nodeID and to show the body java class too
use new SpEL parser
add sourceRef to SearchHit
Replace getStaticLabel with getLabelResource
Correctly detect LastHttpContent after encoding
Remove unnecessary synchronized block
Adapt to renaming of RestTestCandidate
Issue #3891: added test support for CheckUtilsTest
GraphBuilderPhase: remove unused constant added by createExceptionDispatch
Buck plugin disable buttons if server isn't connected  Summary: Disable all actions if the server isn't connected, since we may lose information if we don't get the messages  Test Plan: Tested by connecting/disconnecting from the server.  Reviewed By: jimpurbrick  fbshipit-source-id: 71b6965
Remove warning message during dx that affects buck build progress printing  Summary: When using libraries like leakcanary dx prints warnings like ``` warning: Ignoring InnerClasses attribute for an anonymous inner class (com.squareup.haha.guava.base.Joiner$1) that doesn't come with an associated EnclosingMethod attribute. This class was probably produced by a compiler that did not target the modern .class file format. The recommended solution is to recompile the class from source, using an up-to-date compiler and without specifying any "-target" type options. The consequence of ignoring this warning is that reflective operations on this class will incorrectly indicate that it is *not* an inner class. ```  That completely stalls the buck build progress from being output to stdout. The build will silently pass/fail without any indication whatsoever due to this after being stuck  ``` [+] BUILDING...5.8s [28%] (227/495 JOBS, 227 UPDATED, 227 [45.9%] CACHE MISS) ```  This change prevents the warning from being print to the console. Closes https://github.com/facebook/buck/pull/752  Reviewed By: Coneko, dreiss  fbshipit-source-id: 0b9cda7
Fallback image build must not have `.` on classpath
re-added name on the network connector
ShadowingClassLoader can be constructed without default excludes  Issue: SPR-15439
Java tests: An attempt to nail down a test that fails for an unknown reason
Fix for ReadNode.push which could cause some reads to float before the necessary checkcast. This would cause loading non-oops as if they were oops in some rare cases.
Add @Beta to new method that hasn't yet been API reviewed.  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=131302300
Added specific unit test for scoped-proxy target not being an autowire candidate  Issue: SPR-11548
Test: mute testDataNodeRestartWithBusyMasterDuringSnapshot  This commit mutes DedicatedClusterSnapshotRestoreIT# testDataNodeRestartWithBusyMasterDuringSnapshot which fails reproducibly.  See #36283
Make toString() less verbose
Removing duplicated import  Original commit: elastic/x-pack-elasticsearch@1618ec79d4c8cafb639d4cfc0bb2e9afea3e1ae2
Allow to call WorkerProcessProtocolZero.CommandSender.close multiple times  Summary: `Closeable` interface states that `close` can be called multiple times and if the resource is closed then `close` has no effect.  Reviewed By: bobyangyf  fbshipit-source-id: e62aede80d
Group private static fields together No code change
Increase the timeout of LocalTransportThreadModelTest to 1 minute
Revert "bug 11239: add check for hypervisor type when deploy vm, no way to deploy a vm with hypervisor type None"  This reverts commit f1e66738bb252c20a9ec1b8dffc2fd24521458dc.
Boolean expression simplification  Signed-off-by: Laszlo Hornyak <laszlo.hornyak@gmail.com>
Add a test case for durable topic unsubscribe.
ignore com.oracle.graal.compiler.test.ea.PartialEscapeAnalysisTest.testCache() as it causes problem on the gate
Improve ProcessUtil's toString method
Add unreleased 5.6.5 version number
Log Drillbit environment at start up.
Make iterator static
Removed unused imports
Remove unused imports
test: do not use deprecated shard preferences (elastic/x-pack-elasticsearch#2630)  This commit makes sure that we won't use the deprecated shard preferences.  Relates elastic/elasticsearch#26335  Original commit: elastic/x-pack-elasticsearch@273e968407d428b1b70157f4799f8d0fa61d9147
Allow aggregation of an empty TupleStream
Remove duplicate @since tags in EmbeddedDatabaseBuilder
Make indexLeaves(index, overwrite) public
Bugfix for iOS File.exists().
Save URL separately from samplerData
CAMEL-8478: IdempotentRepository - Add clear operation, align FtpConsumerIdempotentRefTest with clear operation
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
Unused code. Prepare to drop it in 9.0.x
Fix memory accounting in ParallelHashBuildOperator  Use same logic as for HashBuilderOperator
Remove duplicate range check in AbstractByteBuf.skipBytes()
Remove test message comparison.
Refactor OScriptDocumentDatabaseWrapper (db instance for js functions) to use new SQL executor
Add distinct grouping sets tests
bug 13679: cosmetic fix to remove NPE warning message from log. Reviewed-By: anthony
initialize port to 0 to avoid an NPE later on when args are checked
Added onSnapshotCreated method
Remove redundant throws clauses
Bug 60650 - AbstractBackendListenerClient does not reset UserMetric between runs  Bugzilla Id: 60650
Add regression test for #561 (token named ATN breaks reference to ATN.INVALID_ALT_NUMBER)
add GroovyObjectSupport as type
Fixed issue #2030 about Backup with files >2GB (critical)
Improve tests for detection of @MVC annotations  Issue: SPR-9601
Mute PermissionsIT#testWhen[...]ByILMPolicy (#41858)  Relates #41440
Adapt ReactorHttpsServer to lates Reactor Netty changes
VPC: added missing FirewallService to the VR provider
EranMes: When a Point instance is printed, the output will now be useful.  r12351
Ignores insubordinate test, to be reviewed later
Frustum: add methods using floats instead of Vector3
Remove pointless Javadoc block
doc: fixed the wording in javadoc for TrailingCommentCheck
Delete unused import
javadoc comments for MetaObjectProtocol interface
DanielWagnerHall: Making element equality and hashCode consistent.  This makes the /element/:id/equals/:other command obsolete.  Leaving the handlers in for backwards compatibility.  r14281
DouniaBerrada: Cleanup for android   r10357
Remove comments used to debug
we need to watch out for content types like "text/html; charset=..."   r2743
TikaCLI: add attachement extraction option
SECURITY: Fix Compile Error in ReservedRealmTests (#33166)  * This was broken by #32515 since the 5.x versions were removed between PR creation and merge
Interval#previousUsage: return -1 if there is no usage.
Improved failure report information
set KW_COMPACTION back to "compaction"
Fix broken CompositeMatcher  Motivation:  ChannelMatchers#CompositeMatcher inverts matches result.  Modifications:  Switched return values.  Result:  ChannelMatchers#CompositeMatcher will return correct results.
Revert "BEAM-5933: avoid memory allocation in hashCode call"  Fixes BEAM-6407.
CAMEL-11703 - Camel-AWS: Use builders instead of different constructors - AWS SWF
Adds timed wait on ResponseFuture so it is more frequently scheduled
Remove unnecessary calls. Closing the socket recycles the processor which in turn recycles the buffers.
[TEST] Add discovery-multicast to PluginManagerIT
Remove getter functions from FunctionInfo
when there's an IOException, the URL should still be set. Found this difference in the process of writing the monitor. I use the URL as the unique key for each individual serverpanel.  peter lin
Remove unnecessary reflection.
TestCompiler: Show error messages when compilation fails  Summary: Previously it would just fail, and you'd have to dig in with a debugger to figure out why.  Test Plan: Change a test so that code being compiled with TestCompiler has a syntax error. Verify a nice neat error message is provided, for example:  ``` java.lang.AssertionError: Compilation failed! Diagnostics: /var/folders/6l/vnx69_dd2n350z3r19crkh8wtgfqms/T/junit9027585281430870503/A.java:3: error: ';' expected   B.C field            ^ ```  Reviewed By: asp2insp  fbshipit-source-id: ec30696
Workaround for issue 1075
Explicitly ignore empty tokens in the value of VirtualWebappLoader#virtualClasspath
Use scheduled delay instead of manual one.
Remove unused import.
Construct AfterEachStateMachine from list of subtriggers
add ability to spit out count
[TEST] only pass valid random settings
KAFKA-4661: Improve test coverage UsePreviousTimeOnInvalidTimestamp  Author: Jeyhun Karimov <je.karimov@gmail.com>  Reviewers: Matthias J. Sax <matthias@confluent.io>, Guozhang Wang <wangguoz@gmail.com>  Closes #3288 from jeyhunkarimov/KAFKA-4661
Migrate TestCustomFunctions to AbstractTestFunctions
Deprecate `Capabilities.isJavascriptEnabled`  This provides no useful functionality over calling:  `Capabilities.is("javascriptEnabled")`  Worse, it's suggesting that browsers can be used with webdriver without JS enabled, which isn't true.
Don't use deprecated constructor. Use the default one.
sql: added test case after the regression on min() and max() sql functions executed as inline
Added a some logic for specifying values that the slider can snap to.
Update for Gump now these are known Ciphers
[FLINK-11334] Add good EnumSerializer.toString()  This makes it easier to understand failing tests where serializers are being compared.
Correctly calculate checksum when using GZIP. Part of [#2168]
use try-with-resources to close userLogFileStream
Don't create ABIs from source if postprocessing classes  Summary: A postprocessing step might modify the class files, rendering a source-based ABI incorrect.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: a7a774f
EranMes: When a Point instance is printed, the output will now be useful.  r12351
Fixed CS for Camel-test
Fix https://bz.apache.org/bugzilla/show_bug.cgi?id=58386 On the basis that access() and finish() are synchronized, extend synchronization to other methods that access same fields.
Add test for late intrinsic inlining.
Added a toString() for debugging
Change the extension point for CompilerTreeApiTest  Summary: One of the overloads of `CompilerTreeApiTest.compile` used to be the thing to override if you wanted to do something no matter how the compiler was invoked. After `initCompiler` was added, one if its overloads became a better place, but I neglected to make it so.  Now I need it in a new test, so here we are.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: 2932ac1
Added missing license header.
javadoc: diagrams for onBackpressureBlock (would benefit from a review)
Issue 609: revert wrong change on cert tests
add 0.18.4 version
Make Infer capture rules depend on the preprocessor  Summary: Infer rules add the `PreprocessorDelegate` to the rule key so they need to depend on the preprocessor, otherwise they might fail when they try to hash the preprocessor script (in case it is generated by another rule).  Test Plan: Run Infer capture with a genrule-generated preprocessor script.  Reviewed By: Coneko  fb-gh-sync-id: 16cb256 fbshipit-source-id: 16cb256
Added a test case for the KernelExtension contract test.
HIVE-4602 Enable running all hive e2e tests under vectorization. (Tony Murphy via omalley)
Related issue: NETTY-116 HTTP issues including chunked request / response patch * Applied Dave's patch for HttpMessageDecoder
Added function to add an asset to the AssetManager Added function to retrieve all the assets of a give type
Restore constant for default size to be plain 8 instead of unrelated Byte.SIZE
Added a property to avoid the exception stack trace when running the console
Make ExoPackageInstaller.installFile() a bit more generic.  Summary: Do not hard code the "secondary-dex" directory so that it can be used to install a file to any arbitrary location under dataRoot.  Test Plan: buck test --all buck install <exopackage_target>
nit fix: CxxBuckConfig.UNFLAVORED_CXX_SECTION  Summary: Semantically, in all use cases it prefixes nothing and works as a usual/standard section.  Test Plan: CI  Reviewed By: stepancheg  fbshipit-source-id: ecd0e37
Adds license header
MINOR: Reduce the log level when the peer isn't authenticated but is using SSL  The commit here changes the log level of a log message from WARN to DEBUG. As noted in the mail discussion here https://www.mail-archive.com/devkafka.apache.org/msg56035.html, in a pretty straightforward/typical and valid setup, the broker logs get flooded with the following message:  [2016-09-02 08:07:13,773] WARN SSL peer is not authenticated, returning ANONYMOUS instead (org.apache.kafka.common.network.SslTransportLayer)  Author: Jaikiran Pai <jaikiran.pai@gmail.com>  Reviewers: Ismael Juma <ismael@juma.me.uk>  Closes #1825 from jaikiran/ssl-log-level
Add @since markers
randomly use shield  Original commit: elastic/x-pack-elasticsearch@e3729112e3ac6d6af46e0bb7b7e3eeba1933fcec
HIVE-10332 : Use SortExchange rather than LogicalExchange for HiveOpConverter (Pengcheng Xiong via Ashutosh Chauhan)
Fixed add/remove cluster in class: now default cluster is updated too
Increase delay for Gump. May need to exclude this test.
remove shutdown hook
Remove unused import.
added method to check for key existence
Avoid calls to `getCause` on `Throwable` as it might result into NPE  Patch by Alex Petrov; reviewed by Joel Knighton for CASSANDRA-11272
Muting  SnapshotDisruptionIT  Tracked in #36779
Added distinctUntilChanged member methods to Observable
Refactor parser to use global frame for rules  Summary: This way rule definitions can be reused in multiple environments. In particular this will be used when parsing extension files.  Test Plan: CI  Reviewed By: styurin  fbshipit-source-id: 2cc4640
Remove additional confusing close
DX RegisterSpec optimization for de-interning: mapSourceRegisters  Summary: [Forward Port of 160a87fc81adcc091836b15c54c380069bdf90c5] An upcoming change will make the RegisterSpec class not interned as a part of making DX in-process safe.  PhiInsn.mapSourceRegisters is currently doing an "==" check to determine whether to call SsaMethod.onSourceChanged.  Without interning, that check might fail where it would have previously succeeded (for two equivalent but not reference-equal RegisterSpecs), resulting in an unnecessary call to onSourceChanged.  (I don't know if this can *actually* happen.)  This diff optimizes that case by doing an early exit if the new and old source have the same register.  Inspection of the method shows that when this is the case, it just removes the instruction from a list, then adds it right back.  This diff should be correct and safe on its own, but it seems unlikely to have any benefit as long as RegisterSpec is interned.  Test Plan: ant dx-tests
Assert correct Slice representation in CharType
Let Groovy Console syntax highlight the trait keyword
added constructor to FailedToCommitException
Looong lines  Original commit: elastic/x-pack-elasticsearch@8c7931c179441643c6df7307cdd463e650315edc
TEST: Mute testRetentionPolicyChangeDuringRecovery  Tracked at #32089
MINOR: add unit test for Utils.murmur2 (#5926)
removed System.out.println() statement
Properly merge Cost.percentCorrect
make javadocs for scan() more precise (#1857)
Add support for notify periodic event of cluster.
Remove the irrelevant AIO channel options
removed unused imports
Use Java's built-in way of joining collections.  Reviewed By: styurin  fbshipit-source-id: 5d770888f4
Test cleanup.
Add missing used flag for write(int).
[FLINK-3840] Remove Testing Files in RocksDB Backend  We create random files on initialization to check whether we can write to the data directory. These files are also removed now.
ReadTimeoutHandler - missing ) within JavaDoc example (#8645)  Motivation:  improve docs  Modification:  ReadTimeoutHandler - missing ) within JavaDoc example  No logic/unit tests affected
update WordCountCounters for SuperColumn refactor
added better javadoc for DGM.with(Object, Closure) and DGM.transpose(...)
fix for make sure that http command support multiple languages
[BEAM-5658] Suppress findbugs warning about intended reference equality check
Ensure valid output encoding
Restore method required for JSR 77.
sql: added test case after the regression on min() and max() sql functions executed as inline
Handle 0 or negative request in Buffer
* added default bindings to the script being executed inside <groovy/> tag   - ant : an instance of groovy.util.AntBuilder that knows about the current ant project  - project : the current ant project  - properties : a Map of ant properties, e.g. properties['java.vendor']  - target : the owning target that invoked this groovy script  - task : the wrapping task, can access anything needed in org.apache.tools.ant.Task, e.g. task.log("Problem...")  e.g. <groovy>  ant.echo("hello world")  ant.jar(destfile:"foo.jar", basedir="classes") </groovy>
A better way to get default value
Test that SimpleDoFnRunner wraps exceptions in startBundle and finishBundle
Skip retry when creating Hive RecordReader  We do not retry for other readers. File system implementations already retry when necessary and have more context to handle it correctly.
Ensure image-runtime environment vars for JNI platforms
r/m unused BUFSIZE patch by jbellis; reviewed by Eric Evans for CASSANDRA-424
Restores StateContexts.stateContextFromComponents  It must be temporarily restored for compatibility with current Dataflow worker in order for integration tests to pass.
Ensure path to Javac jar is encoded in rule key  Summary: When the Jsr199Javac amends the RuleKey, it currently disregards whether or not the compiler being used comes from the OS or from a user-supplied JAR. Since the two compilers may differ in their behaviour, it seems wise to encode this data in the RuleKey.  Test Plan: buck test --all
Serialize aggregation States to VARBINARY  Serialize to VARBINARY instead of VARCHAR to avoid UTF8 encoding issues.
CAMEL-8270 Added an unit test for it
Fix test under windows  Silly `\r`.
Add missing doc
AbstractApplicationContext.isRunning() avoids IllegalStateException  Issue: SPR-13667
Minor Boolean expression simplification  Signed-off-by: Laszlo Hornyak <laszlo.hornyak@gmail.com>
Optimise - Is a tiny faster as the extra add is not needed as we dont use the returned value.
ODocument.fieldNames() now returns a Set<String> instead of String[]. This avoid the creation of an array when you need to iterate over the fields.
Addded reference of TypeToInstanceMap to ClassToInstanceMap javadoc. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=31252218
Add missing call to handleThrowable
Expose executor. Required so Servlet 3 Async implementation can use the container thread pool when a new thread needs to be dispatched. (e.g. from AsyncContext.start(Runnable)
Test that it's possible to attach a callback to a ListenableFuture<?>. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=67713851
Serialize aggregation States to VARBINARY  Serialize to VARBINARY instead of VARCHAR to avoid UTF8 encoding issues.
prefactor for PR#430 (copy an example in the javadoc that would otherwise be lost)
Uses new way to access TileContainer
Ensure flowController().writePendingBytes() is triggered when writing response in example  Motivation:  We called ctx.flush() which is not correct as it will not call flowController().writePendingBytes().  Modifications:  Call flush(ChannelHandlerContext) and so also call flowController().writePendingBytes().  Result:  Correct http2 example
Mute SslNullCipherTests on JDK12  JDK12 doesn't support NULL cipher for TLS by default. This commit mutes these tests on JDK12 until we decide whether we need to keep or remove them
Made discovery service redirect to webadmin work in IE.
Clean up the component document of camel-netty
Issue #4581: Reorganize token methods in GenericWhitespaceCheck
Add a call to `BuildTargets.getGenPath`.  Summary: No functional change. I just missed this when I created `getGenPath`.
2.x: update Obs.just(2..10) & switchOnNextDelayError marbles (#5651)
Maybe die before trying to log cause  This commit reorders a maybe die check and a logging statement for the following reasons:  - we should die as quickly as possible if the cause is fatal  - we do not want the JVM to be so broken that when we try to log    another exception is thrown (maybe another out of memory exception)    and then the maybe die is never invoked  - maybe die will log the cause anyway if the cause is fatal so we only    need to log if the cause is not fatal
Add validation to ErrorCode
Expose source ID for desktop usage.  http://www.java-gaming.org/topics/libgdx-request-expose-openal-sourceids/30788/view.html
[test] mute RemoveCorruptedShardDataCommandIT
Removing unneeded cast
Add test for FrameworkDependencies metadata traversal in AppleBundleDescription  Summary: I promised to add a test, here it is.  Apple bundle should stop FrameworkDependencies traversals instead of recursing into its binary field.  Test Plan: This is a test.  Reviewed By: ryu2  fbshipit-source-id: 28108ee
WW-4168 Added if statement in method isChecked to verify that the String Array of checkBox name values is not null.
CLOUDSTACK-2077:The updatePhysicalNetwork command fails to update the database
Remove extra explicit type
Add JavaDoc to InstrumentBranchesPhase.
more specific return value on ObjectStamp.join
Remove import for java.util.Formatter since it's needed only for the javadoc. ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=108184450
Further to [CALCITE-604], add "synchronized"
Fix a couple of ASync issues that were causing Servlet 3.0 TCK test failures. 1. <quote section="2.3.3.3" page="17"> The complete method can be invoked by the container if the request is dispatched to a servlet that does not support async processing, or the target servlet called by AsyncContext.dispatch does not do a subsequent call to startAsync. In this case, it is the container's responsibility to call complete() as soon as that servlet's service method is exited. </quote> 2. <quote section="2.3.3.3" page ="13"> public boolean isAsyncStarted() - Returns true if async processing has started on this request, and false otherwise. If this request has been dispatched using one of the AsyncContext.dispatch methods since it was put in asynchronous mode, or a call to AsynContext.complete is made, this method returns false. </quote>
2.x: Describe merge() error handling. (#5781)
Add test for new HTTP GUI
Implement EquiJoinClause.toString()
Make iterator of SBTreeRIDBag resettable
Avoid potential NPE in error message
Add tests for INSERT and UPDATE on a PreparedStatement via executeUpdate()
Further refinement on PR-201
CLOUDSTACK-5145 : Added permission checks while deleting network ACLs
Make Write Barrier abstract class
DRILL-1098: Add test for trim(), substring() function. Actual fix is in OPTIQ-331
Javadoc This complete the org.apache.coyote package which is now warning free
CLOUDSTACK-5663 : Added the NULL CIDR check to avoid NPE for createNetwork and listNetwork  Signed-off-by: Daan Hoogland <daan@onecht.net>
https://issues.apache.org/jira/browse/AMQ-5621  Have the test store its data in the target folder to let the clean step remove it and attempt to remove the data folder between runs to avoid state derby instances.
Add test to reproduce SPR-15271
added test case for this issue: http://www.nabble.com/Caught-exceptions-also-proceed-tf4285006s22882.html#a12252463
removes custom implementation for setDelegate
bug 7829: fixed the keyword search for storage pools status 7829: resolved fixed
Add mew method from Java 1.7 to prevent compiler errors when only 1.7 is installed.
AlexeiBarantsev: Remove a temporary directory that contains a profile extracted from json string. FirefoxProfile(dir) constructor copies content of this directory (webdriver*) to a new profile  directory (anonymous*), so immediately after copying it can be safely removed. Fixes issue 1934  r13935
[java] Deleting unused imports
Fix license messaging for Logstash functionality (elastic/x-pack-elasticsearch#3268)  * Fix license messaging for Logstash functionality  With a Basic license, users are still able to perform CRUD operations on the `.logstash` index, therefore manage their Logstash pipelines. However, Logstash itself will not pick up any changes from this index and act on them. With an expired license Logstash functionality continues to operate as normal.  * Fixing messages after feedback  * Removing extraneous tabs at end of line  * Fixing typo  Original commit: elastic/x-pack-elasticsearch@bc069cf00ff865056ee53fd3e7c79b325c68dcee
Remove flaky test  This test fails intermittently due to how Antlr4 works (compared to Antlr3)
Ignoring recently added test in legacy Firefox driver
DanielWagnerHall: Strip ports from domains on cookies, as per RFC2109, and print the date in the cookie-expected format  r9663
Plugins: Ensure logging configuration is loaded in plugin manager  This prevents log4j warnings printed out, when installing a plugin due to the JarHell class using an ESLogger.  Closes #12064
Added the unit test of sending request/reply between the jms endpoint and jetty endpoint
Forced close of storage on delete()
Change empty leaf label to avoid weird behavior with multiword token splitting
Fix exopackage installer on machines with PIC warnings (like the official Google x86 KitKat emulator image)  Test Plan: install any exopackage program on the 4.4 x86 SDK emulator image; watch it not fail
Improve subscription removal in SubscriptionRegistry  Avoid using destination pattern based search when removing sessions or subscriptions from DefaultSubscriptionRegistry and use only session and subscription ids.  Issue: SPR-11930
Fixed compilation error
Rename unit test so it looks like a unit test  Original commit: elastic/x-pack-elasticsearch@d2d39ad50bb1a638461f1e2aed21110b732ea5e0
don't try to copy empty libraries since they won't be built by Xcode  Summary: Apple libraries without sources will not build an output file so do not try to copy it.  Reviewed By: dinhviethoa  fbshipit-source-id: 04d9eee0b9
SimonStewart: Make the IE driver consistent with the chrome and firefox drivers  r10506
Change order of modifiers
HIVE-3057: metastore.HiveMetaStore should set the thread local raw store to null in shutdown() (Travis Crawford via Ashutosh Chauhan)
small parsing fix for fields
Adds an explicit generic in a test
allow controllable stack dump in ExceptionUtil.java
Added tests to install the server on a path with strange characters and space in it
Test: move no master node test over to only use unicast zen discovery. On the build server there is no multicast enabled.  Original commit: elastic/x-pack-elasticsearch@20eab58db1180ab20a92c0227b72b0b6d4fbcd7c
Changed the priority of delete-index action to URGENT  All index meta data API's have urgent priority when it comes to cluster state updates. We'd like to remove indices asap to avoid things like unnecessary shards relocations
HIVE-3436 :  Difference in exception string from native method causes script_pipe.q to fail on windows (Thejas Nair via Ashutosh Chauhan)
codec-http2: Stop leaking in header downgrader test  Motivation:  We're leaking requests in our Http2ServerDowngrader tests when we allocate a buffer using the local allocator.  Modification:  Release the request later when the request is constructed with the local allocator.  Result:  Less leaky tests.
[hotfix] properly encapsulate the original exception in JobClient  This closes #2890
MAHOUT-956: filter logs, crc
Refined exception message  Issue: SPR-14609 (cherry picked from commit ab68673)
remove unused method
Parallel query: fixed issue with transactions  When transactions are running, the parallel doesnât work because the way the database is cloned between threads It doesnât take in account the transaction data structures in db.copy()
TIKA-710: Expose the Parser and Detector instances within the Tika facade
Do not execute destructors for multiple program executions
ASM annotation visitor defensively accesses enum constants  Issue: SPR-15442
[FLINK-1478] [jobmanager] (addendum) Add eager check for null as input split host name
Dialog, fixed focus issues.
push down allocations to where they are needed
Fix up some raw types
fix for GROOVY-2535 (add missing line number information)
More robust evaluation after training model
Allow apk expansion to be used with fragments also. Fixes #4787
[no jira] extend the timeout b/c it was on the margins
parseDouble for primitives
Fix scaling thread pool test bug  This commit adjusts the expectation for the max number of threads in the scaling thread pool configuration test. The reason that this expectation is incorrect is because we removed the limitation that the number of processors maxes out at 32, instead letting it be the true number of logical processors on the machine. However, when we removed this limitation, this test was never adjusted to reflect the new reality yet it never arose since our tests were not running on machines with incredibly high core counts.  Relates #20874
ShallowEtagHeaderFilter skips "Cache-Control" header check on Servlet 2.5  Issue: SPR-12414
Update 'contains' signature to 'contains(Object)'
[FLINK-10756][runtime][tests] Wait for TM processes to shutdown
Restoring FirefoxOptions.getBinary method to not return null always.
attempt to fix wal shoutdown issue
[ML] Fixed typo  Original commit: elastic/x-pack-elasticsearch@e66e7febe244f7f0921f0aa4b8fb0a6d113827b0
Re-enables mistakedly ignored tests
Fix error messages in console for wrong query syntax  (in some cases wrong queries silently failed)  Resolves: #5937
FrancoisReynaud: removing the leading - from parameter specified to the hub before storing them to keep consistency between user specified parameters and default parameters.  r16390
WW-3067 Add a configuration constant to turn on/off the logging of missing properties by OGNL
Group private static fields together No code change
[TEST] Add test that shows how to use a classic pull-parser with the object parser
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=53513. Fix race condition between the processing of session sync message and transfer complete message.
Convert android_build_config Arg to be an Immutable  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: fe09ac1
Make it easier to test that the right response was returned
Re-order tests to skip more expensive test when posisble
More logging when PubsubJsonIT fails
DRILL-2548: JDBC Driver - check for bad data from server and prevent SqlException
[Test] Fix remaining static objects after running tests  Test framework detects when static objects are not released when running tests. This commit remove usage of static objects when possible.
find references command: improved find speed
Replace manual array unboxing with ArrayUtils.toPrimitive(). #1538
Fix ExternalJavacIntegrationTest.  Summary: Earlier, we were replacing the entire environment with just one variable. The CI setup changed recently in such a way that the standard environment doesn't have python/java/etc in the $PATH. This fixes that by appending the new value to the existing environment.  Test Plan: sandcastle - ExternalJavacIntegrationTest passes
Support IndicesModule list constructor  Original commit: elastic/x-pack-elasticsearch@c88e2b82b70a49e21bcca66f2712ac88efeb0e9b
remove debug comment
Removing misleading log messages. Fixes issue 6392
Remove unused import.
Backported the harden synced-flush PR to v6.3.0  Relates #28464
SimonStewart: Scan the PATH for the chromedriver server  r11888
Set method in result Test non-GET method
ensures no setter is created for a final property. Thiss avoids not people from writing a setter by hand.
update background task manager shutdown check to include timeout pool  Summary: check that timeout thread pool is terminated when checking that manager is properly shut down (test function)  Reviewed By: styurin  fbshipit-source-id: 90c830c756
Prevent the CheckPointer from blocking CausalCluster Catchup.  By making the checkpointer not hold on to the PageCache monitor lock for the whole check point process.  It turned out that this behaviour could inconvenience the Causal Cluster catchup process. The CC catchup would ask the page cache warmer to list its files. To do that, the page cache warmer would call `listExistingMappings` on the page cache, and that method would also require the PageCache lock.  The fix is that the checkpointer now also uses `listExistingMappings` to grab a snapshot of the mapped files, and then flush them without holding on to the lock on the entire page cache. The `listExistingMappings` method does still take the page cache lock, but it returns much, much faster than a complete page cache flush would.
Add 2.2.1 to the version lookup table
javadoc for BBU.clone
Add an NPE guard
Added missing iOS device  Added the missing Wi-Fi Only iPad Pro to IOSDevice
Allow to use NIOFSDirectory as directory implementations for lucene indexes  Add "default_directory_factory" feature toggle in DirectoryFactory to be able to choose between default directory factory and NIOFSDirectory for lucene indexes directory.
Remove unused rule
*** empty log message ***
Removed a System.out
don't throw exceptions when you can't add host
Add the .vtt type used for HTML5 video subtitles. ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=132996392
Remove DirCache logs about hit/miss, as we geting them from CachingBuildEngine  Summary: These are rarely used logs, and we get almost the same information from CachingBuildEngine logs  Test Plan: CI  Reviewed By: marcinkosiba  fbshipit-source-id: 6a2926d
Minor changes to make the benchmark test look more like the one submitted to DEFT
&= is needless as stoppedAll is true Added TODO waiting for answer from sebb on dev mailing list Bugzilla Id: 53418
TIKA-844 Add an internal TagBag property type constructor, patch from Ray Gauss
replaced __system with Constants.SYSTEM_COMPONENT_ID
Deprecated unused code.
Adapt to api change in es core  Original commit: elastic/x-pack-elasticsearch@4d6f6abf0296fdadd57dea30803733b6c289ce3d
Avoid NPEs so tests fail rather than error
Fixed a bug with javac
Ensure result of getVersion() is consistent with getMajorVersion() and getMinorVersion() With the current code this fails. Patch to fix this to follow.
Query DSL: prefix query to support _id, closes #1648. (fix support analysis for prefix is configured)
Remove unused private method, issue #744  All violations of PMD rule [UnusedPrivateMethod](http://pmd.sourceforge.net/pmd-5.2.3/pmd-java/rules/java/unusedcode.html#UnusedPrivateMethod) are fixed.
Fixed the tests in storm-starter that do not use the actual TupleImpl but mock everything themselves
Add the piece of information that I really wanted last time. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=88115213
[TEST] added @AwaitsFix to failing StringTermsTests while I work on a fix
CLOUDSTACK-3428 UCS:API: We need listUCSManager API to lists all UCS managers registered with CloudStack  fix entityType in api command
Corrects FailedIndexProxy behaviour for updates  The newly introduced `validateBeforeCommit` method in IndexProxy was implemented incorrectly in FailedIndexProxy. It threw exception instead of just ignore that call, just like `newUpdater` did. This caused unexpected temporary failures for transactions touching the same label/key combination as an attempted uniqueness constraint creation did, one that failed due to constraint violations.
CloudStack-1267: initialize log4j in agent main()
[FLINK-10881] Use cancelWithSavepoint in SavepointITCase test.  This closes #7833.
fix check for rememberMe in authentication (#3869)  Fix a problem that kept remember-me authentication from working when logging in to a service protected with mfa-duo.   The test in CookieRetrievingCookieGenerator() for the presence of AUTHENTICATION_ATTRIBUTE_REMEMBER_ME in the authentication object was always failing, because an unnecessary CollectionUtils.wrapSet() was being used before checking the value. This would result in a TGC being saved with session lifetime, even when the "Remember Me" box was checked.  To test: select the "Remember Me" box when logging in to a service that requires duo-mfa; check the lifetime of the TGC cookie in the browser.
Add some minimal documentation for NERFeatureFactory's distsim
addressed review comments
Rebuild Xcode symlink trees on Buck version change  Summary:   * If the Buck version changes, rebuild all header symlink trees we create when     we generate an Xcode project. This makes sure that the trees are up to date     even if the logic that builds them changes.  Test Plan:   * Use a different Buck version, check that all header symlink trees are     recreated even if their contents do not change.
SPR-8725 Change modifier in WebMvcConfigurationSupport methods from package private to public.  Use of package private @Bean methods can cause issues if the class is extended and the sub-class is in a different package. This is  covered in detail in SPR-8756.
[added] GraphicsType.Angle
HIVE-5978 : Rollups not supported in vector mode. (Jitendra Nath Pandey via Ashutosh Chauhan)
GROOVY-1746: add missing @since
Remove v[N/A] log output
Tests for missing placeholders during binding    Add a test to ensure that that there is a hard failure when trying to  bind properties with missing placeholders.    Closes gh-8693
Mark thread as interrupted after catching InterruptedException    Closes gh-11784
Observation of performance degradation when running under JDK 8 (#4381)
check the metadataServiceExporter when exec ShutdownHookCallbacks (#5650)
Tweak Javadoc for Part to use something other than RequestBody.
Tweak Javadoc for Part to use something other than RequestBody.
Avoid limitation of javac's type inferencing
Remove some tests.    We don't have to test the test and failure naming for tests with  @Parameter annotation again, because it is not different from the test  that sets the parameters via constructor.
Configure WebClient to use same address (IPv4 or IPv6) as server    Closes gh-11712
Configure worker for Undertow\xe2\x80\x99s access log to use daemon threads    Previously, the worker used non-daemon threads which meant that they  prevented the JVM from shutting down. Ideally, we\xe2\x80\x99d avoid this problem  by closing the worker and access log receiver as part of stopping  Undertow, however, due to an apparent bug in Undertow [1], it\xe2\x80\x99s not  possible to do so cleanly.    This commit configures the access log worker to use daemon threads so  that they do not prevent the JVM from shutting down. Unfortunately,  this means that the threads will still be running after the context has  been closed but before the JVM shuts down but that appears to be  unavoidable due to the aforementioned Undertow bug.    Closes gh-4793    [1] https://issues.jboss.org/browse/UNDERTOW-597
Enhance Javadocs on OkHttpClient.setSocketFactory
Postpone checkSubConfig logic in ReferenceConfig (#5226)
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
Exercise overload of RequestBody.create() that takes a ByteString    There is currently no test coverage for it.
Define all HTTP2 error codes (#3756)
Fix CacheAutoConfiguration relative order for Couchbase    This commit fixes the auto-configuration of the Couchbase caching  support by configuring the cache once Spring Data Couchbase has gotten  a chance to be processed.    Closes gh-22542
Polish 'Auto-configure ReactiveStringRedisTemplate if necessary'    Closes gh-16604
Add missing bean property getters
Add Ordered to RegistrationBean    Fixes gh-507
Remove @ConditionalOnMissingBean check on deprecated class    Closes gh-20968
Use fast exceptions in hasMoreElements in LaunchedURLClassLoader    When nested jars are being used, hasMoreElements requires opening a  connection for an entry in every nested jar. If that entry doesn't  exist, a FileNotFoundException is thrown to indicate that a particular  jar doesn't contain the requested entry. This exception is used to  indicate the lack of an entry and is then swallowed, i.e. its stack  trace is of no importance. This means that the performance of  hasMoreElements can be improved by switching on fast exceptions while  it's being called. When fast exceptions are switched on a general  purpose pre-initialized FileNotFoundException is thrown rather than  creating a new FileNotFoundException instance each time.    In certain situations, the use of fast exceptions as described above  can improve performance fairly significantly. The JRE's default SAAJ  implementation uses META-INF/services-based discovery for _every_  request that's handled by Spring Web Services. Each discovery attempt  results in hasMoreElements being called making its performance  critical to throughput.    See gh-3640
Only try to auto-configure Jetty when jetty-webapp is on the classpath    Closes gh-4089
Update FilteredClassPathRunner so that JUnit rules work    Previously, the tests class and any JUnit annotations it contained were  loaded by a different class loader to JUnit. This meant that the JUnit  annotations were loaded twice and @Rule-annotated fields were not found.  This commit updates FitleredClassPathRunner to use a custom class loader  that ensures that any org.junit.* classes are only loaded by a single  class loader.
Remove ResourceUtils.getURL logging config check    Remove `ResourceUtils.getURL` checking from `LoggingApplicationListener`  so that logging systems can implement custom location support.    Prior to this commit, we checked in the listener if the specified config  location could be opened as a URL. This unfortunately prevents Log4J  extensions such as `log4j-spring-cloud-config-client` from implementing  configurable SSL and credentials support.    See gh-22946
Precompile current dir pattern in Handler    Closes gh-11321
Make the dependency to TransactionAutoConfiguration explicit    Closes gh-7773
Mark thread as interrupted after catching InterruptedException    Closes gh-11784
Defer background pre-init till the environment is prepared    Previously, background pre-init was started in response to the  application starting event. This meant that it would be running while  the logging turbo filter was in place and was rejecting all logging.  As a result, any logging performed during pre-init would be lost.    This commit changes background pre-init so that it is now started  in response to the application environment prepared event. By this  point, the logging turbo filter has been removed as the logging levels  have been configured from the environment.    Closes gh-21897
Activate WebSecurityEnabler only for web applications    Done in order to align with the rest of the configuration. Absent this  check, the bean will be installed in non-web applications without the  corresponding dependencies, causing the bootstrap to fail.    Closes gh-1588
Align tests for OAuth properties adapter with changes in Spring Security    Closes gh-13185
Fix a failed unit test on Windows (#1907)    * add demo    * use System.lineSeparator()    * delete my demo class
add default implementation for alibaba pacakge compatible class
Close all servers/ports after tests finish (#2755)
Add 'source' configuration to JdkCompiler
Add a debounced 5 second delay to after-command GC  Summary: GC is run after a command to return memory to the system after long running commands.  If commands are invoked in quick succession, such as for queries invoked by scripts, the full GC may affect the latency of the next command being run.  This change schedules the after-command GC to happen after 5 seconds after the last command is run. If another command is run within that interval, the GC is further pushed back.  Test Plan: Run commands in quick succession, see that gc does not trigger via VM telemetry.  Reviewed By: illicitonion  fbshipit-source-id: 43f215c
Updated gson recipe to close response body.
Corrected javadoc of the Cookie persistent() method:   - It was claiming that returns true if the cookie expires and the end of the session and really is the opposite behavior.
Change Headers.Builder to be final.
Use urlString for Request.toString()
Add a test for truncated tunnel responses    As a happy accident this was fixed by yesterday's changes to tidy up  the exchange lifecycle.    Closes: https://github.com/square/okhttp/issues/5727
Test proxy disconnecting before sending response headers    Reproduces https://github.com/square/okhttp/issues/4915
Add a test for case insensitive content type matching.
TLSv1 supports TLS extensions so they should be enabled    Follow up to:  https://github.com/square/okhttp/pull/1196.    Combined with an NPN bug (18705877) on Android this is the  reason why fallback connections started failing on Android  after the COMPATIBLE_TLS was changed to be TLSv1.    [The NPN bug means that once enabled on a socket from an  SSLContext then NPN must be configured for every subsequent  socket otherwise some of the NPN state will still be set,  but some will be missing, leading to negotiation issues].    The implication of this change is that the follow up request  after a handshake failure may now be HTTP/2 or SPDY  (or HTTP/1.1). Previous to this change they would always  have been HTTP/1.1.    Previous to pull 1196 they would also have been  HTTP/1.1 because COMPATIBLE_TLS was SSLv3.
Remove needless unchecked suppression.
Correct docs for new RetrofitError.
Document custom error body deserialization exception.    This is a less-than-ideal API but the behavior can't be changed because it's public API. We'll make error handling more robust in future versions.
Ensure a real platform is present for Android detection.
Add comment for now-deprecated Response constructor.
Handle h2 vs http/1.1 event ordering differences (#3504)    * Handle h2 vs http/1.1 event ordering differences    * remove sout    * additional test case    * dont change client, change server protocols    * refactor test
Enhance Javadocs on OkHttpClient.setSocketFactory
reopen http://code.alibabatech.com/jira/browse/DUBBO-600
[Performance tuning] improve InvokerInvocationHandler#invoke (#5403)
Removed redundant phrase from parameter name
Refactored logic out of failDueToMissingException    Refactored message decision logic out of failDueToMissingException into  its own method missingExceptionMessage.
Postpone checkSubConfig logic in ReferenceConfig (#5226)
Need to enhance DecodeableRpcResult error message (#3995)    Fixes #3994
enhance consul registry to support matching url between consumer and provider (#4818)
temporarily ignore UT ZookeeperMetadataReportTest
Ensure endpoint definition Class is an interface.
Add documentation for AndroidLog.
Observation of performance degradation when running under JDK 8 (#4381)
Formatting changes    Space between 'if' and '(', '!expression' instead of 'expression ==  false'
Split AccessFlagsTest methods to one test per method  Summary: This is making way for a test refactor that expects a single compilation per test.  Test Plan: Existing unit tests  Reviewed By: asp2insp  fbshipit-source-id: f076d84
Ignore test for read-only temp folder on Windows (#1632)
Renamed getXYZ test cases to testXYZ test cases.    Incomplete - task : Resolve sensitive equality in MethodSorter test.
add back missed logic in ConsumerModel during 3.x merge. (#5539)
Polish 'Add Spring Data Web configuration properties'    Closes gh-9339
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
Fix a regression in connection cleanup.    We don't test that connections actually get closed, and this was  broken by a refactoring that dropped close() on Connection.
Fix a concurrency bug in SPDY settings.    We were making a copy of the streams HashMap so that we could  iterate it safely after releasing our lock. But we weren't  actually using that copy when iterating. Whoops!    Fixes https://github.com/square/okhttp/issues/1119
Fix a concurrency bug in SPDY settings.    We were making a copy of the streams HashMap so that we could  iterate it safely after releasing our lock. But we weren't  actually using that copy when iterating. Whoops!    Fixes https://github.com/square/okhttp/issues/1119
check the metadataServiceExporter when exec ShutdownHookCallbacks (#5650)
use consul with group and version (#4755)    fix #4309
Remove redundant cast.
Remove redundant cast.
Update copyright header of changed files
Test proxy disconnecting before sending response headers    Reproduces https://github.com/square/okhttp/issues/4915
Bump to 4.14-SNAPSHOT
Use Timeout.millis(long) in javadoc for Timeout class    Javadoc for Timeout class should use Timeout.millis(long) instead of deprecated Timeout(int) constructor
avoids reusing Executor's Thread instances
Add test for dispatcher registration
Improve test method name.    Replace `assumeNotNullSingleNullThrowsException` by  `assumeNotNullThrowsExceptionForNullArray` because it is more clear.
Use <? super T> in Assert.assertThat    As the Matcher is only a consumer, ? super T is more appropriate.  Otherwise, a Matcher<Object> cannot be used with a String actual, for example.
Delegate to existing deserialization method.
MultipleFailureException cleanup.    1. Avoid creating a message unless getMessage() is called. Most of the time, the message is ignored; EachTestNotifier will create  individual failures for Throwable.  2. Constructor should make a copy of the passed in List  3. getFailures() should return an unmodifiable List
Removed unnecessary @SuppressWarnings
Correcting the collection used when printing out the skipped converter factories when constructing the exception message
Use allOf() instead of both() to avoid type parameter
[TEST] fix CurrentTestFailedMarker to reset its state after each test  The currently used method `testRunStarted` is only called before any tests have been run, we need to reset that state before each test, that's why we need to use `testStarted`.
Responding to review comment
Removing unnecessary public modifier.
Observation of performance degradation when running under JDK 8 (#4381)
Sort added router list before set the 'routers' field of the RouterChain (#3969)
use consul with group and version (#4755)    fix #4309
https://issues.apache.org/jira/browse/AMQ-5563  Added fix to update the documentation to reflect correct defaults.
rename access log in unit test from 'alibaba' to 'alibaba.log' so that it cannot be committed by accident. (#2051)
ignore unstable test test_normal_channel_close_wait_gracefully
rename access log in unit test from 'alibaba' to 'alibaba.log' so that it cannot be committed by accident. (#2051)
Use urlString for Request.toString()
Clarify comparison test for a change in header table size.
Remove some tests.    We don't have to test the test and failure naming for tests with  @Parameter annotation again, because it is not different from the test  that sets the parameters via constructor.
Polish 'Align TestRestTemplate Javadoc with documentation'    See gh-21318
add disclaimer and example
Close all servers/ports after tests finish (#2755)
Make auto-configured applicationTaskExecutor bean lazy    See gh-14934
Close all servers/ports after tests finish (#2755)
Remove redundant cast.
ignore unstable test test_normal_channel_close_wait_gracefully
