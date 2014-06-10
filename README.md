#glg-employment
Encapsulates all of the (somewhat bizarre and commonly used) logic around capturing the data necessary
to create an lead / cm employment record.  Handles the validation and implicity relationship
between fields like `endDate` and `isCurrent`.  Also tried to minimize the amount of clicky input needed
to get a record entered since this is so heavily used.

#### TODO: Support non-normalized companies















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
If data is bound into the value attribute in the same structure as the expected output defined above, 
it will initialize the form for editing as well.  Any additional properties attached to value should also
be carried through so your primary key needed to do the update should remain intacted





































##Event Handlers
Events are captured off the contained fields and used to trigger validity checks
and apply the bits of interaction between data elements.


















##Polymer Lifecycle
















