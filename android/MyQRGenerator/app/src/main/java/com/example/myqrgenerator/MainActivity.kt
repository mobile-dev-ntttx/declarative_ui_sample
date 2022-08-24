package com.example.myqrgenerator

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.ImageBitmap
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import com.example.myqrgenerator.ui.theme.MyQRGeneratorTheme
import com.google.zxing.BarcodeFormat
import com.journeyapps.barcodescanner.BarcodeEncoder

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MyQRGeneratorTheme {
                // A surface container using the 'background' color from the theme
                Surface(color = MaterialTheme.colors.background) {
                    App()
                }
            }
        }
    }
}

@Composable
fun App() {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(text = stringResource(id = R.string.app_name)) }
            )
        }
    ) {
        Box(modifier = Modifier.padding(it)) {
            QRGenerator()
        }
    }
}

@Composable
fun QRGenerator() {
    var contentString by remember { mutableStateOf("") }
    var generatedQR: ImageBitmap? by remember { mutableStateOf(null) }
    Column(horizontalAlignment = Alignment.CenterHorizontally) {
        TextField(
            contentString, onValueChange = {
                contentString = it
            },
            placeholder = { Text("文字を入力してください") }
        )
        Button(onClick = {
            generatedQR = if (contentString.isNotEmpty()) generateQR(contentString) else null
        }) {
            Text("生成", modifier = Modifier.align(Alignment.CenterVertically))
        }
        Box(Modifier.fillMaxSize()) {
            if (generatedQR != null)
                Image(
                    modifier = Modifier.align(Alignment.Center),
                    bitmap = generatedQR!!,
                    contentDescription = "Generated QRCode"
                )
        }

    }
}


@Preview
@Composable
fun GeneratorPreview() {
    App()
}


fun generateQR(content: String): ImageBitmap {
    val encoder = BarcodeEncoder()
    val bitmap = encoder.encodeBitmap(content, BarcodeFormat.QR_CODE, 400, 400)
    return bitmap.asImageBitmap()
}