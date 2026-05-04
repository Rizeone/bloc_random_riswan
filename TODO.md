# TODO Updates for Langkah 4: StreamControllers

Previous steps complete ✓

New steps:
- [x] Added exact StreamControllers as specified in RandomNumberBloc
- [x] Wired: generateRandom sink triggers generation, outputs to randomNumber stream
- [ ] Test integration (add to UI)

**Note: Hybrid BLoC + Streams. Use bloc.add(GenerateRandomNumberEvent()) or bloc.generateRandom.sink.add(null) to trigger.**
