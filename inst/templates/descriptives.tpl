<!--head
meta:
  title: Descriptive statistics
  author: Gergely Daróczi
  description: This template will return descriptive statistics of a numerical or
    frequency table of a categorical variable.
  email: gergely@snowl.net
  packages: ~
  example:
  - rapport('descriptives', data=ius2008, var='gender')
  - rapport('descriptives', data=ius2008, var='age')
  - rapport('descriptives', data=mtcars, var='hp')
inputs:
- name: var
  label: Variable
  description: Categorical or numerical variable. This template will determine the
    measurement level of the given variable.
  length:
    min: 1.0
    max: 1.0
  value: ~
  required: yes
  standalone: no
head-->

# *<%=rp.name(var)%>*<%=ifelse(rp.label(var)==rp.name(var), '', sprintf(' ("%s")', rp.label(var)))%>

The dataset has <%=nvar<-as.numeric(var); length(nvar)%> observations with <%=rp.valid(nvar)%> valid values (missing: <%=rp.missing(nvar)%>).

<%if (is.numeric(var)) {%>
## Base statistics

<%=
set.caption(sprintf('Descriptives: %s', rp.label(var)))
rp.desc(rp.name(var), NULL, c('mean', 'sd', 'var'), rp.data)
%>

The standard deviation is <%=rp.sd(var)%> (variance: <%=rp.var(var)%>). The expected value is around <%=rp.mean(var)%>, somewhere between <%=rp.mean(var)-1.96*rp.se.mean(var)%> and <%=rp.mean(var)+1.96*rp.se.mean(var)%> with the standard error of <%=rp.se.mean(var)%>.

## Charts

<%=
set.caption(sprintf('Histogram: %s', rp.label(var)))
hist(var)
%>

It seems that the highest value is <%=rp.max(var)%> which is exactly <%=pander.return(rp.max(var)/rp.min(var))%> times higher than the smallest value (<%=rp.min(var)%>).

If we *suppose* that *<%=rp.label(var)%>* is not near to a normal distribution (skewness: <%=rp.skewness(var)%>, kurtosis: <%=rp.kurtosis(var)%>), checking the median (<%=rp.median(var)%>) might be a better option instead of the mean. The interquartile range (<%=rp.iqr(var)%>) measures the statistics dispersion of the variable (similar to standard deviation) based on median.

<%} else {%>

<%=
set.caption(sprintf('Frequency table: %s', rp.label(var)))
rp.freq(rp.name(var), rp.data, na.rm = FALSE, include.na = TRUE)
%>

The most frequent value is *<%=t <- table(var); names(t[t==max(t)])%>*.

## Charts

<%=
set.caption(sprintf('Barplot: %s', rp.label(var)))
rp.barplot(var)
%>

It seems that the highest value is <%=rp.max(nvar)%> which is exactly <%=pander.return(rp.max(nvar)/rp.min(nvar))%> times higher than the smallest value (<%=rp.min(nvar)%>).

<%}%>