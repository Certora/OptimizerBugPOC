# Requirements

* Node

# Setup

Install `ganache-cli`, `solc`, and `web3` via npm, i.e., `npm install ganache-cli web3 solc`

# Reproducing

In another terminal window, begin the ganache test client: `./node_modules/.bin/ganache-cli`

Then, in this directory, simply run `node index.js`.

You should see something like the following output

```
Done compiling
Deployed optimized contract
{
  data: '0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  topics: []
}

```

The sequence of 0's indicates that the Solidity compiler in fact removed the write of `0x123456789abcdef`
within the assembly block. To see the unoptimized version, simply run `node index.js false`, which should output something like the following:

```
Done compiling
Deployed unoptimized contract
{
  data: '0x0000000000000000000000000000000000000000000000000123456789abcdef0000000000000000000000000000000000000000000000000000000000000000',
  topics: []
}
```

 We can see that, as expected, without the optimizer, the log includes the `0x123456789abcdef` value we wrote.
 You can also confirm that the compiler works as expected with `viaIR` by running `node index.js viaIR`.
