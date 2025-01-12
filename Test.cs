using Godot;
using System;
using System.Drawing;
using System.IO;
using System.Windows.Forms;

public class Test : Node
{
	// Declare member variables here. Examples:
	// private int a = 2;
	// private string b = "text";
	public void takeScreenshot(TextureRect rect)
	{
	

		System.Threading.Thread.Sleep(100);

		Bitmap screenshot = screenShot();

		Godot.Image testImage = new Godot.Image();

		using (MemoryStream ms = new MemoryStream())
		{
			screenshot.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
			ms.Position = 0;
			testImage.LoadPngFromBuffer(ms.ToArray());
		}
		TextureRect sprite = (TextureRect)GetNode("TextureRect");
		rect.SetSize(new Vector2(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height));
		ImageTexture imageTexture = new ImageTexture();

		imageTexture.CreateFromImage(testImage);
		rect.SetTexture(imageTexture);


	}

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
		
		/*foreach (var form in Application.OpenForms)
		{
			form.WindowState=FormWindowState.Minimized;
		}*/
	}

	public Bitmap screenShot()
	{
		Bitmap bitmap = new Bitmap(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height);
		Graphics graphics = Graphics.FromImage(bitmap as System.Drawing.Image);

		graphics.CopyFromScreen(0, 0, 0, 0, bitmap.Size);

		return bitmap;
	}
	
	

//  // Called every frame. 'delta' is the elapsed time since the previous frame.
//  public override void _Process(float delta)
//  {
//      
//  }
}
