# Two Channel Audio Alignment

This script demonstrates the capabilities of using MATLAB's alignsignals() function in audio signal processing. It uses the accompanying alignaudio() function to align two audio files and produce a 2 Channel .wav file which includes the aligned signals. These scripts could be modified to align multiple audio signals greater than 2 channels to a reference signal. An example of how this may be useful is when a sound source such as voice is recorded using different microphones on different devices and the recordings have been initiated at different times.

The alignaudio() function uses MATLAB's alignsignals() function to align two audio files. The delay time calculated by this function is used to displace the the leading signal to bring it into alignment with the lagging signal. Once the alignment has been carried out, the shortest of the two signals undergoes zero-padding at the end to ensure that the two output signals are the same sample length. The alignsignals() function uses cross-correlation to process the two signals and uses the peak correlation value to determine the displacement value needed to carry out the alignment.

## Requirements and Info

- Sample rates of audio files must be the same.
- Only mono. Multi-channel audio files will be read, however only the left channel will be processed for alignment.
