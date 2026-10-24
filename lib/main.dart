
import 'package:flutter/material.dart';

void main() => runApp(const SoummamDigitalApp());

const green = Color(0xFFBDECCB);
const mint = Color(0xFFEAF8EF);
const sky = Color(0xFFBDEBF5);
const blue = Color(0xFF1455D9);
const navy = Color(0xFF102B4E);
const bg = Color(0xFFF5F8FC);

class SoummamDigitalApp extends StatelessWidget {
  const SoummamDigitalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soummam Digital',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: bg,
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        appBarTheme: const AppBarTheme(
          backgroundColor: bg,
          foregroundColor: navy,
          elevation: 0,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 1,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(color: Color(0x14000000), blurRadius: 20),
                    ],
                  ),
                  child: Image.asset(
                    'assets/soummam_logo.jpeg',
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.eco_rounded,
                      color: blue,
                      size: 80,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Soummam Digital',
                  style: TextStyle(
                    color: navy,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Votre univers Soummam, en un seul endroit.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                ),
                const SizedBox(height: 32),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Choisissez votre espace',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                _roleButton(
                  context,
                  Icons.shopping_bag_outlined,
                  'Espace consommateur',
                  'Produits, actualités et communauté',
                  blue,
                  'Consommateur',
                ),
                const SizedBox(height: 12),
                _roleButton(
                  context,
                  Icons.storefront_outlined,
                  'Espace commerçant',
                  'Catalogue de gros et commandes',
                  Colors.teal,
                  'Commerçant',
                ),
                const SizedBox(height: 12),
                _roleButton(
                  context,
                  Icons.admin_panel_settings_outlined,
                  'Espace employé',
                  'Outils de gestion — démonstration',
                  navy,
                  'Employé',
                ),
                const SizedBox(height: 24),
                const Text(
                  'Prototype de présentation • Données de démonstration',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 11),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _roleButton(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    Color color,
    String role,
  ) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => HomePage(role: role),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: color.withValues(alpha: 0.10),
                  child: Icon(icon, color: color, size: 27),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: navy,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String category;
  final String description;
  final String image;
  final String pack;

  const Product({
    required this.name,
    required this.category,
    required this.description,
    required this.image,
    required this.pack,
  });
}

const products = <Product>[
  Product(
    name: 'Mamzoudj Cerise',
    category: 'Yaourts',
    description: 'Produit laitier aromatisé à la cerise.',
    image: 'assets/mamzoudj_cerise.png',
    pack: 'Carton — quantité à confirmer',
  ),
  Product(
    name: 'Yaourt Nature 125g',
    category: 'Yaourts',
    description: 'Yaourt nature.',
    image: '',
    pack: 'Format de gros à confirmer',
  ),
  Product(
    name: 'Yaourt aux fruits 125g',
    category: 'Yaourts',
    description: 'Yaourt aux fruits.',
    image: '',
    pack: 'Format de gros à confirmer',
  ),
  Product(
    name: 'Lait fermenté 1L',
    category: 'Laitages',
    description: 'Produit laitier fermenté.',
    image: '',
    pack: 'Format de gros à confirmer',
  ),
  Product(
    name: 'Dessert lacté 100g',
    category: 'Desserts',
    description: 'Dessert lacté.',
    image: '',
    pack: 'Format de gros à confirmer',
  ),
];

class HomePage extends StatefulWidget {
  final String role;
  const HomePage({super.key, required this.role});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tab = 0;
  String category = 'Tous';
  final Map<String, int> cart = {};
  final Set<String> liked = {};
  final List<String> orders = [];
  final List<String> posts = [
    'Bienvenue dans Soummam Digital : votre espace communautaire.',
    'Découvrez nos produits laitiers et nos actualités.',
    'Les jeux et concours seront annoncés prochainement.',
  ];
  final List<String> comments = [];
  final TextEditingController commentController = TextEditingController();

  bool get isMerchant => widget.role == 'Commerçant';
  bool get isStaff => widget.role == 'Employé';

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = isStaff
        ? [
            _dashboard(),
            _manageProducts(),
            _ordersPage(),
            _supportPage(),
          ]
        : isMerchant
            ? [
                _dashboard(),
                _catalog(),
                _cartPage(),
                _ordersPage(),
                _supportPage(),
              ]
            : [
                _dashboard(),
                _catalog(),
                _newsPage(),
                _accountPage(),
              ];

    final labels = isStaff
        ? ['Accueil', 'Produits', 'Commandes', 'Support']
        : isMerchant
            ? ['Accueil', 'Catalogue', 'Panier', 'Commandes', 'Support']
            : ['Accueil', 'Produits', 'Actualités', 'Compte'];

    final icons = isStaff
        ? [
            Icons.dashboard_outlined,
            Icons.inventory_2_outlined,
            Icons.receipt_long_outlined,
            Icons.support_agent_outlined,
          ]
        : isMerchant
            ? [
                Icons.home_outlined,
                Icons.storefront_outlined,
                Icons.shopping_cart_outlined,
                Icons.receipt_long_outlined,
                Icons.support_agent_outlined,
              ]
            : [
                Icons.home_outlined,
                Icons.shopping_bag_outlined,
                Icons.dynamic_feed_outlined,
                Icons.person_outline,
              ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/soummam_logo.jpeg',
              width: 38,
              height: 38,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.eco_rounded, color: blue),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'Soummam Digital',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Changer d’espace',
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.swap_horiz_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: tab.clamp(0, pages.length - 1),
          children: pages,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab.clamp(0, labels.length - 1),
        onDestinationSelected: (value) => setState(() => tab = value),
        destinations: [
          for (int i = 0; i < labels.length; i++)
            NavigationDestination(
              icon: Icon(icons[i]),
              label: labels[i],
            ),
        ],
      ),
    );
  }

  Widget _pagePadding(Widget child) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: child,
      );

  Widget _heading(String title, String subtitle) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: navy,
            ),
          ),
          const SizedBox(height: 6),
          Text(subtitle, style: const TextStyle(color: Colors.blueGrey)),
        ],
      );

  Widget _dashboard() => _pagePadding(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(23),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [green, sky, Color(0xFFE4EDFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bonjour 👋',
                    style: TextStyle(
                      color: navy.withValues(alpha: 0.75),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    isStaff
                        ? 'Espace de gestion'
                        : isMerchant
                            ? 'Votre espace commerçant'
                            : 'Le monde Soummam vous attend',
                    style: const TextStyle(
                      color: navy,
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Produits, actualités et services dans une seule application.',
                    style: TextStyle(color: navy, height: 1.4),
                  ),
                  const SizedBox(height: 18),
                  FilledButton.icon(
                    onPressed: () => setState(() => tab = 1),
                    icon: const Icon(Icons.arrow_forward_rounded),
                    label: Text(isStaff ? 'Gérer les produits' : 'Découvrir'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _heading('Accès rapide', 'Les fonctionnalités de votre espace'),
            const SizedBox(height: 14),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.25,
              children: [
                _quickCard(
                  Icons.inventory_2_outlined,
                  'Catalogue',
                  '${products.length} produits démo',
                  sky,
                  () => setState(() => tab = 1),
                ),
                _quickCard(
                  Icons.shopping_cart_outlined,
                  'Panier',
                  '${cart.values.fold<int>(0, (a, b) => a + b)} article(s)',
                  green,
                  () => setState(() => tab = isMerchant ? 2 : 1),
                ),
                _quickCard(
                  Icons.receipt_long_outlined,
                  'Commandes',
                  '${orders.length} commande(s) locale(s)',
                  const Color(0xFFDDE5FF),
                  () => setState(() => tab = isStaff ? 2 : isMerchant ? 3 : 3),
                ),
                _quickCard(
                  Icons.emoji_events_outlined,
                  'Jeux & concours',
                  'Bientôt disponible',
                  const Color(0xFFFFE9C7),
                  () => _message('Les jeux et concours seront annoncés prochainement.'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _heading('À la une', 'Actualités de démonstration'),
            const SizedBox(height: 12),
            _postCard(posts.first, 0),
            const SizedBox(height: 12),
            _notice(
              'Mode démonstration',
              'Les comptes, prix officiels, stocks, commandes en ligne et fonctions IA ne sont pas encore connectés à un serveur.',
            ),
          ],
        ),
      );

  Widget _quickCard(
    IconData icon,
    String title,
    String subtitle,
    Color color,
    VoidCallback onTap,
  ) =>
      InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  child: Icon(icon, color: navy),
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(
                    color: navy,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _catalog() => _pagePadding(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heading(
              isMerchant ? 'Catalogue de gros' : 'Nos produits',
              isMerchant
                  ? 'Les conditionnements et tarifs seront confirmés par la société.'
                  : 'Découvrez une sélection de produits Soummam.',
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final c in ['Tous', 'Yaourts', 'Laitages', 'Desserts'])
                  ChoiceChip(
                    label: Text(c),
                    selected: category == c,
                    onSelected: (_) => setState(() => category = c),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            for (final p in products.where(
              (p) => category == 'Tous' || p.category == category,
            )) ...[
              _productCard(p),
              const SizedBox(height: 12),
            ],
          ],
        ),
      );

  Widget _productCard(Product p) => Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              color: mint,
              child: p.image.isEmpty
                  ? const Icon(Icons.local_drink_outlined, size: 75, color: blue)
                  : Image.asset(
                      p.image,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.local_drink_outlined,
                        size: 75,
                        color: blue,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    p.category.toUpperCase(),
                    style: const TextStyle(
                      color: blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    p.name,
                    style: const TextStyle(
                      color: navy,
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(p.description),
                  const SizedBox(height: 8),
                  Text(
                    p.pack,
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (!isStaff)
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: () {
                          setState(() => cart.update(
                                p.name,
                                (n) => n + 1,
                                ifAbsent: () => 1,
                              ));
                          _message('Ajouté au panier de démonstration.');
                        },
                        icon: const Icon(Icons.add_shopping_cart),
                        label: Text(
                          isMerchant ? 'Ajouter au panier' : 'Enregistrer',
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _newsPage() => _pagePadding(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heading('Actualités', 'La communauté Soummam'),
            const SizedBox(height: 16),
            for (int i = 0; i < posts.length; i++) ...[
              _postCard(posts[i], i),
              const SizedBox(height: 12),
            ],
            _notice(
              'Communauté en ligne',
              'Les publications, commentaires et réactions sont stockés localement dans cette démonstration. La synchronisation entre utilisateurs nécessite un serveur.',
            ),
          ],
        ),
      );

  Widget _postCard(String text, int index) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: mint,
                    child: Icon(Icons.eco_outlined, color: blue),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Soummam Digital',
                      style: TextStyle(
                        color: navy,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Icon(Icons.more_horiz),
                ],
              ),
              const SizedBox(height: 14),
              Text(text, style: const TextStyle(height: 1.5)),
              const SizedBox(height: 12),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () => setState(() {
                      if (liked.contains(text)) {
                        liked.remove(text);
                      } else {
                        liked.add(text);
                      }
                    }),
                    icon: Icon(
                      liked.contains(text)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: liked.contains(text) ? Colors.red : blue,
                    ),
                    label: Text('${liked.contains(text) ? 1 : 0} J’aime'),
                  ),
                  TextButton.icon(
                    onPressed: () => _commentDialog(),
                    icon: const Icon(Icons.chat_bubble_outline),
                    label: Text('Commentaires${comments.isEmpty ? '' : ' (${comments.length})'}'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Future<void> _commentDialog() async {
    commentController.clear();
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ajouter un commentaire'),
        content: TextField(
          controller: commentController,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Écrivez votre commentaire...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          FilledButton(
            onPressed: () {
              final value = commentController.text.trim();
              if (value.isNotEmpty) {
                setState(() => comments.add(value));
              }
              Navigator.pop(context);
              if (value.isNotEmpty) _message('Commentaire enregistré localement.');
            },
            child: const Text('Publier'),
          ),
        ],
      ),
    );
  }

  Widget _cartPage() => _pagePadding(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heading('Votre panier', 'Vérifiez votre sélection'),
            const SizedBox(height: 16),
            if (cart.isEmpty)
              _notice('Panier vide', 'Ajoutez des produits depuis le catalogue.')
            else ...[
              for (final entry in cart.entries.toList()) ...[
                Card(
                  child: ListTile(
                    title: Text(entry.key),
                    subtitle: Text('Quantité : ${entry.value}'),
                    leading: const Icon(Icons.shopping_bag_outlined, color: blue),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => setState(() => cart.remove(entry.key)),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
              const SizedBox(height: 12),
              _notice(
                'Avant de commander',
                'Les prix, quantités par carton et stocks doivent être confirmés par la société.',
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    setState(() {
                      orders.insert(
                        0,
                        'Commande démo • ${DateTime.now().toLocal().toString().substring(0, 16)} • En attente de validation',
                      );
                      cart.clear();
                    });
                    _message('Commande de démonstration enregistrée sur cet appareil.');
                  },
                  icon: const Icon(Icons.send_outlined),
                  label: const Text('Créer une commande démo'),
                ),
              ),
            ],
          ],
        ),
      );

  Widget _ordersPage() => _pagePadding(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heading(
              isStaff ? 'Gestion des commandes' : 'Mes commandes',
              'Historique local de démonstration',
            ),
            const SizedBox(height: 16),
            if (orders.isEmpty)
              _notice(
                'Aucune commande',
                isStaff
                    ? 'Les commandes réelles apparaîtront après la connexion au serveur.'
                    : 'Vos commandes de démonstration apparaîtront ici.',
              )
            else
              for (final order in orders) ...[
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.receipt_long, color: blue),
                    title: Text(order),
                    subtitle: const Text(
                      'Statut local — pas une confirmation de commande réelle',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            if (isStaff)
              _notice(
                'Workflow prévu',
                'L’équipe autorisée vérifie chaque commande, la valide ou la refuse, puis choisit le distributeur. Cette action n’est pas connectée à un système réel.',
              ),
          ],
        ),
      );

  Widget _manageProducts() => _pagePadding(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heading('Gestion des produits', 'Vue de démonstration'),
            const SizedBox(height: 16),
            for (final p in products) ...[
              Card(
                child: ListTile(
                  leading: const Icon(Icons.inventory_2_outlined, color: blue),
                  title: Text(p.name),
                  subtitle: Text('${p.category} • Stock non connecté'),
                  trailing: const Icon(Icons.lock_outline),
                ),
              ),
              const SizedBox(height: 8),
            ],
            _notice(
              'Gestion sécurisée',
              'La modification réelle des tarifs et du stock nécessitera une API sécurisée et des permissions vérifiées côté serveur.',
            ),
          ],
        ),
      );

  Widget _accountPage() => _pagePadding(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heading('Mon espace', 'Profil et assistance'),
            const SizedBox(height: 16),
            Card(
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.person_outline, color: blue),
                    title: Text('Profil consommateur'),
                    subtitle: Text('Connexion non activée'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.support_agent, color: blue),
                    title: const Text('Aide et support'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => _message(
                      'Le support en ligne sera disponible après la mise en place du serveur.',
                    ),
                  ),
                  const Divider(height: 1),
                  const ListTile(
                    leading: Icon(Icons.emoji_events_outlined, color: blue),
                    title: Text('Jeux et concours'),
                    subtitle: Text('Bientôt disponible'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _notice(
              'Confidentialité',
              'Ce prototype ne crée pas de compte et ne transmet pas les données à un serveur.',
            ),
          ],
        ),
      );

  Widget _supportPage() => _pagePadding(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heading('Support', 'Comment pouvons-nous vous aider ?'),
            const SizedBox(height: 16),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    Icon(Icons.support_agent, color: blue, size: 48),
                    SizedBox(height: 12),
                    Text(
                      'Centre d’assistance',
                      style: TextStyle(
                        color: navy,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Le chat, les tickets et le suivi des demandes nécessitent une connexion au service de support.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            _notice(
              'Assistant IA',
              'Un assistant réel devra consulter les données autorisées du serveur et ne jamais inventer le statut d’une commande.',
            ),
          ],
        ),
      );

  Widget _notice(String title, String body) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFEAF1FF),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: navy,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(body, style: const TextStyle(height: 1.45)),
          ],
        ),
      );

  void _message(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
