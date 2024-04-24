import java.util.Arrays;
import java.util.Collections;
import java.util.Random;

char prev = ' ';
char[] letter_order = {'e', 't', 'a', 'o', 'i', 'n', 's', 'h', 'r', 'd', 'l', 'c', 'u', 'm', 'w', 'f', 'g', 'y', 'p', 'b', 'v', 'k', 'j', 'x', 'q', 'z'};
char[][] letterMap = {
  {'e', 't', 'a', 'o', 'i', 'n', 's', 'h', 'r', 'd', 'l', 'c', 'u', 'm', 'w', 'f', 'g', 'y', 'p', 'b', 'v', 'k', 'j', 'x', 'q', 'z'},  // Space
  {'n', 't', 'r', 'l', 's', 'c', 'd', 'm', 'i', 'g', 'y', 'b', 'p', 'v', 'u', 'k', 'f', 'w', 'h', 'z', 'a', 'x', 'e', 'o', 'q', 'j'},  // 'a'
  {'e', 'o', 'l', 'a', 'u', 'y', 'i', 'r', 's', 'j', 'b', 'm', 'c', 't', 'd', 'p', 'n', 'h', 'f', 'w', 'g', 'v', 'k', 'x', 'z', 'q'},  // 'b'
  {'o', 'e', 'a', 'h', 't', 'i', 'k', 'l', 'r', 'u', 'c', 's', 'y', 'd', 'p', 'm', 'n', 'f', 'b', 'g', 'v', 'w', 'q', 'z', 'j', 'x'},  // 'c'
  {'e', 'i', 'a', 'o', 's', 't', 'u', 'r', 'd', 'b', 'c', 'm', 'w', 'f', 'l', 'v', 'p', 'y', 'g', 'h', 'n', 'j', 'k', 'q', 'x', 'z'},  // 'd'
  {'r', 's', 'n', 'd', 'a', 't', 'c', 'l', 'm', 'e', 'w', 'p', 'i', 'v', 'o', 'f', 'x', 'b', 'g', 'y', 'h', 'u', 'q', 'k', 'j', 'z'},  // 'e'
  {'o', 'i', 'r', 'e', 't', 'a', 'f', 'u', 'l', 's', 'c', 'y', 'p', 'm', 'h', 'd', 'w', 'b', 'g', 'n', 'v', 'j', 'k', 'x', 'q', 'z'},  // 'f'
  {'e', 'a', 'h', 'r', 'i', 'o', 'u', 's', 't', 'n', 'l', 'y', 'g', 'c', 'p', 'f', 'm', 'b', 'w', 'd', 'v', 'k', 'j', 'z', 'q', 'x'},  // 'g'
  {'e', 'a', 'i', 'o', 't', 'r', 'u', 'n', 'y', 's', 'm', 'c', 'p', 'l', 'w', 'd', 'b', 'f', 'h', 'g', 'v', 'q', 'k', 'j', 'z', 'x'},  // 'h'
  {'n', 't', 's', 'o', 'c', 'l', 'e', 'a', 'd', 'r', 'g', 'v', 'm', 'f', 'p', 'b', 'z', 'k', 'x', 'i', 'u', 'w', 'h', 'q', 'j', 'y'},  // 'i'
  {'o', 'a', 'u', 'e', 'i', 'p', 'r', 's', 'c', 'k', 'm', 'd', 'b', 'n', 't', 'v', 'l', 'h', 'f', 'j', 'w', 'g', 'y', 'z', 'x', 'q'},  // 'j'
  {'e', 'i', 's', 'a', 'n', 'o', 't', 'l', 'h', 'y', 'b', 'f', 'r', 'c', 'm', 'p', 'u', 'w', 'g', 'd', 'k', 'j', 'v', 'q', 'x', 'z'},  // 'k'
  {'e', 'i', 'l', 'a', 'o', 'y', 's', 'd', 't', 'u', 'p', 'c', 'f', 'b', 'm', 'r', 'v', 'w', 'k', 'g', 'n', 'h', 'j', 'z', 'q', 'x'},  // 'l'
  {'e', 'a', 'o', 'i', 'p', 's', 'm', 'b', 'u', 'y', 't', 'c', 'l', 'r', 'f', 'n', 'd', 'w', 'h', 'g', 'v', 'j', 'k', 'x', 'z', 'q'},  // 'm'
  {'t', 'd', 'g', 'e', 's', 'a', 'o', 'i', 'c', 'f', 'n', 'u', 'y', 'l', 'k', 'm', 'p', 'v', 'b', 'w', 'h', 'r', 'j', 'z', 'q', 'x'},  // 'n'
  {'n', 'r', 'u', 'f', 'm', 't', 'l', 'w', 's', 'p', 'o', 'd', 'c', 'v', 'g', 'b', 'a', 'k', 'i', 'e', 'y', 'h', 'x', 'j', 'z', 'q'},  // 'o'
  {'r', 'e', 'a', 'o', 'l', 'p', 'i', 'h', 'u', 't', 's', 'm', 'y', 'd', 'c', 'f', 'g', 'b', 'w', 'n', 'v', 'k', 'q', 'x', 'j', 'z'},  // 'p'
  {'u', 'l', 's', 'a', 'i', 't', 'r', 'c', 'f', 'w', 'p', 'm', 'h', 'n', 'd', 'e', 'b', 'o', 'q', 'v', 'g', 'k', 'x', 'j', 'y', 'z'},  // 'q'
  {'e', 'i', 'o', 'a', 's', 't', 'u', 'y', 'w', 'c', 'm', 'n', 'd', 'l', 'r', 'b', 'v', 'g', 'f', 'x', 'k', 'j', 'z', 'q', 'h', 'p'},  // 'r'
  {'t', 'e', 'i', 'o', 'a', 's', 'r', 't', 'u', 'y', 'w', 'c', 'l', 'm', 'p', 'b', 'f', 'd', 'n', 'g', 'v', 'k', 'j', 'z', 'x', 'q'},  // 's'
  {'a', 'e', 'i', 'o', 't', 'r', 'u', 'n', 'y', 's', 'm', 'c', 'p', 'l', 'w', 'd', 'b', 'f', 'h', 'g', 'v', 'q', 'k', 'j', 'z', 'x'},  // 't'
  {'r', 's', 'n', 'd', 'a', 't', 'c', 'l', 'm', 'e', 'w', 'p', 'i', 'v', 'o', 'f', 'x', 'b', 'g', 'y', 'h', 'u', 'q', 'k', 'j', 'z'},  // 'u'
  {'e', 'i', 'a', 'o', 'd', 's', 'c', 'y', 'r', 'u', 't', 'p', 'g', 'b', 'l', 'h', 'm', 'n', 'w', 'f', 'v', 'x', 'k', 'j', 'q', 'z'},  // 'v'
  {'i', 'e', 'a', 'h', 'o', 's', 'n', 'r', 'w', 't', 'l', 'y', 'p', 'c', 'm', 'd', 'b', 'f', 'u', 'j', 'g', 'k', 'v', 'x', 'z', 'q'},  // 'w'
  {'t', 'p', 'i', 'a', 'c', 'e', 'x', 'm', 'o', 's', 'u', 'y', 'f', 'h', 'b', 'l', 'r', 'd', 'w', 'v', 'n', 'g', 'k', 'j', 'z', 'q'},  // 'x'
  {'o', 's', 'e', 'a', 't', 'p', 'i', 'c', 'm', 'r', 'l', 'b', 'w', 'n', 'd', 'f', 'h', 'g', 'u', 'v', 'j', 'y', 'k', 'z', 'q', 'x'},  // 'y'
  {'e', 'a', 'i', 'o', 'z', 'u', 'y', 'l', 's', 'd', 'c', 'h', 'r', 'm', 'b', 't', 'p', 'n', 'w', 'f', 'g', 'k', 'j', 'v', 'x', 'q'}   // 'z'
};

boolean ERROR = false;

String[] phrases; //contains all of the phrases
int totalTrialNum = 2; //the total number of phrases to be tested - set this low for testing. Might be ~10 for the real bakeoff!
int currTrialNum = 0; // the current trial number (indexes into trials array above)
float startTime = 0; // time starts when the first letter is entered
float finishTime = 0; // records the time of when the final trial ends
float lastTime = 0; //the timestamp of when the last trial was completed
float lettersEnteredTotal = 0; //a running total of the number of letters the user has entered (need this for final WPM computation)
float lettersExpectedTotal = 0; //a running total of the number of letters expected (correct phrases)
float errorsTotal = 0; //a running total of the number of errors (when hitting next)
String currentPhrase = ""; //the current target phrase
String currentTyped = ""; //what the user has typed so far
final int DPIofYourDeviceScreen = 200; //you will need to look up the DPI or PPI of your device to make sure you get the right scale!!
//http://en.wikipedia.org/wiki/List_of_displays_by_pixel_density
final float sizeOfInputArea = DPIofYourDeviceScreen*1; //aka, 1.0 inches square!
PImage watch;

//Variables for my silly implementation. You can delete this:
char currentLetter = 'a';

//You can modify anything in here. This is just a basic implementation.
void setup()
{
  watch = loadImage("watchhand3smaller.png");
  phrases = loadStrings("phrases2.txt"); //load the phrase set into memory
  Collections.shuffle(Arrays.asList(phrases), new Random()); //randomize the order of the phrases with no seed
  //Collections.shuffle(Arrays.asList(phrases), new Random(100)); //randomize the order of the phrases with seed 100; same order every time, useful for testing
 
  orientation(LANDSCAPE); //can also be PORTRAIT - sets orientation on android device
  size(800, 800); //Sets the size of the app. You should modify this to your device's native size. Many phones today are 1080 wide by 1920 tall.
  textFont(createFont("Arial", 24)); //set the font to arial 24. Creating fonts is expensive, so make difference sizes once in setup, not draw
  noStroke(); //my code doesn't use any strokes
}

//You can modify anything in here. This is just a basic implementation.
void draw()
{
  background(255); //clear background
  drawWatch(); //draw watch background
  fill(100);
  rect(width/2-sizeOfInputArea/2, height/2-sizeOfInputArea/2, sizeOfInputArea, sizeOfInputArea); //input area should be 1" by 1"
  
  // Check if the current typed letter is wrong and change the background color to red if it is
  if (1 <= currentTyped.length()  && currentTyped.length() <= currentPhrase.length()) {
    if (currentTyped.charAt(currentTyped.length() - 1) != currentPhrase.charAt(currentTyped.length() - 1)) {
      ERROR = true;
      fill(255, 0, 0); // Red background color
      rect(width/2-sizeOfInputArea/2, height/2-sizeOfInputArea/2, sizeOfInputArea, sizeOfInputArea); // Change background to red
    }
  }

  if (finishTime!=0)
  {
    fill(128);
    textAlign(CENTER);
    text("Finished", 280, 150);
    return;
  }

  if (startTime==0 & !mousePressed)
  {
    fill(128);
    textAlign(CENTER);
    text("Click to start time!", 280, 150); //display this messsage until the user clicks!
  }

  if (startTime==0 & mousePressed)
  {
    nextTrial(); //start the trials!
  }

  if (startTime!=0)
  {
    //feel free to change the size and position of the target/entered phrases and next button 
    textAlign(LEFT); //align the text left
    fill(128);
    text("Phrase " + (currTrialNum+1) + " of " + totalTrialNum, 70, 50); //draw the trial count
    fill(128);
    text("Target:   " + currentPhrase, 70, 100); //draw the target string
    text("Entered:  " + currentTyped +"|", 70, 140); //draw what the user has entered thus far 

    //draw very basic next button
    fill(255, 0, 0);
    rect(600, 600, 200, 200); //draw next button
    fill(255);
    text("NEXT > ", 650, 650); //draw next label
    
    // Draw the alphabet buttons
    float buttonSize = sizeOfInputArea / 6; // 6 buttons per row
    for (int i = 0; i < 26; i++) {
      char letter = letter_order[i];
      float x = width/2 - sizeOfInputArea/2 + (i % 6) * buttonSize; 
      float y = height/2 - sizeOfInputArea/2 + (1+floor(i / 6)) * buttonSize; 
      fill(255); // White button color
      rect(x, y, buttonSize, buttonSize);
      fill(0); // Black text color
      text(letter, x + buttonSize/2 - 5, y + buttonSize/2 + 5); 
    }

    int space = 0;
    char letter = (char)('_'); 
    float x = width/2 - sizeOfInputArea/2 + (space % 6) * buttonSize;
    float y = height/2 - sizeOfInputArea/2 + floor(space / 6) * buttonSize;
    fill(255); // White button color
    rect(x, y, buttonSize, buttonSize);
    fill(0); // Black text color
    text(letter, x + buttonSize/2 - 5, y + buttonSize/2 + 5); 
    
    int del = 1;
    letter = (char)('<'); // Get the current letter
    x = width/2 - sizeOfInputArea/2 + (del % 6) * buttonSize; // Calculate x position
    y = height/2 - sizeOfInputArea/2 + floor(del / 6) * buttonSize; // Calculate y position
    fill(255); // White button color
    rect(x, y, buttonSize, buttonSize); // Draw the button
    fill(0); // Black text color
    text(letter, x + buttonSize/2 - 5, y + buttonSize/2 + 5); // Draw the letter in the button
  

    ////my draw code
    //fill(255, 0, 0); //red button
    //rect(width/2-sizeOfInputArea/2, height/2-sizeOfInputArea/2+sizeOfInputArea/2, sizeOfInputArea/2, sizeOfInputArea/2); //draw left red button
    //fill(0, 255, 0); //green button
    //rect(width/2-sizeOfInputArea/2+sizeOfInputArea/2, height/2-sizeOfInputArea/2+sizeOfInputArea/2, sizeOfInputArea/2, sizeOfInputArea/2); //draw right green button
    //textAlign(CENTER);
    //fill(200);
    //text("" + currentLetter, width/2, height/2-sizeOfInputArea/4); //draw current letter
  }
}

//my terrible implementation you can entirely replace
boolean didMouseClick(float x, float y, float w, float h) //simple function to do hit testing
{
  return (mouseX > x && mouseX<x+w && mouseY>y && mouseY<y+h); //check to see if it is in button bounds
}

//my terrible implementation you can entirely replace
void mousePressed()
{
  // Check if the click is inside any of the letter buttons
  float buttonSize = sizeOfInputArea / 6; // 6 buttons per row
  for (int i = 0; i < 26; i++) {
    float x = width/2 - sizeOfInputArea/2 + (i % 6) * buttonSize; // Calculate x position
    float y = height/2 - sizeOfInputArea/2 + (1+floor(i / 6)) * buttonSize; // Calculate y position
    if (!ERROR && mouseX > x && mouseX < x + buttonSize && mouseY > y && mouseY < y + buttonSize) {
      char letter = (char)letter_order[i]; // Get the letter associated with the button
      currentTyped += letter; // Add the letter to currentTyped
    }
  }
  for (int i = 0; i < 2; i++) {
    float x = width/2 - sizeOfInputArea/2 + (i % 6) * buttonSize; // Calculate x position
    float y = height/2 - sizeOfInputArea/2 + floor(i / 6) * buttonSize; // Calculate y position
    if (mouseX > x && mouseX < x + buttonSize && mouseY > y && mouseY < y + buttonSize) {
      if (!ERROR && i == 0) {
        currentTyped += " "; // Add the letter to currentTyped
      } else {
        if (currentTyped.length() > 0 && i != 0) {
          currentTyped = currentTyped.substring(0, currentTyped.length()-1); //delete last character
          ERROR = false;
        }
      }
    }
  }
  if (currentTyped.length() > 0) {
    prev = currentTyped.charAt(currentTyped.length()-1);
    if (prev == ' ') {
      letter_order = letterMap[0];
    } else {
      letter_order = letterMap[prev-'a'+1];
    }
  } else {
    prev = ' ';
  }
 
  //You are allowed to have a next button outside the 1" area
  if (didMouseClick(600, 600, 200, 200)) //check if click is in next button
  {
    nextTrial(); //if so, advance to next trial
  }
}


void nextTrial()
{
  if (currTrialNum >= totalTrialNum) //check to see if experiment is done
    return; //if so, just return

  if (startTime!=0 && finishTime==0) //in the middle of trials
  {
    System.out.println("==================");
    System.out.println("Phrase " + (currTrialNum+1) + " of " + totalTrialNum); //output
    System.out.println("Target phrase: " + currentPhrase); //output
    System.out.println("Phrase length: " + currentPhrase.length()); //output
    System.out.println("User typed: " + currentTyped); //output
    System.out.println("User typed length: " + currentTyped.length()); //output
    System.out.println("Number of errors: " + computeLevenshteinDistance(currentTyped.trim(), currentPhrase.trim())); //trim whitespace and compute errors
    System.out.println("Time taken on this trial: " + (millis()-lastTime)); //output
    System.out.println("Time taken since beginning: " + (millis()-startTime)); //output
    System.out.println("==================");
    lettersExpectedTotal+=currentPhrase.trim().length();
    lettersEnteredTotal+=currentTyped.trim().length();
    errorsTotal+=computeLevenshteinDistance(currentTyped.trim(), currentPhrase.trim());
  }

  //probably shouldn't need to modify any of this output / penalty code.
  if (currTrialNum == totalTrialNum-1) //check to see if experiment just finished
  {
    finishTime = millis();
    System.out.println("==================");
    System.out.println("Trials complete!"); //output
    System.out.println("Total time taken: " + (finishTime - startTime)); //output
    System.out.println("Total letters entered: " + lettersEnteredTotal); //output
    System.out.println("Total letters expected: " + lettersExpectedTotal); //output
    System.out.println("Total errors entered: " + errorsTotal); //output

    float wpm = (lettersEnteredTotal/5.0f)/((finishTime - startTime)/60000f); //FYI - 60K is number of milliseconds in minute
    float freebieErrors = lettersExpectedTotal*.05; //no penalty if errors are under 5% of chars
    float penalty = max(errorsTotal-freebieErrors, 0) * .5f;
    
    System.out.println("Raw WPM: " + wpm); //output
    System.out.println("Freebie errors: " + freebieErrors); //output
    System.out.println("Penalty: " + penalty);
    System.out.println("WPM w/ penalty: " + (wpm-penalty)); //yes, minus, becuase higher WPM is better
    System.out.println("==================");

    currTrialNum++; //increment by one so this mesage only appears once when all trials are done
    return;
  }

  if (startTime==0) //first trial starting now
  {
    System.out.println("Trials beginning! Starting timer..."); //output we're done
    startTime = millis(); //start the timer!
  } 
  else
    currTrialNum++; //increment trial number

  lastTime = millis(); //record the time of when this trial ended
  currentTyped = ""; //clear what is currently typed preparing for next trial
  currentPhrase = phrases[currTrialNum]; // load the next phrase!
  //currentPhrase = "abc"; // uncomment this to override the test phrase (useful for debugging)
}


void drawWatch()
{
  float watchscale = DPIofYourDeviceScreen/138.0;
  pushMatrix();
  translate(width/2, height/2);
  scale(watchscale);
  imageMode(CENTER);
  image(watch, 0, 0);
  popMatrix();
}





//=========SHOULD NOT NEED TO TOUCH THIS METHOD AT ALL!==============
int computeLevenshteinDistance(String phrase1, String phrase2) //this computers error between two strings
{
  int[][] distance = new int[phrase1.length() + 1][phrase2.length() + 1];

  for (int i = 0; i <= phrase1.length(); i++)
    distance[i][0] = i;
  for (int j = 1; j <= phrase2.length(); j++)
    distance[0][j] = j;

  for (int i = 1; i <= phrase1.length(); i++)
    for (int j = 1; j <= phrase2.length(); j++)
      distance[i][j] = min(min(distance[i - 1][j] + 1, distance[i][j - 1] + 1), distance[i - 1][j - 1] + ((phrase1.charAt(i - 1) == phrase2.charAt(j - 1)) ? 0 : 1));

  return distance[phrase1.length()][phrase2.length()];
}
