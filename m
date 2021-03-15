Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8C6133AF2F
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Mar 2021 10:47:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhCOJqc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Mar 2021 05:46:32 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:26543 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229712AbhCOJq0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Mar 2021 05:46:26 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-219--wsPJDIhO-S4-kB8kWa4gw-1; Mon, 15 Mar 2021 09:46:22 +0000
X-MC-Unique: -wsPJDIhO-S4-kB8kWa4gw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Mon, 15 Mar 2021 09:46:21 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Mon, 15 Mar 2021 09:46:21 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Chris Packham' <Chris.Packham@alliedtelesis.co.nz>,
        'Guenter Roeck' <linux@roeck-us.net>,
        Wolfram Sang <wsa@kernel.org>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXE6SbssdAOSHgwE+zIRhtn11Sk6p4Y2sAgAAgcACAACSBgIAABe+AgAEDagCAAfS7gIAALq8AgAEX54CAAKWsgIAACmIAgADZp4CAAATLAIAAxmqAgAPuLICAAaQIUA==
Date:   Mon, 15 Mar 2021 09:46:21 +0000
Message-ID: <97910de5fd8c46fea1a17f0bd2b76fbc@AcuMS.aculab.com>
References: <20210311081842.GA1070@ninjato>
 <94dfa9dc-a80c-98ba-4169-44cce3d810f7@alliedtelesis.co.nz>
 <725c5e51-65df-e17d-e2da-0982efacf2d2@roeck-us.net>
 <1a7d43e6a16c46cdbe63b497b29ac453@AcuMS.aculab.com>
 <ec89dfda-a321-6ec7-9da0-b4949f1f28b5@alliedtelesis.co.nz>
In-Reply-To: <ec89dfda-a321-6ec7-9da0-b4949f1f28b5@alliedtelesis.co.nz>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

RnJvbTogQ2hyaXMgUGFja2hhbQ0KPiBTZW50OiAxNCBNYXJjaCAyMDIxIDIxOjI2DQo+IA0KPiBP
biAxMi8wMy8yMSAxMDoyNSBwbSwgRGF2aWQgTGFpZ2h0IHdyb3RlOg0KPiA+IEZyb206IExpbnV4
cHBjLWRldiBHdWVudGVyIFJvZWNrDQo+ID4+IFNlbnQ6IDExIE1hcmNoIDIwMjEgMjE6MzUNCj4g
Pj4NCj4gPj4gT24gMy8xMS8yMSAxOjE3IFBNLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPiA+Pj4g
T24gMTEvMDMvMjEgOToxOCBwbSwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiA+Pj4+PiBCdW1tZXIu
IFdoYXQgaXMgcmVhbGx5IHdlaXJkIGlzIHRoYXQgeW91IHNlZSBjbG9jayBzdHJldGNoaW5nIHVu
ZGVyDQo+ID4+Pj4+IENQVSBsb2FkLiBOb3JtYWxseSBjbG9jayBzdHJldGNoaW5nIGlzIHRyaWdn
ZXJlZCBieSB0aGUgZGV2aWNlLCBub3QNCj4gPj4+Pj4gYnkgdGhlIGhvc3QuDQo+ID4+Pj4gT25l
IGV4YW1wbGU6IFNvbWUgaG9zdHMgbmVlZCBhbiBpbnRlcnJ1cHQgcGVyIGJ5dGUgdG8ga25vdyBp
ZiB0aGV5DQo+ID4+Pj4gc2hvdWxkIHNlbmQgQUNLIG9yIE5BQ0suIElmIHRoYXQgaW50ZXJydXB0
IGlzIGRlbGF5ZWQsIHRoZXkgc3RyZXRjaCB0aGUNCj4gPj4+PiBjbG9jay4NCj4gPj4+Pg0KPiA+
Pj4gSXQgZmVlbHMgbGlrZSBzb21ldGhpbmcgbGlrZSB0aGF0IGlzIGhhcHBlbmluZy4gTG9va2lu
ZyBhdCB0aGUgVDIwODANCj4gPj4+IFJlZmVyZW5jZSBtYW51YWwgdGhlcmUgaXMgYW4gaW50ZXJl
c3RpbmcgdGltaW5nIGRpYWdyYW0gKEZpZ3VyZSAxNC0yIGlmDQo+ID4+PiBzb21lb25lIGZlZWxz
IGxpa2UgbG9va2luZyBpdCB1cCkuIEl0IHNob3dzIFNDTCBsb3cgYmV0d2VlbiB0aGUgQUNLIGZv
cg0KPiA+Pj4gdGhlIGFkZHJlc3MgYW5kIHRoZSBkYXRhIGJ5dGUuIEkgdGhpbmsgaWYgd2UncmUg
ZGVsYXllZCBpbiBzZW5kaW5nIHRoZQ0KPiA+Pj4gbmV4dCBieXRlIHdlIGNvdWxkIHZpb2xhdGUg
VHRpbWVvdXQgb3IgVGxvdzptZXh0IGZyb20gdGhlIFNNQlVTIHNwZWMuDQo+ID4+Pg0KPiA+PiBJ
IHRoaW5rIHRoYXQgcmVhbGx5IGxlYXZlcyB5b3Ugb25seSB0d28gb3B0aW9ucyB0aGF0IEkgY2Fu
IHNlZToNCj4gPj4gUmV3b3JrIHRoZSBkcml2ZXIgdG8gaGFuZGxlIGNyaXRpY2FsIGFjdGlvbnMg
KHN1Y2ggYXMgc2V0dGluZyBUWEFLLA0KPiA+PiBhbmQgZXZlcnl0aGluZyBlbHNlIHRoYXQgbWln
aHQgcmVzdWx0IGluIGNsb2NrIHN0cmV0Y2hpbmcpIGluIHRoZQ0KPiA+PiBpbnRlcnJ1cHQgaGFu
ZGxlciwgb3IgcmV3b3JrIHRoZSBkcml2ZXIgdG8gaGFuZGxlIGV2ZXJ5dGhpbmcgaW4NCj4gPj4g
YSBoaWdoIHByaW9yaXR5IGtlcm5lbCB0aHJlYWQuDQo+ID4NCj4gPiBJJ20gbm90IHN1cmUgYSBo
aWdoIHByaW9yaXR5IGtlcm5lbCB0aHJlYWQgd2lsbCBoZWxwLg0KPiA+IFdpdGhvdXQgQ09ORklH
X1BSRUVNUFQgKHdoaWNoIGhhcyBpdHMgb3duIHNldCBvZiBuYXN0aWVzKQ0KPiA+IGEgUlQgcHJv
Y2VzcyB3b24ndCBiZSBzY2hlZHVsZWQgdW50aWwgdGhlIHByb2Nlc3NvciBpdCBsYXN0DQo+ID4g
cmFuIG9uIGRvZXMgYSByZXNjaGVkdWxlLg0KPiA+IEkgZG9uJ3QgdGhpbmsgYSBrZXJuZWwgdGhy
ZWFkIHdpbGwgYmUgYW55IGRpZmZlcmVudCBmcm9tIGENCj4gPiB1c2VyIHByb2Nlc3MgcnVubmlu
ZyB1bmRlciB0aGUgUlQgc2NoZWR1bGVyLg0KPiA+DQo+ID4gSSdtIHRyeWluZyB0byByZW1lbWJl
ciB0aGUgc21idXMgc3BlYyAod2l0aG91dCByZW1lbWJlcmluZyB0aGUgSTJDIG9uZSkuDQoNCj4g
Rm9yIHRob3NlIGZvbGxvd2luZyBhbG9uZyB0aGUgc3BlYyBpcyBhdmFpbGFibGUgaGVyZVswXS4g
SSBrbm93IHRoZXJlJ3MNCj4gYSAzLjAgdmVyc2lvblsxXSBhcyB3ZWxsIGJ1dCB0aGUgZGV2aWNl
cyBJJ20gZGVhbGluZyB3aXRoIGFyZSBmcm9tIGEgMi4wDQo+IHZpbnRhZ2UuDQo+ID4gV2hpbGUg
YmFzaWNhbGx5IGEgY2xvY2srZGF0YSBiaXQtYmFuZyB0aGUgc2xhdmUgaXMgYWxsb3dlZCB0byBk
cml2ZQ0KPiA+IHRoZSBjbG9jayBsb3cgdG8gZXh0ZW5kIGEgY3ljbGUuDQo+ID4gSXQgbWF5IGJl
IGFsbG93ZWQgdG8gZG8gdGhpcyBhdCBhbnkgcG9pbnQ/DQo+DQo+ICBGcm9tIHdoYXQgSSBjYW4g
c2VlIGl0J3MgYWN0dWFsbHkgdGhlIG1hc3RlciBleHRlbmRpbmcgdGhlIGNsb2NrLiBPcg0KPiBt
b3JlIGFjY3VyYXRlbHkgaG9sZGluZyBpdCBsb3cgYmV0d2VlbiB0aGUgYWRkcmVzcyBhbmQgZGF0
YSBieXRlcyAod2hpY2gNCj4gZnJvbSB0aGUgVDIwODAgcmVmZXJlbmNlIG1hbnVhbCBsb29rcyBl
eHBlY3RlZCkuIEkgdGhpbmsgdGhpcyBtYXkgY2F1c2UNCj4gYSBzdHJpY3RseSBjb21wbGlhbnQg
U01CVVMgZGV2aWNlIHRvIGRldGVybWluZSB0aGF0IFRsb3c6bWV4dCBoYXMgYmVlbg0KPiB2aW9s
YXRlZC4NCg0KWWVzLCB0aGUgc3BlYyBkb2VzIHNlZW0gdG8gYXNzdW1lIHRoYXQgaXMgYSBzaWdu
YWwgaXMgc3RhYmxlDQpmb3IgMjBtcyBzb21ldGhpbmcgaGFzIGdvbmUgJ2hvcnJpYmx5IHdyb25n
Jy4NCkkgd2Fzbid0IHdvcnJpZXMgYWJvdXQgdGhhdCwgb3VyIGZwZ2EgZG9lcyB0aGUgd2hvbGUg
dHJhbnNhY3Rpb24NCmFzIGEgc2luZ2xlIGNvbW1hbmQuDQpOb25lIG9mIG91ciBzbGF2ZXMgZ2Vu
ZXJhdGUgaW50ZXJydXB0cyAtIHNvIGl0IGlzIHB1cmVseSBtYXN0ZXIvc2xhdmUuDQoNCklmIHlv
dSBydW4geW91ciBwcm9jZXNzIHVuZGVyIHRoZSBSVCBzY2hlZHVsZXIgaXQgaXMgdW5saWtlbHkN
CnRoYXQgcHJlLWVtcHRpb24gd2lsbCBiZSBkZWxheWVkIGJ5IGxvbmcgZW5vdWdoIHRvIHN0b3Ag
dGhlIHByb2Nlc3MNCnJ1bm5pbmcgZm9yIDEwbXMuDQpJJ3ZlIHNlZW4gPjFtcyBkZWxheXMgKHRl
c3RpbmcgUlRQIGF1ZGlvKSwgYnV0IG1vc3Qgb2YgdGhlIGxvbmcNCmxvb3BzIGhhdmUgYSBjb25k
X3Jlc2NoZWQoKSBpbiB0aGVtLg0KDQouLi4NCg0KPiBQcm9iYWJseSBkZXBlbmRzIG9uIHRoZSBk
ZXZpY2UgaW1wbGVtZW50YXRpb24uIEkndmUgZ290IG11bHRpcGxlIG90aGVyDQo+IEkyQy9TTUJV
UyBkZXZpY2VzIGFuZCB0aGUgTE04MSBzZWVtcyB0byBiZSB0aGUgb25lIHRoYXQgb2JqZWN0cy4N
Cg0KSSBiZXQgbW9zdCBkb24ndCBpbXBsZW1lbnQgYW55IG9mIHRoZSB0aW1lb3V0cy4NCg0KSSBm
b3VuZCBvbmUgaW50ZXJlc3RpbmcgcG1idXMgZGV2aWNlLg0KU29tZXRpbWVzIGl0IHdvdWxkIGRl
dGVjdCBhIFNUT1AgY29uZGl0aW9uIGJlY2F1c2UgdGhlIGRhdGEgbGluZQ0Kd2VudCBoaWdoIHdo
ZW4gaXQgdHJpLXN0YXRlZCBpdHMgb3V0cHV0IGRyaXZlciBpbiByZXNwb25zZSB0byB0aGUNCnJp
c2luZyBjbG9jayBlZGdlIQ0KU28gaXQgc2F3IHRoZSBzYW1lIGNsb2NrIGVkZ2UgdHdpY2UuDQoN
Cj4gWzBdIC0gaHR0cDovL3d3dy5zbWJ1cy5vcmcvc3BlY3Mvc21idXMyMC5wZGYNCj4gWzFdIC0g
aHR0cHM6Ly9wbWJ1cy5vcmcvQXNzZXRzL1BERlMvUHVibGljL1NNQnVzXzNfMF8yMDE0MTIyMC5w
ZGYNCg0KSSBzaG91bGQgaGF2ZSBib3RoIHRob3NlIC0gSSd2ZSBjb3BpZWQgdGhlbSB0byB0aGUg
ZGlyZWN0b3J5IHdoZXJlDQpJJ2QgbG9vayBmb3IgdGhlbSBmaXJzdCENCg0KCURhdmlkDQoNCi0N
ClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBN
aWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxl
cykNCg==

