Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24BBE7DAE47
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Oct 2023 21:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjJ2Use (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 29 Oct 2023 16:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjJ2Use (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 29 Oct 2023 16:48:34 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52728B6
        for <linux-i2c@vger.kernel.org>; Sun, 29 Oct 2023 13:48:30 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 797EA2C04A8;
        Mon, 30 Oct 2023 09:48:27 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1698612507;
        bh=8Z9b1Snoxo0hPscyxON1lb8MM7cib/HWntGFlyTQ/gE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=TfERxLkH1jtrtSKmNo4Z42uZnDhJj22wQGzShR1ZNG6VjdT1tjpj7732SuVGwm/Ey
         +dgGQ0fqIKQGl7D0F7PdtS+n8PppezKtKkOAhntdckguTU5SIi8AYIVqQ8lqtlgxnP
         yYrf+UHgAAZookMj0HEQbdq9WVavhPaC8fiQ8MDq5rJdcGVghoALRQw1+oy5Shz+kE
         ALWgdtfVGZJB4Z9RyrnLOYOHprlezYq3VUw22vY2Vf806coA+N2Bcd7as5hrpFzOw+
         Cv1OhGa1FXhLCJBUXNqu9bgloeG/RUEUnuSVxLhQ822flPBgBHInrE0dvrI2MN4ZKv
         1xNZF3xmN1yDQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B653ec51b0001>; Mon, 30 Oct 2023 09:48:27 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 30 Oct 2023 09:48:27 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.039; Mon, 30 Oct 2023 09:48:27 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Mark Brown <broonie@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] i2c: mv64xxx: add an optional bus-reset-gpios
 property
Thread-Topic: [PATCH v5 2/2] i2c: mv64xxx: add an optional bus-reset-gpios
 property
Thread-Index: AQHaCIYGLKsizTKN0UyQHbkVO99aL7BcpjeAgAACoICAA762AA==
Date:   Sun, 29 Oct 2023 20:48:26 +0000
Message-ID: <b91223a3-d835-47c0-976b-3ebdfe84d1f8@alliedtelesis.co.nz>
References: <20231027033104.1348921-1-chris.packham@alliedtelesis.co.nz>
 <20231027033104.1348921-3-chris.packham@alliedtelesis.co.nz>
 <65911ec0-e073-435f-846a-c5501dd5d3a9@linaro.org>
 <9eebec9b-e6fd-4a22-89ea-b434f446e061@linaro.org>
In-Reply-To: <9eebec9b-e6fd-4a22-89ea-b434f446e061@linaro.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <84C81A47CF129346A593A2222668C512@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=62ntRvTiAAAA:8 a=g14jhrGyAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=7HETFKRioYfl0xpNTjIA:9 a=QEXdDO2ut3YA:10 a=pToNdpNmrtiFLRE6bQ9Z:22 a=P511sJaWzJIkUf5biGsp:22 a=AjGcO6oz07-iQ99wixmX:22 a=cvBusfyB2V15izCimMoJ:22
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAyOC8xMC8yMyAwMDozNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gMjcv
MTAvMjAyMyAxMzoyNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4+IE9uIDI3LzEwLzIw
MjMgMDU6MzEsIENocmlzIFBhY2toYW0gd3JvdGU6DQo+Pj4gU29tZSBoYXJkd2FyZSBkZXNpZ25z
IGhhdmUgYSBHUElPIHVzZWQgdG8gY29udHJvbCB0aGUgcmVzZXQgb2YgYWxsIHRoZQ0KPj4+IGRl
dmljZXMgb24gYW5kIEkyQyBidXMuIEl0J3Mgbm90IHBvc3NpYmxlIGZvciBldmVyeSBjaGlsZCBu
b2RlIHRvDQo+Pj4gZGVjbGFyZSBhIHJlc2V0LWdwaW9zIHByb3BlcnR5IGFzIG9ubHkgdGhlIGZp
cnN0IGRldmljZSBwcm9iZWQgd291bGQgYmUNCj4+PiBhYmxlIHRvIHN1Y2Nlc3NmdWxseSByZXF1
ZXN0IGl0ICh0aGUgb3RoZXJzIHdpbGwgZ2V0IC1FQlVTWSkuIFJlcHJlc2VudA0KPiBDYzogTWFy
aywNCj4NCj4gQWxzbyB0aGlzIHBhcnQgaXMgbm90IHRydWUuIElmIHRoZSBidXMgaXMgbm9uLWRp
c2NvdmVyYWJsZSwgdGhlbiBpdCBpcw0KPiBwb3NzaWJsZSB0byBoYXZlIHJlc2V0LWdwaW9zIGlu
IGVhY2ggcHJvYmVkIGRldmljZS4gWW91IGNhbiBzaGFyZSBHUElPcywNCj4gc28gbm8gcHJvYmxl
bSB3aXRoIC1FQlVTWSBhdCBhbGwuDQoNCkxhc3QgdGltZSBJIGNoZWNrZWQgeW91IGNvdWxkbid0
IHNoYXJlIEdQSU9zLiBJZiB0aGF0J3Mgbm8gbG9uZ2VyIHRoZSANCmNhc2UgdGhlbiBJIGNhbiBw
cm9iYWJseSBtYWtlIHdoYXQgSSBuZWVkIHRvIGhhcHBlbiB3b3JrLiBJdCBzdGlsbCANCmNyZWF0
ZXMgYW4gaXNzdWUgdGhhdCBJIGhhdmUgbXVsdGlwbGUgUENBOTU0eCBtdXhlcyBjb25uZWN0ZWQg
dG8gYSANCmNvbW1vbiByZXNldCBHUElPIHNvIGFzIGVhY2ggbXV4IGlzIHByb2JlZCB0aGUgUENB
OTU0eCBkcml2ZXIgd2lsbCANCnRvZ2dsZSB0aGUgcmVzZXQuIFRoYXQncyBwcm9iYWJseSBPSyBh
cyB0aGUgUENBOTU0eCBpcyBzdWZmaWNpZW50bHkgDQpzdGF0ZWxlc3MgdGhhdCB0aGUgZXh0cmEg
cmVzZXRzIHdvbid0IGRvIGFueSBoYXJtIGJ1dCBpZiBpdCB3ZXJlIGEgbW9yZSANCmNvbXBsaWNh
dGVkIGRldmljZSB0aGVuIHRoZXJlIHdvdWxkIGJlIGlzc3Vlcy4NCg0KSGF2aW5nIHNvbWUga2lu
ZCBvZiByZWYtY291bnRlZCByZXNldCBjb250cm9sbGVyIHRoYXQgaXMgaW1wbGVtZW50ZWQgDQp3
aXRoIEdQSU9zIGlzIHByb2JhYmx5IHRoZSBiZXR0ZXIgc29sdXRpb24uIEkgd2FzIGtpbmQgb2Yg
c3VycHJpc2VkIHRoYXQgDQpub3RoaW5nIGV4aXN0ZWQgbGlrZSB0aGF0IGluIGRyaXZlcnMvcmVz
ZXQuDQoNCj4gVGhlIHByb2JsZW0gaXMgZG9pbmcgcmVzZXQ6DQo+IDEuIGluIHByb3BlciBtb21l
bnQgZm9yIGFsbCBkZXZpY2VzDQo+IDIuIHdpdGhvdXQgYWZmZWN0aW5nIG90aGVyIGRldmljZXMg
d2hlbiBvbmUgdW5iaW5kcy9yZW1vdmUoKQ0KPg0KPiBUaGUgKDIpIGFib3ZlIGlzIG5vdCBzb2x2
ZWFibGUgZWFzeSBpbiBrZXJuZWwgYW5kIHdlIGFscmVhZHkgaGFkIG5pY2UNCj4gdGFsa3MgYWJv
dXQgaXQganVzdCBmZXcgZGF5cyBhZ286DQo+IDEuIEFwcGxlIGNhc2U6DQo+IGh0dHBzOi8vc2Nh
bm1haWwudHJ1c3R3YXZlLmNvbS8/Yz0yMDk4OCZkPTZxQzc1U0xzLTlQTk0xWkhwTGE2cmVHdjgy
UjZvcEVVbXlJNjJ2Q3l0USZ1PWh0dHBzJTNhJTJmJTJmc29jaWFsJTJldHJlZWhvdXNlJTJlc3lz
dGVtcyUyZiU0MG1hcmNhbiUyZjExMTI2ODc4MDMxMTYzNDE2MA0KPg0KPiAyLiBteSBXU0E4ODR4
Og0KPiBodHRwczovL3NjYW5tYWlsLnRydXN0d2F2ZS5jb20vP2M9MjA5ODgmZD02cUM3NVNMcy05
UE5NMVpIcExhNnJlR3Y4MlI2b3BFVW15SmszcTNqN2cmdT1odHRwcyUzYSUyZiUyZmxvcmUlMmVr
ZXJuZWwlMmVvcmclMmZhbHNhLWRldmVsJTJmODRmOWYxYzQtMDYyNy00OTg2LTgxNjAtYjRhYjk5
NDY5YjgxJTQwbGluYXJvJTJlb3JnJTJmDQpBcG9sb2dpZXMgZm9yIHRoZSBtYW5nbGVkIGxpbmtz
ICh0aGV5J3JlIG1vcmUgc2VjdXJlIG5vdyBhdCBsZWFzdCB0aGF0J3MgDQp3aGF0IG91ciBJUyB0
ZWFtIGhhdmUgYmVlbiBzb2xkKS4NCj4gTGFzdCwNCj4gSSB3b3VsZCBsaWtlIHRvIGFwb2xvZ2l6
ZSB0byB5b3UgQ2hyaXMuIEkgdW5kZXJzdGFuZCB0aGF0IGJyaW5naW5nIHN1Y2gNCj4gZmVlZGJh
Y2sgYXQgdjUgaXMgbm90IHRoYXQgZ29vZC4gSSBoYWQgcGxlbnR5IG9mIHRpbWUgdG8gc2F5IHNv
bWV0aGluZw0KPiBlYXJsaWVyLCBzbyB0aGlzIGlzIG5vdCByZWFsbHkgcHJvZmVzc2lvbmFsIGZy
b20gbXkgc2lkZS4gSSBhbSBzb3JyeSwNCj4ganVzdCBteSBicmFpbiBkaWQgbm90IGNvbm5lY3Qg
YWxsIHRoZXNlIHRvcGljcyB0b2dldGhlci4NCj4NCj4gSSBhcG9sb2dpemUuDQoNCkFjdHVhbGx5
IEkga2luZCBvZiBleHBlY3RlZCB0aGlzIGZlZWRiYWNrLiBJIGZpZ3VyZWQgSSBjb3VsZCBzdGFy
dCB3aXRoIA0KdGhlIGRyaXZlciB0aGF0IGlzIGN1cnJlbnRseSBjYXVzaW5nIG1lIGlzc3VlcyBh
bmQgb25jZSB0aGUgZHQtYmluZGluZyANCndhcyBjb25zaWRlcmVkIGdvb2QgZW5vdWdoIGl0IG1p
Z2h0IG1pZ3JhdGUgdG8gdGhlIGkyYyBjb3JlLg0KDQo+DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6
eXN6dG9mDQo+DQo+Pj4gdGhpcyBraW5kIG9mIGhhcmR3YXJlIGRlc2lnbiBieSBhc3NvY2lhdGlu
ZyB0aGUgYnVzLXJlc2V0LWdwaW9zIHdpdGggdGhlDQo+Pj4gcGFyZW50IEkyQyBidXMuIFRoZSBy
ZXNldCBsaW5lIHdpbGwgYmUgcmVsZWFzZWQgcHJpb3IgdG8gdGhlIGNoaWxkIEkyQw0KPj4+IGRl
dmljZXMgYmVpbmcgcHJvYmVkLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgUGFja2hh
bSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KPj4+IC0tLQ0KPj4+DQo+Pj4g
Tm90ZXM6DQo+Pj4gICAgICBDaGFuZ2VzIGluIHY1Og0KPj4+ICAgICAgLSBSZW5hbWUgcmVzZXQt
Z3Bpb3MgYW5kIHJlc2V0LWR1cmF0aW9uLXVzIHRvIGJ1cy1yZXNldC1ncGlvcyBhbmQNCj4+PiAg
ICAgICAgYnVzLXJlc2V0LWR1cmF0aW9uLXVzIGFzIHJlcXVlc3RlZCBieSBXb2xmcmFtDQo+Pj4g
ICAgICBDaGFuZ2VzIGluIHY0Og0KPj4+ICAgICAgLSBBZGQgbWlzc2luZyBncGlvL2NvbnN1bWVy
LmgNCj4+PiAgICAgIC0gdXNlIGZzbGVlcCgpIGZvciBlbmZvcmNpbmcgcmVzZXQtZHVyYXRpb24N
Cj4+PiAgICAgIENoYW5nZXMgaW4gdjM6DQo+Pj4gICAgICAtIFJlbmFtZSByZXNldC1kZWxheSB0
byByZXNldC1kdXJhdGlvbg0KPj4+ICAgICAgLSBVc2UgcmVzZXQtZHVyYXRpb24tdXMgcHJvcGVy
dHkgdG8gY29udHJvbCB0aGUgcmVzZXQgcHVsc2UgcmF0aGVyIHRoYW4NCj4+PiAgICAgICAgZGVs
YXlpbmcgYWZ0ZXIgdGhlIHJlc2V0DQo+Pj4gICAgICBDaGFuZ2VzIGluIHYyOg0KPj4+ICAgICAg
LSBBZGQgYSBwcm9wZXJ0eSB0byBjb3ZlciB0aGUgbGVuZ3RoIG9mIGRlbGF5IGFmdGVyIHJlbGVh
c2luZyB0aGUgcmVzZXQNCj4+PiAgICAgICAgR1BJTw0KPj4+ICAgICAgLSBVc2UgZGV2X2Vycl9w
cm9iZSgpIHdoZW4gcmVxdWVzaW5nIHRoZSBHUElPIGZhaWxzDQo+Pj4NCj4+PiAgIGRyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtbXY2NHh4eC5jIHwgMTYgKysrKysrKysrKysrKysrKw0KPj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLW12NjR4eHguYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXY2
NHh4eC5jDQo+Pj4gaW5kZXggZWZkMjhiYmVjZjYxLi42ZTI3NjJkMjJlNWEgMTAwNjQ0DQo+Pj4g
LS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdjY0eHh4LmMNCj4+PiArKysgYi9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLW12NjR4eHguYw0KPj4+IEBAIC0xMyw2ICsxMyw3IEBADQo+Pj4gICAj
aW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPj4+ICAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0K
Pj4+ICAgI2luY2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+DQo+Pj4gKyNpbmNsdWRlIDxsaW51eC9n
cGlvL2NvbnN1bWVyLmg+DQo+Pj4gICAjaW5jbHVkZSA8bGludXgvaTJjLmg+DQo+Pj4gICAjaW5j
bHVkZSA8bGludXgvaW50ZXJydXB0Lmg+DQo+Pj4gICAjaW5jbHVkZSA8bGludXgvbXY2NDN4eF9p
MmMuaD4NCj4+PiBAQCAtMTYwLDYgKzE2MSw3IEBAIHN0cnVjdCBtdjY0eHh4X2kyY19kYXRhIHsN
Cj4+PiAgIAlib29sCQkJY2xrX25fYmFzZV8wOw0KPj4+ICAgCXN0cnVjdCBpMmNfYnVzX3JlY292
ZXJ5X2luZm8JcmluZm87DQo+Pj4gICAJYm9vbAkJCWF0b21pYzsNCj4+PiArCXN0cnVjdCBncGlv
X2Rlc2MJKnJlc2V0X2dwaW87DQo+Pj4gICB9Ow0KPj4+ICAgDQo+Pj4gICBzdGF0aWMgc3RydWN0
IG12NjR4eHhfaTJjX3JlZ3MgbXY2NHh4eF9pMmNfcmVnc19tdjY0eHh4ID0gew0KPj4+IEBAIC0x
MDM2LDYgKzEwMzgsNyBAQCBtdjY0eHh4X2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZCkNCj4+PiAgIAlzdHJ1Y3QgbXY2NHh4eF9pMmNfZGF0YQkJKmRydl9kYXRhOw0KPj4+ICAg
CXN0cnVjdCBtdjY0eHh4X2kyY19wZGF0YQkqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKCZwZC0+
ZGV2KTsNCj4+PiAgIAlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4+PiArCXUzMglyZXNldF9kdXJh
dGlvbjsNCj4+PiAgIAlpbnQJcmM7DQo+Pj4gICANCj4+PiAgIAlpZiAoKCFwZGF0YSAmJiAhcGQt
PmRldi5vZl9ub2RlKSkNCj4+PiBAQCAtMTA4Myw2ICsxMDg2LDE0IEBAIG12NjR4eHhfaTJjX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkKQ0KPj4+ICAgCWlmIChkcnZfZGF0YS0+aXJx
IDwgMCkNCj4+PiAgIAkJcmV0dXJuIGRydl9kYXRhLT5pcnE7DQo+Pj4gICANCj4+PiArCWRydl9k
YXRhLT5yZXNldF9ncGlvID0gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoJnBkLT5kZXYsICJidXMt
cmVzZXQiLCBHUElPRF9PVVRfSElHSCk7DQo+Pj4gKwlpZiAoSVNfRVJSKGRydl9kYXRhLT5yZXNl
dF9ncGlvKSkNCj4+PiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGQtPmRldiwgUFRSX0VSUihk
cnZfZGF0YS0+cmVzZXRfZ3BpbyksDQo+Pj4gKwkJCQkgICAgICJDYW5ub3QgZ2V0IHJlc2V0IGdw
aW9cbiIpOw0KPj4+ICsJcmMgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF91MzIoJnBkLT5kZXYsICJi
dXMtcmVzZXQtZHVyYXRpb24tdXMiLCAmcmVzZXRfZHVyYXRpb24pOw0KPj4+ICsJaWYgKHJjKQ0K
Pj4+ICsJCXJlc2V0X2R1cmF0aW9uID0gMTsNCj4+IE5vLCB0aGlzIHNob3VsZCBiZSBzb2x2ZWQg
YnkgY29yZSAtIGZvciBlbnRpcmUgSTJDIGF0IG1pbmltdW0uIFRoaXMgaXMNCj4+IG5vdCBzcGVj
aWZpYyB0byB0aGlzIGRldmljZS4=
