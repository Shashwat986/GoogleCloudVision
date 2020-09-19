# README

Using Google's Vision API to detect items in an image.

### Notes

This is an attempt for me to use ActiveStorage, Google Cloud Vision APIs, and Kivy.

### Links

1. https://cloud.google.com/vision/docs/labels
1. https://googleapis.dev/ruby/google-cloud-vision-v1/latest/Google/Cloud/Vision/V1/ImageAnnotator/Client.html#label_detection-instance_method
1. https://kivy.org/#home
1. https://edgeguides.rubyonrails.org/active_storage_overview.html

### Process

Detailed out in (https://cloud.google.com/vision/docs/quickstart-client-libraries):

1. Go to https://console.cloud.google.com/home/dashboard
1. Create a project
1. Enable the "Cloud Vision API"
1. Create a new "Service Account"
1. Set the role to Project > Owner
1. Download the JSON file with the credentials
1. These credentials are read from the `ENV['GOOGLE_APPLICATION_CREDENTIALS']` defined in `.env.development`. Change that value

### Idea

Use these cloud vision APIs to automate the creation and validation of online scavenger hunts. Doesn't work as it stands right now, because the accuracy of the API is too low to be of any use. Note: The Kivy project is literally just boilerplate.
