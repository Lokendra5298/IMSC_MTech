# CS6910_Assignment-3

# Seq2Seq Model with PyTorch

This repository contains an implementation of the Sequence-to-Sequence (Seq2Seq) model using PyTorch. Seq2Seq models are widely used in various tasks such as machine translation, text summarization, and speech recognition.

## Introduction

The Seq2Seq model consists of an encoder and a decoder neural network. The encoder processes the input sequence and encodes it into a fixed-size context vector, which contains the semantic information of the input sequence. The decoder then generates the output sequence based on this context vector.

## Encoder

The `Encoder` class takes as input the following parameters:
- `input_size`: The size of the input vocabulary.
- `embedding_size`: The dimension of the word embeddings.
- `hidden_size`: The dimension of the hidden state of the recurrent layer.
- `num_layers`: The number of recurrent layers.
- `dropout`: The dropout probability.
- `cell_type`: The type of recurrent cell to be used (`RNN`, `LSTM`, or `GRU`).
- `bidirectional`: A boolean indicating whether the encoder should be bidirectional.

The `forward` method of the encoder processes the input sequence and returns the final hidden state(s) of the encoder.

## Decoder

The `Decoder` class takes as input the following parameters:
- `output_size`: The size of the output vocabulary.
- `embedding_size`: The dimension of the word embeddings.
- `hidden_size`: The dimension of the hidden state of the recurrent layer.
- `num_layers`: The number of recurrent layers.
- `dropout`: The dropout probability.
- `cell_type`: The type of recurrent cell to be used (`RNN`, `LSTM`, or `GRU`).

The `forward` method of the decoder generates the output sequence based on the context vector from the encoder.

## Seq2Seq Model

The `Seq2Seq` class combines an encoder and a decoder to form the complete Seq2Seq model. It takes an encoder and a decoder as input and performs the sequence-to-sequence translation task.

The `forward` method of the Seq2Seq model takes a source sequence and a target sequence as input and returns the predicted output sequence.

## Usage

To use the Seq2Seq model, follow these steps:

1. Define an instance of the `Encoder` class with the desired parameters.
2. Define an instance of the `Decoder` class with the desired parameters.
3. Define an instance of the `Seq2Seq` class, passing the encoder and decoder instances as arguments.
4. Use the `forward` method of the Seq2Seq model to perform sequence-to-sequence translation.

```python
# Example usage
encoder = Encoder(input_size, embedding_size, hidden_size, num_layers, dropout, cell_type, bidirectional)
decoder = Decoder(output_size, embedding_size, hidden_size, num_layers, dropout, cell_type)
seq2seq_model = Seq2Seq(encoder, decoder)
outputs = seq2seq_model(source, target)


# Seq2Seq Model with Attention Mechanism

This repository contains an implementation of the Sequence-to-Sequence (Seq2Seq) model with an attention mechanism using PyTorch. Seq2Seq models with attention are commonly used in tasks such as machine translation, text summarization, and speech recognition.

## Introduction

The Seq2Seq model with attention consists of an encoder and a decoder neural network, where the attention mechanism allows the decoder to focus on different parts of the input sequence during the decoding process.

## Encoder

The `Encoder` class creates the encoder for the Seq2Seq model. It takes as input the following parameters:
- `input_size`: The size of the input vocabulary.
- `embedding_size`: The dimension of the word embeddings.
- `hidden_size`: The dimension of the hidden state of the recurrent layer.
- `num_layers`: The number of recurrent layers.
- `dropout`: The dropout probability.
- `cell_type`: The type of recurrent cell to be used (`RNN`, `LSTM`, or `GRU`).
- `bidirectional`: A boolean indicating whether the encoder should be bidirectional.

The encoder processes the input sequence and returns the final hidden state(s) of the encoder.

## Attention Decoder

The `AttentionDecoder` class creates the decoder with an attention mechanism for the Seq2Seq model. It takes as input the following parameters:
- `output_size`: The size of the output vocabulary.
- `embedding_size`: The dimension of the word embeddings.
- `hidden_size`: The dimension of the hidden state of the recurrent layer in the decoder.
- `encoder_hidden_size`: The dimension of the hidden state of the recurrent layer in the encoder.
- `num_layers`: The number of recurrent layers.
- `dropout`: The dropout probability.
- `cell_type`: The type of recurrent cell to be used (`RNN` or `GRU`).

The decoder attends to different parts of the encoder's hidden states during the decoding process and generates the output sequence.

## Seq2Seq Model with Attention

The `Seq2SeqAttention` class combines an encoder and an attention decoder to form the complete Seq2Seq model with attention. It takes an encoder, an attention decoder, and the device as input and performs the sequence-to-sequence translation task with attention.

The model's `forward` method takes a source sequence and a target sequence as input and returns the predicted output sequence.

## Usage

To use the Seq2Seq model with attention, follow these steps:

1. Define an instance of the `Encoder` class with the desired parameters.
2. Define an instance of the `AttentionDecoder` class with the desired parameters.
3. Define an instance of the `Seq2SeqAttention` class, passing the encoder and attention decoder instances as arguments.
4. Use the `forward` method of the Seq2Seq model to perform sequence-to-sequence translation with attention.

```python
# Example usage
encoder = Encoder(input_size, embedding_size, hidden_size, num_layers, dropout, cell_type, bidirectional)
decoder = AttentionDecoder(output_size, embedding_size, hidden_size, encoder_hidden_size, num_layers, dropout, cell_type)
seq2seq_attention_model = Seq2SeqAttention(encoder, decoder, device)
outputs = seq2seq_attention_model(source, target)


