# ia_bookaffinity

### Gráficos de la ontología:

1. Instalar Graphbiz (no funcionan versiones más nuevas)
<http://www.graphviz.org/pub/graphviz/stable/windows/graphviz-2.20.3.1.msi>
2. Añadir a Path de Windows
3. Abrir Protégé
4. Abrir proyecto ontología
5. Project → Configure → Tab Widgets → OntovizTab (Aparecerá nueva pestaña en el proyecto)
6. File → Preferences → Property Files → Añadir valor → Property: **dot.command** Value: **C:\Program Files (x86)\Graphviz\bin\dot** (la ruta donde lo hayáis instalado, incluyendo bin\dot) 

### Exportar ontología a Clips

File → Export to Format → CLIPS
```
copy-paste de nom.pont
(definstances instancies
copy-paste de nom.pins
)
```