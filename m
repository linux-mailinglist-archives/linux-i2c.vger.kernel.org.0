Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BBE439AE6D
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 00:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbhFCW7q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 18:59:46 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:51169 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbhFCW7p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Jun 2021 18:59:45 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A6B8E83646;
        Fri,  4 Jun 2021 10:57:56 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1622761076;
        bh=UReRs+RXJ9g1itkvp5ajmVGxwj/uORUz3kM60zJLeE8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=RDZf3I8hfcolBbYx61OK2O8Cpq/Ob4onx7temvJ/TozGAy2ti6e6FHXDHJHjWqvHQ
         E0qdtws8LuePizxNUczyWERdK+fl+/Vpwns7M2OI5mlt0lDTozqiN+06TQLC0fUts/
         n2vlZmfNuN8ewATuhNrsTxawYUQ2iVRuJqMPbMkADP7fhcut8x1JspsMlQl+I79iJ0
         VpdLLHfuFf9xJrkJHUmN/wI40H+k5/SOhn87Rcjl0Hr+xfk3eVJmEevcTDDx4n/h5y
         18nL8FYzVNcW2oBPhHhGkqwITD+7OScvCcTRhd9zeiMy6w4cdSvOd3898P+f+ZgIRp
         T+MWajX92Z+fQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60b95e740001>; Fri, 04 Jun 2021 10:57:56 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 4 Jun 2021 10:57:56 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.018; Fri, 4 Jun 2021 10:57:56 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Jean Delvare <jdelvare@suse.de>
CC:     "wsa@kernel.org" <wsa@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [i2c-tools PATCH] tools: i2cbusses: Handle bus names like
 /dev/i2c-0
Thread-Topic: [i2c-tools PATCH] tools: i2cbusses: Handle bus names like
 /dev/i2c-0
Thread-Index: AQHXUUU4lShaIvwr4kGbbJtnuax88Kr0mMMAgADmLICAChYrAIAClviA
Date:   Thu, 3 Jun 2021 22:57:56 +0000
Message-ID: <2ab0c1a3-0b75-1ff7-ae2c-7934e43204c3@alliedtelesis.co.nz>
References: <20210525090612.26157-1-chris.packham@alliedtelesis.co.nz>
 <20210526093918.73c40482@endymion>
 <a9bce37a-085b-f863-e1b0-5f5faa91f063@alliedtelesis.co.nz>
 <20210602092504.462bc28e@endymion>
In-Reply-To: <20210602092504.462bc28e@endymion>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CBB3E4A4955244FA96F3826C542998E@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=WOcBoUkR c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=r6YtysWOX24A:10 a=9414qwDsabXxwPD2zR4A:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMi8wNi8yMSA3OjI1IHBtLCBKZWFuIERlbHZhcmUgd3JvdGU6DQo+IEhpIENocmlzLA0KPg0K
PiBPbiBXZWQsIDI2IE1heSAyMDIxIDIxOjIzOjA3ICswMDAwLCBDaHJpcyBQYWNraGFtIHdyb3Rl
Og0KPj4gT24gMjYvMDUvMjEgNzozOSBwbSwgSmVhbiBEZWx2YXJlIHdyb3RlOg0KPj4+IEkgY2Fu
J3QgcmVhbGx5IHNlZSB0aGUgdmFsdWUgb2YgdGhpcyBjaGFuZ2UsIHNvcnJ5LiBZb3Ugd2FudCB0
byB1c2UgYQ0KPj4+IGxvbmdlciBwYXJhbWV0ZXIgc28geW91IGNhbiB0YWItY29tcGxldGUgaXQu
IFRoZSBvcmlnaW5hbCBwYXJhbWV0ZXIgd2FzDQo+Pj4gYSAxLSBvciAyLWRpZ2l0IG51bWJlciwg
d2hpY2ggaXMgZmFzdGVyIHRvIHR5cGUgdGhhbiAvZDx0YWI+aTI8dGFiPi4NCj4+PiBQbHVzIGlm
IHlvdSBoYXZlIG11bHRpcGxlIGkyYyBidXNlcywgdGFiIGNvbXBsZXRpb24gY2FuJ3QgZ3Vlc3Mg
d2hpY2gNCj4+PiBvbmUgeW91IHdhbnQgYW55d2F5LCBzbyB5b3UnbGwgaGF2ZSB0byB0eXBlIHRo
ZSBidXMgbnVtYmVyIGV2ZW50dWFsbHkuDQo+Pj4NCj4+PiBTbywgd2hhdCBkbyB3ZSBhY3R1YWxs
eSB3aW4gaGVyZT8NCj4+IE15IG1haW4gbW90aXZhdGlvbiB3YXMgdG8gcmVwbGFjZSBhbiBpbi1o
b3VzZSB0b29sIHRoYXQgaXMgcHJvdmlkZXMNCj4+IHNpbWlsYXIgZnVuY3Rpb25hbGl0eSBidXQg
aXQgY3VycmVudGx5IHRha2VzIHRoZSBidXMgYXMgYSBwYXRoLiBBdCBmaXJzdA0KPj4gSSBldmVu
IHRob3VnaHQgdGhlcmUgd2FzIGEgYnVnIGJlY2F1c2UgSSB0aG91Z2h0ICJvciBhbiBJMkMgYnVz
IG5hbWUiDQo+PiBtZWFudCB0aGUgcGF0aCwgaXQgd2Fzbid0IHVudGlsIEkgbG9va2VkIGF0IHRo
ZSBjb2RlIHRoYXQgSSByZWFsaXNlZA0KPj4gdGhpcyB3YXMgdGhlIG5hbWUgdXNlZCBpbiB0aGUg
a2VybmVsLg0KPiBPSywgdGhhdCdzIGEgYmV0dGVyIGV4cGxhbmF0aW9uLiBCdXQgSSdtIHN0aWxs
IG5vdCBjb252aW5jZWQgYnkgdGhlDQo+IGJlbmVmaXQuIEknbSBzdXJlIHlvdSBndXlzIGNhbiBs
ZWFybiBxdWlja2x5IHRvIHBhc3MganVzdCB0aGUgaTJjIGJ1cw0KPiBudW1iZXIgYXMgdGhlIGZp
cnN0IHBhcmFtZXRlci4gUGx1cyBJIGRvbid0IGxpa2UgeW91ciBpbXBsZW1lbnRhdGlvbg0KPiBm
b3IgdmFyaW91cyB0ZWNobmljYWwgcmVhc29ucyBhbnl3YXkgKGxpa2UgYWxsb2NhdGluZyBleHRy
YSBtZW1vcnkgZm9yDQo+IGV2ZXJ5IGJ1cyB3aGVuIHlvdSBtYXkgbmV2ZXIgYWN0dWFsbHkgbmVl
ZCBpdCwgYW5kIGhhcmQtY29kaW5nIHRoZQ0KPiAvZGV2L2kyYy08Tj4gcGF0dGVybiB3aGVuIHRo
ZXJlJ3MgYXQgbGVhc3Qgb25lIGFsdGVybmF0aXZlIHN1cHBvcnRlZCBieQ0KPiBpMmMtdG9vbHMg
YXQgdGhlIG1vbWVudCAtIGFsdGhvdWdoIEknbSB1bnN1cmUgaWYgYW55b25lIHN0aWxsIHVzZXMg
aXQpLg0KPiBTbyBJJ20gbm90IGdvaW5nIHRvIGFwcGx5IHlvdXIgcGF0Y2gsIHNvcnJ5Lg0KDQpZ
ZWFoIEkgaGFkIGEgZmV3IGdvZXMgYXQgaW1wbGVtZW50aW5nIHRoaXMuIEl0IHNlZW1lZCB0aGUg
c2ltcGxlc3QgDQpkZXNwaXRlIHRoZSBtZW1vcnkgdXNlICh3aGljaCBJIHRob3VnaHQgcHJvYmFi
bHkgd291bGRuJ3QgYmUgYSBwcm9ibGVtIA0KZ2l2ZW4gdGhlIGZhY3QgdGhlc2UgdG9vbHMgcnVu
IGFuIHRoZW4gc3RvcCkuIEkgYWxzbyB0aG91Z2h0IGFib3V0IA0KcGFzc2luZyB0aGUgYXJndW1l
bnQgZG93biB0byB0aGUgdW5kZXJseWluZyBvcGVuKCkgaWYgcGFyc2luZyBhcyBhIA0KbnVtYmVy
IG9yIG5hbWUgZmFpbGVkIGJ1dCBhZ2FpbiB0aGF0IHdvdWxkIGludm9sdmUgYSBmYWlyIGJpdCBv
ZiBjaHVybi4NCg0KPj4gT25lIGFkdmFudGFnZSBJIGNhbiBzZWUgaXMgdGhhdCB0aGUgL2Q8dGFi
Pi9pMjx0YWI+IGltcGxpY2l0bHkgdmFsaWRhdGVzDQo+PiB0aGF0IHRoZSBidXMgYWN0dWFsbHkg
ZXhpc3RzIChhc3N1bWluZyAvZGV2IGlzIG1hbmFnZWQgYnkgZGV2dG1wZnMNCj4+IGFuZC9vciB1
ZGV2KS4NCj4gVGhhdCdzIG5vdCBhbiBhZHZhbnRhZ2UuIFJ1bm5pbmcgdGhlIGNvbW1hbmQgb24g
dGhlIHdyb25nIEkyQyBidXMgY291bGQNCj4gaGF2ZSBiYWQgY29uc2VxdWVuY2VzLiBUaGUgb25s
eSBzYWZlIHdheSB0byB1c2UgdGhlIHRvb2wgd2l0aG91dA0KPiBjaGVja2luZyB0aGUgbGlzdCBv
ZiBhdmFpbGFibGUgaTJjIGJ1c2VzIGZpcnN0IGlzIHRvIHNlbGVjdCB0aGUgSTJDIGJ1cw0KPiBi
eSBuYW1lLg0KDQpZZXMgSSBzZWUgeW91ciBwb2ludC4gTW9zdGx5IHdlIHVzZSB0aGVzZSB0b29s
cyBmb3IgZGVidWdnaW5nIGJyb2tlbiANCnN5c3RlbXMgYW55d2F5IHNvICJiYWQgY29uc2VxdWVu
Y2VzIiBoYXZlIGFscmVhZHkgaGFwcGVuZWQuDQoNClNvdW5kcyBsaWtlIHNvbWUgcmUtdHJhaW5p
bmcgb2YgZmluZ2VycyBpcyB0aGUgYmVzdCBhcHByb2FjaC4NCg==
