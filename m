Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A565C33C797
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Mar 2021 21:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233358AbhCOUSh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Mar 2021 16:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232891AbhCOUSZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Mar 2021 16:18:25 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98040C06174A
        for <linux-i2c@vger.kernel.org>; Mon, 15 Mar 2021 13:18:23 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 692DF891AE;
        Tue, 16 Mar 2021 09:18:19 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1615839499;
        bh=luKi64aIY+/ibrLdVngtmg1fzqbZRWqc2Ry+rXTq2ok=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=fRtyfWoI7IQtVYgBePyynH2qW6hWe3gaWIsayRLd22XXP9w6spqjQFTk4ZHsxvb41
         OO+e93bFdzsAf31AOYat9q5YrsjwgEDX5xxk41q1iO8/CwabCdNkEGIt9XqpIuviFK
         VN2wkenWlAA7Mb7qQe8h0EVJHPsVy7EFoHb0TBAtTvJEjfH4NNOtYyXGKRaOCpOyrq
         3g++a+yQzz2uRKCYDI0FK8bI+zijsaOucv7/Ed5KTtPdiQVaNwjbBgzM5PlIeo8ata
         Lw7NoPeJcvaNkFI2m3BAJ0MwtMbLFiuHRQo3PzeXjrYHA0p6ziLCMpeIbyP3cmOd2j
         x/dU8Kt8f8RuA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B604fc10b0001>; Tue, 16 Mar 2021 09:18:19 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 16 Mar 2021 09:18:19 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Tue, 16 Mar 2021 09:18:19 +1300
From:   Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>
To:     "klaus.kudielka@gmail.com" <klaus.kudielka@gmail.com>,
        "wsa@kernel.org" <wsa@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: Linux 5.11: i2c: Confusing error message
Thread-Topic: Linux 5.11: i2c: Confusing error message
Thread-Index: AQHXGWia5uOyRJkTsUmiXEpKOwJjiaqEo+0A
Date:   Mon, 15 Mar 2021 20:18:18 +0000
Message-ID: <66fb30d6595ea18f60acf36e6b034e63ec7aac19.camel@alliedtelesis.co.nz>
References: <1787a9ee-efae-7e4b-9e6f-d4bf532c6b63@gmail.com>
In-Reply-To: <1787a9ee-efae-7e4b-9e6f-d4bf532c6b63@gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:23:5d9a:c58:b8f9:70b2]
Content-Type: text/plain; charset="utf-8"
Content-ID: <20FED36D2602244BB86138259274E03C@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=l_eoD-IaIL000fPAJOwA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gTW9uLCAyMDIxLTAzLTE1IGF0IDA3OjU4ICswMTAwLCBLbGF1cyBLdWRpZWxrYSB3cm90ZToN
Cj4gSGVsbG8sDQo+IA0KPiBJIHJlY2VudGx5IHVwZ3JhZGVkIG15IFR1cnJpcyBPbW5pYSAoTWFy
dmVsbCBBcm1hZGEgMzg1KSB0byA1LjExLCBhbmQgDQo+IG5vdyBnZXQgdGhlIGZvbGxvd2luZyBl
cnJvciBtZXNzYWdlIGR1cmluZyBib290Og0KPiANCj4gICAgICBpMmMgaTJjLTA6IE5vdCB1c2lu
ZyByZWNvdmVyeTogbm8gcmVjb3Zlcl9idXMoKSBmb3VuZA0KPiANCj4gSXMgdGhpcyB0aGUgaW50
ZW5kZWQgYmVoYXZpb3VyPw0KPiBQZXJzb25hbGx5LCBJIGJlbGlldmUgYW4gImVycm9yIiBtZXNz
YWdlIGlzIHF1aXRlIHN0cm9uZyBmb3IgdGhpcyBjb21tb24gDQo+IHNjZW5hcmlvLCBhbmQgYSBi
aXQgbWlzbGVhZGluZy4NCj4gDQo+IFRoYW5rcywgS2xhdXMNCj4gDQoNCkkgYWRtaXQgdGhhdCBJ
IGFkZGVkIGEgImdwaW8iIHN0YXRlIHRvIHBpbmN0cmwgZm9yIG91ciBib2FyZCwgc28gZGlkbid0
DQpzZWUgdGhpcyBlcnJvciBtZXNzYWdlLiBJIHRoaW5rIHRoZSBlYXNpZXN0IGZpeCBmb3IgdGhp
cyBpcyB0byBjaGVjayB0aGF0DQp0aGUgZ3BpbyBwaW5jdHJsIHN0YXRlIGV4aXN0cy4gZS5nLiBz
b21ldGhpbmcgbGlrZToNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXY2
NHh4eC5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdjY0eHh4LmMNCmluZGV4IGM1OTBkMzZi
NWZkMS4uNTVjMzY2ZjQwMmYyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1t
djY0eHh4LmMNCisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXY2NHh4eC5jDQpAQCAtODk0
LDYgKzg5NCw5IEBAIHN0YXRpYyBpbnQgbXY2NHh4eF9pMmNfaW5pdF9yZWNvdmVyeV9pbmZvKHN0
cnVjdCBtdjY0eHh4X2kyY19kYXRhICpkcnZfZGF0YSwNCiAgICAgICAgICAgICAgICByZXR1cm4g
UFRSX0VSUihyaW5mby0+cGluY3RybCk7DQogICAgICAgIH0gZWxzZSBpZiAoIXJpbmZvLT5waW5j
dHJsKSB7DQogICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQorICAgICAgIH0gZWxzZSBp
ZiAoSVNfRVJSKHBpbmN0cmxfbG9va3VwX3N0YXRlKHJpbmZvLT5waW5jdHJsLCAiZ3BpbyIpKSkg
ew0KKyAgICAgICAgICAgICAgIGRldl9pbmZvKGRldiwgInBpbmN0cmwgc3RhdGVzIGluY29tcGxl
dGUgZm9yIHJlY292ZXJ5XG4iKTsNCisgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsNCiAg
ICAgICAgfQ0KIA0KICAgICAgICBkcnZfZGF0YS0+YWRhcHRlci5idXNfcmVjb3ZlcnlfaW5mbyA9
IHJpbmZvOw0KDQo=
