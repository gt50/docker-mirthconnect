Build the image and run with the following command:

     docker run -p 80:80 -p 443:443  IMAGE_NAME

You can launch Mirth Connect Administrator by visiting DOCKER_IP:80

The default username and password are admin/admin

To test that this is working, you'll need a tool like [HL7 Inspector](http://sourceforge.net/projects/hl7inspector/)

Download some [sample HL7 messages](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=228)

Highlight the message and click Send. You should see an Acknowledge message in the pane below and the message statistics should increase in Mirth Connect Administrator.
