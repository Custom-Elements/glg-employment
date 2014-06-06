#glg-employment
Encapsulates all of the (somewhat bizarre and commonly used) logic around capturing the data necessary
to create an lead / cm employment record.  Handles the validation and implicity relationship
between fields like `endDate` and `isCurrent`.  Also tried to minimize the amount of clicky input needed
to get a record entered since this is so heavily used.

#### TODO: Allow for prebinding so it's usable for edits as well.  Could also probably integrate taxonomizer as the new one is built out


    _ = require('../node_modules/lodash/dist/lodash.js')
    moment = require('../node_modules/moment/min/moment.min.js')
    
    parseDate = (str) -> 
      if str
        d = moment(str)
        d.add('days', 1) 
        d

    toDateString = (month,year) ->
      s = ""
      s += (month+1) if month?
      s += "-" if month? and year?
      s += year if year?

    Polymer 'glg-employment',

##Events
####change
Emitted as values on the employment form change. The event details contain 
all of the employment details that have been captured in the following structure, with `valid`
indicating the validity of the current state according to our rules:

<pre>
{
  company: {},
  title: '',
  isCurrent: true,
  startDate: moment(),
  endDate: moment(),
  startMonth: 11,
  startYear: 2011,
  endMonth: null,
  endYear: null,
  startDateText: "unknown|11-2011",
  endDateText: "current|10-2012",
  valid: true
}
</pre>


##Attributes and Change Handlers
####value
The value attribute represents the same structure shown above that is emitted on the `change` event.


      handleChange: ->
        # dates
        startDate = parseDate(@startDate)
        endDate = parseDate(@endDate)

        datesBackward = startDate and endDate and startDate > endDate
        futureEndDate = endDate and endDate > moment()
        
        @errors.startDate = datesBackward
        @errors.endDate = datesBackward or futureEndDate

        # title
        @errors.title = @value.title and !@value.title.length

        @value.startDate = startDate
        @value.endDate = endDate

        @value.valid = !!( _(@errors).values().compact().value().length is 0 and
          @value.company?.id and
          @value.title?.length)

        # some basic translations
        @value.startMonth = @value.startDate?.month()
        @value.startYear = @value.startDate?.year()
        @value.endMonth = @value.endDate?.month()
        @value.endYear = @value.endDate?.year()

        # some formatted helpers
        @value.startDateText = toDateString(@value.startMonth, @value.startYear)
        @value.endDateText = toDateString(@value.endMonth, @value.endYear)
        @value.startDateText = "unknown" unless @value.startDateText?.length
        
        
        # not currently supporting 'unknown' end year
        if @value.isCurrent
          @value.endYear = 5000
          @value.endDateText = "current" 

        @fire 'change', @value


##Event Handlers
Events are captured off the contained fields and used to trigger validity checks
and apply the bits of interaction between data elements.


      companyChange: (evt) ->
        @value.company = evt.detail.item?.value
        @handleChange()
        @$.title.focus()
      titleChange: ->
        @handleChange()
      titleFocus: ->
        delete @errors.title  
      dateChange: (evt) ->
        @value.isCurrent = ! (@endDate?.length > 0)
        @handleChange()
      flagChange: (evt) ->
        if @value.isCurrent and @endDate
          @endDate = undefined 
          @dateChange()
        @handleChange()


##Polymer Lifecycle

      attached: ->
        @errors = {}
        @value ||= {}
        @dateChange()
