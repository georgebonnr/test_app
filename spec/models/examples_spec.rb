require 'spec_helper'

describe "Ruby" do
  context "String manipulation" do

    it "uses '\%q' as string builder with troublesome characters escaped" do
      str = %q(I wonder what'll happen if I( me -- that is ) use "troublesome" characters?)
      # expect( str ).to eq "I wonder what\'ll happen if I( me -- that is ) use \"troublesome\" characters?"
    end

    it "uses '\%Q' as string builder with troublesome characters escaped while allowing for interpolation" do
      name = "Mickey Mantle"
      str = %Q(I wonder what'll happen if #{ name } uses "troublesome" characters?)
      # expect( str ).to eq "I wonder what\'ll happen if Mickey Mantle uses \"troublesome\" characters?"
    end
  
  end

  context "Misc" do
    it "has an ensure that runs after any rescue block" do
      begin
        raise Exception
      rescue Exception
        puts "Ah, an exception occurred"
      ensure
        puts "I don't know what rescue is talking about. I assure you, no Exception occurred."
      end
    end

    it "has a 'try' method that prevents methods that don't exist from being called" do
      class NoFooMethod

        def method_missing( method_name, *method_args )
          "You called #{ method_name }, passing in the variables: #{ method_args.join( ',' ) }"
        end

      end

      # expect( NoFooMethod.new.try( :foo ) ).to eq nil #Note that method_missing was not called
    end

    it "has a 'method_missing' method that will be called if a missing method is called" do
      class NoFooMethod

        def method_missing( method_name, *method_args )
          "You called #{ method_name }, passing in the variables: #{ method_args.join( ',' ) }"
        end
      end
      # expect( NoFooMethod.new.foo( "hello, world") ).to eq "You called foo, passing in the variables: hello, world"
    end

    it "has methods that accept 'splat args'" do
      def return_first_splat_args( name, *test_scores )
        test_scores.first
      end

      def return_sum_of_splat_args( *test_scores)
        test_scores.sum
      end

      # expect( return_first_splat_args( 'Mickey', 76, 94, 89, 100) ).to eq 76
      # expect( return_sum_of_splat_args( 1,2,4,8,16) ).to eq 31
    end    
  end

  context "Enumerable" do

    it "has an Enumerable mixin that has all sorts of cool features" do
      class ComposerCompositions 
        include Enumerable

        attr_accessor :works, :composer

        def initialize( composer, works )
          @composer = composer
          @works = works.split( ';' )
        end

        def each &block
          @works.each{|work| block.call(work)}
        end
      end

      comps = ComposerCompositions.new( "Ludwig van Beethoven", "Symphony No. 1;Symphony No. 2;Symphony No. 3;Symphony No. 4;Symphony No. 5;Symphony No. 6;Symphony No. 7;Symphony No. 8;Symphony No. 9" )
      
      # gets 'include?' from Enumerable
      # expect( comps.include?( "Symphony No. 2" ) ).to be_true
      
      # gets 'find_index' from Enumerable
      # expect( comps.find_index( "Symphony No. 9" ) ).to eq 8
      
      # each works with given block
      comps.each do |work|
        # expect( work =~ /^Symphony/ ).to eq 0
      end

      # gets 'sort' from Enumerable
      comps.works[3] = "Fur Elise"
      # expect( comps.sort.first ).to eq "Fur Elise"
    end
  end
end 