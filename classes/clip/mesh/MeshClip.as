package clip.mesh{	import flash.display.*;	import flash.events.*;
	import btn.mesh.MeshPt;
		public class MeshClip extends MovieClip	{
		
		
		private const W:uint = 9;
		private const H:uint = 9;
		
		private var _pt:Vector.<MeshPt> = new Vector.<MeshPt>();
		
				public function MeshClip()		{
		}
		
		
		
		public function init( $w:int, $h:int ):void
		{
			var dX:Number = $w/(W-1);
			var dY:Number = $h/(H-1);
			
			for( var j:uint=0; j<H; j++ ){
				for( var i:uint=0; i<W; i++ ){
					var pt:MeshPt = new MeshPt(_pt.length, i * dX, j * dY);
					_pt.push( pt );
					addChild( pt );
				}
			}
			
			MovieClip(parent).setMeshData(_pt, W, H);
		}
		
			}}