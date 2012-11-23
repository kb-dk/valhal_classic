# -*- encoding : utf-8 -*-
# spec/datastreams/adl_tei_p5_datastream_spec.rb
require 'spec_helper'

describe Datastreams::AdlTeiP5Datastream do

  before(:each) do
    @teiP5 = fixture("aarrebo_tei_p5_sample.xml")
    @ds = Datastreams::AdlTeiP5Datastream.from_xml(@teiP5)
  end

  it "should expose author information" do
    #@ds.TEI.teiHeader.profileDesc.particDesc.listPerson.person.persName.surname.length.should == 1
    #@ds.TEI.teiHeader.profileDesc.particDesc.listPerson.person.persName.surname.should == ["Arrebo"]
    #@ds.TEI.teiHeader.profileDesc.particDesc.listPerson.person.persName.forename.should == ["Christensen", "Anders"]
    #@ds.TEI.teiHeader.profileDesc.particDesc.listPerson.person.birth.date.should == ["1587"]
    #@ds.TEI.teiHeader.profileDesc.particDesc.listPerson.person.death.date.should == ["1637"]
    #puts @ds.TEI.teiHeader.profileDesc.particDesc.listPerson.person.event
    #@ds.TEI.teiHeader.profileDesc.particDesc.listPerson.person.event.first.should == ["Født i Ærøskøbing"]
    #@ds.TEI.teiHeader.profileDesc.particDesc.listPerson.person.note.cit.quote.should == ["See ud der springer frem den grumme Diur-forskrecker,
		#							En Jæger uden Hund blod-gridsk i marken trecker,
		#							Nu er hans Klædning hviid, nu guul, nu trøjen sverted,
		#							Langøret, øje-glubsk, skarp-kløred, vel-bestierted,
		#							Jeg meen den Løve kæk, stormodig ofver alle,
		#							Den fleeste Markens Diur maae knælende food-falde.
		#							Hans Fødsel selsom er, naar hand til Verden længer,
		#							Sit eget Moders Liif, u-mildelig hand sprenger:
		#							Af Redsel slet forbaust, half død tre dage slummer,
		#							Ved Fadrens skrek'lig brøl til Liif oc Krafter kommer."]
    #@ds.TEI.teiHeader.profileDesc.particDesc.listPerson.person.note.cit.bibl.should == ["Hexaëmeron i Samlede Skrifter bd. 1, s. 226)"]
  end
end