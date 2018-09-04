package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class CoolThing extends MovieClip {
		
		/** The y-component of the acceleration pixels/tick/tick. */
		var accelerationY:Number = 0.25;
		/** The y-component of the acceleration pixels/tick/tick. */
		var accelerationX:Number = 0;
		
		/** The x-component of the velocity in pixels/tick. */
		var velocityX:Number = 0;
		/** The y-component of the velocity in pixels/tick. */
		var velocityY:Number = 0;
		/** Rotational velocity in degrees/tick. */
		var velocityR:Number = -1;
		
		
		public var isOutOfBounds:Boolean = false;		
		public var unscoredPoints:int = 0;
		
		public function CoolThing() {
			addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}
		
		public function update():void {
			
			velocityX += accelerationX;
			velocityY += accelerationY;
			x += velocityX;
			y += velocityY;
			rotation += velocityR;
			
			if(x < 0 || x > 800) velocityX *= -1;
			if(y > 600) isOutOfBounds = true;
			
		}
		/**
		 * This function is called when the `thingy` is clicked. Neat.
		 * @param e The MouseEvent object that is triggering this event-handler.
		 */
		function handleClick(e:MouseEvent):void {
			velocityX = Math.random() * 20 - 10; // -10 to 10
			velocityY = -10;
			velocityR = Math.random() * 4 - 2; // -2 to 2
			unscoredPoints = 100;
			
			var blip:SoundBlip = new SoundBlip();
			blip.play();
			
		}
		
	}
	
}
