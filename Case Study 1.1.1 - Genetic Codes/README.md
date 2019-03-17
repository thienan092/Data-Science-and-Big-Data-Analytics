[//]: # (Image References)

[image1]: ./images/PCA.PNG "PCA"
[image2]: ./images/K-means.jpg "K-means"

## Case Study Overview

### Goal
 - Use K-means to figure out that DNA is composed of three-letter words.

### Techniques
 - Creating lookup table (Java - Hashtable)
 - PCA (Matlab - princomp)
 - K-means clustering (Matlab - kmeans)

### Instructions
1. Specify the length of words (the number of nucleotides of elementary messages in gene). 
2. Clip the whole text into fragments of 300 letters in length and calculate the frequencies of short words (of length 1–4) inside every fragment. 
3. Create lookup table for words (because there are 4 nucleotides are A, T, G and C, so, there will 4^n possible words of length n) and vectorize fragments. Thus, each possible word is a dimension and count of that word in that fragment is the value. 
4. Apply PCA for points that represent fragments. 
5. Apply K-means clustering for new points. 

### Result
1.  PCA plots of word frequencies of different length shows the most structured distribution. The structure can be interpreted as the existence of a nonoverlapping triplet code

![alt-text][image1]

2. Distribution of clusters on genetic text. 

![alt-text][image2]
