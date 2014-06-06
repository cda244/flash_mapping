package{	import flash.display.*;	import flash.events.*;
	import flash.media.*;
	import flash.geom.*;		import clip.mesh.MeshClip;
	import btn.mesh.MeshPt;
		public class Index extends MovieClip	{
		
		private var mySprite:Sprite = new Sprite();
		private var myGraphics:Graphics = mySprite.graphics;
		
		private var _texture:BitmapData;
		
		private var vertices:Vector.<Number> = new Vector.<Number>();
		private var indices:Vector.<int> = new Vector.<int>();
		private var uvData:Vector.<Number> = new Vector.<Number>();
		
		private var _meshClip:MeshClip;
		
				public function Index()		{			stage.align = StageAlign.TOP_LEFT;			stage.scaleMode = StageScaleMode.NO_SCALE;		
			
			var orgBmpData = new libSampleImg();
			
			_texture = new BitmapData( orgBmpData.width, orgBmpData.height );
			_texture.draw(orgBmpData);
			
			//mySprite.x = 400;
			mySprite.alpha=0.5;
			addChild(mySprite);
						
			_meshClip = new MeshClip();
			addChild( _meshClip );
			_meshClip.init( _texture.width, _texture.height );
		}
		
		
		public function setMeshData( $pt:Vector.<MeshPt>, $w:uint, $h:uint ):void
		{
			for( var i:uint=0; i<$pt.length; i++ ){
				
				//頂点座標
				vertices.push( $pt[i].x, $pt[i].y );
				
				//uv座標
				uvData.push( $pt[i].x/400, $pt[i].y/400 );
			}
			
			for(var j:uint=0; j<$h; j++ ){
				var start = j * ($w);
					
				for(i=start; i<start+$w-1; i++ ){
					indices.push(i, i+$w, i+($w+1) );
					indices.push(i, i+($w+1), i+1);
				}
			}
				
			myGraphics.beginBitmapFill(_texture);
			myGraphics.drawTriangles(vertices, indices, uvData);
			myGraphics.endFill();
		}
		
		
		public function reDraw($id:uint, $x:Number, $y:Number ):void
		{
			vertices[$id*2] = mySprite.mouseX+mySprite.x;
			vertices[$id*2+1] = mySprite.mouseY;
			
			myGraphics.clear();
			myGraphics.beginBitmapFill(_texture);
			myGraphics.drawTriangles(vertices, indices, uvData);
			myGraphics.endFill();
		}
					}}

