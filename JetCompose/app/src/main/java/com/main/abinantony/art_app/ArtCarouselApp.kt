package com.main.abinantony.art_app

import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.ArrowForward
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource // If using local drawables
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import coil.compose.rememberAsyncImagePainter // For loading images from URLs

@Composable
fun ArtCarouselApp(artworks: List<Artwork>) {
    if (artworks.isEmpty()) {
        Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
            Text("No artworks to display.")
        }
        return
    }

    var currentArtworkIndex by remember { mutableStateOf(0) }
    val currentArtwork = artworks[currentArtworkIndex]

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.SpaceBetween
    ) {
        // Artwork Display Area
        ArtworkDisplay(artwork = currentArtwork)

        // Artwork Details
        ArtworkDetails(artwork = currentArtwork)

        // Navigation Controls
        NavigationControls(
            onPreviousClick = {
                if (currentArtworkIndex > 0) {
                    currentArtworkIndex--
                } else {
                    currentArtworkIndex = artworks.size - 1 // Loop to last
                }
            },
            onNextClick = {
                if (currentArtworkIndex < artworks.size - 1) {
                    currentArtworkIndex++
                } else {
                    currentArtworkIndex = 0 // Loop to first
                }
            },
            currentPosition = currentArtworkIndex + 1,
            totalItems = artworks.size
        )
    }
}

@Composable
fun ArtworkDisplay(artwork: Artwork, modifier: Modifier = Modifier) {
    Card(
        modifier = modifier
            .fillMaxWidth()
            .aspectRatio(1f), // Adjust aspect ratio as needed
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        // Using Coil to load images from URLs.
        // Add implementation("io.coil-kt:coil-compose:2.5.0") to your build.gradle
        Image(
            painter = rememberAsyncImagePainter(model = artwork.imageUrl),
            // If using local drawables:
            // painter = painterResource(id = artwork.imageResId),
            contentDescription = artwork.title,
            modifier = Modifier.fillMaxSize(),
            contentScale = ContentScale.Crop // Or ContentScale.Fit
        )
    }
}

@Composable
fun ArtworkDetails(artwork: Artwork, modifier: Modifier = Modifier) {
    Column(
        modifier = modifier.padding(vertical = 24.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = artwork.title,
            fontSize = 24.sp,
            fontWeight = FontWeight.Bold
        )
        Spacer(modifier = Modifier.height(8.dp))
        Text(
            text = "${artwork.artist} (${artwork.year})",
            fontSize = 18.sp,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

@Composable
fun NavigationControls(
    onPreviousClick: () -> Unit,
    onNextClick: () -> Unit,
    currentPosition: Int,
    totalItems: Int,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier
            .fillMaxWidth()
            .padding(bottom = 32.dp), // Add some padding at the bottom
        horizontalArrangement = Arrangement.SpaceAround,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Button(onClick = onPreviousClick) {
            Icon(Icons.Filled.ArrowBack, contentDescription = "Previous Artwork")
            Spacer(Modifier.width(4.dp))
            Text("Previous")
        }

        Text("$currentPosition / $totalItems") // [1] Display current position

        Button(onClick = onNextClick) {
            Text("Next")
            Spacer(Modifier.width(4.dp))
            Icon(Icons.Filled.ArrowForward, contentDescription = "Next Artwork")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    // Replace with your app's theme if you have one
    MaterialTheme {
        ArtCarouselApp(artworks = sampleArtworks)
    }
}

// Dummy sample data for preview
val sampleArtworks = listOf(
    Artwork(1, "The Starry Night", "Vincent van Gogh", "1889", "https://dummyimage.com/600x600/000/fff.png&text=Artwork+1"),
    Artwork(2, "Mona Lisa", "Leonardo da Vinci", "1503-1506", "https://dummyimage.com/600x600/ccc/000.png&text=Artwork+2"),
    Artwork(3, "The Persistence of Memory", "Salvador Dalí", "1931", "https://dummyimage.com/600x600/aaa/fff.png&text=Artwork+3")
)