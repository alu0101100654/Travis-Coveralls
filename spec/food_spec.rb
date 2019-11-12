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
      @cerveza = Food::Food.new({:name => 'Cerveza', :protein => 0.5, :carbohydrates => 3.6, :lipids => 0.0, :gas => 0.24, :land_use => 0.22})
      @cafe = Food::Food.new({:name => 'Cafe', :protein => 0.1, :carbohydrates => 0.0, :lipids => 0.0, :gas => 0.4, :land_use => 0.3})
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
      @lentejas = Food::Food.new({:name => 'Lentejas', :protein => 23.5, :carbohydrates => 52.0, :lipids => 1.4, :gas => 0.4, :land_use => 7.9})
      @cafe = Food::Food.new({:name => 'Cafe', :protein => 0.1, :carbohydrates => 0.0, :lipids => 0.0, :gas => 0.4, :land_use => 0.3})
      @tofu = Food::Food.new({:name => 'Tofu', :protein => 8.0, :carbohydrates => 1.9, :lipids => 4.8, :gas => 2.0, :land_use => 2.2})
    end

    it "Existe un método para calcular proporciones basadas en las proteínas" do
      expect(@huevos).to respond_to(:portion_impact)
    end
  end
end #describe
