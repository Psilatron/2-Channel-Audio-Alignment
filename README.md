# Two Channel Audio Alignment

This script demonstrates the capabilities of using MATLAB's alignsignals() function in audio signal processing. It uses the accompanying alignaudio() function to align two audio files and produce a 2 Channel .wav file which includes the aligned signals. These scripts could be modified to align multiple audio signals greater than 2 channels to a reference signal. An example of how this may be useful is when a sound source such as voice is recorded using different microphones on different devices and the recordings have been initiated at different times.

## Requirements and Info

- Sample rates of audio files must be the same.
- Only mono. Multi-channel audio files will be read, however only the left channel will be processed for alignment.
