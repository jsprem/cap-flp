sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ragcontracts/ui/test/integration/FirstJourney',
		'ragcontracts/ui/test/integration/pages/ConversationMain'
    ],
    function(JourneyRunner, opaJourney, ConversationMain) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ragcontracts/ui') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheConversationMain: ConversationMain
                }
            },
            opaJourney.run
        );
    }
);