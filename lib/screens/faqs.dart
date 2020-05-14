import 'package:covid_19/constant.dart';
import 'package:covid_19/widgets/app_drawer.dart';
import 'package:covid_19/widgets/myheader.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class FAQs extends StatefulWidget {
  @override
  _FAQsState createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppDrawer(),
      body: Builder(
        builder: (context)=>
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MyHeader(
                image: 'assets/images/who.png',
                textTop: '   FREQUENTLY',
                textBottom: '        ASKED \n           QUESTIONS',
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Coronavirus Disease Basics',
                      style: kTitleTextstyle,
                    ),
                    SizedBox(height: 10),
                    Tile(
                      title: 'What is a novel coronavirus?',
                      textTop: 'On February 11, 2020 the World Health Organization announced an official name for the disease that is causing the 2019 novel coronavirus outbreak, first identified in Wuhan China. The new name of this disease is coronavirus disease 2019, abbreviated as COVID-19. In COVID-19, ‘CO’ stands for ‘corona,’ ‘VI’ for ‘virus,’ and ‘D’ for disease. Formerly, this disease was referred to as “2019 novel coronavirus” or “2019-nCoV”.',
                      textBottom: 'A novel coronavirus is a new coronavirus that has not been previously identified. The virus causing coronavirus disease 2019 (COVID-19), is not the same as the coronaviruses that commonly circulate among humans and cause mild illness, like the common cold.',
                      url: 'https://www.cdc.gov/coronavirus/2019-ncov/index.html',
                    ),
                    Tile(
                      title: 'Why is the disease being called coronavirus disease 2019, COVID-19?',
                      textBottom: '',
                      textTop: 'A novel coronavirus is a new coronavirus that has not been previously identified. The virus causing coronavirus disease 2019 (COVID-19), is not the same as the coronaviruses that commonly circulate among humans and cause mild illness, like the common cold.',
                      url: 'https://www.cdc.gov/coronavirus/2019-ncov/index.html',
                    ),
                    Tile(
                      title: 'How can people help stop stigma related to COVID-19?',
                      textTop: 'People can fight stigma and help, not hurt, others by providing social support. Counter stigma by learning and sharing facts. Communicating the facts that viruses do not target specific racial or ethnic groups and how COVID-19 actually spreads can help stop stigma.',
                      textBottom: '',
                      url: '',
                    ),
                    SizedBox(height: 20),
                    Text(
                      'How It Spreads',
                      style: kTitleTextstyle,
                    ),
                    SizedBox(height: 10),
                    Tile(
                      title: 'What is the source of the virus?',
                      textTop: 'Coronaviruses are a large family of viruses. Some cause illness in people, and others, such as canine and feline coronaviruses, only infect animals. Rarely, animal coronaviruses that infect animals have emerged to infect people and can spread between people. This is suspected to have occurred for the virus that causes COVID-19. Middle East Respiratory Syndrome (MERS) and Severe Acute Respiratory Syndrome (SARS) are two other examples of coronaviruses that originated from animals and then spread to people. More information about the source and spread of COVID-19 is available on the Situation Summary: Source and Spread of the Virus.',
                      textBottom: '',
                      url: 'https://www.cdc.gov/coronavirus/2019-ncov/cases-updates/summary.html',
                    ),Tile(
                      title: 'How does the virus spread?',
                      textTop: 'This virus was first detected in Wuhan City, Hubei Province, China. The first infections were linked to a live animal market, but the virus is now spreading from person-to-person. It’s important to note that person-to-person spread can happen on a continuum. Some viruses are highly contagious (like measles), while other viruses are less so.',
                      textBottom: 'The virus that causes COVID-19 seems to be spreading easily and sustainably in the community (“community spread”) in some affected geographic areas. Community spread means people have been infected with the virus in an area, including some who are not sure how or where they became infected.',
                      url: 'https://www.cdc.gov/coronavirus/2019-ncov/about/transmission.html',
                    ),
                    Tile(
                      title: 'Can someone who has had COVID-19 spread the illness to others?',
                      textTop: 'The virus that causes COVID-19 is spreading from person-to-person. Someone who is actively sick with COVID-19 can spread the illness to others. That is why CDC recommends that these patients be isolated either in the hospital or at home (depending on how sick they are) until they are better and no longer pose a risk of infecting others.',
                      textBottom: 'How long someone is actively sick can vary so the decision on when to release someone from isolation is made on a case-by-case basis in consultation with doctors, infection prevention and control experts, and public health officials and involves considering specifics of each situation including disease severity, illness signs and symptoms, and results of laboratory testing for that patient.\n\nCurrent CDC guidance for when it is OK to release someone from isolation is made on a case by case basis and includes meeting all of the following requirements:\n\n• The patient is free from fever without the use of fever-reducing medications.\n• The patient is no longer showing symptoms, including cough.\n• The patient has tested negative on at least two consecutive respiratory specimens collected at least 24 hours apart.\n• Someone who has been released from isolation is not considered to pose a risk of infection to others.',
                      url: 'https://www.cdc.gov/coronavirus/2019-ncov/hcp/disposition-hospitalized-patients.html',
                    ),
                    Tile(
                      title: 'Will warm weather stop the outbreak of COVID-19?',
                      textTop: 'It is not yet known whether weather and temperature impact the spread of COVID-19. Some other viruses, like the common cold and flu, spread more during cold weather months but that does not mean it is impossible to become sick with these viruses during other months. At this time, it is not known whether the spread of COVID-19 will decrease when weather becomes warmer. There is much more to learn about the transmissibility, severity, and other features associated with COVID-19 and investigations are ongoing.',
                      textBottom: '',
                      url: '',
                    ),
                    Tile(
                      title: 'Can the virus that causes COVID-19 be spread through food, including refrigerated or frozen food?',
                      textTop: 'Coronaviruses are generally thought to be spread from person-to-person through respiratory droplets. Currently there is no evidence to support transmission of COVID-19 associated with food. Before preparing or eating food it is important to always wash your hands with soap and water for 20 seconds for general food safety. Throughout the day wash your hands after blowing your nose, coughing or sneezing, or going to the bathroom.\n\nIt may be possible that a person can get COVID-19 by touching a surface or object that has the virus on it and then touching their own mouth, nose, or possibly their eyes, but this is not thought to be the main way the virus spreads.',
                      textBottom: 'In general, because of poor survivability of these coronaviruses on surfaces, there is likely very low risk of spread from food products or packaging that are shipped over a period of days or weeks at ambient, refrigerated, or frozen temperatures.',
                      url: 'https://www.cdc.gov/coronavirus/2019-ncov/prepare/transmission.html',
                    ),
                    Tile(
                      title: 'What is community spread?',
                      textTop: 'Community spread means people have been infected with the virus in an area, including some who are not sure how or where they became infected.',
                      textBottom: '',
                      url: '',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'How to Protect Yourself',
                      style: kTitleTextstyle,
                    ),
                    SizedBox(height: 10),
                    Tile(
                      title: 'What can I do to protect myself and prevent the spread of disease?',
                      textTop: 'Stay aware of the latest information on the COVID-19 outbreak, available on the WHO website and through your national and local public health authority. Many countries around the world have seen cases of COVID-19 and several have seen outbreaks. Authorities in China and some other countries have succeeded in slowing or stopping their outbreaks. However, the situation is unpredictable so check regularly for the latest news.\n\nYou can reduce your chances of being infected or spreading COVID-19 by taking some simple precautions:',
                      textBottom: '• Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water.\n• Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water.\n• Maintain at least 1 metre (3 feet) distance between yourself and anyone who is coughing or sneezing.\n• Avoid touching eyes, nose and mouth.\n• Make sure you, and the people around you, follow good respiratory hygiene. This means covering your mouth and nose with your bent elbow or tissue when you cough or sneeze. Then dispose of the used tissue immediately.\n• Stay home if you feel unwell. If you have a fever, cough and difficulty breathing, seek medical attention and call in advance. Follow the directions of your local health authority.\n• Keep up to date on the latest COVID-19 hotspots (cities or local areas where COVID-19 is spreading widely). If possible, avoid traveling to places – especially if you are an older person or have diabetes, heart or lung disease.',
                      url: '',
                    ),
                    Tile(
                      title: 'What should I do if I had close contact with someone who has COVID-19?',
                      textTop: 'Household members, intimate partners, and caregivers in a nonhealthcare setting may have close contact2 with a person with symptomatic, laboratory-confirmed COVID-19 or a person under investigation. Close contacts should monitor their health; they should call their healthcare provider right away if they develop symptoms suggestive of COVID-19 (e.g., fever, cough, shortness of breath)\n\nClose contacts should also follow these recommendations:',
                      textBottom: '• Make sure that you understand and can help the patient follow their healthcare provider’s instructions for medication(s) and care. You should help the patient with basic needs in the home and provide support for getting groceries, prescriptions, and other personal needs.\n• Monitor the patient’s symptoms. If the patient is getting sicker, call his or her healthcare provider and tell them that the patient has laboratory-confirmed COVID-19. This will help the healthcare provider’s office take steps to keep other people in the office or waiting room from getting infected. Ask the healthcare provider to call the local or state health department for additional guidance. If the patient has a medical emergency and you need to call 911, notify the dispatch personnel that the patient has, or is being evaluated for COVID-19.\n• Household members should stay in another room or be separated from the patient as much as possible. Household members should use a separate bedroom and bathroom, if available.\nProhibit visitors who do not have an essential need to be in the home.\n• Household members should care for any pets in the home. Do not handle pets or other animals while sick.Make sure that shared spaces in the home have good air flow, such as by an air conditioner or an opened window, weather permitting.\n• Perform hand hygiene frequently. Wash your hands often with soap and water for at least 20 seconds or use an alcohol-based hand sanitizer that contains 60 to 95% alcohol, covering all surfaces of your hands and rubbing them together until they feel dry. Soap and water should be used preferentially if hands are visibly dirty.\n• Avoid touching your eyes, nose, and mouth with unwashed hands.\n• The patient should wear a facemask when you are around other people. If the patient is not able to wear a facemask (for example, because it causes trouble breathing), you, as the caregiver, should wear a mask when you are in the same room as the patient.\n• Wear a disposable facemask and gloves when you touch or have contact with the patient’s blood, stool, or body fluids, such as saliva, sputum, nasal mucus, vomit, urine.\n• Avoid sharing household items with the patient. You should not share dishes, drinking glasses, cups, eating utensils, towels, bedding, or other items. After the patient uses these items, you should wash them thoroughly (see below “Wash laundry thoroughly”).\n• Clean all “high-touch” surfaces, such as counters, tabletops, doorknobs, bathroom fixtures, toilets, phones, keyboards, tablets, and bedside tables, every day. Also, clean any surfaces that may have blood, stool, or body fluids on them.\n• Wash laundry thoroughly.\n• Place all used disposable gloves, facemasks, and other contaminated items in a lined container before disposing of them with other household waste. Clean your hands (with soap and water or an alcohol-based hand sanitizer) immediately after handling these items. Soap and water should be used preferentially if hands are visibly dirty.\n• Discuss any additional questions with your state or local health department or healthcare provider. Check available hours when contacting your local health department.',
                      url: '',
                    ),
                    Tile(
                      title: 'Who is at higher risk for serious illness from COVID-19?',
                      textTop: 'Older adults and people of any age who have serious underlying medical conditions may be at higher risk for more serious complications from COVID-19. These people who may be at higher risk of getting very sick from this illness, includes:',
                      textBottom: '• Older adults\n• People who have serious underlying medical conditions like: Heart Disease, Diabetes, Lung disease',
                      url: '',
                    ),
                    Tile(
                      title: 'What should people at higher risk of serious illness with COVID-19 do?',
                      textTop: 'If you are at higher risk of getting very sick from COVID-19, you should: stock up on supplies; take everyday precautions to keep space between yourself and others; when you go out in public, keep away from others who are sick; limit close contact and wash your hands often; and avoid crowds, cruise travel, and non-essential travel. If there is an outbreak in your community, stay home as much as possible. Watch for symptoms and emergency signs. If you get sick, stay home and call your doctor. More information on how to prepare, what to do if you get sick, and how communities and caregivers can support those at higher risk is available on People at Risk for Serious Illness from COVID-19.',
                      textBottom: '',
                      url: 'https://www.cdc.gov/coronavirus/2019-ncov/specific-groups/high-risk-complications.html',
                    ),
                    Tile(
                      title: 'Should I wear a mask to protect myself?',
                      textTop: 'Only wear a mask if you are ill with COVID-19 symptoms (especially coughing) or looking after someone who may have COVID-19. Disposable face mask can only be used once. If you are not ill or looking after someone who is ill then you are wasting a mask. There is a world-wide shortage of masks, so WHO urges people to use masks wisely.\n\nWHO advises rational use of medical masks to avoid unnecessary wastage of precious resources and mis-use of masks.',
                      textBottom: 'The most effective ways to protect yourself and others against COVID-19 are to frequently clean your hands, cover your cough with the bend of elbow or tissue and maintain a distance of at least 1 meter (3 feet) from people who are coughing or sneezing. See basic protective measures against the new coronavirus for more information.',
                      url: 'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/when-and-how-to-use-masks',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Symptoms & Testing',
                      style: kTitleTextstyle,
                    ),
                    SizedBox(height: 10),

                    Tile(
                      title: 'What are the symptoms of COVID-19?',
                      textTop: 'The most common symptoms of COVID-19 are fever, tiredness, and dry cough. Some patients may have aches and pains, nasal congestion, runny nose, sore throat or diarrhoea. These symptoms are usually mild and begin gradually. Some people become infected but don’t develop any symptoms and don\'t feel unwell. Most people (about 80%) recover from the disease without needing special treatment. Around 1 out of every 6 people who gets COVID-19 becomes seriously ill and develops difficulty breathing. Older people, and those with underlying medical problems like high blood pressure, heart problems or diabetes, are more likely to develop serious illness. People with fever, cough and difficulty breathing should seek medical attention.',
                      textBottom: '',
                      url: 'https://www.cdc.gov/coronavirus/2019-ncov/symptoms-testing/symptoms.html',
                    ),
                    Tile(
                      title: 'Should I be tested for COVID-19?',
                      textTop: 'Not everyone needs to be tested for COVID-19.',
                      textBottom: '',
                      url: 'https://www.cdc.gov/coronavirus/2019-ncov/symptoms-testing/testing.html',
                    ),
                    Tile(
                      title: 'Where can I get tested for COVID-19?',
                      textTop: 'The process and locations for testing vary from place to place. Contact your state, local, tribal, or territorial department for more information, or reach out to a medical provider. State and local public health departments have received tests from CDC while medical providers are getting tests developed by commercial manufacturers. While supplies of these tests are increasing, it may still be difficult to find someplace to get tested.',
                      textBottom: '',
                      url: '',
                    ),
                    Tile(
                      title: 'Can a person test negative and later test positive for COVID-19?',
                      textTop: 'Using the CDC-developed diagnostic test, a negative result means that the virus that causes COVID-19 was not found in the person’s sample. In the early stages of infection, it is possible the virus will not be detected.',
                      textBottom: 'For COVID-19, a negative test result for a sample collected while a person has symptoms likely means that the COVID-19 virus is not causing their current illness.',
                      url: '',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Outbreak in Your Community',
                      style: kTitleTextstyle,
                    ),
                    SizedBox(height: 10),

                    Tile(
                      title: 'What should I do if there is an outbreak in my community?',
                      textTop: 'During an outbreak, stay calm and put your preparedness plan to work. Follow the steps below:',
                      textBottom: '• Stay home if you are sick. Keep away from people who are sick. Limit close contact with others as much as possible (about 6 feet).\n• Stay informed about the local COVID-19 situation.\n• Notify your workplace as soon as possible if your regular work schedule changes.\n• Stay in touch with others by phone or email.',
                      url: '',
                    ),
                    Tile(
                      title: 'How do I prepare my children in case of COVID-19 outbreak in our community?',
                      textTop: 'Outbreaks can be stressful for adults and children. Talk with your children about the outbreak, try to stay calm, and reassure them that they are safe. If appropriate, explain to them that most illness from COVID-19 seems to be mild.',
                      textBottom: '',
                      url: 'https://www.cdc.gov/childrenindisasters/helping-children-cope.html',
                    ),
                    Tile(
                      title: 'What steps should parents take to protect children during a community outbreak?',
                      textTop: 'This is a new virus and we are still learning about it, but so far, there does not seem to be a lot of illness in children. Most illness, including serious illness, is happening in adults of working age and older adults. If there cases of COVID-19 that impact your child’s school, the school may dismiss students. Keep track of school dismissals in your community. Read or watch local media sources that report school dismissals. If schools are dismissed temporarily, use alternative childcare arrangements, if needed.',
                      textBottom: 'If your child/children become sick with COVID-19, notify their childcare facility or school. Talk with teachers about classroom assignments and activities they can do from home to keep up with their schoolwork.\n\nDiscourage children and teens from gathering in other public places while school is dismissed to help slow the spread of COVID-19 in the community.',
                      url: '',
                    ),
                    Tile(
                      title: 'Will schools be dismissed if there is an outbreak in my community?',
                      textTop: 'Depending on the situation, public health officials may recommend community actions to reduce exposures to COVID-19, such as school dismissals. Read or watch local media sources that report school dismissals or and watch for communication from your child’s school. If schools are dismissed temporarily, discourage students and staff from gathering or socializing anywhere, like at a friend’s house, a favorite restaurant, or the local shopping mall.',
                      textBottom: '',
                      url: '',
                    ),
                    Tile(
                      title: 'Can the virus that causes COVID-19 be spread through food, including refrigerated or frozen food?',
                      textTop: 'Coronaviruses are generally thought to be spread from person-to-person through respiratory droplets. Currently there is no evidence to support transmission of COVID-19 associated with food. Before preparing or eating food it is important to always wash your hands with soap and water for 20 seconds for general food safety. Throughout the day wash your hands after blowing your nose, coughing or sneezing, or going to the bathroom.',
                      textBottom: 'It may be possible that a person can get COVID-19 by touching a surface or object that has the virus on it and then touching their own mouth, nose, or possibly their eyes, but this is not thought to be the main way the virus spreads.\n\nIn general, because of poor survivability of these coronaviruses on surfaces, there is likely very low risk of spread from food products or packaging that are shipped over a period of days or weeks at ambient, refrigerated, or frozen temperatures.',
                      url: 'https://www.cdc.gov/coronavirus/2019-ncov/prepare/transmission.html',
                    ),
                    Tile(
                      title: 'Should I go to work if there is an outbreak in my community?',
                      textTop: 'Follow the advice of your local health officials. Stay home if you can. Talk to your employer to discuss working from home, taking leave if you or someone in your household gets sick with COVID-19 symptoms, or if your child’s school is dismissed temporarily. Employers should be aware that more employees may need to stay at home to care for sick children or other sick family members than is usual in case of a community outbreak.',
                      textBottom: '',
                      url: 'https://www.cdc.gov/coronavirus/2019-ncov/about/symptoms.html',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Myth-Busters of coronavirus',
                      style: kTitleTextstyle,
                    ),
                    SizedBox(height: 10),

                    Tile(
                      title: 'COVID-19 virus can be transmitted in areas with hot and humid climates?',
                      textTop: 'From the evidence so far, the COVID-19 virus can be transmitted in ALL AREAS, including areas with hot and humid weather. Regardless of climate, adopt protective measures if you live in, or travel to an area reporting COVID-19. The best way to protect yourself against COVID-19 is by frequently cleaning your hands. By doing this you eliminate viruses that may be on your hands and avoid infection that could occur by then touching your eyes, mouth, and nose.',
                      textBottom: '',
                      url: '',
                    ),
                    Tile(
                      title: 'Cold weather and snow CANNOT kill the new coronavirus',
                      textTop: 'There is no reason to believe that cold weather can kill the new coronavirus or other diseases. The normal human body temperature remains around 36.5°C to 37°C, regardless of the external temperature or weather. The most effective way to protect yourself against the new coronavirus is by frequently cleaning your hands with alcohol-based hand rub or washing them with soap and water.',
                      textBottom: '',
                      url: '',
                    ),
                    Tile(
                      title: 'Taking a hot bath does not prevent the new coronavirus disease',
                      textTop: 'Taking a hot bath will not prevent you from catching COVID-19. Your normal body temperature remains around 36.5°C to 37°C, regardless of the temperature of your bath or shower. Actually, taking a hot bath with extremely hot water can be harmful, as it can burn you. The best way to protect yourself against COVID-19 is by frequently cleaning your hands. By doing this you eliminate viruses that may be on your hands and avoid infection that could occur by then touching your eyes, mouth, and nose.',
                      textBottom: '',
                      url: '',
                    ),
                    Tile(
                      title: 'The new coronavirus CANNOT be transmitted through mosquito bites.',
                      textTop: 'To date there has been no information nor evidence to suggest that the new coronavirus could be transmitted by mosquitoes. The new coronavirus is a respiratory virus which spreads primarily through droplets generated when an infected person coughs or sneezes, or through droplets of saliva or discharge from the nose. To protect yourself, clean your hands frequently with an alcohol-based hand rub or wash them with soap and water. Also, avoid close contact with anyone who is coughing and sneezing.',
                      textBottom: '',
                      url: '',
                    ),
                    Tile(
                      title: 'Are hand dryers effective in killing the new coronavirus?',
                      textTop: 'No. Hand dryers are not effective in killing the 2019-nCoV. To protect yourself against the new coronavirus, you should frequently clean your hands with an alcohol-based hand rub or wash them with soap and water. Once your hands are cleaned, you should dry them thoroughly by using paper towels or a warm air dryer.',
                      textBottom: '',
                      url: '',
                    ),
                    Tile(
                      title: 'Can an ultraviolet disinfection lamp kill the new coronavirus?',
                      textTop: 'UV lamps should not be used to sterilize hands or other areas of skin as UV radiation can cause skin irritation.',
                      textBottom: '',
                      url: '',
                    ),
                    Tile(
                      title: 'How effective are thermal scanners in detecting people infected with the new coronavirus?',
                      textTop: 'Thermal scanners are effective in detecting people who have developed a fever (i.e. have a higher than normal body temperature) because of infection with the new coronavirus.',
                      textBottom: 'However, they cannot detect people who are infected but are not yet sick with fever. This is because it takes between 2 and 10 days before people who are infected become sick and develop a fever.',
                      url: '',
                    ),Tile(
                      title: 'Do vaccines against pneumonia protect you against the new coronavirus?',
                      textTop: 'No. Vaccines against pneumonia, such as pneumococcal vaccine and Haemophilus influenza type B (Hib) vaccine, do not provide protection against the new coronavirus.\n\nThe virus is so new and different that it needs its own vaccine. Researchers are trying to develop a vaccine against 2019-nCoV, and WHO is supporting their efforts.',
                      textBottom: 'Although these vaccines are not effective against 2019-nCoV, vaccination against respiratory illnesses is highly recommended to protect your health.',
                      url: '',
                    ),

                    SizedBox(height: 30),
                    InkWell(
                        child: new Text(
                          'Learn more on who.int',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline
                          )
                        ),
                        onTap: ()=> _launchUrl('https://www.who.int/emergencies/diseases/novel-coronavirus-2019'),
                    ),
                    SizedBox(height: 30,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
Future<void> _launchUrl(String url)async{
  if(await canLaunch(url)){
    await launch(url);
  }else{
    throw 'Could not launch $url';
  }
}
class Tile extends StatelessWidget {
  final String title;
  final String textTop;
  final String textBottom;
  final String url;
  const Tile({
    Key key, this.title, this.textTop, this.textBottom, this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 15),
      child: ExpansionTile(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(title)
        ),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left : 10.0 , right: 10, bottom: 20) ,
            child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(textTop),
                      SizedBox(height: 10,),
                    ],
                  ),
                  textBottom!='' ? Text(textBottom) : Container(),
                  url!='' ? Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          child: Text(
                              'Know more',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline
                              )
                          ),
                          onTap: ()=>_launchUrl(url),
                        ),
                      ),
                    ],
                  ) : Container(),
                ],
              ),
            ),
          ],
      ),
    );
  }
}