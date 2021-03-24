Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61430347037
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 04:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232894AbhCXDnq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 23:43:46 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:40960 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232889AbhCXDnq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Mar 2021 23:43:46 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BB58D891AE;
        Wed, 24 Mar 2021 16:43:43 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1616557423;
        bh=MlvuM4GZ54JuNtp8slC5y2UBaxE0XHJISV1jRWwPpEk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=RUmO63bq/huEx9xw385En31UWuXQO8QubsO/9LKmH7fZlf7piCdjqQ3YF6Daf2mDO
         YpbENQfysCBrgbGIFb4MUcVa6VTQh1DNk42LkGU75mcgiKd6bbONypaJGV5y3t+tCg
         CtdEcj8/WHjecVanjHm7p/raJcMWaO0zkSiMRZtagneVDd13YqjYxjEdMn4fzeLTc2
         s6s1SfyszjHXM++7d38AL5akXRRZkRARE3RQvPsBdpMdPGHVE+yU/i06EJDZhj535d
         TyKwlDNw0kJe3oy17+YrePOBlxX5Jkzmww9AZ+CPGULAmc/YunkfzyJK1KVu0WzA3h
         rXV74RNjR0MCA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B605ab56f0001>; Wed, 24 Mar 2021 16:43:43 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 24 Mar 2021 16:43:43 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Wed, 24 Mar 2021 16:43:43 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/6] i2c: mpc: Refactor to improve responsiveness
Thread-Topic: [PATCH 0/6] i2c: mpc: Refactor to improve responsiveness
Thread-Index: AQHXH523mfZMZexLwESnYJyd01Nd66qRppyA
Date:   Wed, 24 Mar 2021 03:43:43 +0000
Message-ID: <7d6acdfe-87f5-6096-a870-58d7d802f975@alliedtelesis.co.nz>
References: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <23E09B1CC76F0A4293EB5F0C879B8922@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=B-IRwknogWAUFU2Uo84A:9 a=QEXdDO2ut3YA:10 a=fCgQI5UlmZDRPDxm0A3o:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAyMy8wMy8yMSA1OjMzIHBtLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPiBUaGUgIm1lYXQi
IG9mIHRoaXMgc2VyaWVzIGlzIGluIHRoZSBsYXN0IHBhdGNoIHdoaWNoIGlzIHRoZSBjaGFuZ2Ug
dGhhdA0KPiBhY3R1YWxseSBzdGFydHMgbWFraW5nIHVzZSBvZiB0aGUgaW50ZXJydXB0cyB0byBk
cml2ZSBhIHN0YXRlIG1hY2hpbmUuDQo+IFRoZSBkdC1iaW5kaW5ncyBwYXRjaGVzIGNhbiBwcm9i
YWJseSBnbyBpbiBhdCBhbnkgdGltZS4gVGhlIHJlc3Qgb2YgdGhlDQo+IHNlcmllcyBpc24ndCBk
ZXBlbmRlbnQgb24gdGhlbS4NCj4NCj4gSSd2ZSB0ZXN0ZWQgaXQgb24gYSBUMjA4MSBiYXNlZCBz
eXN0ZW0gd2l0aCBhIG51bWJlciBvZiBpMmMgYW5kIHNtYnVzDQo+IGRldmljZXMuICBJdHMgdGhl
IGVuZCBvZiBteSB3b3JrIGRheSBzbyBJIGZpZ3VyZWQgSSdkIGdldCB0aGlzIG91dCBub3cNCj4g
YnV0IEknbGwgZG8gc29tZSBtb3JlIHRlc3Rpbmcgb24gYSBQMjA0MSBib2FyZCBhbmQgYSBmZXcg
ZGlmZmVyZW50IGkyYw0KPiBkZXZpY2VzIHRvbW9ycm93Lg0KDQpJJ3ZlIGRvbmUgbW9yZSB0ZXN0
aW5nIG9uIGEgVDIwODEgYW5kIFAyMDQxIGJvYXJkLiBCb3RoIGxvb2sgZ29vZC4NCg0KSSd2ZSBo
YWQgc29tZSBmZWVkYmFjayBmcm9tIFJvYiBvbiB0aGUgZHQtYmluZGluZ3Mgd2hpY2ggSSB0aGlu
ayBJJ3ZlIA0KZ290IHNvcnRlZCBub3cuIEkndmUgZ290IGEgY291cGxlIG9mIG1pbm9yIGNvc21l
dGljIGNoYW5nZXMgdG8gNi82IGJ1dCANCkknbGwgaG9sZCBmaXJlIG9uIHNlbmRpbmcgYSB2MiB0
byBnaXZlIHBlb3BsZSBhIGNoYW5jZSB0byBsb29rIGF0IHRoZSANCmZ1bmN0aW9uYWwgY2hhbmdl
cy4NCg0KPiBDaHJpcyBQYWNraGFtICg2KToNCj4gICAgZHQtYmluZGluZ3M6IGkyYy1tcGM6IERv
Y3VtZW50IGludGVycnVwdCBwcm9wZXJ0eSBhcyByZXF1aXJlZA0KPiAgICBkdC1iaW5kaW5nczog
aTJjOiBjb252ZXJ0IGkyYy1tcGMgdG8ganNvbi1zY2hlbWENCj4gICAgaTJjOiBtcGM6IE1ha2Ug
dXNlIG9mIGkyY19yZWNvdmVyX2J1cygpDQo+ICAgIGkyYzogbXBjOiBtYWtlIGludGVycnVwdCBt
YW5kYXRvcnkgYW5kIHJlbW92ZSBwb2xsaW5nIGNvZGUNCj4gICAgaTJjOiBtcGM6IHVzZSBkZXZp
Y2UgbWFuYWdlZCBBUElzDQo+ICAgIGkyYzogbXBjOiBJbnRlcnJ1cHQgZHJpdmVuIHRyYW5zZmVy
DQo+DQo+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tcGMudHh0ICAgICAgIHwg
IDYyIC0tLQ0KPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXBjLnlhbWwgICAg
ICB8ICA5OSArKysrDQo+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYyAgICAgICAgICAg
ICAgICAgIHwgNTEzICsrKysrKysrKystLS0tLS0tLQ0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMzcz
IGluc2VydGlvbnMoKyksIDMwMSBkZWxldGlvbnMoLSkNCj4gICBkZWxldGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXBjLnR4dA0KPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2ky
Yy1tcGMueWFtbA0KPg==
