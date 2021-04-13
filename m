Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBAFD35E9C9
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 01:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348049AbhDMXnt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 19:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344639AbhDMXnt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 19:43:49 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9CFC061574
        for <linux-i2c@vger.kernel.org>; Tue, 13 Apr 2021 16:43:28 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6E2CA891AE;
        Wed, 14 Apr 2021 11:43:26 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618357406;
        bh=E/hVVCsUaLkgWx6aJNl3liaauBaX6sPZBS9TlZRfoEI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=DPJnbmyyzLZoXFmjkP8eGZi9wjDoy4CDd2Hp7fJ9+D+S+DluVXAMim5F1DitulgIc
         oyEU+eic1HZ0LlDiFqs+PeKFyG/Pae4ZF/phrPcBDMn52fMporQ7+uixfgn2RBjZih
         uExMvP8rYG8+ZA14b5xPXofbx6ka/i+kZ5SEk1fwqkPaEUBhi948/621AIPXN2L7Gr
         YRYA8/HFSPIiA8TWylb/AyRruP8QsPY/BykggYJ5iXPoJ8xs4HXlbOA3lyHaghoQcp
         /tr4Wyj9d8FH0kLFp9vH6toQj4pudhl2fWylQlkUR6vFq6FjvTkY6MiOZopZm28ql+
         vuYvNeB/kArIA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60762c9e0001>; Wed, 14 Apr 2021 11:43:26 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 14 Apr 2021 11:43:25 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Wed, 14 Apr 2021 11:43:25 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "wsa@kernel.org" <wsa@kernel.org>
Subject: Re: [PATCH v1 2/4] i2c: mpc: Remove CONFIG_PM_SLEEP ifdeffery
Thread-Topic: [PATCH v1 2/4] i2c: mpc: Remove CONFIG_PM_SLEEP ifdeffery
Thread-Index: AQHXMHKa81ZV92D9rkOWsO5qOgYw4qqyU4eA
Date:   Tue, 13 Apr 2021 23:43:25 +0000
Message-ID: <c6bae18f-a83f-675d-78a3-a4441b8c46f3@alliedtelesis.co.nz>
References: <20210413143756.60138-1-andriy.shevchenko@linux.intel.com>
 <20210413143756.60138-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210413143756.60138-2-andriy.shevchenko@linux.intel.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1C286FB2FB6054FAC33D42C30B7A4C2@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=3YhXtTcJ-WEA:10 a=QyXUC8HyAAAA:8 a=qzOFTWXcsMeXbrKYrBcA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAxNC8wNC8yMSAyOjM3IGFtLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+IFVzZSBfX21h
eWJlX3VudXNlZCBmb3IgdGhlIHN1c3BlbmQoKS9yZXN1bWUoKSBob29rcyBhbmQgZ2V0IHJpZCBv
Zg0KPiB0aGUgQ09ORklHX1BNX1NMRUVQIGlmZGVmZmVyeSB0byBpbXByb3ZlIHRoZSBjb2RlLg0K
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxp
bnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYyB8
IDEyICsrLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1t
cGMuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMNCj4gaW5kZXggNmRjMDI5YTMxZDM2
Li4yMzc2YWNjZDRlOGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBj
LmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYw0KPiBAQCAtNjYsOSArNjYs
NyBAQCBzdHJ1Y3QgbXBjX2kyYyB7DQo+ICAgCXN0cnVjdCBpMmNfYWRhcHRlciBhZGFwOw0KPiAg
IAlpbnQgaXJxOw0KPiAgIAl1MzIgcmVhbF9jbGs7DQo+IC0jaWZkZWYgQ09ORklHX1BNX1NMRUVQ
DQo+ICAgCXU4IGZkciwgZGZzcnI7DQo+IC0jZW5kaWYNCj4gICAJc3RydWN0IGNsayAqY2xrX3Bl
cjsNCj4gICB9Ow0KVGhpcyBoYXMgYSB0cml2aWFsIGNvbmZsaWN0IHdpdGggbXkgc2VyaWVzIGJl
Y2F1c2UgSSdtIGFsc28gdG91Y2hpbmcgDQpzdHJ1Y3QgbXBjX2kyYy4gZ2l0IGFtIC0zIHNlZW1z
IHRvIGRlYWwgd2l0aCBpdCBidXQgd291bGQgaXQgYmUgZWFzaWVyIA0KaWYgSSBwaWNrZWQgdXAg
dGhlc2UgNCBjaGFuZ2VzIGFuZCBpbmNsdWRlZCB0aGVtIHdpdGggbXkgbmV4dCBzdWJtaXNzaW9u
Pw0KPiBAQCAtNzYxLDggKzc1OSw3IEBAIHN0YXRpYyBpbnQgZnNsX2kyY19yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqb3ApDQo+ICAgCXJldHVybiAwOw0KPiAgIH07DQo+ICAgDQo+IC0j
aWZkZWYgQ09ORklHX1BNX1NMRUVQDQo+IC1zdGF0aWMgaW50IG1wY19pMmNfc3VzcGVuZChzdHJ1
Y3QgZGV2aWNlICpkZXYpDQo+ICtzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIG1wY19pMmNfc3Vz
cGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgbXBjX2kyYyAqaTJj
ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ICAgDQo+IEBAIC03NzIsNyArNzY5LDcgQEAgc3Rh
dGljIGludCBtcGNfaTJjX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgIAlyZXR1cm4g
MDsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgaW50IG1wY19pMmNfcmVzdW1lKHN0cnVjdCBkZXZp
Y2UgKmRldikNCj4gK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgbXBjX2kyY19yZXN1bWUoc3Ry
dWN0IGRldmljZSAqZGV2KQ0KPiAgIHsNCj4gICAJc3RydWN0IG1wY19pMmMgKmkyYyA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOw0KPiAgIA0KPiBAQCAtNzgxLDEyICs3NzgsNyBAQCBzdGF0aWMgaW50
IG1wY19pMmNfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gICANCj4gICAJcmV0dXJuIDA7
DQo+ICAgfQ0KPiAtDQo+ICAgc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKG1wY19pMmNfcG1fb3Bz
LCBtcGNfaTJjX3N1c3BlbmQsIG1wY19pMmNfcmVzdW1lKTsNCj4gLSNkZWZpbmUgTVBDX0kyQ19Q
TV9PUFMJKCZtcGNfaTJjX3BtX29wcykNCj4gLSNlbHNlDQo+IC0jZGVmaW5lIE1QQ19JMkNfUE1f
T1BTCU5VTEwNCj4gLSNlbmRpZg0KPiAgIA0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXBjX2ky
Y19kYXRhIG1wY19pMmNfZGF0YV81MTJ4ID0gew0KPiAgIAkuc2V0dXAgPSBtcGNfaTJjX3NldHVw
XzUxMngsDQoNClRoZXJlJ3MgYSByZWZlcmVuY2UgdG8gTVBDX0kyQ19QTV9PUFMgaW4gbXBjX2ky
Y19kcml2ZXIgd2hpY2ggbmVlZHMgDQpjaGFuZ2luZyBJIHRoaW5rIHRoZSBmb2xsb3dpbmcgaXMg
bmVlZGVkDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jIGIvZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYw0KaW5kZXggMTMwOGY3NDlkYzc1Li43ZmRlMTM0NzJj
MDkgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jDQorKysgYi9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jDQpAQCAtODYyLDcgKzg2Miw3IEBAIHN0YXRpYyBzdHJ1
Y3QgcGxhdGZvcm1fZHJpdmVyIG1wY19pMmNfZHJpdmVyID0gew0KIMKgwqDCoMKgwqDCoMKgIC5k
cml2ZXIgPSB7DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5uYW1lID0gRFJWX05B
TUUsDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5vZl9tYXRjaF90YWJsZSA9IG1w
Y19pMmNfb2ZfbWF0Y2gsDQotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucG0gPSBNUENf
STJDX1BNX09QUywNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5wbSA9ICZtcGNfaTJj
X3BtX29wcywNCiDCoMKgwqDCoMKgwqDCoCB9LA0KIMKgfTsNCg0KDQo=
