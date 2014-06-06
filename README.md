#glg-employment
Encapsulates all of the (somewhat bizarre) logic around capturing the data necessary
to create an lead / cm employment record.  Handles the validation and implicity relationship
between fields like `endDate` and `isCurrent`.

#### TODO: Allow for prebinding so it's usable for edits as well.  Could also
probably integrate taxonomizer as the new one is built out















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


































##Event Handlers
Events are captured off the contained fields and used to trigger validity checks
and apply the bits of interaction between data elements.




















##Polymer Lifecycle




