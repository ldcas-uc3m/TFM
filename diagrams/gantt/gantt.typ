#import "@preview/gantty:0.5.1": gantt

// TODO: customize the drawer... not enough time to do it...

#let diagram = gantt(yaml("gantt.yaml"))

#set page(flipped: true)
#diagram
