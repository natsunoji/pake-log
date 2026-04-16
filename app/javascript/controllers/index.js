// app/javascript/controllers/index.js

import { application } from "./application"

// 🌟 404の原因となる「自動探索(eagerLoad)」は一切使わない。
// 🌟 必要なコントローラーを一つずつ「明示的」に登録する。

import SortableController from "./sortable_controller"
application.register("sortable", SortableController)

import CarouselController from "./carousel_controller"
application.register("carousel", CarouselController)

import FlashController from "./flash_controller"
application.register("flash", FlashController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import ImageModalController from "./image_modal_controller"
application.register("image-modal", ImageModalController)

import ImagePreviewController from "./image_preview_controller"
application.register("image-preview", ImagePreviewController)

import InputImagesController from "./input_images_controller"
application.register("input-images", InputImagesController)

import PasswordVisibilityController from "./password_visibility_controller"
application.register("password-visibility", PasswordVisibilityController)
