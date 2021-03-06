require 'spec_helper'
RSpec.describe Food do
  it "has a version number" do
    expect(Food::VERSION).not_to be nil
  end

  context "Existencias de métodos" do
    before :each do
      @basic_food = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
    end

    it "Existe un método para obtener el nombre del alimento" do
      expect(@basic_food).to respond_to(:name)
    end
    it "Existe un método para obtener las emisiones de gases de efecto invernadero" do
      expect(@basic_food).to respond_to(:gases)
    end
    it "Existe un método para obtener el terreno utilizado" do
      expect(@basic_food).to respond_to(:land_use)
    end
    it "Existe un método para obtener el alimento formateado" do
      expect(@basic_food).to respond_to(:to_s)
    end
    it "Existe un método para obtener el valor energético de un alimento" do
      expect(@basic_food).to respond_to(:energetic_value)
    end
    it "Existe un método para obtener las proteínas de un alimento" do
      expect(@basic_food).to respond_to(:protein)
    end
    it "Existe un método para obtener los lípidos de un alimento" do
      expect(@basic_food).to respond_to(:lipids)
    end
    it "Existe un método para obtener los carbohidratos de un alimento" do
      expect(@basic_food).to respond_to(:carbohydrates)
    end
  end

  context "Funcionamiento de métodos getters asociados a las características íntegras de los alimentos" do
    before :each do
      @basic_food = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
    end

    it "El nombre del alimento es el correcto" do
      expect(@basic_food.name).to eq("Huevos")
    end
    it "La cantidad de proteínas del alimento es la correcta" do
      expect(@basic_food.protein).to eq(13.0)
    end
    it "La cantidad de carbohidratos del alimento es la correcta" do
      expect(@basic_food.carbohydrates).to eq(1.1)
    end
    it "La cantidad de lípidos del alimento es la correcta" do
      expect(@basic_food.lipids).to eq(11.0)
    end
  end #context

  context "Funcionamiento de métodos getters asociados a las implicaciones medioambientales de los alimentos" do
    before :each do
      @basic_food = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
    end

    it "La cantidad de gases de efecto invernadero asociados a la producción de un kilo del alimento es la correcta" do
      expect(@basic_food.gases).to eq(4.2)
    end
    it "La cantidad de terreno en m2 utilizados para la producción de un kilo del alimento es la correcta" do
      expect(@basic_food.land_use).to eq(5.7)
    end
  end #context


  it "La salida formateada de un alimento es la correcta" do
    huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
    expect(huevos.to_s).to eq("{Huevos, 13.0, 1.1, 11.0, 4.2, 5.7}")
  end

  context "Pruebas sobre valores calóricos" do
    before :each do
      @huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
      @carne_de_vaca = Food::Food.new({:name => 'Carne de vaca', :protein => 21.1, :carbohydrates => 0.0, :lipids => 3.1, :gas => 50.0, :land_use => 164.0})
      @cafe = Food::Food.new({:name => 'Cafe', :protein => 0.1, :carbohydrates => 0.0, :lipids => 0.0, :gas => 0.4, :land_use => 0.3})
      @cerveza = Food::Food.new({:name => 'Cerveza', :protein => 0.5, :carbohydrates => 3.6, :lipids => 0.0, :gas => 0.24, :land_use => 0.22})
    end

    it "El valor calórico de un alimento es el correcto" do
      expect(@huevos.energetic_value).to eq(155.4)
      expect(@carne_de_vaca.energetic_value).to eq(112.3)
      expect(@cerveza.energetic_value).to eq(16.4)
      expect(@cafe.energetic_value).to eq(0.4)
    end
  end

  context "Pruebas sobre el cálculo medioambiental de un hombre y una mujer adultas (20-39 años)" do
    before :each do
      @huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
      @nuez = Food::Food.new({:name => 'Nuez', :protein => 20.0, :carbohydrates => 21.1, :lipids => 54.0, :gas => 0.3, :land_use => 7.9})
      @pollo = Food::Food.new({:name => 'Pollo', :protein => 20.6, :carbohydrates => 0.0, :lipids => 5.6, :gas => 5.7, :land_use => 7.1})
      @cerdo = Food::Food.new({:name => 'Cerdo', :protein => 21.5, :carbohydrates => 0.0, :lipids => 6.3, :gas => 7.6, :land_use => 11.0})
      @cerveza = Food::Food.new({:name => 'Cerveza', :protein => 0.5, :carbohydrates => 3.6, :lipids => 0.0, :gas => 0.24, :land_use => 0.22})
      @lentejas = Food::Food.new({:name => 'Lentejas', :protein => 23.5, :carbohydrates => 52.0, :lipids => 1.4, :gas => 0.4, :land_use => 3.4})
      @cafe = Food::Food.new({:name => 'Cafe', :protein => 0.1, :carbohydrates => 0.0, :lipids => 0.0, :gas => 0.4, :land_use => 0.3})
      @tofu = Food::Food.new({:name => 'Tofu', :protein => 8.0, :carbohydrates => 1.9, :lipids => 4.8, :gas => 2.0, :land_use => 2.2})
    end

    it "Existe un método para calcular proporciones basadas en las proteínas" do
      expect(@huevos).to respond_to(:portion_impact)
    end
    it "Existe un método para calcular proporciones basadas en las proteínas que recibe un argumento" do
      expect(@huevos).to respond_to(:portion_impact).with(1).arguments
    end
    it "El método que calcula proporciones basadas en las proteínas funciona correctamente" do
      expect(@huevos.portion_impact(26)).to eq([8.4, 11.4])
    end
    it "Se calcula correctamente el impacto ambiental de un hombre adulto" do
      solution = [0.0, 0.0]
      hombre = [{:food => @huevos, :protein_grams => 15}, {:food => @cerdo, :protein_grams => 23}, {:food => @pollo, :protein_grams => 15}, {:food => @cerveza, :protein_grams => 1}]
      hombre.each do |x|
        solution = solution.zip(x[:food].portion_impact(x[:protein_grams])).map { |a, b| a + b}
      end
      expect(solution).to eq([17.606,23.954])
    end
    it "Se calcula correctamente el impacto ambiental de una mujer adulta" do
      solution = [0.0, 0.0]
      mujer = [{:food => @lentejas, :protein_grams => 20}, {:food => @tofu, :protein_grams => 13}, {:food => @nuez, :protein_grams => 7}, {:food => @cafe, :protein_grams => 1}]
      mujer.each do |x|
        solution = solution.zip(x[:food].portion_impact(x[:protein_grams])).map { |a, b| a + b}
      end
      expect(solution).to eq([7.695,12.234])
    end
  end
  context "Food es comparable" do
    before :each do
      @huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
      @nuez = Food::Food.new({:name => 'Nuez', :protein => 20.0, :carbohydrates => 21.1, :lipids => 54.0, :gas => 0.3, :land_use => 7.9})
      @pollo = Food::Food.new({:name => 'Pollo', :protein => 20.6, :carbohydrates => 0.0, :lipids => 5.6, :gas => 5.7, :land_use => 7.1})
    end
    #it "Food tiene el módulo Comparable" do
    #  expect(Food::Food.ancestors.select {|x| x.class == Module}).to eq([Comparable, Kernel])
    #end
    it "Se compara un alimento adecuadamente con otro" do
      expect(@huevos < @nuez).to eq(true)
      expect(@nuez > @pollo).to eq(true)
      expect(@huevos >= @pollo).to eq(true)
      expect(@huevos == @huevos).to eq(true)
      expect(@huevos == @pollo).to eq(false)
      expect(@pollo <= @nuez).to eq(true)
      expect(@pollo.between?(@huevos, @nuez)).to eq(false)
      expect(@pollo.clamp(@huevos, @nuez)).to eq(@huevos)
    end
  end
end #describe

RSpec.describe Food::List do
  context "Instancias de la clase lista y acceso a sus atributos. Existencia de nodos" do
    it "Instanciación con new" do
      lista = Food::List.new
      expect(lista).not_to be(nil)
    end
    it "Existen nodos" do
      nodo = Food::List::Node.new(nil,nil,nil)
      expect(nodo).not_to be(nil)
    end
    it "Los nodos poseen una referencia al nodo siguiente en la lista" do
      expect(Food::List::Node.new(nil,nil,nil)).to respond_to(:next)
    end
    it "Los nodos poseen una referencia al nodo anterior en la lista" do
      expect(Food::List::Node.new(nil,nil,nil)).to respond_to(:prev)
    end
    it "Los nodos poseen un valor" do
      expect(Food::List::Node.new(nil,nil,nil)).to respond_to(:value)
    end
    it "La clase lista posee una referencia a head" do
      expect(Food::List.new).to respond_to(:head)
    end
    it "La clase lista posee una referencia a head" do
      expect(Food::List.new).to respond_to(:tail)
    end
  end

  context "Métodos propios de los nodos" do
    it "La salida foramateada de los nodos es la correcta" do
      nodo = Food::List::Node.new(1,nil,nil)
      expect(nodo.to_s).to eq("(1)")
    end
  end

  context "Existencia de métodos en las listas" do
    before :each do
      @list = Food::List.new
    end
    it "Existe un método para añadir un nodo por la cola" do
      expect(@list).to respond_to(:push)
    end
    it "Existe un método para añadir un nodo por la cabeza" do
      expect(@list).to respond_to(:unshift)
    end
    it "Existe un método que devuleve la lista como un array" do
      expect(@list).to respond_to(:to_a)
    end
    it "Existe un método que permite insertar múltiples valores desde head" do
      expect(@list).to respond_to(:pushVarious)
    end
    it "Existe un método que permite insertar múltiples valores desde tail" do
      expect(@list).to respond_to(:unshiftVarious)
    end
    it "Existe un método para extraer de la lista desde tail" do
      expect(@list).to respond_to(:pop)
    end
    it "Existe un método para extraer de la lista desde head" do
      expect(@list).to respond_to(:shift)
    end
    it "Existe un método para borrar toda la lista" do
      expect(@list).to respond_to(:clear)
    end
    it "Existe un método que permite borrar un nodo específico partiendo de tail" do
      expect(@list).to respond_to(:erase_from_tail)
    end
    it "Existe un método que permite borrar un nodo específico partiendo de head" do
      expect(@list).to respond_to(:erase_from_head)
    end
    it "Existe un método que permite buscar un nodo específico partiendo de head" do
      expect(@list).to respond_to(:find_from_head)
    end
    it "Existe un método que permite buscar un nodo específico partiendo de tail" do
      expect(@list).to respond_to(:find_from_tail)
    end
  end
  context "Operaciones de insercción en las listas" do
    before :each do
      @list = Food::List.new
    end
    it "La salida formateada de una lista es la correcta" do
      expect(@list.to_a).to eq([])
    end
    it "Se inserta con push adecuadamente" do
      @list.push(3)
      expect(@list.to_a).to eq([3])
    end
    it "Se inserta con unshift adecuadamente" do
      @list.unshift(3)
      expect(@list.to_a).to eq([3])
    end
    it "Se inserta con pushVarious adecuadamente" do
      @list.pushVarious([2,3])
      expect(@list.to_a).to eq([2,3])
    end
    it "Se inserta con unshiftVarious adecuadamente" do
      @list.unshiftVarious([2,3])
      expect(@list.to_a).to eq([3,2])
    end
  end
  context "Operaciones de eliminación en las listas" do
    before :each do
      @list = Food::List.new
      @list.pushVarious([1,2,3,4])
    end
    it "Se elimina con pop adecuadamente" do
      @list.pop
      expect(@list.to_a).to eq([1,2,3])
    end
    it "Se elimina con shift adecuadamente" do
      @list.shift
      expect(@list.to_a).to eq([2,3,4])
    end
    it "Se elimina con erase_from_head adecuadamente" do
      @list.erase_from_head(2)
      expect(@list.to_a).to eq([1,3,4])
    end
    it "Se elimina con erase_from_tail adecuadamente" do
      @list.erase_from_tail(3)
      expect(@list.to_a).to eq([1,2,4])
    end
    it "Se elimina con clear adecuadamente" do
      @list.clear
      expect(@list.to_a).to eq([])
    end
  end
  context "Operaciones de búsqueda en las listas" do
    before :each do
      @list = Food::List.new 
      @list.pushVarious([2,0,4,3])
    end
    it "Se encuentran elementos adecuadamente con find_from_head" do
      expect(@list.find_from_head(3)).to eq(3)
    end
    it "Se encuentran elementos adecuadamente con find_from_tail" do
      expect(@list.find_from_tail(3)).to eq(-1)
    end
    it "No se encuentra un elemento inexistente con find_from_head" do
      expect(@list.find_from_head(8)).to eq(nil)
    end
    it "No se encuentra un elemento inexistente con find_from_tail" do
      expect(@list.find_from_tail(8)).to eq(nil)
    end
  end
  context "Operaciones adicionales con listas" do
    before :each do
      @list = Food::List.new
      @list.pushVarious([2,0,4,3])
    end
    it "Existe un método each" do
      expect(@list).to respond_to(:each)
    end
    it "Métodos propios de Enumerable funcionan correctamente" do
      expect(@list.min).to eq(0)
      expect(@list.max).to eq(4)
      expect(@list.count).to eq(4)
      expect(@list.map{|x| x*2}).to eq([4,0,8,6])
      expect(@list.find{|x| x == 4}).to eq(4)
    end
    it "Existe un método []" do
      expect(@list).to respond_to(:[])
    end
    it "El método [] funciona correctamente" do
      expect(@list[:head]).to eq(2)
      expect(@list[:tail]).to eq(3)
      expect(@list["head"]).to eq(2)
      expect(@list["tail"]).to eq(3)
      expect(@list[:word]).to eq(nil)
      expect(@list["word"]).to eq(nil)
      expect(@list[99]).to eq(nil)
      expect(@list[2]).to eq(4)
      expect(@list[-2]).to eq(4)
    end
  end
  context "Cálculos sobre distintas dietas" do
    before :each do
      @huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
      @cordero = Food::Food.new({:name => 'Cordero', :protein => 18.0, :carbohydrates => 0.0, :lipids => 17.0, :gas => 20.0, :land_use => 185.0})
      @lentejas = Food::Food.new({:name => 'Lentejas', :protein => 23.5, :carbohydrates => 52.0, :lipids => 1.4, :gas => 0.4, :land_use => 3.4})
      @cerveza = Food::Food.new({:name => 'Cerveza', :protein => 0.5, :carbohydrates => 3.6, :lipids => 0.0, :gas => 0.24, :land_use => 0.22})
      @chocolate = Food::Food.new({:name => 'Chocolate', :protein => 5.3, :carbohydrates => 47.0, :lipids => 30.0, :gas => 2.3, :land_use => 3.4})
      @vaca = Food::Food.new({:name => 'Vaca', :protein => 21.1, :carbohydrates => 0.0, :lipids => 3.1, :gas => 50.0, :land_use => 164.0})
      @nuez = Food::Food.new({:name => 'Nuez', :protein => 20.0, :carbohydrates => 21.1, :lipids => 54.0, :gas => 0.3, :land_use => 7.9})
      @queso = Food::Food.new({:name => 'Queso', :protein => 25.0, :carbohydrates => 1.3, :lipids => 33.0, :gas => 11.0, :land_use => 41.0})
      @leche = Food::Food.new({:name => 'Leche', :protein => 3.3, :carbohydrates => 4.8, :lipids => 3.2, :gas => 3.2, :land_use => 8.9})
      @tofu = Food::Food.new({:name => 'Tofu', :protein => 8.0, :carbohydrates => 1.9, :lipids => 4.8, :gas => 2.0, :land_use => 2.2})
      @cafe = Food::Food.new({:name => 'Cafe', :protein => 0.1, :carbohydrates => 0.0, :lipids => 0.0, :gas => 0.4, :land_use => 0.3})
      @pollo = Food::Food.new({:name => 'Pollo', :protein => 20.6, :carbohydrates => 0.0, :lipids => 5.6, :gas => 5.7, :land_use => 7.1})
      @dieta_espanola = Food::List.new
      @dieta_espanola.pushVarious([@cordero, @lentejas, @chocolate, @queso, @cerveza, @nuez])
      @dieta_vasca = Food::List.new
      @dieta_vasca.pushVarious([@lentejas, @chocolate, @chocolate, @leche])
      @dieta_vegetariana = Food::List.new
      @dieta_vegetariana.pushVarious([@nuez, @nuez, @leche, @leche, @huevos, @chocolate, @lentejas, @tofu])
      @dieta_vegetaliana = Food::List.new
      @dieta_vegetaliana.pushVarious([@tofu, @tofu, @tofu, @tofu, @lentejas, @nuez, @chocolate, @cafe])
      @locura_carne = Food::List.new
      @locura_carne.pushVarious([@vaca, @cordero, @pollo, @lentejas, @queso, @leche])
    end
    it "Cálculo de las emisiones diarias de gases de efecto invernadero para cada dieta" do
      solution = 0.0
      @dieta_espanola.each{|x| solution = solution + x.gases}
      expect(solution.round(2)).to eq(34.24)
      solution = 0.0
      @dieta_vasca.each{|x| solution = solution + x.gases}
      expect(solution.round(2)).to eq(8.2)
      solution = 0.0
      @dieta_vegetaliana.each{|x| solution = solution + x.gases}
      expect(solution.round(2)).to eq(11.4)
      solution = 0.0
      @dieta_vegetariana.each{|x| solution = solution + x.gases}
      expect(solution.round(2)).to eq(15.9)
      solution = 0.0
      @locura_carne.each{|x| solution = solution + x.gases}
      expect(solution.round(2)).to eq(90.3)
    end
    it "Emisiones anuales de gases de efecto invernadero para cada dieta" do
      solution = 0.0
      @dieta_espanola.each{|x| solution = solution + x.gases*365}
      expect(solution.round(2)).to eq(12497.6)
      solution = 0.0
      @dieta_vasca.each{|x| solution = solution + x.gases*365}
      expect(solution.round(2)).to eq(2993.0)
      solution = 0.0
      @dieta_vegetaliana.each{|x| solution = solution + x.gases*365}
      expect(solution.round(2)).to eq(4161.0)
      solution = 0.0
      @dieta_vegetariana.each{|x| solution = solution + x.gases*365}
      expect(solution.round(2)).to eq(5803.5)
      solution = 0.0
      @locura_carne.each{|x| solution = solution + x.gases*365}
      expect(solution.round(2)).to eq(32959.5)
    end
    it "Estimaciones de uso de terreno para cada dieta" do
      solution = 0.0
      @dieta_espanola.each{|x| solution = solution + x.land_use}
      expect(solution.round(2)).to eq(240.92)
      solution = 0.0
      @dieta_vasca.each{|x| solution = solution + x.land_use}
      expect(solution.round(2)).to eq(19.1)
      solution = 0.0
      @dieta_vegetaliana.each{|x| solution = solution + x.land_use}
      expect(solution.round(2)).to eq(23.8)
      solution = 0.0
      @dieta_vegetariana.each{|x| solution = solution + x.land_use}
      expect(solution.round(2)).to eq(48.3)
      solution = 0.0
      @locura_carne.each{|x| solution = solution + x.land_use}
      expect(solution.round(2)).to eq(409.4)
    end
  end
  context "Comparaciones adecuadas en una lista de alimentos" do
    before :each do
      @huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
      @cordero = Food::Food.new({:name => 'Cordero', :protein => 18.0, :carbohydrates => 0.0, :lipids => 17.0, :gas => 20.0, :land_use => 185.0})
      @lentejas = Food::Food.new({:name => 'Lentejas', :protein => 23.5, :carbohydrates => 52.0, :lipids => 1.4, :gas => 0.4, :land_use => 3.4})
      @chocolate = Food::Food.new({:name => 'Chocolate', :protein => 5.3, :carbohydrates => 47.0, :lipids => 30.0, :gas => 2.3, :land_use => 3.4})
      @lista = Food::List.new
      @lista.pushVarious([@huevos, @cordero, @lentejas])
    end
    it "El método collect funciona correctamente" do
      expect(@lista.collect{|x| x.protein > 20.0}).to eq([false,false,true])
    end
    it "El método max funciona correctamente" do
      expect(@lista.max).to eq(@lentejas)
    end
    it "El método min funciona correctamente" do
      expect(@lista.min).to eq(@huevos)
    end
    it "El método sort funciona correctamente" do
      expect(@lista.sort).to eq([@huevos, @cordero, @lentejas])
    end
    it "El método select funciona correctamente" do
      expect(@lista.select { |x| x > @cordero}).to eq([@lentejas])
    end
  end
end

RSpec.describe Food::Plate do
  before :each do
    @huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
    @cordero = Food::Food.new({:name => 'Cordero', :protein => 18.0, :carbohydrates => 0.0, :lipids => 17.0, :gas => 20.0, :land_use => 185.0})
    @lentejas = Food::Food.new({:name => 'Lentejas', :protein => 23.5, :carbohydrates => 52.0, :lipids => 1.4, :gas => 0.4, :land_use => 3.4})
    @lista = Food::List.new
    @lista.pushVarious([@huevos, @cordero, @lentejas])
    @lista_grams = Food::List.new
    @lista_grams.pushVarious([10, 20, 30])
  end
  describe "Pruebas iniciales sobre Plate" do
    it "Plate tiene un constructor con 3 argumentos" do
      expect(Food::Plate).to respond_to(:new).with(3).arguments
    end
    it "Plate tiene definido un conjunto de alimentos" do
      expect(Food::Plate.new("Lentejas Deluxe", @lista, @lista_grams)).to respond_to(:ingredients)
    end
    it "Plate tienen definido un conjunto de cantidades de alimentos" do
      expect(Food::Plate.new("Lentejas Deluxe", @lista, @lista_grams)).to respond_to(:ingredients_grams)
    end
    it "Se obtiene correctamente el nombre de un plato" do
      expect(Food::Plate.new("Lentejas Deluxe", @lista, @lista_grams).name).to eq("Lentejas Deluxe")
    end
    it "Se obtienen correctamente los ingredientes de un plato" do
      expect(Food::Plate.new("Lentejas Deluxe", @lista, @lista_grams).ingredients.to_a).to eq([@huevos, @cordero, @lentejas])
    end
    it "Se obtienen correctamente los gramos de ingredientes de un plato" do
      expect(Food::Plate.new("Lentejas Deluxe", @lista, @lista_grams).ingredients_grams.to_a).to eq([10, 20, 30])
    end
    #it "Plate tiene el modulo Comparable" do
    #  expect(Food::Plate.ancestors.select {|x| x.class == Module}).to eq([Comparable, Kernel])
    #end
  end
  context "Prueba de método de Plate" do
    before :each do
      @plate = Food::Plate.new("Lentejas Deluxe", @lista, @lista_grams)
    end
    it "Existe un método que calcula el % de proteínas" do
      expect(@plate).to respond_to(:protein_percentage)
    end
    it "Existe un método que calcula el % de carbohidratos" do
      expect(@plate).to respond_to(:carbohydrates_percentage)
    end
    it "Existe un método que calcula el % de lípidos" do
      expect(@plate).to respond_to(:lipids_percentage)
    end
    it "Se obtiene el procentaje de proteínas correcto" do
      expect(@plate.protein_percentage).to eq(36.6)
    end
    it "Se obtiene el procentaje de lípidos correcto" do
      expect(@plate.lipids_percentage).to eq(15.0)
    end
    it "Se obtiene el procentaje de carbohidratos correcto" do
      expect(@plate.carbohydrates_percentage).to eq(48.3)
    end
    it "Se obtiene el alimento formateado" do
      expect(@plate.to_s).to eq("(Lentejas Deluxe: 10 gramos de Huevos, 20 gramos de Cordero, 30 gramos de Lentejas)")
    end
    it "Existe un método para calcular V.C.T del plato" do
      expect(@plate).to respond_to(:calculate_TCV)
    end
    it "El T.C.V de un plato es el correcto" do
      expect(@plate.calculate_TCV).to eq(154.92)
    end
  end
  context "Comparaciones entre Plates" do
    before :each do
      @queso = Food::Food.new({:name => 'Queso', :protein => 25.0, :carbohydrates => 1.3, :lipids => 33.0, :gas => 11.0, :land_use => 41.0})
      @leche = Food::Food.new({:name => 'Leche', :protein => 3.3, :carbohydrates => 4.8, :lipids => 3.2, :gas => 3.2, :land_use => 8.9})
      @tofu = Food::Food.new({:name => 'Tofu', :protein => 8.0, :carbohydrates => 1.9, :lipids => 4.8, :gas => 2.0, :land_use => 2.2})
      @lista_aux = Food::List.new
      @lista_aux.pushVarious([@queso, @leche, @tofu])
      @lista_grams = Food::List.new
      @lista_grams.pushVarious([10, 20, 30])
      @plate_2 = Food::Plate.new("Tofu Bechamel", @lista_aux, @lista_grams)
      @plate = Food::Plate.new("Lentejas Deluxe", @lista, @lista_grams)
    end
    it "Se comparan adecuadamente dos platos" do
      expect(@plate < @plate_2).to eq(false)
      expect(@plate > @plate_2).to eq(true)
      expect(@plate == @plate_2).to eq(false)
      expect(@plate <= @plate_2).to eq(false)
      expect(@plate >= @plate_2).to eq(true)
    end
  end
end

RSpec.describe Food::Impact_Plate do
=begin
  before :each do
    @huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
    @cordero = Food::Food.new({:name => 'Cordero', :protein => 18.0, :carbohydrates => 0.0, :lipids => 17.0, :gas => 20.0, :land_use => 185.0})
    @lentejas = Food::Food.new({:name => 'Lentejas', :protein => 23.5, :carbohydrates => 52.0, :lipids => 1.4, :gas => 0.4, :land_use => 3.4})
    @chocolate = Food::Food.new({:name => 'Chocolate', :protein => 5.3, :carbohydrates => 47.0, :lipids => 30.0, :gas => 2.3, :land_use => 3.4})
    @queso = Food::Food.new({:name => 'Queso', :protein => 25.0, :carbohydrates => 1.3, :lipids => 33.0, :gas => 11.0, :land_use => 41.0})
    @leche = Food::Food.new({:name => 'Leche', :protein => 3.3, :carbohydrates => 4.8, :lipids => 3.2, :gas => 3.2, :land_use => 8.9})
    @tofu = Food::Food.new({:name => 'Tofu', :protein => 8.0, :carbohydrates => 1.9, :lipids => 4.8, :gas => 2.0, :land_use => 2.2})
    @lista = Food::List.new
    @lista.pushVarious([@huevos, @cordero, @lentejas])
    @lista_grams = Food::List.new
    @lista_grams.pushVarious([10, 20, 30])
  end
  context "Naturaleza de Impact_Plate" do
    it "Impact_Plate es hija de Plate" do
      expect(Food::Impact_Plate.superclass).to eq(Food::Plate)
    end
    it "Impact_Plate también es un plato" do
      expect(Food::Impact_Plate.new("Lentejas Deluxe", @lista, @lista_grams)).to be_kind_of(Food::Plate)
    end
    it "Los objetos Impact_Plate son instancian de Food::Impact_Plate" do
      expect(Food::Impact_Plate.new("Lentejas Deluxe", @lista, @lista_grams)).to be_instance_of(Food::Impact_Plate)
    end
    it "Se comprueba la clase de Impact_Plate" do 
      expect(Food::Impact_Plate.new("Lentejas Deluxe", @lista, @lista_grams).class).to eq(Food::Impact_Plate)
    end
    it "Se comprueba que la jerarquía de Impact_Plate es la correcta" do
      expect(Food::Impact_Plate.ancestors).to eq([Food::Impact_Plate, Food::Plate, Comparable, Object, Kernel, BasicObject])
    end
  end
  context "Funcionamiento y estructura de la clase Impact_Plate" do
    before :each do
      @impact_plate = Food::Impact_Plate.new("Lentejas Deluxe", @lista, @lista_grams)
    end
    it "Impact_Plate tiene un método para calcular las emisiones diarias de gases de efecto invernadero necesarias para la creación del plato" do
      expect(@impact_plate).to respond_to(:co2_impact)
    end
    it "Impact_Plate tiene un método para calcular la estimación de terreno necesaria para la creación del plato" do
      expect(@impact_plate).to respond_to(:land_use)
    end
    it "Se obtiene el impacto en gases de efecto invernadero de un plato adecuamente" do
      expect(@impact_plate.co2_impact).to eq(0.454)
    end
    it "Se obtiene el la estimación de terreno necesario para producir un plato adecuamente" do
      expect(@impact_plate.land_use).to eq(3.859)
    end
    it "Se obtiene una salida formateada correcta" do
      expect(@impact_plate.to_s).to eq("(Lentejas Deluxe: 10 gramos de Huevos, 20 gramos de Cordero, 30 gramos de Lentejas. CO2: 0.454, m2: 3.859)")
    end
  end

  context "Comparaciones entre Impact_Plate" do
    before :each do
      @lista_aux = Food::List.new
      @lista_aux.pushVarious([@queso, @leche, @tofu])
      @impact_plate_1 = Food::Impact_Plate.new("Lentejas Deluxe", @lista, @lista_grams)
      @plate_1 = Food::Plate.new("Lentejas Deluxe", @lista, @lista_grams)
      @impact_plate_2 = Food::Impact_Plate.new("Tofu Bechamel", @lista_aux, @lista_grams)
      @plate_2 = Food::Plate.new("Tofu Bechamel", @lista_aux, @lista_grams)
    end
    it "Impact_Plate posee el módulo Comparable" do
      expect(Food::Impact_Plate.ancestors.select {|x| x.class == Module}).to eq([Comparable, Kernel])
    end
    it "Se comparan dos objetos Impact_Plate adecuadamente" do
      expect(@impact_plate_1 < @impact_plate_2).to eq(false)
      expect(@impact_plate_1 <= @impact_plate_2).to eq(false)
      expect(@impact_plate_1 > @impact_plate_2).to eq(true)
      expect(@impact_plate_1 >= @impact_plate_2).to eq(true)
      expect(@impact_plate_1 == @impact_plate_2).to eq(false)
    end
    it "Se comparan adecuadamente objetos Plate con objetos Impact_Plate" do
      expect(@plate_1 < @impact_plate_2).to eq(false)
      expect(@plate_1 <= @impact_plate_2).to eq(false)
      expect(@plate_1 > @impact_plate_2).to eq(true)
      expect(@plate_1 >= @impact_plate_2).to eq(true)
      expect(@plate_1 == @impact_plate_1).to eq(true)
    end
  end

  before :each do
    @nuez = Food::Food.new({:name => 'Nuez', :protein => 20.0, :carbohydrates => 21.1, :lipids => 54.0, :gas => 0.3, :land_use => 7.9})
    @cerveza = Food::Food.new({:name => 'Cerveza', :protein => 0.5, :carbohydrates => 3.6, :lipids => 0.0, :gas => 0.24, :land_use => 0.22})
  end
  context "Se realizan comparaciones entre platos de la dieta española" do
    before :each do
      @lista = Food::List.new
      @lista.pushVarious([40, 60])
      @lista_b = Food::List.new
      @lista_b.pushVarious([280,20,20])
      @listaI = Food::List.new
      @listaI.pushVarious([@lentejas, @nuez])
      @listaI_b = Food::List.new
      @listaI_b.pushVarious([@cerveza, @cordero, @nuez])
      @carne_de_vaca = Food::Food.new({:name => 'Carne de vaca', :protein => 21.1, :carbohydrates => 0.0, :lipids => 3.1, :gas => 50.0, :land_use => 164.0})
      @lista_c = Food::List.new
      @lista_c.pushVarious([220,100,100,150])
      @listaI_c = Food::List.new
      @listaI_c.pushVarious([@chocolate, @nuez, @leche, @carne_de_vaca])
    end
    it "Comparación de valoración nutricional" do
      plato_a = Food::Plate.new("Lentejas con nueces", @listaI, @lista)
      plato_b = Food::Plate.new("Cordero con nueces a la cerveza", @listaI_b, @lista_b)
      plato_c = Food::Plate.new("Postre de carne", @listaI_c, @lista_c)
      expect(plato_a < plato_b).to eq(false)
      expect(plato_a <= plato_b).to eq(false)
      expect(plato_a > plato_b).to eq(true)
      expect(plato_a > plato_b).to eq(true)
      expect(plato_a == plato_b).to eq(false)
      expect(plato_c.between?(plato_b, plato_a)).to eq(false)
      expect(plato_c.clamp(plato_b, plato_a)).to eq(plato_a)
    end
    it "Comparación de impacto ambiental" do
      plato_a = Food::Impact_Plate.new("Lentejas con nueces", @listaI, @lista)
      plato_b = Food::Impact_Plate.new("Cordero con nueces a la cerveza", @listaI_b, @lista_b)
      plato_c = Food::Impact_Plate.new("Postre de carne", @listaI_c, @lista_c)
      expect(plato_a < plato_b).to eq(true)
      expect(plato_a <= plato_b).to eq(true)
      expect(plato_a > plato_b).to eq(false)
      expect(plato_a > plato_b).to eq(false)
      expect(plato_a == plato_b).to eq(false)
      expect(plato_c.between?(plato_b, plato_a)).to eq(false)
      expect(plato_c.clamp(plato_a, plato_b)).to eq(plato_b)
    end
  end

  context "Se realizan comparaciones entre platos de la dieta vasca" do
    before :each do
      @camarones = Food::Food.new({:name => "Camarones", :protein => 17.6, :carbohydrates => 1.5, :lipids => 0.6, :gas => 18.0, :land_use => 2})
      @lista = Food::List.new
      @lista.pushVarious([100, 50, 50])
      @lista_b = Food::List.new
      @lista_b.pushVarious([300,10,300,40,350])
      @listaI = Food::List.new
      @listaI.pushVarious([@chocolate, @leche, @lentejas])
      @listaI_b = Food::List.new
      @listaI_b.pushVarious([@lentejas, @camarones, @cerveza, @queso, @chocolate])
      @carne_de_vaca = Food::Food.new({:name => 'Carne de vaca', :protein => 21.1, :carbohydrates => 0.0, :lipids => 3.1, :gas => 50.0, :land_use => 164.0})
      @lista_c = Food::List.new
      @lista_c.pushVarious([100,10,100,100])
      @listaI_c = Food::List.new
      @listaI_c.pushVarious([@chocolate, @nuez, @leche, @lentejas])
    end
    it "Comparaciones del valor nutricional" do
      plato_a = Food::Plate.new("Helado de chocolate con lentejas", @listaI, @lista)
      plato_b = Food::Plate.new("Ración Completa Vasca", @listaI_b, @lista_b)
      plato_c = Food::Plate.new("Ración especial", @listaI_c, @lista_c)
      expect(plato_a < plato_b).to eq(true)
      expect(plato_a <= plato_b).to eq(true)
      expect(plato_a > plato_b).to eq(false)
      expect(plato_a > plato_b).to eq(false)
      expect(plato_a == plato_b).to eq(false)
      expect(plato_c.between?(plato_b, plato_a)).to eq(false)
      expect(plato_c.clamp(plato_a, plato_b)).to eq(plato_c)
    end
    it "Comparación de impacto ambiental" do
      plato_a = Food::Impact_Plate.new("Helado de chocolate con lentejas", @listaI, @lista)
      plato_b = Food::Impact_Plate.new("Ración Completa Vasca", @listaI_b, @lista_b)
      plato_c = Food::Impact_Plate.new("Postre de carne", @listaI_c, @lista_c)
      expect(plato_a < plato_b).to eq(true)
      expect(plato_a <= plato_b).to eq(true)
      expect(plato_a > plato_b).to eq(false)
      expect(plato_a > plato_b).to eq(false)
      expect(plato_a == plato_b).to eq(false)
      expect(plato_c.between?(plato_b, plato_a)).to eq(false)
      expect(plato_c.clamp(plato_a, plato_b)).to eq(plato_c)
    end
  end
  context "Se realizan comparaciones entre platos de la dieta vegetaria" do
    before :each do
      @lista = Food::List.new
      @lista.pushVarious([85,15,5,15])
      @lista_b = Food::List.new
      @lista_b.pushVarious([100,60,20])
      @listaI = Food::List.new
      @listaI.pushVarious([@leche, @huevos, @nuez, @chocolate])
      @listaI_b = Food::List.new
      @listaI_b.pushVarious([@tofu, @chocolate, @nuez])
      @lista_c = Food::List.new
      @lista_c.pushVarious([10,350,250])
      @listaI_c = Food::List.new
      @listaI_c.pushVarious([@tofu, @nuez, @lentejas])
    end
    it "Comparaciones del valor nutricional" do
      plato_a = Food::Plate.new("Tarta de chocolate con nueces", @listaI, @lista)
      plato_b = Food::Plate.new("Tofú con chocolate con nueces", @listaI_b, @lista_b)
      plato_c = Food::Plate.new("Lentejas con tofu", @listaI_c, @lista_c)
      expect(plato_a < plato_b).to eq(true)
      expect(plato_a <= plato_b).to eq(true)
      expect(plato_a > plato_b).to eq(false)
      expect(plato_a > plato_b).to eq(false)
      expect(plato_a == plato_b).to eq(false)
      expect(plato_c.between?(plato_b, plato_a)).to eq(false)
      expect(plato_c.clamp(plato_a, plato_b)).to eq(plato_b)
    end
    it "Comparaciones del impacto ambiental" do
      plato_a = Food::Impact_Plate.new("Tarta de chocolate con nueces", @listaI, @lista)
      plato_b = Food::Impact_Plate.new("Tofú con chocolate con nueces", @listaI_b, @lista_b)
      plato_c = Food::Impact_Plate.new("Postre de carne", @listaI_c, @lista_c)
      expect(plato_a < plato_b).to eq(false)
      expect(plato_a <= plato_b).to eq(false)
      expect(plato_a > plato_b).to eq(true)
      expect(plato_a > plato_b).to eq(true)
      expect(plato_a == plato_b).to eq(false)
      expect(plato_c.between?(plato_b, plato_a)).to eq(false)
      expect(plato_c.clamp(plato_b, plato_a)).to eq(plato_b)
    end
  end
  context "Se realizan comparaciones entre platos de la dieta vegetaliana" do
    before :each do
      @cafe = Food::Food.new({:name => 'Cafe', :protein => 0.1, :carbohydrates => 0.0, :lipids => 0.0, :gas => 0.4, :land_use => 0.3})
      @lista = Food::List.new
      @lista.pushVarious([250,55,60])
      @lista_b = Food::List.new
      @lista_b.pushVarious([70,10,50,500])
      @listaI = Food::List.new
      @listaI.pushVarious([@tofu, @lentejas, @nuez])
      @listaI_b = Food::List.new
      @listaI_b.pushVarious([@chocolate, @nuez, @cafe, @tofu])
      @lista_c = Food::List.new
      @lista_c.pushVarious([270,40,500])
      @listaI_c = Food::List.new
      @listaI_c.pushVarious([@tofu, @nuez, @cerveza])
    end
    it "Comparaciones del valor nutricional" do
      plato_a = Food::Plate.new("Lentejas con tofu", @listaI, @lista)
      plato_b = Food::Plate.new("Tofu acompañado de chocolate con café", @listaI_b, @lista_b)
      plato_c = Food::Plate.new("Picoteo", @listaI_c, @lista_c)
      expect(plato_a < plato_b).to eq(true)
      expect(plato_a <= plato_b).to eq(true)
      expect(plato_a > plato_b).to eq(false)
      expect(plato_a > plato_b).to eq(false)
      expect(plato_a == plato_b).to eq(false)
      expect(plato_c.between?(plato_b, plato_a)).to eq(false)
      expect(plato_c.clamp(plato_a, plato_b)).to eq(plato_a)
    end
    it "Comparaciones del impacto ambiental" do
      plato_a = Food::Impact_Plate.new("Lentejas con tofu", @listaI, @lista)
      plato_b = Food::Impact_Plate.new("Tofu acompañado de chocolate con café", @listaI_b, @lista_b)
      plato_c = Food::Impact_Plate.new("Picoteo", @listaI_c, @lista_c)
      expect(plato_a < plato_b).to eq(true)
      expect(plato_a <= plato_b).to eq(true)
      expect(plato_a > plato_b).to eq(false)
      expect(plato_a > plato_b).to eq(false)
      expect(plato_a == plato_b).to eq(false)
      expect(plato_c.between?(plato_b, plato_a)).to eq(false)
      expect(plato_c.clamp(plato_a, plato_b)).to eq(plato_c)
    end
  end
  context "Se realizan comparaciones entre platos de la dieta locura por la carne" do
    before :each do
      @camarones = Food::Food.new({:name => "Camarones", :protein => 17.6, :carbohydrates => 1.5, :lipids => 0.6, :gas => 18.0, :land_use => 2})
      @carne_de_vaca = Food::Food.new({:name => 'Carne de vaca', :protein => 21.1, :carbohydrates => 0.0, :lipids => 3.1, :gas => 50.0, :land_use => 164.0})
      @pollo = Food::Food.new({:name => 'Pollo', :protein => 20.6, :carbohydrates => 0.0, :lipids => 5.6, :gas => 5.7, :land_use => 7.1})
      @cerdo = Food::Food.new({:name => 'Cerdo', :protein => 21.5, :carbohydrates => 0.0, :lipids => 6.3, :gas => 7.6, :land_use => 11.0})
      @lista = Food::List.new
      @lista.pushVarious([100,100,100, 100, 200])
      @lista_b = Food::List.new
      @lista_b.pushVarious([300, 100, 200])
      @listaI = Food::List.new
      @listaI.pushVarious([@pollo, @cordero, @cerdo, @cerveza, @lentejas])
      @listaI_b = Food::List.new
      @listaI_b.pushVarious([@pollo, @queso, @cerveza])
      @lista_c = Food::List.new
      @lista_c.pushVarious([300,150,150])
      @listaI_c = Food::List.new
      @listaI_c.pushVarious([@camarones, @huevos, @tofu])
    end
    it "Comparaciones del valor nutricional" do
      plato_a = Food::Plate.new("Surtido de carnes con legumbres", @listaI, @lista)
      plato_b = Food::Plate.new("Pollo con queso a la cerveza", @listaI_b, @lista_b)
      plato_c = Food::Plate.new("Camarones rebosados", @listaI_c, @lista_c)
      expect(plato_a < plato_b).to eq(false)
      expect(plato_a <= plato_b).to eq(false)
      expect(plato_a > plato_b).to eq(true)
      expect(plato_a > plato_b).to eq(true)
      expect(plato_a == plato_b).to eq(false)
      expect(plato_c.between?(plato_b, plato_a)).to eq(false)
      expect(plato_c.clamp(plato_b, plato_a)).to eq(plato_b)
    end
    it "Comparaciones del impacto ambiental" do
      plato_a = Food::Impact_Plate.new("Surtidos de carnes con legumbres", @listaI, @lista)
      plato_b = Food::Impact_Plate.new("Pollo con queso a la cerveza", @listaI_b, @lista_b)
      plato_c = Food::Impact_Plate.new("Picoteo", @listaI_c, @lista_c)
      expect(plato_a < plato_b).to eq(false)
      expect(plato_a <= plato_b).to eq(false)
      expect(plato_a > plato_b).to eq(true)
      expect(plato_a > plato_b).to eq(true)
      expect(plato_a == plato_b).to eq(false)
      expect(plato_c.between?(plato_b, plato_a)).to eq(false)
      expect(plato_c.clamp(plato_b, plato_a)).to eq(plato_a)
    end
  end
  before :each do
    @lista_b = Food::List.new
    @lista_b.pushVarious([85,15,5,15])
    @lista_c = Food::List.new
    @lista_c.pushVarious([100,60,20])
    @listaI_b = Food::List.new
    @listaI_b.pushVarious([@leche, @huevos, @nuez, @chocolate])
    @listaI_c = Food::List.new
    @listaI_c.pushVarious([@tofu, @chocolate, @nuez])
  end
  context "Se comprueba el funcionamiento interno de una lista de Food::Plates usando funciones propias de Enumerable" do
    before :each do
      @plate = Food::Plate.new("Lentejas Deluxe", @lista, @lista_grams)
      @plate_b = Food::Plate.new("Tarta de chocolate", @listaI_b, @lista_b)
      @plate_c = Food::Plate.new("Tofu con chocolate", @listaI_c, @lista_c)
      @lista_plates = Food::List.new
      @lista_plates.pushVarious([@plate_b, @plate, @plate_c])
    end
    it "Se comprueba el funcionamiento de collect" do
      expect(@lista_plates.collect{|x| x.protein_percentage > 20.0}).to eq([true, true, false])
    end
    it "Se comprueba el funcionamiento de select" do
      expect(@lista_plates.select{|x| x.protein_percentage > 20.0}).to eq([@plate_b, @plate])
    end
    it "Se comprueba el funcionamiento de max" do
      expect(@lista_plates.max).to eq(@plate_c)
    end
    it "Se comprueba el funcionamiento de min" do
      expect(@lista_plates.min).to eq(@plate)
    end
    it "Se comprueba el funcionamiento de sort" do
      expect(@lista_plates.sort).to eq([@plate, @plate_b, @plate_c])
    end
  end
  context "Se comprueba el funcionamiento interno de una lista de Food::Impact_Plates usando funciones propias de Enumerable" do
    before :each do
      @plate = Food::Impact_Plate.new("Lentejas Deluxe", @lista, @lista_grams)
      @plate_b = Food::Impact_Plate.new("Tarta de chocolate", @listaI_b, @lista_b)
      @plate_c = Food::Impact_Plate.new("Tofu con chocolate", @listaI_c, @lista_c)
      @lista_plates = Food::List.new
      @lista_plates.pushVarious([@plate_b, @plate, @plate_c])
    end
    it "Se comprueba el funcionamiento de collect" do
      expect(@lista_plates.collect{|x| x.land_use > 10.0}).to eq([false, false, false])
    end
    it "Se comprueba el funcionamiento de select" do
      expect(@lista_plates.select{|x| x.co2_impact < 0.4}).to eq([@plate_b, @plate_c])
    end
    it "Se comprueba el funcionamiento de max" do
      expect(@lista_plates.max).to eq(@plate)
    end
    it "Se comprueba el funcionamiento de min" do
      expect(@lista_plates.min).to eq(@plate_c)
    end
    it "Se comprueba el funcionamiento de min" do
      expect(@lista_plates.sort).to eq([@plate_c, @plate_b, @plate])
    end
  end
  context "Comparaciones entre platos considerando su huella nutricional" do
    before :each do
      @nuez = Food::Food.new({:name => 'Nuez', :protein => 20.0, :carbohydrates => 21.1, :lipids => 54.0, :gas => 0.3, :land_use => 7.9})
      @listaP8 = Food::List.new
      @listaP8.pushVarious([@huevos, @cordero, @lentejas])
      @listaP8_grams = Food::List.new
      @listaP8_grams.pushVarious([70, 100, 150])
      @listaP8_2 = Food::List.new
      @listaP8_2.pushVarious([@tofu, @lentejas, @nuez])
      @listaP8_grams_2 = Food::List.new
      @listaP8_grams_2.pushVarious([120, 100, 20])
      @plateP8 = Food::Impact_Plate.new("Lentejas Deluxe", @listaP8, @listaP8_grams)
      @plateP8_2 = Food::Impact_Plate.new("Lentejas con tofu", @listaP8_2, @listaP8_grams_2)
      @listaP8_3 = Food::List.new
      @listaP8_3.pushVarious([@chocolate, @queso, @nuez])
      @listaP8_grams_3 = Food::List.new
      @listaP8_grams_3.pushVarious([100, 130, 40])
      @plateP8_3 = Food::Impact_Plate.new("Postre de queso", @listaP8_3, @listaP8_grams_3)
      @menu = [@plateP8, @plateP8_2, @plateP8_3]
      @menu_prices = [12.0,10.0,8.0]
    end
    it "Existe un método para calcular la huella nutricional de un plato" do
      expect(@plateP8).to respond_to(:nutritional_footprint)
    end
    it "Nutritional_footprint devuelve el valor esperado para cada plato" do
      expect(@plateP8.nutritional_footprint).to eq(2.5)
    end
    it "Se comparan platos a través de su huella nutricional" do
      expect(@plateP8 < @plateP8_2).to eq(false)
      expect(@plateP8 > @plateP8_2).to eq(true)
      expect(@plateP8 <= @plateP8_2).to eq(false)
      expect(@plateP8 >= @plateP8_2).to eq(true)
      expect(@plateP8 == @plateP8_2).to eq(false)
      expect(@plateP8 != @plateP8_2).to eq(true)
    end
    it "Se obtiene el plato con mayor huella nutricional de un menu" do
      expect(@menu.max).to eq(@plateP8_3)
    end
    it "Se incrementan los precios de los platos del menú en proporción al plato con mayor huella nutricional" do
      expect(@menu_prices.collect{|x, y = (@menu.max.nutritional_footprint*2/3.0)| x * y}). to eq([24.0, 20.0, 16.0])
    end
  end
=end
  context "Pruebas sobre Impact_Plate (DSL)" do
    before :each do
      @lentejas = Food::Food.new({:name => 'Lentejas', :protein => 23.5, :carbohydrates => 52.0, :lipids => 1.4, :gas => 0.4, :land_use => 3.4})
      @pollo = Food::Food.new({:name => 'Pollo', :protein => 20.6, :carbohydrates => 0.0, :lipids => 5.6, :gas => 5.7, :land_use => 7.1})
    end
    it "Funcionamiento de métodos básicos de la clase" do
      impact_plate = Food::Impact_Plate.new("Lentejas con pollo") do |r|
        r.alimento  :ingrediente => @lentejas,
                    :gramos => 100
        r.alimento  :ingrediente => @pollo,
                    :gramos => 80
      end

      expect(impact_plate.protein_percentage).to eq(40.8)
      expect(impact_plate.lipids_percentage).to eq(6)
      expect(impact_plate.carbohydrates_percentage).to eq(53.1)
    end
    it "Se calcula correctamente el TCV y el impacto ambiental del plato" do
      impact_plate = Food::Impact_Plate.new("Lentejas con mucho pollo") do |r|
        r.alimento  :ingrediente => @lentejas,
                    :gramos => 100
        r.alimento  :ingrediente => @pollo,
                    :gramos => 200
      end

      expect(impact_plate.calculate_TCV).to eq(580.2)
      expect(impact_plate.co2_impact).to eq(1.18)
      expect(impact_plate.land_use).to eq(1.76)
    end
  end
end

RSpec.describe Food::Menu do
  describe "Pruebas sobre la clase Menu" do
    before :each do
      @pollo = Food::Food.new({:name => 'Pollo', :protein => 20.6, :carbohydrates => 0.0, :lipids => 5.6, :gas => 5.7, :land_use => 7.1})
      @lentejas = Food::Food.new({:name => 'Lentejas', :protein => 23.5, :carbohydrates => 52.0, :lipids => 1.4, :gas => 0.4, :land_use => 3.4})
      @queso = Food::Food.new({:name => 'Queso', :protein => 25.0, :carbohydrates => 1.3, :lipids => 33.0, :gas => 11.0, :land_use => 41.0})
      @leche = Food::Food.new({:name => 'Leche', :protein => 3.3, :carbohydrates => 4.8, :lipids => 3.2, :gas => 3.2, :land_use => 8.9})
      @huevos = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
      @carne_de_vaca = Food::Food.new({:name => 'Carne de vaca', :protein => 21.1, :carbohydrates => 0.0, :lipids => 3.1, :gas => 50.0, :land_use => 164.0})
      @lentejas_pollo = Food::Impact_Plate.new("Lentejas con pollo") do |r|
        r.alimento  :ingrediente => @lentejas,
                    :gramos => 100
        r.alimento  :ingrediente => @pollo,
                    :gramos => 50
      end

      @postre_queso = Food::Impact_Plate.new("Postre de queso") do |r|
        r.alimento  :ingrediente => @queso,
                    :gramos => 80
        r.alimento  :ingrediente => @leche,
                    :gramos => 150
      end

      @combinado = Food::Impact_Plate.new("Combinado de la casa") do |r|
        r.alimento  :ingrediente => @carne_de_vaca,
                    :gramos => 80
        r.alimento  :ingrediente => @huevos,
                    :gramos => 30
      end

      @menu = Food::Menu.new("Menú del día") do |r|
        r.componente  :plato => @lentejas_pollo,
                      :precio => 5.99
        r.componente  :plato => @postre_queso,
                      :precio => 2.5
        r.componente  :plato => @combinado,
                      :precio => 6.99
      end
    end
    it "Menu tiene un constructor con 1 argumentos" do
      expect(Food::Menu).to respond_to(:new).with(1).arguments
    end
    it "Menu tiene una función para obtener el precio total del menu" do
      expect(@menu).to respond_to(:price)
    end
    it "Menu tiene una función para obtener el nombre del menu" do
      expect(@menu).to respond_to(:name)
    end
    it "Menu tiene una funciones para calcular el TCV y el impacto ambiental" do
      expect(@menu).to respond_to(:calculate_TCV)
      expect(@menu).to respond_to(:calculate_impact)
    end
    it "Se calcula el TCV correctamente" do
      expect(@menu.calculate_TCV).to eq(931.02)
    end
    it "Se calcula el impacto ambiental correctamente" do
      expect(@menu.calculate_impact).to eq([5.811, 18.601])
    end
    it "Se obtiene el precio total del menú" do
      expect(@menu.price).to eq(15.48)
    end
    it "Se obtiene el menú formateado" do
      expect(@menu.to_s).to eq("Menú del día\n(Lentejas con pollo: 100 gramos de Lentejas, 50 gramos de Pollo. CO2: 0.32499999999999996, m2: 0.6950000000000001).\n\tPrecio: 5.99 euros.\n\tValor nutricional: 381.0\n(Postre de queso: 80 gramos de Queso, 150 gramos de Leche. CO2: 1.3599999999999999, m2: 4.615).\n\tPrecio: 2.5 euros.\n\tValor nutricional: 413.56\n(Combinado de la casa: 80 gramos de Carne de vaca, 30 gramos de Huevos. CO2: 4.126, m2: 13.290999999999999).\n\tPrecio: 6.99 euros.\n\tValor nutricional: 136.45999999999998")
    end
  end
end