Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83824346B8A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Mar 2021 23:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233861AbhCWV7y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 17:59:54 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:39795 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233745AbhCWV7Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Mar 2021 17:59:25 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A9F0C891AE;
        Wed, 24 Mar 2021 10:59:21 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1616536761;
        bh=KXFJzTCEEU9ooEHG4AudfMxqH0UoVK2WULoHOBu0SVc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=hUH7IsOzPmLADIF8F+vmfjtnR69M5dWbDD/DAWLid8M6ulgqQnkOc+YCL3Pw+NOxO
         W1CcsKKrAsLT2xc+5KXPNzMOqolXELArf2VFa8d1ICi6HzkcTvFpDfV8myi7DbLoPH
         00kZ3fs24gbuEnXEJ55/Nq904GcoXtJ6TKnAxMWJS0afsGKXjo0ChVm1oJCina/R2d
         NGnFE2j4b44lB2r3lALO1CVrQJPzgQ7WP0pZH6cmvTXKTaYDQWH60dytX8oiUeVpWe
         GhPShF3e25ClTDZbv9ES5Tk0/4OW0PVBZyA4vLLbQTTqKZokigMqd3ifmYxYlYui3E
         SJyebJ5XplNSA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B605a64b90001>; Wed, 24 Mar 2021 10:59:21 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Mar 2021 10:59:21 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Wed, 24 Mar 2021 10:59:21 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Rob Herring <robh@kernel.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: i2c: convert i2c-mpc to json-schema
Thread-Topic: [PATCH 2/6] dt-bindings: i2c: convert i2c-mpc to json-schema
Thread-Index: AQHXH5233LnDPck5U0iG88OvYj8e5KqROi+AgAAMNQA=
Date:   Tue, 23 Mar 2021 21:59:20 +0000
Message-ID: <7ef36459-e23a-64cd-e9e1-35fb6cb9279f@alliedtelesis.co.nz>
References: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
 <20210323043331.21878-3-chris.packham@alliedtelesis.co.nz>
 <20210323211539.GB1326908@robh.at.kernel.org>
In-Reply-To: <20210323211539.GB1326908@robh.at.kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB96A31485C4B941886FA200558A585B@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=gEfo2CItAAAA:8 a=yy5SKl-CvM2IK4jwSdsA:9 a=2XrlHcXFCxPTNuKk:21 a=SjIi7tvBV1ydmtH_:21 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=RBBcRewTFc8P4JkPnay6:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAyNC8wMy8yMSAxMDoxNSBhbSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIFR1ZSwgTWFy
IDIzLCAyMDIxIGF0IDA1OjMzOjI3UE0gKzEzMDAsIENocmlzIFBhY2toYW0gd3JvdGU6DQo+PiBD
b252ZXJ0IGkyYy1tcGMgdG8gWUFNTC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQYWNr
aGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+PiAtLS0NCj4+ICAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tcGMudHh0ICAgICAgIHwgNjIgLS0tLS0tLS0t
LS0tDQo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXBjLnlhbWwgICAgICB8
IDk5ICsrKysrKysrKysrKysrKysrKysNCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA5OSBpbnNlcnRp
b25zKCspLCA2MiBkZWxldGlvbnMoLSkNCj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW1wYy50eHQNCj4+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW1wYy55
YW1sDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pMmMvaTJjLW1wYy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJj
L2kyYy1tcGMudHh0DQo+PiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IGIxNWFj
YjQzZDg0ZC4uMDAwMDAwMDAwMDAwDQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvaTJjL2kyYy1tcGMudHh0DQo+PiArKysgL2Rldi9udWxsDQo+PiBAQCAtMSw2MiAr
MCwwIEBADQo+PiAtKiBJMkMNCj4+IC0NCj4+IC1SZXF1aXJlZCBwcm9wZXJ0aWVzIDoNCj4+IC0N
Cj4+IC0gLSByZWcgOiBPZmZzZXQgYW5kIGxlbmd0aCBvZiB0aGUgcmVnaXN0ZXIgc2V0IGZvciB0
aGUgZGV2aWNlDQo+PiAtIC0gY29tcGF0aWJsZSA6IHNob3VsZCBiZSAiZnNsLENISVAtaTJjIiB3
aGVyZSBDSElQIGlzIHRoZSBuYW1lIG9mIGENCj4+IC0gICBjb21wYXRpYmxlIHByb2Nlc3Nvciwg
ZS5nLiBtcGM4MzEzLCBtcGM4NTQzLCBtcGM4NTQ0LCBtcGM1MTIxLA0KPj4gLSAgIG1wYzUyMDAg
b3IgbXBjNTIwMGIuIEZvciB0aGUgbXBjNTEyMSwgYW4gYWRkaXRpb25hbCBub2RlDQo+PiAtICAg
ImZzbCxtcGM1MTIxLWkyYy1jdHJsIiBpcyByZXF1aXJlZCBhcyBzaG93biBpbiB0aGUgZXhhbXBs
ZSBiZWxvdy4NCj4+IC0gLSBpbnRlcnJ1cHRzIDogPGEgYj4gd2hlcmUgYSBpcyB0aGUgaW50ZXJy
dXB0IG51bWJlciBhbmQgYiBpcyBhDQo+PiAtICAgZmllbGQgdGhhdCByZXByZXNlbnRzIGFuIGVu
Y29kaW5nIG9mIHRoZSBzZW5zZSBhbmQgbGV2ZWwNCj4+IC0gICBpbmZvcm1hdGlvbiBmb3IgdGhl
IGludGVycnVwdC4gIFRoaXMgc2hvdWxkIGJlIGVuY29kZWQgYmFzZWQgb24NCj4+IC0gICB0aGUg
aW5mb3JtYXRpb24gaW4gc2VjdGlvbiAyKSBkZXBlbmRpbmcgb24gdGhlIHR5cGUgb2YgaW50ZXJy
dXB0DQo+PiAtICAgY29udHJvbGxlciB5b3UgaGF2ZS4NCj4+IC0NCj4+IC1SZWNvbW1lbmRlZCBw
cm9wZXJ0aWVzIDoNCj4+IC0NCj4+IC0gLSBmc2wscHJlc2VydmUtY2xvY2tpbmcgOiBib29sZWFu
OyBpZiBkZWZpbmVkLCB0aGUgY2xvY2sgc2V0dGluZ3MNCj4+IC0gICBmcm9tIHRoZSBib290bG9h
ZGVyIGFyZSBwcmVzZXJ2ZWQgKG5vdCB0b3VjaGVkKS4NCj4+IC0gLSBjbG9jay1mcmVxdWVuY3kg
OiBkZXNpcmVkIEkyQyBidXMgY2xvY2sgZnJlcXVlbmN5IGluIEh6Lg0KPj4gLSAtIGZzbCx0aW1l
b3V0IDogSTJDIGJ1cyB0aW1lb3V0IGluIG1pY3Jvc2Vjb25kcy4NCj4+IC0NCj4+IC1FeGFtcGxl
cyA6DQo+PiAtDQo+PiAtCS8qIE1QQzUxMjEgYmFzZWQgYm9hcmQgKi8NCj4+IC0JaTJjQDE3NDAg
ew0KPj4gLQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+PiAtCQkjc2l6ZS1jZWxscyA9IDwwPjsN
Cj4+IC0JCWNvbXBhdGlibGUgPSAiZnNsLG1wYzUxMjEtaTJjIiwgImZzbC1pMmMiOw0KPj4gLQkJ
cmVnID0gPDB4MTc0MCAweDIwPjsNCj4+IC0JCWludGVycnVwdHMgPSA8MTEgMHg4PjsNCj4+IC0J
CWludGVycnVwdC1wYXJlbnQgPSA8JmlwaWM+Ow0KPj4gLQkJY2xvY2stZnJlcXVlbmN5ID0gPDEw
MDAwMD47DQo+PiAtCX07DQo+PiAtDQo+PiAtCWkyY2NvbnRyb2xAMTc2MCB7DQo+PiAtCQljb21w
YXRpYmxlID0gImZzbCxtcGM1MTIxLWkyYy1jdHJsIjsNCj4+IC0JCXJlZyA9IDwweDE3NjAgMHg4
PjsNCj4+IC0JfTsNCj4+IC0NCj4+IC0JLyogTVBDNTIwMEIgYmFzZWQgYm9hcmQgKi8NCj4+IC0J
aTJjQDNkMDAgew0KPj4gLQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+PiAtCQkjc2l6ZS1jZWxs
cyA9IDwwPjsNCj4+IC0JCWNvbXBhdGlibGUgPSAiZnNsLG1wYzUyMDBiLWkyYyIsImZzbCxtcGM1
MjAwLWkyYyIsImZzbC1pMmMiOw0KPj4gLQkJcmVnID0gPDB4M2QwMCAweDQwPjsNCj4+IC0JCWlu
dGVycnVwdHMgPSA8MiAxNSAwPjsNCj4+IC0JCWludGVycnVwdC1wYXJlbnQgPSA8Jm1wYzUyMDBf
cGljPjsNCj4+IC0JCWZzbCxwcmVzZXJ2ZS1jbG9ja2luZzsNCj4+IC0JfTsNCj4+IC0NCj4+IC0J
LyogTVBDODU0NCBiYXNlIGJvYXJkICovDQo+PiAtCWkyY0AzMTAwIHsNCj4+IC0JCSNhZGRyZXNz
LWNlbGxzID0gPDE+Ow0KPj4gLQkJI3NpemUtY2VsbHMgPSA8MD47DQo+PiAtCQljb21wYXRpYmxl
ID0gImZzbCxtcGM4NTQ0LWkyYyIsICJmc2wtaTJjIjsNCj4+IC0JCXJlZyA9IDwweDMxMDAgMHgx
MDA+Ow0KPj4gLQkJaW50ZXJydXB0cyA9IDw0MyAyPjsNCj4+IC0JCWludGVycnVwdC1wYXJlbnQg
PSA8Jm1waWM+Ow0KPj4gLQkJY2xvY2stZnJlcXVlbmN5ID0gPDQwMDAwMD47DQo+PiAtCQlmc2ws
dGltZW91dCA9IDwxMDAwMD47DQo+PiAtCX07DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXBjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tcGMueWFtbA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uOTdjZWE4YTgxN2VhDQo+PiAtLS0gL2Rldi9udWxs
DQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tcGMu
eWFtbA0KPj4gQEAgLTAsMCArMSw5OSBAQA0KPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPj4gKyVZQU1MIDEuMg0KPj4gKy0tLQ0K
Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvaTJjL2kyYy1tcGMueWFtbCMN
Cj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMNCj4+ICsNCj4+ICt0aXRsZTogSTJDLUJ1cyBhZGFwdGVyIGZvciBNUEM4MjR4LzgzeHgvODV4
eC84Nnh4LzUxMngvNTJ4eCBTb0NzDQo+PiArDQo+PiArbWFpbnRhaW5lcnM6DQo+PiArICAtIENo
cmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4+ICsNCj4+
ICthbGxPZjoNCj4+ICsgIC0gJHJlZjogL3NjaGVtYXMvaTJjL2kyYy1jb250cm9sbGVyLnlhbWwj
DQo+PiArDQo+PiArcHJvcGVydGllczoNCj4+ICsgIGNvbXBhdGlibGU6DQo+PiArICAgIGFueU9m
Og0KPj4gKyAgICAgIC0gaXRlbXM6DQo+PiArICAgICAgICAtIGVudW06DQo+PiArICAgICAgICAg
IC0gbXBjNTIwMC1pMmMNCj4+ICsgICAgICAgICAgLSBmc2wsbXBjNTIwMGItaTJjDQo+PiArICAg
ICAgICAgIC0gZnNsLG1wYzUyMDAtaTJjDQo+PiArICAgICAgICAgIC0gZnNsLG1wYzUxMjEtaTJj
DQo+PiArICAgICAgICAgIC0gZnNsLG1wYzgzMTMtaTJjDQo+PiArICAgICAgICAgIC0gZnNsLG1w
Yzg1NDMtaTJjDQo+PiArICAgICAgICAgIC0gZnNsLG1wYzg1NDQtaTJjDQo+PiArDQo+PiArICAg
ICAgICAtIGNvbnN0OiBmc2wtaTJjDQo+PiArDQo+PiArICAgICAgLSBjb250YWluczoNCj4+ICsg
ICAgICAgICAgY29uc3Q6IGZzbC1pMmMNCj4+ICsgICAgICAgIG1pbkl0ZW1zOiAxDQo+PiArICAg
ICAgICBtYXhJdGVtczogNA0KPiBDYW4ndCB3ZSBkcm9wIHRoaXMgYW5kIGxpc3Qgb3V0IGFueSBv
dGhlciBjb21wYXRpYmxlcz8NCg0KSSdtIHN0cnVnZ2xpbmcgYSBsaXR0bGUgYml0IHdpdGggaG93
IHRvIGdldCB0aGUgc2NoZW1hIHJpZ2h0IHRvIGFsbG93IA0Kb25lIG9yIG1vcmUgb2YgYSBzZXQg
b2YgY29tcGF0aWJsZSB2YWx1ZXMuDQoNCkJhc2ljYWxseSBJIHdhbnQgdG8gYWxsb3cgJ2NvbXBh
dGlibGUgPSAiZnNsLWkyYyI7JyBvciAnY29tcGF0aWJsZSA9IA0KImZzbCxtcGM4NTQ0LWkyYyIs
ICJmc2wtaTJjIjsnIGJ1dCBkaXNhbGxvdyAnY29tcGF0aWJsZSA9ICJmb29iYXIiLCANCiJmc2wt
aTJjIjsnDQoNCj4+ICsNCj4+ICsgIHJlZzoNCj4+ICsgICAgbWF4SXRlbXM6IDENCj4+ICsNCj4+
ICsgIGludGVycnVwdHM6DQo+PiArICAgIG1heEl0ZW1zOiAxDQo+PiArDQo+PiArICBmc2wscHJl
c2VydmUtY2xvY2tpbmc6DQo+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL2ZsYWcNCj4+ICsgICAgZGVzY3JpcHRpb246IHwNCj4+ICsgICAgICBpZiBkZWZpbmVk
LCB0aGUgY2xvY2sgc2V0dGluZ3MgZnJvbSB0aGUgYm9vdGxvYWRlciBhcmUNCj4+ICsgICAgICBw
cmVzZXJ2ZWQgKG5vdCB0b3VjaGVkKQ0KPj4gKw0KPj4gKyAgZnNsLHRpbWVvdXQ6DQo+PiArICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPj4gKyAgICBk
ZXNjcmlwdGlvbjogfA0KPj4gKyAgICAgIEkyQyBidXMgdGltZW91dCBpbiBtaWNyb3NlY29uZHMN
Cj4+ICsNCj4+ICtyZXF1aXJlZDoNCj4+ICsgIC0gY29tcGF0aWJsZQ0KPj4gKyAgLSByZWcNCj4+
ICsgIC0gaW50ZXJydXB0cw0KPj4gKw0KPj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UN
Cj4+ICsNCj4+ICtleGFtcGxlczoNCj4+ICsgIC0gfA0KPj4gKyAgICAvKiBNUEM1MTIxIGJhc2Vk
IGJvYXJkICovDQo+PiArICAgIGkyY0AxNzQwIHsNCj4+ICsgICAgICAgICNhZGRyZXNzLWNlbGxz
ID0gPDE+Ow0KPj4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+PiArICAgICAgICBjb21w
YXRpYmxlID0gImZzbCxtcGM1MTIxLWkyYyIsICJmc2wtaTJjIjsNCj4+ICsgICAgICAgIHJlZyA9
IDwweDE3NDAgMHgyMD47DQo+PiArICAgICAgICBpbnRlcnJ1cHRzID0gPDExIDB4OD47DQo+PiAr
ICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZpcGljPjsNCj4+ICsgICAgICAgIGNsb2NrLWZy
ZXF1ZW5jeSA9IDwxMDAwMDA+Ow0KPj4gKyAgICB9Ow0KPj4gKw0KPj4gKyAgICBpMmNjb250cm9s
QDE3NjAgew0KPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsbXBjNTEyMS1pMmMtY3RybCI7
DQo+IERyb3AgdGhpcyBvciBkb2N1bWVudCBpdC4gSSdtIHRyeWluZyB0byBnZXQgcmlkIG9mIHVu
ZG9jdW1lbnRlZCAoYnkNCj4gc2NoZW1hcykgY29tcGF0aWJsZXMgaW4gZXhhbXBsZXMuDQpXaWxs
IHJlbW92ZSBpdA0KPj4gKyAgICAgICAgcmVnID0gPDB4MTc2MCAweDg+Ow0KPj4gKyAgICB9Ow0K
Pj4gKw0KPj4gKyAgICAvKiBNUEM1MjAwQiBiYXNlZCBib2FyZCAqLw0KPj4gKyAgICBpMmNAM2Qw
MCB7DQo+PiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4+ICsgICAgICAgICNzaXpl
LWNlbGxzID0gPDA+Ow0KPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsbXBjNTIwMGItaTJj
IiwgImZzbCxtcGM1MjAwLWkyYyIsICJmc2wtaTJjIjsNCj4+ICsgICAgICAgIHJlZyA9IDwweDNk
MDAgMHg0MD47DQo+PiArICAgICAgICBpbnRlcnJ1cHRzID0gPDIgMTUgMD47DQo+PiArICAgICAg
ICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZtcGM1MjAwX3BpYz47DQo+PiArICAgICAgICBmc2wscHJl
c2VydmUtY2xvY2tpbmc7DQo+PiArICAgIH07DQo+PiArDQo+PiArICAgIC8qIE1QQzg1NDQgYmFz
ZSBib2FyZCAqLw0KPj4gKyAgICBpMmNAMzEwMCB7DQo+PiArICAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwxPjsNCj4+ICsgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPj4gKyAgICAgICAgY29t
cGF0aWJsZSA9ICJmc2wsbXBjODU0NC1pMmMiLCAiZnNsLWkyYyI7DQo+PiArICAgICAgICByZWcg
PSA8MHgzMTAwIDB4MTAwPjsNCj4+ICsgICAgICAgIGludGVycnVwdHMgPSA8NDMgMj47DQo+PiAr
ICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZtcGljPjsNCj4+ICsgICAgICAgIGNsb2NrLWZy
ZXF1ZW5jeSA9IDw0MDAwMDA+Ow0KPj4gKyAgICAgICAgZnNsLHRpbWVvdXQgPSA8MTAwMDA+Ow0K
Pj4gKyAgICB9Ow0KPj4gKy4uLg0KPj4gLS0gDQo+PiAyLjMwLjINCj4+
