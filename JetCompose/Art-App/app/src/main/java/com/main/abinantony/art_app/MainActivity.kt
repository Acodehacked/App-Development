package com.main.abinantony.art_app

import android.annotation.SuppressLint
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.main.abinantony.art_app.ui.theme.ArtAppTheme

class MainActivity : ComponentActivity() {

    // Dummy sample data for preview
    val sampleArtworks = listOf(
        Artwork(
            1,
            "The Starry Night",
            "Vincent van Gogh",
            "1889",
            "https://dummyimage.com/600x600/000/fff.png&text=Artwork+1"
        ),
        Artwork(
            2,
            "Mona Lisa",
            "Leonardo da Vinci",
            "1503-1506",
            "https://dummyimage.com/600x600/ccc/000.png&text=Artwork+2"
        ),
        Artwork(
            3,
            "The Persistence of Memory",
            "Salvador Dalí",
            "1931",
            "https://dummyimage.com/600x600/aaa/fff.png&text=Artwork+3"
        )
    )
    @SuppressLint("UnusedMaterial3ScaffoldPaddingParameter")
    override fun onCreate(savedInstanceState: Bundle?) {

        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            ArtAppTheme {
                Scaffold(modifier = Modifier.fillMaxSize()) {
//                    Greeting(
//                        name = "Android",
//                        modifier = Modifier.padding(innerPadding)
//                    )
                    ArtCarouselApp(sampleArtworks);
                }
            }
        }
    }
}

@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Text(
        text = "Hello $name!",
        modifier = modifier
    )
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    ArtAppTheme {
        Greeting("Android")
    }
}