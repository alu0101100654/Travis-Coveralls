## Florentín Pérez González 13/11/19
# Gema: Food

Food es una gema que permite la utilización de una clase cuyas instancias son, en la práctica, simulaciones de alimentos. Estos se caracterizarán por una definición basada en la cantidad de nutrientes (proteínas, lípidos y carbohidratos), así como la media de gases de efecto invernadero (en kg) generados para la producción del correspondiente alimento y los metros cuadrados necesarios para su producción anual. 

De igual manera, Food también permite la utilización de una clase que recrea una lista doblemente enlazada, válida esta para contener cualquier serie de objetos, independientemente de su tipo. A su vez, también se permite la creación de objetos representativos de platos.

Por último, Food tiene definida una clase Menu que utiliza un Lenguaje de Dominio Específico para la instanciación de sus objetos.

## Instalación

Para usar la gema basta con añadir la siguiente línea al archivo Gemfile de la apliación:

```ruby
gem 'food'
```

Posteriormente ejecute:

    $ bundle

O realize manualmente la instalación:

    $ gem install food

## Uso

La recreación de alimentos se realiza mediante la instanciación de objetos de la clase "Food". Cada objeto requiere un único argumento para poder construirse. Este se trata de un "Hash" de 6 valores que especifican el nombre del alimento, sus proteínas; lípidos, carbohidratos, gases de efecto invernadero generados para su elaboración y los metros cuadrados de tierra necesarios.   
En la siguiente línea se muestra un ejemplo:

```ruby
    basic_food = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
```
Una vez instanciado, cada objeto sirve como una representación abstracta de los alimentos que se hayan decidido recrear. El usuario puede, además, obtener los datos definidos para cada objeto a través de métodos "Getters" del mismo nombre que reciben los atributos. De igual manera, el usuario puede hacer uso del método `energetic_value` para obtener el aporte energético del alimento.

Adicionalmente, el usuario puede hacer uso de `portion_impact()` para obtener el impacto medioambiental de una porción del alimento que represente el objeto. Este método devuelve un array de dos elementos numéricos donde el primero se corresponde con el impacto en gases de efecto invernadero y el segundo con la cantidad de metros cuadrados de tierra necesaria para la creación de la porción. Para su correcto funcionamiento, el método debe recibir un único atributo, un valor númerico que indica los gramos de proteínas que contendrá la supuesta porción.

Para trabajar con las listas doblemente enlazadas, basta con crear una instancia de la clase "List". Esta lista permite insertar (`push`, `unshift`) y extraer (`pop` `shift`) por ambos extremos de la misma (head y tail respectivamente). De igual manera, puede obtenerse su equivalente a un array mediante el método `to_a`. Adicionalmente, la lista permite realizar operaciones de búsqueda de elementos internos partiendo desde cualquier de sus extremos (`find_from_head`, `find_from_tail`), así como eliminar elementos no ubicados en los extremos bajo el mismo planteamiento (`erase_from_head`, `erase_from_tail`).
List soporta, además, cualquier de los métodos propios del módulo Enumerable. 

Para trabajar con platos, se debe de tener en cuenta que existen dos posibilidades. Por un lado, se puede trabajar con la clase `Plate` que se especializa en contener y aportar la información nutricional de un plato. Por otro lado, existe la posibilidad de usar `Impact_Plate`, una clase en la misma jerarquía que `Plate` y que se distingue de esta por darle una mayor prioridad al impacto ambiental del plato que representa. A tal fin, posee métodos, `co2_impact` y `land_use`, que permiten obtener el impacto en gases de efecto invernadero y en terreno utilizado respectivamente. Además, `Impact_Plate` puede hacer las mismas funciones que `Plate`. No obstante, resultan importante aclarar que existe una diferencia a nivel de comparación de objetos: Los objetos `Plate` comparan entre ellos su valor nutricional, mientras que los objetos `Impact_Plate` comparan, en primera instancia, el impacto ambiental y, solo si este coincide, pasan a comparar el valor nutricional.

Para crear un objeto `Plate` o `Impact_Plate` es necesario llamar al constructor (`new`) con tres argumentos: El nombre del plato, un objeto `List` con los alimentos que harán de ingredientes; y otro objeto `List` de igual tamaño que el anterior con las cantidades en gramos de cada alimento.

Para crear un objeto `Menu` es necesario llamar al constructor (`new`) mediante utilizando el DSL definido. Este consiste fundamentalmente en la sucesiva definición de los platos (Objetos `Impact_Plate` ) que integran el menú junto con su respectivo precio. A continuación, un ejemplo de la instanciación de un objeto.

```ruby
    @menu = Food::Menu.new("Menú del día") do |r|
        r.componente  :plato => @lentejas_pollo,
                      :precio => 5.99
        r.componente  :plato => @postre_queso,
                      :precio => 2.5
        r.componente  :plato => @combinado,
                      :precio => 6.99
    end
```

## Desarrollo

Las depedencias pueden ser instaladas mediante la ejecución de `bin/setup`. Las pruebas pueden ser ejecutadas mediante el `rake spec`. De igual manera puede hacerse uso de `bin/console` para trabajar experimentalmente de forma dinámica.

Para instalar la gema en tu máquina local, ejecuta `bundle exec rake install`. Para lanzar una nueva versión, actualiza el número en `version.rb`, y ejecuta posteriormente `bundle exec rake release`, hecho que permitirá subir el archivo `.gem` a [rubygems.org](https://rubygems.org).

