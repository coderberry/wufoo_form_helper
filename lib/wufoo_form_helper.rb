module ActionView
  module Helpers #:nodoc: all

    def wufoo_forms_clear_both
      "<div style=\"clear: both;\">&nbsp;</div>"
    end

    class FormBuilder
      def wufoo_name_field(method, options={})
        @template.wufoo_full_name_field(@object_name, method, options.merge(:object => @object))
      end
      
      def wufoo_email_field(method, options={})
        @template.wufoo_email_field(@object_name, method, options.merge(:object => @object))
      end
      
      def wufoo_phone_field(method, options={})
        @template.wufoo_phone_field(@object_name, method, options.merge(:object => @object))
      end
      
      def wufoo_address_field(method, options={})
        @template.wufoo_phone_field(@object_name, method, options.merge(:object => @object))
      end
    end

    module FormHelper
      
      # Name Field
      def wufoo_name_field(object_name, method, options = {})
        str = <<-EOF
        <div>
          <label class="desc">#{options[:label].blank? ? "Name" : options[:label]} <span class="req">*</span></label>
          <span>
            #{InstanceTag.new(object_name, "#{method}[first]", self, options.delete(:object)).to_input_field_tag("text", options.merge(:class => "text", :size => "8", :maxlength => "50", :validate => "length=3-50", :tip => "Please enter a valid first and last name."))}
            #{label(object_name, "#{method}[first]", "First Name", :class => "below")}
          </span>
          <span>
            #{InstanceTag.new(object_name, "#{method}[last]", self, options.delete(:object)).to_input_field_tag("text", options.merge(:class => "text", :size => "14", :maxlength => "50", :validate => "length=3-50", :tip => "Please enter a valid first and last name."))}
            #{label(object_name, "#{method}[last]", "Last Name", :class => "below")}
          </span>
          <div class="clear"></div>
        </div>
        EOF
        str
      end
      
      # Email Field
      def wufoo_email_field(object_name, method, options = {})
        str = <<-EOF
        <div>
          <label class="desc">#{options[:label].blank? ? "Email" : options[:label]} <span class="req">*</span></label>
          <span>
            #{InstanceTag.new(object_name, method, self, options.delete(:object)).to_input_field_tag("text", options.merge(:class => "text", :size => "30", :maxlength => "50", :validate => "email"))}
          </span>
          <div class="clear"></div>
        </div>
        EOF
        str
      end
      
      # Phone Field
      def wufoo_phone_field(object_name, method, options = {})
        str = <<-EOF
        <div>
          <label class="desc">#{options[:label].blank? ? "Phone" : options[:label]} <span class="req">*</span></label>
          <span>
            #{InstanceTag.new(object_name, "#{method}[area_code]", self, options.delete(:object)).to_input_field_tag("text", options.merge(:class => "text", :size => "3", :maxlength => "3", :validate => "length=3", :tip => "<span class='gray'>(<span class='hilight'>###</span>) ###-####</span>", :onKeyPress => "return numbersOnly(event, false)"))}
            #{label(object_name, "#{method}[area_code]", "(###)", :class => "below")}
          </span>    
          <span>
            #{InstanceTag.new(object_name, "#{method}[prefix]", self, options.delete(:object)).to_input_field_tag("text", options.merge(:class => "text", :size => "3", :maxlength => "3", :validate => "length=3", :tip => "<span class='gray'>(###) <span class='hilight'>###</span>-####</span>", :onKeyPress => "return numbersOnly(event, false)"))}
            #{label(object_name, "#{method}[prefix]", "###", :class => "below")}
          </span>
          <span>
            #{InstanceTag.new(object_name, "#{method}[prefix]", self, options.delete(:object)).to_input_field_tag("text", options.merge(:class => "text", :size => "4", :maxlength => "4", :validate => "length=4", :tip => "<span class='gray'>(###) ###-<span class='hilight'>####</span></span>", :onKeyPress => "return numbersOnly(event, false)"))}
            #{label(object_name, "#{method}[suffix]", "####", :class => "below")}
          </span>
          <div class="clear"></div>
        </div>
        EOF
        str
      end
      
      # Address Field
      def wufoo_address_field(object_name, method, options = {})
        str = <<-EOF
        <div>
          <label class="desc">#{options[:label].blank? ? "Address" : options[:label]} <span class="req">*</span></label>
          <span>
            #{InstanceTag.new(object_name, "#{method}[address_1]", self, options.delete(:object)).to_input_field_tag("text", options.merge(:class => "text", :size => "25", :maxlength => "100", :validate => "length=5-100"))}
            #{label(object_name, "#{method}[address_1]", "Street Address", :class => "below")}
          </span>    
          <span>
            #{InstanceTag.new(object_name, "#{method}[address_2]", self, options.delete(:object)).to_input_field_tag("text", options.merge(:class => "text", :size => "4", :maxlength => "10", :validate => "length=0-10", :tip => "Optional"))}
            #{label(object_name, "#{method}[address_2]", "Apt #", :class => "below")}
          </span>  
          <div class="clear"></div>
          <span>
            #{InstanceTag.new(object_name, "#{method}[city]", self, options.delete(:object)).to_input_field_tag("text", options.merge(:class => "text", :size => "19", :maxlength => "50", :validate => "length=3-50"))}
            #{label(object_name, "#{method}[city]", "City", :class => "below")}
          </span>
          <span>
            #{InstanceTag.new(object_name, "#{method}[state]", self, options.delete(:object)).to_input_field_tag("text", options.merge(:class => "text", :size => "2", :maxlength => "2", :validate => "length=2", :tip => "2-letter abbreviation.<br/>Example: NY, WA, UT"))}
            #{label(object_name, "#{method}[state]", "State", :class => "below")}
          </span>
          <span>
            #{InstanceTag.new(object_name, "#{method}[zipcode]", self, options.delete(:object)).to_input_field_tag("text", options.merge(:class => "text", :size => "5", :maxlength => "5", :validate => "length=5", :onKeyPress => "return numbersOnly(event, false)", :tip => "5-digit postal code"))}
            #{label(object_name, "#{method}[zipcode]", "Zipcode", :class => "below")}
          </span>
          <div class="clear"></div>
        </div>
        EOF
        str
      end
      
    end
  end
end
