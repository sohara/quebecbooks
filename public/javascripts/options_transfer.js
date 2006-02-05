function copyToList(from,to)
/* function transfers options between two lists:
   the list of authors from database and another list of 
   those that are or will be (upon selection) belonging to the book.
   IMPORTANT the forms in which this resides must be correctly referenced by 
   the document.forms[1] method on line 3. E.G. if another form is added to the page
   prior to this form it will augment the form number by 1, etc. 
*/
{
  fromList = eval('document.forms[1].' + from);
  toList = eval('document.forms[1].' + to);
  if (toList.options.length > 0 && toList.options[0].value == 'temp')
  {
    toList.options.length = 0;
  }
  var sel = false;
  for (i=0;i<fromList.options.length;i++)
  {
    var current = fromList.options[i];
    if (current.selected)
    {
      sel = true;
      if (current.value == 'temp')
      {
        alert ('You cannot move this text!');
        return;
      }
      txt = current.text;
      val = current.value;
      toList.options[toList.length] = new Option(txt,val);
      fromList.options[i] = null;
      i--;
    }
  }
  if (!sel) alert ('You haven\'t selected any options!');
}

function allSelect()
{
  List = document.forms[1].chosen;
  if (List.length && List.options[0].value == 'temp') return;
  for (i=0;i<List.length;i++)
  {
     List.options[i].selected = true;
  }
}


window.onload = function(){
  ConvertRowsToLinks("table1");
}

function ConvertRowsToLinks(xTableId){

  var rows = document.getElementById(xTableId).getElementsByTagName("tr");

  for(i=0;i<rows.length;i++){
    var link = rows[i].getElementsByTagName("a")
    if(link.length == 1){
      rows[i].onclick = new Function("document.location.href='" + link[0].href + "'");
      rows[i].onmouseover = new Function("this.className='highlight'");
      rows[i].onmouseout = new Function("this.className=''");
    }
  }

}