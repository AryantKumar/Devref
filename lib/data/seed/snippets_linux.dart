import '../models/snippet.dart';

List<Snippet> getLinuxSnippets() {
  return [
    // 1. File & Directory Management
    Snippet()..snippetId='linux_001'..topicId='linux'..title='ls (List)'..description='List directory contents.'..code='ls -la'..language='bash'..difficulty='very_easy'..section='File & Directory Management'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='linux_002'..topicId='linux'..title='cd (Change Directory)'..description='Navigate between directories.'..code='cd /var/log'..language='bash'..difficulty='very_easy'..section='File & Directory Management'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='linux_003'..topicId='linux'..title='pwd (Print Working Directory)'..description='Show current directory path.'..code='pwd'..language='bash'..difficulty='very_easy'..section='File & Directory Management'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='linux_004'..topicId='linux'..title='mkdir (Make Directory)'..description='Create a new folder.'..code='mkdir -p my/nested/folder'..language='bash'..difficulty='very_easy'..section='File & Directory Management'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='linux_005'..topicId='linux'..title='rm (Remove)'..description='Delete files or directories.'..code='rm -rf bin/'..language='bash'..difficulty='easy'..section='File & Directory Management'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='linux_006'..topicId='linux'..title='cp (Copy)'..description='Copy files and folders.'..code='cp -r source/ dest/'..language='bash'..difficulty='very_easy'..section='File & Directory Management'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='linux_007'..topicId='linux'..title='mv (Move/Rename)'..description='Move files or rename them.'..code='mv old.txt new.txt'..language='bash'..difficulty='very_easy'..section='File & Directory Management'..isSaved=false..lastViewedAt=null,

    // 2. File Viewing & Editing
    Snippet()..snippetId='linux_008'..topicId='linux'..title='cat (Concatenate)'..description='Print file content to terminal.'..code='cat config.json'..language='bash'..difficulty='very_easy'..section='File Viewing & Editing'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='linux_009'..topicId='linux'..title='less'..description='View large files with pagination.'..code='less /var/log/syslog'..language='bash'..difficulty='easy'..section='File Viewing & Editing'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='linux_010'..topicId='linux'..title='head/tail'..description='View first or last N lines of a file.'..code='tail -f access.log'..language='bash'..difficulty='easy'..section='File Viewing & Editing'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='linux_011'..topicId='linux'..title='nano/vim'..description='Terminal-based text editors.'..code='vim .bashrc'..language='bash'..difficulty='medium'..section='File Viewing & Editing'..isSaved=false..lastViewedAt=null,

    // 3. Permissions & Ownership
    Snippet()..snippetId='linux_012'..topicId='linux'..title='chmod (Change Mode)'..description='Update file permissions (e.g., +x for executable).'..code='chmod +x script.sh'..language='bash'..difficulty='medium'..section='Permissions & Ownership'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='linux_013'..topicId='linux'..title='chown (Change Owner)'..description='Change file owner and group.'..code='sudo chown -R user:group /var/www'..language='bash'..difficulty='medium'..section='Permissions & Ownership'..isSaved=false..lastViewedAt=null,

    // 4. Process Management
    Snippet()..snippetId='linux_014'..topicId='linux'..title='ps (Process Status)'..description='List currently running processes.'..code='ps aux | grep nginx'..language='bash'..difficulty='medium'..section='Process Management'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='linux_015'..topicId='linux'..title='top/htop'..description='Real-time system process monitor.'..code='htop'..language='bash'..difficulty='easy'..section='Process Management'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='linux_016'..topicId='linux'..title='kill'..description='Terminate a process by PID.'..code='kill -9 1234'..language='bash'..difficulty='medium'..section='Process Management'..isSaved=false..lastViewedAt=null,

    // 5. Networking
    Snippet()..snippetId='linux_017'..topicId='linux'..title='ping'..description='Check network connectivity to a host.'..code='ping google.com'..language='bash'..difficulty='very_easy'..section='Networking'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='linux_018'..topicId='linux'..title='curl/wget'..description='Download files or interact with APIs.'..code='curl -I https://google.com'..language='bash'..difficulty='medium'..section='Networking'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='linux_019'..topicId='linux'..title='ssh'..description='Secure Shell to connect to remote servers.'..code='ssh user@192.168.1.10'..language='bash'..difficulty='medium'..section='Networking'..isSaved=false..lastViewedAt=null,

    // 6. Package Management
    Snippet()..snippetId='linux_020'..topicId='linux'..title='apt (Debian/Ubuntu)'..description='Install, update, and remove packages.'..code='sudo apt update && sudo apt install git'..language='bash'..difficulty='easy'..section='Package Management'..isSaved=false..lastViewedAt=null,

    // 7. Disk & System Monitoring
    Snippet()..snippetId='linux_021'..topicId='linux'..title='df/du'..description='Disk free space and disk usage by directory.'..code='df -h'..language='bash'..difficulty='easy'..section='Disk & System Monitoring'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='linux_022'..topicId='linux'..title='free'..description='Display memory usage (RAM).'..code='free -m'..language='bash'..difficulty='easy'..section='Disk & System Monitoring'..isSaved=false..lastViewedAt=null,

    // 8. Archives & Compression
    Snippet()..snippetId='linux_023'..topicId='linux'..title='tar'..description='Create or extract archive files.'..code='tar -xvzf archive.tar.gz'..language='bash'..difficulty='medium'..section='Archives & Compression'..isSaved=false..lastViewedAt=null,

    // 9. User Management
    Snippet()..snippetId='linux_024'..topicId='linux'..title='passwd'..description='Change user password.'..code='passwd username'..language='bash'..difficulty='easy'..section='User Management'..isSaved=false..lastViewedAt=null,
    Snippet()..snippetId='linux_025'..topicId='linux'..title='su/sudo'..description='Switch user or run command as superuser.'..code='sudo su -'..language='bash'..difficulty='easy'..section='User Management'..isSaved=false..lastViewedAt=null,
  ];
}
