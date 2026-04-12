import 'package:flutter/material.dart';

class RoadmapStep {
  final String title;
  final String description;
  final String duration;
  final List<String> skills;
  final List<String> resources;

  const RoadmapStep({
    required this.title,
    required this.description,
    required this.duration,
    required this.skills,
    this.resources = const [],
  });
}

class RoadmapCategory {
  final String id;
  final String title;
  final String subtitle;
  final String emoji;
  final Color color;
  final Color colorLight;
  final String totalDuration;
  final String description;
  final List<RoadmapStep> steps;

  const RoadmapCategory({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.emoji,
    required this.color,
    required this.colorLight,
    required this.totalDuration,
    required this.description,
    required this.steps,
  });
}

final List<RoadmapCategory> roadmaps = [
  RoadmapCategory(
    id: 'web_dev',
    title: 'Web Development',
    subtitle: 'Full-Stack Web Developer',
    emoji: '🌐',
    color: const Color(0xFF3178C6),
    colorLight: const Color(0xFF61DAFB),
    totalDuration: '8-12 months',
    description: 'Build modern, responsive websites and web apps from frontend to backend.',
    steps: [
      RoadmapStep(
        title: 'HTML & CSS Fundamentals',
        description: 'Learn the building blocks of the web. Master semantic HTML5, CSS3, Flexbox, Grid, and responsive design.',
        duration: '3-4 weeks',
        skills: ['HTML5 Semantic Tags', 'CSS3 & Animations', 'Flexbox & Grid', 'Responsive Design', 'Media Queries'],
      ),
      RoadmapStep(
        title: 'JavaScript Essentials',
        description: 'Master the language of the web. Learn ES6+, DOM manipulation, async programming, and browser APIs.',
        duration: '4-6 weeks',
        skills: ['ES6+ Syntax', 'DOM Manipulation', 'Fetch API & Promises', 'Event Handling', 'Local Storage'],
      ),
      RoadmapStep(
        title: 'Frontend Framework',
        description: 'Pick React, Vue, or Angular. Learn component architecture, state management, and routing.',
        duration: '6-8 weeks',
        skills: ['React / Vue / Angular', 'Component Lifecycle', 'State Management', 'Client-Side Routing', 'API Integration'],
      ),
      RoadmapStep(
        title: 'CSS Framework & Tooling',
        description: 'Speed up development with Tailwind CSS or Bootstrap. Learn build tools like Vite and Webpack.',
        duration: '2-3 weeks',
        skills: ['Tailwind CSS / Bootstrap', 'Sass / PostCSS', 'Vite / Webpack', 'ESLint & Prettier', 'NPM / Yarn'],
      ),
      RoadmapStep(
        title: 'Backend Development',
        description: 'Build APIs and server-side logic with Node.js/Express, Python/Django, or similar.',
        duration: '6-8 weeks',
        skills: ['Node.js & Express', 'REST API Design', 'Authentication (JWT)', 'Middleware', 'Error Handling'],
      ),
      RoadmapStep(
        title: 'Database & ORM',
        description: 'Learn SQL and NoSQL databases. Use ORMs for efficient data modeling and queries.',
        duration: '3-4 weeks',
        skills: ['PostgreSQL / MySQL', 'MongoDB', 'Prisma / Sequelize', 'Database Design', 'Migrations'],
      ),
      RoadmapStep(
        title: 'DevOps & Deployment',
        description: 'Deploy your apps. Learn Git, CI/CD, Docker basics, and cloud hosting.',
        duration: '3-4 weeks',
        skills: ['Git & GitHub', 'Docker Basics', 'Vercel / Netlify / AWS', 'CI/CD Pipelines', 'Domain & SSL'],
      ),
      RoadmapStep(
        title: 'Advanced & Portfolio',
        description: 'Build real projects, learn testing, performance optimization, and create a portfolio.',
        duration: '4-6 weeks',
        skills: ['Testing (Jest, Cypress)', 'Performance Optimization', 'SEO Basics', 'PWA', 'Portfolio Projects'],
      ),
    ],
  ),
  RoadmapCategory(
    id: 'app_dev',
    title: 'App Development',
    subtitle: 'Native Mobile Developer',
    emoji: '📱',
    color: const Color(0xFF34C759),
    colorLight: const Color(0xFF7EE787),
    totalDuration: '8-12 months',
    description: 'Build native Android and iOS apps with platform-specific tools and best practices.',
    steps: [
      RoadmapStep(
        title: 'Programming Fundamentals',
        description: 'Master Kotlin (Android) or Swift (iOS). Learn OOP, data structures, and algorithms.',
        duration: '4-6 weeks',
        skills: ['Kotlin / Swift', 'OOP Principles', 'Data Structures', 'Basic Algorithms', 'IDE Setup (AS / Xcode)'],
      ),
      RoadmapStep(
        title: 'UI Development',
        description: 'Build beautiful interfaces with Jetpack Compose (Android) or SwiftUI (iOS).',
        duration: '4-6 weeks',
        skills: ['Jetpack Compose / SwiftUI', 'Layouts & Navigation', 'Theming & Styling', 'Animations', 'Custom Components'],
      ),
      RoadmapStep(
        title: 'Architecture Patterns',
        description: 'Structure your app with MVVM, Clean Architecture, and dependency injection.',
        duration: '3-4 weeks',
        skills: ['MVVM Pattern', 'Clean Architecture', 'Dependency Injection', 'Repository Pattern', 'Use Cases'],
      ),
      RoadmapStep(
        title: 'Networking & Data',
        description: 'Connect to APIs, parse JSON, handle offline storage, and manage local databases.',
        duration: '3-4 weeks',
        skills: ['Retrofit / URLSession', 'JSON Parsing', 'Room / Core Data', 'Offline-First Design', 'Caching Strategies'],
      ),
      RoadmapStep(
        title: 'Advanced Features',
        description: 'Implement push notifications, background tasks, location services, and camera access.',
        duration: '4-5 weeks',
        skills: ['Push Notifications', 'Background Processing', 'Location & Maps', 'Camera & Media', 'Permissions Handling'],
      ),
      RoadmapStep(
        title: 'Testing & Quality',
        description: 'Write unit tests, integration tests, and UI tests. Set up CI/CD for mobile.',
        duration: '3-4 weeks',
        skills: ['Unit Testing', 'UI Testing', 'Integration Tests', 'Code Coverage', 'Mobile CI/CD'],
      ),
      RoadmapStep(
        title: 'App Store & Distribution',
        description: 'Prepare for launch. Learn signing, store listings, review guidelines, and analytics.',
        duration: '2-3 weeks',
        skills: ['App Signing', 'Store Listings', 'Review Guidelines', 'Analytics (Firebase)', 'Crash Reporting'],
      ),
      RoadmapStep(
        title: 'Portfolio & Open Source',
        description: 'Build 2-3 polished apps, contribute to open source, and prepare your portfolio.',
        duration: '4-6 weeks',
        skills: ['Portfolio Apps', 'Open Source Contributions', 'Code Reviews', 'Technical Writing', 'GitHub Profile'],
      ),
    ],
  ),
  RoadmapCategory(
    id: 'cross_platform',
    title: 'Cross-Platform',
    subtitle: 'Flutter / React Native Developer',
    emoji: '🔄',
    color: const Color(0xFF027DFD),
    colorLight: const Color(0xFF58A6FF),
    totalDuration: '6-10 months',
    description: 'Build apps for Android, iOS, Web, and Desktop from a single codebase.',
    steps: [
      RoadmapStep(
        title: 'Dart / JavaScript Fundamentals',
        description: 'Learn Dart (Flutter) or JavaScript/TypeScript (React Native) in depth.',
        duration: '3-4 weeks',
        skills: ['Dart / TypeScript', 'Async Programming', 'Null Safety / Strict Mode', 'Package Management', 'Language Features'],
      ),
      RoadmapStep(
        title: 'Framework Basics',
        description: 'Learn Flutter widgets or React Native components. Understand the rendering pipeline.',
        duration: '4-6 weeks',
        skills: ['Widget Tree / Component Tree', 'State Management Basics', 'Navigation & Routing', 'Styling & Theming', 'Hot Reload Workflow'],
      ),
      RoadmapStep(
        title: 'State Management',
        description: 'Master Riverpod/Bloc (Flutter) or Redux/Zustand (RN). Manage complex app state.',
        duration: '3-4 weeks',
        skills: ['Riverpod / Redux', 'Bloc / Zustand', 'Global vs Local State', 'Reactive Programming', 'State Persistence'],
      ),
      RoadmapStep(
        title: 'Platform Integration',
        description: 'Access native features via platform channels, plugins, or native modules.',
        duration: '3-4 weeks',
        skills: ['Platform Channels', 'Native Plugins', 'Camera & Sensors', 'File System Access', 'Permissions'],
      ),
      RoadmapStep(
        title: 'Backend Integration',
        description: 'Connect to REST/GraphQL APIs, implement auth, handle real-time data with WebSockets.',
        duration: '3-4 weeks',
        skills: ['REST & GraphQL', 'Firebase / Supabase', 'Authentication', 'WebSockets', 'Offline Sync'],
      ),
      RoadmapStep(
        title: 'Testing & Performance',
        description: 'Write tests, profile performance, optimize rendering, and reduce app size.',
        duration: '3-4 weeks',
        skills: ['Unit & Widget Tests', 'Integration Testing', 'Performance Profiling', 'Memory Optimization', 'App Size Reduction'],
      ),
      RoadmapStep(
        title: 'Multi-Platform Deployment',
        description: 'Deploy to Android, iOS, Web, and Desktop. Handle platform-specific configurations.',
        duration: '2-3 weeks',
        skills: ['Play Store & App Store', 'Web Deployment', 'Desktop Packaging', 'CI/CD (Codemagic)', 'Flavors / Environments'],
      ),
    ],
  ),
  RoadmapCategory(
    id: 'ai_ml',
    title: 'AI / ML Engineer',
    subtitle: 'Machine Learning Engineer',
    emoji: '🤖',
    color: const Color(0xFFFF6B6B),
    colorLight: const Color(0xFFFF7B72),
    totalDuration: '10-16 months',
    description: 'Build intelligent systems with machine learning, deep learning, and AI.',
    steps: [
      RoadmapStep(
        title: 'Python & Math Foundations',
        description: 'Master Python, NumPy, and essential math: linear algebra, calculus, probability, and statistics.',
        duration: '4-6 weeks',
        skills: ['Python (Advanced)', 'NumPy & Pandas', 'Linear Algebra', 'Calculus', 'Probability & Statistics'],
      ),
      RoadmapStep(
        title: 'Data Analysis & Visualization',
        description: 'Clean, explore, and visualize data. Understand EDA, feature engineering, and data pipelines.',
        duration: '3-4 weeks',
        skills: ['Pandas & Data Wrangling', 'Matplotlib & Seaborn', 'Exploratory Data Analysis', 'Feature Engineering', 'Data Cleaning'],
      ),
      RoadmapStep(
        title: 'Classical Machine Learning',
        description: 'Learn supervised & unsupervised learning. Master scikit-learn, model evaluation, and tuning.',
        duration: '6-8 weeks',
        skills: ['Regression & Classification', 'Clustering & PCA', 'Scikit-learn', 'Cross-Validation', 'Hyperparameter Tuning'],
      ),
      RoadmapStep(
        title: 'Deep Learning',
        description: 'Build neural networks with PyTorch or TensorFlow. CNNs, RNNs, Transformers.',
        duration: '6-8 weeks',
        skills: ['PyTorch / TensorFlow', 'CNNs for Vision', 'RNNs & LSTMs', 'Transformers & Attention', 'Transfer Learning'],
      ),
      RoadmapStep(
        title: 'NLP & Computer Vision',
        description: 'Specialize in text or image processing. Learn Hugging Face, YOLO, and diffusion models.',
        duration: '4-6 weeks',
        skills: ['Hugging Face Transformers', 'Text Classification & NER', 'Object Detection (YOLO)', 'Image Segmentation', 'Embeddings & RAG'],
      ),
      RoadmapStep(
        title: 'LLMs & Generative AI',
        description: 'Work with large language models. Fine-tuning, prompt engineering, and building AI apps.',
        duration: '4-6 weeks',
        skills: ['OpenAI / Gemini APIs', 'Prompt Engineering', 'Fine-Tuning (LoRA)', 'LangChain / LlamaIndex', 'Vector Databases'],
      ),
      RoadmapStep(
        title: 'MLOps & Deployment',
        description: 'Deploy models to production. Learn MLflow, Docker, model serving, and monitoring.',
        duration: '4-5 weeks',
        skills: ['MLflow / W&B', 'Model Serving (FastAPI)', 'Docker & K8s', 'Model Monitoring', 'A/B Testing'],
      ),
      RoadmapStep(
        title: 'Projects & Research',
        description: 'Build end-to-end ML projects, read papers, contribute to open source, and build a portfolio.',
        duration: '6-8 weeks',
        skills: ['End-to-End Projects', 'Paper Reading', 'Kaggle Competitions', 'Research Blog', 'GitHub Portfolio'],
      ),
    ],
  ),
  RoadmapCategory(
    id: 'data_science',
    title: 'Data Science',
    subtitle: 'Data Scientist / Analyst',
    emoji: '📊',
    color: const Color(0xFF9B59B6),
    colorLight: const Color(0xFFD2A8FF),
    totalDuration: '8-12 months',
    description: 'Extract insights from data and drive business decisions with analytics and visualization.',
    steps: [
      RoadmapStep(
        title: 'Python & Statistics',
        description: 'Learn Python for data science, descriptive & inferential statistics, and hypothesis testing.',
        duration: '4-6 weeks',
        skills: ['Python Basics', 'Descriptive Statistics', 'Inferential Statistics', 'Hypothesis Testing', 'Probability Distributions'],
      ),
      RoadmapStep(
        title: 'SQL & Databases',
        description: 'Master SQL for data extraction. Learn joins, window functions, and query optimization.',
        duration: '3-4 weeks',
        skills: ['SQL Queries', 'Joins & Subqueries', 'Window Functions', 'Database Design', 'Query Optimization'],
      ),
      RoadmapStep(
        title: 'Data Wrangling',
        description: 'Clean, transform, and merge datasets using Pandas and NumPy.',
        duration: '3-4 weeks',
        skills: ['Pandas (Advanced)', 'Data Cleaning', 'Missing Data Handling', 'Data Transformation', 'Merging & Reshaping'],
      ),
      RoadmapStep(
        title: 'Data Visualization',
        description: 'Create compelling visualizations with Matplotlib, Seaborn, Plotly, and dashboards.',
        duration: '3-4 weeks',
        skills: ['Matplotlib & Seaborn', 'Plotly & Dash', 'Tableau / Power BI', 'Storytelling with Data', 'Dashboard Design'],
      ),
      RoadmapStep(
        title: 'Machine Learning',
        description: 'Apply ML models to solve business problems. Focus on practical applications.',
        duration: '6-8 weeks',
        skills: ['Scikit-learn', 'Classification & Regression', 'Feature Selection', 'Model Evaluation', 'Ensemble Methods'],
      ),
      RoadmapStep(
        title: 'Big Data & Cloud',
        description: 'Work with large datasets using Spark, cloud services, and data pipelines.',
        duration: '4-5 weeks',
        skills: ['Apache Spark', 'AWS / GCP Basics', 'Data Pipelines', 'ETL Processes', 'Cloud Storage'],
      ),
      RoadmapStep(
        title: 'Business & Communication',
        description: 'Translate data insights into business value. Present findings to stakeholders.',
        duration: '2-3 weeks',
        skills: ['Business Acumen', 'Presentation Skills', 'A/B Testing', 'KPI Definition', 'Stakeholder Communication'],
      ),
    ],
  ),
  RoadmapCategory(
    id: 'devops',
    title: 'DevOps Engineer',
    subtitle: 'DevOps / SRE Engineer',
    emoji: '⚙️',
    color: const Color(0xFFE67E22),
    colorLight: const Color(0xFFFFA657),
    totalDuration: '8-14 months',
    description: 'Automate, deploy, and manage scalable infrastructure and CI/CD pipelines.',
    steps: [
      RoadmapStep(
        title: 'Linux & Scripting',
        description: 'Master Linux administration, Bash scripting, and command-line tools.',
        duration: '4-6 weeks',
        skills: ['Linux Administration', 'Bash Scripting', 'File System & Permissions', 'Process Management', 'Networking Basics'],
      ),
      RoadmapStep(
        title: 'Version Control & CI/CD',
        description: 'Advanced Git workflows. Set up CI/CD pipelines with GitHub Actions, Jenkins, or GitLab CI.',
        duration: '3-4 weeks',
        skills: ['Git (Advanced)', 'GitHub Actions', 'Jenkins / GitLab CI', 'Pipeline Design', 'Automated Testing'],
      ),
      RoadmapStep(
        title: 'Containers & Docker',
        description: 'Containerize applications. Write Dockerfiles, use Docker Compose, manage images.',
        duration: '3-4 weeks',
        skills: ['Docker & Dockerfiles', 'Docker Compose', 'Container Networking', 'Image Optimization', 'Registry Management'],
      ),
      RoadmapStep(
        title: 'Kubernetes',
        description: 'Orchestrate containers at scale. Pods, Services, Deployments, Helm charts.',
        duration: '5-6 weeks',
        skills: ['K8s Architecture', 'Pods & Services', 'Deployments & StatefulSets', 'Helm Charts', 'Auto-Scaling'],
      ),
      RoadmapStep(
        title: 'Cloud Platforms',
        description: 'Learn AWS, GCP, or Azure. Compute, storage, networking, and managed services.',
        duration: '5-6 weeks',
        skills: ['AWS / GCP / Azure', 'EC2 / Compute Engine', 'S3 / Cloud Storage', 'VPC & Networking', 'IAM & Security'],
      ),
      RoadmapStep(
        title: 'Infrastructure as Code',
        description: 'Automate infrastructure with Terraform, Ansible, or Pulumi.',
        duration: '4-5 weeks',
        skills: ['Terraform', 'Ansible / Pulumi', 'CloudFormation', 'State Management', 'Module Design'],
      ),
      RoadmapStep(
        title: 'Monitoring & Observability',
        description: 'Set up monitoring, logging, and alerting. Prometheus, Grafana, ELK stack.',
        duration: '3-4 weeks',
        skills: ['Prometheus & Grafana', 'ELK Stack', 'Distributed Tracing', 'Alerting & On-Call', 'SLOs & SLIs'],
      ),
    ],
  ),
  RoadmapCategory(
    id: 'cybersecurity',
    title: 'Cybersecurity',
    subtitle: 'Security Engineer / Pentester',
    emoji: '🛡️',
    color: const Color(0xFFE74C3C),
    colorLight: const Color(0xFFFF7B72),
    totalDuration: '10-14 months',
    description: 'Protect systems, find vulnerabilities, and build secure applications.',
    steps: [
      RoadmapStep(
        title: 'Networking Fundamentals',
        description: 'TCP/IP, DNS, HTTP, firewalls, and how the internet works at every layer.',
        duration: '4-5 weeks',
        skills: ['TCP/IP & OSI Model', 'DNS & HTTP/HTTPS', 'Firewalls & Proxies', 'Subnetting', 'Wireshark'],
      ),
      RoadmapStep(
        title: 'Linux & OS Security',
        description: 'Linux administration, file permissions, users, processes, and hardening.',
        duration: '3-4 weeks',
        skills: ['Linux CLI Mastery', 'File Permissions', 'User Management', 'OS Hardening', 'Log Analysis'],
      ),
      RoadmapStep(
        title: 'Web Security',
        description: 'OWASP Top 10, XSS, SQL Injection, CSRF, and secure coding practices.',
        duration: '4-6 weeks',
        skills: ['OWASP Top 10', 'XSS & SQL Injection', 'CSRF & SSRF', 'Secure Headers', 'Input Validation'],
      ),
      RoadmapStep(
        title: 'Cryptography',
        description: 'Encryption, hashing, digital signatures, TLS, and certificate management.',
        duration: '3-4 weeks',
        skills: ['Symmetric & Asymmetric Encryption', 'Hashing Algorithms', 'TLS/SSL', 'Digital Signatures', 'PKI & Certificates'],
      ),
      RoadmapStep(
        title: 'Penetration Testing',
        description: 'Learn ethical hacking tools and methodologies. Kali Linux, Burp Suite, Metasploit.',
        duration: '6-8 weeks',
        skills: ['Kali Linux', 'Burp Suite', 'Metasploit', 'Nmap & Recon', 'Reporting'],
      ),
      RoadmapStep(
        title: 'Cloud & Infrastructure Security',
        description: 'Secure cloud environments, containers, and CI/CD pipelines.',
        duration: '4-5 weeks',
        skills: ['AWS Security', 'Container Security', 'IAM Best Practices', 'Security Groups & NACLs', 'Compliance (SOC2)'],
      ),
      RoadmapStep(
        title: 'Incident Response & Forensics',
        description: 'Detect, investigate, and respond to security incidents. Digital forensics basics.',
        duration: '3-4 weeks',
        skills: ['SIEM Tools', 'Incident Response Plans', 'Digital Forensics', 'Malware Analysis Basics', 'Threat Intelligence'],
      ),
    ],
  ),
  RoadmapCategory(
    id: 'backend',
    title: 'Backend Engineer',
    subtitle: 'Backend / Systems Engineer',
    emoji: '🖥️',
    color: const Color(0xFF2ECC71),
    colorLight: const Color(0xFF7EE787),
    totalDuration: '8-12 months',
    description: 'Build scalable APIs, microservices, and distributed backend systems.',
    steps: [
      RoadmapStep(
        title: 'Programming Language Mastery',
        description: 'Master one backend language deeply: Go, Java, Python, Rust, or Node.js.',
        duration: '4-6 weeks',
        skills: ['Go / Java / Python / Rust', 'Concurrency & Threading', 'Memory Management', 'Error Handling', 'Standard Library'],
      ),
      RoadmapStep(
        title: 'API Design & Development',
        description: 'Build REST and GraphQL APIs. Learn API versioning, pagination, and documentation.',
        duration: '4-5 weeks',
        skills: ['REST API Design', 'GraphQL', 'API Versioning', 'OpenAPI / Swagger', 'Rate Limiting'],
      ),
      RoadmapStep(
        title: 'Databases (SQL & NoSQL)',
        description: 'Master relational and document databases. Indexing, queries, and schema design.',
        duration: '4-6 weeks',
        skills: ['PostgreSQL / MySQL', 'MongoDB / Redis', 'Indexing & Query Optimization', 'Transactions & ACID', 'Data Modeling'],
      ),
      RoadmapStep(
        title: 'Authentication & Security',
        description: 'Implement auth flows: JWT, OAuth2, session management, and API security.',
        duration: '3-4 weeks',
        skills: ['JWT & Sessions', 'OAuth2 / OIDC', 'Password Hashing (bcrypt)', 'CORS & CSRF Protection', 'Input Sanitization'],
      ),
      RoadmapStep(
        title: 'Message Queues & Caching',
        description: 'Decouple services with queues. Use Redis for caching and session storage.',
        duration: '3-4 weeks',
        skills: ['Redis Caching', 'RabbitMQ / Kafka', 'Pub/Sub Patterns', 'Cache Invalidation', 'Event-Driven Architecture'],
      ),
      RoadmapStep(
        title: 'Microservices & System Design',
        description: 'Design distributed systems. Service discovery, load balancing, and fault tolerance.',
        duration: '5-6 weeks',
        skills: ['Microservices Patterns', 'Service Discovery', 'Load Balancing', 'Circuit Breaker', 'Distributed Tracing'],
      ),
      RoadmapStep(
        title: 'Containers & Cloud',
        description: 'Dockerize services, deploy to cloud, set up CI/CD, and monitoring.',
        duration: '4-5 weeks',
        skills: ['Docker & K8s', 'Cloud Deployment', 'CI/CD Pipelines', 'Logging & Monitoring', 'Auto-Scaling'],
      ),
    ],
  ),
];
