pennatar
========

This demo application shows a way to allow self-serve editing of faculty portraits using Rails, CarrierWave, and JCrop.

It was made with scaffolding, and does not interact with CEAL or Oracle, so it's merely a proof-of-concept. To try it out, git clone, bundle, and rails s. 

Notes:

* Turbolinks is not enabled, because it was not playing well with JCrop, although that could be worked around.
* There is no minimum file size forced on uploads, this is necessary to meet the standards of the Graphics department.
* There's a potential refactoring that would make it faster: store the `photo_key` in the portraits table, only on the selected photo, and use that as the key for the selected portrait, and move the `#pennatar` method to the `portraits_controller`.