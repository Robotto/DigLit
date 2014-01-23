

#define NUM_INPUTS 3
#define DEBOUNCE_MS 15

typedef struct {
  byte pinNumber;
  long debounce_counter;
  boolean last_state;
  char key_binding;
  }
Input;

Input tree;   //KEY_LEFT_ARROW
Input rocket; //KEY_UP_ARROW
Input dragon; //KEY_RIGHT_ARROW

Input *input_map[NUM_INPUTS]={&tree,&rocket,&dragon}; //map of inputs. (array of pointers)

long last_millis = 0;



void setup()
{

 tree.pinNumber=13;
 rocket.pinNumber=12;
 dragon.pinNumber=15;

 tree.key_binding =     '1';
 rocket.key_binding =   '2';
 dragon.key_binding =   '3';


for (int i = 0; i < NUM_INPUTS; i++)
  {
    input_map[i]->debounce_counter=0;
    pinMode(input_map[i]->pinNumber,INPUT_PULLUP);
  }

  Keyboard.begin();

  last_millis = millis();
}


void loop()
{


  if(millis() != last_millis) //If a millisecond has passed
  {
    for (int i = 0; i < NUM_INPUTS; i++)
    {
      if(digitalRead(input_map[i]->pinNumber)!=input_map[i]->last_state) input_map[i]->debounce_counter++; //if input has changed
      else  input_map[i]->debounce_counter=0;

      if(input_map[i]->debounce_counter>=DEBOUNCE_MS)
      {
        input_map[i]->last_state=digitalRead(input_map[i]->pinNumber);
        Keyboard.write(input_map[i]->key_binding);
        input_map[i]->debounce_counter=0;
      }
    }

    last_millis = millis();
  }
}
