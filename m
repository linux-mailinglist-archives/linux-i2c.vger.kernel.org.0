Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 977BF35E903
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 00:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347276AbhDMW2n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 18:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345557AbhDMW2m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 18:28:42 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D18C061574
        for <linux-i2c@vger.kernel.org>; Tue, 13 Apr 2021 15:28:21 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 83C94891AE;
        Wed, 14 Apr 2021 10:28:18 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618352898;
        bh=RxrNCKMwhAy/Fnw4Mqa90d74D72/M5uhkvxBLfVuIpE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=sy278UyoHWq9WGpL2I13Rm1Z0AKjsl02z0XyS+VjY0hLnk9ZU/X3iRPSJg4tgF6Jc
         LmsvUMht8QTyWCVake34uT5jbKS0AzEP1tzgvs9I6iP3caob2ODizaPRQgf7+JteuP
         mB6AlneQDw6iJvN4PZmlSyiHxI6UeRcIXs/ZPUcs9qJo6iNYleROhRxhGDdCoWfKG/
         ql0BivYJvDwwzqZcrNR4CaWzREt93tbjMU5lF/1mRZtJpvFaWPDF6fIPPHPmpQ9N5r
         gou0Wxe1f70iLhxncr27y/P86kTFQIKxeWpKFJ41/DTFvJm7+BjuDLBwUW3sk60FCU
         74FFj4WW28EWQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60761b020001>; Wed, 14 Apr 2021 10:28:18 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 14 Apr 2021 10:28:18 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Wed, 14 Apr 2021 10:28:18 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] i2c: mpc: Interrupt driven transfer
Thread-Topic: [PATCH v3 2/4] i2c: mpc: Interrupt driven transfer
Thread-Index: AQHXMCNCEeDrN5NOHkKnCG2Hfg5PhKqxrvOAgACQNYA=
Date:   Tue, 13 Apr 2021 22:28:17 +0000
Message-ID: <09f636b8-c126-af14-fbc3-9d6becb15df5@alliedtelesis.co.nz>
References: <20210413050956.23264-1-chris.packham@alliedtelesis.co.nz>
 <20210413050956.23264-3-chris.packham@alliedtelesis.co.nz>
 <CAHp75VfR2zNmstvqCSRC2=0hf2DRV7sMdmy9-TDkO07KHwLjGA@mail.gmail.com>
In-Reply-To: <CAHp75VfR2zNmstvqCSRC2=0hf2DRV7sMdmy9-TDkO07KHwLjGA@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB84BF9A6EA3E94B92BF6C3C137A0BA9@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=3YhXtTcJ-WEA:10 a=AUvUAFASbHWzQvhM9VkA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAxNC8wNC8yMSAxOjUyIGFtLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+IE9uIFR1ZSwg
QXByIDEzLCAyMDIxIGF0IDg6MTAgQU0gQ2hyaXMgUGFja2hhbQ0KPiA8Y2hyaXMucGFja2hhbUBh
bGxpZWR0ZWxlc2lzLmNvLm56PiB3cm90ZToNCj4+IFRoZSBmc2wtaTJjIGNvbnRyb2xsZXIgd2ls
bCBnZW5lcmF0ZSBhbiBpbnRlcnJ1cHQgYWZ0ZXIgZXZlcnkgYnl0ZQ0KPj4gdHJhbnNmZXJyZWQu
IE1ha2UgdXNlIG9mIHRoaXMgaW50ZXJydXB0IHRvIGRyaXZlIGEgc3RhdGUgbWFjaGluZSB3aGlj
aA0KPj4gYWxsb3dzIHRoZSBuZXh0IHBhcnQgb2YgYSB0cmFuc2ZlciB0byBoYXBwZW4gYXMgc29v
biBhcyB0aGUgaW50ZXJydXB0IGlzDQo+PiByZWNlaXZlZC4gVGhpcyBpcyBwYXJ0aWN1bGFybHkg
aGVscGZ1bCB3aXRoIFNNQlVTIGRldmljZXMgbGlrZSB0aGUgTE04MQ0KPj4gd2hpY2ggd2lsbCB0
aW1lb3V0IGlmIHdlIHRha2UgdG9vIGxvbmcgYmV0d2VlbiBieXRlcyBpbiBhIHRyYW5zZmVyLg0K
PiBBbHNvIHNlZSBteSBvdGhlciBjb21tZW50cyBiZWxvdy4NCj4NCj4gLi4uDQo+DQo+PiArLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gSSB0aGluayBpdCBpcyBiZXR0ZXIg
dG8gc3BsaXQgdGhpcyB3aXRoIGEgcmVtb3ZhbCBvZiBvbGQgc3R1ZmYgYW5kDQo+IHVwZGF0aW5n
IGEgY29weXJpZ2h0IG5vdGljZSBhbmQgZ28gYXMgYSBsYXN0IG9uZSBpbiB0aGUgc2VyaWVzLg0K
Pg0KPiAuLi4NCkhhdmUgc3BsaXQgb3V0IGludG8gbmV3IHBhdGNoLg0KPj4gK3N0YXRpYyBjaGFy
ICphY3Rpb25fc3RyW10gPSB7DQo+IHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgYWN0aW9uX3N0
cltdDQpBY2suDQo+PiArICAgICAgICJpbnZhbGlkIiwNCj4+ICsgICAgICAgInN0YXJ0IiwNCj4+
ICsgICAgICAgInJlc3RhcnQiLA0KPj4gKyAgICAgICAicmVhZCBiZWdpbiIsDQo+PiArICAgICAg
ICJyZWFkIiwNCj4+ICsgICAgICAgIndyaXRlIiwNCj4+ICsgICAgICAgInN0b3AiLA0KPj4gK307
DQo+IC4uLg0KPg0KPj4gKyAgICAgICBkZXZfZGJnKGkyYy0+ZGV2LCAiJXM6IGFjdGlvbiA9ICVz
XG4iLCBfX2Z1bmNfXywNCj4+ICsgICAgICAgICAgICAgICBhY3Rpb25fc3RyW2kyYy0+YWN0aW9u
XSk7DQo+IERyb3AgdXNlbGVzcyBfX2Z1bmNfXy4gV2l0aCBEeW5hbWljIERlYnVnIGVuYWJsZWQg
aXQgY2FuIGJlIHR1cm5lZCBvbg0KPiBhbmQgb2ZmIGF0IHJ1biB0aW1lLg0KDQpBY2suIE90aGVy
IGluc3RhbmNlcyBvZiBfX2Z1bmNfXyBhbHNvLg0KDQo+DQo+IC4uLg0KPg0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgLyogR2VuZXJhdGUgdHhhY2sgb24gbmV4dCB0byBsYXN0IGJ5dGUgKi8N
Cj4gVHggQUNLID8gRGl0dG8gZm9yIG90aGVyIGNvbW1lbnRzLg0KPg0KPiAuLi4NCkFDSy4NCj4N
Cj4+ICsgICAgICAgICAgICAgICBkZXZfZGJnKGkyYy0+ZGV2LCAiJXM6ICVzICUwMnhcbiIsIF9f
ZnVuY19fLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgYWN0aW9uX3N0cltpMmMtPmFjdGlv
bl0sIGJ5dGUpOw0KPiBZb3UgYWxyZWFkeSBwcmludGVkIGFjdGlvbi4gQW55dGhpbmcgY2hhbmdl
ZD8NCkl0J3MgbWFpbmx5IHRoZSBhZGRpdGlvbiBvZiB0aGUgYnl0ZSByZWFkLiBJIGNvdWxkbid0
IGZpZ3VyZSBvdXQgYSANCnNlbnNpYmxlIHdheSBvZiBhbHdheXMgcHJpbnRpbmcgdGhlIGFjdGlv
biB0aGVuIGFwcGVuZGluZyB0aGUgZGF0YSBpbiANCnRoZSByZWFkL3dyaXRlIGNhc2UuIE9wZW4g
dG8gc3VnZ2VzdGlvbnMuDQo+DQo+PiArICAgICAgICAgICAgICAgZGV2X2RiZyhpMmMtPmRldiwg
IiVzOiAlcyAlMDJ4XG4iLCBfX2Z1bmNfXywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGFj
dGlvbl9zdHJbaTJjLT5hY3Rpb25dLCBtc2ctPmJ1ZltpMmMtPmJ5dGVfcG9zbl0pOw0KPiBEZWR1
cGxpY2F0ZSB0aGlzLiBQZXJoYXBzIGF0IHRoZSBlbmQgb2Ygc3dpdGNoLWNhc2UgcHJpbnQgb25j
ZSB3aXRoDQo+IHdoYXRldmVyIHRlbXBvcmFyeSB2YXJpYWJsZSB2YWx1ZSB5b3Ugd2FudCB0by4N
Cj4NCj4gLi4uDQpJIHRob3VnaHQgYWJvdXQgdGhpcyBidXQgZGVjaWRlZCBub3QgdG8gYmVjYXVz
ZSBpbiB0aGUgd3JpdGUgY2FzZSBpdCdzIA0KcHJpbnRlZCBiZWZvcmUgZ29pbmcgdG8gaGFyZHdh
cmUgYW5kIGluIHRoZSByZWFkIGNhc2UgaXQncyBhZnRlci4gSWYgSSANCm1vdmVkIGl0IGFmdGVy
IHRoZSBjYXNlIEknZCBoYXZlIHRvIHVzZSBzb21ldGhpbmcgb3RoZXIgdGhhbiANCmkyYy0+Ynl0
ZV9wb3NuIHdoaWNoIHNlZW1lZCBlcnJvciBwcm9uZS4NCj4NCj4+ICsgICAgICAgY2FzZSBNUENf
STJDX0FDVElPTl9JTlZBTElEOg0KPj4gKyAgICAgICBkZWZhdWx0Og0KPiBEb2VzIHRoZSBmaXJz
dCBvbmUgZGVzZXJ2ZSBsb3VkIFdBUk4/DQo+IE90aGVyd2lzZSwgd2h5IGlzIGl0IGRlZmluZWQg
YXQgYWxsPw0KSSBhZGRlZCBNUENfSTJDX0FDVElPTl9JTlZBTElEIHRvIG1ha2Ugc3VyZSB0aGF0
IGEgdmFsdWUgb2YgMCB3YXMgbm90IA0Kc29tZXRoaW5nIHRoYXQgd291bGQgbmF0dXJhbGx5IGhh
cHBlbiB2aWEgYSB6ZXJvZWQgaW5pdGlhbGl6YXRpb24uIEkgDQpjb3VsZCBwcm9iYWJseSBhY2hp
ZXZlIHRoZSBzYW1lIHRoaW5nIGJ5IG1ha2luZyBNUENfSTJDX0FDVElPTl9TVEFSVCA9IDEuDQo+
PiArICAgICAgICAgICAgICAgV0FSTigxLCAiVW5leHBlY3RlZCBhY3Rpb24gJWRcbiIsIGkyYy0+
YWN0aW9uKTsNCj4+ICsgICAgICAgICAgICAgICBicmVhazsNCj4gLi4uDQo+DQo+PiArc3RhdGlj
IHZvaWQgbXBjX2kyY19kb19pbnRyKHN0cnVjdCBtcGNfaTJjICppMmMsIHU4IHN0YXR1cykNCj4+
ICAgew0KPj4gKyAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmaTJjLT5sb2NrLCBmbGFncyk7DQo+
IFdoeSBfaXJxc2F2ZT8NCj4NCj4gLi4uDQpQcmltYXJpbHkgYmVjYXVzZSBpdCdzIHRoZSBvbmx5
IG9uZSBJJ3ZlIGV2ZXIgdXNlZCBhbmQgaXQgd2FzIHRoZSBvbmUgDQpzaW1pbGFyIGkyYyBkcml2
ZXJzIHVzZWQgd2hlbiBJIHN0YXJ0ZWQgdGhpcyB3b3JrLiBJIHNlZSB0aGV5J3ZlIG5vdyANCmJl
ZW4gdXBkYXRlZCBzbyBJIGRvbid0IHRoaW5rIHRoZXJlIHdpbGwgYmUgYSBwcm9ibGVtIHN3aXRj
aGluZyB0byANCnNwaW5fbG9jaygpLg0KPj4gKyAgICAgICAgICAgICAgIGRldl9kYmcoaTJjLT5k
ZXYsICJhcmJpcml0cmF0aW9uIGxvc3RcbiIpOw0KPiBhcmJpdHJhdGlvbg0KQWNrLg0KPiAuLi4N
Cj4NCj4+ICsgICAgICAgaWYgKGkyYy0+ZXhwZWN0X3J4YWNrICYmIChzdGF0dXMgJiBDU1JfUlhB
SykpIHsNCj4+ICsgICAgICAgICAgICAgICBkZXZfZGJnKGkyYy0+ZGV2LCAibm8gUlhBS1xuIik7
DQo+IFlvdSBzZWUsIHlvdSBoYXZlIHRvIGJlIGNvbnNpc3RlbnQgaW4gY29tbWVudHMgYW5kIG1l
c3NhZ2VzLg0KPiBFaXRoZXIgdXNlIFRYQUsvUlhBSywgb3IgbW9yZSB2ZXJib3NlICdUeCBBQ0sv
UnggQUNLJyBldmVyeXdoZXJlLg0KPg0KPiAuLi4NClVwZGF0ZWQgdG8gIlJ4IEFDSyIuIEkgdGhp
bmsgSSd2ZSBnb3QgdGhlbSBhbGwgbm93Lg0KPg0KPj4gK291dDoNCj4gb3V0X3VubG9jazoNCj4N
Cj4+ICsgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaTJjLT5sb2NrLCBmbGFncyk7DQo+
IC4uLg0KPg0KPj4gK3N0YXRpYyBpcnFyZXR1cm5fdCBtcGNfaTJjX2lzcihpbnQgaXJxLCB2b2lk
ICpkZXZfaWQpDQo+PiArew0KPj4gKyAgICAgICBzdHJ1Y3QgbXBjX2kyYyAqaTJjID0gZGV2X2lk
Ow0KPj4gKyAgICAgICB1OCBzdGF0dXMgPSByZWFkYihpMmMtPmJhc2UgKyBNUENfSTJDX1NSKTsN
Cj4gSSB3b3VsZCBzcGxpdCB0aGlzIGFzc2lnbm1lbnQsIHNvIGl0IHdpbGwgYmUgY2xvc2VyIHRv
IGl0cyB1c2VyLg0KQWNrLg0KPj4gKyAgICAgICBpZiAoc3RhdHVzICYgQ1NSX01JRikgew0KPj4g
KyAgICAgICAgICAgICAgIHdyaXRlYigwLCBpMmMtPmJhc2UgKyBNUENfSTJDX1NSKTsNCj4+ICsg
ICAgICAgICAgICAgICBtcGNfaTJjX2RvX2ludHIoaTJjLCBzdGF0dXMpOw0KPj4gKyAgICAgICAg
ICAgICAgIHJldHVybiBJUlFfSEFORExFRDsNCj4+ICAgICAgICAgIH0NCj4+ICsgICAgICAgcmV0
dXJuIElSUV9OT05FOw0KPj4gK30NCj4gLi4uDQo+DQo+PiArICAgICAgIHRpbWVfbGVmdCA9IHdh
aXRfZXZlbnRfdGltZW91dChpMmMtPndhaXRxLCAhaTJjLT5ibG9jaywgaTJjLT5hZGFwLnRpbWVv
dXQpOw0KPj4gKw0KPiBObyBuZWVkIGZvciBhIGJsYW5rIGxpbmUgaGVyZS4NCkFjay4NCj4+ICsg
ICAgICAgaWYgKCF0aW1lX2xlZnQpDQo+PiArICAgICAgICAgICAgICAgaTJjLT5yYyA9IC1FVElN
RURPVVQ7DQo+PiArICAgICAgIGVsc2UgaWYgKHRpbWVfbGVmdCA8IDApDQo+IFJlZHVuZGFudCAn
ZWxzZScNCkFjay4NCj4+ICsgICAgICAgICAgICAgICBpMmMtPnJjID0gdGltZV9sZWZ0Ow0KPiBD
YW4ndCB5b3UgcmV0dXJuIGFuIGVycm9yIGNvZGUgZnJvbSBoZXJlLCByYXRoZXIgdGhhbiBpbmpl
Y3RpbmcgaXQNCj4gc29tZXdoZXJlIHdoZXJlIGl0IGRvZXNuJ3QgYmVsb25nIHRvPw0KWWVzIEkg
dGhpbmsgc28uIElmIEkgbWFrZSBtcGNfaTJjX3dhaXRfZm9yX2NvbXBsZXRpb24oKSByZXR1cm4g
YW4gaW50IA0KdGhlbiBoYXZlIG1wY19pMmNfZXhlY3V0ZV9tc2coKSBjaGVjayBpdCBhbmQgc2V0
IGkyYy0+cmMgaWYgbmVlZGVkLg0KPj4gICB9DQo+IC0tDQo+IFdpdGggQmVzdCBSZWdhcmRzLA0K
PiBBbmR5IFNoZXZjaGVua28=
