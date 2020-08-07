# dev/java

## Switching java versions

### For MacOS

The default location of Oracle Java is at,

```bash
/Library/Java/JavaVirtualMachines/jdk**MAJOR.MINOR.MACRO_UPDATE**.jdk
```

where **MAJOR, MINOR, MACRO, UPDATE** are the corresponding numbers of Java version.

So to switch version, use the following command,

```bash
/usr/libexec/java_home -v **MAJOR.MINOR.MACRO_UPDATE**
```

### For Debian/Ubuntu -based Linux

Use the _alternative_ configuration tool,

```bash
sudo update-alternatives — config java
```

### For RedHat/Fedora -like Linux

Use the alternative configuration tool, but first, you must become a superuser

```bash
**su****/usr/sbin/alternatives — config java****/usr/sbin/alternatives — config javac**
```

_Note: for the RedHat/Fedora -like distros, you need to run configuration for both_ **_java_** _and_ **_javac_**_._

### For Manjaro/Arch Linux

Just install all JDK version you want, by picking from the list

```bash
yaourt jdk
```

Then see what are installed,

```bash
archlinux-java status
```

Get a name of version you want to use, then issue this command,

```bash
sudo archlinux-java set JAVA-X-JDK
```

where _JAVA-X-JDK_ is the name result from the _status_ command.
