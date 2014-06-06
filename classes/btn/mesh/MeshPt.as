package btn.mesh{	import flash.display.*;	import flash.events.*;
	import flash.sampler.getGetterInvocationCount;
	
	public class MeshPt extends MovieClip	{
		
		private var _id:uint;
		
				public function MeshPt( $id:uint, $x:Number, $y:Number )
		{
			_id = $id;
			x = $x;
			y = $y;
			buttonMode = mouseEnabled = true;
			alpha=0.1;
			addEventListener( MouseEvent.MOUSE_DOWN, mDown);
		}
		
		
		private function mDown(e:MouseEvent):void
		{
			removeEventListener( MouseEvent.MOUSE_DOWN, mDown);
			stage.addEventListener( MouseEvent.MOUSE_UP, mUp);
			
			startDrag(false);
			addEventListener( Event.ENTER_FRAME, chkPos );
		}
		

		private function mUp(e:MouseEvent):void
		{
			stage.removeEventListener( MouseEvent.MOUSE_UP, mUp);
			addEventListener( MouseEvent.MOUSE_DOWN, mDown);
			
			stopDrag();
			removeEventListener( Event.ENTER_FRAME, chkPos );
		}
		
		
		private function chkPos(e:Event):void
		{
			MovieClip(parent.parent).reDraw(_id, x, y);
		}
		

	}}