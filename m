Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B19577BAEDE
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Oct 2023 00:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbjJEWjM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Oct 2023 18:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbjJEWjL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Oct 2023 18:39:11 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7DC8D6
        for <linux-i2c@vger.kernel.org>; Thu,  5 Oct 2023 15:39:08 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DDFD42C07F0;
        Fri,  6 Oct 2023 11:39:04 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1696545544;
        bh=Jln0tzUpoR2xr/aeOoHAnxoXo48BHvn0YAHWLviV5iA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=E1XFAgsZxIZ6ukokAFv30wxjhY9eMRuvSAg2OsJM5WbeqXUceAeGCbXvFbE4C3aNv
         8klwjIHEbo6/BIj8NSnYX7dz7ZiT8saxcrtGtLf4fqZrkma/krIK48VqCkNPZvjmCv
         iy2nPoAhbv83VU5ICi+PddeFUfnnjx3ZCVdCkQCha4nwBUvGjIS5TLYXivjA4FwWaA
         THaCSdMa12jUmqHp3bW00gTibJ0DiMoMg9qhEFPrJcLD2qMUb7K1000Lu3bbiqi6eq
         XlgnJnjCREXpNtpx9YPsIn7TQdfAKOxUqsFWMlSqVWOlcTcMF7U1jurWvZVWEtBAAd
         ZfcrAiho28kog==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B651f3b080001>; Fri, 06 Oct 2023 11:39:04 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.37; Fri, 6 Oct 2023 11:39:04 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Fri, 6 Oct 2023 11:39:04 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.037; Fri, 6 Oct 2023 11:39:04 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "pierre.gondois@arm.com" <pierre.gondois@arm.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] i2c: mv64xxx: add support for FSM based recovery
Thread-Topic: [PATCH 3/3] i2c: mv64xxx: add support for FSM based recovery
Thread-Index: AQHZ8NPnYKzvy/9jwESCWo7X3TBvqLA68pMAgAALUoA=
Date:   Thu, 5 Oct 2023 22:39:03 +0000
Message-ID: <57c27eb5-1145-4a84-a7b6-ff785d7a1eeb@alliedtelesis.co.nz>
References: <20230926234801.4078042-1-chris.packham@alliedtelesis.co.nz>
 <20230926234801.4078042-4-chris.packham@alliedtelesis.co.nz>
 <20231005215832.p4mxov6occzqmj2k@zenone.zhora.eu>
In-Reply-To: <20231005215832.p4mxov6occzqmj2k@zenone.zhora.eu>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFDC78327C2D514A97030AEF06C8B8A5@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=Vf2Jw2h9 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=FqOU3ekQ0Ek1LeW_-iAA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiA2LzEwLzIzIDEwOjU4LCBBbmRpIFNoeXRpIHdyb3RlOg0KPiBIaSBDaHJpcywNCj4NCj4g
TG9va3MgZ29vZCwganVzdCBhIGZldyBxdWVzdGlvbnMuDQo+DQo+PiArc3RhdGljIGludA0KPj4g
K212NjR4eHhfaTJjX3JlY292ZXJfYnVzKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCkNCj4+ICt7
DQo+PiArCXN0cnVjdCBtdjY0eHh4X2kyY19kYXRhICpkcnZfZGF0YSA9IGkyY19nZXRfYWRhcGRh
dGEoYWRhcCk7DQo+PiArCWludCByZXQ7DQo+PiArCXUzMiB2YWw7DQo+PiArDQo+PiArCWRldl9k
YmcoJmFkYXAtPmRldiwgIlRyeWluZyBpMmMgYnVzIHJlY292ZXJ5XG4iKTsNCj4+ICsJd3JpdGVs
KE1WNjRYWFhfSTJDX1VOU1RVQ0tfVFJJR0dFUiwgZHJ2X2RhdGEtPnVuc3R1Y2tfcmVnKTsNCj4+
ICsJcmV0ID0gcmVhZGxfcG9sbF90aW1lb3V0X2F0b21pYyhkcnZfZGF0YS0+dW5zdHVja19yZWcs
IHZhbCwNCj4+ICsJCQkJCSEodmFsICYgTVY2NFhYWF9JMkNfVU5TVFVDS19JTlBST0dSRVNTKSwN
Cj4+ICsJCQkJCTEwMDAsIDUwMDApOw0KPiBoZXJlIHlvdSBhcmUgYnVzeSBsb29waW5nIGZvciAx
bXMgYmV0d2VlbiByZWFkcyB3aGljaCBpcyBhIGxvbmcNCj4gdGltZS4gV2h5IG5vdCB1c2luZyBy
ZWFkX3BvbGxfdGltZW91dCgpIGluc3RlYWQ/DQoNCkkgbmVlZGVkIHRvIHVzZSB0aGUgYXRvbWlj
IHZhcmlhbnQgYmVjYXVzZSB0aGlzIGVuZHMgdXAgZ2V0dGluZyBjYWxsZWQgDQpmcm9tIGFuIGlu
dGVycnVwdCBoYW5kbGVyIChtdjY0eHh4X2kyY19pbnRyKCkgLT4gbXY2NHh4eF9pMmNfZnNtKCkp
LiBJIA0KcHJvYmFibHkgZG9uJ3QgbmVlZCB0byB3YWl0IHNvIGxvbmcgYmV0d2VlbiByZWFkcyB0
aG9zZSB0aW1lcyB3ZXJlIGp1c3QgDQpwdWxsZWQgb3V0IG9mIHRoaW4gYWlyLiBJbiBteSBleHBl
cmltZW50YXRpb24gdGhlIGZhdWx0cyB0aGF0IGNhbiBiZSANCmNsZWFyZWQgZG8gc28gd2l0aGlu
IGEgY291cGxlIG9mIGNsb2NrcywgaWYgaXQgaGFzbid0IGNsZWFyZWQgd2l0aGluIDggDQpjbG9j
a3MgaXQncyBub3QgZ29pbmcgdG8uDQoNCj4+ICsJaWYgKHJldCkgew0KPj4gKwkJZGV2X2Vycigm
YWRhcC0+ZGV2LCAicmVjb3ZlcnkgdGltZW91dFxuIik7DQo+PiArCQlyZXR1cm4gcmV0Ow0KPj4g
Kwl9DQo+PiArDQo+PiArCWlmICh2YWwgJiBNVjY0WFhYX0kyQ19VTlNUVUNLX0VSUk9SKSB7DQo+
PiArCQlkZXZfZXJyKCZhZGFwLT5kZXYsICJyZWNvdmVyeSBmYWlsZWRcbiIpOw0KPj4gKwkJcmV0
dXJuIC1FQlVTWTsNCj4+ICsJfQ0KPj4gKw0KPj4gKwlkZXZfaW5mbygmYWRhcC0+ZGV2LCAicmVj
b3ZlcnkgY29tcGxldGUgYWZ0ZXIgJWQgcHVsc2VzXG4iLCBNVjY0WFhYX0kyQ19VTlNUVUNLX0NP
VU5UKHZhbCkpOw0KPiBkZXZfZGJnPw0KYWNrLg0KPj4gKwlyZXR1cm4gMDsNCj4+ICt9DQo+PiAr
DQo+IFsuLi5dDQo+DQo+PiAtCWlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShucCwgIm1hcnZl
bGwsbXY3ODIzMC1hMC1pMmMiKSkgew0KPj4gKwlpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUo
bnAsICJtYXJ2ZWxsLG12NzgyMzAtYTAtaTJjIikgfHwNCj4+ICsJICAgIG9mX2RldmljZV9pc19j
b21wYXRpYmxlKG5wLCAibWFydmVsbCxhcm1hZGEtOGstaTJjIikpIHsNCj4gc2hvdWxkIHRoaXMg
YmUgcGFydCBvZiBhIGRpZmZlcmVudCBwYXRjaD8NCg0KWWVzIHNvcnJ5LiBPcmlnaW5hbGx5IEkg
d2FzIGdvaW5nIHRvIHVzZSBhIG5ldyBjb21wYXRpYmxlIHRvIGluZGljYXRlIA0KdGhlIHVuc3R1
Y2sgc3VwcG9ydCBidXQgd2VudCB3aXRoIHRoZSAybmQgcmVnIGNlbGwgc28gdGhpcyBpcyB1bm5l
Y2Vzc2FyeS4NCg0KPg0KPj4gICAJCWRydl9kYXRhLT5vZmZsb2FkX2VuYWJsZWQgPSBmYWxzZTsN
Cj4+ICAgCQkvKiBUaGUgZGVsYXkgaXMgb25seSBuZWVkZWQgaW4gc3RhbmRhcmQgbW9kZSAoMTAw
a0h6KSAqLw0KPj4gICAJCWlmIChidXNfZnJlcSA8PSBJMkNfTUFYX1NUQU5EQVJEX01PREVfRlJF
USkNCj4+IEBAIC05MzYsOCArOTczLDIxIEBAIG12NjR4eHhfb2ZfY29uZmlnKHN0cnVjdCBtdjY0
eHh4X2kyY19kYXRhICpkcnZfZGF0YSwNCj4+ICAgfQ0KPj4gICAjZW5kaWYgLyogQ09ORklHX09G
ICovDQo+PiAgIA0KPj4gLXN0YXRpYyBpbnQgbXY2NHh4eF9pMmNfaW5pdF9yZWNvdmVyeV9pbmZv
KHN0cnVjdCBtdjY0eHh4X2kyY19kYXRhICpkcnZfZGF0YSwNCj4+IC0JCQkJCSAgc3RydWN0IGRl
dmljZSAqZGV2KQ0KPj4gK3N0YXRpYyBpbnQgbXY2NHh4eF9pMmNfaW5pdF9mc21fcmVjb3Zlcnlf
aW5mbyhzdHJ1Y3QgbXY2NHh4eF9pMmNfZGF0YSAqZHJ2X2RhdGEsDQo+PiArCQkJCQkgICAgICBz
dHJ1Y3QgZGV2aWNlICpkZXYpDQo+PiArew0KPj4gKwlzdHJ1Y3QgaTJjX2J1c19yZWNvdmVyeV9p
bmZvICpyaW5mbyA9ICZkcnZfZGF0YS0+cmluZm87DQo+PiArDQo+PiArCWRldl9pbmZvKGRldiwg
InVzaW5nIEZTTSBmb3IgcmVjb3ZlcnlcbiIpOw0KPiBkZXZfZGJnPw0KPg0KPj4gKwlyaW5mby0+
cmVjb3Zlcl9idXMgPSBtdjY0eHh4X2kyY19yZWNvdmVyX2J1czsNCj4+ICsJZHJ2X2RhdGEtPmFk
YXB0ZXIuYnVzX3JlY292ZXJ5X2luZm8gPSByaW5mbzsNCj4+ICsNCj4+ICsJcmV0dXJuIDA7DQo+
PiArDQo+PiArfQ0KPj4gKw0KPiBbLi4uXQ0KPg0KPj4gKwkvKiBvcHRpb25hbCB1bnN0dWNrIHN1
cHBvcnQgKi8NCj4+ICsJcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkLCBJT1JFU09VUkNF
X01FTSwgMSk7DQo+PiArCWlmIChyZXMpIHsNCj4+ICsJCWRydl9kYXRhLT51bnN0dWNrX3JlZyA9
IGRldm1faW9yZW1hcF9yZXNvdXJjZSgmcGQtPmRldiwgcmVzKTsNCj4+ICsJCWlmIChJU19FUlIo
ZHJ2X2RhdGEtPnVuc3R1Y2tfcmVnKSkNCj4+ICsJCQlyZXR1cm4gUFRSX0VSUihkcnZfZGF0YS0+
dW5zdHVja19yZWcpOw0KPiBPSywgd2UgZmFpbGVkIHRvIGlvcmVtYXAuLi4gYnV0IGluc3RlYWQg
b2YgcmV0dXJuaW5nIGFuIGVycm9yLA0KPiB3b3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8ganVzdCBz
ZXQgdW5zdHVja19yZWcgdG8gTlVMTCBhbmQgbW92ZQ0KPiBmb3J3YXJkIHdpdGhvdXQgdW5zdHVj
ayBzdXBwb3J0Pw0KPg0KPiBNYXliZSB5b3Ugd2lsbCBzdGlsIGNyYXNoIGxhdGVyIGJlY2F1c2Ug
c29tZXRoaW5nIG1pZ2h0IGhhdmUNCj4gaGFwcGVuZWQsIGJ1dCBmYWlsaW5nIG9uIHB1cnBvc2Ug
b24gYW4gb3B0aW9uYWwgZmVhdHVyZSBsb29rcyBhDQo+IGJpdCB0b28gZHJhc3RpYyB0byBtZS4g
V2hhdCBkbyB5b3UgdGhpbms/DQoNClBlcnNvbmFsbHkgSSB0aGluayBpZiB0aGUgcmVnIHByb3Bl
cnR5IGlzIHN1cHBsaWVkIGluIHRoZSBkdHMgd2UnZCANCmJldHRlciBiZSBhYmxlIHRvIHVzZSBp
dC4gSWYgdGhlIGZlYXR1cmUgaXMgbm90IHdhbnRlZCB0aGVuIHRoZSB3YXkgdG8gDQppbmRpY2F0
ZSB0aGlzIGlzIGJ5IHN1cHBseWluZyBvbmx5IG9uZSByZWcgY2VsbC4NCg0KSSdkIGJlIGhhcHB5
IHdpdGggYSBkZXZfd2FybigpIGFuZCB1bnN0dWNrX3JlZyA9IE5VTEwgaWYgdGhhdCBoZWxwcyBn
ZXQgDQp0aGlzIGxhbmRlZC4NCg0KPg0KPiBUaGFua3MsDQo+IEFuZGk=
