#glg-employment
*TODO* tell me all about your element.


    _ = require('../node_modules/lodash/dist/lodash.js')
    parseDate = (str) -> new Date(str) if str

    Polymer 'glg-employment',

##Events
*TODO* describe the custom event `name` and `detail` that are fired.

##Attributes and Change Handlers

##Methods


      validate: ->
        # dates
        startDate = parseDate(@startDate)
        endDate = parseDate(@endDate)

        datesBackward = startDate and endDate and startDate > endDate
        futureEndDate = endDate and endDate > new Date()
        
        @errors.startDate = datesBackward
        @errors.endDate = datesBackward or futureEndDate

        # title
        @errors.title = @value.title and !@value.title.length


      isValid: ->
        _.keys(@errors).length is 0 and
          @value.company?.id and
          @value.title?.length > 2

      companyChange: (evt) ->
        @value.company = evt.detail.item?.value
        @validate
        @$.title.focus()


      titleChange: ->
        @validate()
      titleFocus: ->
        delete @errors.title  

      dateChange: (evt) ->
        @isCurrent = ! (@endDate?.length > 0)
        @validate()
        
          
      flagChange: (evt) ->
        if @isCurrent and @endDate
          @endDate = undefined 
          @dateChange()








##Polymer Lifecycle

      attached: ->
        @errors = {}
        @value ||= {}
        @dateChange()
      
      detached: ->
