import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';
import '../widgets/section_header.dart';


class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            children: [
              const Navbar(),
              const SizedBox(height: 20),

              const SectionHeader(
                title: 'Nasze Usługi',
                subtitle: 'Poznaj nasze profesjonalne zabiegi pielęgnacyjne',
              ),

              const SizedBox(height: 30),
              _buildServiceCategory(
                'Pielęgnacja twarzy',
                Icons.face,
                [
                  _buildServiceSubcategory('ZABIEGI OCZYSZCZANIA TWARZY', [
                    ServiceItem('Oczyszczanie manualne + maska kremowa', '150,-'),
                    ServiceItem('+ masaż twarzy / maska algowa', '170,-'),
                    ServiceItem('+ masaż twarzy + maska algowa', '200,-'),
                    ServiceItem('+ masaż twarzy + maska algowa + sonoforeza', '220,-'),
                    ServiceItem('Peeling kawitacyjny + maska kremowa', '80,-'),
                    ServiceItem('Peeling kawitacyjny + oczyszczanie manualne + maska kremowa / maska algowa', '170,-/190,-'),
                    ServiceItem('Peeling kawitacyjny + oczyszczanie manualne + masaż twarzy + sonoforeza + maska algowa', '250,-'),
                    ServiceItem('Oczyszczanie wodorowe (pełny zabieg z wykorzystaniem ultradźwięków, fal radiowych, infuzji tlenowej, zimnego młotka)', '300,-'),
                  ]),
                  _buildServiceSubcategory('DERMOKOSMETYCZNA REGENERACJA SKÓRY', [
                    ServiceItem('MANDELIC 40% - złuszczenie kwasem migdałowym 40% (Natinuel) /+ masaż twarzy', '160,-/200,-'),
                    ServiceItem('AMBER ACID 30% - złuszczenie kwasem bursztynowym', '150,-'),
                    ServiceItem('SHIKIMIC ACID 30% - złuszczenie kwasem szikimowym', '150,-'),
                  ]),
                  _buildServiceSubcategory('MIKRODERMABRAZJA DIAMENTOWA', [
                    ServiceItem('Twarz + szyja (pełny zabieg z masażem twarzy i maską algową)', '180,-'),
                    ServiceItem('Twarz + szyja + dekolt (pełny zabieg z masażem twarzy i maską algową)', '200,-'),
                  ]),
                  _buildServiceSubcategory('ZABIEGI PIELĘGNACYJNE', [
                    ServiceItem('Hydrology Skin Care – zabieg nawadniająco-probiotyczny', '250,-'),
                    ServiceItem('Peptide Skin Therapy – zabieg odmładzjąco-liftingujący', '250,-'),
                    ServiceItem('Aroma Nature Formula – regenerująco-aromatyczny zabieg z naturalnymi eco-olejami', '300,-'),
                    ServiceItem('C-Vital Glow – terapia rozświetlająca z mikroeksfoliacją', '350,-'),
                    ServiceItem('Skin-Art & Lifting – zabieg liftingująco-wypełniający na twarz', '360,-'),
                    ServiceItem('Capill & Age Therapy – zabieg na naczynka do cer dojrzałych', '230,-'),
                    ServiceItem('Hydracure – zaawansowany program intensywnego nawilżenia', '300,-'),
                    ServiceItem('Timexpert Lift (IN) – zaawansowany program ujdrniająco-liftingujący', '330,-'),
                    ServiceItem('Excel Therapy O2 Cityproof – intensywny program anti-pollution', '300,-'),
                    ServiceItem('Royal Jelly – regeneracja i odżywienie skóry', '280,-'),
                  ]),
                  _buildServiceSubcategory('POZOSTAŁE ZABIEGI', [
                    ServiceItem('Pół zabieg dobrany do potrzeb skóry (peeling + masaż twarzy + maska kremowa / maska algowa)', '130,-/150,-'),
                    ServiceItem('Masaż twarzy', '60,-'),
                  ]),
                ],
              ),
              _buildServiceCategory(
                'Pielęgnacja okolic oczu',
                Icons.visibility,
                [
                  _buildServiceSubcategory('', [
                    ServiceItem('Cudowne spojrzenie – zabieg nawilżająco-regenerujący skórę wokół oczu', '80,-'),
                  ]),
                ],
              ),
              _buildServiceCategory(
                'Pielęgnacja ciała',
                Icons.spa,
                [
                  _buildServiceSubcategory('ZABIEGI PIELĘGACYJNE', [
                    ServiceItem('Flowers & Senses – zabieg wygładzający na ciało z ekstraktami z kwiatów', '320,-'),
                  ]),
                  _buildServiceSubcategory('ZABIEGI OCZYSZCZAJĄCE I ZŁUSZCZAJĄCE', [
                    ServiceItem('Oczyszczanie pleców', '150,-'),
                    ServiceItem('Mikrodermabrazja pleców', '160,-'),
                    ServiceItem('Peeling migdałowy pleców', '180,-'),
                  ]),
                ],
              ),
              _buildServiceCategory(
                'Pielęgnacja dłoni',
                Icons.back_hand,
                [
                  _buildServiceSubcategory('', [
                    ServiceItem('Manicure klasyczny', '50,-'),
                    ServiceItem('Manicure Vinylux', '60,-'),
                    ServiceItem('Manicure hybrydowy', '90,-'),
                    ServiceItem('Malowanie hybrydowe', '65,-'),
                    ServiceItem('Usunięcie lakieru hybrydowego', 'od 20,-'),
                    ServiceItem('Przedłużenie 1 paznokcia', '20,-'),
                    ServiceItem('Manicure SPA (peeling+manicure+maska/parafina)', '80,-/90,-'),
                    ServiceItem('Manicure SPA hybrydowy (peeling+manicure+maska/parafina)', '120,-/135,-'),
                    ServiceItem('Peeling + maska na dłonie / parafina', '40,-/50,-'),
                  ]),
                ],
              ),
              _buildServiceCategory(
                'Pielęgnacja stóp',
                Icons.girl,
                [
                  _buildServiceSubcategory('', [
                    ServiceItem('Pedicure kosmetyczny', '90,-'),
                    ServiceItem('Pedicure leczniczy (wrastające paznokcie, modzele, odciski)', 'od 100,-'),
                    ServiceItem('Pedicure Vinylux', '95,-'),
                    ServiceItem('Półpedicure (opracowanie i malowanie paznokci / Vinylux)', '60,-/65,-'),
                    ServiceItem('Pedicure hybrydowy (pełny pedicure+ hybryda)', '150,-'),
                    ServiceItem('Pedicure hybrydowy SPA (peeling, pedicure, maska)', '160,-'),
                    ServiceItem('Półpedicure hybrydowy', '85,-'),
                    ServiceItem('Pedicure SPA (peeling, pedicure, maska/parafina)', '120,-/140,-'),
                    ServiceItem('Maska na stopy / parafina (zabieg z peelingiem)', '50,-/60,-'),
                  ]),
                ],
              ),
              _buildServiceCategory(
                'Depilacja woskiem',
                Icons.content_cut,
                [
                  _buildServiceSubcategory('', [
                    ServiceItem('Wąsik / Bródka', '15,-/25,-'),
                    ServiceItem('Baczki', '30,-'),
                    ServiceItem('Depilacja twarzy (wąsik, bródka, baczki, policzki)', '60,-'),
                    ServiceItem('Nogi do kolan / Całe nogi', '60,-/90,-'),
                    ServiceItem('Bikini', 'od 30,-'),
                    ServiceItem('Paszki', '40,-'),
                    ServiceItem('Ręce całe / do łokci', '50,-/40,-'),
                  ]),
                ],
              ),
              _buildServiceCategory(
                'Makijaż',
                Icons.brush,
                [
                  _buildServiceSubcategory('', [
                    ServiceItem('Makijaż dzienny / biznesowy', '80,-'),
                    ServiceItem('Makijaż wieczorowy', '100,-'),
                    ServiceItem('Makijaż ślubny', '100,-'),
                    ServiceItem('Makijaż męski - korekcyjny', '50,-'),
                    ServiceItem('Kępki rzęs, rzęsy całościowe, brokat, kryształki Swarovskiego, elementy dekoracyjne i biżuteryjne (doliczane do makijażu)', 'od 5,-'),
                  ]),
                ],
              ),
              _buildServiceCategory(
                'Henna',
                Icons.color_lens,
                [
                  _buildServiceSubcategory('', [
                    ServiceItem('Brwi', '25,-'),
                    ServiceItem('Rzęsy', '25,-'),
                    ServiceItem('Regulacja', '20,-'),
                    ServiceItem('Henna brwi, regulacja', '35,-'),
                    ServiceItem('Henna brwi, rzęs, regulacja', '45,-'),
                    ServiceItem('Przekłucie uszu (kolczyki w cenie)', '80,-'),
                  ]),
                ],
              ),
              const SizedBox(height: 40),
              // Footer
              const BeautyStudioFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCategory(String title, IconData icon, List<Widget> subcategories) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.brown.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.brown,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.brown,
                  ),
                ),
              ],
            ),
          ),
          ...subcategories,
        ],
      ),
    );
  }

  Widget _buildServiceSubcategory(String title, List<ServiceItem> services) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty) ...[
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.brown,
              ),
            ),
            const SizedBox(height: 12),
          ],
          ...services.map((service) => _buildServiceItem(service)),
        ],
      ),
    );
  }

  Widget _buildServiceItem(ServiceItem service) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.brown.withValues(alpha: 0.1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              service.name,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textColor,
                height: 1.3,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.brown,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              service.price,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceItem {
  final String name;
  final String price;

  ServiceItem(this.name, this.price);
}