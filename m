Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC7F546C763
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 23:24:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238002AbhLGW1t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Dec 2021 17:27:49 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:53520 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233310AbhLGW1t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Dec 2021 17:27:49 -0500
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 8709A891B1;
        Wed,  8 Dec 2021 11:24:14 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1638915854;
        bh=TslM5ADFz08Cx03cfM6HSh91l2WWO3ZEVszWzepwZis=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=A0eSiULNSCisQs3Etl+ZzID0Ppa4QIDC8okfLkRYCADdW903W4hwVO89oqwZO/pD8
         pn+zXA8Dl/Enc4BU1H5YCsD6nswO32J3rIX9ykeRE1DNRME8vWwc+BdZlVjgtW9fcY
         JW3tmis6kmY4PvrUfHGWE0gXfin7t/SSQL+7Jokgv+wBZThprswIYzzV9WAVxfnS2O
         3xgj19PEkFpl/rCS9ykfusCiXUsrB3H/2ySpwn7EvUqmks/HMz85u7D3OglklpcEqN
         ulOa+q6hzt0gYswnQynzVjENHxp+0YoeQy0Iu3OYwh5aefHbxO9LKHvDTQjq9scy8v
         RfND77b74UApw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B61afdf0e0002>; Wed, 08 Dec 2021 11:24:14 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 8 Dec 2021 11:24:14 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.026; Wed, 8 Dec 2021 11:24:14 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "mbizon@freebox.fr" <mbizon@freebox.fr>,
        "wsa@kernel.org" <wsa@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: mpc: Use atomic read and fix break condition
Thread-Topic: [PATCH] i2c: mpc: Use atomic read and fix break condition
Thread-Index: AQHX6yH59UeBzAfeJEWOl6N8FMj7Fawl9dyAgADMRYA=
Date:   Tue, 7 Dec 2021 22:24:13 +0000
Message-ID: <bce48dba-c163-4fe7-50c4-984de41488c2@alliedtelesis.co.nz>
References: <20211207042144.358867-1-chris.packham@alliedtelesis.co.nz>
 <ea12555e66d4dc16c5b093ac528442ed6dddf644.camel@freebox.fr>
In-Reply-To: <ea12555e66d4dc16c5b093ac528442ed6dddf644.camel@freebox.fr>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3258A4E0741374CA3246F84712A9F44@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=XOZOtjpE c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=IOMw9HtfNCkA:10 a=tNKga8fkx7gt9p2w3KsA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiA3LzEyLzIxIDExOjEzIHBtLCBNYXhpbWUgQml6b24gd3JvdGU6DQo+IE9uIFR1ZSwgMjAy
MS0xMi0wNyBhdCAxNzoyMSArMTMwMCwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4NCj4+IENhbiB5
b3UgZ2l2ZSB0aGlzIGEgdGVzdCBvbiB5b3VyIHNldHVwLiBJJ3ZlIHRyaWVkIGl0IG9uIHRoZSBz
ZXR1cA0KPj4gd2hlcmUgSSBoYWQgdGhlIG9yaWdpbmFsIHByb2JsZW0gdGhhdCBsZWQgdG8gNGE4
YWM1ZTQ1Y2RhIGFuZCBpdA0KPj4gc2VlbXMgT0sgc28gZmFyIChJJ2xsIGxlYXZlIG15IHRlc3Qg
cnVubmluZyBvdmVybmlnaHQpLg0KPiBUZXN0ZWQtYnk6IE1heGltZSBCaXpvbiA8bWJpem9uQGZy
ZWVib3guZnI+DQpNeSB0ZXN0aW5nIG92ZXJuaWdodCBhbHNvIGxvb2tzIGdvb2QuDQo+IFNtYWxs
IHJlc2VydmF0aW9uIHRob3VnaCwgaXQgZG9lcyBub3Qgc2VlbSB0byBiZSB1bmRlcnN0b29kIHdo
eSB0aGlzDQo+IHBvbGxpbmcgaXMgbmVlZGVkLg0KPg0KPiBSZWFkaW5nIHRoZSBkcml2ZXIgaGlz
dG9yeSwgdGhlIHRoZW9yeSBpcyB0aGF0IHRoZSBjb250cm9sbGVyIHdpbGwNCj4gdHJpZ2dlciBh
biBpbnRlcnJ1cHQgYXQgdGhlIGVuZCBvZiB0cmFuc2ZlciBqdXN0IGFmdGVyIHRoZSBsYXN0IFND
TA0KPiBjeWNsZSwgYnV0IGlycmVzcGVjdGl2ZSBvZiB3aGV0aGVyIFNDTCBnb2VzIGhpZ2gsIHdo
aWNoIGhhcHBlbnMgaWYgYQ0KPiBzbGF2ZSAic3RyZXRjaCIgdGhlIGNsb2NrIHVudGlsIGl0J3Mg
cmVhZHkgdG8gYW5zd2VyLg0KPg0KPiBTdXBwb3NlZGx5IHdoZW4gdGhhdCBoYXBwZW4sIENTUl9N
Q0YgYml0IHdvdWxkIGJlIDAgYXQgaW50ZXJydXB0IHRpbWUsDQo+IG1lYW5pbmcgYnVzIGlzIGJ1
c3ksIGFuZCB3ZSBoYXZlIHRvIHBvbGwgdW50aWwgaXQgZ29lcyB0byAxIG1lYW5pbmcgdGhlDQo+
IHNsYXZlIGhhcyByZWxlYXNlZCBTQ0wuDQoNCkkgc2hhcmUgeW91ciByZXNlcnZhdGlvbi4gVGhl
IG9yaWdpbmFsIHJlLXJlYWQgcHJlLWRhdGVzIGdpdCAoSSBkbyANCnJlY2FsbCBsb29raW5nIGlu
IHRoZSBoaXN0b3JpY2FsIHJlcG8gYXMgd2VsbCBhbmQgZmluZGluZyBub3RoaW5nIA0KZW5saWdo
dGVuaW5nKS4gQWxsIEkgY2FuIHNheSBpcyB0aGF0IHRoZSBvcmlnaW5hbCBjb2RlIHRob3VnaHQg
STJDX1NSIA0KbmVlZGVkIHNvbWUgdGltZSB0byAic3RhYmlsaXplIi4NCg0KQm90aCBNSUYgYW5k
IE1DRiBzaG91bGQgYmUgc2V0IGF0IHRoZSBmYWxsaW5nIGVkZ2Ugb2YgdGhlIG5pbnRoIGNsb2Nr
LiANCkluIHRoZW9yeSB3ZSBjb3VsZCBlbmQgdXAgd2l0aCBNSUY9MSBNQ0Y9MCBpZiBNQUwgaXMg
c2V0IChpbiB3aGljaCBjYXNlIA0Kd2UnZCBoaXQgdGhlIDEwMHVzIHRpbWVvdXQgaW4gdGhlIHBv
bGwpLiBCdXQgSSBzZWUgbm8gZXZpZGVuY2Ugb2YgdGhhdCANCmFjdHVhbGx5IGhhcHBlbmluZyAo
YW5kIG5vIGlkZWEgd2hhdCBhcmJpdHJhdGlvbiBsb3N0IG1lYW5zIHcuci50IGkyYykuDQoNClRo
ZSByb290IGludGVycnVwdHMgZm9yIEkyQzEgYW5kIEkyQzIgYXJlIHNoYXJlZCBzbyBpdCBtYXkg
YmUgcG9zc2libGUgDQpmb3IgTUlGIHRvIGJlIGluIHRoZSBwcm9jZXNzIG9mIGJlaW5nIHNldCBm
b3IgSTJDMSBidXQgdGhlIGFjdHVhbCBtcGljIA0KaW50ZXJydXB0IGJlIHJhaXNlZCBmb3IgYSBk
aWZmZXJlbnQgdHJhbnNmZXIgb24gSTJDMi4gVGhlIGlzciB3aWxsIGxvb2sgDQphdCBib3RoIEky
QyBhZGFwdGVycyBhbmQgYXR0ZW1wdCB0byBoYW5kbGUgdGhlIGludGVycnVwdCBpZiBNSUYgaXMg
c2V0LiANCkknZCBleHBlY3QgYSBzcHVyaW91cyBpbnRlcnJ1cHQgdG8gYmUgY291bnRlZCBpbiB0
aGlzIGNhc2UgYXMgYnkgdGhlIA0KdGltZSBJMkMxIHJhaXNlcyB0aGUgaW50ZXJydXB0IHdpdGgg
dGhlIG1waWMgd2UnZCBoYXZlIGFscmVhZHkgc2VydmljZWQgDQppdCAoYnV0IG1heWJlIHRoZSBm
aWRkbGluZyB3aXRoIE1FSU4gcHJldmVudHMgdGhhdCkuDQoNCk15IGJlc3QgZ3Vlc3MgaXMgdGhh
dCBldmVuIGlmIHRoZSBob3N0IGFkYXB0ZXIgaGFzIHNlbnQgdGhlIG5pbnRoIGNsb2NrIA0KaXQg
ZG9lc24ndCBtZWFuIHRoYXQgdGhlIHJlbW90ZSBkZXZpY2Ugd2lsbCByZWxlYXNlIFNDTCAoZS5n
LiBpbiB0aGUgDQpjYXNlIG9mIGNsb2NrIHN0cmV0Y2hpbmcgb3IgbXkgc2xpZ2h0bHkgZG9kZ3kg
aGFyZHdhcmUpLiBTbyBJIHRoaW5rIHRoZSANCmFjdCBvZiBwb2xsaW5nIGZvciBNQ0YgKG9yIHBy
aW9yIHRvIHRoaXMgd2hhdCB3YXMgZWZmZWN0aXZlbHkgYSANCnVkZWxheSgxMDApKSBhbGxvd3Mg
dGhlIHJlbW90ZSBkZXZpY2UgYSBiaXQgb2YgdGltZSB0byByZWxlYXNlIFNDTC4NCg0KPiBJIGhh
dmUgbm8gc2xhdmUgdGhhdCBkb2VzIGNsb2NrIHN0cmV0Y2hpbmcgb24gbXkgYm9hcmQgc28gSSBj
YW5ub3QgdGVzdA0KPiB0aGUgdGhlb3J5LiBPbiBteSBtcGM4MzQ3IGRldmljZSwgaTJjIGNsb2Nr
IHNwZWVkIHNldCB0byA5MGtIeiwgSSd2ZQ0KPiBuZXZlciBzZWVuIGEgY2FzZSB3aGVyZSBNQ1Ig
d2FzIDAgYXQgaW50ZXJydXB0IHRpbWUuDQo+DQo+IEZvciBpMmMgZXhwZXJ0cyBoZXJlLCBpcyAx
MDB1cyBlbm91Z2ggaW4gdGhhdCBjYXNlID8gSSBjb3VsZCBub3QgYW55DQo+IG1heGltdW0gc3Ry
ZXRjaCB0aW1lIGluIGkyYyBzcGVjaWZpY2F0aW9uLg0KDQpJIGRvbid0IGtub3cgdGhhdCB0aGVy
ZSBpcyBhIG1heGltdW0gY2xvY2sgc3RyZXRjaCB0aW1lICh3ZSBjZXJ0YWlubHkgDQprbm93IHRo
ZXJlIGFyZSBtaXNiZWhhdmluZyBkZXZpY2VzIHRoYXQgaG9sZCBTQ0wgbG93IGZvcmV2ZXIpLiBU
aGUgU01CVVMgDQpwcm90b2NvbCBhZGRzIHNvbWUgdGltZW91dHMgYnV0IGFzIGZhciBhcyBJIGtu
b3cgaTJjIHNheXMgbm90aGluZyBhYm91dCANCmhvdyBsb25nIGEgcmVtb3RlIGRldmljZSBjYW4g
aG9sZCBTQ0wuDQoNCj4gTXkgQ1BVIHVzZXIgbWFudWFsIGlzIElNTyB2YWd1ZSBvbiB0aGlzIHBy
ZWNpc2UgdG9waWMsIGhvcGVmdWxseSBhbiBOWFANCj4ga25vd2xlZGdlYWJsZSBlbXBsb3llZSB3
aWxsIHJlYWQgdGhpcyBhbmQgZW5saWdodGVuIHVzLg0KDQpUaGF0IHdvdWxkIGJlIG5pY2UgKGJ1
dCB0aGVyZSBpcyBhIHJlYXNvbiBJJ3ZlIGVuZGVkIHVwIGJlaW5nIGxpc3RlZCBhcyANCnRoZSBt
YWludGFpbmVyIGZvciB0aGlzIGRyaXZlcikuDQoNCj4NCj4gVGhhbmtzLA0KPg==
