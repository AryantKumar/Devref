import '../models/snippet.dart';

List<Snippet> getLinuxSnippets() {
  List<Snippet> snippets = [];
  for (int i = 1; i <= 40; i++) {
    snippets.add(Snippet()
      ..snippetId='linux_${i.toString().padLeft(3, '0')}'
      ..topicId='linux'
      ..title='Linux Command ${i}'
      ..description='Description for Linux command ${i}.'
      ..code='echo "Command ${i}"'
      ..language='bash'
      ..difficulty=(i % 4 == 0 ? 'very_hard' : (i % 3 == 0 ? 'hard' : (i % 2 == 0 ? 'medium' : 'very_easy')))
      ..isSaved=false
      ..lastViewedAt=null
    );
  }
  
  snippets[0].title = 'File Navigation';
  snippets[0].description = 'Basic commands to navigate the filesystem.';
  snippets[0].code = '# Print working directory\\npwd\\n\\n# List files\\nls -la\\n\\n# Change directory\\ncd /var/log';
  
  snippets[1].title = 'Grep Search';
  snippets[1].description = 'Search inside files for a pattern.';
  snippets[1].code = '# Find "error" ignoring case\\ngrep -i "error" /var/log/syslog\\n\\n# Count occurrences\\ngrep -c "failed" auth.log\\n\\n# Recursive search\\ngrep -r "TODO" ./src';

  snippets[2].title = 'Process Management';
  snippets[2].description = 'View and control running processes.';
  snippets[2].code = '# Top processes\\ntop\\n# or htop\\n\\n# Find specific process\\nps aux | grep nginx\\n\\n# Kill by PID\\nkill -9 1234';

  snippets[3].title = 'File Permissions';
  snippets[3].description = 'Change read, write, execute permissions.';
  snippets[3].code = '# Make script executable\\nchmod +x script.sh\\n\\n# Owner read/write, others read\\nchmod 644 file.txt\\n\\n# Change owner\\nchown user:group file.txt';

  return snippets;
}
