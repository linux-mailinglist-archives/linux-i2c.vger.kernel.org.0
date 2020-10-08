Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 698E8287158
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Oct 2020 11:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgJHJV1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 05:21:27 -0400
Received: from mail.vivotek.com ([60.248.39.150]:52770 "EHLO mail.vivotek.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbgJHJV1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Oct 2020 05:21:27 -0400
Received: from pps.filterd (vivotekpps.vivotek.com [127.0.0.1])
        by vivotekpps.vivotek.com (8.16.0.42/8.16.0.42) with SMTP id 0989A5f1027626;
        Thu, 8 Oct 2020 17:21:19 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivotek.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=dkim;
 bh=NsERvr8xzN3EP2D7kFizP1BTHqGYWaAV7FZIDKFZGF0=;
 b=Wg4C2ToLvjOySuhlFZWBKp1iWkiDupckZFH+wE7dRWOknzjcFwC5akv93KTHWEzwOuyi
 vtumPFHJMQKGHFCXtl3NHIC2cm6fuUyH96vxcyjRaTotkaKavolo8IYQvTqNlh2B8P7J
 AaRE20NTGnqo4WwsGEyuRik5sW1T07x7VAA= 
Received: from cas01.vivotek.tw ([192.168.0.58])
        by vivotekpps.vivotek.com with ESMTP id 33xbr2up9e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 08 Oct 2020 17:21:18 +0800
Received: from MBS07.vivotek.tw ([fe80::2027:4d67:6c01:78d8]) by
 CAS01.vivotek.tw ([fe80::45c4:96f2:85f6:4cad%11]) with mapi id
 14.03.0487.000; Thu, 8 Oct 2020 17:21:17 +0800
From:   <Michael.Wu@vatics.com>
To:     <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>
CC:     <linux-i2c@vger.kernel.org>, <morgan.chang@vatics.com>,
        <dean.hsiao@vatics.com>, <paul.chen@vatics.com>
Subject: RE: Designeware I2C slave confusing IC_INTR_STOP_DET handle
Thread-Topic: Designeware I2C slave confusing IC_INTR_STOP_DET handle
Thread-Index: AdacaCEF1S068DPwQGOIeCihPcVtGv///2uA//47LcA=
Date:   Thu, 8 Oct 2020 09:21:17 +0000
Message-ID: <5DB475451BAA174CB158B5E897FC1525B1293CDE@MBS07.vivotek.tw>
References: <5DB475451BAA174CB158B5E897FC1525B1293AB2@MBS07.vivotek.tw>
 <655eb758-c94b-d319-1866-6f1db413d337@linux.intel.com>
In-Reply-To: <655eb758-c94b-d319-1866-6f1db413d337@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.17.134]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-08_04:2020-10-08,2020-10-08 signatures=0
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgU2lyLA0KDQpPbiAxMC83LzIwIDk6MDggUE0sIGphcmtrby5uaWt1bGFAbGludXguaW50ZWwu
Y29tIHdyb3RlOiANCj4gSGkNCj4gDQo+IFVuZm9ydHVuYXRlbHkgSSBkb24ndCBoYXZlIHJpZ2h0
IG5vdyBhIHNldHVwIHRvIHRyeSBteXNlbGYgYnV0IGNvdWxkIHlvdQ0KPiB0cnkgdGhlc2UgaWRl
YXMgdG8gcmVhZCBhbmQgY2xlYXIgaW50ZXJydXB0IHN0YXR1cyBpbiBvbmUgcGxhY2Ugb25seSBh
bmQNCj4gbW92ZSBJMkNfU0xBVkVfV1JJVEVfUkVRVUVTVEVEIHJlcG9ydGluZyBhZnRlcg0KPiBJ
MkNfU0xBVkVfV1JJVEVfUkVDRUlWRUQNCj4gbGlrZSBpbiBhIHBhdGNoIGJlbG93Pw0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdud2FyZS1zbGF2ZS5jDQo+
IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLXNsYXZlLmMNCj4gaW5kZXggNDQ5
NzRiNTNhNjI2Li45NzEzMWU4ODhlMjQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtZGVzaWdud2FyZS1zbGF2ZS5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
ZGVzaWdud2FyZS1zbGF2ZS5jDQo+IEBAIC0xNTksNyArMTU5LDYgQEAgc3RhdGljIGludCBpMmNf
ZHdfaXJxX2hhbmRsZXJfc2xhdmUoc3RydWN0DQo+IGR3X2kyY19kZXYgKmRldikNCj4gICAJdTMy
IHJhd19zdGF0LCBzdGF0LCBlbmFibGVkLCB0bXA7DQo+ICAgCXU4IHZhbCA9IDAsIHNsYXZlX2Fj
dGl2aXR5Ow0KPiANCj4gLQlyZWdtYXBfcmVhZChkZXYtPm1hcCwgRFdfSUNfSU5UUl9TVEFULCAm
c3RhdCk7DQo+ICAgCXJlZ21hcF9yZWFkKGRldi0+bWFwLCBEV19JQ19FTkFCTEUsICZlbmFibGVk
KTsNCj4gICAJcmVnbWFwX3JlYWQoZGV2LT5tYXAsIERXX0lDX1JBV19JTlRSX1NUQVQsICZyYXdf
c3RhdCk7DQo+ICAgCXJlZ21hcF9yZWFkKGRldi0+bWFwLCBEV19JQ19TVEFUVVMsICZ0bXApOw0K
PiBAQCAtMTY4LDEzICsxNjcsMTEgQEAgc3RhdGljIGludCBpMmNfZHdfaXJxX2hhbmRsZXJfc2xh
dmUoc3RydWN0DQo+IGR3X2kyY19kZXYgKmRldikNCj4gICAJaWYgKCFlbmFibGVkIHx8ICEocmF3
X3N0YXQgJiB+RFdfSUNfSU5UUl9BQ1RJVklUWSkgfHwgIWRldi0+c2xhdmUpDQo+ICAgCQlyZXR1
cm4gMDsNCj4gDQo+ICsJc3RhdCA9IGkyY19kd19yZWFkX2NsZWFyX2ludHJiaXRzX3NsYXZlKGRl
dik7DQo+ICAgCWRldl9kYmcoZGV2LT5kZXYsDQo+ICAgCQkiJSN4IFNUQVRVUyBTTEFWRV9BQ1RJ
VklUWT0lI3ggOiBSQVdfSU5UUl9TVEFUPSUjeCA6DQo+IElOVFJfU1RBVD0lI3hcbiIsDQo+ICAg
CQllbmFibGVkLCBzbGF2ZV9hY3Rpdml0eSwgcmF3X3N0YXQsIHN0YXQpOw0KPiANCj4gLQlpZiAo
KHN0YXQgJiBEV19JQ19JTlRSX1JYX0ZVTEwpICYmIChzdGF0ICYgRFdfSUNfSU5UUl9TVE9QX0RF
VCkpDQo+IC0JCWkyY19zbGF2ZV9ldmVudChkZXYtPnNsYXZlLCBJMkNfU0xBVkVfV1JJVEVfUkVR
VUVTVEVELCAmdmFsKTsNCj4gLQ0KPiAgIAlpZiAoc3RhdCAmIERXX0lDX0lOVFJfUkRfUkVRKSB7
DQo+ICAgCQlpZiAoc2xhdmVfYWN0aXZpdHkpIHsNCj4gICAJCQlpZiAoc3RhdCAmIERXX0lDX0lO
VFJfUlhfRlVMTCkgew0KPiBAQCAtMTg4LDExICsxODUsOSBAQCBzdGF0aWMgaW50IGkyY19kd19p
cnFfaGFuZGxlcl9zbGF2ZShzdHJ1Y3QNCj4gZHdfaTJjX2RldiAqZGV2KQ0KPiAgIAkJCQkJCSB2
YWwpOw0KPiAgIAkJCQl9DQo+ICAgCQkJCXJlZ21hcF9yZWFkKGRldi0+bWFwLCBEV19JQ19DTFJf
UkRfUkVRLCAmdG1wKTsNCj4gLQkJCQlzdGF0ID0gaTJjX2R3X3JlYWRfY2xlYXJfaW50cmJpdHNf
c2xhdmUoZGV2KTsNCj4gICAJCQl9IGVsc2Ugew0KPiAgIAkJCQlyZWdtYXBfcmVhZChkZXYtPm1h
cCwgRFdfSUNfQ0xSX1JEX1JFUSwgJnRtcCk7DQo+ICAgCQkJCXJlZ21hcF9yZWFkKGRldi0+bWFw
LCBEV19JQ19DTFJfUlhfVU5ERVIsICZ0bXApOw0KPiAtCQkJCXN0YXQgPSBpMmNfZHdfcmVhZF9j
bGVhcl9pbnRyYml0c19zbGF2ZShkZXYpOw0KPiAgIAkJCX0NCj4gICAJCQlpZiAoIWkyY19zbGF2
ZV9ldmVudChkZXYtPnNsYXZlLA0KPiAgIAkJCQkJICAgICBJMkNfU0xBVkVfUkVBRF9SRVFVRVNU
RUQsDQo+IEBAIC0yMDcsNyArMjAyLDYgQEAgc3RhdGljIGludCBpMmNfZHdfaXJxX2hhbmRsZXJf
c2xhdmUoc3RydWN0DQo+IGR3X2kyY19kZXYgKmRldikNCj4gICAJCQlyZWdtYXBfcmVhZChkZXYt
Pm1hcCwgRFdfSUNfQ0xSX1JYX0RPTkUsICZ0bXApOw0KPiANCj4gICAJCWkyY19zbGF2ZV9ldmVu
dChkZXYtPnNsYXZlLCBJMkNfU0xBVkVfU1RPUCwgJnZhbCk7DQo+IC0JCXN0YXQgPSBpMmNfZHdf
cmVhZF9jbGVhcl9pbnRyYml0c19zbGF2ZShkZXYpOw0KPiAgIAkJcmV0dXJuIDE7DQo+ICAgCX0N
Cj4gDQo+IEBAIC0yMTksOSArMjEzLDExIEBAIHN0YXRpYyBpbnQgaTJjX2R3X2lycV9oYW5kbGVy
X3NsYXZlKHN0cnVjdA0KPiBkd19pMmNfZGV2ICpkZXYpDQo+ICAgCQkJZGV2X3ZkYmcoZGV2LT5k
ZXYsICJCeXRlICVYIGFja2VkISIsIHZhbCk7DQo+ICAgCX0gZWxzZSB7DQo+ICAgCQlpMmNfc2xh
dmVfZXZlbnQoZGV2LT5zbGF2ZSwgSTJDX1NMQVZFX1NUT1AsICZ2YWwpOw0KPiAtCQlzdGF0ID0g
aTJjX2R3X3JlYWRfY2xlYXJfaW50cmJpdHNfc2xhdmUoZGV2KTsNCj4gICAJfQ0KPiANCj4gKwlp
ZiAoKHN0YXQgJiBEV19JQ19JTlRSX1JYX0ZVTEwpICYmIChzdGF0ICYgRFdfSUNfSU5UUl9TVE9Q
X0RFVCkpDQo+ICsJCWkyY19zbGF2ZV9ldmVudChkZXYtPnNsYXZlLCBJMkNfU0xBVkVfV1JJVEVf
UkVRVUVTVEVELCAmdmFsKTsNCj4gKw0KPiAgIAlyZXR1cm4gMTsNCj4gICB9DQo+IA0KPiBAQCAt
MjMwLDcgKzIyNiw2IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBpMmNfZHdfaXNyX3NsYXZlKGludCB0
aGlzX2lycSwNCj4gdm9pZCAqZGV2X2lkKQ0KPiAgIAlzdHJ1Y3QgZHdfaTJjX2RldiAqZGV2ID0g
ZGV2X2lkOw0KPiAgIAlpbnQgcmV0Ow0KPiANCj4gLQlpMmNfZHdfcmVhZF9jbGVhcl9pbnRyYml0
c19zbGF2ZShkZXYpOw0KPiAgIAlyZXQgPSBpMmNfZHdfaXJxX2hhbmRsZXJfc2xhdmUoZGV2KTsN
Cj4gICAJaWYgKHJldCA+IDApDQo+ICAgCQljb21wbGV0ZSgmZGV2LT5jbWRfY29tcGxldGUpOw0K
DQoNCkFmdGVyIGFkZGluZyB5b3VyIHN1Z2dlc3Rpb24sIGl0IHNlZW1zIHdvcmsgZmluZSB3aXRo
IGRyaXZlcnMvaTJjL2kyYy1zbGF2ZS1lZXByb20uYy4NCg0KVGhlIGxvZyB3YXMgdXN1YWxseToN
Cg0KIyBpMmNzZXQgLWYgLXkgMiAweDQyIDB4MDAgMHg0MTtkbWVzZyAtYw0KMHgxIFNUQVRVUyBT
TEFWRV9BQ1RJVklUWT0weDEgOiBSQVdfSU5UUl9TVEFUPTB4NTE0IDogSU5UUl9TVEFUPTB4NA0K
V1JJVEVfUkVDRUlWRUQNCjB4MSBTVEFUVVMgU0xBVkVfQUNUSVZJVFk9MHgxIDogUkFXX0lOVFJf
U1RBVD0weDUxNCA6IElOVFJfU1RBVD0weDQNCldSSVRFX1JFQ0VJVkVEDQoweDEgU1RBVFVTIFNM
QVZFX0FDVElWSVRZPTB4MCA6IFJBV19JTlRSX1NUQVQ9MHg3MTAgOiBJTlRSX1NUQVQ9MHgyMDAN
ClNUT1ANCg0KU29tZXRpbWVzIGl0IHdvdW5kIGJlOg0KDQojIGkyY3NldCAtZiAteSAyIDB4NDIg
MHgwOCAweDQ1O2RtZXNnIC1jDQoweDEgU1RBVFVTIFNMQVZFX0FDVElWSVRZPTB4MSA6IFJBV19J
TlRSX1NUQVQ9MHg1MTQgOiBJTlRSX1NUQVQ9MHg0DQpXUklURV9SRUNFSVZFRA0KMHgxIFNUQVRV
UyBTTEFWRV9BQ1RJVklUWT0weDAgOiBSQVdfSU5UUl9TVEFUPTB4NzE0IDogSU5UUl9TVEFUPTB4
MjA0DQpXUklURV9SRUNFSVZFRA0KV1JJVEVfUkVRVUVTVEVEDQoNCmRyaXZlcnMvaTJjL2kyYy1z
bGF2ZS1lZXByb20uYyBkb2VzIHRoZSBzYW1lIGFjdGlvbiB3aGVuIHRyaWdnZXJlZCBieSBlaXRo
ZXIgSTJDX1NMQVZFX1NUT1Agb3IgSTJDX1NMQVZFX1dSSVRFX1JFUVVFU1RFRCwgc28gb25lIG9m
IHRoZW0gYmVpbmcgdGhlIGxhc3QgZXZlbnQgYXJlIGZpbmUuDQoNCkJ1dCBEb2N1bWVudGF0aW9u
L2kyYy9zbGF2ZS1pbnRlcmZhY2UucnN0IHNhaWQgdGhhdCBJMkNfU0xBVkVfV1JJVEVfUkVRVUVT
VEVEIGNvbWVzIHdpdGhvdXQgYW55IGRhdGEgYXJyaXZlZC4gSXQgbWVhbnMgSTJDX1NMQVZFX1dS
SVRFX1JFUVVFU1RFRCBzaG91bGQgYmUgZnJvbnQgb2YgYW55IFdSSVRFX1JFQ0VJVkVEIGluIGEg
d3JpdGUtcmVxdWVzdC4gVGhlIHNlY29uZCBsb2cgc2hvdWxkIGJlIGFuIGlsbGVnYWwgcmVzdWx0
Lg0KDQpJMkNfU0xBVkVfV1JJVEVfUkVRVUVTVEVEIGlzIG1hZGUgd2hlbiBSWF9GVUxMIGFuZCBT
VE9QX0RFVCBhcmUgYm90aCByaXNpbmcuIFdoYXQgc2l0dWF0aW9uIG1lZXQgdGhpcyBjb25kaXRp
b24/IEkgZ3Vlc3MgdGhpcyBTVE9QX0RFVCB3YXMgbGVmdCBieSBwcmV2aW91cyB0cmFuc21pc3Np
b24gYW5kIHRoZW4gdGhlIHN5c3RlbSBpcyBmaW5hbGx5IGhhbmRsaW5nIGl0IHdoaWxlIGRhdGEg
b2YgdGhlIG5leHQgcmVxdWVzdCBhcnJpdmVkLiBJZiB5ZXMsIHB1dCAiaWYgKChzdGF0ICYgRFdf
SUNfSU5UUl9SWF9GVUxMKSAmJiAoc3RhdCAmIERXX0lDX0lOVFJfU1RPUF9ERVQpKSIgaW4gZnJv
bnQgb2Ygb3RoZXIgaGFuZGxpbmcgaXMgY29ycmVjdCBidXQgaXQgdmlvbGF0ZXMgSTJDX1NMQVZF
X1dSSVRFX1JFUVVFU1RFRCBkZW50aXRpb24gd2hlbiB0aGVzZSB0d28gaW50ZXJydXB0cyBvZiBv
bmUgcmVxdWVzdCBoYXZlIHRvIGhhbmRsZSBpbiBvbmUgSVNSLiBJIHRoaW5rIHRoZXJlIGhhdmUg
dG8gYmUgYSBzb2x1dGlvbiB0byBkaXN0aW5ndWlzaCB0aGVzZSB0d28gY2FzZXMuDQoNCk5vdGUg
dGhhdCBteSBMaW51eCBpcyA0LjkuMTcwIGFuZCBiYWNrLXBvcnRlZCBkcml2ZXJzL2kyYy9pMmMt
ZGVzaWdud2FyZS1zbGF2ZS5jIGZyb20gNC4xMyAoY29tbWl0IDlmM2UwNjVjNTRiMDViMDNiZDM5
ZGJiY2M1YTQ0ZjJmMTgwNzk5NGQpLg0KDQotLQ0KQlIsDQpNaWNoYWVsIFd1DQo=
