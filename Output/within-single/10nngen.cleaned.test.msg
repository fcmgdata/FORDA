Add test for dispatcher registration
Reinstate required parameter
Polishing: remove dead code
Rename the default BuildInfo task to bootBuildInfo    Previously, the default BuildInfo task created by the DSL was called  buildInfo. Due to Gradle's lack of namespacing for tasks, this meant  there was a slight risk that it could clash with another task. It  also didn't following the naming used by Boot's run task which is  named bootRun.    This commit renames the default BuildInfo task to bootBuildInfo to  match bootRun and to hopefully avoid clashes with tasks from other  plugins.    Closes gh-5518
Rename the default BuildInfo task to bootBuildInfo    Previously, the default BuildInfo task created by the DSL was called  buildInfo. Due to Gradle's lack of namespacing for tasks, this meant  there was a slight risk that it could clash with another task. It  also didn't following the naming used by Boot's run task which is  named bootRun.    This commit renames the default BuildInfo task to bootBuildInfo to  match bootRun and to hopefully avoid clashes with tasks from other  plugins.    Closes gh-5518
Throw EmbeddedContainerExceptions from Undertow    Wrap Undertow start errors in EmbeddedContainerException.    Fixes gh-4205
Polish 'Auto-configure ReactiveStringRedisTemplate if necessary'    Closes gh-16604
Migrate to MockRestServiceServer    Migrate `RestClientTestWithoutJacksonIntegrationTests` to use  Spring's `MockRestServiceServer`.    See gh-17491
Try to prevent Travis build failures    Update LiveReloadServerTests which seems to be failing intermittently  on Travis.
Align test with change to exception in latest Framework snapshots
Suppress deprecation warning in spring-test
Stop using PostConstruct to default session timeout to ServerProperties'    Fixes gh-23716
Allow more time for shutdown result callback to be received    5 seconds isn't always sufficient, particularly on CI where the timing  can be quite variable.
Fix build after SPR-17034 in Spring Framework    Since SPR-17034, the core container now behaves a bit differently when  dealing with `null` beans.    Given a `null` `HandlerMapping` bean named 'resourceHandlerMapping':    * `context.getBean('resourceHandlerMapping', HandlerMapping.class)`  still returns a `NullBean`  * `ListableBeanFactory.getBeansOfType` will return a Map of all existing  beans, not including the `null` ones as values of the map.    Closes gh-13760
Align test with change to exception in latest Framework snapshots
Use currentHealth consistently in getHealth()    Closes gh-9832
Disable unexpected datasource initialization    This commit restore the disabling of datasource initialization that was  accidently removed in db33a75 so that other tests aren't affected by it.
Remove v[N/A] log output
Assign on order to OnPropertyCondition    Closes gh-7144
Deprecated MustacheCompilerFactoryBean    Closes gh-8999
Make tests' detection of SSL handshake failures more robust    Closes gh-12961
Support custom SpringBootContextLoader environment    Provide a `getEnvironment` method in `SpringBootContextLoader` to allow  specialized `ConfigurableEnvironment` implementations to be used.    Closes gh-10740
Use defined Locale for BindFailureAnalyzerTests    Update BindFailureAnalyzerTests so that localized messages are not used.    Fixes gh-6106
Update example for disk space health indicator to use DataSize    See gh-14549
Remove unecessary semicolon
Align test with change to exception in latest Framework snapshots
Use a random HTTP port when running SampleLiquibaseApplicationTests
Disable unexpected datasource initialization    This commit restore the disabling of datasource initialization that was  accidently removed in db33a75 so that other tests aren't affected by it.
Implement BeanFactoryAware to inject BeanFactory    Closes gh-23543
Fix racy ProcedureIT.shouldBeAbleToSpawnThreadsCreatingTransactionInProcedures  Though we join the threads that calls the `supportedProcedure`, that procedure itself did not wait for the tasks _it_ spawned to complete Therefor the test could observe a node count that was less than the tasks it had started  This is no longer possible, because the procedure now blocks until the tasks it submits have finished
apply patch for: https://issues.apache.org/jira/browse/AMQ-3930
Use redirect HTML on Mac.  Safari won't even let you open a file URL without using this redirect hack!   r5436
Revert mistakenly commited FloatingRead phase changes
Refactor parser to use global frame for rules  Summary: This way rule definitions can be reused in multiple environments. In particular this will be used when parsing extension files.  Test Plan: CI  Reviewed By: styurin  fbshipit-source-id: 2cc4640
Fix suspicious method call. #1555  Fixes SuspiciousMethodCalls inspection violation.  Description: >This inspection reports method calls to parameterized collections, where actual argument type does not correspond to the collection's elements type.  For example if you have the following code:  ```  Â Â Â Â List<Integer> list = getListOfElements();  Â Â Â Â list.remove("");  ```  the call to `remove()` will be highlighted.
Check if target file exists before rename  HDFS fails if the target file exists, but other file systems such as the local file system do not (and thus will replace the target file).
[TESTS] Mute SmokeTestWatcherWithSecurityIT tests  Issue tracked in https://github.com/elastic/elasticsearch/issues/35361
Removed useless null check related to CAMEL-8729
No cluster name filtering when sniffing is not enabled, closes #637.
Add toString() to IndexShardGateway
Updated JavaDoc for @TestExecutionListeners.
cancel the keys
Rename row number tests
Moved the test file directory below the target directory
checkstyle rule for inheritdoc & override annotations.
added minor debug logging
handle Compression.NONE in CassandraServer
Updating the RecurisveCallNode to use the new context structure.
AlexeiBarantsev: Run "persistent hovering" test in local environment only.  r17999
- fix for TIKA-1620: OUTPUT_FILE_TOKEN not being replaced in ExternalParser contributed by Pascal Essiembre
[BEAM-1291] KafkaIO: don't log warnig in offset fetcher while closing.  add partition to the message. break when the reader is closed.
Adds a method to get the buffer for a specific index in CompositeByteBuf  This fixes #414
Testing: Try to rebind in case of BindException  Original commit: elastic/x-pack-elasticsearch@e68e156a547da22408bc7806d3d0e3e9f908d06b
handle Compression.NONE in CassandraServer
[java] Deleting unused imports
Removed some code I had commented out but forgot to delete
Remove call to System.out()
Fixing a FindBugs issue related to PR 674
SimonStewart: Backing out change to the firefox driver test suite  r6128
DRILL-4225 TestDateFunctions#testToChar fails when the locale is non-English - Changed to use LocalDate, LocalTime and LocalDateTime to build expectedResults instead of string literals  Closes #311
Polish Javadoc in MutablePersistenceUnitInfo  - Using Javadoc syntax for code formatting instead of JIRA's.
CAS-1162: Removed the line that manually set the response status code. The status code err handling is done by exception and err resolvers.
remove override so it builds on 1.6 as well as 1.7 java
Mute CcrRetentionLeaseIT#testRetentionLeasesAreNotBeingRenewedAfterRecoveryCompletes.  Tracked in #39331.
Removed useless import.
Don't double record stacktrace in Annotated*Exception (#9117)  Motivation: When initializing the AnnotatedSocketException in AbstractChannel, both the cause and the stack trace are set, leaving a trailing "Caused By" that is compressed when printing the trace.  Modification: Don't include the stack trace in the exception, but leave it in the cause.  Result: Clearer stack trace
change indices sig
added a method to identify a classnode as interface
Add a null check to test cleanup
Removed unused import
Replacing Guava with java collections (#2225)
Prefer direct buffer by default  - Because it's faster in most cases thanks to unsafe
Delay layouting CGlobalData until after heap layout is determined
added minor debug logging
[CI] Muting  method testOperationPermitOnReplicaShards in IndexShardTests  Relates to #35850
Fixed issue: NETTY-207 The default datagram broadcast flag is different between transports * Set the default broadcast flag of OioDatagramChannel to 'false'
[hotfix] correct line length to let Checkstyle pass
Minor refactor to structure appending methods in MapBlockBuilder
Fix rebase conflict  Summary: Fixes a conflict that the `isPathWhitelisted` method was removed.  Test Plan: Build
add jmxPort to stress args (ninja)
CAMEL-9102: Added loggingSizeLimit >= -1 validation in setLoggingSizeLimit() to avoid further errors
Load property values using cursor
Made OnlineAuc more pessimistic
clean up visibility and remove unused code in RunCommand  Summary: Just passing by.  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 7891324
ParticleEmitter now resets the active particles too.
Add a test for graph consistency; begin implementing interface for entity linking
Polish the code of NettyConveter
Use APPEND_TO_ZIP instead of OVERWRITE_EXISTING for buck rage reports  Summary: OVERWRITE_EXISTING is inefficient and we should avoid that mode. This diff makes it one step closer to killing it completely. Furthermore, when we bundle files to a buck rage report, we should not overwrite the entries. That would give us incorrect perception of the actual directory state. Instead we should use APPEND_TO_ZIP to get all entries, or THROW_EXCEPTION if we are sure there are no duplicated entries.  Unfortunately, due to how `DefaultDefectReporter.addFilesToArchive` works, we can get duplicate entries even if all the paths are unique because we are stripping off the `.` of hidden files. So the files `.blah` and `blah` would both end up with the same entry name. Another possible collision is if `report.json` is in the list of files to zip as we create an entry with such name from an in-memory structure and not from an actual file. If such unlikely pathological scenario happens, it is better to have both files in the report than only the last one.  Test Plan: buck rage https://our.intern.facebook.com/intern/buck/rage/524538301084026  Reviewed By: marcinkosiba  fbshipit-source-id: c8be1c6
Turn off sanitizer expansion in separate preprocess and compile mode  Test Plan: Manually inspect .i files for excess "/" characters
Don't enforce JZlibDecoder on JDK7+, close #4707  Motivation:  `JdkZlibDecoder` is available since Netty 4.0.8 and works with JDK7+. However, `io.netty.noJdkZlibDecoder` System prop evaluation always defaults to true, causing Netty to always use JZLib when decompressing on the client side when the property insn't explictly set to `false`.  Modifications:  Default to `false` instead of `true` when JDK7+.  Result:  JZLib optional as expected on JDK7+.
Update for Gump now these are known Ciphers
Correct regression in r1742105.
Add contacts field to apple_binary  Summary: This diff adds support for the "contacts" field on the apple_binary() rule.  Reviewed By: dinhviethoa  fbshipit-source-id: 279a797890
add <table> to test output report (see http://forums.openqa.org/thread.jspa?threadID=5427&messageID=15118#15118 for details)  r3607
KAFKA-2813; selector doesn't close socket connection on non-IOExceptions  Patched Selector.poll() to close the connection on any exception.  Author: Jun Rao <junrao@gmail.com>  Reviewers: Guozhang Wang <wangguoz@gmail.com>, Gwen Shapira <cshapi@gmail.com>  Closes #501 from junrao/KAFKA-2813
Use ProcessProperties.waitForProcessExit to wait for server.properties to be written
Added test case for property MAX
beef up Javadoc
Add additional methods to QueryablePipeline
Disable cost calculator if stats calculator is disabled
Add real console  Summary: This makes console events actually get printed to stdout/stderr (the remote execution service can then return them in the output).  Reviewed By: ttsugriy  fbshipit-source-id: 78dea47
Avoid executing code in the static constructor of HotSpotResolvedType.
Removing unused field/method
Enable generating multiple combined projects.  Summary: Since combined projects are now output to a unique directory in buck-out we can generate multiple ones in the same command invocation.  Test Plan: buck project --combined-project target1 target2 Verify both combined projects are generated correctly.
update dcoref test for fixed ssplit
Remove misleading test case for findEndPosition  The test was written when `findEndPosition` did linear search.  Now that `findEndPosition` does bisecting, the test case no longer applies. In fact, it's enough to add 2 more '0' at the end of test input and the test would fail.
clearGui() now calls clearGuiFields() - see Bug 43332
Remove deprecated code
Replace getRuleOptionalWithType..addToIndex with computeIfAbsent in CxxInferEnhancer  Summary: This fixes potentiall race conditions when constructing action graph in parallel.  Also inlined some now trivial functions.  Test Plan: CI  fbshipit-source-id: c52ea80
Add a random date within a specific date range function : Fix checkstyle File does not end with a newline
Fix javadoc example for BigQuery#to()  window.toString() produces characters that are illegal in a BigQuery table name. Fix Javadoc example for BigQuery.to() to generate legal table names.  ----Release Notes---- [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=99943158
updated a javadoc ref
[Test] add awaitFix to rerouteRecoveryTest
Added more methods to CastUtils for Deque as well.
CAMEL-1931 applied patch with thanks to Stan
Added method to clear cache
Dialog, made ignoreTouchDown visible.  All the widgets could use a proper refactoring pass, but not today.
Issue #1555: Add locale to lower case conversion  Fixes `StringToUpperWithoutLocale` inspection violations introduced in recent commits.  Description: >Reports any call of toUpperCase() or toLowerCase() on String objects which do not specify a java.util.Locale. Such calls are usually incorrect in an internationalized environment.
Replace WindowAssignment OldDoFn by FlatMap in Flink Runner  The streaming runner had an OldDoFn that was used for assigning windows using a WindowFn. This is now done with a FlatMap.
sslImplementationName is now handled in the connector create, so no need to do it again (although it is harmless).
adding updates so users can easily save the table data as CSV with 1 click peter
GROOVY-1746: add missing @since
Reduced sleep interval to poll for closed output channels
Summary: KVM - undefine persistent VMs on stop  Detail: A previous patch fixed an issue where we are defining VMs to persist locally on KVM hosts, which can cause issues if the agent isn't running and libvirt decides to start the VM unbeknownst to cloudstack. The previous patch stopped defining VMs as persistent. This patch adds compatibility for existing cloudstack environments, removing the persistent definition on stop if needed.  BUG-ID: CLOUDSTACK-600 Signed-off-by: Marcus Sorensen <marcus@betterservers.com> 1363194656 -0600
set shared variables with configured ObjectWrapper (SPR-7165)
Revert "Set LowResourcesMaxIdleTime in Grid to avoid timeout of 'forever'. Fixes issue 6770."  This reverts commit bfc09170369199101f7b836b610d7595dbc74ae3.
fix for: https://issues.apache.org/jira/browse/AMQ-4559
Only use the PremiumSecondaryStorageResource if VmWare is the hypervisor
Initialize STGroupFile with url, not file path  - absolute file paths not reliable way to find resources on classpath - requires changes to ST4 in this PR: https://github.com/antlr/stringtemplate4/pull/199
#NAME?
LoggingBuildListener: add extra build rule events to whitelist  Summary: This was never updated when these new events were added.  Test Plan: `buck test --all`
Split AccessFlagsTest methods to one test per method  Summary: This is making way for a test refactor that expects a single compilation per test.  Test Plan: Existing unit tests  Reviewed By: asp2insp  fbshipit-source-id: f076d84
Name the BrokerService TaskRunner
always use application ClassLoader
Remove HasSourceUnderTest.  Summary: The target types that these would test support the tests attribute.  Test Plan: CI  Reviewed By: plamenko  fbshipit-source-id: 439d492
Fix test broken by update to encoding. Generally, it is far too difficult to re-encode characters that were encoded in the original URKL when they didn't need to be.
Make testShiftTimestampInvalid NeedsRunner instead of ROS  Currently broken in Apex.
use qualified references in package-info.java javadoc to accommodate limitation in Eclipse
2.x: Expand the documentation of the Flowable.lift() operator (#5863)
Increase error margin based on Gump timing related failures
Rename the constants to reflect current splitting and legacy constants.
Make discovery implemenation config internal
MINOR: SuppressionIntegrationTest should set StreamsConfig.STATE_DIR_CONFIG (#5847)  Sets StreamsConfig.STATED_DIR_CONFIG to temp directory in SuppressionIntegrationTest, to match StreamsTestUtils.  This is a similar fix to #5826.  Reviewers: Ismael Juma <ismael@juma.me.uk>
start migration of security to new executor
GROOVY-2305: Process .getText() GDK method blocks on some operating systems (remove use of Java 1.5 method)
Port patch for 40625.
Minor: server, convert db directory path in unix way
MINOR: clarify the record selection algorithm and stream-time definition (#6128)  The existing javadoc for PartitionGroup is a little confusing. It's relatively important for these concepts to be clear, since they form the basis for stream-time in Kafka Streams.  Reviewers: Matthias J. Sax <matthias@confluent.io>, Guozhang Wang <wangguoz@gmail.com>
improve ByCssSelector#toString  Change the string to a more meaningful "cssSelector". It is also more consistent with the other By's #toString methods.  Signed-off-by: Luke Inman-Semerau <luke.semerau@gmail.com>
Remove unused method in SourcePartitionedScheduler
Add top 100 sql benchmark to suite
Update for Gump now these are known Ciphers
Fix racy ProcedureIT.shouldBeAbleToSpawnThreadsCreatingTransactionInProcedures  Though we join the threads that calls the `supportedProcedure`, that procedure itself did not wait for the tasks _it_ spawned to complete Therefor the test could observe a node count that was less than the tasks it had started  This is no longer possible, because the procedure now blocks until the tasks it submits have finished
Register EPollArrayWrapper to re-run class initialization.
Shuffling from internal-only change. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=60101894
minor corrections to javadocs for new scan/reduce variants (#1835)
Allow several tries to delete a directory as on windows the directory can still be locked while a server process is shutting down
Increase error margin based on Gump timing related failures
Add some tests for annotation values of type Class  Summary: (Reapplying this commit after the stack was reverted; this commit was not related to the failure.)  `StubJar` is going to be gaining the ability to generate stub jars based on `TypeElement`s.  This commit closes some test holes. No bugs found, but good to have the coverage.  Test Plan: New unit tests  Reviewed By: asp2insp  fbshipit-source-id: 4638e1d
Add the 6.7.0 constant to the master branch  Now that the 6.x branch has been bumped to the 6.7.0 version, this commit adds knowledge of the 6.7.0 version to the master branch.
Use Publishers.zip instead of Streams.zip
Modified IfController to turn off caching for FunctionProperty
Dispatch nodes in pipelines executor instead of on the same thread in ConvertingPipeline.getNodeJob  Summary: The result of this change is that the work will be done on a thread in the executor service passed to this pipeline instead of on a current thread which can be from a different executor service.  Reviewed By: bobyangyf  fbshipit-source-id: 1d39908863
Remove transaction from explain plan for indexes  It was previously removed for table writes, but not index joins.
volume-upload: removed hardcoded vhd for Image format check.
Resolve simple method calls to Special invoke kind before processing the invoke.
Remove event scope from RawTargetNodeToTargetNodeParsePipeline  Summary: Parent class (`ConvertingPipeline`) does that already.  Reviewed By: sbalabanov  fbshipit-source-id: 3899296582
Make methods static
Mute testRetentionLeasesSyncOnExpiration  Tracked at #37963
More story in ChannelPipelineFactory
Add getters. Improve Javadoc.
Clean up warnings in Gradle build output
FrancoisReynaud: removing extra import breaking compilation.  r11943
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=45628 Jars that declare no deps should return that deps are satisfied
DefaultJavaLibraryBuilder: Factor out getJavac  Summary: Going to use this in a subclass soon.  Test Plan: CI  Reviewed By: asp2insp  fbshipit-source-id: 0ffbfdd
Await for close of the channels. See #235
CLOUDSTACK-7542:CreateNetworkCmd and CreateNetworkCmdByAdmin both have their own "vlan" parameters.
Differentiate between the top and non-top FrameState bci when computing BytecodePositionWithId.
Start preparing for 2.3.3
Avoid integer overflow when computing maximum cache weight  ----Release Notes---- [] ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=110719783
Add sanity checks
Refine the documentation a little bit more
GROOVY-2305: Process .getText() GDK method blocks on some operating systems (remove use of Java 1.5 method)
CLOUDSTACK-8951: validation for "remote.access.vpn.psk.length"  throwing error for value < 8 and value > 256 right now, 8, 256 are hardcoded in the code. They should be moved to a constant and has to be reused everywhere.
remove silly throws decl
Remove Ignore import
added yield back into dispatch() - but with a counter - so not so much of a performance hog
remove declared serialVersionUid
Remove unused operator dependency
Add missing transferToInterpreterAndInvalidate
ignoring the mutex for shutdown causes sporadic failures in open-wire
add simple way to get the index creation version when building a mapper
remove the listnetwork, which causes mgt server uses 100% cpu, if you have 600 records in networks table
add @Override annotation
Also look for private test methods
Re-enable the ForsetiFalseDeadlockTest that was unflaked in e80c33b586929e9ec1c69b7a41fab0197450bc25
Pass correct number of expected shards to assertion
Correct mistake, that was introduced with r1719666.
Empty string = default
Allow to disable TraceClassInitialization
Further fix for BZ 57172 - followup to r1640087 (r1640084 in trunk). Be consistent with "webappClassLoader.stopped" message handling and throw an ISE from findResourceInternal  In all call chains (findClass() / findResource() public methods) there is a checkStateForResourceLoading()/checkStateForClassLoading() check at the start of that public method, so it is unlikely to hit an ISE here unless there is some kind of race.  Throwing an ISE is a more consistent behaviour, and calling a common method is better than a custom rarely used if() block.
Need to generate a MessageHandler for primitives
Deprecate unused method with non-standard name (which FindBugs doesn't like)
Add missing @JsonProperty annotation to session source field
Refactoring CalculateClassAbi  Summary: implement `AbstractBuildRule` instead of `AbstractBuildRuleWithDeclaredAndExtraDeps`  Reviewed By: cjhopman  shipit-source-id: 4884a29b20
Remove invalid auto-generated import.
resolve hudson intermittent failure, jetty acceptor uses a thread pool such that it does not accept immediatly, a wait or yield is needed before connecting to ensure the listener is active, extending this wait to 1second from the .5 second and adding a yield just in case
Remove explicit printing of error stack traces in RegexParser static init
Fixed issue on deletion of null records
Don't try restoring empty data (e.g. Java Request) Set type to TEXT if response Data set to error message
- fix for TIKA-1620: OUTPUT_FILE_TOKEN not being replaced in ExternalParser contributed by Pascal Essiembre
remove the listnetwork, which causes mgt server uses 100% cpu, if you have 600 records in networks table
Remove spaces.
Fixed CS for Camel-CDI
Standalone runner expects path.home to be set  With elasticsearch 2.0, `path.home` must be set now. Standalone Runner (test) is using elasticsearch CLI which relies on `Environment` to be set.  It produces now:  ``` Exception in thread "main" java.lang.IllegalStateException: path.home is not configured     at org.elasticsearch.env.Environment.<init>(Environment.java:99)     at org.elasticsearch.node.internal.InternalSettingsPreparer.prepareEnvironment(InternalSettingsPreparer.java:85)     at org.elasticsearch.common.cli.CliTool.<init>(CliTool.java:107)     at org.elasticsearch.common.cli.CliTool.<init>(CliTool.java:100)     at org.elasticsearch.index.mapper.attachment.test.standalone.StandaloneRunner.<init>(StandaloneRunner.java:170)     at org.elasticsearch.index.mapper.attachment.test.standalone.StandaloneRunner.main(StandaloneRunner.java:175)     at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)     at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57)     at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)     at java.lang.reflect.Method.invoke(Method.java:606)     at com.intellij.rt.execution.application.AppMain.main(AppMain.java:140) ```  Closes #167.
Enable generating multiple combined projects.  Summary: Since combined projects are now output to a unique directory in buck-out we can generate multiple ones in the same command invocation.  Test Plan: buck project --combined-project target1 target2 Verify both combined projects are generated correctly.
Added to mock javadoc about the situation for expect no messages
removed system logging
Use constants when caching empty arrays  Reduce cache memory consumption by using a single constant for empty arrays.
CAMEL-6262 clean up the code
Null safe closing of SearcherManager in dropping FailedIndexProxy  Super class of DeferredConstraintVerificationUniqueLuceneIndexPopulator, LuceneIndexPopulator, is already safe against calls to drop() even in the absence, or failure, of create(). This commit makes DeferredConstraintVerificationUniqueLuceneIndexPopulator safe as well.
Add unit test for conditional elimination of IntegerTestNode.
expose all brokers registered
Added an unit test according to the user mailing list
Update the Receipts test with a delay to prevent occasional failures.
forgot to add getParentNode() to FactorybuilderSupport
Suppress deprecation warning in spring-test
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=39013 When testing for invalid docBase, test for an exact match with the appBase dir
attempt to fix wal shoutdown issue
add @Override annotation
bug 14564: Upon management server startup, for detected inactive management server (based on timestamp), perform ping-test before we really mark it as down  Reviewed-By: kelven
CAMEL-10043: Camel-Jaxb: objectFactory is never checked. This leads to performance degradation. Default ObjectFactory values set to false on DataFormat too.
Remove unused import
Makes it easier to launch activemq from an IDE in debug mode.
SimonStewart: Make the IE driver consistent with the chrome and firefox drivers  r10506
Correctly set the destroyed flag
Make logging for NPE in removeUnfinishedCompactionLeftovers more useful  Patch by jmckenzie; reviewed by ayeschenko for CASSANDRA-8544
Add some timing information
Remove extra space after open parenthesis in InstanceConnectionInfo#toString.  This closes #416
bug 9891: update network_id for ExternalFirewall and ExternalLoadBalancer device_types status 9891: resolved fixed
[hotfix][network] Simplify SingleInputGate#isFinished  Previous implementation of #isFinished was not only checking whether the input gate is finished, but also if it was closed. This commit simplifies #isFinished to just check whether the input gate is finished. The only difference is that the following scenario:  inputGate.close() inputGate.isFinished() (2)  before this change (2) would return true, now it will return false. This potentially could be relevant, because TaskCanceller is calling InputGate#close, however it doesn't relay on #isFinished().  Any InputGate's user after accessing InputGate#get/pollNextBufferOrEvent would still get an IllegalStateException("Released") both before and after this change, so changing/simplifying #isFinished() implementation from "isFinishedOrClosed()" as it was before to just "isFinished()" shouldn't matter.
Revert MetadataProviderFactory  Summary: msg  Reviewed By: aiked  fbshipit-source-id: 4cfe3846e6
CAMEL-6586: Added missing JMX attributes to seda endpoint. Thanks to Zemian Deng for the patch.
Simplify visitSearchedCaseExpression in AggregationAnalyzer
reuse a shared UrlPathHelper instance in order to avoid reinstantiation overhead (SPR-7269)
Update ChannelConfig.java  {@link ByteBufAllocator} -> {@link MessageSizeEstimator} on https://github.com/netty/netty/blob/4.0/transport/src/main/java/io/netty/channel/ChannelConfig.java#L248
Fixed CS for Camel-CDI
Unused import removed
Changed use of AssertThrows to @Test(expected = ...)
Document the behaviour without passive voice
Make tests' detection of SSL handshake failures more robust    Closes gh-12961
Add private gateway IP to router initialization config
Add missing ExplodeLoop to LLVMX86_64BitVAStart node
Fixed the issue of takeLast(items, 0)
CLOUDSTACK-7348 InvalidParameter Exception while executing scale vm.  We do not throw the exceptions any more, so added info in the logs to say what happend to this command.  Signed-off-by: Rajani Karuturi <rajanikaruturi@gmail.com>
Deprecate unused method with non-standard name (which FindBugs doesn't like)
Align implementation with docs. nonceCacheSize should be configurable
Added `function` to javascript keywords
Use the builder's FirefoxBinary, if specified.  In particular, don't construct a new, default FirefoxBinary if a specific FirefoxBinary was already provided.
Camel-Jpa Component docs
update dcoref test for fixed ssplit
AwaitsFix GeoShapeQueryTests#testPointsOnly #27454
Dialog, made ignoreTouchDown visible.  All the widgets could use a proper refactoring pass, but not today.
Include path name in error when directory listing fails
improve can't open sstables from the future message patch by stuhood; reviewed by jbellis for CASSANDRA-2133
Refine GPathResult's equals and hashCode
Remove unnecessary casts and comment that does not make sense
AwaitsFix GeoShapeQueryTests#testPointsOnly #27454
getRotation for livewallpaper  But it's little bit buggy, don't know why. If you place your device to 0 degrees position (portraite orientation)  and rotate to 180 degrees, nothing be detected, or from 90 to 270 and  versa. But if you rotate your device from 0 to 90 or 270, or from 90  to 180 and 0 and so on - all is fine (different orientations).
Expose plugin name in a public constant  closes elastic/elasticsearch#27  Original commit: elastic/x-pack-elasticsearch@3410ca2e3d87463295f88a5718a0a2f5cb55ec8c
include offset when logging about committing offsets
Simplify. Re-name method that no longer actually initializes any ciphers.
Mute MlDistributedFailureIT#testFullClusterRestart()  Relates elastic/elasticsearch#25415  Original commit: elastic/x-pack-elasticsearch@01fa0e76014d0c1281370521d09db82238129c7e
Added method to clear cache
bug 9127: intermediate checkin for agent load balancer
Remove unused Jersey annotations.
Remove an unnecessary empty line
Add queries that fail before starting to expiration queue  This was a bug introduced in https://github.com/facebook/presto/pull/1917
Remove redundant isNaN check
Try to occupy at most around 1GB of disk space for the raft logs
Fix AndroidBinary runtime deps  Summary: When exo-for-resources is enabled, AndroidBinary should have runtime deps on all of the the exo resources. Fix that.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: 48d7a47
apply patch for: https://issues.apache.org/jira/browse/AMQ-3930
make ByecodeDisassembler more robust
Very minor fix in error handling path for the -o command line option.  If the specified output path was a file and not a directory, the error handling intended to invalidate outputDirectory, but due to an apparent copy-paste error, it invalidated libDirectory instead.
Improved warning if no properties found
add auditing support to saml2 for responses
Improve subscription removal in SubscriptionRegistry  Avoid using destination pattern based search when removing sessions or subscriptions from DefaultSubscriptionRegistry and use only session and subscription ids.  Issue: SPR-11930
mark source as "safe" when copying it over
Remove parameters on HandshakeResponseHandler (#27444)  This is a followup to #27407. That commit removed the channel type parameter from TcpTransport. This commit removes the parameter from the handshake response handler.
Synchronize access to reservedBytes and reservedRevocableBytes
When reading trees via PennTreeReader, add tags to the leaves if possible
minor refactor and remove checkstyle warnings
improve ByCssSelector#toString  Change the string to a more meaningful "cssSelector". It is also more consistent with the other By's #toString methods.  Signed-off-by: Luke Inman-Semerau <luke.semerau@gmail.com>
Fix a regression in ChannelInboundMessageHandlerAdapter  - Should forward the unsupported message to the next inbound buffer rather than the next outbound buffer.
include all mode setting messages at debug level
Changed ip for testing refused ldap connection
Make MasterClient connection errors be logged as debug instead of info  They are rather low-level, benign, and have little context attached. They sound scary, but people should really not worry about them.
Change HashCode from 32-bit to 8-bit minimum in docs. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=39493754
Remove unused import from o.e.c.h.MessageDigests
added constructor to FailedToCommitException
Increase the test timeout for PageCacheTest#rewindâ¦
Add missing header in RetryTests
Added more HTTP header constants useful for MIME representation
Fixed CS for camel-script
SimonStewart: Improving the docs for the FindBy annotation  r9448
[hotfix][java] Add missing space to error message  This closes #4944.
minor refactor for easier debugging
added AbstractClassAndInterfaceTest to the suit
Add license header. Reported by Benoit Wiart.  Bugzilla Id: 58899
Add multicast plugin to plugin manager official list of plugins  See #13027
Add cxx output path validator in CxxPreprocessAndCompile  Reviewed By: aiked  fbshipit-source-id: aa33b6d71c
Line too long  Make checkstyle -- and me -- happy. Relates to #397 Bugzilla Id: 62672
Make Parser.buildTargetGraph private  Reviewed By: bobyangyf  fbshipit-source-id: e58c462
Remove obsolete comment about multimap fitting into memory.
[Build] @Nullable annotation is not applied to primitive types.
fixed issue on push of distributed configuration for not active sessions.
Adding unreleased 5.6.4 version number to Version.java
Added javadoc for setter in endpoint
Mute ShrinkIndexIT  This is tracked at https://issues.apache.org/jira/browse/LUCENE-8318
Remove missWithTargetGraphHashMatch from ActionGraphEvent  Summary: dead  Reviewed By: styurin  fbshipit-source-id: fb459921a7
bug 13023: fixed listAccounts to return all accounts the user is authorized to see status 13023: resolved fixed
Extend CanonicalizeExpressions optimizer to rewrite filter in Join
Fixed problem on JSON parsing
beef up Javadoc
Remove unused variable
Remove unused imports
Add toString() to IndexShardGateway
Update Version.V_7_4_0 to use Lucene 8.2.0  Updating lucene to version 8.2.0 for 7.4 bwc
Remove running split info before completing its finishedFuture  ListenableFuture::get is listening on the finish of split. If a running split info is removed after it has been set to finished, There may still have remaining running split info alive. This can fail the unit test due to race.
SimonStewart: Putting back the exceptions thrown on setup  r13147
Lwjgl2 backend displayMode tweaks  Seems that getDisplayModes(Monitor) only returns the getDisplayMode() result which in turn getDisplayMode() doesn't return the current mode but the initial one that was the window created with (using getDesktopDisplayMode())
Added root cause exception to IGD static initializer.
Removed unusued import
Categorize RejectedExecutionException in StateMachine
bug 7689: whilst editing pod, we were not calculating the netmask if the netmask is not passed down from the UI. Re-calculating the netmask, based on pod attribs in db status 7689: resolved fixed
Remove unused code
No need to use an unreleasable buffer - just wrap an array
add @Override annotation
Database factory now accepts graph types
Fix a bug where DefaultPromise.toString() says 'incomplete' when it's done  Motivation:  DefaultPromise.toString() returns 'DefaultPromise(incomplete)' when it's actually complete with non-null result.  Modifications:  Handle the case where the promise is done and its result is non-null in toString()  Result:  The String returned by DefaultPromise.toString() is not confusing anymore.
Added test case for property MAX
Clarify the format supported by @PropertySource  Issue: SPR-16563
WW-3892 updates JavaDoc to match the implementation
change name from T.g4 to X.g4 to avoid weird classloader issue. TLexer lives somewhere in my damn system and I can't find it.
Fixed a compilation error
The NIO connector is hard-coded to use the JSSE SSL implementation so just use it directly. This patch allows the JSSE dependency in the SSL abstraction to be removed (this will be in a later patch).
move slow mode implementation to selenium-rc; switch from bool arg to an integer giving the number of milliseconds to pause between operations  r3219
added JAX-WS workaround for WebLogic 10.3 (SPR-5771)
[CALCITE-1420] Allow Calcite JDBC Driver minor version to be greater than 9
MINOR: Add toString implementations to Subscription and Assignment  Author: Jason Gustafson <jason@confluent.io>  Reviewers: Ismael Juma <ismael@juma.me.uk>  Closes #1354 from hachikuji/minor-add-missing-assignor-tostrings
[hotfix][tests] Fix job-cancellation check in ResumeCheckpointManuallyITCase
Summary: KVM - undefine persistent VMs on stop  Detail: A previous patch fixed an issue where we are defining VMs to persist locally on KVM hosts, which can cause issues if the agent isn't running and libvirt decides to start the VM unbeknownst to cloudstack. The previous patch stopped defining VMs as persistent. This patch adds compatibility for existing cloudstack environments, removing the persistent definition on stop if needed.  BUG-ID: CLOUDSTACK-600 Signed-off-by: Marcus Sorensen <marcus@betterservers.com> 1363194656 -0600
Remove sleep in busy wait in refreshBricks()  Operations in PWP are very fast, making any sleep potentially wasteful.  Instead do a busy wait.
patch for https://issues.apache.org/activemq/browse/AMQ-1898
Distributed: fixed CCE on tx fix
Issue #2604: Refactoring of SingleLineJavadoc to resolve LocalVariableName violation
Camel-AWS Lambda - Use Regions.valueOf in the verifier
Patch by Sylvain about concurrency problem in watch dog class
Removed useless import.
Minor: server, convert db directory path in unix way
minor improvement in object creation
Remove invalid auto-generated import.
attempt to fix wal shoutdown issue
[hotfix] [core] Small improvements to DataOutputSerializer
Issue #1243: Suppress test class with unused fields
Simplify implementation of Commector.setProtocol() - swap outer and inner if() - consistent handling of null value
Do not allow zip_file to have deps  Summary: Nothing is actually using `deps`, there is no reason to have it.  Reviewed By: mykola-semko  shipit-source-id: e660e7aad6
Recommend I18N version
Log the unsanitized redirect URL to facilitate abuse investigations.
Update SDK to correctly set replaceJobId on the Job.  ----Release Notes---- Update SDK to correctly set replaceJobId on the Job instead of the Create request.  [] ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=99302893
Document use of getLabelResource vs getStaticLabel
Register all the installed file system providers at image build time.
HHH-6543 change JBoss TM jndi string to java:jboss/TransactionManager
[hotfix] Remove old sysout debug message in UdfAnalyzerTest
Replaced the ThreadLocal<LocalCompilation> with a map.
limit logging in OutOfProcessIsolatedBuilder.java  Reviewed By: cjhopman  fbshipit-source-id: 2ec1a6eb03
WW-3815: Dispatching after action phase renders with different stack/TextProvider
Log the unsanitized redirect URL to facilitate abuse investigations.
commented out test failing nightly snapshot
Do no call Reference.get() because subclasses can overwrite it
Optimize AbstractArrayBlock.writePositionTo  This avoids several object allocations that occur in getObject()
Fixed potential race condition in the updated version of ArrayMap.
CAS-1422 SamlUtils Should Restrict DocType Declaration and Entities via Feature Disabling
Get methods for transform and projection matrixes, to match SpriteBatch.
Fixes Logging usage  log line had an extra parameter
Make field STANDARD_ESCAPES final
Revert "[TEST] Enable trace logging for translog recovery"  This reverts commit 52d53e658f786d1e0717c3f63676de00426599cb.
Revert rev 1430160 as then camel-manual cannot build.
AlexeiBarantsev: Adding tests for fix to #4800 to Java binding  r18200
Extend CanonicalizeExpressions optimizer to rewrite filter in Join
Remove running split info before completing its finishedFuture  ListenableFuture::get is listening on the finish of split. If a running split info is removed after it has been set to finished, There may still have remaining running split info alive. This can fail the unit test due to race.
remove infinite loop
added minor debug logging
[hotfix] Suppress restarts if rescaling operation fails
Fixing issue #5079 (FluentWait.until(Predicate) method does not propagate predicate message). adding toString method to the constructed Function when doing FluentWait.until(Predicate) so that it can be picked up in the exception message
GROOVY-2305: Process .getText() GDK method blocks on some operating systems (remove use of Java 1.5 method)
SimonStewart: Putting back the exceptions thrown on setup  r13147
fix NPE on function invocation
[TEST] adds TRACE logging to org.elasticsearch.snapshots for the SharedClusterSnapshotRestoreIT#testDataFileCorruptionDuringRestore test
add iterator based on specific index
Add a null check to test cleanup
add iterator based on specific index
Make private vars final
minor corrections to javadocs for new scan/reduce variants (#1835)
Increase randomness in SocketUtils
option annotation processor ensures that a non-empty help message starts with a capital letter
Remove unnecessary null check (Eclipse is getting better at following complex code paths)
let it consume EOF since we sometimes need to match that during prediction
Distributed tests: writerCount is configurable now
Add queries that fail before starting to expiration queue  This was a bug introduced in https://github.com/facebook/presto/pull/1917
Support OnSetProducer/Request Changes
Add missing header in RetryTests
removed a usage of ResolvedJavaType.toJava()
Throw exception on ping from another cluster  When we receive a ping from another cluster, we should throw an exception so as to not leak the channel.
StringDecoder.decode() should be protected
Summary: Remove unused createFileBasedStoragePool from LibvirtStorageAdaptor  Signed-off-by: Marcus Sorensen <marcus@betterservers.com> 1363154115 -0600
Removed unused import
Remove unused code identified by the UCDetector
Camel-Exec: Use BindToRegistry where possible
fixed issue869 by changing BitmapFont.computeVisibleGlyphs() method to use a float width instead an int width, now the three render cases (label, bitmapfont and bitmapfontcache) seem to behave correctly
fix possible problem when trying to convert a binary format to a string
Minor: changed log message
Use static field instead of new array
Synchronize assignment to compilation task.
Improved javadoc for DSL
wait for status should wait for at least that provided status, for example, waiting for status yellow should return if the status is green
Added test logging
If no classes found, show what to look for
Baremetal: bypass HA, only track VM status
KAFKA-4944; Fix an "unread field" findbugs warning in streams examples  Author: Colin P. Mccabe <cmccabe@confluent.io>  Reviewers: Michael G. Noll <michael@confluent.io>, Ismael Juma <ismael@juma.me.uk>  Closes #2727 from cmccabe/KAFKA-4944
DanielWagnerHall: Disable Android tests until android support lands  r13384
Also closes the executor containing the connections
Cleanup TimeOutChecker threads  When a Aggregator route is stopped, only the AggregateRecoveryChecker threads are stopped and not the AggregateTimeoutChecker threads. They keep lingering around .
Set current JVM version as 1.8(3.0.0+ Only)
KAFKA-6999: Add description on read-write lock vulnerability of ReadOnlyKeyValueStore (#5351)  Reviewers: Guozhang Wang <wangguoz@gmail.com>
recreating gh-69, next step is to solve it.
Increase max arguments to zip function to 5
ApiConstants: add Api constant registered  Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>
Have pac4j delegatedClient endpoint accept HTTP POST requests (#3860)  * Have pac4j delegatedClient endpoint accept HTTP POST requests  * Limit the valid HTTP methods to GEt and POST
Prefer direct buffer by default  - Because it's faster in most cases thanks to unsafe
Updating to the new codebehind interface WW-1715
Quick grammar fix.
Fix repeating message when there are no hints to compact  Patch by carlyeks, reviewed by brandonwilliams for CASSANDRA-8247
Wrong pointer - those tables were moved to ChannelEvent
TIKA-247: parse language and category from MS Office properties  Patch contributed by Daan de Wit.
Verify that control flow graph is valid after partial evaluation  Otherwise the error will be reported later in the compilation pipeline, which is confusing.
Needs to be volatile as it is used in double checked locking
Fixed a test which failed if REL_GRAB_SIZE was set to 1... the test wasn't written properly
Make implicit null check conversion more conservative.
Clean up confusing error message on unhandled endpoint  It currently returns something like:  ``` "No feature for name [_siohgjoidfhjfihfg]" ```  Which is not the most understandable message, this changes it to be a little more readable.  Resolves #10946
Fix excessive concurrency when running tests with buck internal test runner  Summary: I inadvertently increased concurrency of tests run with buck internal test runner.  It used to be limited by virtual cpu resoures (num processors), but my changes caused it to be no longer resource aware, and it was running with the concurrency equal to number of threads in the pool instead. This is usually higher than num processors. This contributes to test flakiness.  A more comprehensive fix will come in the future.  Test Plan: visualscrutiny  fbshipit-source-id: cea07c4
Removed unused import.
painless: Add Jack's test
HHH-2879 - add an actual api for loading an entity by natural candidate key (mapped natural-id)
Added root cause exception to IGD static initializer.
[Grid] Removing unused import.
Revert "Exploit DiscoveryNode immutability..."  This reverts commit e76038e076bb66fd4deac62cd8f2ffd9d423cea6.
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=53993 Avoid NPE when the session is invalidated
rbd: Make secret usage names unique for all pools  Since only the cephx user like 'admin' was passed we couldn't define two RBD storage pools using the cephx user admin, even if they were running on different Ceph clusters.  By adding the monitor hostname and poolname to the secret's usage (which we don't even use) it becomes unique.
Add log message to link cache misses to actual rules  Summary:It's really hard to figure out what rule corresponds to a cache miss, from just looking at the logs. We log this for success, let's do it for failure too.  Test Plan: Manual inspection of logs.  Reviewed By: marcinkosiba  fb-gh-sync-id: 4dd0ef5 fbshipit-source-id: 4dd0ef5
Correctly detect LastHttpContent after encoding
fixed bug, expected and update was swapped.  Original commit: elastic/x-pack-elasticsearch@78e42879be3249eb02f54dcb3b03fa51465b8288
fetch phase in search sould return the full name of the field, and not just the name
Minor: server, convert db directory path in unix way
Null safe closing of SearcherManager in dropping FailedIndexProxy  Super class of DeferredConstraintVerificationUniqueLuceneIndexPopulator, LuceneIndexPopulator, is already safe against calls to drop() even in the absence, or failure, of create(). This commit makes DeferredConstraintVerificationUniqueLuceneIndexPopulator safe as well.
Add unreleased 5.6.5 version number
Fixed key repeat when losing focus.  closes #3083
Increase socket timeout in an effort to reduce false failures on buildbot
Added an unit test according to the user mailing list
[TEST] adds TRACE logging to org.elasticsearch.snapshots for the SharedClusterSnapshotRestoreIT#testDataFileCorruptionDuringRestore test
Add test for count with boolean argument
handle Compression.NONE in CassandraServer
remove the listnetwork, which causes mgt server uses 100% cpu, if you have 600 records in networks table
No logical changes - removing unused `static` and adding whitespace
In ConditionalEliminationPhase, check whether a ValueNode does record usages; caused crashes in FastR
Removed a superfluous import
actually return SlicePredicate
Converted to JUnit4 because of CI hangs, see AMQ-5021
SimonStewart: Delete some sysout debugging  r16854
returned an exception in case the custom serializer is not present on unmarshalling of index definition
Log warning when non-printable characters are detected in redirect URL.  Add documentation to sanitizeUrl method.
AMQ-6958 Configure the AMQP Max Frame Size by default  Configure a value of 128KB for AMQP max frame size by default to improve overall performance and provide a limit on delivery size before chunking begins.
Add inline comment to prevent confusion
Mute CcrRepositoryIT#testFollowerMappingIsUpdated  Tracked in #37887.
Avoid use of double constructor of BigDecimal  Codacy warns about an Error Prone [1] use of the double constructor of BigDecimal in tests. The reason given is that it is a source of precision loss if the number does not have an exact double representation. The recommendation is to use the String constructor of BigDecimal instead as it does not require using a lossy argument.  This commit contains the following changes:   - replace usage of the double constructor of BigDecimal with the    String constructor of BigDecimal in JdbcTemplateQueryTests  - update the copyright year   [1] http://errorprone.info/bugpattern/BigDecimalLiteralDouble  Issue: SPR-15077
Log compaction before we commit the transaction
use same method names everywhere
Do not using static finals for PID and format    Update SimpleFormatter so that the PID and format can be different per  formatter instance.
JasonLeyba: Set the Content-Type header so the server UI renders correctly in every browser.  r18152
fix issue on schema snapshot managment for schemafull documents.
server: fix NPE case in VolumeApiServiceImpl  Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com> (cherry picked from commit df934c954106a618f8b0aca7e7dfbac890d78244) Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>
Summary: KVM - undefine persistent VMs on stop  Detail: A previous patch fixed an issue where we are defining VMs to persist locally on KVM hosts, which can cause issues if the agent isn't running and libvirt decides to start the VM unbeknownst to cloudstack. The previous patch stopped defining VMs as persistent. This patch adds compatibility for existing cloudstack environments, removing the persistent definition on stop if needed.  BUG-ID: CLOUDSTACK-600 Signed-off-by: Marcus Sorensen <marcus@betterservers.com> 1363194656 -0600
findElements should return empty list if there are no elements (not a timeout exception). Fixes issue 5278
Make implicit deps for caching in CxxLibrary thread safe  Summary: Addresses potential thread safety issue during parallel action graph construction.  Test Plan: CI  Reviewed By: ttsugriy  fbshipit-source-id: 99b45fc
moving dependencies around
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=47987 Limit size of not found resources cache
always print stacktrace if it makes us crash
add @Override annotation
Add test case for SELECT (TRAVERSE) checking for $depth
[hotfix][runtime] Delete unused method DispatcherResourceManagerComponent#getTerminationFuture
CLOUDSTACK-7283: listUsers - for regular user, only return the caller info. If there are more users under the same account, their information should never be returned
Fixed potential race condition in the updated version of ArrayMap.
Added check for async query with no listener set
fix memtable thresholds better patch by Erik Foralsrud; reviewed by jbellis for CASSANDRA-2158
Removed "portletSupportActive" which is no longer needed.
ArrayCopySnippets: remove unused constants
[SQL] Make schema in HCatToRow final
Add integration tests  Closes #36.  (cherry picked from commit f2c83df)
Remove some dead-code and cleanup
Added ignore on the CamelSpringJavaconfigTest as it need to be run with Spring 3.x
Added check for async query with no listener set
Be ready for null value being returned
RemoteWebDriver should not add its own information to the recreated server exception, it makes harder to read exception messages.
Follows changes in GraphDatabaseSPI (getGuard() added)
Skip test on CI server
Simplify visitSearchedCaseExpression in AggregationAnalyzer
Add Android bootclasspath to environment for class preprocessing genrule  Summary: The new Dextr JVM rewriter needs the Android bootclasspath to follow inheritance chains. Add it to the environment for the preprocess_classes step.  Test Plan: Patched an older version of buck. Replaced `preprocess_java_classes_bash` with `echo $ANDROID_BOOTCLASSPATH && env && exit 1`. Confirmed it was there.  I'd like to check against buck master but fbandroid fails to build with android_library got an unexpected exported_deps which I'm pretty sure is not my fault.
CAMEL-2297 Checking the CamelContext in MainSupport to avoid no CamelContext to be loaded
commented out test failing nightly snapshot
Cleanup IndicesService#CacheCleaner Scheduling (#42060)  * Follow up to #42016
Replace getStaticLabel with getLabelResource
Correctly detect LastHttpContent after encoding
Remove unnecessary synchronized block
Adapt to renaming of RestTestCandidate
Remove test for default implementation of toString(). #1555  Fixes `ObjectToString` inspection violations in test code.  Description: >Reports any calls to .toString() which use the default implementation from java.lang.Object. The default implementation is rarely desired, but easy to use by accident. Calls to .toString() on objects of type java.lang.Object are ignored by this inspection.
GraphBuilder: remove hack for obtaining profile information of unique subtypes  let's see how it affects performance
Buck plugin disable buttons if server isn't connected  Summary: Disable all actions if the server isn't connected, since we may lose information if we don't get the messages  Test Plan: Tested by connecting/disconnecting from the server.  Reviewed By: jimpurbrick  fbshipit-source-id: 71b6965
Easy: Add build date and commit revision to log  Summary: We're getting bug reports from users where it's not clear exactly what revision of Buck they're running.  This adds the build date and commit revision to the log.  It looks like this:    [com.facebook.buck.cli.Main] Starting up (build date 2014-10-16   13:55:56 -0700, rev 6476c6a9564c0fef7f30b96ef5278e8426298b32), args:   [build, buck]  Test Plan: buck build buck, saw above message in logs
Allow to disable TraceClassInitialization
Tidy up getting headers in HttpMessage  This makes `getHeaders(String)` properly case-insensitive.
ShadowingClassLoader can be constructed without default excludes  Issue: SPR-15439
Do not use SauceDriver to check the effective platform as that will fail when running locally
canonicalize a LoadField on a null constant object to deopt
Dispatch nodes in pipelines executor instead of on the same thread in ConvertingPipeline.getNodeJob  Summary: The result of this change is that the work will be done on a thread in the executor service passed to this pipeline instead of on a current thread which can be from a different executor service.  Reviewed By: bobyangyf  fbshipit-source-id: 1d39908863
Add test for dispatcher registration
AwaitsFix testCorruptFileThenSnapshotAndRestore  Tracked at #36526
Add periodic output from slow-running IR stats evaluator
Removing duplicated import  Original commit: elastic/x-pack-elasticsearch@1618ec79d4c8cafb639d4cfc0bb2e9afea3e1ae2
Remove duplicated `appendToRuleKey` method from `JavaLibrary`.  Summary: There's no need for this to also be on the interface, since all implementations extend `AbstractBuildRule`.  Test Plan: buck test --all CI
Bug 53782 - Enhance JavaSampler handling of JavaSamplerClient cleanup to use less memory  First improvement, store only necessary objects Bugzilla Id: 53782
Disable test as this let fail the build 80% times on osx and slow linux servers. Need to investigate
CLOUDSTACK-8250: host cpu memory used reported incorrectly in host stat
kvm: Remove hardcoded 'cloud' qemu binaries for Hypervisor detection  With the upcoming Apache release we don't ship custom Qemu builds.  libvirt should provide us with the correct information.
add sanity test for masterslave scheme for networkconnectors
remove leftover forceDump call
Profiler:  Counter.TimeKind now public
Adding unreleased 5.6.4 version number to Version.java
DRILL-2079: Use AllocationHelper to allocate memory for vectors.
Make iterator static
Removed unused import in Camel-Slack
CAMEL-13243: Spring Main supports Spring IoC for route builder classes.
Tests: add an awaitFix to IndicesLifecycleListenerTests
Add getPages method to PagesIndex
"data.sql" instead of "test-data.sql" (SPR-6020)
Remove duplicate documentation
Added maximised monitor handle
Fixing concurrent exception with the shutdown method
CAMEL-2203: Add delegate option for setTestConnectionOnStartup on JmsComponent for convenience
Added new test case with IN operator and ()
Updating to the new codebehind interface WW-1715
make getThisTaskIndex and getComponentTasks consistent
Fix FatJarMain to use case insensitive env variables on Windows  Summary: Env variables are case insensitive on Windows, fixing `FatJarMain` to search for a variable ignoring the case.  Reviewed By: LLITCHEV  fbshipit-source-id: a43f2140f4
add cleanup of delegate factories on shutdown
Test: RecoveryFromGatewayTests.testReusePeerRecovery - increase concurrent recoveries  To speed up the test and prevent ensureGreen() from timing out.
add iterator based on specific index
test: evaluate if this prevents the data loss that causes no alerts being loaded.  Original commit: elastic/x-pack-elasticsearch@611f3df8163e10e871b55688bbf3f7e05836d539
Remove extra space after open parenthesis in InstanceConnectionInfo#toString.  This closes #416
avoid recompiling a method already compiled by Graal
use constant evaluator for insert value constant evaluation
back out bamboo build hack in stages
Deprecate unused method with non-standard name (which FindBugs doesn't like)
Add missing @JsonProperty annotation to session source field
remove unnecessary vararg argument in PooledByteBufAllocator (#8338)  Motivation:  No need in varargs, the method always accepts array.  Modification:  ... replaced with []
Avoid multiple calls to writeInternal()
ODocument.fieldNames() now returns a Set<String> instead of String[]. This avoid the creation of an array when you need to iterate over the fields.
Add test for count with boolean argument
bug 13679: cosmetic fix to remove NPE warning message from log. Reviewed-By: anthony
Precalculate the port to use and extend the existing race a little
Patch by MeBigFat@gmail.com to fix issue 337 about loop in OLazyObjectMap.containsValue()
Add test for count with boolean argument
Replace getStaticLabel with getLabelResource
Add regression test for #670
Implemented the changes proposed by kcooney:    1) Now passing classes.length to the constructor of ArrayList  2) Code style adjustment (no spaces before the = in an assignment)
Fixed issue #2030 about Backup with files >2GB (critical)
Add tests for ImportSelector meta-data  Issue: SPR-12059
testCorruptTranslogTruncation: add logging
ServletServerHttpResponse specifically checks for Servlet 3.0's HttpServletResponse.getHeader(String) method  Issue: SPR-11712
Add private gateway IP to router initialization config
improve ByCssSelector#toString  Change the string to a more meaningful "cssSelector". It is also more consistent with the other By's #toString methods.  Signed-off-by: Luke Inman-Semerau <luke.semerau@gmail.com>
Add verbose timeout to CheckPointerConstraintCreationDeadlockIT
Upgrade the documentation for SourceSection, especially with respect to the specification of text locations.
Flush also needs the non-blocking test
doc: fixed the wording in javadoc for TrailingCommentCheck
Delete unused import
2.x: Expand the documentation of the Flowable.lift() operator (#5863)
Log dialect of protocol detected by the protocol handshake.  It was possible to figure this out by looking at the other log messages, but being clear rather than inferring things is the best thing to do.
Breaking another dependency of Grid on RC server
Add `computeIfAbsentConcurrently` test for `ConcurrentLinkedHashMap`
add <table> to test output report (see http://forums.openqa.org/thread.jspa?threadID=5427&messageID=15118#15118 for details)  r3607
removed some of the dead code
Mute SSL HTTP connection test  This test is failing for days, possibly due to a change in core Elasticsearch. This commit marks this test as awaits fix.  Original commit: elastic/x-pack-elasticsearch@8ed3965795c095bfdeb1bf0c55531f55c8ccf0ac
TraceRA: fix FixedInterval.toString for EndMarker.
Improved failure report information
ApiConstants: add Api constant registered  Signed-off-by: Rohit Yadav <rohit.yadav@shapeblue.com>
Await for close of the channels. See #235
Revert "BEAM-5933: avoid memory allocation in hashCode call"  Fixes BEAM-6407.
CAMEL-11703 - Camel-AWS: Use builders instead of different constructors - AWS SWF
Avoid NPE when database is null  There is a race when fetching the Leader and getting its database with the shutdown of the machine.  To avoid NPE check for null before using the database object.
Handle EAGAIN return code (expected for non-blocking reads when no data is available)
Mute FieldStatsIntegrationIT.testGeoPointNotIndexed, for now
Categorize RejectedExecutionException in StateMachine
Now override parent method
Migrate deprecated API.
StubJarTest: Don't use FrontendOnlyJavacTask for source ABIs with deps  Summary: This was left over from the early days when I thought we'd need to. Source ABIs with deps are actually generated with the regular `JavacTask`, so this better reflects reality.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: 3de47c3
Minor: small improvement of OSchema.getClass()
Deprecated unused code (for porting to 7.0.x)
[GR-14166] Remove the misspelled and deprecated TruffleStackTrace#getStacktrace method
Remove unused import.
Add NotSerializable.forUrn to key by URN for non-serializable overrides
add ability to spit out count
[TEST] RepeatOnExceptionRule to rethrow unexpected exception  In case an exception was caught by the repeat rule, the retry mechanism would kick in only if the exception was the expected one. If not an NPE got thrown, while we should rather just bubble it up to the caller. This makes `NettyTransportMultiPortTests` run from a plane. An assumption would kick in to make sure that the test gets ignored but the `AssumptionViolationException` was caught and not properly re-thrown.
KAFKA-4661: Improve test coverage UsePreviousTimeOnInvalidTimestamp  Author: Jeyhun Karimov <je.karimov@gmail.com>  Reviewers: Matthias J. Sax <matthias@confluent.io>, Guozhang Wang <wangguoz@gmail.com>  Closes #3288 from jeyhunkarimov/KAFKA-4661
Remove unnecessary initialization
SimonStewart: Preparing to remove the 'isJavascriptEnabled' method.  r11967
Removing needless throws
Added test case for property MAX
Fixed slider nonlinear visuals.
Update for Gump now these are known Ciphers
[scala] Change ScalaAggregateOperator to use TypeSerializer  This closes #263
Correctly handle DefaultStompFrame.retain(increment)  Motivation:  DefaultStompFrame.retain(increment) missed to pass on the increment parameter.  Modifications:  Correctly pass on increment paramter.  Result:  Correctly handle the retain when increment value is given.
Renamed a method for better readability
DefaultJavaLibraryBuilder: Factor out getJavac  Summary: Going to use this in a subclass soon.  Test Plan: CI  Reviewed By: asp2insp  fbshipit-source-id: 0ffbfdd
findElements should return empty list if there are no elements (not a timeout exception). Fixes issue 5278
Fixed CS for camel-dataformat
Fix https://bz.apache.org/bugzilla/show_bug.cgi?id=58386 On the basis that access() and finish() are synchronized, extend synchronization to other methods that access same fields.
Test redundant instanceof(s) in ConditionalEliminationPhase.
Create XML parsers that process namespace URIs. Now users can incorporate XInclude processing in a checkstyle config file without changing the parser factory.
Change the extension point for CompilerTreeApiTest  Summary: One of the overloads of `CompilerTreeApiTest.compile` used to be the thing to override if you wanted to do something no matter how the compiler was invoked. After `initCompiler` was added, one if its overloads became a better place, but I neglected to make it so.  Now I need it in a new test, so here we are.  Test Plan: CI  Reviewed By: dreiss  fbshipit-source-id: 2932ac1
Fixed potential race condition in the updated version of ArrayMap.
javadoc changes to correspond with recent method changes
Fixed test failure.  Jasig always redirects to Apereo now. Test requires a non-200 error code.
Added Version [1.3.0]
In AbstractCxxSymlinkTreeHeaders, use Stream.sorted() instead of creating an ImmutableSortedSet  Summary: This code used to create an `ImmutableSortedSet` just to get a stable ordering for iteration. This is expensive. I change this to use `Stream.sorted`, which is much faster as it internally uses a simple `Arrays.sort`.  Test Plan: ran a build while profiling, see that this method's time taken is dramatically reduced.  Reviewed By: beefon  fbshipit-source-id: 8a5543f
Added a test for the recent bug. Tests enabling the shell as an agent and then connecting.
HIVE-13823: Remove unnecessary log line in common join operator (Gunther Hagleitner, reviewed by Prasanth Jayachandran)
Related issue: NETTY-116 HTTP issues including chunked request / response patch * Applied Dave's patch for HttpMessageDecoder
extended PreloaderBundleGenerator to swallow multiple path specifications for assetPath and assetOutputPath. Needed for Maven, first existing path wins...
Removed duplicated registration of warmers as custom metadata type  Already done in a static block within IndexMetaData
Added a property to avoid the exception stack trace when running the console
Fix FatJarMain to use case insensitive env variables on Windows  Summary: Env variables are case insensitive on Windows, fixing `FatJarMain` to search for a variable ignoring the case.  Reviewed By: LLITCHEV  fbshipit-source-id: a43f2140f4
Improve suggestions after a failed build  Summary: No longer detects lines like    Cannot find annotation method 'fieldName()' in type 'com.facebook.composer.modelgen.iface.ModelField'  and so no longer gives *that* class of foolish suggestion ... but may have side effects that I'm not aware of!  Test Plan: Commented out the `//java/com/facebook/api/graphql/commentservice:commentservice` dep in `//java/com/facebook/api:api`.    - //With// this change, `buck` only suggests I add `//java/com/facebook/api/graphql/commentservice:commentservice`   - //Without// this change, `buck` also suggested `//java/com/facebook/composer/modelgen/iface:iface`  Reviewed By: asp2insp  fbshipit-source-id: a8e61e4
Fixed potential race condition in the updated version of ArrayMap.
remove unnecessary vararg argument in PooledByteBufAllocator (#8338)  Motivation:  No need in varargs, the method always accepts array.  Modification:  ... replaced with []
changed it to be generic and take a string[] array for the file extensions  peter
[TEST] close REST test execution context only if not null  The context can be null when REST tests are disabled via sysprop.
Fully explain BeamAggregationRel
Fixed add/remove cluster in class: now default cluster is updated too
Avoid multiple calls to writeInternal()
doubling the timeout for slow/loaded machines - intermittent failur hudson
Remove unused import.
Removed useless null check related to CAMEL-8729
include all mode setting messages at debug level
Mute testLookupSeqNoByIdInLucene  Tracked at #42979
Limit alias to Take  - as per Java 8 Stream naming conventions in discussion https://github.com/Netflix/RxJava/issues/678
Refactor parser to use global frame for rules  Summary: This way rule definitions can be reused in multiple environments. In particular this will be used when parsing extension files.  Test Plan: CI  Reviewed By: styurin  fbshipit-source-id: 2cc4640
Less aggressive test page eviction  Use test pages eviction that is more friendly to ongoing background eviction. Previous was too aggressive and it was possible for eviction to stuck until a cooperative exception was encountered.
Simplify static analysis of DX's PhiTypeResolver  Summary: [Forward Port of 85f09ddee819bbfd671ab1cad6b1ae8fdee5aa14] This makes it a little easier to make sure it is safe to de-intern RegisterSpec.  The cast introduced by this diff should always succeed because mergeType always returns its first argument, null, or a Type.  Test Plan: ant dx-tests
Optimize AbstractArrayBlock.writePositionTo  This avoids several object allocations that occur in getObject()
GROOVY-7646: remove classes via InvokerHelper when closing the GroovyClassLoader or flushing its cache (closes #445)
added constructor to FailedToCommitException
Tests: Fix JiraIssueTests to not hide secrets  Original commit: elastic/x-pack-elasticsearch@f4c83c2da3a5afaaa566042ae8f51384d28271ea
[TEST] Use lowercase index names in test
[TEST] Use lowercase index names in test
removed System.out.println() statement
Dependency parser classifier: fix calculation of bias derivative (one-character change, with a potentially big effect..)
minor corrections to javadocs for new scan/reduce variants (#1835)
Doh. Commit complete patch to remove ServerFactory rather than previous half-finished version.
Await for close of the channels. See #235
Set expiration policy for access tokens
Move expensive map computation outside of a loop.  Summary: The `sourceTargetToTestNodes` map is the same for all workspaces and it used to be computed in each iteration of the loop. Move its computation outside of the loop.  Test Plan: `buck test --all`, generating and compiling an Xcode project.
Re-enables mistakedly ignored tests
Trivial ws change to trigger CI for test
Make aggregator registration idempotent in FlinkRunner
ReadTimeoutHandler - missing ) within JavaDoc example (#8645)  Motivation:  improve docs  Modification:  ReadTimeoutHandler - missing ) within JavaDoc example  No logic/unit tests affected
add check for sane start/end keys patch by Pavel Yaskevich; reviewed by jbellis for CASSANDRA-2600
Fix and add comments to HttpUtil  Motivation: The comments in HttpUtil need some love.  Modifications - Update comments in HttpUtil  Result: Comments are cleaner in HttpUtil.
Execute request with no params in case of null
[BEAM-5658] Suppress findbugs warning about intended reference equality check
Add ATN optimization to remove null state entries and renumber the remaining states
Needs to be volatile as it is used in double checked locking
GraphDatabaseSuperNodeSpeedTest compilation problem was fixed.
Eliminate duplication of List in toList  Fixes https://github.com/Netflix/RxJava/issues/1218
GROOVY-2305: Process .getText() GDK method blocks on some operating systems (remove use of Java 1.5 method)
A better way to get default value
Test that SimpleDoFnRunner wraps exceptions in startBundle and finishBundle
Include path name in error when directory listing fails
Improve security substitutions error message.
call getMemtableThreadSafe instead of copying it.  patch by jbellis
Remove Window.Unbound  Window PTransforms always have a bound output type; equal to that of the input PCollection type.
Do not block the super console if there's a connection error in the http cache client.  Test Plan: yolo1
Make PartitionedLookupSource to close underlying LookupSources  Since `PartitionedLookupSource` encapsulates an array of `LookupSource` instances, the `PartitionedLookupSource.close` should close all the partitions too.  Currently the `LookupSource` implementations that have no-op `close` are `OuterLookupSource` (used for RIGHT OUTER JOIN when there would be only a single partition) and `IndexLookupSource` (used instead of `PartitionedLookupSource` when JOIN is optimized as index-join), so this commit effectively does not change anything, but makes code more future-proof.
CAMEL-8270 Added an unit test for it
Mute testRetentionLeasesSyncOnExpiration  Tracked at #37963
CAMEL-9258: camel-boon - Serializing/Deserializing Lists, Maps with camel-boon
ValidationUtils.invokeValidator assertion for non-null target object
kvm: Remove hardcoded 'cloud' qemu binaries for Hypervisor detection  With the upcoming Apache release we don't ship custom Qemu builds.  libvirt should provide us with the correct information.
CAMEL-6944: Exchange should include id in toString so users can use that for tracking etc.
fix issue on schema snapshot managment for schemafull documents.
specify that asMap never auto-loads entries ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=26581537
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=52591 Skip attributes where getters throw UnsupportedOperationException
SimonStewart: Putting back the exceptions thrown on setup  r13147
Add publicApiOnly (shuffling resulting from internal-only change). ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=49600551
Compile simple case expression
GROOVY-2862: Some DGM niceness for Character (remove some unecessary functionality)
Updating to the new codebehind interface WW-1715
Remove an unnecessary empty line
Update tests using http.enabled (elastic/x-pack-elasticsearch#4413)  This commit updates tests using http.enabled to expect a deprecation warning.  relates https://github.com/elastic/elasticsearch/pull/29591  Original commit: elastic/x-pack-elasticsearch@92e5ea9c74953bdeb73d6be7b2e2e06ca4ca6a42
Removed a sysout I missed.
Clean up the component document of camel-netty
Issue #1555: Remove redundant initializer  Fixes `UnusedAssignment` inspection violation.  Description: >This inspection points out the cases where a variable value
Add a call to `BuildTargets.getGenPath`.  Summary: No functional change. I just missed this when I created `getGenPath`.
2.x: marble additions and updates (12/11) (#5759)
just read byte in channel buffer wrapper, no need to check for bounds since it is checked internally
Add getPages method to PagesIndex
Return cursor to user if app crashes
Tests: add an awaitFix to IndicesLifecycleListenerTests
Breaking another dependency of Grid on RC server
Add test for FrameworkDependencies metadata traversal in AppleBundleDescription  Summary: I promised to add a test, here it is.  Apple bundle should stop FrameworkDependencies traversals instead of recursing into its binary field.  Test Plan: This is a test.  Reviewed By: ryu2  fbshipit-source-id: 28108ee
TIKA-780: Optimize loading of the media type registry  Add a maximum size limit to the static set of simple media types kept in memory. This prevents a potential DOS attack against the library.  Fix handling of media type parameters.
CLOUDSTACK-5663 : Added the NULL CIDR check to avoid NPE for createNetwork and listNetwork  Signed-off-by: Daan Hoogland <daan@onecht.net>
SimplifyExpressions drop filter if the predicate is just TRUE
added utility methods for writing a Java string to a native memory buffer as a C string
more specific return value on ObjectStamp.join
Fix @param javadoc for UnsignedInts.parseUnsignedInt() to reflect actual parameter name. ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=24544750
roles to become unmodifiableSet
Fix a couple of ASync issues that were causing Servlet 3.0 TCK test failures. 1. <quote section="2.3.3.3" page="17"> The complete method can be invoked by the container if the request is dispatched to a servlet that does not support async processing, or the target servlet called by AsyncContext.dispatch does not do a subsequent call to startAsync. In this case, it is the container's responsibility to call complete() as soon as that servlet's service method is exited. </quote> 2. <quote section="2.3.3.3" page ="13"> public boolean isAsyncStarted() - Returns true if async processing has started on this request, and false otherwise. If this request has been dispatched using one of the AsyncContext.dispatch methods since it was put in asynchronous mode, or a call to AsynContext.complete is made, this method returns false. </quote>
Document the behavior of transform(|Async) if the input fails. ------------- Created by MOE: https://github.com/google/moe MOE_MIGRATED_REVID=107384495
Should we try to disconnect at end of test?
Add plan builder methods for join and aggregation
Develop branch was merged.
Avoid potential NPE in error message
Add test for DELETE
- fix for TIKA-1620: OUTPUT_FILE_TOKEN not being replaced in ExternalParser contributed by Pascal Essiembre
CLOUDSTACK-5145 : Added permission checks while deleting network ACLs
use .equals() instead of '=='
[TEST] fix CurrentTestFailedMarker to reset its state after each test  The currently used method `testRunStarted` is only called before any tests have been run, we need to reset that state before each test, that's why we need to use `testStarted`.
Mark some methods final, remove unnecessary check for null
CLOUDSTACK-5663 : Added the NULL CIDR check to avoid NPE for createNetwork and listNetwork  Signed-off-by: Daan Hoogland <daan@onecht.net>
Converted to JUnit4 because of CI hangs, see AMQ-5021
Add test to reproduce SPR-15271
Fix the failing test and add one more test to cover both when/otherwise conditions.
removes custom implementation for setDelegate
bug 8456: fixing the upgrade issue status 8456: resolved fixed
by default, there should not be a subscription recovery policy (and it leaks memory)
AlexeiBarantsev: Remove a temporary directory that contains a profile extracted from json string. FirefoxProfile(dir) constructor copies content of this directory (webdriver*) to a new profile  directory (anonymous*), so immediately after copying it can be safely removed. Fixes issue 1934  r13935
Do not use SauceDriver to check the effective platform as that will fail when running locally
optimize for empty string case
Add test for count with boolean argument
Unignoring a test fixed in today's Firefox Nightly
Fixed exception logging in several places
Remove dead code
Add test based on user forum trouble
attempt to fix wal shoutdown issue
Allow skipping of erased dependencies as well as null dependencies when reading in conll dependency trees
Use the passed in input type for step name  Summary: The step name code comes from before we passed in the input type. We can simply use it instead of deriving its value from the extension.  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: fcfd83f
Improve subscription removal in SubscriptionRegistry  Avoid using destination pattern based search when removing sessions or subscriptions from DefaultSubscriptionRegistry and use only session and subscription ids.  Issue: SPR-11930
Should we try to disconnect at end of test?
restored @Test annotation in SimpleValidateQueryTests
Precompile prefix headers when specified.  Test Plan: None needed.
SimonStewart: Make the IE driver consistent with the chrome and firefox drivers  r10506
Change order of modifiers
HIVE-2113. In shell mode, local mode continues if a local-mode task throws exception in pre-hooks (Siying Dong via Ning Zhang)
Fix GeoShapeQueryBuilder serialization after backport  Aligns the routing value serialization version after backport of #30760
Added root cause exception to IGD static initializer.
Changed the test case to test each of the log traces in the array list.
Remove unused Jersey annotations.
Mute AckClusterUpdateSettingsIT  Tracked by #33673
Terms API: add the ability to return terms as array (termsAsArray flag), defaulting to true since order is important
HIVE-6662: Vector Join operations with DATE columns fail. (Gopal V via jitendra)
No need to use an unreleasable buffer - just wrap an array
Remove extra space after open parenthesis in InstanceConnectionInfo#toString.  This closes #416
FindBugs: Prevent edit of static var in configure
Require non-empty values for TxMgr qualifiers & bean names
remove unused method
Parallel query: fixed issue with transactions  When transactions are running, the parallel doesnât work because the way the database is cloned between threads It doesnât take in account the transaction data structures in db.copy()
TIKA-687: Temporary file not removed after detection  Test case by Berry van Ginkel (with slight modifications)
use constant evaluator for insert value constant evaluation
Use MockitoJUnitRunner from Mockito 2's preferred location  Issue: SPR-14880
[hotfix][runtime] Delete unused method DispatcherResourceManagerComponent#getTerminationFuture
Dialog constructor didn't call setSkin() on Table superclass  One of the Dialog constructors didn't call `setSkin()` on the Table superclass, resulting in the Table's `skin` property being `null`. See https://github.com/libgdx/libgdx/issues/2727
push down counter check to where it's needed
Create Border only once
fix to avoid the NPE in cases where Object is not the root of all classes. That is for primitive types as well as Object itself.
a leaner graph implementation
Implemented AndroidClipboard. Should be robust and work with SDK 8+.
apply patch for: https://issues.apache.org/jira/browse/AMQ-4342
fix String.format to match markers and parameters
Fix scaling thread pool test bug  This commit adjusts the expectation for the max number of threads in the scaling thread pool configuration test. The reason that this expectation is incorrect is because we removed the limitation that the number of processors maxes out at 32, instead letting it be the true number of logical processors on the machine. However, when we removed this limitation, this test was never adjusted to reflect the new reality yet it never arose since our tests were not running on machines with incredibly high core counts.  Relates #20874
Suppress warnings in MappingJackson2XmlHttpMessageConverterTests
Update 'contains' signature to 'contains(Object)'
[hotfix][tests] Removed unused field
Use the builder's FirefoxBinary, if specified.  In particular, don't construct a new, default FirefoxBinary if a specific FirefoxBinary was already provided.
fixed thread local clean on drop in new delegate implementation
[ML] Index the audit notification before responding to a delete request (elastic/x-pack-elasticsearch#1150)  This change prevents the situation where cleanup of ML indices immediately after deleting a job leaves the audit notification in limbo because the index it was due to be indexed into has been deleted.  Relates elastic/x-pack-elasticsearch#1142  Original commit: elastic/x-pack-elasticsearch@300e9c36ce5d313429eedcbf3e8465443e891e48
Re-enables mistakedly ignored tests
fixes error when history file exists  refs : https://github.com/orientechnologies/orientdb/issues/2910
Drops unused imports
WW-3067 Add a configuration constant to turn on/off the logging of missing properties by OGNL
Bug 53782 - Enhance JavaSampler handling of JavaSamplerClient cleanup to use less memory  First improvement, store only necessary objects Bugzilla Id: 53782
[TEST] fix CurrentTestFailedMarker to reset its state after each test  The currently used method `testRunStarted` is only called before any tests have been run, we need to reset that state before each test, that's why we need to use `testStarted`.
Set null rather than this.
Convert prebuilt_python_library Arg to be an Immutable  Test Plan: CI  Reviewed By: Coneko  fbshipit-source-id: 137a9bc
Remove use of deprecated code
Allow several tries to delete a directory as on windows the directory can still be locked while a server process is shutting down
Removed unused import.
Expose the result of preparing a statement so that client projects can mine it.
Revert "[TEST] Enable trace logging for translog recovery"  This reverts commit 52d53e658f786d1e0717c3f63676de00426599cb.
Fixed bug on Fetch Plan map building. Should fix issue 709
more message info in UnsupportedEncodingException
increase execution time of timeout test  Summary:this test sporatically fails  Increasing the child timeout should help.  Test Plan: run the test  Reviewed By: marcinkosiba  fb-gh-sync-id: c174f4c shipit-source-id: c174f4c
Explicitly specify analyzer scope  Related to elastic/elasticsearchelastic/elasticsearch#20197  Original commit: elastic/x-pack-elasticsearch@af9258a8a6c29c1b82052fb65e4298eb6b89a114
remove debug comment
KristianRosenvold: Added thread name to grid poller thread  r15982
Remove unused import.
Fix GeoShapeQueryBuilder serialization after backport  Aligns the routing value serialization version after backport of #30760
Adding wait for a new window to open
Now override parent method
GROOVY-4137 Set the source information on the default constructor added by groovy compiler, if not provided.
small commit to test things, will be reverted  Test Plan: CI  Reviewed By: marcinkosiba  fbshipit-source-id: 1630f56
Better generics and removed unused field
Add back newline.
Convert mmap assertion to if/throw patch by jbellis; reviewed by slebresne for CASSANDRA-2417
removed system logging
Added missing iOS device  Added the missing Wi-Fi Only iPad Pro to IOSDevice
[TEST] Ignore Lucene40 codec
Remove unused rule
updated a javadoc ref
Renamed a method for better readability
Baremetal: bypass HA, only track VM status
Add EPUB MediaType ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=48636026
small commit to test things, will be reverted  Test Plan: CI  Reviewed By: marcinkosiba  fbshipit-source-id: 1630f56
Add a comment
Improve debug output
TIKA-404: Media-type handling depends on the locale  Also media type parameters should be handled case-insensitively
addressed review comments
Fix https://issues.apache.org/bugzilla/show_bug.cgi?id=57180 Don't limit HTTP methods to those defined in RFC 7231.
Remove dead code
Added more HTTP header constants useful for MIME representation
Fixed a bug with javac
TIKA-46 - Use Metadata in Parser     - Use Metadata.TITLE as suggested by Chris
Query DSL: prefix query to support _id, closes #1648. (fix support analysis for prefix is configured)
Dumps the logical logs in version order
Fixed the tests in storm-starter that do not use the actual TupleImpl but mock everything themselves
Removing MoreAsserts call ------------- Created by MOE: http://code.google.com/p/moe-java MOE_MIGRATED_REVID=25247052
Test: Enabled ChildrenTests#testParentWithMultipleBuckets with more logging
Added Configurable interface
Remove merge leftovers
bug 11490: simulator marks VMs as Stopped and not Expunging when they are Destroyed status 11490: resolved fixed reviewed-by: Kishan.Kavala@citrix.com  The simulator should mark the VM as Expunging when the root volume is destroyed or VM sync will think the VM is still only Stopped and not expunged (cherry picked from commit 6dd57f3023d3ca3bb323d20298d6a70c0bfb079c)
[hotfix][tests] Move field definitions before method definitions
Remove Bean that might not being used (#3559)  I have seen a bean named "OAuth20CasClientRedirectActionBuilder defaultOAuthCasClientRedirectActionBuilder" that is created (seemingly) without being used anywhere (supported by github search "https://github.com/search?q=defaultOAuthCasClientRedirectActionBuilder+repo%3Aapereo%2Fcas&type=Code")   A bean with the same class called "OAuth20CasClientRedirectActionBuilder oauthCasClientRedirectActionBuilder" is being used instead of this one.  If this is indeed an unused Bean, then it would be nice that it can be removed, thanks!
Javadoc for CometEvent: Add <br> tags to make it more readable.
[java] Simplification of TNG Grid main method, merging duplicated clauses
Add real console  Summary: This makes console events actually get printed to stdout/stderr (the remote execution service can then return them in the output).  Reviewed By: ttsugriy  fbshipit-source-id: 78dea47
Update javadoc for MultipartFile.transferTo  Issue: SPR-12650
Removed a superfluous import
HIVE-5978 : Rollups not supported in vector mode. (Jitendra Nath Pandey via Ashutosh Chauhan)
GROOVY-3286: DefaultGroovyMethods#reverse(String) does not reverse strings correctly
Remove v[N/A] log output
Add test for dispatcher registration
Make NarayanaRecoveryManagerBean conditional on missing bean    See gh-9724
[Performance tuning] improve InvokerInvocationHandler#invoke (#5403)
double check lock (#6422)
- remove unecessary import statement
Removing note about 7u60 from master, which is Java 8+ only
Make tests' detection of SSL handshake failures more robust    Closes gh-12961
Remove dead code in TestRuleTest.    Closes #1156
Allow more time for shutdown result callback to be received    5 seconds isn't always sufficient, particularly on CI where the timing  can be quite variable.
Configure worker for Undertow\xe2\x80\x99s access log to use daemon threads    Previously, the worker used non-daemon threads which meant that they  prevented the JVM from shutting down. Ideally, we\xe2\x80\x99d avoid this problem  by closing the worker and access log receiver as part of stopping  Undertow, however, due to an apparent bug in Undertow [1], it\xe2\x80\x99s not  possible to do so cleanly.    This commit configures the access log worker to use daemon threads so  that they do not prevent the JVM from shutting down. Unfortunately,  this means that the threads will still be running after the context has  been closed but before the JVM shuts down but that appears to be  unavoidable due to the aforementioned Undertow bug.    Closes gh-4793    [1] https://issues.jboss.org/browse/UNDERTOW-597
Add Optmizations for ClearText to avoid SSLContext
drop convertIfExist method
Print the java version being used on startup    See gh-21559
Removed redundant phrase from parameter name
Postpone checkSubConfig logic in ReferenceConfig (#5226)
Add test to reproduce SPR-15271
Use method to resolve directly to a builder.
Be consistent about host names in RouteSelector.    Use the host specified by the address, and not URI.getHost().    bug: 18023709  Change-Id: I2c39c2ce89049130dc00047c8de6f214159144c0
Use method to resolve directly to a builder.
Do not delete duplicate directories from main classpath    Before this change we were too aggressive in deleting duplicate resources  since directories might not have identical contents, and yet they were  being deleted anyway.    Fixes gh-614
Distributed: fixed CCE on tx fix
Resolve build issues
Propagate the cause that led Reactor's debug agent to fail    Prior to this commit, DebugAgentEnvironmentPostProcessor throws a  RuntimeException with a generic error message if its initialization  fails. The causing exception is discarded, which makes error analysis  unnecessarily difficult.    This commit attaches the cause to the newly thrown RuntimeException.    See gh-22777
Polish 'Automatically detect log4j2.properties'    Closes gh-16262
Print the java version being used on startup    See gh-21559
Use defined Locale for BindFailureAnalyzerTests    Update BindFailureAnalyzerTests so that localized messages are not used.    Fixes gh-6106
Removed some code I had commented out but forgot to delete
HHH-6543 change JBoss TM jndi string to java:jboss/TransactionManager
Don't import JmsBootstrapConfiguration directly    Remove the direct unconditional JmsBootstrapConfiguration @Import from  JmsAnnotationDrivenConfiguration in favor of the nested  EnableJmsConfiguration class.    Fixes gh-1513
Polish 'Auto-configure ReactiveStringRedisTemplate if necessary'    Closes gh-16604
Try to prevent Travis build failures    Update LiveReloadServerTests which seems to be failing intermittently  on Travis.
Implement BeanFactoryAware to inject BeanFactory    Closes gh-23543
Update copyright year    See gh-20832
Fix file handle leak in JarFileTests    The JarFile was not being closed which linked a file handle and caused  a test failure on Windows.    The local variable has been renamed as, when declared in a  try-with-resources, Checkstyle was confused by the shadowing of the  jarFile field and required references to jarFile within the try-block  the be prefixed with this.    See gh-19595
Add custom condition for /logfile endpoint    Fixes gh-3360
Update FilteredClassPathRunner so that JUnit rules work    Previously, the tests class and any JUnit annotations it contained were  loaded by a different class loader to JUnit. This meant that the JUnit  annotations were loaded twice and @Rule-annotated fields were not found.  This commit updates FitleredClassPathRunner to use a custom class loader  that ensures that any org.junit.* classes are only loaded by a single  class loader.
Replace reflection call in HttpMessageConverters    Closes gh-23485
Precompile current dir pattern in Handler    Closes gh-11321
Harmonize CouchbaseReactiveRepositoriesAutoConfiguration conditions    Closes gh-11138
Treat Java 11+'s NoSuchFileException the same as FileNotFoundException    See gh-19850
Polish 'Expose SpringBootCondition's logger'    Closes gh-10000
Remove unecessary semicolon
Fix build after SPR-17034 in Spring Framework    Since SPR-17034, the core container now behaves a bit differently when  dealing with `null` beans.    Given a `null` `HandlerMapping` bean named 'resourceHandlerMapping':    * `context.getBean('resourceHandlerMapping', HandlerMapping.class)`  still returns a `NullBean`  * `ListableBeanFactory.getBeansOfType` will return a Map of all existing  beans, not including the `null` ones as values of the map.    Closes gh-13760
add fixme comment
Postpone checkSubConfig logic in ReferenceConfig (#5226)
add fixme comment
MINOR: log which signals are handled on startup (#6620)  Reviewers: Gwen Shapira <cshapi@gmail.com>
use ReflectUtils#isPrimitives instead of JValidator#isPrimitives (#5508)
Add Optmizations for ClearText to avoid SSLContext
Added method to clear cache
Remove long-deprecated peek API.
Be consistent about host names in RouteSelector.    Use the host specified by the address, and not URI.getHost().    bug: 18023709  Change-Id: I2c39c2ce89049130dc00047c8de6f214159144c0
Test proxy disconnecting before sending response headers    Reproduces https://github.com/square/okhttp/issues/4915
Handle h2 vs http/1.1 event ordering differences (#3504)    * Handle h2 vs http/1.1 event ordering differences    * remove sout    * additional test case    * dont change client, change server protocols    * refactor test
Test proxy disconnecting before sending response headers    Reproduces https://github.com/square/okhttp/issues/4915
Tests: Reduce number of random runs for shape builder tests
- remove unecessary import statement
Document custom error body deserialization exception.    This is a less-than-ideal API but the behavior can't be changed because it's public API. We'll make error handling more robust in future versions.
Document custom error body deserialization exception.    This is a less-than-ideal API but the behavior can't be changed because it's public API. We'll make error handling more robust in future versions.
Empty lines are for noobs.
Use method to resolve directly to a builder.
Handle h2 vs http/1.1 event ordering differences (#3504)    * Handle h2 vs http/1.1 event ordering differences    * remove sout    * additional test case    * dont change client, change server protocols    * refactor test
Be consistent about host names in RouteSelector.    Use the host specified by the address, and not URI.getHost().    bug: 18023709  Change-Id: I2c39c2ce89049130dc00047c8de6f214159144c0
just read byte in channel buffer wrapper, no need to check for bounds since it is checked internally
[Performance tuning] improve InvokerInvocationHandler#invoke (#5403)
Removed redundant phrase from parameter name
Removed redundant phrase from parameter name
Postpone checkSubConfig logic in ReferenceConfig (#5226)
solve compile error
Changing tests to use singleton RegistryProtocol instead of making new instances (#3849)
add fixme comment
Fixed issue 336 thanks to the patch by the reporter
Add documentation for AndroidLog.
Remove duplicate code in AbstractConfig (#4492)
also invoke validateSchemaAgreement() for CREATEs  Patch by eevans
Split AccessFlagsTest methods to one test per method  Summary: This is making way for a test refactor that expects a single compilation per test.  Test Plan: Existing unit tests  Reviewed By: asp2insp  fbshipit-source-id: f076d84
Simplify matcher expression in ParameterSignatureTest
[TEST] fix CurrentTestFailedMarker to reset its state after each test  The currently used method `testRunStarted` is only called before any tests have been run, we need to reset that state before each test, that's why we need to use `testStarted`.
Postpone checkSubConfig logic in ReferenceConfig (#5226)
Add test for dispatcher registration
Add assumption support to Javadoc of Parameterized    Since 7111b9621997f6c660687b8ac04003398343ee3a we support assumptions in  @Parameters methods. This commit adds a description of this feature to  the Javadoc of the Parameterized runner so that people can discover the  new feature more easily.
Add toString() to IndexShardGateway
Fixing unit tests to use fake driver services.
double check lock (#6422)
double check lock (#6422)
revert License Header
Add some useful imports to Mvc scripts
Fixing unit tests to use fake driver services.
Use charset specified by the request body content type
Expose the result of preparing a statement so that client projects can mine it.
Expose the result of preparing a statement so that client projects can mine it.
Be consistent about host names in RouteSelector.    Use the host specified by the address, and not URI.getHost().    bug: 18023709  Change-Id: I2c39c2ce89049130dc00047c8de6f214159144c0
Be consistent about host names in RouteSelector.    Use the host specified by the address, and not URI.getHost().    bug: 18023709  Change-Id: I2c39c2ce89049130dc00047c8de6f214159144c0
Use Okio when reading cached certificates.
Be consistent about host names in RouteSelector.    Use the host specified by the address, and not URI.getHost().    bug: 18023709  Change-Id: I2c39c2ce89049130dc00047c8de6f214159144c0
solve compile error
Postpone checkSubConfig logic in ReferenceConfig (#5226)
Remove duplicate code in AbstractConfig (#4492)
Postpone checkSubConfig logic in ReferenceConfig (#5226)
Clean up SpringPropertyAction.getValue()    See gh-15885
Test proxy disconnecting before sending response headers    Reproduces https://github.com/square/okhttp/issues/4915
Set the new lucene version for 6.4.0
remove empty comments
Simplify matcher expression in ParameterSignatureTest
Add test for dispatcher registration
added NullResultPrinter to suppress the output
Simplify matcher expression in ParameterSignatureTest
Add equals() to the unit test to satisfy checkstyle
Implemented the changes proposed by kcooney:    1) Now passing classes.length to the constructor of ArrayList  2) Code style adjustment (no spaces before the = in an assignment)
restored @Test annotation in SimpleValidateQueryTests
KAFKA-5481: ListOffsetResponse isn't logged in the right way with trace level enabled  Added toString() method to ListOffsetResponse for logging  Author: ppatierno <ppatierno@live.com> Author: Paolo Patierno <ppatierno@live.com>  Reviewers: Ewen Cheslack-Postava <ewen@confluent.io>  Closes #3383 from ppatierno/kafka-5481
Simplify matcher expression in ParameterSignatureTest
[TEST] fix CurrentTestFailedMarker to reset its state after each test  The currently used method `testRunStarted` is only called before any tests have been run, we need to reset that state before each test, that's why we need to use `testStarted`.
Add assumption support to Javadoc of Parameterized    Since 7111b9621997f6c660687b8ac04003398343ee3a we support assumptions in  @Parameters methods. This commit adds a description of this feature to  the Javadoc of the Parameterized runner so that people can discover the  new feature more easily.
Use method to resolve directly to a builder.
Postpone checkSubConfig logic in ReferenceConfig (#5226)
remove useless code in MergeableClusterInvoker.java (#5925)
enhance consul registry to support matching url between consumer and provider (#4818)
Improved warning if no properties found
Changing URL so tests can run in any order (#2760)
remove useless code in MergeableClusterInvoker.java (#5925)
Changing URL so tests can run in any order (#2760)
Be consistent about host names in RouteSelector.    Use the host specified by the address, and not URI.getHost().    bug: 18023709  Change-Id: I2c39c2ce89049130dc00047c8de6f214159144c0
Avoid sending empty HTTP/2 data frames when there is no request body.    Closes: https://github.com/square/okhttp/issues/2892
Use LoggingTestWatcher (DRY)
Polish 'Align TestRestTemplate Javadoc with documentation'    See gh-21318
add disclaimer and example
solve compile error
Add custom condition for /logfile endpoint    Fixes gh-3360
enhance consul registry to support matching url between consumer and provider (#4818)
Postpone checkSubConfig logic in ReferenceConfig (#5226)
remove useless code in MergeableClusterInvoker.java (#5925)
