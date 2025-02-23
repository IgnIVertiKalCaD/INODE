final: prev:
{
  webstorm = prev.jetbrains.webstorm.overrideAttrs (old: {
    postInstall = ''
                        cat > "$out/webstorm/bin/webstorm64.vmoptions" << EOF
      -Xms128m
      -Xmx1024m
      -XX:ReservedCodeCacheSize=512m
      -XX:+IgnoreUnrecognizedVMOptions
      -XX:+UseG1GC
      -XX:SoftRefLRUPolicyMSPerMB=50
      -XX:CICompilerCount=2
      -XX:+HeapDumpOnOutOfMemoryError
      -XX:-OmitStackTraceInFastThrow
      -ea
      -Dsun.io.useCanonCaches=false
      -Djdk.http.auth.tunneling.disabledSchemes=""
      -Djdk.attach.allowAttachSelf=true
      -Djdk.module.illegalAccess.silent=true
      -Dkotlinx.coroutines.debug=off
      -XX:ErrorFile=$USER_HOME/java_error_in_idea_%p.log
      -XX:HeapDumpPath=$USER_HOME/java_error_in_idea.hprof

      --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
      --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED

      -javaagent:/mnt/f450d8ee-cfcd-4d49-af5e-c18cfab65a09/backupDe/jetbra/ja-netfilter.jar=jetbrains
    '' + old.postInstall or "";
  });

  rustrover = prev.jetbrains.rust-rover.overrideAttrs (old: {
    postInstall = ''
                        cat > "$out/rust-rover/bin/rustrover64.vmoptions" << EOF
      -Xms128m
      -Xmx1024m
      -XX:ReservedCodeCacheSize=512m
      -XX:+IgnoreUnrecognizedVMOptions
      -XX:+UseG1GC
      -XX:SoftRefLRUPolicyMSPerMB=50
      -XX:CICompilerCount=2
      -XX:+HeapDumpOnOutOfMemoryError
      -XX:-OmitStackTraceInFastThrow
      -ea
      -Dsun.io.useCanonCaches=false
      -Djdk.http.auth.tunneling.disabledSchemes=""
      -Djdk.attach.allowAttachSelf=true
      -Djdk.module.illegalAccess.silent=true
      -Dkotlinx.coroutines.debug=off
      -XX:ErrorFile=$USER_HOME/java_error_in_idea_%p.log
      -XX:HeapDumpPath=$USER_HOME/java_error_in_idea.hprof

      --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
      --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED

      -javaagent:/mnt/f450d8ee-cfcd-4d49-af5e-c18cfab65a09/backupDe/jetbra/ja-netfilter.jar=jetbrains
    '' + old.postInstall or "";
  });
}


