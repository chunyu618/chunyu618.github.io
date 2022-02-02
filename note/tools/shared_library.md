<style>
    body{
    	font-size: 15pt;
    }
    h2{
        font-size: 28pt;
        font-weight: bold;
    }
    h3{
        font-size: 24pt;
        font-weight: bold;
    }
</style>

# Create Shared Library (.so) in C++ (G++)

## Structure

Assume there are $3$ files: `main.cpp`, `my_class.cc`, `my_class.hh`. In `main.cpp` we include `my_class.hh`.

To create a shared library file 'libmyclass.so' and a executable file `main`, there are $2$ steps.

## Step 1

Convert library file into object file.

```shell
$ g++ -c -o my_class.o my_class.cc 
```

Then create the .so file. Note that the .so file here has a 'lib' prefix, but it's not necessary. However, if you want to link the .so file with the main program by following step, the .so file need to come with `lib*.so`.

```shell
$ g++ -shared -o libmyclass.so my_class.o
```

## Step 2

Link the .so file with our main program and create the executable file `main`.

```shell
$ g++ -L. -lmy_class -Wall -o main main.cpp
```

Where, 

* `-L<Path of Folder>`: include the path of folder that contains the .so file when searching the linkable file, no spacing.
* `-l<Name of Library>`: the library name, without 'lib' prefix and `.so` extension, no spacing.
* `-Wall`: just let the warning out.

Now, there should be an executable file named `main`.

## Reference

* [How to create shared library (.SO) in C++ (G++)?](https://iq.opengenus.org/create-shared-library-in-cpp/)
* []
