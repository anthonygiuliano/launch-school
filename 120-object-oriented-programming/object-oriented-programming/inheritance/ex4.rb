# the method lookup path is how ruby looks for the definitions of
# methods you call

# it looks first in the current class, then in any modules starting from the
# last ones included in the class, than it repeats those steps in the parent
# class, and that parent's parent class
