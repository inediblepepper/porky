<%--
Copyright (c) 2013, salesforce.com, inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided
that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the
following disclaimer.

Redistributions in binary form must reproduce the above copyright notice, this list of conditions and
the following disclaimer in the documentation and/or other materials provided with the distribution.

Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or
promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
--%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Force.com Canvas Java Quick Start</title>
        <link rel="stylesheet" type="text/css" href="/Publisher/publisher${ua.device.mobile ? '-mobile':'-desktop'}.css"/>
        <script type="text/javascript" src="/scripts/json2.js"></script>
        <script type="text/javascript" src="/sdk/js/canvas-all.js"></script>
        <script type="text/javascript" src="/Publisher/publisher.js"></script>
        <script>
            if (self === top) { alert("This canvas app must be included within an iframe"); }

            Sfdc.canvas(function() {
                var sr = JSON.parse('${canvasRequestJson}');
                myPublisher.init(sr, ${ua.device.mobile});
                var handlers = myPublisher.handlers();
                Sfdc.canvas.client.subscribe(sr.client, handlers.subscriptions);
                myPublisher.updateContent();
            });
        </script>
    </head>
    <body>
    <div id="publisher">
        <div id="publisher-content">
            <div id="publisher-canvas-content">
                <table width='100%'>
                    <tr>
                        <td width="20%"><b>Add namespace: </b><span id='name'></span></td>
                        <td width="50%"><input style="width:90%;" id="namespace" type="text"/></td>
                        <td width="*"><input onclick="myPublisher.addNamespace(document.getElementById('namespace').value);" type="submit" value="Add"/></td>
                    </tr>
                    <tr>
                        <td colspan="3"><span id="namespaces"></span></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    </body>
 </html>
