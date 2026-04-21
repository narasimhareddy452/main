public class TempararureConverter {
    public static Decimal foreignheatTocelcius(Decimal fh){
        decimal cs=(fh-32)*5/9;
        return cs.setScale(2);
    }
}