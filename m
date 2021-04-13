Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEDA735E9AB
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 01:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232859AbhDMXYS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 19:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbhDMXYR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 19:24:17 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18B0C061574
        for <linux-i2c@vger.kernel.org>; Tue, 13 Apr 2021 16:23:55 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 94A16891AE;
        Wed, 14 Apr 2021 11:23:46 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618356226;
        bh=7BXyXz7XF67i618vjKfQus9gr82E9+wbyyE4OdZtW00=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=jqiUV2kJz7TCuZ058JE19SPw7GNa5IE/JafViIkYYMSCw8dcvsy3lRUwlsmGyHoUE
         slabhylB5qWavaNtlepq448yTIRB3uUOd1Z1XIt5EMMJ9YOb8sehrNVdDBBxYT9arl
         V40/b05fAmdrWPKj9TzL+G7jCg1HyQNUIRdyOaABGMZOdWDwP4V2zdbOY4rvFJWj71
         imXBb8b2IR6TfD9p5XXLxzzmS83rEGLyzY9IkK0NrIdcF7SZ+yDeSGZnr8Ns8ereDQ
         f7hgFgzFGnXiN3IlNS/kMrFAWi6BPA3Q5hqo97cbB/015xru67YWxp86oNQWPClQ6z
         /GQZbSttYiehg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B607628020001>; Wed, 14 Apr 2021 11:23:46 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 14 Apr 2021 11:23:46 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Wed, 14 Apr 2021 11:23:46 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] i2c: mpc: Interrupt driven transfer
Thread-Topic: [PATCH v3 2/4] i2c: mpc: Interrupt driven transfer
Thread-Index: AQHXMCNCEeDrN5NOHkKnCG2Hfg5PhKqxrvOAgACQNYCAAA9/gA==
Date:   Tue, 13 Apr 2021 23:23:45 +0000
Message-ID: <e12dea50-5fae-c31c-46e6-572488ca9ca1@alliedtelesis.co.nz>
References: <20210413050956.23264-1-chris.packham@alliedtelesis.co.nz>
 <20210413050956.23264-3-chris.packham@alliedtelesis.co.nz>
 <CAHp75VfR2zNmstvqCSRC2=0hf2DRV7sMdmy9-TDkO07KHwLjGA@mail.gmail.com>
 <09f636b8-c126-af14-fbc3-9d6becb15df5@alliedtelesis.co.nz>
In-Reply-To: <09f636b8-c126-af14-fbc3-9d6becb15df5@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B69C28C37346074B88F671843760A770@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=3YhXtTcJ-WEA:10 a=eNUNs3TaXVfNfvT2jpkA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAxNC8wNC8yMSAxMDoyOCBhbSwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4NCj4gT24gMTQv
MDQvMjEgMTo1MiBhbSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPj4gT24gVHVlLCBBcHIgMTMs
IDIwMjEgYXQgODoxMCBBTSBDaHJpcyBQYWNraGFtDQo+PiA8Y2hyaXMucGFja2hhbUBhbGxpZWR0
ZWxlc2lzLmNvLm56PiB3cm90ZToNCj4+PiBUaGUgZnNsLWkyYyBjb250cm9sbGVyIHdpbGwgZ2Vu
ZXJhdGUgYW4gaW50ZXJydXB0IGFmdGVyIGV2ZXJ5IGJ5dGUNCj4+PiB0cmFuc2ZlcnJlZC4gTWFr
ZSB1c2Ugb2YgdGhpcyBpbnRlcnJ1cHQgdG8gZHJpdmUgYSBzdGF0ZSBtYWNoaW5lIHdoaWNoDQo+
Pj4gYWxsb3dzIHRoZSBuZXh0IHBhcnQgb2YgYSB0cmFuc2ZlciB0byBoYXBwZW4gYXMgc29vbiBh
cyB0aGUgDQo+Pj4gaW50ZXJydXB0IGlzDQo+Pj4gcmVjZWl2ZWQuIFRoaXMgaXMgcGFydGljdWxh
cmx5IGhlbHBmdWwgd2l0aCBTTUJVUyBkZXZpY2VzIGxpa2UgdGhlIExNODENCj4+PiB3aGljaCB3
aWxsIHRpbWVvdXQgaWYgd2UgdGFrZSB0b28gbG9uZyBiZXR3ZWVuIGJ5dGVzIGluIGEgdHJhbnNm
ZXIuDQo+PiBBbHNvIHNlZSBteSBvdGhlciBjb21tZW50cyBiZWxvdy4NCj4+DQo+PiAuLi4NCj4+
DQouLi4NCj4+DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2RiZyhpMmMt
PmRldiwgIiVzOiAlcyAlMDJ4XG4iLCBfX2Z1bmNfXywNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWN0aW9uX3N0cltpMmMtPmFjdGlvbl0sIGJ5dGUp
Ow0KPj4gWW91IGFscmVhZHkgcHJpbnRlZCBhY3Rpb24uIEFueXRoaW5nIGNoYW5nZWQ/DQo+IEl0
J3MgbWFpbmx5IHRoZSBhZGRpdGlvbiBvZiB0aGUgYnl0ZSByZWFkLiBJIGNvdWxkbid0IGZpZ3Vy
ZSBvdXQgYSANCj4gc2Vuc2libGUgd2F5IG9mIGFsd2F5cyBwcmludGluZyB0aGUgYWN0aW9uIHRo
ZW4gYXBwZW5kaW5nIHRoZSBkYXRhIGluIA0KPiB0aGUgcmVhZC93cml0ZSBjYXNlLiBPcGVuIHRv
IHN1Z2dlc3Rpb25zLg0KPj4NCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZf
ZGJnKGkyYy0+ZGV2LCAiJXM6ICVzICUwMnhcbiIsIF9fZnVuY19fLA0KPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhY3Rpb25fc3RyW2kyYy0+YWN0aW9u
XSwgDQo+Pj4gbXNnLT5idWZbaTJjLT5ieXRlX3Bvc25dKTsNCj4+IERlZHVwbGljYXRlIHRoaXMu
IFBlcmhhcHMgYXQgdGhlIGVuZCBvZiBzd2l0Y2gtY2FzZSBwcmludCBvbmNlIHdpdGgNCj4+IHdo
YXRldmVyIHRlbXBvcmFyeSB2YXJpYWJsZSB2YWx1ZSB5b3Ugd2FudCB0by4NCj4+DQo+PiAuLi4N
Cj4gSSB0aG91Z2h0IGFib3V0IHRoaXMgYnV0IGRlY2lkZWQgbm90IHRvIGJlY2F1c2UgaW4gdGhl
IHdyaXRlIGNhc2UgaXQncyANCj4gcHJpbnRlZCBiZWZvcmUgZ29pbmcgdG8gaGFyZHdhcmUgYW5k
IGluIHRoZSByZWFkIGNhc2UgaXQncyBhZnRlci4gSWYgSSANCj4gbW92ZWQgaXQgYWZ0ZXIgdGhl
IGNhc2UgSSdkIGhhdmUgdG8gdXNlIHNvbWV0aGluZyBvdGhlciB0aGFuIA0KPiBpMmMtPmJ5dGVf
cG9zbiB3aGljaCBzZWVtZWQgZXJyb3IgcHJvbmUuDQpJIGxvb2tlZCBhdCBhIGZldyBvcHRpb25z
IGZvciB0aGlzLiBBdm9pZGluZyByZXBlYXRpbmcgdGhlIGFjdGlvbiBpcyANCmRvYWJsZSBidXQg
SSBmZWVsIGl0IG5lZWRzIHRvIGJlIHJlcGxhY2VkIGJ5IHNvbWV0aGluZyBvdGhlcndpc2UgaXQn
cyANCmp1c3QgYSByYW5kb20gYnl0ZSB2YWx1ZSBpbiB0aGUgb3V0cHV0IChlLmcuICJidWYgPSAi
LyJieXRlID0gIikuIA0KUm9sbGluZyBldmVyeXRoaW5nIGludG8gYSBzaW5nbGUgbGluZSBvZiBv
dXRwdXQgc2VlbXMgcmVhbGx5IGhhcmQgdG8gZG8gDQp0byBjb3ZlciBhbGwgdGhlIHBvc3NpYmxl
IGFjdGlvbnMuDQoNCkNvbXBsZXRlbHkgZGVkdXBsaWNhdGluZyB0aGlzIG1lYW5zIEkgbmVlZCB0
byBhZGQgY29kZSB0byBzdG9yZSB0aGUgDQphY3Rpb24gYmVmb3JlIHRoZSBjYXNlIGFuZCBjaGVj
ayBpdCBhZnRlcndhcmQgd2hpY2ggd2lsbCBydW4gYWxsIHRoZSANCnRpbWUuIFRoaXMgc2VlbXMg
b3ZlcmtpbGwgZm9yIHRoZSBzYWtlIG9mIGF2b2lkaW5nIGR1cGxpY2F0ZSBjb2RlIHdoaWNoIA0K
aXMgdXN1YWxseSBjb21waWxlZCBvdXQuDQoNCkknbSBlcnJpbmcgb24gdGhlIHNpZGUgb2YganVz
dCByZW1vdmluZyBfX2Z1bmNfXyBhbmQgbGVhdmluZyB0aGUgcmVzdCANCmFzLWlzLiBVbmxlc3Mg
eW91IGZlZWwgcmVhbGx5IHN0cm9uZ2x5IHRoYXQgc29tZXRoaW5nIGVsc2Ugc2hvdWxkIGJlIGRv
bmUuDQoNCk9uZSBvcHRpb24gbm90IG1lbnRpb25lZCBpcyB0byByZW1vdmUgdGhlc2UgdHdvIGRl
YnVnIHN0YXRlbWVudHMuIEknZCBiZSANCk9LIHdpdGggdGhhdC4NCg0K
