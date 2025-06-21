package com.main.abinantony.art_app

data class Artwork(
    val id: Int,
    val title: String,
    val artist: String,
    val year: String,
    val imageUrl: String // Or use @DrawableRes Int if images are local
)