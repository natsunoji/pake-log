// app/javascript/controllers/index.js
import { application } from "controllers/application"

// 🌟 "./" を消して、importmap.rb で定義した名前に書き換える
import CarouselController from "controllers/carousel_controller"
application.register("carousel", CarouselController)

import FlashController from "controllers/flash_controller"
application.register("flash", FlashController)

import HelloController from "controllers/hello_controller"
application.register("hello", HelloController)

import ImageModalController from "controllers/image_modal_controller"
application.register("image-modal", ImageModalController)

import ImagePreviewController from "controllers/image_preview_controller"
application.register("image-preview", ImagePreviewController)

import InputImagesController from "controllers/input_images_controller"
application.register("input-images", InputImagesController)

import PasswordVisibilityController from "controllers/password_visibility_controller"
application.register("password-visibility", PasswordVisibilityController)

import SortableController from "controllers/sortable_controller"
application.register("sortable", SortableController)