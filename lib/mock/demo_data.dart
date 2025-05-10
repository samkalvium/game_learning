const mockCourseData = {
  "courseName": "KG1 - Demo",
  "questions": [
    {
      "id": 1,
      "type": "fill",
      "question": "What is the color of the sky?",
      "options": ["Blue", "Green", "Red"],
      "answer": "Blue"
    },
    {
      "id": 2,
      "type": "image_match",
      "question": "Match the animals",
      "pairs": [
        {"image": "assets/cat.jpg", "label": "Cat"},
        {"image": "assets/dog.png", "label": "Dog"}
      ],
      "answer": "Matched"
    },
    {
      "id": 3,
      "type": "audio",
      "question": "What sound is this?",
      "audioUrl": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
      "options": ["Piano", "Guitar", "Drum"],
      "answer": "Piano"
    },
    {
      "id": 4,
      "type": "sentence",
      "question": "Arrange the sentence",
      "words": ["is", "sky", "blue", "The"],
      "answer": "The sky is blue"
    }
  ]
};
