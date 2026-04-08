// Import external packages
// Math and symbols
#import "@preview/physica:0.9.7": *
// Drawing circuit diagrams
#import "@preview/circuiteria:0.2.0": *

// Fix numbering and document look
#set heading(numbering: "1.")
#show title: set text(size: 20pt)
#show title: set align(center)
#set text(
  lang: "pl",
)
#set par(justify: true)
#set page(margin: 2cm)
#set heading(numbering: "1.")
#show heading: it => {
  if it.level > 1 {
    // We just render the body text.
    // This removes the number AND the indent.
    block(
      sticky: true,
      // above: 1.5em,
      // below: 1em,
      text(weight: "bold", size: 1.1em, it.body),
    )
  } else {
    // Let level 1 headings pass through normally
    it
  }
}
// ======================================
// Document Start
// ======================================

#text(size: 14pt, weight: 600)[
  #align(right)[14.03.2026]
]

#title[
  Elektronika Raport
  Laboratorium I
]
#text(size: 14pt)[
  #grid(
    columns: (1fr, 1fr),
    align(center)[Mateusz Kamiński], align(center)[Stanowisko 5],
  )
]
// \
// \
// \
// \
// \
= Opis wykonanych ćwiczeń
== Ćwiczenie 1.1: Obsługa oscyloskopu i generatora
=== Teoria
- *Oscyloskop cyfrowy*: Przyrząd pomiarowy służący do wizualizacji i analizy zmiennych sygnałów napięciowych w dziedzinie czasu. Umożliwia bezpośredni pomiar m.in. amplitudy , częstotliwości oraz obserwację przesunięć fazowych badanych przebiegów
- *Generator funkcyjny*: Służy do generowania napięć o zadanym kształcie (np. sinus, trójkąt, prostokąt) oraz precyzyjnie strojonej amplitudzie, częstotliwości i fazie.

=== Zapoznanie się z działaniem oscyloskopu
// ==========================================
// Photo
// ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./photos/Tektronix.png", width: 80%),
  alt: "Chart png here",
  caption: [Panel frontowy oscyloskopu cyfrowego Tektronix MSO22
  
  ],
) <oscyloskop>
// To ref in code use @photo_name_to_reference

A) *Włączenie kanałów*: Przebiega po ówczesnym włączeniu oscyloskopu przyciskiem zasilania (7 na @oscyloskop.) Następnie włączono kanały CH1 oraz CH2 przy pomocy żółtego '1' oraz niebieskiego guzika '2' (przy 5 na @oscyloskop).

B) *Zmiana skali pionowej i poziomej*: Skalę pionową (V/div) oraz poziomą (s/div) modyfikowano za pomocą pokręteł „scale”.

C) *Zmiana położenia w pionie i poziomie*: Położenie sygnału regulowano przy użyciu pokręteł „position”.

D) *Zapis sygnału w formacie #strike[ASCII] i PNG*: Wyeksportowano przebieg sygnału przy użyciu narzędzia _TekScope Utility_

*Korekcja współczynnika skalowania*: W ustawieniach kanałów oscyloskopu konieczna była zmiana współczynnika skalowania na 1X. Urządzenie domyślnie ustawia wartość 10X, co powodowało dziesięciokrotne zawyżenie odczytywanego napięcia.

=== Zadanie praktyczne

W ramach zadania praktycznego przeprowadzono konfigurację parametrów oscyloskopu, obejmującą następujące kroki:

+ *Aktywacja kanałów*: Włączono kanały CH1 oraz CH2.
+ *Konfiguracja czułości pionowej*: Skalę napięciową ustawiono:
  - CH1: 500 mV/div
  - CH2: 100 mV/div
+ *Konfiguracja podstawy czasu*: Skalę poziomą dopasowano do wartości 10 ns/div.
+ *Pozycjonowanie przebiegów*: Sygnał z kanału CH1 umieszczono na poziomie 2/8 wysokości ekranu licząc od górnej krawędzi, natomiast sygnał z kanału CH2 wyśrodkowano w pionie.
+ *Rejestracja wyników*: Po zgłoszeniu i pozytywnej weryfikacji konfiguracji przez prowadzącego zajęcia, dokonano zapisu przebiegów, eksportując je do formatów PNG oraz #strike[ASCII].

// ==========================================
// Photo
// ==========================================
#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./screens/Cw_1_1_skala_widok.png", width: 80%),
  alt: "Chart png here",
  caption: [Ustawiony oscyloskop
  ],
) <panel1>
// To ref in code use @photo_name_to_reference

=== Zapoznanie się z działaniem generatora funkcyjnego

// ==========================================
// Photo
// ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./photos/generator.png", width: 70%),
  alt: "Chart png here",
  caption: [Panel frontowy generatora funkcyjnego Tektronix AFG 3022C
  ],
) <generator>
// To ref in code use @photo_name_to_reference

A) *Podawanie sygnału na wejście oscyloskopu*: Przebiega po ówczesnym włączenie generatora przyciskiem _Power On/Off switch_ (@generator) Sygnał z wyjścia generatora doprowadzono do wejścia pomiarowego oscyloskopu za pomocą przewodu BNC, a następnie aktywowano generację przebiegu dedykowanym przyciskiem załączającym wyjście (oznaczonym _CH1 and CH2 Output connectors_ na @generator).

#grid(
  columns: (1fr, 1fr),
  align(center)[
    #figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4068.jpg", width: 100%),
      alt: "Chart png here",
      caption: [Wyjście sygnału na oscyloskop
      ],
    ) <polaczenie1>],

  align(center)[
    #figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4069.jpg", width: 100%),
      alt: "Chart png here",
      caption: [Doprowadzenie sygnału do wejścia CH2 
      ],
    ) <polaczenie2>],
)

B) *Zmiana rodzaju generowanego sygnału*: Kształt fali modyfikowano przy użyciu przycisków funkcyjnych z bloku _Function Buttons_ (zob. @generator).

C) *Zmiana amplitudy generowanego sygnału*: Z poziomu menu _Shortcut Buttons_ wybrano opcję _Amplitude/High_ (zob. @generator).

D) *Zmiana częstotliwości generowanego sygnału*: Analogicznie do poprzedniego kroku, wykorzystując blok _Shortcut Buttons_, kliknięto parametr _Frequency/Period_ (zob. @generator lub @polaczenie1) w celu ustalenia żądanej częstotliwości przebiegu.

=== Kontynuacja obsługi oscyloskopu

E) *Zmiana sposobu wyzwalania*: Na wejścia oscyloskopu podawano sygnały o zróżnicowanej charakterystyce (sinusoidalny, prostokątny, trójkątny), weryfikując poprawność ich odwzorowania na ekranie. Następnie przeprowadzono testy układu wyzwalania _Trigger_ (sekcja 3 @oscyloskop)

F) *Zmiana ustawień kanałów*: Dostosowano amplitudę i położenie pionowe przebiegów, aby uniknąć ich nakładania się na ekranie oraz zapewnić czytelność przy zmiennych częstotliwościach.

=== Zadanie praktyczne
+ *Konfiguracja generatora*: Na kanale CH2 generatora ustawiono przebieg trójkątny o amplitudzie $1.55V_(p p)$  oraz częstotliwości 15 kHz.
+ *Optymalizacja wyświetlania*: Wykorzystując regulację czułości pionowej oraz podstawy czasu, przeskalowano obraz tak, aby badany sygnał zajmował całą wysokość ekranu oscyloskopu (maksymalizacja rozdzielczości pionowej).
+ *Rejestracja wyników*: Po weryfikacji przez prowadzącego, zarejestrowano przebieg 

// ==========================================
// Side be side cmp
// ==========================================

#grid(
  columns: (1fr, 1fr),
  align(center)[
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/trojkatny15KHZ.png", width: 95%),
      alt: "Chart png here",
      caption: [Sygnał trójkątny (skala 10 X, zła amplituda)
      ],
    ) <trojkat>],

  align(center)[
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/trójkatny większy.png", width: 95%),
      alt: "Chart png here",
      caption: [skalowanie pionowe @trojkat
      ],
    ) <photo2>],
)

W celu poprawnej synchronizacji obu urządzeń przeprowadzono następującą procedurę:
- Na generatorze przejście do menu ustawień wyjścia: _Top Menu_ -> _Output Menu_ -> _Load Impedance_.
- Zmiana trybu pracy na *High Z* (wysoka impedancja).
Dzięki temu dopasowano impedancję wyjściową generatora do wysoko-omowego wejścia oscyloskopu, co wyeliminowało błąd mnożenia amplitudy i pozwoliło na uzyskanie rzeczywistego odczytu $1.55 V_(p p)$.

#grid(
  columns: (1fr, 1fr),
  align(center)[
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/Adjust Oscyloskopu, synchronizacja z generatorem.png", width: 95%),
      alt: "Chart png here",
      caption: [Poprawna amplituda po synchronizacji oscyloskopu
      ],
    ) <photo1>],

  align(center)[
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./screens/Amplituda poprawna(1.55Vpp), max 775mV min -775mV.png", width: 95%),
      alt: "Chart png here",
      caption: [Potwierdzenie amplitudy $1.55 V_(p p)$ ($+- 775 m V$)
      ],
    ) <photo2>],
)

// ==========================================
// Photo
// ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./photos/IMG_4068.jpg", width: 50%),
  alt: "Chart png here",
  caption: [Potwierdzenie wartości na generatorze
  ],
) <photo_name_to_reference>
// To ref in code use @photo_name_to_reference

// ==========================================
// Side be side cmp
// =========================================

=== Wnioski

Podsumowując ćwiczenie, kluczowe dla poprawności pomiarów są trzy aspekty:
- *Synchronizacja (High Z)*: Niezbędna, aby uniknąć dwukrotnego przekłamania amplitudy ($2 times$).
- *Skala (1X)*: Konieczna do weryfikacji, by oscyloskop nie zawyżał wyników dziesięciokrotnie.
- *Trigger*: Kluczowy dla stabilizacji obrazu i zatrzymania "pływania" sygnału na ekranie.

=== Zapoznanie się z mierzeniem wielkości

W diagnostyce sygnałów za pomocą oscyloskopu wyróżnia się trzy główne techniki pomiarowe, różniące się stopniem precyzji oraz szybkością uzyskania wyniku:

- *A) Pomiar "na oko"*: Polega na bezpośrednim zliczaniu działek siatki (_div_) na ekranie i ręcznym przeliczaniu ich wartości zgodnie z aktualną czułością pionową ($V/div$) oraz podstawą czasu ($s/div$).

- *B) Pomiar za pomocą kursorów*: Wykorzystuje ruchome linie pomocnicze – kursory pionowe (czasowe). Kluczowe jest użycie funkcji _Fine_, która zmienia skok kursorów na precyzyjny, umożliwiając ich dokładne "dociągnięcie" do krawędzi sygnału. Wynik ($Delta V$ lub $Delta t$) jest wyliczany przez urządzenie na podstawie różnicy położeń kursorów.

- *C) Pomiary wbudowanymi funkcjami*: Wykorzystują wbudowane algorytmy przetwarzania sygnału (funkcja _Measure_).

=== Zadanie praktyczne

Celem zadania było wyznaczenie amplitudy ($V_(m a x)$) oraz częstotliwości dla trzech różnych przebiegów z generatora.

#grid(
  columns: (1fr, 1fr),
  align(center)[
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./pomiary/AB oraz AC.png", width: 110%),
      alt: "Chart png here",
      caption: [Fala sinusoidalna ($1V$, $3k H z$)
      ],
    ) <photo1>],

  align(center)[
    #figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4072.jpg", width: 90%),
      alt: "Chart png here",
      caption: [Fala sinusoidalna - zapis z generatora
      ],
    ) <photo2>],
)

#grid(
  columns: (1fr, 1fr),
  align(center)[
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./pomiary/BB oraz BC.png", width: 110%),
      alt: "Chart png here",
      caption: [Fala trójkątna ($2.5V$, $10k H z$, $10^o$)
      ],
    ) <photo1>],

  align(center)[
    #figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4071.jpg", width: 90%),
      alt: "Chart png here",
      caption: [Fala trójkątna - zapis z generatora
      ],
    ) <photo2>],
)

#grid(
  columns: (1fr, 1fr),
  align(center)[
    #figure(
      kind: "chart",
      supplement: [Wykres],
      image("./pomiary/CB oraz CC.png", width: 110%),
      alt: "Chart png here",
      caption: [Fala prostokątna ($0.5V$, $50k H z$, $180^o$)
      ],
    ) <photo1>],

  align(center)[
    #figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4070.jpg", width: 90%),
      alt: "Chart png here",
      caption: [Fala prostokątna - zapis z generatora
      ],
    ) <photo2>],
)

// ==========================================
// Chart
// ==========================================
// #figure(
//   kind: "chart",
//   supplement: [Wykres],
//   image("/pomiary/AB oraz AC.png", width: 70%),
//   alt: "Chart png here",
//   caption: [Chart description
//   ],
// ) <chart_name_to_reference>

// // To ref in code use @chart_name_to_reference
// // ==========================================
// // Chart
// // ==========================================
// #figure(
//   kind: "chart",
//   supplement: [Wykres],
//   image("/pomiary/BB oraz BC.png", width: 70%),
//   alt: "Chart png here",
//   caption: [Chart description
//   ],
// ) <chart_name_to_reference>

// // To ref in code use @chart_name_to_reference
// // ==========================================
// // Chart
// // ==========================================
// #figure(
//   kind: "chart",
//   supplement: [Wykres],
//   image("/pomiary/CB oraz CC.png", width: 70%),
//   alt: "Chart png here",
//   caption: [Chart description
//   ],
// ) <chart_name_to_reference>
// // To ref in code use @chart_name_to_reference

=== Analiza dokładności poszczególnych metod pomiaru

- *A) Metoda "na oko"*: Jest to metoda wstępna, obarczona największym błędem odczytu.

- *B) Metoda kursorowa*: Użycie funkcji *Fine* pozwala na precyzyjne dopasowanie linii do charakterystycznych punktów sygnału co znacząco podnosi dokładność odczytu w porównaniu do metody "na oko", ale nadal wymaga ręcznego ustawienia przez człowieka co może powodować błędy.

- *C) Metoda wbudowanymi funkcjami*: Jest to metoda o najwyższej powtarzalności, eliminująca błąd ludzki przy odczycie skali.

=== Tabela zestawienia wyników pomiarowych
#[
  #set table(
    stroke: 1pt + luma(180),
    fill: (x, y) => if y == 0 { luma(40) } else if y > 4 and y < 9 { luma(235) },
    inset: 7pt,
  )

  #show table.cell: it => {
    if it.y == 0 {
      set text(white)
      strong(it)
    } else {
      it
    }
  }

  #figure(
    kind: "table",
    supplement: [Tabela],
    table(
      columns: (1fr, 1fr, 1fr, 1fr),
      align: center + horizon,
      table.vline(start: 0, stroke: 2pt + luma(180)),
      table.header([*Sygnał*], [*Metoda*], [*Amplituda $V_(m a x)$ [V]*], [*Częstotliwość* [kHz]]),
      table.vline(start: 0, stroke: 2pt + luma(180)),
      // --- SYGNAŁ A ---
      table.cell(rowspan: 4)[*Sinus*\ $1 V quad 3 k H z$],
  [*Generator*], [*1.00*], [*3.00*],
  [Na oko], [1.00], [3.03],
  [Kursory], [1.008], [3.00],
  [Measure], [1.032], [3.00],

      // --- SYGNAŁ B ---
      table.hline(stroke: 2pt + luma(180)),
      table.cell(rowspan: 4)[*Trójkąt*\ $2.5 V quad 10 k H z$],
 [*Generator*], [*2.50*], [*10.00*],
  [Na oko], [2.40], [10.0],
  [Kursory], [2.519], [10.02],
  [Measure], [2.520], [10.00],

      // --- SYGNAŁ C ---
      table.hline(stroke: 2pt + luma(180)),
      table.cell(rowspan: 4)[*Prostokąt*\ $0.5 V quad 50 k H z$],
  [*Generator*], [*0.50*], [*50.00*],
  [Na oko], [0.50], [50.0],
  [Kursory], [0.5037], [49.94],
  [Measure], [0.5042], [50.00],
      table.hline(stroke: 2pt + luma(180)),
    ),
    caption: [Porównanie wartości otrzymanych różnymi metodami
    ],
  ) <methods_comparison_table>
]

== Ćwiczenie 1.2: Krzywe Lissajous

=== Teoria

- *Tryb pracy X-Y oscyloskopu*: W standardowym trybie pracy (Y-t) oś pozioma reprezentuje czas, a pionowa napięcie. Od tego momentu za wychylenie poziome odpowiada sygnał podany na wejście kanału 1 (X), a za wychylenie pionowe – sygnał z kanału 2 (Y). Ekran staje się układem współrzędnych, w którym położenie punktu w danej chwili $t$ jest opisane parą napięć $[u_1(t), u_2(t)]$.

- *Efekt złożenia dwóch drgań harmonicznych*
Zjawisko to zachodzi, gdy na jeden punkt oddziałują jednocześnie dwa wzajemnie prostopadłe ruchy okresowe.
- $x(t) = A_x sin(omega_x t + phi_x)$
- $y(t) = A_y sin(omega_y t + phi_y)$
Wypadkowy tor ruchu nie jest już funkcją czasu, lecz zależnością jednego wychylenia od drugiego. Jeśli stosunek częstotliwości $omega_x / omega_y$ jest liczbą wymierną, tor ten tworzy zamkniętą i stabilną krzywą.

- *Krzywe Lissajous*
Są to specyficzne trajektorie powstające w wyniku powyższego złożenia drgań harmonicznych. Ich kształt jest zdeterminowany przez dwa parametry:
- *Stosunek częstotliwości*: decyduje o liczbie "pętli" figury (np. 1:1, 1:2).
- *Różnica faz ($phi$)*: decyduje o "otwarciu" figury (np. od linii prostej przy $0^o$ do okręgu przy $90^o$).

*Cel ćwiczenia:* Wykorzystanie trybu pracy X–Y oscyloskopu do obserwacji i analizy efektu złożenia dwóch prostopadłych drgań harmonicznych, co w wyniku daje krzywe Lissajous.

// ==========================================
// Photo
// ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./photos/krzywe.png", width: 70%),
  alt: "Chart png here",
  caption: [Teoretyczne wykresy krzywych Lissajous
  ],
) <krzywe>
// To ref in code use @photo_name_to_reference

// ==========================================
// Side be side cmp
// ==========================================

=== Stosunek częstotliwości 3:2 
#grid(
  columns: (1.5fr, 1fr),
  gutter: 1em,
  align: center + horizon,

  // --- LEWA STRONA: WYKRES ---
  figure(
    kind: "chart",
    supplement: [Wykres],
    image("./screens/3_2 90 faza.png", width: 100%),
    caption: [Krzywa Lissajous ($3:2, 90^o$)],
  ),

  // --- PRAWA STRONA: GENERATORY ---
  grid(
    columns: (1fr),
    gutter: 0.5em,
    figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4079.jpg", width: 100%),
      caption: [Generator 1],
    ), // <-- Tu był brakujący przecinek
    figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4078.jpg", width: 100%),
      caption: [Generator 2],
    ),
  ),
)

Uzyskana krzywa nie pokrywa się z teoretyczną na @krzywe (indexując od 1) (4 wiersz 2 kolumna)

=== Stosunek częstotliwości 1:3 
#grid(
  columns: (1.5fr, 1fr),
  gutter: 1em,
  align: center + horizon,

  // --- LEWA STRONA: WYKRES ---
  figure(
    kind: "chart",
    supplement: [Wykres],
    image("./screens/1_3 180 faza.png", width: 100%),
    caption: [Krzywa Lissajous ($1:3, 45^o$)],
  ),

  // --- PRAWA STRONA: GENERATORY ---
  grid(
    columns: (1fr),
    gutter: 0.5em,
    figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4075.jpg", width: 100%),
      caption: [Generator 1],
    ), // <-- Tu był brakujący przecinek
    figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4074.jpg", width: 100%),
      caption: [Generator 2],
    ),
  ),
)

Uzyskano krzywą praktycznie zgodną z @krzywe (3 wiersz 3 kolumna) z dokładnością do łączenia się punktów, które są lekko rozbujane na boki.

=== Stosunek częstotliwości 2:3
#grid(
  columns: (1.5fr, 1fr),
  gutter: 1em,
  align: center + horizon,

  // --- LEWA STRONA: WYKRES ---
  figure(
    kind: "chart",
    supplement: [Wykres],
    image("./screens/3_2 90 faza kolejna.png", width: 100%),
    caption: [Krzywa Lissajous ($2:3, 45^o$)],
  ),

   // --- PRAWA STRONA: GENERATORY ---
  grid(
    columns: (1fr),
    gutter: 0.5em,
    figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4074.jpg", width: 100%),
      caption: [Generator 1],
    ), // <-- Tu był brakujący przecinek
    figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4075.jpg", width: 100%),
      caption: [Generator 2],
    ),
  ),
)

Uzyskano krzywą zgodną z @krzywe (4 wiersz 3 kolumna), lecz przy pomocy innej fazy $45^o$ zamiast teoretycznej $90^o$.

=== Stosunek częstotliwości 4:5
#grid(
  columns: (1.5fr, 1fr),
  gutter: 1em,
  align: center + horizon,

  // --- LEWA STRONA: WYKRES ---
  figure(
    kind: "chart",
    supplement: [Wykres],
    image("./screens/4_5 faza 90.png", width: 100%),
    caption: [Krzywa Lissajous ($4:5, 90^o$)],
  ),

   // --- PRAWA STRONA: GENERATORY ---
  grid(
    columns: (1fr),
    gutter: 0.5em,
    figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4077.jpg", width: 90%),
      caption: [Generator 1],
    ),
    figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4076.jpg", width: 90%),
      caption: [Generator 2],
    ),
  ),
)

Uzyskano krzywą zgodną z przewidywaniami teoretycznymi.

=== Stosunek częstotliwości 1:2 
#grid(
  columns: (1.5fr, 1fr),
  gutter: 1em,
  align: center + horizon,

  // --- LEWA STRONA: WYKRES ---
  figure(
    kind: "chart",
    supplement: [Wykres],
    image("./screens/1_2 faza 90.png", width: 100%),
    caption: [Krzywa Lissajous ($1:2, 90^o$)],
  ),

   // --- PRAWA STRONA: GENERATORY ---
  grid(
    columns: (1fr),
    gutter: 0.5em,
    figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4084.jpg", width: 100%),
      caption: [Generator 1],
    ),
    figure(
      kind: "photo",
      supplement: [Zdjęcie],
      image("./photos/IMG_4085.jpg", width: 100%),
      caption: [Generator 2],
    ),
  ),
)

Uzyskano krzywą zgodną z @krzywe (2 wiersz 2 kolumna), lecz ponownie dopiero przy użyciu innej fazy $90^o$ zamiast $45^o$.

=== Wnioski
Zaobserwowane krzywe Lissajous w połowie przypadków odpowiadały teoretycznym kształtom dla zadanych stosunków częstotliwości oraz różnicy faz, posługując się np. @krzywe. W innych przypadkach figury potrzebowały innej fazy do uzyskania pożądanego kształtu lub wyprodukowano inną krzywą.

== Ćwiczenie 1.3: Sumowanie dwóch sygnałów sinusoidalnych

=== Teoria 

- *Zjawisko dudnień*: powstaje w wyniku superpozycji (sumowania) dwóch sygnałów sinusoidalnych o zbliżonych częstotliwościach ($f_1 approx f_2$) i jednakowych amplitudach. Efektem jest sygnał o zmiennej amplitudzie.

- *Kluczowe parametry*: Częstotliwość wypadkowa ($f_w$): Jest średnią arytmetyczną obu składowych. Określa częstotliwość "szybkich" drgań wewnątrz obwiedni.
   $ f_w = (f_1 + f_2) / 2. $
   
- *Częstotliwość dudnień ($f_d$):* Określa, jak często amplituda sygnału wypadkowego narasta i zanika
   $ f_d = |f_1 - f_2|. $

=== Zadanie praktyczne
Wykonać sumowanie dwóch sygnałów
sinusoidalnych o jednakowych
amplitudach i zbliżonych
częstotliwościach, np. dla sygnałów $1000$ kHz i $1050$ kHz

=== Obliczenia teoretyczne <obliczenia>

Dla zadanych parametrów sygnałów składowych:
$ f_1 = 1000 " kHz", quad f_2 = 1050 " kHz" $


1. *Częstotliwość wypadkowa ($f_w$):*
#set align(center)
   $ f_w = (f_1 + f_2) / 2 = (1000 + 1050) / 2 = bold(1025 "kHz") = bold(1.025 "MHz") $

#set align(left)
2. *Częstotliwość dudnień ($f_d$):*
#set align(center)
   $ f_d = |f_1 - f_2| = |1000 - 1050| = bold(50 "kHz") $

#set align(left)   
W przeprowadzonym ćwiczeniu , oczekiwana częstotliwość wypadkowa wynosi $1025$ kHz, a częstotliwość dudnień $50$ kHz.

// ==========================================
// Photo
// ==========================================
#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./screens/sinusy 1000 i 1050.png", width: 80%),
  alt: "Chart png here",
  caption: [Przygotowanie dwóch fal sinusoidalnych
  ],
) <photo_name_to_reference>
// To ref in code use @photo_name_to_reference

// ==========================================
// Photo
// ==========================================
#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./screens/Nałozenie fali.png", width: 85%),
  alt: "Chart png here",
  caption: [Zsumowanie dwóch fal sinusoidalnych, wizualizacja zjawiska dudnień
  ],
) <dudnienia>
// To ref in code use @photo_name_to_reference

Na @dudnienia zaobserwowano *zjawisko dudnień*. Charakterystyczną cechą tego przebiegu jest zmienna amplituda sygnału wypadkowego, która okresowo narasta i zanika. 

W środkowej części wykresu widoczne jest wyraźne przewężenie węzłów, gdzie amplitudy obu składowych sygnałów odejmują się, prowadząc do niemal całkowitego wygaszenia drgań.

// ==========================================
// Photo
// ==========================================
#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./screens/czestotliwość dudnień.png", width: 85%),
  alt: "Chart png here",
  caption: [Zmierzenie za pomocą kursorów częstotliwości fali wypadkowej
  ],
) <pomiar_fali>
// To ref in code use @photo_name_to_reference

Na @pomiar_fali przedstawiono pomiar okresu pojedynczego drgania wewnątrz paczki dudnień. Częstotliwość wypadkowa między maksimami wynosi $f_w = 1 / (Delta t) approx 1.03 "MHz" = 1030 "kHz"$, co z dobrym przybliżeniem zgadza się z wynikami teoretycznymi na @obliczenia.


// ==========================================
// Photo
// ==========================================
#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./screens/pomiar czestotliwosci (50kHz).png", width: 85%),
  alt: "Chart png here",
  caption: [Pomiar częstotliwości dudnień za pomocą kursorów
  ],
) <pomiar_dudnien>
// To ref in code use @photo_name_to_reference

Na @pomiar_dudnien przedstawiono pomiar okresu obwiedni sygnału. Kursory ustawiono w miejscach całkowitego wygaszenia sygnału. Częstotliwość dudnień wyniosła $f_d = 1 / (Delta t) approx 49.94 "kHz"$, co odpowiada wynikowi teoretycznemu na @obliczenia.


=== Wnioski
Wyniki wykazują doskonałą zgodność z wartością teoretyczną obliczoną w @obliczenia Błąd pomiarowy jest praktycznie pomijalny.


== Ćwiczenie 1.4: Dzielnik napięcia
*Cel ćwiczenia:* Zbudowanie pasywnego dzielnika napięcia przy użyciu rezystorów $R_1$ i $R_2$ oraz zbadanie jego charakterystyki przenoszenia dla sygnałów sinusoidalnych o częstotliwościach niższych niż 10 kHz.

// ==========================================
// Photo
// ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./photos/IMG_4087.jpg", width: 70%),
  alt: "Chart png here",
  caption: [Widok układu pomiarowy po podłączeniu trójnika BNC oraz wyjść/wejść do generatora i oscyloskopu.
  ],
) <photo_name_to_reference>
// To ref in code use @photo_name_to_reference

=== Kopia fali
Ze względu na czas, nie udało się ukończyć tego ćwiczenia. Ukończono laboratorium na kopii fali.

// ==========================================
// Chart
// ==========================================
#figure(
  kind: "chart",
  supplement: [Wykres],
  image("./screens/kopia fali.png", width: 70%),
  alt: "Chart png here",
  caption: [Weryfikacja poprawności kopii fali przy użyciu trójnika BNC
  ],
) <fale>
// To ref in code use @chart_name_to_reference

Widoczne fale na @fale nachodzą na siebie, więc rozgałęzienie napięcia przebiegło pomyślnie.

// ==========================================
// Photo
// ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./photos/IMG_4088.jpg", width: 70%, height: 57%),
  alt: "Chart png here",
  caption: [Przygotowany układ
  ],
) <photo_name_to_reference>
// To ref in code use @photo_name_to_reference

#pagebreak()

// Główny spis treści
#outline(title: [Spis treści])

#v(2em)

// Jeden wspólny, przeplatany spis (Wykresy + Zdjęcia w kolejności występowania)
#outline(
  title: [Spis rysunków],
  target: figure.where(kind: "photo").or(figure.where(kind: "chart"))
)

#v(2em)

// Tabele to inna liga, je zawsze zostawia się w osobnym spisie na samym końcu
#outline(
  title: [Spis tabel],
  target: figure.where(kind: "table")
)

// ==========================================
// Example Figure templates
// ==========================================

// // ==========================================
// // Table
// // ==========================================
// #figure(
//   kind: "table",
//   supplement: [Tabela],
//   table(
//     columns: (auto, auto, auto, auto, auto, auto),
//     inset: 8pt,
//     align: horizon + center,
//     // table.header([*$i$*], [*z_i*]),
//     [*i*], $z_1$, $z_2$, $z_3$, $z_4$, $z_5$,
//     [*wartość*], [$0.333333$], [$0.666662$], [$0.666665$], [$1.41421 i$], [$-1.41421 i$],
//   ),

//   caption: [Table description
//   ],
// ) <table_name_to_reference>
// // To ref in code use @table_name_to_reference e.g:
// As we can see in @table_name_to_reference the results are fucked up.


// // ==========================================
// // Chart
// // ==========================================
// #figure(
//   kind: "chart",
//   supplement: [Wykres],
//   image("/photos/IMG_4068.jpg", width: 70%),
//   alt: "Chart png here",
//   caption: [Chart description
//   ],
// ) <chart_name_to_reference>
// // To ref in code use @chart_name_to_reference


// // ==========================================
// // Photo
// // ==========================================
// #figure(
//   kind: "photo",
//   supplement: [Zdjęcie],
//   image("/photos/IMG_4068.jpg", width: 70%),
//   alt: "Chart png here",
//   caption: [Photo description
//   ],
// ) <photo_name_to_reference>
// // To ref in code use @photo_name_to_reference

// // ==========================================
// // Side be side cmp
// // ==========================================

// #grid(
//   columns: (1fr, 1fr),
//   align(center)[
//     #figure(
//       kind: "photo",
//       supplement: [Zdjęcie],
//       image("/photos/IMG_4068.jpg", width: 70%),
//       alt: "Chart png here",
//       caption: [Cat
//       ],
//     ) <photo1>],

//   align(center)[
//     #figure(
//       kind: "photo",
//       supplement: [Zdjęcie],
//       image("/photos/IMG_4068.jpg", width: 70%),
//       alt: "Chart png here",
//       caption: [Kitty Cat
//       ],
//     ) <photo2>],
// )