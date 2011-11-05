require "spec_helper"

class Post
  include Mongoid::Document
  include Mongoid::Localization
  
  field :translations_available, :type => Array

  field :name, :type => String, :localize => true, :default => ""

end

describe Mongoid::Localization, "fields with localize = true" do
  before do
    I18n.available_locales = [:en, :es]
    I18n.locale =:en
  end
  
  describe "without an assigned value" do
    before do
      @post = Post.new
    end

    it "should return blank" do
      @post.name.should be_blank
      debugger
    end
  end

  describe "with an assigned value" do
    before do
      @post = Post.new(:name => 'Title')
    end

    it "should return that value" do
      @post.name.should == 'Title'
    end
  
    describe "and persisted" do
      before do
        @post.save
      end

      describe "find by id" do
        it "should find the document" do
          Post.find(@post.id).should == @post
        end
      end

        describe "where() criteria" do
          it "should use the current locale value" do
            Post.where(:name => 'Title').first.should == @post
          end
        end

        describe "find(:first) with :conditions" do
          it "should use the current locale value" do
            Post.find(:first, :conditions => {:name => 'Title'}).should == @post
          end
        end
      end

      describe "when the locale is changed" do
        before do
          I18n.locale = :es
        end

        it "should return a blank value" do
          @post.name.should be_blank
        end

        describe "a new value is assigned" do
          before do
            @post.name = 'Titulo'
          end

          it "should return the new value" do
            @post.name.should == 'Titulo'
          end

          describe "persisted and retrieved from db" do
            before do
              @post.save
              @post.reload
            end

            it "the localized field value should be correct" do
              @post.name.should == 'Titulo'
              I18n.locale = :en
              @post.name.should == 'Title'
              @post.name_translations.should == {'en' => 'Title', 'es' => 'Titulo'}
            end
          end

          describe "field_translations" do
            it "should return all translations" do
              @post.name_translations.should == {'en' => 'Title', 'es' => 'Titulo'}
            end
          end

          describe "with mass-assigned translations" do
            before do
              @post.name_translations = {'en' => 'New title', 'es' => 'Nuevo Titulo'}
            end

            it "should set all translations" do
              @post.name_translations.should == {'en' => 'New title', 'es' => 'Nuevo Titulo'}
            end

            it "the getter should return the new translation" do
              @post.name.should == 'Nuevo Titulo'
            end
          end

          describe "if we go back to the original locale" do
            before do
              I18n.locale = :en
            end

            it "should return the original value" do
              @post.name.should == 'Title'
            end
          end
        end
      end
    end
end