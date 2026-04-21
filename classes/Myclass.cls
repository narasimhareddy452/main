public abstract class Myclass {
	public abstract void calculate(double x);

	public with sharing class Sub1 extends MyClass{
		public override void calculate (double x){
			System.debug('Square of = ' + x*x);
		}
	}

	public with sharing class Sub2 extends MyClass{
		public override void calculate (double x){
			System.debug('SquareRoot of = ' + Math.sqrt(x));
		}
	}
	
	public with sharing class Sub3 extends MyClass{
		public override void calculate (double x){
			System.debug('cube of ='+x*x*x);
		}
	}
}