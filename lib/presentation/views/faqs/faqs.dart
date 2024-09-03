import 'package:auraq_bulk_calculator/presentation/views/intro_screen/intro_screen.dart';
import 'package:flutter/material.dart';

import '../bottom_navigation_bar/bottom_navigation_bar.dart';



class FAQScreen extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'Q': 'What is Auraq and when was it established?',
      'A': "Auraq Publications is a well-functional self-publishing platform based in Pakistan which was founded in 2018 in the hope of reviving the Authorhood in Pakistan. Our aim is to facilitate writers in getting their words out there. Auraq Publications is more ‘author-centric’ irrespective from others and providing end-to-end complete set of professional and quality set of services required for publishing the book. We believe in creativity of a writer that can contribute in upbringing and enriching the society."
  "In the last year, more than hundred local and international authors have published their books with Auraq including their second and third book with us. We are really obliged and honored to have trust and faith from the authors and we will continue serving with the quality service to the community."
    },
    {
      'Q': 'How can I self publish my book with Auraq?',
      'A': "Self-publishing your book with Auraq is really simple and convenient. Once you are done with writing of your book manuscript, you register as an author at Auraq, share your content for editorial review which may take two to three weeks. Once reviewed, the publishing agreement and cost details will be shared. We take it from here and proceed for final publishing step and printing of copies. Once published, Author has a choice to sell his/her book through Auraq and other online or offline bookstores."
    },
    {
      'Q': 'How POD (Print-On-Demand) works at Auraq?',
      'A': "Print-on-Demand (POD) is a popular way of publishing a book with no copies printed in advance. Your book gets published and goes on our website for online sale. Customer can place order all over the country, once order is confirmed, we print the copy(s) and dispatch. The production and dispatch process may takes two to four working days at max. Author gets his/her royalty as decided in the agreement.\n"
   "Auraq may print a few copies for its own record or offline display, with the quantity of 10 or around."
    },
    {
      'Q': 'What is the minimum number of copies I can get published with Auraq?',
      'A':  "At Auraq, you can get published a minimum of one copy under the POD service. However, in the beginning, the author has to buy first thirty copies or generate equivalent pre-orders. There is no restriction of minimum copies after that."
    },
    {
      'Q': 'How much does it cost to get published with Auraq?',
      'A':  "The cost varies on the basis of different factors like the number of pages, paper’s quality, binding type, number of copies to be printed, and the book size. Author is informed prior in the agreement of all the relevant details including total cost."
    },
    {
      'Q': 'Is there any registration fee?',
      'A': "There are one time nominal author registration charges which have to be paid at the time of publishing the book. Author gets the following for free:\n"
    "Social Media poster of the book\n"
          "Basic social media marketing\n"
    "Sharing on Facebook/ Instagram etc\n"
    "Author Dashboard Access\n"
    "Dedicated page for book to sell\n"
    "Dedicated page for Author profile"
    },

    {
      'Q': 'How long does it take to get the book published at Auraq?',
      'A': "For printing of copies over POD model, it may take 18 working days or more. With Bulk Printing model, it may take 21 working days or more. Please note that this period does not include the time required for editorial review or editorial work"
    },
    {
      'Q': 'Does Auraq market the Book?',
      'A': 'Book publishing is a process which is incomplete even after printing of copies if there is no marketing involve. Auraq helps author market her/his book with bookstores and digitally over social media. However, the marketing strategy depends upon the publishing model.'
    },
    {
      'Q': 'Does Auraq offer distribution to local Bookstores?',
      'A':  'Auraq markets online and offline booksellers, including distribution to local bookstores in major cities of Pakistan. Kindly note that this distribution is available with bulk printing model only.'
    },

    {
      'Q': 'What is ISBN?',
      'A': "The International Standard Book Number (ISBN) is a numeric commercial book identifier which is intended to be unique for every edition of each book and is consist of thirteen digits. Publishers get/purchase ISBNs from an affiliate of the International ISBN Agency. The method of assigning an ISBN is nation-specific and varies between countries."
          "An ISBN is assigned to each separate edition and variation (except reprints) of a publication. For example, an e-book, a paperback and a hardcover edition of the same book will each have a different ISBN.",
    },

    {
      'Q': 'Does Auraq provide ISBN?',
      'A': "As Auraq Publications is a registered publishing house with the ISBN agency—holding publisher number 7868 and 749 in Pakistan, it acquires and assigns ISBN to all its books."

    },
    {
      'Q': 'How owns the intellectual rights of the book published at Auraq?',
      'A': 'We respect authors and value their work. The intellectual rights of the book remain with the author in self-publishing model. Auraq only holds the right to publish, sell and distribute the agreed edition of the book.',
    },

    {
      'Q': 'How is the printing quality at Auraq?',
      'A': "Auraq takes pride in its printing quality, which is becoming the rare trait in the publishing landscape in Pakistan. We prefer the author’s choice, but normally, we use imported white or cream color book paper for inside printing and 300 gram art card laminated for paperback cover with perfect binding. The final product meets the expectations of the readers as well as the authors.",
    },
    {
      'Q': 'How do I keep track of the sales of my book?',
      'A': "Auraq has introduced the author’s Dashboard, where you can login and see the real-time book-selling report with some handy details as well like royalty, total number of copies ordered, details of the buyer, and the order’s status."
    },
    {
      'Q': 'Which genres are easier to published with Auraq?',
      'A': "Auraq is open to publishing books in all genres and categories as long as their content is worth publishing and meets our standard guidelines."
    },
    {
      'Q': 'How much royalty does Auraq offers?',
      'A': "Royalty division is different for both models, POD and Bulk Printing model.\n"
    "-In the POD model, author gets 60% royalty out of profit on each sold copy.\n"
          "-In the Bulk Printing Model, author gets 70% of the whole selling price as royalty/profit back if book gets sold through Auraq Online store directly.\n"
    "The royalty details are mentioned as part of the agreement with the author in the beginning of proceeds."
    },
    {
      'Q': 'Does Auraq help the Author in publishing the book on Amazon.com?',
      'A':  'Auraq helps the authors to make their book available on the world’s biggest marketplace, Amazon.com. As per Amazon’s policy, only English books are eligible to display on the platform for both Kindle and Paperback versions.'
    },
    {
      'Q': 'Does Auraq deliver Overseas?',
      'A': "Auraq delivers books all over the world via the best courier companies including FedEx and DHL. For international buyers, the COD (Cash on Delivery) facility is not available. They can order their required book by advance payment or direct bank transfer."
    },

    {
      'Q': 'What delivery options are available for the book buyers with Auraq?',
      'A': 'Auraq delivers the books under the Cash on Delivery (COD) payment method. For speedy delivery, we dispatch the books via some of the best courier companies in the town. We also accept advance cash or direct bank transfer.',
    },
    {
      'Q': 'How many Authors and Books Auraq has published so far?',
      'A': "Auraq has published 250+ books and 250+ authors so far and this number is continuously publishing increasing as new authors and books are being published every month with diverse content and genre."
    },
    {
      'Q': 'Is my work safe with Auraq?',
      'A': "Your work is completely safe with Auraq. Once you submit your work, we take care of its privacy and ensure that it is never presented anywhere without your permission. If you submit your work for review, but do not proceed publishing with Auraq later for some reason, we never use it anywhere and return it as is."
    }


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('FAQs', style: TextStyle(color: Colors.white,
        fontSize: 22, fontWeight: FontWeight.w600),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context ) => NavigationScreen()));
        }, icon: Icon(Icons.arrow_back,color: Colors.white,
        size: 26,)),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              if (index == 0)
                Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 4),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(width: 0.5, color: Colors.black),
                        ),
                        child: Image.asset(
                          'assets/images/logo_two-removebg-preview.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    )),
              ExpansionTile(
                title: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(faqs[index]['Q']!, style: TextStyle(color: Colors.white,
                  fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.justify,),
                ),
           trailing: Icon(Icons.keyboard_arrow_down,color: Colors.black, size: 27,),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text(faqs[index]['A']!, style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500,color: Colors.black),
                      textAlign: TextAlign.justify,),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}



