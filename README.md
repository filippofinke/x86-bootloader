<h1 align="center">Welcome to x86-bootloader 👋</h1>

> A very simple x86-bootloader

<details>
 <summary>Demo</summary>
 <p align="center">
  <img src="https://user-images.githubusercontent.com/37296364/149657577-c7806537-97c3-4b46-8672-d03cf78905b9.gif">
 </p>
</details>

## Dependencies

- nasm
- qemu

## How to ue

```sh
./start.sh
```

### Manually

#### Compile the bootloader

```sh
nasm -o boot.bin boot.asm
```

#### Boot it with QEMU

```sh
qemu-system-x86_64 -drive format=raw,file=boot.bin
```

## Author

👤 **Filippo Finke**

- Website: https://filippofinke.ch
- Github: [@filippofinke](https://github.com/filippofinke)
- LinkedIn: [@filippofinke](https://linkedin.com/in/filippofinke)

## Show your support

Give a ⭐️ if this project helped you!

<a href="https://www.buymeacoffee.com/filippofinke">
  <img src="https://github.com/filippofinke/filippofinke/raw/main/images/buymeacoffe.png" alt="Buy Me A McFlurry">
</a>
