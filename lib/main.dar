
import 'package:flutter/material.dart';

void main() {
  runApp(const SoummamApp());
}

const Color brandGreen = Color(0xFFB8F2C8);
const Color brandSky = Color(0xFFA7E8F5);
const Color brandBlue = Color(0xFF1455D9);
const Color pageWhite = Color(0xFFFFFFFF);
const Color ink = Color(0xFF172B3A);

class Product {
  final String name;
  final String category;
  final String description;
  final String size;
  final IconData icon;
  final Color color;

  const Product({
    required this.name,
    required this.category,
    required this.description,
    required this.size,
    required this.icon,
    required this.color,
  });
}

const List<Product> products = [
  Product(
    name: 'Yaourt Nature',
    category: 'Yaourts',
    description: 'Yaourt nature - exemple de produit.',
    size: '125 g',
    icon: Icons.breakfast_dining_rounded,
    color: brandGreen,
  ),
  Product(
    name: 'Yaourt aux Fruits',
    category: 'Yaourts',
    description: 'Yaourt aux fruits - exemple de produit.',
    size: '125 g',
    icon: Icons.icecream_rounded,
    color: brandSky,
  ),
  Product(
    name: 'Lait Fermenté',
    category: 'Laitages',
    description: 'Lait fermenté - exemple de produit.',
    size: '1 L',
    icon: Icons.local_drink_rounded,
    color: Color(0xFFDCE7FF),
  ),
  Product(
    name: 'Dessert Lacté',
    category: 'Desserts',
    description: 'Dessert lacté - exemple de produit.',
    size: '100 g',
    icon: Icons.cake_rounded,
    color: Color(0xFFFFE5B8),
  ),
];

class SoummamApp extends StatelessWidget {
  const SoummamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soummam Digital',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7FAFC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: brandBlue,
          primary: brandBlue,
          surface: pageWhite,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: pageWhite,
          foregroundColor: ink,
          elevation: 0,
          centerTitle: false,
        ),
        fontFamily: 'Roboto',
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedTab = 0;
  String searchText = '';
  String selectedCategory = 'Tous';

  final TextEditingController searchController =
      TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Product> get filteredProducts {
    return products.where((product) {
      final matchesSearch =
          product.name.toLowerCase().contains(
                searchText.toLowerCase(),
              ) ||
              product.category.toLowerCase().contains(
                searchText.toLowerCase(),
              );

      final matchesCategory = selectedCategory == 'Tous' ||
          product.category == selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: brandGreen,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.spa_rounded,
                color: ink,
                size: 26,
              ),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Soummam',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: ink,
                  ),
                ),
                Text(
                  'DIGITAL EXPERIENCE',
                  style: TextStyle(
                    fontSize: 9,
                    letterSpacing: 1.4,
                    color: brandBlue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Les notifications seront disponibles prochainement.',
                  ),
                ),
              );
            },
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: IndexedStack(
        index: selectedTab,
        children: [
          buildHome(),
          buildCatalog(),
          buildOffers(),
          buildProfile(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedTab,
        onDestinationSelected: (index) {
          setState(() => selectedTab = index);
        },
        backgroundColor: pageWhite,
        indicatorColor: brandGreen,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Accueil',
          ),
          NavigationDestination(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Produits',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_offer_outlined),
            label: 'Offres',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Compte',
          ),
        ],
      ),
    );
  }

  Widget buildHome() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [brandGreen, brandSky],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(26),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'BIENVENUE',
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w800,
                  color: ink,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'La qualité au\\nquotidien.',
                style: TextStyle(
                  fontSize: 30,
                  height: 1.12,
                  fontWeight: FontWeight.w900,
                  color: ink,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Découvrez notre catalogue et nos nouveautés.',
                style: TextStyle(
                  fontSize: 14,
                  color: ink,
                ),
              ),
              const SizedBox(height: 20),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: brandBlue,
                  foregroundColor: pageWhite,
                ),
                onPressed: () {
                  setState(() => selectedTab = 1);
                },
                child: const Text('Explorer les produits'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        const SectionHeading(
          title: 'Nos produits',
          subtitle: 'Découvrez notre sélection',
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 206,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (_, __) =>
                const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return SizedBox(
                width: 158,
                child: ProductCard(
                  product: products[index],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 28),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: pageWhite,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xFFE5EDF3)),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.campaign_rounded,
                color: brandBlue,
                size: 32,
              ),
              SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Actualités & nouveautés',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: ink,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Retrouvez ici les annonces de la marque.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Prototype de démonstration — données fictives.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }

  Widget buildCatalog() {
    const categories = ['Tous', 'Yaourts', 'Laitages', 'Desserts'];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Catalogue',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: ink,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Explorez notre sélection de produits.',
          style: TextStyle(color: Colors.blueGrey),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: searchController,
          onChanged: (value) {
            setState(() => searchText = value);
          },
          decoration: InputDecoration(
            hintText: 'Rechercher un produit...',
            prefixIcon: const Icon(Icons.search_rounded),
            filled: true,
            fillColor: pageWhite,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((category) {
              final active = category == selectedCategory;

              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(category),
                  selected: active,
                  selectedColor: brandGreen,
                  onSelected: (_) {
                    setState(() => selectedCategory = category);
                  },
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 18),
        if (filteredProducts.isEmpty)
          const Padding(
            padding: EdgeInsets.all(28),
            child: Text(
              'Aucun produit trouvé.',
              textAlign: TextAlign.center,
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredProducts.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 210,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                product: filteredProducts[index],
              );
            },
          ),
      ],
    );
  }

  Widget buildOffers() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Offres & actualités',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w900,
            color: ink,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Les nouveautés seront publiées ici.',
          style: TextStyle(color: Colors.blueGrey),
        ),
        const SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: brandSky.withValues(alpha: 0.55),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.auto_awesome_rounded,
                size: 38,
                color: brandBlue,
              ),
              SizedBox(height: 18),
              Text(
                'Restez informé.',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                  color: ink,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Cette section accueillera les campagnes, '
                'annonces et promotions officielles.',
                style: TextStyle(height: 1.5, color: ink),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildProfile() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Mon espace',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: ink,
          ),
        ),
        const SizedBox(height: 20),
        const CircleAvatar(
          radius: 38,
          backgroundColor: brandGreen,
          child: Icon(
            Icons.person_rounded,
            size: 42,
            color: ink,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Bienvenue',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Connectez-vous prochainement pour accéder '
          'à votre espace personnel.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.blueGrey),
        ),
        const SizedBox(height: 24),
        const ProfileTile(
          icon: Icons.storefront_outlined,
          title: 'Espace professionnel',
          subtitle: 'Fonctionnalités pour les commerces',
        ),
        const ProfileTile(
          icon: Icons.support_agent_rounded,
          title: 'Assistance',
          subtitle: 'Contact et questions',
        ),
        const ProfileTile(
          icon: Icons.info_outline_rounded,
          title: 'À propos',
          subtitle: 'Soummam Digital — prototype',
        ),
      ],
    );
  }
}

class SectionHeading extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionHeading({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w900,
            color: ink,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: pageWhite,
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Color(0xFFE8EEF3)),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ProductDetails(product: product),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: product.color,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    product.icon,
                    size: 56,
                    color: brandBlue,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: ink,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${product.category} • ${product.size}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
  }
}

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détails du produit')),
      body: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: product.color,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Icon(
              product.icon,
              size: 110,
              color: brandBlue,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: ink,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${product.category} • ${product.size}',
            style: const TextStyle(color: brandBlue),
          ),
          const SizedBox(height: 20),
          Text(
            product.description,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              color: ink,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Informations de démonstration. '
            'Les données officielles du produit devront être validées.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: pageWhite,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: brandSky,
          child: Icon(icon, color: brandBlue),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}
