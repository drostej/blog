# Manual

``Dieser rails braindump zum Selbststudium basiert auf die dieser livedemo https://www.youtube.com/watch?v=JaL9ul17kx0&t=24s 
Learn to integrate a navigation https://www.youtube.com/watch?v=CSbF5gkogWs
Integrate Bootstrap in a rails application https://www.youtube.com/watch?v=Nf_Si8_szmM
Sample page: http://localhost:3000/posts/new ``

### Ruby intallieren
https://github.com/rbenv/rbenv.git

####Ruby Versionen installieren mit rbenv
rbenv install 2.3.0

https://github.com/rbenv/rbenv#basic-github-checkout

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
Cloning into '/Users/drostej/.rbenv'

$ cd ~/.rbenv && src/configure && make -C src

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile

echo 'eval "$(rbenv init -)"' >> ~/.bash_profile


####Ruby Version festlegen
rbenv global 2.3.0

#### bundler - installiern / siehe pom.xml
gem install bundler

#### native extensions z.B. ffi installieren
brew install automake autoconf libtool
gem install ffi -v '1.9.21'

### Bauen der Anwendung
open .
drosteJMBpro:digital-hero drostej$ cd apps/digital-hero/
drosteJMBpro:digital-hero drostej$ bundle

### Laufen lassen
drosteJMBpro:digital-hero drostej$ rails server
RAILS_ENV=dev rails server

### Anwendung starten
rails s
RAILS_ENV=dev rails server
'''DEBUG=1 rails s'''   mehr debugging

See all available versions with `rbenv install --list'.

Alternativ kann rails c aufgerufen werden und in die Konsole entsprechende Aufrufe. Mit DEBUG=1 wird falls
das debugging entsprechend gestaltet ist, detaillierter sein

Durch Ojekte kann wie durch einen Verzeichnisbaum mit cd, cd .. und ls navigiert werden.

DEBUG=1 rails c

###Fehlende ruby Version
###If the version you need is missing, try upgrading ruby-build:

 cd /home/jan/.rbenv/plugins/ruby-build && git pull && cd -

#### Der debugger benötigt noch das readlines tool, welchs einfach mit homebrew installiert werden kann

http://guides.rubyonrails.org/v3.1.1/asset_pipeline.html

#### Anwendung starten
bundle exec rails s

#### Pflege der Abhängikeiten, feststellung von veralteten Importen
bundle update [library]

###
Stellt sicher, daß die im Projekt konfigurierte ruby version verwendet wird

#### Abhängigkeits Verwaltung
gmefile
bundle list

### gruppen legen die Umgebung fest - Beispiel gemfile

group :development, :assets do end

Mit konkreter Umgebung starten
bundle exec rails s -e production

### Pfade de Applikation anzeigen lassen
 bundle exec rails routes

### konfiguraoin der Pafade
 routes.rb

# debugging
In den code binding.pry eintrage


##### Beispiel:
def index
  binding.pry
  if params[:reset]
    session[:recommendation] = nil
    assign_recommendation
  end
end

##### Pry lässt sich mit folgenden Befehlen navigieren
+ next
+ step
+ continue

#### Es lassen sich sogar screenshots aus einer Seite speichern

``save_and_open_page    save_and_open_screenshot``

##ruby testframework rspec
bundle exec rails spec



###Testen -ruby skript ruft zeile 4 in recommendation_sec.rb auf
bundle exec rspec spec/models/recommendation_spec.rb:4
bundle exec rspec spec/integration/homepage_scene.rb

Tests die noch nicht funktionieren, da sie in einem testgetriebenen Scenario noch auf ihre Implementierung warten, können auf **pending**
gesetzt werden.

Konvention:
scene - Integrationstests
spec - Unittests

Rails anschauen - Module auswählen und Empfehlungen ?! omakase


**Tests mit Mocks**

Die expect Methode konfiguriert den Mock

``it "uses Common::PhoneNumber if the msisdn is set" do
  @user.login_cookie.msisdn = "01625555555"
  expect(Common::PhoneNumber).to receive(:new).with("01625555555").and_return @deal.msisdn
  expect(@user).to be_msisdn_matches(@deal)
end``



##Vererbugn in ruby - > Beispie:
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end

##Regressionstests starten
rake integrate
Eventuell vor erstmaliger ausführung:
bundle exec rake
  --> beim lokalen start kann man folgendes machen
  SERVICE_HOST_AND_PORT=10.97.206.43:8080 DEBUG=1 rails server

##Private und öffentliche Methoden unter ruby on rails

class CustomerController < ApplicationController
  def show
    @customer = Customer.where(token: params[:token])
    redirect_to root_url and return unless @customer.valid?
  end

  def download_app
    redirect_to self.class.download_app_url
  end

  private

  def self.download_app_url
    "https://blau.de/blauplus-download"
  end
end

### openID connect - oauth2

### Durch setzten von Umgebungsvariablen kann man das logging verändern
$ DEBUG=1 bundle exec rspec spec/integration/homepage_scene.rb:7


# Rapid Prototyping

## Neue Applikaiton
``rails new leanRails``


## Generierten von neuen Seiten
``rails g controller Pages about home contact``

## Nicht vergessen in der routes.rb die Rootpage zu setzen ##
``root 'pages#home``

## Scaffholding
### gneerieren mehrer Felder
``rails g scaffold Post title:string image:string description:text``

###Integration der Datenbank
``rake db:migrate``

# Rails create decorater
Draper in die Anwendung inetrieren
``rails generate draper:instal``

### Ergänzung des gemfiles
``gem draper``

Mit bundle install stehen einem die draper featrues zur Verfügung

### Ab jetzt wirde bei jedem generate auch decorater erzeugt
Objekte, auf die deokoriert zugegriffen werden soll, erhalten die 
Decoreate Methode und so kann auf das Decorator Objekt zugegriffen werden
 def set_post
      @post = Post.find(params[:id]).decorate
 end
    
    
## Bootstrap in ruby integrieren
***application.css.scss***
Gegebenenfalls muß die Datei von applicatin.css in application.css.css umbenannt werden un d
die entsprechendne Importe müssen eingefügt werden.
 @import "bootstrap-sprockets";
 @import "bootstrap"
 
 ***gemfile*** 

# twitter bootstrap
``gem 'bootstrap-sass'``

# rails config syntax
routes.rb
get 'responses' => "pages#responselist"
ein get reponses wird auf den Controller pages#responselist weitergeleitet

def create
       @post = Post.new(post_params)

       respond_to do |format|
         if @post.save
           format.html { redirect_to @post, notice: 'Post was successfully created.' }
           format.json { render :show, status: :created, location: @post }
         else
           format.html { render :new }
           format.json { render json: @post.errors, status: :unprocessable_entity }
         end
       end
     end
 

Beispiel wie in einem Controller via render eine view gefüllt wird. Per Konvention würde der Pfad der request url gewählt.

Auf der Konsole lassen sich alle Routen mit dem Befehl

'''rails routes'''

ausgeben


# rails pattern

 @http_status_code = status_code.to_i
Eine Intatnzvarialbe vom String "Hallo"

Im rails Umfeld werden diese Vriablen einem globelen Kontext zur Verfügung gestellt. Mit einer einfachen Funktion werden 
diese WErte dem Frontend zur Verfügung gestellt.

Der Wert von Test kann so als getter des entsprechenden Elemnts in der view verwendent werden.

``class MockResponse  
    attr_reader :response_file, :http_status_code, :body, :metadata
     @http_status_code = status_code.to_i``
     
     
Die Ausgabe im Frontend
``%td= response.http_status_code``


```before_action :assign_deal_or_render ```- gilt im Klassenkontetx und wird vor der Method Klasse ausgeführt
```render partial```     schipsel importieren (wenn micht über Hierarchie lösbar !!)



.html.haml
= führt aus und gibt aus
- führt aus

### Verknüpungen zwischen den scaffholding Elementen
#####form_for
```
<%= form_for @comment do |f| %>
      <div class="field">
```
####belongs to

```
class Comment < ApplicationRecord
  belongs_to :post
end
```
#####has_many
```
class Post < ApplicationRecord
  has_many :comments
end
```

### Interessante gems

+ **Virtus** zur Serialisierung und Deserialisierung https://github.com/solnic/virtus
+ 

# Ruby Basics






