// LTeX: enabled=false

#import "utils.typ": *

#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "@preview/numbly:0.1.0": numbly

#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *

#show: codly-init.with()


#let azuluc3m = rgb("#000e78")

#set text(
  lang: "es",
  region: "es",
)

#show: metropolis-theme.with(
  aspect-ratio: "4-3",
  footer: self => self.info.title,
  config-common(
    // pass the "PRESENTATION" variable w/ --input to enable presentation mode
    handout: sys.inputs.at("PRESENTATION", default: none) == none,
    preamble: {
      codly(
        languages: (
          yaml: (name: "YAML", color: rgb("#005a00")),
          // adb: (name: "SPARK", color: rgb("#c69ed3")),
          // cpp: (name: "C++", color: rgb("#659bd3")),
          // python: (name: "Python 3", color: rgb("#ffd947")),
          // lean: (name: "Lean", color: rgb("#6ba4ff")),
        ),
      )
    },
  ),
  config-info(
    title: [Implementing Interrupts, Timers, and Memory-Mapped I/O in CREATOR],
    subtitle: [Trabajo de Fin de Máster],
    author: [Autor: Luis Daniel Casais Mezquida\
      Tutor: Alejandro Calderón Mateos],
    date: [02 de marzo de 2026],
    institution: [Máster en Ingeniería Informática -- Universidad Carlos III de
      Madrid],
  ),
  config-colors(
    primary: azuluc3m,
    primary-light: rgb("#406ed8"),
    secondary: azuluc3m,
    neutral-lightest: rgb("#fafafa"),
    neutral-dark: rgb("#000e58"),
    neutral-darkest: rgb("#23373b"),
  ),
)

#set heading(numbering: numbly("{1}.", default: "1.1"))

// "booktab" table style
#show table: block.with(stroke: (y: 0.7pt))
#set table(column-gutter: .2em, stroke: none)
#set table.hline(stroke: 0.4pt)

#show link: set text(azuluc3m)


#let code(
  contents,
  caption: none,
) = [
  #show figure: set block(breakable: true)
  #figure(
    {
      show raw: set text(size: 12.0pt)
      codly(number-format: none)
      contents
    },
    caption: caption,
  )
]


// START

#title-slide(logo: image("uc3m-thesis-ieee-typst/img/new_uc3m_logo.svg"))

= Introducción
== Motivación
#slide[
  - Aprender lenguaje ensamblador es importante
    - _Software_ se construye sobre _hardware_
    - Ciberseguridad, eficiencia, etc.
  #pause
  - Interrupciones son la base del _hardware_
    - Temporizadores, E/S
    - S.O., GPUs, NPUs
  #pause
  - Falta de simuladores con soporte
  #pause
  - _Entorno de desarrollo integrado para formación e investigación en
    procesadores RISC_ (#link(
      "https://researchportal.uc3m.es/display/act562858",
    )[PDC2023-145832-I00])
    - Soporte interrupciones, temporizadores, dispositivos E/S en #link(
        "https.//creatorsim.github.io",
      )[CREATOR]
    - Modernizar la aplicación
][
  #figure(
    grid(
      row-gutter: 15%,
      image("img/arcos.png", width: 80%),
      image("img/creator.png", width: 55%),
    ),
  )
]


= Estado de la cuestión

== CREATOR
_didaCtic and geneRic assEmbly progrAmming simulaTOR_

#speaker-note[CREATOR 6 es la versión nueva. Fue un gran cambio, etc.]

#figure(
  caption: [CREATOR 6],
  image("img/creator-webapp.webp", width: 86%),
)

#pagebreak()

- Simulador _genérico_ #pause
  - Definición de arquitecturas mediante *archivos de configuración*
  #code(caption: [Definición de instrucciones en CREATOR 6])[
    ```yaml
      - name: beq
        template: B
        fields:
          - field: opcode
            value: "1100011"
          - field: funct3
            value: "000"
        definition: |
          if (registers[rs1] === registers[rs2])
            registers.pc = registers.pc + imm;
        help: Take the branch if registers rs1 and rs2 are equal.
    ```
  ]
#pause
- Aplicación web y CLI


== Interrupciones
*Evento no programado que altera la ejecución del programa*

#parbreak()

- Interno _o_ externo
#pause
- Diferentes tipos:#pause
  - _Maskable_/_Non-maskable_#pause
  - _Software_/externos/excepciones#pause
  - Síncronos/asíncronos#pause
- Pin/registro en la CPU para marcar interrupción

#figure(
  image("/img/ciclo-interrupcion.svg", width: 70%),
  caption: [Ciclo de instrucción típico con tratamiento de interrupciones],
)

#slide[
  *Gestión de interrupciones:*
  + Guardar contexto
  + Cambio modo ejecución
  + Tratar interrupción
  + Restaurar contexto

  #pause

  *Modos de tratar interrupciones:*
  - _Polled_: _Handler_ único#pause
  - _Vectored_: Tabla de interrupciones
][
  #figure(
    scale-to-container(
      include "/diagrams/vectored-interrupts.typ",
      width: 115%,
      text-size: 12pt,
    ),
    caption: [Interrupciones vectorizadas],
  )
]


*Implementación de interrupciones*
- Dependiente de ISA
#pause
- Simuladores:
  - ISAs simples (e.g. Z80): implementan correctamente#pause
  - ISAs complejas (e.g. RISC-V): sólo en "profesionales"#pause
  - Simuladores genéricos:
    - CREATOR 5: Soporte inicial (_polled_) en MIPS#pause
    - WepSIM: Programable, _flag_ específica


== Temporizadores
- Fundamental para S.O., comunicación, etc.
- Temporizadores _software_ ineficientes
#pause
- Contador que avanza cada _tick_ #sym.arrow múltiplo de oscilador
- Genera interrupción cuando llega a valor programado
#pause
- Suelen implementarse en simuladores

#speaker-note[Ejemplo ZX Spectrum: interrupción en 50Hz para rutina teclado.]


== Dispositivos de E/S

#slide[

  - Comunicación a través de memoria
    - Típicamente _on-device_
  #pause
  - Dos formas principales de direccionamiento:
    - "Puertos": Requiere instrucciones específicas (_in_/_out_)#pause
    - _Memory-mapped_: Se usa porción de memoria del sistema
  #speaker-note[Z80 usa puertos, RISC-V MMIO.]
][
  #figure(
    caption: [Registro direccionado en memoria],
    image("/img/memory_mapped_register.svg", width: 75%),
  )
]




= Diseño

== Arquitectura
#slide[
  - Nuevos módulos en ejecutor:
  + Interrupt Manager
  + Timer Manager
  + Device Manager
  #pause
  - Modificar ciclo ejecución de instrucción
][
  #set text(size: 14pt)
  #algorithm(
    title: [CREATOR 6's instruction execution cycle],
    label: <alg:creator6-execution-cycle>,
    placement: none,
  )[
    + Decode _instruction_
    + Increment `PC`
    + Execute _instruction_
    + Handle timers
    + Handle devices
    + Handle interrupts
    + Fetch _instruction_
  ]
]


#figure(
  caption: [Arquitectura],
  image("diagrams/architecture/core.svg", height: 90%),
)


== Interrupciones
Modelo "genérico" de interrupciones.
#pause
- Conjunto de acciones comunes
  - `check`, `create`
  - `is_enabled`, `is_disabled`, `is_global_enabled`, `is_global_disabled`
  - `enable`, `disable`, `global_enable`, `global_disable`
  - `clear`, `global_clear`
- Definidos en configuración de arquitectura
#pause
- Conjunto de tipos de interrupciones
  - `Software`, `Timer`, `External`, `EnvironmentCall`, `Maskable`,
    `NonMaskable`

```yaml
check: |
  if (registers.mip & (2n ** 11n)) return InterruptType.External;
  if (registers.mip & (2n ** 3n)) return InterruptType.Software;
  if (registers.mip & (2n ** 7n)) return InterruptType.Timer;
  return null;
```

#pagebreak()

#algorithm(
  title: [CREATOR 6's interrupt handling subroutine],
  label: <alg:creator6-interrupt-handler>,
  placement: none,
)[
  + *if* _not_ `interruptsGlobalEnabled()` *then*
    + *return*
  - *end if*
  + *if* _not_ `interruptPending()` *then*
    + *return*
  - *end if*
  + `pending_interrupt` $<-$ `getInterrupt()`
  + *if* _not_ $#raw("interruptEnabled(pending_interrupt)")$ *then*
    + *return*
  - *end if*
  + `interruptHandle(pending_interrupt)`
]

#pagebreak()

// doble handler

```yaml
custom: |
  CAPI.INTERRUPTS.globalDisable();
  CAPI.INTERRUPTS.setKernelMode();
  registers.epc = registers.pc;

  // jump to handler
  if (registers.mtvec & 1n) { // vectored mode
    registers.pc =
      (registers.mtvec >> 2n) + 4 * (registers.mcause & (2 ** 32 - 1));
  } else { // direct mode
    registers.pc = registers.mtvec >> 2n
  }
```


== Temporizadores



== Dispositivos direccionados en memoria


== Tecnologías usadas

#grid(
  align: horizon + center,
  columns: (1fr, 1fr),
  row-gutter: 15%,
  column-gutter: 5%,
  image("img/typescript.svg", height: 20%), image("img/vuejs.svg", height: 20%),
  image("img/eslint.svg", height: 12%), image("img/prettier.svg", height: 12%),
  grid.cell(colspan: 2, image("img/vite.svg", height: 20%)),
)



== Planificación
#figure(
  caption: [Diagrama Gantt del proyecto],
  scale(
    {
      import "/diagrams/gantt/gantt-short.typ": diagram as gantt-chart
      gantt-chart
    },
    85%,
  ),
)

= Conclusiones
== Conclusiones del proyecto
Objetivos cumplidos:
1.

== Conclusiones personales y trabajos futuros
#slide[
  === Conclusiones personales
  -
][
  === Trabajos futuros
  -
]


#focus-slide[
  ¡Muchas gracias por su atención!
]
// Con esto concluyo mi presentación y quedo a disposición del tribunal.
