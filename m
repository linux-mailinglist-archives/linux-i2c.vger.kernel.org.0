Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9C47C7833
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Oct 2023 22:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442850AbjJLUzC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Oct 2023 16:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442867AbjJLUzB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Oct 2023 16:55:01 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE26BE
        for <linux-i2c@vger.kernel.org>; Thu, 12 Oct 2023 13:54:59 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D496C2C0276;
        Fri, 13 Oct 2023 09:54:57 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1697144097;
        bh=dXcj8TwcqGcQDxFKIw14JXfkum76Iek+2aZ0D6D8Da0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Vk20xcQ0l5fIdJJ6fYnFQeXlE8L3gSHMRTBawgn66/IkDKt9PpASmcLarMKkJVdKL
         DQyyq33i/2iX1kM+az7bKDDrfm2w9rdVbLa5YcodXCYxWiRgjJtsJ9ZSJX/gqt53uT
         0F/WCjJy5H0bc/GgfJsukKzJSDuGUsNcgZWMjfIIuatB40P8XrlDvHJ/yPvjoIn/c9
         6BISA9+3skbm2cSegFtewwfBtbGwLa8uZpNB2YwAWMvea/LdarjSN5sgWF7pufUBdY
         7/MYqlBZm58f2nWSPWhuMDwo49DlkYMjdJouMlAxiHh0YewAV/hVSRx2TtnMX5T7WU
         wvKT1Z2o4KHzQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B65285d210001>; Fri, 13 Oct 2023 09:54:57 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Fri, 13 Oct 2023 09:54:57 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.037; Fri, 13 Oct 2023 09:54:57 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>
CC:     "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] i2c: mv64xxx: add an optional reset-gpios property
Thread-Topic: [PATCH 2/2] i2c: mv64xxx: add an optional reset-gpios property
Thread-Index: AQHZ/MBiho/r3vjr4Umpa1L63KxTDrBFGFgAgAAHq4CAAKlFgA==
Date:   Thu, 12 Oct 2023 20:54:57 +0000
Message-ID: <598cc050-c19d-4fb1-9875-f87e13c3c47d@alliedtelesis.co.nz>
References: <20231012035838.2804064-1-chris.packham@alliedtelesis.co.nz>
 <20231012035838.2804064-3-chris.packham@alliedtelesis.co.nz>
 <20231012102140.kydfi2tppvhd7bdn@zenone.zhora.eu>
 <63403365-2d23-b4a0-d869-070686d62ab5@axentia.se>
In-Reply-To: <63403365-2d23-b4a0-d869-070686d62ab5@axentia.se>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <410FEA20F8F17640BA1733F1887CA498@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=Otk--NFtuWbr05glreUA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgQW5kaSwgUGV0ZXIsDQoNCihyZXNlbmQgYXMgcGxhaW4gdGV4dCwgc29ycnkgdG8gdGhvc2Ug
dGhhdCBnZXQgZHVwbGljYXRlcykNCg0KT24gMTIvMTAvMjMgMjM6NDksIFBldGVyIFJvc2luIHdy
b3RlOg0KPiBIaSENCj4NCj4gMjAyMy0xMC0xMiBhdCAxMjoyMSwgQW5kaSBTaHl0aSB3cm90ZToN
Cj4+IEhpIENocmlzLA0KPj4NCj4+IC4uLg0KPj4NCj4+PiAgIHN0YXRpYyBzdHJ1Y3QgbXY2NHh4
eF9pMmNfcmVncyBtdjY0eHh4X2kyY19yZWdzX212NjR4eHggPSB7DQo+Pj4gQEAgLTEwODMsNiAr
MTA4NCwxMCBAQCBtdjY0eHh4X2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZCkN
Cj4+PiAgIAlpZiAoZHJ2X2RhdGEtPmlycSA8IDApDQo+Pj4gICAJCXJldHVybiBkcnZfZGF0YS0+
aXJxOw0KPj4+ICAgDQo+Pj4gKwlkcnZfZGF0YS0+cmVzZXRfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0
X29wdGlvbmFsKCZwZC0+ZGV2LCAicmVzZXQiLCBHUElPRF9PVVRfSElHSCk7DQo+Pj4gKwlpZiAo
SVNfRVJSKGRydl9kYXRhLT5yZXNldF9ncGlvKSkNCj4+PiArCQlyZXR1cm4gUFRSX0VSUihkcnZf
ZGF0YS0+cmVzZXRfZ3Bpbyk7DQo+PiBpZiB0aGlzIG9wdGlvbmFsIHdoeSBhcmUgd2UgcmV0dXJu
aW5nIGluIGNhc2Ugb2YgZXJyb3I/DQpncGlvZF9nZXRfb3B0aW9uYWwoKSB3aWxsIHJldHVybiBO
VUxMIGlmIHRoZSBwcm9wZXJ0eSBpcyBub3QgcHJlc2VudC4gDQpUaGUgbWFpbiBlcnJvciBJIGNh
cmUgYWJvdXQgaGVyZSBpcyAtRVBST0JFX0RFRkVSIGJ1dCBJIGZpZ3VyZSBvdGhlciANCmVycm9y
cyBhcmUgYWxzbyByZWxldmFudC4gVGhpcyBzYW1lIGtpbmQgb2YgcGF0dGVybiBpcyB1c2VkIGlu
IG90aGVyIA0KZHJpdmVycy4NCj4+PiArDQo+Pj4gICAJaWYgKHBkYXRhKSB7DQo+Pj4gICAJCWRy
dl9kYXRhLT5mcmVxX20gPSBwZGF0YS0+ZnJlcV9tOw0KPj4+ICAgCQlkcnZfZGF0YS0+ZnJlcV9u
ID0gcGRhdGEtPmZyZXFfbjsNCj4+PiBAQCAtMTEyMSw2ICsxMTI2LDEyIEBAIG12NjR4eHhfaTJj
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkKQ0KPj4+ICAgCQkJZ290byBleGl0X2Rp
c2FibGVfcG07DQo+Pj4gICAJfQ0KPj4+ICAgDQo+Pj4gKwlpZiAoZHJ2X2RhdGEtPnJlc2V0X2dw
aW8pIHsNCj4+PiArCQl1ZGVsYXkoMSk7DQo+Pj4gKwkJZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVw
KGRydl9kYXRhLT5yZXNldF9ncGlvLCAwKTsNCj4+PiArCQl1ZGVsYXkoMSk7DQo+PiB5b3UgbGlr
ZSBidXN5IHdhaXRpbmcgOi0pDQpzdXJlIGRvLg0KPj4gV2hhdCBpcyB0aGUgcmVhc29uIGJlaGlu
ZCB0aGVzZSB3YWl0cz8gSXMgdGhlcmUgYW55dGhpbmcNCj4+IHNwZWNpZmllZCBieSB0aGUgZGF0
YXNoZWV0Pw0KVGhvc2UgcGFydGljdWxhciB0aW1lcyB3ZXJlIGxpZnRlZCBmcm9tIHRoZSBwY2E5
NTR4IG11eCBidXQgdGhleSBhcmUgDQpmYWlybHkgYXJiaXRyYXJ5Lg0KPj4gSWYgbm90IEkgd291
bGQgZG8gYSBtb3JlIHJlbGF4ZWQgc2xlZXBpbmcgbGlrZSBhbiB1c2xlZXBfcmFuZ2UuLi4NCj4+
IHdoYXQgZG8geW91IHRoaW5rPw0KPiBTaW5jZSB0aGlzIGlzIGFwcGFyZW50bHkgbm90IGludGVu
ZGVkIHRvIHJlc2V0IHRoZSBidXMgZHJpdmVyIGl0c2VsZiwNCj4gYnV0IGluc3RlYWQgdmFyaW91
cyBjbGllbnRzIGNvbm5lY3RlZCB0byB0aGUgYnVzLCB0aGVyZSBpcyBub3QgdGVsbGluZw0KPiB3
aGljaCBkYXRhc2hlZXQgdG8gZXhhbWluZS4gSXQgaXMgc2ltcGx5IGltcG9zc2libGUgdG8gaGFy
ZC1jb2RlIGENCj4gY29ycmVjdCByZXNldCBwdWxzZSBoZXJlLCB3aGVuIHRoZSB0YXJnZXRzIG9m
IHRoZSBwdWxzZSBhcmUgdW5zcGVjaWZpZWQNCj4gYW5kIHVua25vd24uDQoNCkkgY291bGQgcHJv
YmFibHkgZm9sbG93IHdoYXQgc2ltaWxhciBjb2RlIGRvZXMgaW4gdGhlIHBjaS1tdmVidS5jIGRy
aXZlciANCmFuZCBtYWtlIHRoZSBkZWxheSBhIHByb3BlcnR5IGFzIHdlbGwuIEFzIHlvdSdyZSBo
aWdobGlnaHRpbmcgSSBjYW4ndCANCnBvc3NpYmx5IHBpY2sgYSB2YWx1ZSB0aGF0J3MgcmlnaHQg
Zm9yIGV2ZXJ5b25lLiBXZSByZWFsbHkgbmVlZCB0byBiZSANCnRvbGQgdGhhdCB0aGUgaGFyZHdh
cmUgZGVzaWduIHJlcXVpcmVzIFggdXMgb2YgZGVsYXkgYWZ0ZXIgcmVzZXQuDQoNCj4gSSBmaW5k
IHRoZSByZXNldC1ncGlvcyBuYW1pbmcgZXh0cmVtZWx5IG1pc2xlYWRpbmcuDQoNCkkgcGlja2Vk
IHRoYXQgbWFpbmx5IGJlY2F1c2UgdGhhdCdzIHRoZSBuYW1lIG9mIHRoZSBwcm9wZXJ0eSBmb3Ig
DQpwY2ktbXZlYnUuYyBhbmQgYSBmZXcgb3RoZXIgZW5kLXBvaW50IGRldmljZXMuIFRoZSBjcnV4
IG9mIHRoZSBwcm9ibGVtIA0KSSdtIHRyeWluZyB0byBzb2x2ZSBpcyB0aGF0IEkgaGF2ZSBtdWx0
aXBsZSBpMmMgbXV4ZXMgdGhhdCBzaGFyZSBhIA0KY29tbW9uIHJlc2V0IEdQSU8gaW4gaGFyZHdh
cmUuIEkgY2FuJ3QgYXNzb2NpYXRlIHRoZSBHUElPIHdpdGggbXVsdGlwbGUgDQpkZXZpY2VzIGFz
IHRoZSBvbmVzIHRoYXQgYXJlIHByb2JlZCBhZnRlciB0aGUgZmlyc3Qgd2lsbCBnZXQgLUVCVVNZ
LiBJIA0KY2FuIGNoZWF0IGFuZCBub3QgaGF2ZSBhIHJlc2V0LWdwaW9zIHByb3BlcnR5IG9uIHRo
ZSBvdGhlciBtdXhlcyBidXQgDQp0aGVuIGlmIHRoZSBHUElPIGlzIGRlZmVycmVkIChiZWNhdXNl
IHRoZSBjb250cm9sbGVyIGRyaXZlciBoYXNuJ3QgYmVlbiANCmxvYWRlZCkgdGhlIG11eGVzIGRv
bid0IGdldCByZXNldCBhdCBhbGwuDQoNCj4gQ2hlZXJzLA0KPiBQZXRlcg==
