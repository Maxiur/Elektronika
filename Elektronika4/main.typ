// Import external packages
// Math and symbols
#import "@preview/physica:0.9.7": *
// Podpisy tabel lądują na górze
#show figure.where(kind: "table"): set figure.caption(position: top)
// Drawing circuit diagrams
#import "@preview/circuiteria:0.2.0": *

// Numerowanie wzorów
#set math.equation(numbering: "(1)")

// Numerowanie stron
#set page(numbering: "1")

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
    block(
      sticky: true,
      text(weight: "bold", size: 1.1em, it.body),
    )
  } else {
    it
  }
}
// ======================================
// Document Start
// ======================================

#text(size: 14pt, weight: 600)[
  #align(right)[29.04.2026] 
]

#title[
  Elektronika Raport
  Laboratorium IV
]
#text(size: 14pt)[
  #grid(
    columns: (1fr, 1fr),
    align(center)[Mateusz Kamiński], align(center)[Stanowisko 5], 
  )
]

\
\
\

// ==========================================
// Photo
// ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./4_1/IMG_4274.png", width: 100%),
  alt: "Chart png here",
  caption: [Stanowisko 5
  ],
) <stanowisko>

#pagebreak()

= Ćwiczenie 4.1
== Treść 
Zapoznać się z płytką UC-2 do badania układów scalonych TTL.
== Płytka montażowa

#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./4_1/UC-2.png", width: 70%),
  alt: "Chart png here",
  caption: [Stanowisko 5
  ],
)

#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  // Używaj samej funkcji rotate na zewnątrz, to daje lepszą kontrolę
  rotate(-90deg)[
    #image("./4_1/IMG_4275.png", width: 70%, height: 50%) 
  ],
  caption: [Układ wzmacniacza odwracającego zmontowany na płytce UA-2],
) <uklad_foto>

== Sprawdzenie napięć i stanów logicznych

Przed montażem układów scalonych sprawdzono napięcia na pinach zasilających umieszczonych przy gniazdach montażowych.

#figure(
  kind: "table",
  supplement: [Tabela],
  caption: [Pomiary napięć na pinach],
  table(
    columns: 2,
    align: center,
    [*Punkt pomiarowy (Pin)*], [*Zmierzone napięcie [V]*],
    [Pin zasilania 1], [5.01],
    [Pin zasilania 2], [5.01],
    [Masa 1], [0.00],
    [Masa 2], [0.00],
  )
)

Zbadano tablicę logiczną dla obu impulsatorów.

#figure(
  kind: "table",
  supplement: [Tabela],
  caption: [Pomiary napięć i stanów logicznych impulsatora],
  table(
    columns: 3,
    align: center,
    [*Stan impulsatora*], [*Zmierzone napięcie [V]*], [*Próbnik stanów logicznych*],
    [Zwolniony (bez kliknięcia)], [0.01], [L (Low)],
    [Wciśnięty (po kliknięciu)], [5.01], [H (High)],
  )
)

== Weryfikacja działania przycisków

Sprawdzono, czy impulsatory działają poprawnie. Poniżej zamieszczono dokumentację fotograficzną z testów wciskania guzików. Wszystko śmiga jak należy.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(
    kind: "photo",
    supplement: [Zdjęcie],
    rotate(-90deg, image("./4_1/IMG_4276.png", width: 80%)),
    caption: [Test impulsatora nr 1]
  ),
  figure(
    kind: "photo",
    supplement: [Zdjęcie],
    rotate(-90deg, image("./4_1/IMG_4277.png", width: 80%)),
    caption: [Test impulsatora nr 2]
  ),
  figure(
    kind: "photo",
    supplement: [Zdjęcie],
    rotate(-90deg, image("./4_1/IMG_4278.png", width: 80%)),
    caption: [Test impulsatora nr 3]
  ),
  figure(
    kind: "photo",
    supplement: [Zdjęcie],
    rotate(-90deg, image("./4_1/IMG_4279.png", width: 80%)),
    caption: [Test impulsatora nr 4]
  ),
  figure(
    kind: "photo",
    supplement: [Zdjęcie],
    rotate(-90deg, image("./4_1/IMG_4280.png", width: 80%)),
    caption: [Test impulsatora nr 5]
  ),
  figure(
    kind: "photo",
    supplement: [Zdjęcie],
    rotate(-90deg, image("./4_1/IMG_4281.png", width: 80%)),
    caption: [Test impulsatora nr 6]
  )
)

Sprawdzono wartości napięć dla logicznej jedynki i logicznego zera na wszystkich wyjściach impulsatorów. Wszystko działa poprawnie, co potwierdzają powyższe pomiary i zdjęcia.

== Pomiary oscyloskopem - stany impulsatora

Dla potwierdzenia, że impulsatory robią to, sygnał został wrzucony na oscyloskop.

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(
    kind: "chart",
    supplement: [Wykres],
    image("./4_1/0V.png", width: 95%),
    caption: [Stan niski (0V)]
  ),
  figure(
    kind: "chart",
    supplement: [Wykres],
    image("./4_1/5V.png", width: 95%),
    caption: [Stan wysoki (5V)]
  ),
  figure(
    kind: "chart",
    supplement: [Wykres],
    image("./4_1/klikanie 5V.png", width: 95%),
    caption: [Rejestracja klikania]
  )
)

== Podsumowanie
W ćwiczeniu 4.1 zapoznaliśmy się z płytką UC-2 do badania układów scalonych TTL. Sprawdziliśmy napięcia na pinach zasilających, stany logiczne impulsatorów oraz potwierdziliśmy ich działanie za pomocą pomiarów oscyloskopem. Wszystkie testy przebiegły pomyślnie, co potwierdza poprawność działania impulsatorów.

= Ćwiczenie 4.2
== Treść
Zbadać tablicę logiczną dla następujących bramek logicznych NAND (7400), NOR (7402),
Ex-OR (7486) mierząc poziomy odpowiednich napięć, a następnie sprawdzając je
próbnikiem stanów logicznych.

== Teoria

W niniejszym ćwiczeniu badane są cyfrowe układy scalone z rodziny TTL (Transistor-Transistor Logic), a dokładniej seria 7400. Układy cyfrowe operują na dwóch poziomach napięciowych: stanie niskim (L - Low), odpowiadającym potencjałowi bliskiemu masy (0.0 - 0.8 V), oraz stanie wysokim (H - High), odpowiadającym napięciu zasilania (2.0 - 5.0 V). 

Bramki logiczne stanowią podstawowe elementy budowy układów cyfrowych. W trakcie ćwiczenia analizowane są następujące funktory:
- *NAND (7400)* - iloczyn logiczny z negacją. Jest to funktor uniwersalny, pozwalający na realizację dowolnej funkcji logicznej. Zwraca stan niski tylko wtedy, gdy na wszystkich wejściach występuje stan wysoki.
- *NOR (7402)* - suma logiczna z negacją. Drugi z funktorów uniwersalnych. Generuje stan wysoki wyłącznie wtedy, gdy na wszystkich jego wejściach panuje stan niski.
- *Ex-OR (7486)* - alternatywa wykluczająca (XOR). Zwraca stan wysoki tylko wtedy, gdy stany na jej wejściach różnią się od siebie.

== Bramka NAND (7400)
Dla każdej bramki zarejestrowano przebiegi wyjściowe dla wszystkich kombinacji wejściowych (00, 01, 10, 11).

W celu weryfikacji pomiarów, poniżej przedstawiono teoretyczną tablicę prawdy dla bramki NAND (iloczyn zanegowany).

#figure(
  kind: "table",
  supplement: [Tabela],
  caption: [Tablica prawdy bramki NAND],
  table(
    columns: 3,
    align: center,
    [*A*], [*B*], [*Y (NAND)*],
    [0], [0], [1],
    [0], [1], [1],
    [1], [0], [1],
    [1], [1], [0]
  )
)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "chart", supplement: [Wykres], image("./4_2/NAND/00.png", width: 95%), caption: [NAND: wejścia 00]),
  figure(kind: "chart", supplement: [Wykres], image("./4_2/NAND/01.png", width: 95%), caption: [NAND: wejścia 01]),
  figure(kind: "chart", supplement: [Wykres], image("./4_2/NAND/10.png", width: 95%), caption: [NAND: wejścia 10]),
  figure(kind: "chart", supplement: [Wykres], image("./4_2/NAND/11.png", width: 95%), caption: [NAND: wejścia 11])
)

Poniżej przedstawiono montaż układów, podpinanie zasilania i podłączenie kabli do układu.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/NAND/photos/IMG_4283.png", width: 95%), caption: [NAND: Stan 00]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/NAND/photos/IMG_4284.png", width: 95%), caption: [NAND: Stan 01]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/NAND/photos/IMG_4285.png", width: 95%), caption: [NAND: Stan 10]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/NAND/photos/IMG_4286.png", width: 95%), caption: [NAND: Stan 11])
)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/NAND/photos/IMG_4287.png", width: 95%), caption: [NAND: Pomiar napięcia]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/NAND/photos/IMG_4288.png", width: 95%), caption: [NAND: Multimetr: -3.602 V]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/NAND/photos/IMG_4291.png", width: 95%), caption: [NAND: Pomiar napięcia]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/NAND/photos/IMG_4290.png", width: 95%), caption: [NAND: Multimetr: -62.1 mV])
)

== Bramka NOR (7402)
Przed pomiarami sprawdzono tablicę prawdy dla bramki NOR (suma zanegowana).

#figure(
  kind: "table",
  supplement: [Tabela],
  caption: [Tablica prawdy bramki NOR],
  table(
    columns: 3,
    align: center,
    [*A*], [*B*], [*Y (NOR)*],
    [0], [0], [1],
    [0], [1], [0],
    [1], [0], [0],
    [1], [1], [0]
  )
)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "chart", supplement: [Wykres], image("./4_2/NOR/00.png", width: 95%), caption: [NOR: wejścia 00]),
  figure(kind: "chart", supplement: [Wykres], image("./4_2/NOR/01.png", width: 95%), caption: [NOR: wejścia 10]),
  figure(kind: "chart", supplement: [Wykres], image("./4_2/NOR/10.png", width: 95%), caption: [NOR: wejścia 01]),
  figure(kind: "chart", supplement: [Wykres], image("./4_2/NOR/11.png", width: 95%), caption: [NOR: wejścia 11])
)



Poniżej przedstawiono dokumentację fotograficzną montażu i pomiarów dla bramki NOR.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/NOR/photos/IMG_4292.png", width: 95%), caption: [NOR: Stan 00]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/NOR/photos/IMG_4293.png", width: 95%), caption: [NOR: Stan 10]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/NOR/photos/IMG_4294.png", width: 95%), caption: [NOR: Stan 01]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/NOR/photos/IMG_4295.png", width: 95%), caption: [NOR: Stan 11])
)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/NOR/photos/IMG_4296.png", width: 95%), caption: [NOR: Pomiar napięcia]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/NOR/photos/IMG_4297.png", width: 95%), caption: [NOR: Multimetr: -3.64 V]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/NOR/photos/IMG_4298.png", width: 95%), caption: [NOR: Pomiar napięcia]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/NOR/photos/IMG_4299.png", width: 95%), caption: [NOR: Multimetr: -56.3 mV])
)

== Bramka Ex-OR (7486)
Ostatnia do weryfikacji jest bramka Ex-OR (alternatywa wykluczająca), wypluwająca jedynkę tylko przy różnych stanach na wejściach.

#figure(
  kind: "table",
  supplement: [Tabela],
  caption: [Tablica prawdy bramki Ex-OR],
  table(
    columns: 3,
    align: center,
    [*A*], [*B*], [*Y (Ex-OR)*],
    [0], [0], [0],
    [0], [1], [1],
    [1], [0], [1],
    [1], [1], [0]
  )
)
#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "chart", supplement: [Wykres], image("./4_2/EXOR/00.png", width: 95%), caption: [EXOR: wejścia 00]),
  figure(kind: "chart", supplement: [Wykres], image("./4_2/EXOR/01.png", width: 95%), caption: [EXOR: wejścia 01]),
  figure(kind: "chart", supplement: [Wykres], image("./4_2/EXOR/10.png", width: 95%), caption: [EXOR: wejścia 10]),
  figure(kind: "chart", supplement: [Wykres], image("./4_2/EXOR/11.png", width: 95%), caption: [EXOR: wejścia 11])
)

Poniżej przedstawiono dokumentację fotograficzną montażu i pomiarów dla bramki EX-OR.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/EXOR/photos/IMG_4304.png", width: 95%), caption: [EXOR: Stan 00]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/EXOR/photos/IMG_4305.png", width: 95%), caption: [EXOR: Stan 01]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/EXOR/photos/IMG_4306.png", width: 95%), caption: [EXOR: Stan 10]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/EXOR/photos/IMG_4307.png", width: 95%), caption: [EXOR: Stan 11])
)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/EXOR/photos/IMG_4309.png", width: 95%), caption: [EXOR: Pomiar napięcia]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/EXOR/photos/IMG_4308.png", width: 95%), caption: [EXOR: Multimetr: 18.8 mV]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_2/EXOR/photos/IMG_4310.png", width: 95%), caption: [EXOR: Multimetr: -4.99 V])
)

== Podsumowanie
W ćwiczeniu 4.2 mieliśmy do czynienia z bramkami NAND, NOR i Ex-OR. Zestawienie przebiegów z oscyloskopu, napięć zmierzonych multimetrem i wskazań próbnika stanów logicznych gładko pokrywa się z teoretycznymi tablicami prawdy. Wszystkie trzy bramki zachowywały się zgodnie z oczekiwaniami, co potwierdza poprawność ich działania.

= Ćwiczenie 4.3
== Treść
Używając funktorów NAND (7400), NOR (7402) zbudować układ realizujący iloczyn
logiczny, sumę logiczną, funkcję negacji. Sprawdzić tablicę logiczną funktorów używając
próbnika stanów logicznych

== Teoria
Bramki NAND (7400) oraz NOR (7402) są tak zwanymi *funktorami uniwersalnymi*. Oznacza to, że mając do dyspozycji wyłącznie jeden z tych typów układów, jesteśmy w stanie zbudować dowolną inną funkcję logiczną (NOT, AND, OR, a nawet XOR). Opiera się to w głównej mierze na prawach de Morgana.

Zasady konstruowania podstawowych układów:
- *Negacja (NOT):* Najprostszy przypadek. Otrzymujemy ją poprzez zwarcie obu wejść bramki NAND (lub NOR) ze sobą. Skoro $A dot A = A$, to po przejściu przez bramkę NAND otrzymujemy $overline(A)$.
- *Iloczyn (AND) z NAND:* Ponieważ NAND to nic innego jak AND z negacją, wystarczy dołożyć kolejną negację (czyli bramkę NAND ze zwartymi wejściami) na wyjściu układu, by "odwrócić" odwracanie.
- *Suma (OR) z NAND:* Zgodnie z prawem de Morgana ($overline(overline(A) dot overline(B)) = A + B$), należy najpierw zanegować sygnały wejściowe $A$ i $B$, a następnie podać je na wejścia głównej bramki NAND.

Analogiczne przekształcenia (wymagające odwrócenia logiki budowy) stosuje się przy projektowaniu układów wyłącznie na bazie bramek NOR.

== Realizacja na bramkach NAND (7400)
Poniżej wyniki z oscyloskopu dla bramki NAND, realizującej funkcję negacji, iloczynu logicznego (AND) i sumy logicznej (OR). Dla każdej funkcji zarejestrowano przebiegi wyjściowe dla wszystkich kombinacji wejściowych.

=== Funkcja Negacji (NOT) z NAND
#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "chart", supplement: [Wykres], image("./4_3/nand/negacja0.png", width: 95%), caption: [NAND jako NOT: negacja 0]),
  figure(kind: "chart", supplement: [Wykres], image("./4_3/nand/negacja1.png", width: 95%), caption: [NAND jako NOT: negacja 1])
)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nand/photos/IMG_4311.png", width: 95%), caption: [NAND jako NOT - negacja 0]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nand/photos/IMG_4312.png", width: 95%), caption: [NAND jako NOT - negacja 1])
)

=== Iloczyn Logiczny (AND) z NAND
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "chart", supplement: [Wykres], image("./4_3/nand/and00.png", width: 95%), caption: [NAND jako AND: wejścia 00]),
  figure(kind: "chart", supplement: [Wykres], image("./4_3/nand/and10.png", width: 95%), caption: [NAND jako AND: wejścia 10]),
  figure(kind: "chart", supplement: [Wykres], image("./4_3/nand/and11.png", width: 95%), caption: [NAND jako AND: wejścia 11])
)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nand/photos/IMG_4314.png", width: 95%), caption: [NAND jako AND - wejścia 00]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nand/photos/IMG_4315.png", width: 95%), caption: [NAND jako AND - wejścia 01]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nand/photos/IMG_4316.png", width: 95%), caption: [NAND jako AND - wejścia 10]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nand/photos/IMG_4317.png", width: 95%), caption: [NAND jako AND - wejścia 11])
)

=== Suma Logiczna (OR) z NAND
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "chart", supplement: [Wykres], image("./4_3/nand/or00.png", width: 95%), caption: [NAND jako OR: wejścia 00]),
  figure(kind: "chart", supplement: [Wykres], image("./4_3/nand/or01.png", width: 95%), caption: [NAND jako OR: wejścia 01]),
  figure(kind: "chart", supplement: [Wykres], image("./4_3/nand/or11.png", width: 95%), caption: [NAND jako OR: wejścia 11])
)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nand/photos/IMG_4319.png", width: 95%), caption: [NAND jako OR - wejścia 00]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nand/photos/IMG_4320.png", width: 95%), caption: [NAND jako OR - wejścia 01]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nand/photos/IMG_4321.png", width: 95%), caption: [NAND jako OR - wejścia 10]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nand/photos/IMG_4322.png", width: 95%), caption: [NAND jako OR - wejścia 11])
)

#pagebreak()

== Realizacja na bramkach NOR (7402)
Poniżej zestawiono wyniki badań dla układów zrealizowanych przy użyciu bramek NOR, pełniących funkcje negacji, sumy logicznej (OR) oraz iloczynu logicznego (AND).

=== Funkcja Negacji (NOT) z NOR
#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "chart", supplement: [Wykres], image("./4_3/nor/negacja0.png", width: 95%), caption: [NOR jako NOT: wejście 0]),
  figure(kind: "chart", supplement: [Wykres], image("./4_3/nor/negacja1.png", width: 95%), caption: [NOR jako NOT: wejście 1])
)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nor/photos/IMG_4324.png", width: 95%), caption: [NOR jako NOT - negacja 0]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nor/photos/IMG_4325.png", width: 95%), caption: [NOR jako NOT - negacja 1])
)

=== Iloczyn Logiczny (AND) z NOR
#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "chart", supplement: [Wykres], image("./4_3/nor/and00.png", width: 95%), caption: [NOR jako AND: wejścia 00]),
  figure(kind: "chart", supplement: [Wykres], image("./4_3/nor/and11.png", width: 95%), caption: [NOR jako AND: wejścia 11])
)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nor/photos/IMG_4330.png", width: 95%), caption: [NOR jako AND - wejścia 00]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nor/photos/IMG_4331.png", width: 95%), caption: [NOR jako AND - wejścia 01]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nor/photos/IMG_4332.png", width: 95%), caption: [NOR jako AND - wejścia 10]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nor/photos/IMG_4333.png", width: 95%), caption: [NOR jako AND - wejścia 11])
)

=== Suma Logiczna (OR) z NOR
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "chart", supplement: [Wykres], image("./4_3/nor/or00.png", width: 95%), caption: [NOR jako OR: wejścia 00]),
  figure(kind: "chart", supplement: [Wykres], image("./4_3/nor/or10.png", width: 95%), caption: [NOR jako OR: wejścia 10]),
  figure(kind: "chart", supplement: [Wykres], image("./4_3/nor/or11.png", width: 95%), caption: [NOR jako OR: wejścia 11])
)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nor/photos/IMG_4326.png", width: 95%), caption: [NOR jako OR - wejścia 00]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nor/photos/IMG_4327.png", width: 95%), caption: [NOR jako OR - wejścia 01]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nor/photos/IMG_4328.png", width: 95%), caption: [NOR jako OR - wejścia 10]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_3/nor/photos/IMG_4329.png", width: 95%), caption: [NOR jako OR - wejścia 11])
)

== Podsumowanie
W ćwiczeniu 4.3 zweryfikowano uniwersalność bramek NAND i NOR. Poprzez odpowiednie łączenie funktorów zrealizowano podstawowe operacje logiczne (NOT, AND, OR). Pomiary wykonane próbnikiem stanów logicznych oraz rejestracja przebiegów na oscyloskopie potwierdziły poprawność logiczną zbudowanych układów. Każda z konfiguracji działała zgodnie z przewidywaniami teoretycznymi, co dowodzi, że przy użyciu wyłącznie jednego typu bramki uniwersalnej możliwe jest odtworzenie dowolnej funkcji logicznej.

= Ćwiczenie 4.4
== Treść
Wyznaczyć średni czas propagacji impulsu przez bramkę mierząc okres drgań generatora
zbudowanego z trzech bramek. Użyć do budowy generatora bramek serii podstawowej 7400.
a potem bramek serii szybkiej 74S00. Porównaj wyniki.

== Teoria
Czas propagacji ($t_p$) to opóźnienie między zmianą stanu na wejściu bramki a odpowiadającą jej zmianą na wyjściu.

Średni czas propagacji ($t_p$) wyznaczono metodą generatora pierścieniowego. Układ zbudowano z $n=3$ bramek. Wzór na średni czas propagacji, w tym przypadku dla 3 bramek, jest następujący:
$ t_p = T / 6 $

== Pomiary dla układu 7400 (seria standardowa)
#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "chart", supplement: [Wykres], image("./4_4/propagacja.png", width: 95%), caption: [Oscylogram dla serii 7400]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_4/IMG_4334.png", width: 95%), caption: [Montaż generatora 7400])
)

Na podstawie pomiaru kursorem wyznaczono okres drgań $T approx 69.991$ ns.
$ t_p = 69.991 / 6 approx 11.665 "ns" $

== Pomiary dla układu 74S00 (seria szybsza)
#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "chart", supplement: [Wykres], image("./4_4/propagacja nandsuper.png", width: 95%), caption: [Oscylogram dla serii 74S00]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_4/IMG_4338.png", width: 95%), caption: [Generator na układzie 74S00])
)

Dla serii szybkiej okres drgań uległ znacznemu skróceniu do $T approx 27.820$ ns.
$ t_p = 27.820 / 6 approx 4.637 "ns" $

== Wnioski
Porównanie obu serii wyraźnie pokazuje przewagę technologiczną układów 74S00. Czas propagacji skrócił się ponad trzykrotnie (z 11.665 ns do ok. 4.637 ns). Na oscylogramach serii 74S00 zaobserwowano nie tylko krótszy okres, ale również większą stromość zboczy sygnału, co jest kluczowe w systemach pracujących z wysoką częstotliwością taktowania.

= Ćwiczenie 4.6
== Treść
Z funktorów NAND (7400) zaprojektować i zmontować przerzutnik asynchroniczny R-S.
Sprawdzić tabelę przejść.

== Teoria i Tabela przejść
Przerzutnik asynchroniczny R-S zmontowany z dwóch bramek NAND charakteryzuje się wejściami aktywnymi w stanie niskim (oznaczanymi jako $overline(S)$ oraz $overline(R)$). W stanie spoczynkowym, aby układ pamiętał informację, na oba wejścia należy podać logiczną jedynkę. Wymuszenie stanu niskiego na obu wejściach jednocześnie prowadzi do stanu zabronionego, w którym oba wyjścia ($Q$ i $overline(Q)$) przyjmują stan wysoki, co przeczy zasadzie działania przerzutnika.

Poniżej przedstawiono teoretyczną tabelę przejść dla zrealizowanego układu.

#figure(
  kind: "table",
  supplement: [Tabela],
  caption: [Tabela przejść przerzutnika asynchronicznego R-S (NAND)],
  table(
    columns: 4,
    align: center,
    [*$overline(S)$ (Set)*], [*$overline(R)$ (Reset)*], [*$Q$*], [*$overline(Q)$*],
    [1], [1], [Pamięć ($Q_0$)], [Pamięć ($overline(Q)_0$)],
    [0], [1], [1], [0],
    [1], [0], [0], [1],
    [0], [0], [Zabroniony], [Zabroniony]
  )
)

== Zmontowany układ
W poniższej płytce górny przycisk odpowiada za stan Ustawienia (Set), a dolny za stan Resetowania (Reset). 
#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_6/IMG_4339.png", width: 95%), caption: [Układ w stanie Ustawienia (Set)]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_6/IMG_4341.png", width: 95%), caption: [Układ w stanie Resetowania (Reset)])
)
== Weryfikacja działania układu
Zgodnie z poleceniem, zmontowano układ na płytce testowej i sprawdzono jego działanie przy użyciu stanów podawanych z impulsatorów. 

W celu pełnego udokumentowania działania układu i poprawnej zmiany stanów, zarejestrowano krótki materiał wideo z weryfikacji tabeli przejść. 

#v(1em)
#align(center)[
  #link("https://ujchmura-my.sharepoint.com/:v:/r/personal/mateusz_1_kaminski_student_uj_edu_pl/Documents/Przerzutnik_RS.MOV?csf=1&web=1&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=eNmYeX")[
    #rect(fill: luma(240), stroke: 1pt + black, radius: 4pt, inset: 10pt)[
      *Kliknij tutaj, aby obejrzeć nagranie z działania przerzutnika R-S*
    ]
  ]
]
#v(1em)

== Wnioski
Przeprowadzone ćwiczenie udowodniło możliwość budowy układów sekwencyjnych, posiadających elementarną "pamięć", przy użyciu wyłącznie uniwersalnych bramek kombinacyjnych NAND. 

Z analizy działania zmontowanego układu wynika, że:
- Zachowanie przerzutnika w pełni pokrywa się z teoretyczną tabelą przejść. Układ stabilnie podtrzymuje zapisaną informację, gdy oba wejścia znajdują się w stanie spoczynkowym (stan wysoki).
- Potwierdzono, że wejścia przerzutnika zbudowanego z bramek NAND są aktywne w stanie niskim.

= Ćwiczenie 4.5
== Treść
Zbudować funkcję logiczną dla jednego wybranego segmentu (a, b, c, d, e, f, g) wskaźnika 7-
segmentowego, którego zadaniem będzie wyświetlanie liczb w systemie ósemkowym

// // ==========================================
// // Photo
// // ==========================================
#figure(
  kind: "photo",
  supplement: [Zdjęcie],
  image("./4_5/logika.png", width: 20%),
  alt: "Chart png here",
  caption: [Rozkład literowy segmentów wyświetlacza
  ],
)

== Tablice wejść i wyjść
Dla systemu ósemkowego mamy 3 wejścia ($A, B, C$). Segment 'e' (lewy dolny) w standardowym wyświetlaczu świeci się dla cyfr: 0, 2 oraz 6. Dla reszty wartości pozostaje wygaszony.

#figure(
  kind: "table",
  supplement: [Tabela],
  caption: [Tablica stanów dla segmentu 'e'],
  table(
    columns: 5,
    align: center,
    [*A*], [*B*], [*C*], [*Cyfra*], [*Czy świeci (e)*],
    [0], [0], [0], [0], [1],
    [0], [0], [1], [1], [0],
    [0], [1], [0], [2], [1],
    [0], [1], [1], [3], [0],
    [1], [0], [0], [4], [0],
    [1], [0], [1], [5], [0],
    [1], [1], [0], [6], [1],
    [1], [1], [1], [7], [0]
  )
)

== Minimalizacja za pomocą Mapy Karnaugha
Jedynki z tablicy przejść wrzucamy w mapę z odpowiednio ułożonym kodem Graya. W nawiasach podano wartości dziesiętne odpowiadające danym komórkom.

#figure(
  kind: "table",
  supplement: [Tabela],
  caption: [Mapa Karnaugha dla segmentu 'e'],
  table(
    columns: 3,
    align: center,
    [*AB / C*], [*0*], [*1*],
    [*00*], [1 (0)], [0 (1)],
    [*01*], [1 (2)], [0 (3)],
    [*11*], [1 (6)], [0 (7)],
    [*10*], [0 (4)], [0 (5)]
  )
)

Z mapy można wyodrębnić dwie pary jedynek:
- *Grupa pierwsza* (komórki 0 i 2): $overline(A) dot overline(C)$
- *Grupa druga* (komórki 2 i 6): $B dot overline(C)$

== Uproszczenie i konwersja na bramki NAND
Równanie logiczne po minimalizacji z mapy Karnaugha prezentuje się następująco:
$ Y = overline(A) dot overline(C) + B dot overline(C) $

Zgodnie z poleceniem, układ należy zbudować wyłącznie z funktorów NAND. Z prawa de Morgana nakładamy podwójną negację na całe wyrażenie, a następnie łamiemy dolną kreskę, zmieniając znak sumy na iloczyn:
$ Y = overline( overline(overline(A) dot overline(C) + B dot overline(C)) ) = overline( overline(overline(A) dot overline(C)) dot overline(B dot overline(C)) ) $

Powyższa postać to gotowy przepis na zmontowanie układu z bramek 7400.
#quote(block: true)[
  *Uwaga:* Ponieważ na stanowisku mieliśmy do dyspozycji tylko dwa przyciski, a do układu potrzebowaliśmy trzech sygnałów wejściowych ($A, B, C$), żeby nie kombinować, musieliśmy lekko zaimprowizować. Sygnał $B$ był po prostu ręcznie przepinany pomiędzy zasilaniem (5V - logiczna jedynka) a masą (0V - logiczne zero) z gniazd po prawej stronie płytki (szary kabelek).
]

== Weryfikacja działania
Przeklikaliśmy całą tablicę prawdy od zera do siódemki, zmieniając również kabelek sygnału $B$. Jak widać, segment 'e' ożywa dokładnie wtedy, kiedy powinien (dla cyfr 0, 2 i 6). W pozostałych przypadkach zgodnie z planem pozostaje wygaszony.

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_5/IMG_4348.png", width: 95%), caption: [Cyfra 0 (ABC: 000) - Świeci]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_5/IMG_4349.png", width: 95%), caption: [Cyfra 1 (ABC: 001) - Zgaszony])
)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_5/IMG_4350.png", width: 95%), caption: [Cyfra 2 (ABC: 010) - Świeci]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_5/IMG_4351.png", width: 95%), caption: [Cyfra 3 (ABC: 011) - Zgaszony])
)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_5/IMG_4352.png", width: 95%), caption: [Cyfra 4 (ABC: 100) - Zgaszony]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_5/IMG_4353.png", width: 95%), caption: [Cyfra 5 (ABC: 101) - Zgaszony])
)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_5/IMG_4354.png", width: 95%), caption: [Cyfra 6 (ABC: 110) - Świeci]),
  figure(kind: "photo", supplement: [Zdjęcie], image("./4_5/IMG_4355.png", width: 95%), caption: [Cyfra 7 (ABC: 111) - Zgaszony])
)

== Wnioski
Zadanie 4.5 było ciekawym ćwiczeniem z zakresu projektowania funkcji logicznych i ich implementacji przy użyciu bramek NAND. Poprawna minimalizacja funkcji za pomocą mapy Karnaugha oraz umiejętne przekształcenie jej do postaci umożliwiającej realizację z uniwersalnych bramek pozwoliły na finalne odpalenie wyświetlacza. 

= Podsumowanie laboratorium
Ćwiczenie laboratoryjne nr 4 umożliwiło praktyczne zapoznanie się z metodologią projektowania, montażu oraz analizy cyfrowych układów kombinacyjnych i sekwencyjnych z rodziny TTL. Wszystkie cele postawione w instrukcji laboratoryjnej zostały pomyślnie zrealizowane.

Z przeprowadzonych badań i pomiarów płyną następujące wnioski:
- *Weryfikacja aparatury:* Pomiary wstępne na uniwersalnej płytce montażowej UC-2 potwierdziły poprawne parametry napięciowe zasilania oraz zgodność sygnałów z impulsatorów z obowiązującym standardem poziomów logicznych TTL.
- *Funktory uniwersalne:* Realizacja podstawowych operacji logicznych (NOT, AND, OR) za pomocą wyłącznie układów NAND (7400) oraz NOR (7402) dowiodła w praktyce uniwersalności tych bramek.
- *Czasy propagacji:* Badanie z wykorzystaniem generatora pierścieniowego jednoznacznie wykazało różnice technologiczne pomiędzy serią standardową (7400) a serią szybką (74S00). Około trzykrotne skrócenie średniego czasu propagacji (z ok. $11.6$ ns do ok. $4.6$ ns).
- *Projektowanie układów kombinacyjnych:* Zadanie polegające na wysterowaniu segmentu 'e' wskaźnika 7-segmentowego pozwoliło na praktyczne zastosowanie metod minimalizacji funkcji logicznych przy użyciu map Karnaugha.
- *Układy sekwencyjne:* Zmontowanie asynchronicznego przerzutnika R-S z bramek NAND pozwoliło zaobserwować proces zapamiętywania stanu logicznego. Pomiary potwierdziły aktywność wejść w stanie niskim oraz prawidłowe zachowanie układu dla wszystkich kombinacji wymuszeń, włączając w to wygenerowanie stanu zabronionego.


#pagebreak()
= Załączniki - Karty Pracy

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  align: center,
  image("./karty_pracy/karty1.png", width: 95%),
  image("./karty_pracy/karty2.png", width: 95%),
  image("./karty_pracy/karty3.png", width: 95%)
)

// Główny spis treści
#outline(title: [Spis treści])
#v(2em)

// Spis rysunków
#outline(
  title: [Spis rysunków],
  target: figure.where(kind: "photo").or(figure.where(kind: "chart"))
)
#v(2em)

// Spis tabel
#outline(
  title: [Spis tabel],
  target: figure.where(kind: "table")
)
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
// )


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
// )/ )