Test that HttpMapper properties are only used when they\xe2\x80\x99re defined    Closes gh-1923
Ensure that new JPA-based test doesn\xe2\x80\x99t accidentally enable Bitronix
Remove redundant @ConfigurationProperties annotation    See gh-7397
Update Gradle versions to check compatibility with 3.5.1, 4.0, 4.1 M1    See gh-9598
Update Gradle versions to check compatibility with 3.5.1, 4.0, 4.1 M1    See gh-9598
Stop using PostConstruct to default session timeout to ServerProperties'    Fixes gh-23716
Polish 'Use Optional value in more functional style'    Closes gh-15575
Remove useless import
Be defensive about adding autoconfig report bean
Align test with change to exception in latest Framework snapshots
Polish 'Remove a redundant dash in TestPropertyValues.Type'    Closes gh-11156
Allow tests to provide properties that modify the build.gradle script    See gh-22922
Remove start/stop integration test    This test is not useful in this context.    Closes gh-9889
Fix build after SPR-17034 in Spring Framework    Since SPR-17034, the core container now behaves a bit differently when  dealing with `null` beans.    Given a `null` `HandlerMapping` bean named 'resourceHandlerMapping':    * `context.getBean('resourceHandlerMapping', HandlerMapping.class)`  still returns a `NullBean`  * `ListableBeanFactory.getBeansOfType` will return a Map of all existing  beans, not including the `null` ones as values of the map.    Closes gh-13760
Align test with change to exception in latest Framework snapshots
Use Collection.removeIf() where possible    See gh-13871
Rename TraceWebFilterAutoConfigurationTest    Rename TraceWebFilterAutoConfigurationTest to  TraceWebFilterAutoConfigurationTests
Remove v[N/A] log output
Assign on order to OnPropertyCondition    Closes gh-7144
Avoid double-reg when a Servlet or Filter implements ServletContextInitializer    See gh-4902
Make tests' detection of SSL handshake failures more robust    Closes gh-12961
Ensure the use of UTF-8 encoding in ImageBannerTests    Closes gh-18301
Remove restartWithKeepAlive as it appears to be testing the container    The restartWithKeepAlive test really appears to be testing  functionality in the container, rather than our configuration of  the container. It's also not clear what role, if any, keep-alive is  playing as it's not explicitly configured in the test.
Remove redundant @ConfigurationProperties annotation    See gh-7397
Remove unecessary semicolon
Align test with change to exception in latest Framework snapshots
Use a random server port in the Couchbase sample\xe2\x80\x99s tests
Remove a test doing nothing    Closes gh-5673
Remove unused configuration map    Remove the configuration map defined in `GroovyTemplateProperties` which  isn't used. Ironically, that configuration map was exposed with the exact  same prefix as `GroovyMarkupConfigurer`, which broke IDEs support since  two entries had the exact same prefix.    Fixes gh-2840
Fix NullPointerException in MockUncasedHostProvider (#28424)  The MockUncasedHostProvider accesses nodes that are not fully built yet, where TransportService.getNode() returns null, which means that the null entries end up in the list of seedNodes that UnicastZenPing then uses.
make test more deterministic
API-level switch to force alwaysProxy to true  r3811
GraalCompiler: add LIR to LIRStages context.
Cache Skylark globals.  Summary: Previously all Skylark extension globals would be repeatedly setup for each individual extension file, which is wasteful, especially since some of that work is using reflection under the hood.  Reviewed By: styurin  fbshipit-source-id: 1d85b96
Issue #2451: removed excess hierarchy from NoFinalizerCheck
Enable optimized readers by default
[TEST] Enable trace logging for translog recovery
CAMEL-10271: Fixed camel-jt400 consumer to be scheduled so it reads from the queue as the jt400 library is not event based.
add an option for name as well as _name for filtering allocation
Query DSL: Allow to set boost on has_child query, closes #884.
Polish Javadoc for TestContextTransactionUtils
Use SocketWrapper provided write method
Rewrite the very slow test for join  This test took 4 minutes to run because it cross joins two tables, now it takes 1 second.
CAMEL-11862: Added unit test
checkstyle rule for inheritdoc & override annotations.
added minor debug logging
implemented getMetaData() for prepared statements (returns significant info only if the query was already executed)
InstrumentationTestLanguage:  support RootNode.getName()
AlexeiBarantsev: Run "persistent hovering" test in local environment only.  r17999
Add TikaCLI help for the -f/--fork option previously added for TIKA-416
Clarifies in Javadocs that SpannerIO currently does not support streaming.
r/m unused methods
[TEST] Add some testlogging
handle Compression.NONE in CassandraServer
[java] Deleting unused imports
Removed some code I had commented out but forgot to delete
cluster-service : fix clustered route controller auto configuration
Do not allow deletion of the snapshot if the snapshot is being copied
SimonStewart: Backing out change to the firefox driver test suite  r6128
in partition sender, release incoming vectors after partitioning
fixed "packagesToScan" to avoid additional provider scan (SPR-8936)
CAS-1076 mark as final ticketId parameter to getTicket()  Mark ticketId parameter to getTicket() as final since ticketId assignment is not and is not intended to be modified in getTicket() implementation.
remove override so it builds on 1.6 as well as 1.7 java
Enable trace logging in CCR retention lease tests  These tests are failing somewhat mysteriously, indicating that when we renew retention leaess during a restore that our retention leases that we added before starting the restore suddenly do not exist. To make sense of this, this commit enables trace logging.
Removed useless import.
Remove a redundant method declaration
change indices sig
added a method to identify a classnode as interface
Changed ip for testing refused ldap connection
Set soft closed only if needed
Migrate HazelcastJpaDependencyAutoConfigurationTests to context runner    This commit also makes sure to generate unique embedded data source and  disable datasource initialization as this is not required by those  tests.    See gh-9889
Warn in case of incomplete low-level API
Use privateGetPublicMethods() as it is simpler and more direct for this case
CAMEL-5657: Ensure recipient list eip shutdown thread pool on shutdown if instructed to do so.
fix compile for ingest plugin lambda
Another fix for NETTY-206 Unnecessary exception log on early disconnection
Remove JsonIgnore attribute
Minor refactor to structure appending methods in MapBlockBuilder
Add .buckconfig project options for workspace_and_projects and with_tests  Summary: This allows repositories to opt in to generating workspaces with projects and including tests in projects by default.  Test Plan: Edited .buckconfig to set [project] section workspace_and_projects = true and with_tests = true. Ran 'buck project', confirmed Xcode workspaces including tests were generated.  Repeated removing config entries, confirmed Xcode workspaces including tests were not generated.
use short-circuiting ops
call getBody(CxfPayload.class) to trigger converter on the response message body
Use new API for create node
log the selections
Command to refresh a Mercurial sparse profile  Summary: Needed when we add sparse profile generation in a later diff.  Test Plan: CI  Reviewed By: ryanmce  fbshipit-source-id: f4f7422
Fix GLFrameBuffer  Allows graphic card which supports GL_EXT_packed_depth_stencil to pack depth and stencil.
Add a test for graph consistency; begin implementing interface for entity linking
CAMEL-6555 Removed the useless option setting
Use APPEND_TO_ZIP instead of OVERWRITE_EXISTING for buck rage reports  Summary: OVERWRITE_EXISTING is inefficient and we should avoid that mode. This diff makes it one step closer to killing it completely. Furthermore, when we bundle files to a buck rage report, we should not overwrite the entries. That would give us incorrect perception of the actual directory state. Instead we should use APPEND_TO_ZIP to get all entries, or THROW_EXCEPTION if we are sure there are no duplicated entries.  Unfortunately, due to how `DefaultDefectReporter.addFilesToArchive` works, we can get duplicate entries even if all the paths are unique because we are stripping off the `.` of hidden files. So the files `.blah` and `blah` would both end up with the same entry name. Another possible collision is if `report.json` is in the list of files to zip as we create an entry with such name from an in-memory structure and not from an actual file. If such unlikely pathological scenario happens, it is better to have both files in the report than only the last one.  Test Plan: buck rage https://our.intern.facebook.com/intern/buck/rage/524538301084026  Reviewed By: marcinkosiba  fbshipit-source-id: c8be1c6
Distributed build slaves now use environment from CommandRunnerParams  Summary: This will ensure that any sub processes spawned by Buck use the correct environment, e.g. now correctly being able to find tools from PATH.  Test Plan: ci  Reviewed By: shivanker  fbshipit-source-id: 7eaf5c8
Add io.netty.noJdkZlibEncoder system property  Related issue: #2821  Motivation:  There's no way for a user to change the default ZlibEncoder implementation.  It is already possible to change the default ZlibDecoder implementation.  Modification:  Add a new system property 'io.netty.noJdkZlibEncoder'.  Result:  A user can disable JDK ZlibEncoder, just like he or she can disable JDK ZlibDecoder.
Update for Gump now these are known Ciphers
- Compatibility with Eclipse 3.2 (sort of, the flag doesn't mean the same thing, with the new one   doing some new unknown stuff).
Add contacts field to apple_binary  Summary: This diff adds support for the "contacts" field on the apple_binary() rule.  Reviewed By: dinhviethoa  fbshipit-source-id: 279a797890
Logging the entire query string; crucial bit of logging   r3571
KAFKA-2813; selector doesn't close socket connection on non-IOExceptions  Patched Selector.poll() to close the connection on any exception.  Author: Jun Rao <junrao@gmail.com>  Reviewers: Guozhang Wang <wangguoz@gmail.com>, Gwen Shapira <cshapi@gmail.com>  Closes #501 from junrao/KAFKA-2813
bug 10422: accidentally removed the code for sourceTemplate id when the the volume is created out of template. Checking it in. status 10422: resolved fixed
Pull up EtlBaseTest.getResult()
beef up Javadoc
Add NotSerializable.forUrn to key by URN for non-serializable overrides
Remove unused log variable
revert D13710118  Summary: The fix to https://github.com/facebook/buck/issues/2141 broke one target.  Reviewed By: styurin  fbshipit-source-id: d274a4629f
removed duplicated comment
optimized imports on test
Mute the 'arc focus' nudge when generating a Project View  Test Plan: `buck test //test/com/facebook/buck/ide/intellij/projectview && buck test //test/com/facebook/buck/ide/intellij`  fbshipit-source-id: c55e36e
Add a small bit of documentation
Fix PageBuilder use in benchmark binary file spiller  `PageBuilder` needs to be `reset()` between building pages.
Don't clear down thread counts at end of test
Remove deprecated code
Replace getRuleOptionalWithType..addToIndex with computeIfAbsent in CxxInferEnhancer  Summary: This fixes potentiall race conditions when constructing action graph in parallel.  Also inlined some now trivial functions.  Test Plan: CI  fbshipit-source-id: c52ea80
Add a random date within a specific date range function : Fix checkstyle File does not end with a newline
Fix a typo in Aggregator java doc  ----Release Notes---- [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=96227688
Add @Deprecated to Collection.min()
Adapt timeouts in UpdateMappingIntegrationIT  Relates to #37263 and possibly #36916
Finally fixed the FileUtilTest, I have to test it on Windows
CAMEL-13292 - Lets return the full S3Object
Added the missing period
[scene2d.ui] Tree, update over node without needing to move the mouse.
minor: fixed missing coverage in SeverityMatchFilter
Replace WindowAssignment OldDoFn by FlatMap in Flink Runner  The streaming runner had an OldDoFn that was used for assigning windows using a WindowFn. This is now done with a FlatMap.
Remove unnecessary code. There is no matching attribute on any ProtocolHandler implementation.
Forgot clearGui() for this element
GROOVY-1746: add missing @since
Improved logging in utility class ExecutionStateTransition
Summary: KVM - undefine persistent VMs on stop  Detail: A previous patch fixed an issue where we are defining VMs to persist locally on KVM hosts, which can cause issues if the agent isn't running and libvirt decides to start the VM unbeknownst to cloudstack. The previous patch stopped defining VMs as persistent. This patch adds compatibility for existing cloudstack environments, removing the persistent definition on stop if needed.  BUG-ID: CLOUDSTACK-600 Signed-off-by: Marcus Sorensen <marcus@betterservers.com> 1363194656 -0600
set shared variables with configured ObjectWrapper (SPR-7165)
Set LowResourcesMaxIdleTime in Grid to avoid timeout of 'forever'. Fixes issue 6770.
fixed test case to close down the connection in between test cases to avoid duplicate clientID exceptions
CLOUDSTACK-2923: Delete Secondary storage of a Zone was giving NPE bcz we were still refering to the object. Instead log that the cpvm and ssvm cant be created bcz sec storage is not available
Initialize STGroupFile with url, not file path  - absolute file paths not reliable way to find resources on classpath - requires changes to ST4 in this PR: https://github.com/antlr/stringtemplate4/pull/199
#NAME?
Added buck project generation subscribers  Summary: Subscribed external events to project generation start and finish.  Test Plan: Checked if the events are being caught by the WebServerBuckEventListener  Reviewed By: beefon  fb-gh-sync-id: 4134d2e shipit-source-id: 4134d2e
GraphPrintVisitor implementation can now be disabled via system property
additional fix for VMTransportWaitForTest test failure
Add missing text to CachingResourceTransformer Javadoc
Remove missWithTargetGraphHashMatch from ActionGraphEvent  Summary: dead  Reviewed By: styurin  fbshipit-source-id: fb459921a7
Fix test broken by update to encoding. Generally, it is far too difficult to re-encode characters that were encoded in the original URKL when they didn't need to be.
Make testShiftTimestampInvalid NeedsRunner instead of ROS  Currently broken in Apex.
Clarify StatementTag semantics  Elaborate the intuition required for tagging nodes and give an example for the debugger.  Signed-off-by: Stefan Marr <git@stefan-marr.de>
2.x: Expand the documentation of the Flowable.lift() operator (#5863)
TextIOTest: shrink size of test data  We have assertions that the files are still big enough, so this is safe. Speeds up TextIOTest 2x.
Prevent forced splits if they are proven deep recursions.
Increase akka parallelism level
KAFKA-6731: waitOnState should check the state to be the target start. (#4808)  KafkaStreams.waitOnState() should check the state to be the given one instead of the hard-coded `NOT_RUNNING`.  Reviewers: Guozhang Wang <wangguoz@gmail.com>
Limited query on users and roles to retrieve only the first. This will speedup performance on large user basis
it's not possible in new groovy to get a method closure from a property. See MetaClass:621
set correct info message
Minor: server, convert db directory path in unix way
GROOVY-1943 gives Reflector loader two modes in which the Reflector class is resolved different. During class definition the Reflector class is resolved to the current runtime Reflector. If not during class definition Reflector might resolve to a different class, for example if a parent loader knows an additional Groovy runtime.
java: hashCode must supplement equals
Categorize RejectedExecutionException in StateMachine
Return null when output is empty in HashAggregationOperator
First pass at updating unmapped list for IBM
Simplify code; Junits
Register EPollArrayWrapper to re-run class initialization.
De-@Betaify Optional. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=30422058
additional javadoc enhancements for lift & compose
Remove dead (and buggy: removes only half the files) code
Increase error margin based on Gump timing related failures
Add some tests for annotation values of type Class  Summary: (Reapplying this commit after the stack was reverted; this commit was not related to the failure.)  `StubJar` is going to be gaining the ability to generate stub jars based on `TypeElement`s.  This commit closes some test holes. No bugs found, but good to have the coverage.  Test Plan: New unit tests  Reviewed By: asp2insp  fbshipit-source-id: 4638e1d
Add the 6.7.0 constant to the master branch  Now that the 6.x branch has been bumped to the 6.7.0 version, this commit adds knowledge of the 6.7.0 version to the master branch.
Use Publishers.zip instead of Streams.zip
Tell user if cannot load test plan
Remove the callAllGets 'feature' of CombinedFuture.  This should only be necessary for buggy future implementation  This is a rollfoward. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=65725521
Optimize map_concat to skip empty map  Performance before: Benchmark                     (mapConfig)  Mode  Cnt     Score     Error  Units BenchmarkMapConcat.mapConcat   left_empty  avgt   20  1838.641 Â± 145.909  ns/op BenchmarkMapConcat.mapConcat  right_empty  avgt   20  1515.713 Â±  96.888  ns/op BenchmarkMapConcat.mapConcat   both_empty  avgt   20   615.368 Â±  57.051  ns/op BenchmarkMapConcat.mapConcat    non_empty  avgt   20  2753.727 Â± 503.407  ns/op  Performance After: Benchmark                     (mapConfig)  Mode  Cnt     Score     Error  Units BenchmarkMapConcat.mapConcat   left_empty  avgt   20   392.266 Â±  38.556  ns/op BenchmarkMapConcat.mapConcat  right_empty  avgt   20   376.552 Â±  32.928  ns/op BenchmarkMapConcat.mapConcat   both_empty  avgt   20    55.276 Â±   7.683  ns/op BenchmarkMapConcat.mapConcat    non_empty  avgt   20  3043.951 Â± 553.951  ns/op
CID-1257434 try with resource
Fix in the bytecode parser: Do not overwrite the stateAfter of the start instruction.
Remove event scope from RawTargetNodeToTargetNodeParsePipeline  Summary: Parent class (`ConvertingPipeline`) does that already.  Reviewed By: sbalabanov  fbshipit-source-id: 3899296582
User suggested patch for MorphaAnnotator
RecoveryIT.testRecoveryWithConcurrentIndexing should check for 110 docs in an upgraded cluster  Closes #27650
Added Set-Cookie2 to HttpHeaders.Names
MichaelTamm: Improved Javadoc and parameter names in WebDriver.TargetLocator  r9128
Clean up warnings in Gradle build output
FrancoisReynaud: cleanup wrong import creating compilation error  r12000
Part of fix for https://issues.apache.org/bugzilla/show_bug.cgi?id=48694 that is not in trunk
Don't create ABIs from source if postprocessing classes  Summary: A postprocessing step might modify the class files, rendering a source-based ABI incorrect.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: a7a774f
Prefer discardSomeReadBytes()
listPortForwardingRules: fix typo in doc  Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>  This closes #248  (cherry picked from commit e8f8e0e3f23732559a2664b3b9573be8ef76f479) Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>
Differentiate between the top and non-top FrameState bci when computing BytecodePositionWithId.
Fix a mistake (I think, Philippe confirm this?)
ApiSurfaceTest: whitelist com.google.auth package  This is a new package that contains user credentials for GCP, and will ultimately need to be exposed as part of our API surface,  ----Release Notes---- [] ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=113973842
Add sanity checks
More Javadoc in ChannelPipeline
Add @Deprecated to Collection.min()
CLOUDSTACK-8951: validation for "remote.access.vpn.psk.length"  throwing error for value < 8 and value > 256 right now, 8, 256 are hardcoded in the code. They should be moved to a constant and has to be reused everywhere.
Improves adding tokens to collection
No need for this empty tearDown method, so remove it.
https://issues.apache.org/jira/browse/AMQ-3887 - have local dispatch do safe wait till remove broker setup is complete such that producer is fully created
removing '-debug' command line parameter for grid hub, it isn't used anywhere.  adding fine tuned logging should be done via java logging mechanisms.
Remove unused code from FunctionListBuilder
Add missing transferToInterpreterAndInvalidate
improve failover transport failure message to include client port, which makes will make it easier to debug things in multi-connection clients
better exception message when failing to parse a specific field
remove the listnetwork, which causes mgt server uses 100% cpu, if you have 600 records in networks table
Fix collector's class name on response output
JTTTest: add optional 'bind' and 'noProfile' parameters
Make timer run as daemon  so it doesn't prevent normal shutdown by exiting from main().
test: RelocationTests.testCancellationCleansTempFiles may fail due to io errors while check temp files are deleted  Windows can throw NoSuchFileException when using File.walkFileTree and deleting files concurrently. This commit changes IO exceptions into assertion error so that assertBusy will wait for them as well.
The default shell port and name are public static constants so that they may be reached outside EmbeddedNeo
No need for stack trace; report number of retries
Adjust NativeImage argument processing to shared library handling changes
Further fix for BZ 57172 - followup to r1640087 (r1640084 in trunk). Be consistent with "webappClassLoader.stopped" message handling and throw an ISE from findResourceInternal  In all call chains (findClass() / findResource() public methods) there is a checkStateForResourceLoading()/checkStateForClassLoading() check at the start of that public method, so it is unlikely to hit an ISE here unless there is some kind of race.  Throwing an ISE is a more consistent behaviour, and calling a common method is better than a custom rarely used if() block.
Review of r1457429: Make logic more clear. No functional change.
Increase socket timeout in an effort to reduce false failures on buildbot
Return null when output is empty in HashAggregationOperator
Do not allow zip_file to have deps  Summary: Nothing is actually using `deps`, there is no reason to have it.  Reviewed By: mykola-semko  shipit-source-id: e660e7aad6
Remove invalid auto-generated import.
it can take more than 30 seconds for network of 20 to get in line on a slower box, so incease the default delay
Make RegexLanguage public so its options are exposed by launchers
Fixed issue on deletion of null records
Allow for null URL
ugh...remove println statement from AppleSingleFileParser
remove the listnetwork, which causes mgt server uses 100% cpu, if you have 600 records in networks table
Remove spaces.
[Minor] Use non-deprecated JUnit API  Signed-off-by: Gregor Zurowski <gregor@zurowski.org>
Standalone runner expects path.home to be set  With elasticsearch 2.0, `path.home` must be set now. Standalone Runner (test) is using elasticsearch CLI which relies on `Environment` to be set.  It produces now:  ``` Exception in thread "main" java.lang.IllegalStateException: path.home is not configured     at org.elasticsearch.env.Environment.<init>(Environment.java:99)     at org.elasticsearch.node.internal.InternalSettingsPreparer.prepareEnvironment(InternalSettingsPreparer.java:85)     at org.elasticsearch.common.cli.CliTool.<init>(CliTool.java:107)     at org.elasticsearch.common.cli.CliTool.<init>(CliTool.java:100)     at org.elasticsearch.index.mapper.attachment.test.standalone.StandaloneRunner.<init>(StandaloneRunner.java:170)     at org.elasticsearch.index.mapper.attachment.test.standalone.StandaloneRunner.main(StandaloneRunner.java:175)     at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)     at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57)     at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)     at java.lang.reflect.Method.invoke(Method.java:606)     at com.intellij.rt.execution.application.AppMain.main(AppMain.java:140) ```  Closes #167.
Switch buck project default to not build targets unless --build is defined  Summary: Building all modules when doing buck proejct is not a good decision in retrospect. If one wants to see generated code, they are better off building the modules they need and not waiting for all of them in the wrong moment. The solution is just flipping the default, and requiring someone to add `--build` when they want this. I kept the original flag to now break people's commands in the meantime.  Test Plan: Run `buck project <target>` with and without --build, see that nothing is built without `--build` mentioned.  fbshipit-source-id: a9fe298
CAMEL-9965: Add javadoc about streaming problem
CAMEL-3074: Added dynamicRouter to the DSL.
[WW-4737] preserve nulls instead of converting them to the string 'null'  - Also simplify if-else logic to be more readable and avoid double-negatives
added a fix for CAMEL-85 to avoid using deprecated code
Tests and procedures for manual index - minor style fix
Add unit test for conditional elimination of IntegerTestNode.
making the journal broker aware so that it can pass on the broker service config to the long term persistence adapter if it is also broker aware.
CAMEL-8856: Add Eviction Map Consumer Test
Give a little extra time for the Stomp frames to take effect.
Keep metaclass changes in built script instances
Still trying to find why Gump runs so few tests
Ensure all reasons for stopping the test are logged
Removed reference to closed resources to speedup garbage collection on memory mapped files. This should fix, in part, a bug on close and delete database.
add @Override annotation
CLOUDSTACK-8911: VM start job got stuck in loop looking for suitable host
added a little toString() method
Remove unused import
make sure that the task runner is the first thing setup since other startup bits might want to do an async send.
SimonStewart: Make the IE driver consistent with the chrome and firefox drivers  r10506
SPDY: check if spdyHeadersFrame is null before adding it to out
Make logging for NPE in removeUnfinishedCompactionLeftovers more useful  Patch by jmckenzie; reviewed by ayeschenko for CASSANDRA-8544
Increase size of response that is written and reduce data read before client drops the connection in an attempt to get this test passing with APR in Gump. Currently the entire reponse is written (and buffered somewhere in the network stack) before the client drops the connection.
[hotfix] Reduce string concatenations in ExecutionVertex
bug 9891: update network_id for ExternalFirewall and ExternalLoadBalancer device_types status 9891: resolved fixed
[hotfix][runtime] Delete unused method DispatcherResourceManagerComponent#getTerminationFuture
Close rawTargetNodePipeline in PerBuildStateFactoryWithConfigurableAttributes  Summary: This needs to be closed.  Reviewed By: sbalabanov  fbshipit-source-id: 146c4ab767
CAMEL-5746 add copy method to WireTapDefinition to let user choice if copying or not copying the origin exchange
Remove unused variables  After the following commit a few variables became unused, delete them: "Use SubqueryPlanner in RelationPlanner"
reuse a shared UrlPathHelper instance in order to avoid reinstantiation overhead (SPR-7269)
Fix javadoc to correctly explain how ChannelDuplexHandler.deregister(...) works. (#8577)  Motivation:  We had an error in the javadoc which was most likely caused by copy and paste.  Modifications:  Fix javadoc.  Result:  Correct javadoc.
Removed unused imports
Unused import removed
more scan tests to try and recreate the context missing failure, no luck yet...
The withMimeType method is obsolete. Use the Builder's mimeType one.
Suppress deprecation warnings in AnnotationProcessorPerformanceTests
bug 13781: reload host detail after host reconnect status 13781: resolved fixed Reviewed-by: frank
Add missing compilation final dimension to successor array in LLVMTerminatorNode
Fixed the issue of takeLast(items, 0)
CLOUDSTACK-7348 InvalidParameter Exception while executing scale vm.  We do not throw the exceptions any more, so added info in the logs to say what happend to this command.  Signed-off-by: Rajani Karuturi <rajanikaruturi@gmail.com>
Remove unused code
Align implementation with docs. nonceCacheSize should be configurable
Corrected package and some imports in CppTarget.java.
DouniaBerrada: Adding contructor for custom WebView and custom focus listener.  r15510
Removed parameter validation in constructor. Now being handled in doStart()
update dcoref test for fixed ssplit
AwaitsFix GeoShapeQueryTests#testPointsOnly #27454
Added active flag.
Add filePath to HiveWriter.toString
make RC.results a ConcurrentMap to emphasize that remove-while-iterating is OK
Refine GPathResult's equals and hashCode
Remove unnecessary casts and comment that does not make sense
Mark IP range aggregator test as awaits fix  This test reliably fails with the seed 4AC319F8A6B0329B.
Remove unnecessary check for boolean  `musics.get(i).wasPlaying` is a boolean value, no need to use `== true` to check it.
Expose plugin name in a public constant  closes elastic/elasticsearch#27  Original commit: elastic/x-pack-elasticsearch@3410ca2e3d87463295f88a5718a0a2f5cb55ec8c
include offset when logging about committing offsets
Simplify. Re-name method that no longer actually initializes any ciphers.
Mute MlDistributedFailureIT#testFullClusterRestart()  Relates elastic/elasticsearch#25415  Original commit: elastic/x-pack-elasticsearch@01fa0e76014d0c1281370521d09db82238129c7e
doc: fix documentation for METHOD_REF token
fixed NPE  (cherry picked from commit c78f14cbc2fd45fc587f4a238c0a0bfc1d753be8) Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>
Added clocks as a dependency to the NeoServerWithEmbeddedWebServer
Remove an unnecessary empty line
Get QueryInfo only once when checking abandoned queries  QueryInfo is not free to get.
Return null when output is empty in HashAggregationOperator
Default azure container should be `elasticsearch-snapshots`  This bug has been introduced in 5.0 when we refactored settings
Remove SourcePathResolver.deprecatedGetPath from c.f.b.android  Summary: Replace relative paths with absolute paths.  Test Plan: CI  Reviewed By: Coneko  fb-gh-sync-id: 2b0a38a
Speed up rejected execution contains node name test  This commit addresses slowness in the test that a rejected execution contains the node name. The slowness came from setting the count on a countdown latch too high (two in the case of the search thread pool) where there would never be a second countdown on the latch. This means that when then test node is shutting down, closing the node would have to wait a full ten seconds before forcefully terminating the thread pool. This commit fixes the issue so that the node can close immediately, shaving ten seconds off the run time of the test.  Relates #27663
Pair debug.handle calls with scope creations
Very minor fix in error handling path for the -o command line option.  If the specified output path was a file and not a directory, the error handling intended to invalidate outputDirectory, but due to an apparent copy-paste error, it invalidated libDirectory instead.
Improved warning if no properties found
SAML SLO: get metadata for requesting service only (#3058)  bug that this patch is fixing: when verifying the signature of an incoming SAML SLO request, SAML metadata for all services had to be resolved. In case another service's metadata file was unavailable at logout time, this caused an exception screen to be returned to the user and no logout to happen. Now, only the requesting service's metadata is required to validate the signature.
TIKA-89: Rename MimeType and MimeTypes  Keep media type parameters in an unmodifiable sorted map.
Fix javadoc tag. (#41329)  s/returns/return/
Remove parameters on HandshakeResponseHandler (#27444)  This is a followup to #27407. That commit removed the channel type parameter from TcpTransport. This commit removes the parameter from the handshake response handler.
Remove unused getProgress method from OrcRecordReader
Helpful to preserve the arguments used for building the parser
GROOVY-1943 gives Reflector loader two modes in which the Reflector class is resolved different. During class definition the Reflector class is resolved to the current runtime Reflector. If not during class definition Reflector might resolve to a different class, for example if a parent loader knows an additional Groovy runtime.
Make `AbstractCapabilities` implement `toJson`  The capabilities subclasses were the only thing using `asMap` for serialisation to JSON. Everywhere else, we use `toJson`. Might as well make it consistent.
Fix javadoc to correctly explain how ChannelDuplexHandler.deregister(...) works. (#8577)  Motivation:  We had an error in the javadoc which was most likely caused by copy and paste.  Modifications:  Fix javadoc.  Result:  Correct javadoc.
add debug logging of sorted replicas patch by jbellis
Changed ip for testing refused ldap connection
Make MasterClient connection errors be logged as debug instead of info  They are rather low-level, benign, and have little context attached. They sound scary, but people should really not worry about them.
Change HashCode from 32-bit to 8-bit minimum in docs. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=39493754
Remove unused imports
compress cluster state when publishing it
Increase the test timeout for PageCacheTest#rewindâ¦
Add missing header in RetryTests
DouniaBerrada: Updating R.java in android.  r13595
Fixed CS for camel-script
SimonStewart: Preparing to remove the 'isJavascriptEnabled' method.  r11967
[hotfix] Improve ParameterTool exception  This closes #2057
fix test case after changes in https://issues.apache.org/jira/browse/AMQ-4237 broker the tests queue MBean lookup
added AbstractClassAndInterfaceTest to the suit
Add license header to Maps
Add multicast plugin to plugin manager official list of plugins  See #13027
Add cxx output path validator in CxxPreprocessAndCompile  Reviewed By: aiked  fbshipit-source-id: aa33b6d71c
Remove unused import
Fix error messages in `Parser` to use unix-style paths  Summary: This adds consistency in how we talk about paths.  Test Plan: `ant test -D"test.class"="ParserTest"` now passes on Windows
[BEAM-1991] Sum.SumDoubleFn => Sum.ofDoubles  This is left over from commit 78a360eac35507d9a558fc6117bb56b67b8a884e   - [x] Make sure the PR title is formatted like:    `[BEAM-<Jira issue #>] Description of pull request`  - [x] Make sure tests pass via `mvn clean verify`. (Even better, enable        Travis-CI on your fork and ensure the whole test matrix passes).  - [x] Replace `<Jira issue #>` in the title with the actual Jira issue        number, if there is one.  - [ ] If this contribution is large, please file an Apache        [Individual Contributor License Agreement](https://www.apache.org/licenses/icla.pdf).
Move RestGetSettingsAction to RestToXContentListener (#31101)
add release of the session lock in case of network failure on request reading
Add version 6.0.0-beta2 after release
Make the file consumer a bit quieter
Mute ShrinkIndexIT  This is tracked at https://issues.apache.org/jira/browse/LUCENE-8318
Fix --filter documentation  Summary: You used to be able to list filters multiple times with the filter option:    $ buck test --filter a b c  That changed in {D1196948}, so now you have to do this instead:    $ buck test --filter a -filter b --filter c  This diff updates the help test to reflect that change.  Test Plan: Run `buck test --help`.
bug 13023: fixed listAccounts to return all accounts the user is authorized to see status 13023: resolved fixed
Extend CanonicalizeExpressions optimizer to rewrite filter in Join
Index in tx: Fixed issue 468 about deletion
beef up Javadoc
Implement toString for hll
Removed useless import
add toString to match_all docs
Add utility method to get the latest version of the previous minor
Export waiting time counters
SimonStewart: Putting back the exceptions thrown on setup  r13147
[removed] Unnecessary synchronize blocks in touch handlers.
hashCode takes into consideration the index as well
Removed unused imports
Small PlanFragmenter refactorings
some more refactoring
Remove unused code
[#2234] Use QueryStringDecoder.decodeComponent to decode url-encoded data instead of Java's URLDecoder.  Motivation: Previously, we used URLDecoder.decode(...) to decode url-encoded data. This generates a lot of garbage and takes a considerable amount of time.  Modifications: Replace URLDecoder.decode(...) with QueryStringDecoder.decodeComponent(...)  Result: Less garbage to GC and faster decode processing.
add "same" thread pool type (really, just for testing)
Issue #2912. Cleared cache after graph instance is returned to the pool.
fix the issue netty#2944 in 4.1  Motivation:  fix the issue netty#2944  Modifications:  use - instead of =>, use ! instead of :> due to the connection is bidirectional. What's more, toString() method don't know the direction or there is no need to know the direction when only log channel information. add Lï¼ before local address and R: before remote address.  Result:  after the fix, log won't confuse the user
Added test case for property MAX
Clarify the format supported by @PropertySource  Issue: SPR-16563
WW-2651 FileUploadInterceptor.java javadoc is not formatted correctly for Confluence snippets  Thanks to Matthieu Chase Heimer for the patch
Add unit test for loopsSimulateTailRecursion
Compilation on Java 8.
Remove unused import
get rid of Java 1.5 warning  r2519
removed Commons Collection reference from javadoc (SPR-6716)
[CALCITE-1420] Allow Calcite JDBC Driver minor version to be greater than 9
set the rejoinNeeded in listener's onSuccess
[hotfix][tests] Make SynchronousCheckpointTest create StreamTask instance in the main task's thread
Summary: KVM - undefine persistent VMs on stop  Detail: A previous patch fixed an issue where we are defining VMs to persist locally on KVM hosts, which can cause issues if the agent isn't running and libvirt decides to start the VM unbeknownst to cloudstack. The previous patch stopped defining VMs as persistent. This patch adds compatibility for existing cloudstack environments, removing the persistent definition on stop if needed.  BUG-ID: CLOUDSTACK-600 Signed-off-by: Marcus Sorensen <marcus@betterservers.com> 1363194656 -0600
Use static field instead of new array
Wrong null check
added BigObject to NewInstanceTest
Issue #2604: Refactoring of SingleLineJavadoc to resolve LocalVariableName violation
Camel-AWS Lambda - Use Regions.valueOf in the verifier
Remove warn messages: now are as debug messages
Removed useless import.
Minor: server, convert db directory path in unix way
minor improvement in object creation
Remove invalid auto-generated import.
Fix exception handling in parallel queries
Add javadocs to ProcessUtil
improved report for failing tests
Simplify implementation of Commector.setProtocol() - swap outer and inner if() - consistent handling of null value
Remove build description from ConfigSettingDescription  Summary: No longer needed.  Reviewed By: ttsugriy  fbshipit-source-id: a6620d297b
Recommend I18N version
Log the unsanitized redirect URL to facilitate abuse investigations.
Update SDK to correctly set replaceJobId on the Job.  ----Release Notes---- Update SDK to correctly set replaceJobId on the Job instead of the Create request.  [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=99302893
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=54203 Complete Part javadoc. Content copied from Commons FileUpload with minor changes as necessary.
Register all the installed file system providers at image build time.
HHH-3892 : restore original author
[hotfix] Correct preconditions check in TypeExtractor#getBinaryOperatorReturnType
Replaced the ThreadLocal<LocalCompilation> with a map.
limit logging in OutOfProcessIsolatedBuilder.java  Reviewed By: cjhopman  fbshipit-source-id: 2ec1a6eb03
WW-2800 Added setters for response, request and context.
use stream instead of iterator to simplify logic a bit
temp added ignore on 2 new failing tests until time to investigate
Do no call Reference.get() because subclasses can overwrite it
Implement toString for hll
Added missing license header.
CAS-1422 SamlUtils Should Restrict DocType Declaration and Entities via Feature Disabling
Update FPSLogger to use nanoTime.   "currentTimeMillsis" pulls time from the system clock and should not be used to measure elapsed time. Other processes like NTP, or the user, can alter the system clock and the time returned can unexpectedly shift and create bizarre and intermittent behavior.  "nanoTime" is a measure of nanoseconds from some arbitrary time point and is safe for measuring elapsed time.  The results of this bug are rather benign â worst case the time is changed back and you would not get a framerate log message for that time, or until the user restarts the program. However, this flavor of bug can cause significant intermittent issues if present in other areas if the user is unfortunate enough to have his clock changed while he is playing (this happens more than you may think thanks to NTP keeping our system clocks in sync.)  See:  http://docs.oracle.com/javase/7/docs/api/java/lang/System.html#nanoTime%28%29 http://docs.oracle.com/javase/7/docs/api/java/lang/System.html#currentTimeMillis%28%29
log full exception in InternalClusterInfoService unless it's a ClusterBlockException
Make field STANDARD_ESCAPES final
Revert "[TEST] Enable trace logging for translog recovery"  This reverts commit 52d53e658f786d1e0717c3f63676de00426599cb.
Revert rev 1430160 as then camel-manual cannot build.
DouniaBerrada: Ignoring failing tests for Android, uncovered by r13838  r14030
Extend CanonicalizeExpressions optimizer to rewrite filter in Join
Remove running split info before completing its finishedFuture  ListenableFuture::get is listening on the finish of split. If a running split info is removed after it has been set to finished, There may still have remaining running split info alive. This can fail the unit test due to race.
guard against npe on error condition
added minor debug logging
[hotfix] Suppress restarts if rescaling operation fails
Add toString method to HttpRequest
Made "error" and "warning" be lowercase. For some reason, it always bothered me :-)
SimonStewart: Putting back the exceptions thrown on setup  r13147
Fix usage of @type:"d" in JSON from queries to determine embedded element type
[TEST] Turn off double write check for restore
add iterator based on specific index
Changed log level to info as per https://trello.com/card/change-not-found-in-initial-hosts-warning-to-info-level/4f79f66e49be84e04103ba36/518
add toString to match_all docs
Make private vars final
javadoc: diagrams for onBackpressureBlock (would benefit from a review)
Avoid using deprecated methods in StringEncoder
option annotation processor ensures that a non-empty help message starts with a capital letter
When closing the stream for the host's web.xml if an exception occur then hostTimeStamp must be set to -1 and not the globalTimeStamp. Issue reported by Coverity Scan.
Count full context transitions in statistics
Distributed tests: writerCount is configurable now
Add queries that fail before starting to expiration queue  This was a bug introduced in https://github.com/facebook/presto/pull/1917
Remove Extra Synchronization  The use of flatMap/mergeMap already synchronizes.
Add missing license header to o.e.m.Probes
removed a usage of ResolvedJavaType.toJava()
Issue #7723 LongAdder was replaced by AtomicLong
Removed an unused import
coverity 1315775: proper getting of networkLabel
resolved conflicts after merge with develop
Deprecate unused methods  I doubt these methods will ever be useful, so deprecate them before possible removal.
Camel-Exec: Use BindToRegistry where possible
Fixed space width when the font reports zero and has padding.  Sometimes the simple things are the trickiest. closes #3455
fix possible problem when trying to convert a binary format to a string
Fixed Coverity Issue: Unintentional Integer FLow
Parallel native index population enabled by default
Disable testRewriteAssumption.
CAMEL-4576: throwException EIP now allows to create new exception instance with message with details from exchange using simple language.
Make it simpler to determine which version of state was used to calculate health
Added test logging
Add a debug output method to the srparser
Fixed origin merge cleanup error.
Remove duplicate code which is invoked twice (#5039)  Reviewers: Ismael Juma <ismael@juma.me.uk>, Guozhang Wang <wangguoz@gmail.com>
DanielWagnerHall: Disable Android tests until android support lands  r13384
Breaks the loop
CAMEL-5657: Ensure recipient list eip shutdown thread pool on shutdown if instructed to do so.
GROOVY-4505: Rogue line number for try/catch statement confuses IDE debuggers (merge rev 21143)
KAFKA-6999: Add description on read-write lock vulnerability of ReadOnlyKeyValueStore (#5351)  Reviewers: Guozhang Wang <wangguoz@gmail.com>
Add the setters to the servlet getters in the category.
Optimize map_concat to skip empty map  Performance before: Benchmark                     (mapConfig)  Mode  Cnt     Score     Error  Units BenchmarkMapConcat.mapConcat   left_empty  avgt   20  1838.641 Â± 145.909  ns/op BenchmarkMapConcat.mapConcat  right_empty  avgt   20  1515.713 Â±  96.888  ns/op BenchmarkMapConcat.mapConcat   both_empty  avgt   20   615.368 Â±  57.051  ns/op BenchmarkMapConcat.mapConcat    non_empty  avgt   20  2753.727 Â± 503.407  ns/op  Performance After: Benchmark                     (mapConfig)  Mode  Cnt     Score     Error  Units BenchmarkMapConcat.mapConcat   left_empty  avgt   20   392.266 Â±  38.556  ns/op BenchmarkMapConcat.mapConcat  right_empty  avgt   20   376.552 Â±  32.928  ns/op BenchmarkMapConcat.mapConcat   both_empty  avgt   20    55.276 Â±   7.683  ns/op BenchmarkMapConcat.mapConcat    non_empty  avgt   20  3043.951 Â± 553.951  ns/op
Deprecates the old extension point and defines a new one
Throttling: Convert int parameter to double before calculating thresholdRate (#3407)
Prefer direct buffer by default  - Because it's faster in most cases thanks to unsafe
WW-3492 uses getter instead direct field access
WW-3189 add a way to clear FreeMarker templates
Make clean compactions cleanup the row cache patch by slebresne; reviewed by jbellis for CASSANDRA-2451
Wrong pointer - those tables were moved to ChannelEvent
TIKA-247: parse language and category from MS Office properties  Patch contributed by Daan de Wit.
Verify that control flow graph is valid after partial evaluation  Otherwise the error will be reported later in the compilation pipeline, which is confusing.
Needs to be volatile as it is used in double checked locking
Fixed a test which failed if REL_GRAB_SIZE was set to 1... the test wasn't written properly
Make implicit null check conversion more conservative.
Clean up confusing error message on unhandled endpoint  It currently returns something like:  ``` "No feature for name [_siohgjoidfhjfihfg]" ```  Which is not the most understandable message, this changes it to be a little more readable.  Resolves #10946
Fix excessive concurrency when running tests with buck internal test runner  Summary: I inadvertently increased concurrency of tests run with buck internal test runner.  It used to be limited by virtual cpu resoures (num processors), but my changes caused it to be no longer resource aware, and it was running with the concurrency equal to number of threads in the pool instead. This is usually higher than num processors. This contributes to test flakiness.  A more comprehensive fix will come in the future.  Test Plan: visualscrutiny  fbshipit-source-id: cea07c4
Procedure compiler version and disable test output
painless: Add Jack's test
HHH-4881: Use Loadable.getDiscriminatorValue() for nullSafeSet
Remove jobs from on demand job scheduler by default.
[Grid] Removing unused import.
Revert "Exploit DiscoveryNode immutability..."  This reverts commit e76038e076bb66fd4deac62cd8f2ffd9d423cea6.
Add logging of when a member is unable to join the cluster.
Minor Boolean expression simplification  Signed-off-by: Laszlo Hornyak <laszlo.hornyak@gmail.com>
Early-out right before executing steps.  Summary:It can take multiple seconds between scheduling the execution of a rule and submitting the execution of the steps to the executor. In such a case the 'fistFailure' early-out path was not being taken causing the build to keep going way past the first failure.  Test Plan: manual testing  Reviewed By: k21  fb-gh-sync-id: 889a545 fbshipit-source-id: 889a545
Fixed a bug where the CodecEmbedder implementations do not generate the close request - this issue prevented some encoders like ZlibEncoder from generating the footer
mute NodeTests#testCloseOnInterruptibleTask  For #41448
better failure when failing to find mapping for the key field in data histogram
[TEST] Mute failing InternalEngineTests#testSeqNoAndCheckpoints
Ignore test to get the RC built.
Upgrade Lucene Version to 4.2. The latest Elasticsearch version must use the latest Lucene version as specified in o.e.common.lucene.Lucene and must be upgraded with each lucene release.  This commit adds an assert that fails once the actual lucene version that is used is higher than the current releases version.
Fixed key repeat when losing focus.  closes #3083
Revert timeout change (no effect).
Fix the failing test and add one more test to cover both when/otherwise conditions.
Mute failing test
Add toString to HiveBucket
handle Compression.NONE in CassandraServer
More detailed error message when create network offering fails
No logical changes - removing unused `static` and adding whitespace
In ConditionalEliminationPhase, check whether a ValueNode does record usages; caused crashes in FastR
Removed a superfluous import
actually return SlicePredicate
remove unused imports
give the cleaner almost double the time to clean up the sessions (a whopping 9 more ms). Hopefull will deflake this test in CI.
Unneeded version check was removed.
Update OAuth20ProfileControllerTests.java  Added OK test with Authorization header
AMQ-6958 Configure the AMQP Max Frame Size by default  Configure a value of 128KB for AMQP max frame size by default to improve overall performance and provide a limit on delivery size before chunking begins.
Add inline comment to prevent confusion
[Test] mute MonitoringIT#testMonitoringService  The MonitoringIT#testMonitoringService test fails occasionally in CI due to a failed wait for documents condition, so this commit adds an awaits fix.  See elastic/x-pack-elasticsearch#4150  Original commit: elastic/x-pack-elasticsearch@c9415cba63c0dfee706b94ec6fffc6c8d6cdc310
Avoid use of double constructor of BigDecimal  Codacy warns about an Error Prone [1] use of the double constructor of BigDecimal in tests. The reason given is that it is a source of precision loss if the number does not have an exact double representation. The recommendation is to use the String constructor of BigDecimal instead as it does not require using a lossy argument.  This commit contains the following changes:   - replace usage of the double constructor of BigDecimal with the    String constructor of BigDecimal in JdbcTemplateQueryTests  - update the copyright year   [1] http://errorprone.info/bugpattern/BigDecimalLiteralDouble  Issue: SPR-15077
Log compaction before we commit the transaction
use same method names everywhere
Fix encoding set for query parameters
PatrickLightbody Let the SslRelay be used from any classes that want to extend ProxyHandler  r7951
fix issue on schema snapshot managment for schemafull documents.
CLOUDSTACK-7767: fixed events are not generated for snapshot creation
Summary: KVM - undefine persistent VMs on stop  Detail: A previous patch fixed an issue where we are defining VMs to persist locally on KVM hosts, which can cause issues if the agent isn't running and libvirt decides to start the VM unbeknownst to cloudstack. The previous patch stopped defining VMs as persistent. This patch adds compatibility for existing cloudstack environments, removing the persistent definition on stop if needed.  BUG-ID: CLOUDSTACK-600 Signed-off-by: Marcus Sorensen <marcus@betterservers.com> 1363194656 -0600
SimonStewart: Making the focus event on anything bar input elements for HtmlUnit, which already fires the event for INPUTs  r5724
Remove unused field  Reviewed By: styurin  fbshipit-source-id: 12b7e4b02d
Moving JDBC components from core and over to jdbc module
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=47987 Limit size of not found resources cache
always print stacktrace if it makes us crash
return 404 when trying to delete a mapping that does not exists
Adds unit tests for named parameters containing strings with quotes.
[FLINK-8522] [checkpoint] Remove number of states from checkpoint.
CLOUDSTACK-7283: listUsers - for regular user, only return the caller info. If there are more users under the same account, their information should never be returned
Fixed potential race condition in the updated version of ArrayMap.
Minor: remove warning
change MIN_SANE_LIVE_RATIO logging to debug patch by jbellis for CASSANDRA-5377
Work-around to release threadlocal ActionContext in init and destroy  WW-2167
remove unused code in CurrentJavaThreadNode
[BEAM-6526] Add populateDisplayData on AvroIO.ReadFiles
[TEST] add a test that explicitly verifies no duplicates are created we do this test in other places in ES, but no dedicated test for it. This test was born out of the auto generate id work, but we should have this test regardless if it gets in or not
Remove some dead-code and cleanup
Added ignore on the CamelSpringJavaconfigTest as it need to be run with Spring 3.x
deprecating untyped indexes
Be ready for null value being returned
RemoteWebDriver should not add its own information to the recreated server exception, it makes harder to read exception messages.
Added method for rolling back all of a slaves transactions (the master side calls it when a slave has gone down)
Fixed unit test on slower boxes
Add missing @JsonProperty annotation to session source field
Move a comment in NativeLibraryMergeEnhancer  Summary: This got put in the wrong place during development.  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 25f9243
improvements for CAMEL-619 to avoid showing null nodeID and to show the body java class too
Added surpress warning unchecked
remove ParseFieldMatcher usages from InternalSearchHit
Replace getStaticLabel with getLabelResource
Correctly detect LastHttpContent after encoding
Remove unnecessary synchronized block
Adapt to renaming of RestTestCandidate
Issue #3891: added test support for CheckUtilsTest
InvocationPlugins can only be applied for direct invokes
Buck plugin disable buttons if server isn't connected  Summary: Disable all actions if the server isn't connected, since we may lose information if we don't get the messages  Test Plan: Tested by connecting/disconnecting from the server.  Reviewed By: jimpurbrick  fbshipit-source-id: 71b6965
Remove warning message during dx that affects buck build progress printing  Summary: When using libraries like leakcanary dx prints warnings like ``` warning: Ignoring InnerClasses attribute for an anonymous inner class (com.squareup.haha.guava.base.Joiner$1) that doesn't come with an associated EnclosingMethod attribute. This class was probably produced by a compiler that did not target the modern .class file format. The recommended solution is to recompile the class from source, using an up-to-date compiler and without specifying any "-target" type options. The consequence of ignoring this warning is that reflective operations on this class will incorrectly indicate that it is *not* an inner class. ```  That completely stalls the buck build progress from being output to stdout. The build will silently pass/fail without any indication whatsoever due to this after being stuck  ``` [+] BUILDING...5.8s [28%] (227/495 JOBS, 227 UPDATED, 227 [45.9%] CACHE MISS) ```  This change prevents the warning from being print to the console. Closes https://github.com/facebook/buck/pull/752  Reviewed By: Coneko, dreiss  fbshipit-source-id: 0b9cda7
Allow to disable TraceClassInitialization
re-added name on the network connector
ShadowingClassLoader can be constructed without default excludes  Issue: SPR-15439
Capbilities return an empty string for VERSION. Sometimes.
canonicalize a LoadField on a null constant object to deopt
Add @Beta to new method that hasn't yet been API reviewed.  ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=131302300
Add test for dispatcher registration
Test: mute testDataNodeRestartWithBusyMasterDuringSnapshot  This commit mutes DedicatedClusterSnapshotRestoreIT# testDataNodeRestartWithBusyMasterDuringSnapshot which fails reproducibly.  See #36283
- Corrected toString
Removing duplicated import  Original commit: elastic/x-pack-elasticsearch@1618ec79d4c8cafb639d4cfc0bb2e9afea3e1ae2
Restrict field visibility.  Reviewed By: jtorkkola  fbshipit-source-id: 658eecc
No point in this being serializable
Disable test as this let fail the build 80% times on osx and slow linux servers. Need to investigate
Removed unsupported state from the network offering
CLOUDSTACK-9860: Fix stackoverflow issue  Fixes issue caused to a PR-refactoring from #2108, reported by @borisstoyanov  Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>
Restore test case removed last commit.
Disable PTX invocation
Improve Display of Source-Level Array-Like Types
Add unreleased 5.6.5 version number
DRILL-2079: Use AllocationHelper to allocate memory for vectors.
Make iterator static
Removed unused imports
rename package import org/apache/struts/action2 to org/apache/struts/webwork
Tests: add an awaitFix to IndicesLifecycleListenerTests
Allow aggregation of an empty TupleStream
Prevent instantiation of NamedParameterBatchUpdateUtils  In order to prevent instantiation of utility classes, this commit makes NamedParameterBatchUpdateUtils `abstract`.  Issue: SPR-17215
Make indexLeaves(index, overwrite) public
iOS Music.getPosition() returns secs. Fixes #1952
Save URL separately from samplerData
CAMEL-5196: Fixed sftp changed read lock strategy to use modificed timestamp. Thanks to Steven Barham for the patch.
Added new test case with IN operator and ()
Removing final to support subclasses returning different freemarker configuration WW-2257
added validation to registermetrics to have timebucketSizeInSecs >= 1
Revert "bug 14463: Failed to Deploy VM due to failure in creation of guest VLAN on SRX"  This reverts commit 9eb23c64dd5485d6ca8bd2dea0f1b18fd22b130a.
fixed thread local clean on drop in new delegate implementation
Fix AwarenessAllocationIT.testAwarenessZones test  This test sometimes fails because the first node is elected as master and waits 30s for incoming joins but in the meanwhile the 3 other nodes form a cluster on their side. The index will be created and its shards allocated on these 3 nodes, then the test checks for the number of shards on each node (it should be 2 or 3) but because the first node has not fully join the cluster yet one node will have 5 shards.   closes #13305
better toString on transport future
Test: Not all shards maybe in a started state after the initial scroll search, but are after we do the stats call, so add ensureGreen to ensure we don't up with this discrepancy
[FLINK-10399] Use String#isEmpty() to check for empty string.
avoid recompiling a method already compiled by Graal
Handle null arguments for the main function
back out bamboo build hack in stages
Deprecate unused method with non-standard name (which FindBugs doesn't like)
Fix memory accounting in ParallelHashBuildOperator  Use same logic as for HashBuilderOperator
Use correct value to disable/enable direct arenas in PooledByteBufAllocator
Remove unnecessary code
Refactor OScriptDocumentDatabaseWrapper (db instance for js functions) to use new SQL executor
Add correlated subquery test where limit is above filter
bug 13679: cosmetic fix to remove NPE warning message from log. Reviewed-By: anthony
SimonStewart: Adding back in the hooking up of the remote webdriver server to the standalone selenium server jar  r7763
made sure that interrupt exception interrupt operation from locks
Add test for count with boolean argument
Patch from Milamber to correct a double scroll bar in view results tree as render XML
Add regression test for antlr/antlr4#26 (an exception upon simple rule with double recursion in an alternative)
add GroovyObjectSupport as type
Fixed issue #2030 about Backup with files >2GB (critical)
Added specific unit test for scoped-proxy target not being an autowire candidate  Issue: SPR-11548
Mute PermissionsIT#testWhen[...]ByILMPolicy (#41858)  Relates #41440
Improve ClientHttpRequestFactory javadoc  This commit underlines the fact that the request created by a ClientHttpRequestFactory should be augmented with a message body using the `ClientHttpRequest#setBody` method before it is executed.  See #82
Add host verification for CheckRouterCommand  We only send CheckRouterCommand to the hosts managed by current management server.
improve ByCssSelector#toString  Change the string to a more meaningful "cssSelector". It is also more consistent with the other By's #toString methods.  Signed-off-by: Luke Inman-Semerau <luke.semerau@gmail.com>
remove unused import
Upgrade the documentation for SourceSection, especially with respect to the specification of text locations.
Remove deprecated code
corrected Javadoc comment
Delete unused import
Added usage to javadoc for BreakpointNode
DanielWagnerHall: Making element equality and hashCode consistent.  This makes the /element/:id/equals/:other command obsolete.  Leaving the handlers in for backwards compatibility.  r14281
DouniaBerrada: Cleanup for android   r10357
Add `computeIfAbsentConcurrently` test for `ConcurrentLinkedHashMap`
if a server internal error occurs in this code, say something on the console  r3448
TikaCLI: add attachement extraction option
SECURITY: Fix Compile Error in ReservedRealmTests (#33166)  * This was broken by #32515 since the 5.x versions were removed between PR creation and merge
Interval#previousUsage: return -1 if there is no usage.
Improved failure report information
Deprecates the old extension point and defines a new one
Fix a bug in ChannelOutboundBuffer.addFlush()  It should not advance the tail if no write() was issued so far.
Revert "BEAM-5933: avoid memory allocation in hashCode call"  Fixes BEAM-6407.
CAMEL-11703 - Camel-AWS: Use builders instead of different constructors - AWS SWF
Adds timed wait on ResponseFuture so it is more frequently scheduled
Remove unnecessary calls. Closing the socket recycles the processor which in turn recycles the buffers.
[TEST] Add discovery-multicast to PluginManagerIT
Categorize invalid argument errors to approx_percentile
when there's an IOException, the URL should still be set. Found this difference in the process of writing the monitor. I use the URL as the unique key for each individual serverpanel.  peter lin
Add test for isHostSymbol and asHostSymbol
StubJarTest: Don't use FrontendOnlyJavacTask for source ABIs with deps  Summary: This was left over from the early days when I thought we'd need to. Source ABIs with deps are actually generated with the regular `JavacTask`, so this better reflects reality.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: 3de47c3
Minor: small improvement of OSchema.getClass()
Revert r1361430: the method can not be deprecated, because it is still used by WebappLoader via reflection.
Profiler:  Javadoc
Remove unused import
Construct AfterEachStateMachine from list of subtriggers
add ability to spit out count
[TEST] only pass valid random settings
KAFKA-4661: Improve test coverage UsePreviousTimeOnInvalidTimestamp  Author: Jeyhun Karimov <je.karimov@gmail.com>  Reviewers: Matthias J. Sax <matthias@confluent.io>, Guozhang Wang <wangguoz@gmail.com>  Closes #3288 from jeyhunkarimov/KAFKA-4661
Migrate TestCustomFunctions to AbstractTestFunctions
Deprecate `Capabilities.isJavascriptEnabled`  This provides no useful functionality over calling:  `Capabilities.is("javascriptEnabled")`  Worse, it's suggesting that browsers can be used with webdriver without JS enabled, which isn't true.
Migrate deprecated API.
RidBag: Test for tracking rid changes
Added a some logic for specifying values that the slider can snap to.
Update for Gump now these are known Ciphers
[FLINK-11334] Add good EnumSerializer.toString()  This makes it easier to understand failing tests where serializers are being compared.
Correctly calculate checksum when using GZIP. Part of [#2168]
use try-with-resources to close userLogFileStream
Don't create ABIs from source if postprocessing classes  Summary: A postprocessing step might modify the class files, rendering a source-based ABI incorrect.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: a7a774f
findElements should return empty list if there are no elements (not a timeout exception). Fixes issue 5278
CAMEL-5776 removed the useless headers
Fix https://bz.apache.org/bugzilla/show_bug.cgi?id=58386 On the basis that access() and finish() are synchronized, extend synchronization to other methods that access same fields.
Add test for late intrinsic inlining.
removed (old debugging?) output code.
Change the extension point for CompilerTreeApiTest  Summary: One of the overloads of `CompilerTreeApiTest.compile` used to be the thing to override if you wanted to do something no matter how the compiler was invoked. After `initCompiler` was added, one if its overloads became a better place, but I neglected to make it so.  Now I need it in a new test, so here we are.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: 2932ac1
Added missing license header.
javadoc: diagrams for onBackpressureBlock (would benefit from a review)
Issue 609: revert wrong change on cert tests
add 0.18.4 version
Add BuildTarget support to HashBuilder  Summary: Forward BuildTargets to the hasher. Thanks to cjhopman for suggesting this in https://our.intern.facebook.com/intern/diff/D16230835/?transaction_id=342996106396210.  Reviewed By: cjhopman  shipit-source-id: d7cd59ee2a
Added a test case for the KernelExtension contract test.
HIVE-4602 Enable running all hive e2e tests under vectorization. (Tony Murphy via omalley)
Related issue: NETTY-116 HTTP issues including chunked request / response patch * Applied Dave's patch for HttpMessageDecoder
Added listener which runs method beforeSetup before setup of the canvas and afterSetup after creation of the canvas
Restore constant for default size to be plain 8 instead of unrelated Byte.SIZE
Added a property to avoid the exception stack trace when running the console
Ensure CachingBuildEngine uses a ConcurrentHashMap for buildInfoStores  Summary: BuildInfoStores depends on computeIfAbsent being called exactly once for each key, which isn't guaranteed by ConcurrentMap.  From reading the guava source, newConcurrentMap should be returning a ConcurrentHashMap anyways, so this probably doesn't cause any problems "in practice", but it's better to be explicit that this behavior is desired.  Test Plan: local builds, CI  Reviewed By: marcinkosiba  fbshipit-source-id: 6cbd0bb
Group constant definitions with matching RequirementProvider
Added license header
MINOR: Reduce the log level when the peer isn't authenticated but is using SSL  The commit here changes the log level of a log message from WARN to DEBUG. As noted in the mail discussion here https://www.mail-archive.com/devkafka.apache.org/msg56035.html, in a pretty straightforward/typical and valid setup, the broker logs get flooded with the following message:  [2016-09-02 08:07:13,773] WARN SSL peer is not authenticated, returning ANONYMOUS instead (org.apache.kafka.common.network.SslTransportLayer)  Author: Jaikiran Pai <jaikiran.pai@gmail.com>  Reviewers: Ismael Juma <ismael@juma.me.uk>  Closes #1825 from jaikiran/ssl-log-level
Add @since markers
randomly use shield  Original commit: elastic/x-pack-elasticsearch@e3729112e3ac6d6af46e0bb7b7e3eeba1933fcec
HIVE-10332 : Use SortExchange rather than LogicalExchange for HiveOpConverter (Pengcheng Xiong via Ashutosh Chauhan)
Fixed add/remove cluster in class: now default cluster is updated too
Add @Override annotation
remove shutdown hook
Remove unused import
CAMEL-8856: Add Eviction Map Consumer Test
Make SS look at the right piece for expire time. Patch by brandonwilliams reviewed by jasobrown for CASSANDRA-5857
Muting  SnapshotDisruptionIT  Tracked in #36779
Added distinctUntilChanged member methods to Observable
Refactor parser to use global frame for rules  Summary: This way rule definitions can be reused in multiple environments. In particular this will be used when parsing extension files.  Test Plan: CI  Reviewed By: styurin  fbshipit-source-id: 2cc4640
Improve error message for external file lock error
DX RegisterSpec optimization for de-interning: mapSourceRegisters  Summary: [Forward Port of 160a87fc81adcc091836b15c54c380069bdf90c5] An upcoming change will make the RegisterSpec class not interned as a part of making DX in-process safe.  PhiInsn.mapSourceRegisters is currently doing an "==" check to determine whether to call SsaMethod.onSourceChanged.  Without interning, that check might fail where it would have previously succeeded (for two equivalent but not reference-equal RegisterSpecs), resulting in an unnecessary call to onSourceChanged.  (I don't know if this can *actually* happen.)  This diff optimizes that case by doing an early exit if the new and old source have the same register.  Inspection of the method shows that when this is the case, it just removes the instruction from a list, then adds it right back.  This diff should be correct and safe on its own, but it seems unlikely to have any benefit as long as RegisterSpec is interned.  Test Plan: ant dx-tests
Assert correct Slice representation in CharType
TIKA-259: Safe parsing of droste.zip  Add a (default) limit of at most 30 levels of XML nesting in parser output. That should be enough for all normal documents, but catches droste.zip quite nicely.
added constructor to FailedToCommitException
Enable trace logging in CCR retention lease tests  These tests are failing somewhat mysteriously, indicating that when we renew retention leaess during a restore that our retention leases that we added before starting the restore suddenly do not exist. To make sense of this, this commit enables trace logging.
Clear some more static state in tests  This was causing CI build failures that didn't reproduce consistently locally. Hopefully this will fix the error on CI.
handle Compression.NONE in CassandraServer
removed System.out.println() statement
Only consider tokens which are already in preMap
make javadocs for scan() more precise (#1857)
Add support for notify periodic event of cluster.
Deprecate ChannelOption.newInstance(...) (#8997)  Motivation:  Deprecate ChannelOption.newInstance(...) as it is not used.  Modifications:  Deprecate ChannelOption.newInstance(...) as valueOf(...) should be used as a replacement.  Result:  Fixes https://github.com/netty/netty/issues/8983.
Allow LdapAuthorizationGenerator to be extended for profile roles
Use Java's built-in way of joining collections.  Reviewed By: styurin  fbshipit-source-id: 5d770888f4
Test cleanup.
Binding java.lang.reflect.Proxy to JNDI directory raises java.lang.ClassCastException https://issues.apache.org/bugzilla/show_bug.cgi?id=47512  Also acts as dead code removal
[FLINK-3840] Remove Testing Files in RocksDB Backend  We create random files on initialization to check whether we can write to the data directory. These files are also removed now.
ReadTimeoutHandler - missing ) within JavaDoc example (#8645)  Motivation:  improve docs  Modification:  ReadTimeoutHandler - missing ) within JavaDoc example  No logic/unit tests affected
add cqlVersion to things ClientState.reset cleans up patch by jbellis; reviewed by dbrosius for CASSANDRA-4657
added better javadoc for DGM.with(Object, Closure) and DGM.transpose(...)
fix for make sure that http command support multiple languages
[BEAM-5658] Suppress findbugs warning about intended reference equality check
Ensure valid output encoding
Restore method required for JSR 77.
GraphDatabaseSuperNodeSpeedTest compilation problem was fixed.
Eliminate duplication of List in toList  Fixes https://github.com/Netflix/RxJava/issues/1218
Revert "Consistently name Groovy scripts with the same content"  This reverts commit d902012835916179e0bb86890e7898cc30aef70a.  Reverting this temporarily to see if this fixes hitting an assert in the JDK during Groovy's classloading
A better way to get default value
Test that SimpleDoFnRunner wraps exceptions in startBundle and finishBundle
Ignore partition bucketing if table is not bucketed  Previously, queries would fail if the partition was bucketed but the table was not. We can ignore the partition bucketing in such cases.
Improve security substitutions error message.
r/m unused BUFSIZE patch by jbellis; reviewed by Eric Evans for CASSANDRA-424
Restores StateContexts.stateContextFromComponents  It must be temporarily restored for compatibility with current Dataflow worker in order for integration tests to pass.
implemented getMetaData() for prepared statements (returns significant info only if the query was already executed)
Use Java8 api in RowType
CAMEL-8270 Added an unit test for it
Fix merge scheduler test that depends on the number of processors
Add missing doc
AbstractApplicationContext.isRunning() avoids IllegalStateException  Issue: SPR-13667
Minor Boolean expression simplification  Signed-off-by: Laszlo Hornyak <laszlo.hornyak@gmail.com>
Optimise - Is a tiny faster as the extra add is not needed as we dont use the returned value.
add document lazy load on method fields and isEmpty
specify that asMap never auto-loads entries ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=26581537
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=52591 Skip attributes where getters throw UnsupportedOperationException
Expose executor. Required so Servlet 3 Async implementation can use the container thread pool when a new thread needs to be dispatched. (e.g. from AsyncContext.start(Runnable)
Use assertNotSame(x, y) in place of assertTrue(x != y) ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=47307058
Construct "proper literal" for CHAR in LiteralInterpreter.toExpression  "proper literal" means just a literal or a literal wrapped with a CAST. Previously, `toExpression(..., CHAR(x))` would return a "magic literal function call" which is hard to analyze.
GROOVY-2862: Some DGM niceness for Character (remove some unecessary functionality)
Uses new way to access TileContainer
Simplify SingletonHolder by using interface instead of static class
Update tests using http.enabled (elastic/x-pack-elasticsearch#4413)  This commit updates tests using http.enabled to expect a deprecation warning.  relates https://github.com/elastic/elasticsearch/pull/29591  Original commit: elastic/x-pack-elasticsearch@92e5ea9c74953bdeb73d6be7b2e2e06ca4ca6a42
Made discovery service redirect to webadmin work in IE.
Clean up the component document of camel-netty
Corrected default, required and acceptable tokens for RequireThisCheck, issue #655
Add a call to `BuildTargets.getGenPath`.  Summary: No functional change. I just missed this when I created `getGenPath`.
2.x: update Obs.just(2..10) & switchOnNextDelayError marbles (#5651)
Use proper logging placeholder for Netty logging
Updated OutputType.minimal to match the latest parser.  @MobiDevelop, also added ^ and $ for GWT, for whatever godforsaken reason. Did I do what was needed?
reduce completion listener code in AndroidMusic
mute SplitIndexIT due to https://github.com/elastic/elasticsearch/issues/30416
grid: remove rewrite of Presto-Opera capability opera.binary
Add test for FrameworkDependencies metadata traversal in AppleBundleDescription  Summary: I promised to add a test, here it is.  Apple bundle should stop FrameworkDependencies traversals instead of recursing into its binary field.  Test Plan: This is a test.  Reviewed By: ryu2  fbshipit-source-id: 28108ee
TIKA-780: Optimize loading of the media type registry  Add a maximum size limit to the static set of simple media types kept in memory. This prevents a potential DOS attack against the library.  Fix handling of media type parameters.
CLOUDSTACK-5663 : Added the NULL CIDR check to avoid NPE for createNetwork and listNetwork  Signed-off-by: Daan Hoogland <daan@onecht.net>
Remove extra explicit type
Add JavaDoc to InstrumentBranchesPhase.
more specific return value on ObjectStamp.join
Remove import for java.util.Formatter since it's needed only for the javadoc. ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=108184450
[CALCITE-650] Add metadata for average size of a tuple in SemiJoin (Jesus Camacho Rodriguez)  Close apache/incubator-calcite#67
Fix a couple of ASync issues that were causing Servlet 3.0 TCK test failures. 1. <quote section="2.3.3.3" page="17"> The complete method can be invoked by the container if the request is dispatched to a servlet that does not support async processing, or the target servlet called by AsyncContext.dispatch does not do a subsequent call to startAsync. In this case, it is the container's responsibility to call complete() as soon as that servlet's service method is exited. </quote> 2. <quote section="2.3.3.3" page ="13"> public boolean isAsyncStarted() - Returns true if async processing has started on this request, and false otherwise. If this request has been dispatched using one of the AsyncContext.dispatch methods since it was put in asynchronous mode, or a call to AsynContext.complete is made, this method returns false. </quote>
2.x: Describe merge() error handling. (#5781)
Revert accidental commit r1756322
Add increment to Variable bytecode expression
add check for avoid save in case of remote serialization, issue #3212
Avoid potential NPE in error message
Add tests for INSERT and UPDATE on a PreparedStatement via executeUpdate()
TIKA-1128: normalize newlines before assert
CLOUDSTACK-5145 : Added permission checks while deleting network ACLs
make MonitorEnterNode iterable
DRILL-1098: Add test for trim(), substring() function. Actual fix is in OPTIQ-331
Remove unsused firstReadTimeout attribute  Set correct default pollerThreadCount
CLOUDSTACK-5663 : Added the NULL CIDR check to avoid NPE for createNetwork and listNetwork  Signed-off-by: Daan Hoogland <daan@onecht.net>
https://issues.apache.org/jira/browse/AMQ-5621  Have the test store its data in the target folder to let the clean step remove it and attempt to remove the data folder between runs to avoid state derby instances.
Add test to reproduce SPR-15271
CAMEL-3100: Polished.
removes custom implementation for setDelegate
Fixed search by keyword in listRouters command - deleted displayName parameter from keyword list as it applies for user vms only
Add mew method from Java 1.7 to prevent compiler errors when only 1.7 is installed.
AlexeiBarantsev: Remove a temporary directory that contains a profile extracted from json string. FirefoxProfile(dir) constructor copies content of this directory (webdriver*) to a new profile  directory (anonymous*), so immediately after copying it can be safely removed. Fixes issue 1934  r13935
[java] Deleting unused imports
Fix license messaging for Logstash functionality (elastic/x-pack-elasticsearch#3268)  * Fix license messaging for Logstash functionality  With a Basic license, users are still able to perform CRUD operations on the `.logstash` index, therefore manage their Logstash pipelines. However, Logstash itself will not pick up any changes from this index and act on them. With an expired license Logstash functionality continues to operate as normal.  * Fixing messages after feedback  * Removing extraneous tabs at end of line  * Fixing typo  Original commit: elastic/x-pack-elasticsearch@bc069cf00ff865056ee53fd3e7c79b325c68dcee
Make close() in AbstractTestQueryFramework callable by TestNG  close() method was annotated with @AfterClass but was private. Because of that, it was not called and testng didn't fail. Making this method public nicely closes h2 and presto query runners.
Ignoring unstable test (fails on travis)
CLOUDSTACK-1054: When calling listDomains through the API do not restrict ADMIN users  When an admin calls this command without the ID parameter do not set the domain's ID to the ID where the admin is in, this prevents him from doing lookups.
RejectedExecutionException != EdRejectedExecutionException
Added the unit test of sending request/reply between the jms endpoint and jetty endpoint
Patch by Luca Molino on a bug in the management of Object Database.
Change empty leaf label to avoid weird behavior with multiword token splitting
Remove warning message during dx that affects buck build progress printing  Summary: When using libraries like leakcanary dx prints warnings like ``` warning: Ignoring InnerClasses attribute for an anonymous inner class (com.squareup.haha.guava.base.Joiner$1) that doesn't come with an associated EnclosingMethod attribute. This class was probably produced by a compiler that did not target the modern .class file format. The recommended solution is to recompile the class from source, using an up-to-date compiler and without specifying any "-target" type options. The consequence of ignoring this warning is that reflective operations on this class will incorrectly indicate that it is *not* an inner class. ```  That completely stalls the buck build progress from being output to stdout. The build will silently pass/fail without any indication whatsoever due to this after being stuck  ``` [+] BUILDING...5.8s [28%] (227/495 JOBS, 227 UPDATED, 227 [45.9%] CACHE MISS) ```  This change prevents the warning from being print to the console. Closes https://github.com/facebook/buck/pull/752  Reviewed By: Coneko, dreiss  fbshipit-source-id: 0b9cda7
Improve subscription removal in SubscriptionRegistry  Avoid using destination pattern based search when removing sessions or subscriptions from DefaultSubscriptionRegistry and use only session and subscription ids.  Issue: SPR-11930
Fixed compilation error
Rename unit test so it looks like a unit test  Original commit: elastic/x-pack-elasticsearch@d2d39ad50bb1a638461f1e2aed21110b732ea5e0
Precompile prefix headers when specified.  Test Plan: None needed.
SimonStewart: Make the IE driver consistent with the chrome and firefox drivers  r10506
Use non synchronized version StringBuilder instead of StringBuffer
HIVE-3057: metastore.HiveMetaStore should set the thread local raw store to null in shutdown() (Travis Crawford via Ashutosh Chauhan)
use read/writeOptionalWriteable in NodeInfo serialization code
Adds an explicit generic in a test
allow controllable stack dump in ExceptionUtil.java
Added tests to install the server on a path with strange characters and space in it
Test: move no master node test over to only use unicast zen discovery. On the build server there is no multicast enabled.  Original commit: elastic/x-pack-elasticsearch@20eab58db1180ab20a92c0227b72b0b6d4fbcd7c
better toString on transport future
HIVE-6662: Vector Join operations with DATE columns fail. (Gopal V via jitendra)
HTTP/2 DefaultHttp2HeadersDecoder weighted average error  Motiviation: cfcee5798d6680d87aec3ae68cdded74a1402f84 introduced code to resize the headers based upon a weighted average. The weight used for new entries was initialized using integer arithmetic when it should have been floating point arithmetic and so new values contribute 0 weight.  Modifications: - Cast to float when initializing  Result: Weighted average does not give 0 weight to new headers in DefaultHttp2HeadersDecoder.
[hotfix] Reduce string concatenations in ExecutionVertex
MAHOUT-956: filter logs, crc
Refined exception message  Issue: SPR-14609 (cherry picked from commit ab68673)
remove unused method
Parallel query: fixed issue with transactions  When transactions are running, the parallel doesnât work because the way the database is cloned between threads It doesnât take in account the transaction data structures in db.copy()
TIKA-352: Use MediaType.parse when extracting charset from content-type metadata in parsers  Make MediaType.parse(null) fail more gracefully
Let Strings pass through truffle_read_string()  * Until we implement a proxy to the String behaving as a char*.
Use MockitoJUnitRunner from Mockito 2's preferred location  Issue: SPR-14880
[FLINK-1478] [jobmanager] (addendum) Add eager check for null as input split host name
Dialog, fixed focus issues.
Remove the unused defaultConsistency from ModificationStatement
Don't clear down thread counts at end of test
Generate correct bytecode for synchronized blocks (fixes GROOVY-247, GROOVY-362, GROOVY-800 and GROOVY-947)
a leaner graph implementation
Allow apk expansion to be used with fragments also. Fixes #4787
[no jira] extend the timeout b/c it was on the margins
parseDouble for primitives
Fix scaling thread pool test bug  This commit adjusts the expectation for the max number of threads in the scaling thread pool configuration test. The reason that this expectation is incorrect is because we removed the limitation that the number of processors maxes out at 32, instead letting it be the true number of logical processors on the machine. However, when we removed this limitation, this test was never adjusted to reflect the new reality yet it never arose since our tests were not running on machines with incredibly high core counts.  Relates #20874
SPR-6186: removed remaining duplicate check for @Configuration
Update 'contains' signature to 'contains(Object)'
[hotfix][tests] Removed unused field
Try and set profile for xpi driver if necessary
fixed thread local clean on drop in new delegate implementation
Relax regex for getting C++ build so it works for developers with uncommitted changes  Original commit: elastic/x-pack-elasticsearch@a6faea0cc60202868c3301fd4a06080dc67cbbaf
Re-enables mistakedly ignored tests
made sure that interrupt exception interrupt operation from locks
remove unused imports
WW-3067 Add a configuration constant to turn on/off the logging of missing properties by OGNL
Bug 53782 - Enhance JavaSampler handling of JavaSamplerClient cleanup to use less memory  First improvement, store only necessary objects Bugzilla Id: 53782
[TEST] fix CurrentTestFailedMarker to reset its state after each test  The currently used method `testRunStarted` is only called before any tests have been run, we need to reset that state before each test, that's why we need to use `testStarted`.
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=53513. Fix race condition between the processing of session sync message and transfer complete message.
AndroidLibrary.Builder: Hoist addition of DummyRDotJava dependency out of the BuilderHelper  Summary: TSIA  Test Plan: CI  Reviewed By: asp2insp  fbshipit-source-id: 3026266
Remove use of deprecated code
Re-order tests to skip more expensive test when posisble
More logging when PubsubJsonIT fails
DRILL-2548: JDBC Driver - check for bad data from server and prevent SqlException
[Test] Fix remaining static objects after running tests  Test framework detects when static objects are not released when running tests. This commit remove usage of static objects when possible.
Fixed bug on Fetch Plan map building. Should fix issue 709
Replace manual array unboxing with ArrayUtils.toPrimitive(). #1538
Bump timeout on test for timeout failure  Summary: This test was timing out at 90s sometimes because it usually takes 80s to run.  Reviewed By: jtorkkola  fbshipit-source-id: 466060cc13
test: remove unnecessary verify check  Original commit: elastic/x-pack-elasticsearch@f748c0a56581a5e562a0c399985950323cc01f7e
remove debug comment
Removing misleading log messages. Fixes issue 6392
Remove unused import.
Backported the harden synced-flush PR to v6.3.0  Relates #28464
Closing alert that can remain after previous test
Set method in result Test non-GET method
GROOVY-4137 Set the source information on the default constructor added by groovy compiler, if not provided.
small commit to test things, will be reverted  Test Plan: CI  Reviewed By: marcinkosiba  fbshipit-source-id: 1630f56
Better format in print tree
add missing bytes
ByteBufferUtil.string should return the copy, not the original buffer.
removed system logging
Added missing iOS device  Added the missing Wi-Fi Only iPad Pro to IOSDevice
Allow to use NIOFSDirectory as directory implementations for lucene indexes  Add "default_directory_factory" feature toggle in DirectoryFactory to be able to choose between default directory factory and NIOFSDirectory for lucene indexes directory.
Remove unused rule
updated a javadoc ref
removed angle brackets from default version of version, to make url-friendly
don't throw exceptions when you can't add host
Add KEY_ARCHIVE. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=47874734
Remove DirCache logs about hit/miss, as we geting them from CachingBuildEngine  Summary: These are rarely used logs, and we get almost the same information from CachingBuildEngine logs  Test Plan: CI  Reviewed By: marcinkosiba  fbshipit-source-id: 6a2926d
Minor changes to make the benchmark test look more like the one submitted to DEFT
&= is needless as stoppedAll is true Added TODO waiting for answer from sebb on dev mailing list Bugzilla Id: 53418
TIKA-844 Add an internal TagBag property type constructor, patch from Ray Gauss
add missing break
Remove unused code
Promote common rest test utility methods to ESRestTestCase  We have duplicates in some classes and I was about to create one more.  Original commit: elastic/x-pack-elasticsearch@78ff55399237117da6b1dd3d92ee2eba2ecf40d1
Avoid NPEs so tests fail rather than error
Fixed a bug with javac
Ensure result of getVersion() is consistent with getMajorVersion() and getMinorVersion() With the current code this fails. Patch to fix this to follow.
Query DSL: prefix query to support _id, closes #1648. (fix support analysis for prefix is configured)
Dumps the logical logs in version order
Fixed the tests in storm-starter that do not use the actual TupleImpl but mock everything themselves
One more @GoogleInternal I missed last time. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=86977055
[TEST] added @AwaitsFix to failing StringTermsTests while I work on a fix
CLOUDSTACK-3428 UCS:API: We need listUCSManager API to lists all UCS managers registered with CloudStack  fix entityType in api command
Use static field instead of new array
bug 11490: simulator marks VMs as Stopped and not Expunging when they are Destroyed status 11490: resolved fixed reviewed-by: Kishan.Kavala@citrix.com  The simulator should mark the VM as Expunging when the root volume is destroyed or VM sync will think the VM is still only Stopped and not expunged (cherry picked from commit 6dd57f3023d3ca3bb323d20298d6a70c0bfb079c)
[FLINK-10881] Use cancelWithSavepoint in SavepointITCase test.  This closes #7833.
fix check for rememberMe in authentication (#3869)  Fix a problem that kept remember-me authentication from working when logging in to a service protected with mfa-duo.   The test in CookieRetrievingCookieGenerator() for the presence of AUTHENTICATION_ATTRIBUTE_REMEMBER_ME in the authentication object was always failing, because an unnecessary CollectionUtils.wrapSet() was being used before checking the value. This would result in a TGC being saved with session lifetime, even when the "Remember Me" box was checked.  To test: select the "Remember Me" box when logging in to a service that requires duo-mfa; check the lifetime of the TGC cookie in the browser.
Update javadoc.
[java] Simplification of TNG Grid main method, merging duplicated clauses
Change halide library output path to be consistent with cxx rules.  Test Plan: CI  Reviewed By: curtis, jcarreiro, andrewjcg  fb-gh-sync-id: be27ba6
SPR-8725 Change modifier in WebMvcConfigurationSupport methods from package private to public.  Use of package private @Bean methods can cause issues if the class is extended and the sub-class is in a different package. This is  covered in detail in SPR-8756.
[removed] unused import
HIVE-5978 : Rollups not supported in vector mode. (Jitendra Nath Pandey via Ashutosh Chauhan)
GROOVY-1746: add missing @since
Remove v[N/A] log output
Test that custom `ProtocolResolver` is invoked    See gh-11659
Use platform-independent line separator    See gh-23571
Close all servers/ports after tests finish (#2755)
check the metadataServiceExporter when exec ShutdownHookCallbacks (#5650)
Remove needless unchecked suppression.
Removing note about 7u60 from master, which is Java 8+ only
Avoid limitation of javac's type inferencing
Remove some tests.    We don't have to test the test and failure naming for tests with  @Parameter annotation again, because it is not different from the test  that sets the parameters via constructor.
Configure WebClient to use same address (IPv4 or IPv6) as server    Closes gh-11712
Configure worker for Undertow\xe2\x80\x99s access log to use daemon threads    Previously, the worker used non-daemon threads which meant that they  prevented the JVM from shutting down. Ideally, we\xe2\x80\x99d avoid this problem  by closing the worker and access log receiver as part of stopping  Undertow, however, due to an apparent bug in Undertow [1], it\xe2\x80\x99s not  possible to do so cleanly.    This commit configures the access log worker to use daemon threads so  that they do not prevent the JVM from shutting down. Unfortunately,  this means that the threads will still be running after the context has  been closed but before the JVM shuts down but that appears to be  unavoidable due to the aforementioned Undertow bug.    Closes gh-4793    [1] https://issues.jboss.org/browse/UNDERTOW-597
Enhance Javadocs on OkHttpClient.setSocketFactory
Postpone checkSubConfig logic in ReferenceConfig (#5226)
Adapt to MockClientHttpResponse no longer accepting a null body
Using MethodSorter here too, just in case it matters.
to meet new onResponse signature: return directly
Remove some tests.    We don't have to test the test and failure naming for tests with  @Parameter annotation again, because it is not different from the test  that sets the parameters via constructor.
Use method to resolve directly to a builder.
Fix a concurrency bug in SPDY settings.    We were making a copy of the streams HashMap so that we could  iterate it safely after releasing our lock. But we weren't  actually using that copy when iterating. Whoops!    Fixes https://github.com/square/okhttp/issues/1119
Remove needless unchecked suppression.
Do not delete duplicate directories from main classpath    Before this change we were too aggressive in deleting duplicate resources  since directories might not have identical contents, and yet they were  being deleted anyway.    Fixes gh-614
Distributed: fixed CCE on tx fix
Resolve build issues
Make the logger static final    See gh-18575
Polish 'Avoid string copies in SpringBootBanner'    Closes gh-12591
Print the java version being used on startup    See gh-21559
Attempt to fix failing log tests
Move most public suffix tests to Junit 5 (#6379)
Add doc for Request.Builder.removeHeader. (#3858)    to note multiple headers may be removed.
Properly guard DB health indicator    The DataSource health indicator uses `JdbcTemplate` behind the scenes  but nothing was checking that it is actually available.    `DataSourcesHealthIndicatorConfiguration` is now disabled if  `spring-jdbc` is not on the classpath.    Fixes gh-3765
Polish 'Auto-configure ReactiveStringRedisTemplate if necessary'    Closes gh-16604
Try to prevent Travis build failures    Update LiveReloadServerTests which seems to be failing intermittently  on Travis.
Support resolution of HAL link titles from a resource bundle    Spring HATEOAS 0.19.0.RELEASE provide support for resolving a link\xe2\x80\x99s  title by looking up the key _links.$rel.title. For us to take advantage  of this in Spring Boot, HalHandlerInstantiator must be created using  the link relation message source that\xe2\x80\x99s automatically created by  HateoasConfiguration.    Closes gh-3860
Polish 'Auto-configure ReactiveStringRedisTemplate if necessary'    Closes gh-16604
Fix file handle leak in JarFileTests    The JarFile was not being closed which linked a file handle and caused  a test failure on Windows.    The local variable has been renamed as, when declared in a  try-with-resources, Checkstyle was confused by the shadowing of the  jarFile field and required references to jarFile within the try-block  the be prefixed with this.    See gh-19595
Be defensive about adding autoconfig report bean
Update FilteredClassPathRunner so that JUnit rules work    Previously, the tests class and any JUnit annotations it contained were  loaded by a different class loader to JUnit. This meant that the JUnit  annotations were loaded twice and @Rule-annotated fields were not found.  This commit updates FitleredClassPathRunner to use a custom class loader  that ensures that any org.junit.* classes are only loaded by a single  class loader.
Remove ResourceUtils.getURL logging config check    Remove `ResourceUtils.getURL` checking from `LoggingApplicationListener`  so that logging systems can implement custom location support.    Prior to this commit, we checked in the listener if the specified config  location could be opened as a URL. This unfortunately prevents Log4J  extensions such as `log4j-spring-cloud-config-client` from implementing  configurable SSL and credentials support.    See gh-22946
Precompile current dir pattern in Handler    Closes gh-11321
Properly guard DB health indicator    The DataSource health indicator uses `JdbcTemplate` behind the scenes  but nothing was checking that it is actually available.    `DataSourcesHealthIndicatorConfiguration` is now disabled if  `spring-jdbc` is not on the classpath.    Fixes gh-3765
Mark thread as interrupted after catching InterruptedException    Closes gh-11784
Narrow the event types ConfigFileApplicationListener supports    See gh-9628
Activate WebSecurityEnabler only for web applications    Done in order to align with the rest of the configuration. Absent this  check, the bean will be installed in non-web applications without the  corresponding dependencies, causing the bootstrap to fail.    Closes gh-1588
Adapt to changed default login redirect URL in OAuth 2 Client support    See https://github.com/spring-projects/spring-security/issues/4687  See gh-10705
Remove redundant array creation.
Replace custom MD5 method with Bytes.getMD5 (#6597)    fix #6594
Close all servers/ports after tests finish (#2755)
Add 'source' configuration to JdkCompiler
added a static helper method to access the current running Main
Updated gson recipe to close response body.
Update JavaDoc for WebSocketListener (#3288)
Enhance Javadocs on OkHttpClient.setSocketFactory
Assert connection pool eviction in HttpOverHttp2Test.tearDown()    While investigating https://github.com/square/okhttp/issues/4470, I noticed there are sometimes connections left in the pool after calling ConnectionPool.evictAll() in HttpOverHttp2Test.tearDown(). As a result, tests that assume the connection pool is initially empty can appear flaky while the blame is in previous tests, making it hard to debug, and possibly hiding a connection leak bug.    So far I've noticed the new assertion fails (very rarely) when tearing down these tests:  * recoverFromMultipleCancelReusesConnection  * emptyDataFrameSentWithEmptyBody  * gzippedResponseBody    This change may increase flakiness in the short term, but will make it easier to debug, by blaming the right tests.
Test proxy disconnecting before sending response headers    Reproduces https://github.com/square/okhttp/issues/4915
Test proxy disconnecting before sending response headers    Reproduces https://github.com/square/okhttp/issues/4915
Add a test for case insensitive content type matching.
Be consistent about host names in RouteSelector.    Use the host specified by the address, and not URI.getHost().    bug: 18023709  Change-Id: I2c39c2ce89049130dc00047c8de6f214159144c0
Remove needless unchecked suppression.
Empty lines are for noobs.
Document custom error body deserialization exception.    This is a less-than-ideal API but the behavior can't be changed because it's public API. We'll make error handling more robust in future versions.
Ensure a real platform is present for Android detection.
Add getter for log level.
Handle h2 vs http/1.1 event ordering differences (#3504)    * Handle h2 vs http/1.1 event ordering differences    * remove sout    * additional test case    * dont change client, change server protocols    * refactor test
Enhance Javadocs on OkHttpClient.setSocketFactory
add socks5 proxy  support (#3624)
[Performance tuning] improve InvokerInvocationHandler#invoke (#5403)
Removed redundant phrase from parameter name
Refactored logic out of failDueToMissingException    Refactored message decision logic out of failDueToMissingException into  its own method missingExceptionMessage.
Postpone checkSubConfig logic in ReferenceConfig (#5226)
ignore unstable test test_normal_channel_close_wait_gracefully
enhance consul registry to support matching url between consumer and provider (#4818)
solve compile error
Fixed issue 336 thanks to the patch by the reporter
Add documentation for AndroidLog.
Close all servers/ports after tests finish (#2755)
*** empty log message ***
Split AccessFlagsTest methods to one test per method  Summary: This is making way for a test refactor that expects a single compilation per test.  Test Plan: Existing unit tests  Reviewed By: asp2insp  fbshipit-source-id: f076d84
Ignore test for read-only temp folder on Windows (#1632)
Improve test method name.    Replace `assumeNotNullSingleNullThrowsException` by  `assumeNotNullThrowsExceptionForNullArray` because it is more clear.
Fix a failed unit test on Windows (#1907)    * add demo    * use System.lineSeparator()    * delete my demo class
Polish 'Add Spring Data Web configuration properties'    Closes gh-9339
TestWatcher.skipped(): Make test fail    To show problem of skipped not ignoring failures in skipped-method here is the test - which fails.
Fixed JDK5 backwards compatibility issue    In fixing issue #144 a JDK6 API call was accidentally introduced.  Updated to be compatible with JDK5.
Added test for issue #219
set reference bean definition target type (#5710)    Co-authored-by: quzijing <quzijing@oppo.com>
Use constants to replace literal
remove useless code in MergeableClusterInvoker.java (#5925)
add a null check for safety
deleted extra space
Rename userName parameter to username in Credentials (#3781)
Update JavaDoc for WebSocketListener (#3288)
Update JavaDoc for WebSocketListener (#3288)
Fix encoding set for query parameters
Fix a regression in connection cleanup.    We don't test that connections actually get closed, and this was  broken by a refactoring that dropped close() on Connection.
Fix a concurrency bug in SPDY settings.    We were making a copy of the streams HashMap so that we could  iterate it safely after releasing our lock. But we weren't  actually using that copy when iterating. Whoops!    Fixes https://github.com/square/okhttp/issues/1119
Fix a concurrency bug in SPDY settings.    We were making a copy of the streams HashMap so that we could  iterate it safely after releasing our lock. But we weren't  actually using that copy when iterating. Whoops!    Fixes https://github.com/square/okhttp/issues/1119
check the metadataServiceExporter when exec ShutdownHookCallbacks (#5650)
Remove redundant cast.
Remove redundant cast.
Remove redundant cast.
Polish 'Automatically detect log4j2.properties'    Closes gh-16262
Test proxy disconnecting before sending response headers    Reproduces https://github.com/square/okhttp/issues/4915
Avoiding use of return value of assignment operator.
Responding to review comment
avoids reusing Executor's Thread instances
Add test for dispatcher registration
Improve test method name.    Replace `assumeNotNullSingleNullThrowsException` by  `assumeNotNullThrowsExceptionForNullArray` because it is more clear.
Remove JavaDoc reference to test class.    The test class is no available by JavaDoc.
Delegate to existing deserialization method.
MultipleFailureException cleanup.    1. Avoid creating a message unless getMessage() is called. Most of the time, the message is ignored; EachTestNotifier will create  individual failures for Throwable.  2. Constructor should make a copy of the passed in List  3. getFailures() should return an unmodifiable List
Removed unnecessary @SuppressWarnings
Correcting the collection used when printing out the skipped converter factories when constructing the exception message
Simplify matcher expression in ParameterSignatureTest
[TEST] fix CurrentTestFailedMarker to reset its state after each test  The currently used method `testRunStarted` is only called before any tests have been run, we need to reset that state before each test, that's why we need to use `testStarted`.
Responding to review comment
Add getter for log level.
to meet new onResponse signature: return directly
remove useless code in MergeableClusterInvoker.java (#5925)
enhance consul registry to support matching url between consumer and provider (#4818)
https://issues.apache.org/jira/browse/AMQ-5563  Added fix to update the documentation to reflect correct defaults.
ignore unstable test test_normal_channel_close_wait_gracefully
ignore unstable test test_normal_channel_close_wait_gracefully
Fix a failed unit test on Windows (#1907)    * add demo    * use System.lineSeparator()    * delete my demo class
Add doc for Request.Builder.removeHeader. (#3858)    to note multiple headers may be removed.
Handle 0 or negative request in Buffer
Introduce tests for AnnotatedElementUtils.isAnnotated()  Issue: SPR-11514
Polish 'Align TestRestTemplate Javadoc with documentation'    See gh-21318
add disclaimer and example
Close all servers/ports after tests finish (#2755)
Polishing: remove dead code
Close all servers/ports after tests finish (#2755)
Remove redundant cast.
remove useless code in MergeableClusterInvoker.java (#5925)
