define([
        "dojo/_base/declare",
        "ecm/widget/dialog/BaseDialog",
        "dojo/aspect",
        "icm/model/properties/controller/ControllerManager",
        "dijit/form/Button",
        "dojo/json",
        "ecm/model/Request",
        "dijit/_TemplatedMixin",
        "dojo/_base/array", 
        "dojo/dom-construct", 
        "dojo/parser", 
        "dojo/dom",
        "dojo/dom-attr",
        "dijit/registry",
        "dojo/_base/lang",
        "dojo/request/xhr",
        "dijit/form/Textarea",
        "dijit/form/TextBox",
        "dojo/on",
        "dojo/text!./templates/WatsonChat.html"
        ],
        function(declare, BaseDialog,aspect,ControllerManager,Button,json,Request,_TemplatedMixin,array,domConstruct, 
                parser,dom,domAttr,registry,lang,xhr,Textarea,TextBox,on,template){
    
          return declare("watsonICNPluginDojo.WatsonChat", [BaseDialog], {
                contentString: template,
                widgetsInTemplate: true,
                sessionId:null,
                input:"",
                rootContext:null,
                obj:null,
                prefix:null,
                layout:null,
                setFunctionCb: function() {
                    this.show();
                },
                
                postCreate: function() {
                    console.log("inside post create ProcessingNotes");
                    this.inherited(arguments);
                    this.setTitle("Watson Chat");
                    this.setSize("500","400");
                    this.okButton = this.addButton("Add", "_okClick", false, true);
                    aspect.after(this.cancelButton,"cancel",this.onCancel);
                    okButtonid=this.okButton.id;
                    this.invokeWatson(this.input);
                    
                    /*dojo.connect('onKeyPress', this, function(eventObj){
                        
                        if(eventObj.keyCode==dojo.keys.ENTER){

                            this._okClick();
                        }
                    });*/
                },
                enablebutton:function()
                {
                    var notes =this.textarea.textbox.value;
                    if(notes.trim()!=null && notes.trim()!="")
                        {
                            registry.byId(okButtonid).set("disabled", false); 
                        }
                    else
                        {
                            registry.byId(okButtonid).set("disabled", true); 
                        }
                    
                },
                _okClick: function() {
                    
                    
                    this.input = document.getElementById("mesbox").value;
                    console.log(this.input);
                    this.layout = dom.byId("layout"),
                    console.log("layout:",this.layout);
                    domConstruct.create("li", {
                        innerHTML: this.input
                    }, this.layout);
                    this.invokeWatson(this.input);
                    document.getElementById("mesbox").value="";
                },
                
                _enterClick:function(){
                    console.log("this:",this);
                    var self = this;
                    //console.log("e:",this.event);
                    console.log("id:",document.getElementById("mesbox"));
                    var id = document.getElementById("mesbox");
                    id.addEventListener("keypress", function(event) {
                        console.log("event:",event);
                        if (event.keyCode === 13) {
                            event.preventDefault();
                            self._okClick();
                            
                        }
                    })
                    
                },
                
                invokeWatson:function(input){
                    console.log("invoke watson");
                    var self = this;
                    var response = null;
                    var serviceParams = new Object();
                    serviceParams.type =input
                    serviceParams.sessionId=self.sessionId
                    console.log("sessionId11:",self.sessionId);
                    Request.invokePluginService("WatsonICNPlugin", "WatsonAssistantService",
                    {
                        requestParams: serviceParams,
                        requestCompleteCallback: function(response) {
                            console.log("Watson response:",response);
                            console.log("Watson OutPut:" ,response.watsonAssistantResponse.watsonOutput);
                            if(response.watsonAssistantResponse!=null){
                                self.sessionId = response.watsonAssistantResponse.sessionId;
                                console.log("sessionId2222:",self.sessionId);
                                self.layout = dom.byId("layout"),
                                console.log("layout:",self.layout);
                                domConstruct.create("li", {
                                    innerHTML: response.watsonAssistantResponse.watsonOutput
                                }, self.layout);
                                
                            }
                        }
                            
                    });
                },
                formatAMPM:function(date) {
                    var hours = date.getHours();
                    var minutes = date.getMinutes();
                    var ampm = hours >= 12 ? 'PM' : 'AM';
                    hours = hours % 12;
                    hours = hours ? hours : 12; // the hour '0' should be '12'
                    minutes = minutes < 10 ? '0'+minutes : minutes;
                    var strTime = hours + ':' + minutes + ' ' + ampm;
                    return strTime;
                },    
                onCancel: function() {
                    this.inherited(arguments);
                    this.layout = dom.byId("layout"),
                    domConstruct.destroy(this.layout);
                    console.log("layout2:",this.layout);
                    registry.byId("mesbox").destroy();
                    //registry.byId("layout").destroy();
                    this.hide();
                },
                
            LimitCharacters:function() {
                    var CharLength = 32;
                    var chars = this.textarea.textbox.value.length;
                    console.log("chars:",chars);
                    document.getElementById("lblcount").value = CharLength - chars;
                    if (chars > CharLength) {
                     this.textarea.textbox.value = this.textarea.textbox.value.substring(0, CharLength);
                    }
                    },
          });
});
