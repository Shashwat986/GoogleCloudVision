from kivy.app import App
from kivy.uix.widget import Widget
from kivy.properties import NumericProperty, ReferenceListProperty, ObjectProperty
from kivy.vector import Vector
from kivy.clock import Clock


class PongBall(Widget):
  velocity_x = NumericProperty(1)
  velocity_y = NumericProperty(1)
  velocity = ReferenceListProperty(velocity_x, velocity_y)

  def move(self):
    self.pos = Vector(*self.velocity) + self.pos


class PongGame(Widget):
  ball = ObjectProperty(None)
  def update(self, dt):
    self.ball.move()

    if (self.ball.y < 0) or (self.ball.top > self.height):
      self.ball.velocity_y *= -1

    if (self.ball.x < 0) or (self.ball.right > self.width):
      self.ball.velocity_x *= -1

class ScavengerApp(App):
  def build(self):
    game = PongGame()
    Clock.schedule_interval(game.update, 1.0/60.0)
    return game

if __name__ == '__main__':
  ScavengerApp().run()
