#glg-employment
Encapsulates all of the (somewhat bizarre and commonly used) logic around capturing the data necessary
to create an lead / cm employment record.  Handles the validation and implicity relationship
between fields like `endDate` and `isCurrent`.  Also tried to minimize the amount of clicky input needed
to get a record entered since this is so heavily used.


#### TODO: Support non-normalized companies
#### TODO: Allow for prebinding so it's usable for edits as well.  Could also probably integrate taxonomizer as the new one is built out















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


##Methods
####Clear
This pretty much does exactly what I hope is obvious given the name.










##Attributes and Change Handlers
####value
The value attribute represents the same structure shown above that is emitted on the `change` event.





































##Event Handlers
Events are captured off the contained fields and used to trigger validity checks
and apply the bits of interaction between data elements.


















##Polymer Lifecycle
















