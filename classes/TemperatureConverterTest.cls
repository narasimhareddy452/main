@isTest
public class TemperatureConverterTest {
    @isTest static void testwarmtemp(){
      Decimal celcius=TempararureConverter.foreignheatTocelcius(70);
        system.assertEquals(21.11, celcius);
    }
     @isTest static void testfreezingtemp(){
      Decimal celcius=TempararureConverter.foreignheatTocelcius(32);
        system.assertEquals(0, celcius);
    }
     @isTest static void testboilingtemp(){
      Decimal celcius=TempararureConverter.foreignheatTocelcius(212);
         system.assertEquals(100, celcius, 'boiling point temparature is not expected');
    }
     @isTest static void testnegativetemp(){
      Decimal celcius=TempararureConverter.foreignheatTocelcius(-10);
        system.assertEquals(-23.33, celcius);
    }
}