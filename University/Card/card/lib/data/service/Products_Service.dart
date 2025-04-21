import '../model/Product.dart';

class ProductService {
	
	List<Product> market = [];

	ProductService(){
		market.add(Product(name: 'FRUCO Salsa de Tomate Galon 4,35kg',description: 'Auténtica salsa de tomate con un porcentaje de sólidos solubles de tomate que traduce mejor sabor y color natural. Producto color rojo obscuro con sabor a tomate, especias y condimentos.',price : 75.526, existence : 7, imageURL : 'https://imagedelivery.net/4fYuQyy-r8_rpBpcY7lH_A/falabellaCO/120005488_01/w=1500,h=1500,fit=pad'));
		market.add(Product(name: 'Galletas SALTIN NOEL Tradicional x6 Tacos', description:'Galletas saltín noel tradicional. Contiene 6 tacos. 85% contenido de cereal. Conservar este producto en un lugar fresco y seco,protegido de la luz directa y alejado de olores fuertes.', price: 9.520, existence: 17, imageURL:'https://exitocol.vtexassets.com/arquivos/ids/26634076/Galletas-Crakers-Tradicionales-X-570-Gr-X-6-Tacos-555910_a.jpg?v=638739408142170000'));
		market.add(Product(name: 'Detergente En Polvo FAB Ultra Flash 4.5kg', description: 'Despercude y remueve manchas de grasa y comida, tiene bio enzimas rápidas e inteligentes, con capsulas de perfume duraderas. Maxima Limpieza y cuidado, minimo esfuerzo.', price: 28.980, existence: 1, imageURL: 'https://http2.mlstatic.com/D_NQ_NP_682053-MCO73834803497_012024-O.webp'));
		market.add(Product(name: 
	'Suavizante SUAVITEL Cuidado Superior Fresca Primavera 5600ml', description: 'Cuida de tus prendas favoritas utilizando el Suavizante de Ropa Suavitel Cuidado Superior Fresca Primavera en su presentación de 2.8L, que cuenta con una poderosa fórmula que se apodera de las telas para invadir de suavidad y fragancia. Descubre cómo en cada aplicación el suavizante de ropa (antes Soflan Suavitel) te proporciona sus cualidades para mantener el color y una textura agradable al tacto en todo momento. Disfruta de la deliciosa fragancia de Suaviteles que te acompañará durante todo el día y neutraliza los olores desagradables que se adhieren a la ropa durante tus actividades diarias. Con su presentación de 800 ml podrás compartir de tus beneficios con los integrantes de tu familia.', price: 32.935, existence: 23, imageURL:'https://exitocol.vtexassets.com/arquivos/ids/26779330/Suave-Primaveral-Bipack-SUAVITEL-61028800-3287702_a.jpg?v=638749872409100000'));
	market.add(Product(name: 'Jabon PROTEX Avena Barra x6 unidades 110gr', description: 'Consiente tu piel con el Jabón Antibacterial Avena Barra, su presentación con 6 unidades de 110 g. Jabón crea una barrea de protección prolongada, misma que ayuda a prevenir la aparición de bacterias en tu piel. Podrás complementar tu rutina de limpieza diaria y consentirlo al mismo tiempo. Dale a tu cuerpo el cuidado necesario, elimina el 99.9% de los microorganismos que dañan tu salud y te protege contra ellos, al nutrir y fortalecer tu piel con el aceite de linaza que contiene. Su fórmula con avena te ayudará a cuidarte, mientras remueve impurezas. Déjate envolver por su rico aroma y renuévate día con día con este jabón antibacterial.', price: 15.960, existence: 41, imageURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMBFtXySHkgtsveKErgB9G5XT_fA_xxKJFHg&s'));
	market.add(Product(name: 'Crema Dental COLGATE Blanqueadora Luminous Brilliant 150ml', description: 'Consigue una sonrisa más blanca en solo una semana, con la Crema Dental Colgate Luminous White Brilliant podrás lograrlo fácilmente. Obtén resultados profesionales cumpliendo con tu rutina de cuidado e higiene oral; deja que Colgate Luminous White te ayude a conseguir una sonrisa más clara, gracias a su fabulosa fórmula que además protege el esmalte de posibles daños, así mantendrás siempre piezas dentales saludables. Está adicionada con flúor, ingrediente que se encarga de reforzar desde el interior de cada diente para evitar la formación de caries. Consíguela en su presentación de 75 ml y observa los increíbles resultados con un uso constante. ¡Compra ahora y da el primer paso hacia una salud bucal completa!', price: 22.360, existence: 2, imageURL: 'https://exitocol.vtexassets.com/arquivos/ids/26770054/Crema-luminous-white-x-2-und-968791_a.jpg?v=638749144546130000'));
	}


	List<Product> getProducts(){
		return market;
	}
}

