function xx=CalcFreq(str,len,wid)

disp('Cutting in fragments...');
i=1; k=1; nn = size(str);
packs_size = nn(2) / wid
vf = javaArray("java.util.Hashtable", packs_size);
while i+wid-1<=nn(2)
    if round(k/200)==k/200
        disp(strcat(int2str(k),' fragments'));
    end
    
    frag = str(i:i+wid-1); 
    vf(k) = calcf(frag,len);    
    i = i+wid; k=k+1;
end

disp('Merging into table...');
names = javaObject("java.util.Vector"); % java.util.Vector; 
n = 0;
for i=1:packs_size
   keys = vf(i).keys;
   while keys.hasMoreElements
       key = keys.nextElement;
       if names.indexOf(key)==-1
       names.add(key);
       end
   end,  n=n+1;  end

xx = zeros(n,names.size());
for i=1:packs_size
    if round(i/200)==i/200
        disp(strcat(int2str(i),' points'));
    end
       for j=1:names.size()
           xx(i,j) = getwf(names.elementAt(j-1),vf(i));
       end,    end


function vf=calcf(str,num)
vf = javaObject("java.util.Hashtable"); % java.util.Hashtable;
i = 1; nn = size(str);
while i+num-1<=nn(2)
    wrd = str(i:i+num-1); i = i+num; addwf(wrd,vf,1);
end

function addwf(word,hash,fr)
wf = hash.get(word);
if (isempty(wf) || wf==0) hash.put(word,fr); else hash.put(word,fr+wf); end

function fr=getwf(word,hash)
wf = hash.get(word);
if size(wf)==0 fr=0; else fr=wf; end