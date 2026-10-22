import 'package:flutter/material.dart';

void main() => runApp(const SoummamApp());

const green = Color(0xFFBDECCB);
const mint = Color(0xFFEAF8EF);
const sky = Color(0xFFBDEBF5);
const blue = Color(0xFF1455D9);
const navy = Color(0xFF102B4E);
const bg = Color(0xFFF5F8FC);
const ink = Color(0xFF172B3A);
const muted = Color(0xFF708090);
const line = Color(0xFFE5ECF3);

class Product {
  final String name, category, description, size;
  final IconData icon;
  final Color color;
  const Product(this.name, this.category, this.description, this.size,
      this.icon, this.color);
}

// Données fictives de démonstration : à remplacer par des informations validées.
const products = <Product>[
  Product('Yaourt Nature', 'Yaourts',
      'Fiche produit de démonstration. Les informations officielles restent à confirmer.',
      '125 g', Icons.breakfast_dining_rounded, green),
  Product('Yaourt aux fruits', 'Yaourts',
      'Fiche produit de démonstration. Les informations officielles restent à confirmer.',
      '125 g', Icons.icecream_rounded, sky),
  Product('Lait fermenté', 'Laitages',
      'Fiche produit de démonstration. Les informations officielles restent à confirmer.',
      '1 L', Icons.local_drink_rounded, Color(0xFFDCE7FF)),
  Product('Dessert lacté', 'Desserts',
      'Fiche produit de démonstration. Les informations officielles restent à confirmer.',
      '100 g', Icons.cake_rounded, Color(0xFFFFE8C7)),
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
        colorScheme: ColorScheme.fromSeed(seedColor: blue, primary: blue),
        scaffoldBackgroundColor: bg,
        appBarTheme: const AppBarTheme(
          backgroundColor: bg,
          foregroundColor: ink,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: green,
          labelTextStyle: WidgetStateProperty.resolveWith((states) =>
              TextStyle(fontSize: 11,
                  fontWeight: states.contains(WidgetState.selected)
                      ? FontWeight.w800 : FontWeight.w500)),
        ),
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
  int tab = 0;
  String query = '';
  String category = 'Tous';
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Product> get filtered => products.where((p) {
    final q = query.trim().toLowerCase();
    final matchesQuery = p.name.toLowerCase().contains(q) ||
        p.category.toLowerCase().contains(q);
    return matchesQuery && (category == 'Tous' || p.category == category);
  }).toList();

  void goCatalog([String selected = 'Tous']) {
    setState(() {
      tab = 1;
      category = selected;
    });
  }

  void message(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: const BrandHeader(),
        actions: [
          IconButton(
            tooltip: 'Notifications',
            onPressed: () => message('Les notifications seront disponibles plus tard.'),
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: IndexedStack(
        index: tab,
        children: [homePage(), catalogPage(), newsPage(), profilePage()],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (value) => setState(() => tab = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_rounded), label: 'Accueil'),
          NavigationDestination(icon: Icon(Icons.grid_view_rounded),
              selectedIcon: Icon(Icons.grid_view_rounded), label: 'Produits'),
          NavigationDestination(icon: Icon(Icons.local_offer_outlined),
              selectedIcon: Icon(Icons.local_offer_rounded), label: 'Actualités'),
          NavigationDestination(icon: Icon(Icons.person_outline_rounded),
              selectedIcon: Icon(Icons.person_rounded), label: 'Compte'),
        ],
      ),
    );
  }

  Widget homePage() => ListView(
    padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
    children: [
      const Text('BONJOUR 👋', style: TextStyle(color: blue,
          fontWeight: FontWeight.w900, fontSize: 11, letterSpacing: 1.8)),
      const SizedBox(height: 6),
      const Text('Le plaisir au quotidien.', style: TextStyle(color: ink,
          fontSize: 25, fontWeight: FontWeight.w900, letterSpacing: -0.6)),
      const SizedBox(height: 18),
      Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [navy, blue],
              begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [BoxShadow(color: blue.withOpacity(.18),
              blurRadius: 22, offset: const Offset(0, 10))],
        ),
        child: Stack(children: [
          Positioned(right: -25, top: -30, child: Container(width: 150,
              height: 150, decoration: BoxDecoration(
                  color: sky.withOpacity(.16), shape: BoxShape.circle))),
          Padding(
            padding: const EdgeInsets.all(23),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
                decoration: BoxDecoration(color: Colors.white.withOpacity(.14),
                    borderRadius: BorderRadius.circular(30)),
                child: const Text('SOUMMAM • DIGITAL', style: TextStyle(
                    color: Colors.white, fontSize: 9, fontWeight: FontWeight.w800)),
              ),
              const SizedBox(height: 20),
              const Text('Découvrez\nun monde de\ndouceur.',
                  style: TextStyle(color: Colors.white, fontSize: 31,
                      height: 1.08, fontWeight: FontWeight.w900,
                      letterSpacing: -.7)),
              const SizedBox(height: 12),
              Text('Explorez le catalogue de démonstration et ses catégories.',
                  style: TextStyle(color: Colors.white.withOpacity(.86),
                      fontSize: 13, height: 1.45)),
              const SizedBox(height: 21),
              FilledButton.icon(
                onPressed: () => goCatalog(),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: const Text('Explorer le catalogue'),
                style: FilledButton.styleFrom(backgroundColor: green,
                    foregroundColor: navy, padding: const EdgeInsets.symmetric(
                        horizontal: 17, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14))),
              ),
            ]),
          ),
        ]),
      ),
      const SizedBox(height: 27),
      const SectionHeading('Explorer par catégorie',
          'Trouvez facilement ce que vous cherchez'),
      const SizedBox(height: 15),
      SizedBox(height: 98, child: ListView(scrollDirection: Axis.horizontal,
        children: [
          CategoryTile('Tous', Icons.apps_rounded, blue, () => goCatalog()),
          CategoryTile('Yaourts', Icons.icecream_rounded, const Color(0xFF27845A),
              () => goCatalog('Yaourts')),
          CategoryTile('Laitages', Icons.local_drink_rounded, blue,
              () => goCatalog('Laitages')),
          CategoryTile('Desserts', Icons.cake_rounded, const Color(0xFFB66A18),
              () => goCatalog('Desserts')),
        ])),
      const SizedBox(height: 27),
      Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        const Expanded(child: SectionHeading('Nos produits',
            'Une sélection à découvrir')),
        TextButton(onPressed: () => goCatalog(), child: const Text('Tout voir')),
      ]),
      const SizedBox(height: 13),
      SizedBox(height: 218, child: ListView.separated(
        scrollDirection: Axis.horizontal, itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, i) => SizedBox(width: 165,
            child: ProductCard(product: products[i])),
      )),
      const SizedBox(height: 24),
      Container(
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: line)),
        child: const Row(children: [
          CircleAvatar(backgroundColor: mint,
              child: Icon(Icons.campaign_rounded, color: blue)),
          SizedBox(width: 13),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Actualités & nouveautés', style: TextStyle(color: ink,
                    fontWeight: FontWeight.w800, fontSize: 14)),
                SizedBox(height: 4),
                Text('Un espace prêt à accueillir les prochaines annonces.',
                    style: TextStyle(color: muted, fontSize: 12, height: 1.4)),
              ])),
          Icon(Icons.chevron_right_rounded, color: muted),
        ]),
      ),
      const SizedBox(height: 18),
      const Text('Prototype indépendant • Données de démonstration',
          textAlign: TextAlign.center,
          style: TextStyle(color: muted, fontSize: 10)),
    ],
  );

  Widget catalogPage() {
    const categories = ['Tous', 'Yaourts', 'Laitages', 'Desserts'];
    return ListView(padding: const EdgeInsets.fromLTRB(20, 10, 20, 28),
      children: [
        const Text('Le catalogue', style: TextStyle(fontSize: 29,
            fontWeight: FontWeight.w900, color: ink, letterSpacing: -.7)),
        const SizedBox(height: 5),
        const Text('Explorez les produits de démonstration.',
            style: TextStyle(color: muted, fontSize: 13)),
        const SizedBox(height: 20),
        TextField(
          controller: searchController,
          onChanged: (value) => setState(() => query = value),
          decoration: InputDecoration(
            hintText: 'Rechercher un produit...',
            prefixIcon: const Icon(Icons.search_rounded, color: blue),
            suffixIcon: query.isEmpty ? null : IconButton(
              onPressed: () { searchController.clear(); setState(() => query = ''); },
              icon: const Icon(Icons.close_rounded)),
            filled: true, fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(17),
                borderSide: const BorderSide(color: line)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17),
                borderSide: const BorderSide(color: line)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17),
                borderSide: const BorderSide(color: blue, width: 1.4)),
          ),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(scrollDirection: Axis.horizontal,
          child: Row(children: categories.map((c) {
            final active = c == category;
            return Padding(padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(label: Text(c), selected: active,
                showCheckmark: false, selectedColor: green,
                backgroundColor: Colors.white,
                side: BorderSide(color: active ? green : line),
                labelStyle: const TextStyle(color: ink, fontWeight: FontWeight.w700),
                onSelected: (_) => setState(() => category = c)));
          }).toList())),
        const SizedBox(height: 17),
        Row(children: [
          const Expanded(child: Text('Produits de la démo',
              style: TextStyle(color: ink, fontSize: 13,
                  fontWeight: FontWeight.w700))),
          Text('${filtered.length} articles', style: const TextStyle(
              color: blue, fontWeight: FontWeight.w800, fontSize: 12)),
        ]),
        const SizedBox(height: 12),
        if (filtered.isEmpty)
          Container(padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
            child: const Column(children: [
              Icon(Icons.search_off_rounded, size: 42, color: muted),
              SizedBox(height: 10),
              Text('Aucun produit trouvé',
                  style: TextStyle(fontWeight: FontWeight.w800, color: ink)),
              SizedBox(height: 4),
              Text('Essayez un autre mot ou une autre catégorie.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: muted, fontSize: 12)),
            ]))
        else
          GridView.builder(
            shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
            itemCount: filtered.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12,
                mainAxisExtent: 218),
            itemBuilder: (_, i) => ProductCard(product: filtered[i])),
        const SizedBox(height: 15),
        const Text('Les noms et caractéristiques sont fictifs et doivent être validés.',
            style: TextStyle(color: muted, fontSize: 10, height: 1.4)),
      ]);
  }

  Widget newsPage() => ListView(
    padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
    children: [
      const Text('Actualités', style: TextStyle(fontSize: 29,
          fontWeight: FontWeight.w900, color: ink, letterSpacing: -.7)),
      const SizedBox(height: 6),
      const Text('Les nouveautés et annonces auront leur espace ici.',
          style: TextStyle(color: muted, fontSize: 13)),
      const SizedBox(height: 22),
      Container(padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [mint, sky],
              begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(25)),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(backgroundColor: Colors.white,
                child: Icon(Icons.auto_awesome_rounded, color: blue)),
            SizedBox(height: 18),
            Text('Restez au courant.', style: TextStyle(fontSize: 25,
                fontWeight: FontWeight.w900, color: ink)),
            SizedBox(height: 9),
            Text('Cette rubrique pourra présenter les nouveautés, campagnes et informations validées.',
                style: TextStyle(color: ink, height: 1.5, fontSize: 13)),
          ])),
      const SizedBox(height: 17),
      const InfoRow(Icons.verified_outlined, 'Informations vérifiées',
          'Publier uniquement des annonces confirmées.'),
      const InfoRow(Icons.notifications_active_outlined, 'Notifications',
          'La fonction sera ajoutée dans une prochaine version.'),
    ]);

  Widget profilePage() => ListView(
    padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
    children: [
      const Text('Mon espace', style: TextStyle(fontSize: 29,
          fontWeight: FontWeight.w900, color: ink, letterSpacing: -.7)),
      const SizedBox(height: 18),
      Container(padding: const EdgeInsets.fromLTRB(20, 24, 20, 22),
        decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(24), border: Border.all(color: line)),
        child: const Column(children: [
          CircleAvatar(radius: 38, backgroundColor: mint,
              child: Icon(Icons.person_rounded, size: 42, color: blue)),
          SizedBox(height: 12),
          Text('Bienvenue', style: TextStyle(color: ink, fontSize: 21,
              fontWeight: FontWeight.w900)),
          SizedBox(height: 6),
          Text('Votre espace personnel sera disponible dans une prochaine version.',
              textAlign: TextAlign.center,
              style: TextStyle(color: muted, fontSize: 12, height: 1.5)),
        ])),
      const SizedBox(height: 18),
      ProfileTile(Icons.storefront_outlined, 'Espace professionnel',
          'Services destinés aux commerces',
          () => message('L’espace professionnel n’est pas encore activé.')),
      ProfileTile(Icons.support_agent_rounded, 'Assistance',
          'Contact et questions',
          () => message('Les coordonnées seront ajoutées après validation.')),
      ProfileTile(Icons.info_outline_rounded, 'À propos du projet',
          'Prototype indépendant',
          () => showAboutDialog(context: context,
              applicationName: 'Soummam Digital',
              applicationVersion: '0.2.0',
              applicationLegalese: 'Prototype indépendant, non affilié officiellement à Soummam.')),
      const SizedBox(height: 18),
      const Text('Prototype indépendant, non officiel. Les contenus doivent être validés avant diffusion.',
          textAlign: TextAlign.center,
          style: TextStyle(color: muted, fontSize: 10, height: 1.5)),
    ]);
}

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key});
  @override
  Widget build(BuildContext context) => Row(children: [
    Container(width: 42, height: 42,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [green, sky]),
        borderRadius: BorderRadius.circular(14)),
      child: const Icon(Icons.spa_rounded, color: navy, size: 25)),
    const SizedBox(width: 10),
    const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Soummam', style: TextStyle(fontWeight: FontWeight.w900,
          fontSize: 19, color: ink, letterSpacing: -.4)),
      Text('DIGITAL EXPERIENCE', style: TextStyle(fontSize: 8,
          letterSpacing: 1.5, color: blue, fontWeight: FontWeight.w800)),
    ]),
  ]);
}

class SectionHeading extends StatelessWidget {
  final String title, subtitle;
  const SectionHeading(this.title, this.subtitle, {super.key});
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(fontSize: 20,
          fontWeight: FontWeight.w900, color: ink, letterSpacing: -.4)),
      const SizedBox(height: 4),
      Text(subtitle, style: const TextStyle(fontSize: 12,
          color: muted, height: 1.35)),
    ]);
}

class CategoryTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  const CategoryTile(this.title, this.icon, this.color, this.onTap, {super.key});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(right: 11),
    child: InkWell(onTap: onTap, borderRadius: BorderRadius.circular(18),
      child: Container(width: 79,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 7),
        decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(18), border: Border.all(color: line)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, color: color, size: 27),
          const SizedBox(height: 8),
          Text(title, maxLines: 1, overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: ink, fontWeight: FontWeight.w700,
                  fontSize: 10)),
        ]))));
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});
  @override
  Widget build(BuildContext context) => Card(
    color: Colors.white, elevation: 0, margin: EdgeInsets.zero,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21),
        side: const BorderSide(color: line)),
    child: InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ProductDetails(product: product))),
      child: Padding(padding: const EdgeInsets.all(11),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: Container(width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                product.color, product.color.withOpacity(.55)],
                begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(15)),
            child: Stack(children: [
              Positioned(right: 8, top: 8, child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(color: Colors.white.withOpacity(.75),
                    shape: BoxShape.circle),
                child: const Icon(Icons.arrow_outward_rounded,
                    size: 13, color: navy))),
              Center(child: Icon(product.icon, size: 55, color: blue)),
            ]))),
          const SizedBox(height: 10),
          Text(product.name, maxLines: 1, overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w900,
                  fontSize: 13, color: ink)),
          const SizedBox(height: 5),
          Row(children: [
            Expanded(child: Text(product.category, maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 10, color: muted))),
            Text(product.size, style: const TextStyle(fontSize: 10,
                fontWeight: FontWeight.w800, color: blue)),
          ]),
        ]))));
}

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Fiche produit')),
    body: ListView(padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
      children: [
        Container(height: 270,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              product.color, product.color.withOpacity(.55)],
              begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(28)),
          child: Icon(product.icon, size: 112, color: blue)),
        const SizedBox(height: 23),
        Align(alignment: Alignment.centerLeft, child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(color: mint, borderRadius: BorderRadius.circular(20)),
          child: Text(product.category, style: const TextStyle(color: navy,
              fontWeight: FontWeight.w800, fontSize: 11)))),
        const SizedBox(height: 12),
        Text(product.name, style: const TextStyle(fontSize: 28,
            fontWeight: FontWeight.w900, color: ink, letterSpacing: -.6)),
        const SizedBox(height: 8),
        Text('Format : ${product.size}', style: const TextStyle(color: blue,
            fontWeight: FontWeight.w800, fontSize: 13)),
        const SizedBox(height: 20),
        Container(padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(18), border: Border.all(color: line)),
          child: Text(product.description, style: const TextStyle(
              fontSize: 14, height: 1.6, color: ink))),
        const SizedBox(height: 16),
        const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.info_outline_rounded, color: muted, size: 18),
          SizedBox(width: 9),
          Expanded(child: Text('Fiche de démonstration. Les ingrédients, valeurs nutritionnelles et informations officielles doivent être vérifiés avant publication.',
              style: TextStyle(color: muted, fontSize: 11, height: 1.5))),
        ]),
      ]));
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  const InfoRow(this.icon, this.title, this.subtitle, {super.key});
  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.circular(18), border: Border.all(color: line)),
    child: Row(children: [
      CircleAvatar(backgroundColor: mint, child: Icon(icon, color: blue)),
      const SizedBox(width: 12),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(color: ink,
            fontWeight: FontWeight.w800, fontSize: 13)),
        const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(color: muted,
            fontSize: 11, height: 1.4)),
      ])),
    ]));
}

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final VoidCallback onTap;
  const ProfileTile(this.icon, this.title, this.subtitle, this.onTap, {super.key});
  @override
  Widget build(BuildContext context) => Card(
    color: Colors.white, elevation: 0, margin: const EdgeInsets.only(bottom: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: line)),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      leading: CircleAvatar(backgroundColor: mint, child: Icon(icon, color: blue)),
      title: Text(title, style: const TextStyle(color: ink,
          fontWeight: FontWeight.w800, fontSize: 13)),
      subtitle: Text(subtitle, style: const TextStyle(color: muted, fontSize: 11)),
      trailing: const Icon(Icons.chevron_right_rounded, color: muted),
      onTap: onTap,
    ));
}
