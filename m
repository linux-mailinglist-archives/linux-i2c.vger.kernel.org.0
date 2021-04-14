Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7882E35FD0F
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 23:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbhDNVS3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 17:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbhDNVS2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 17:18:28 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C00AFC061574
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 14:18:05 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C7EE7891AE;
        Thu, 15 Apr 2021 09:17:59 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618435079;
        bh=jj0BPZvY3W5uUaK47/HeoEBDslu2QxZ23CCxkeSWl3M=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=HBDc8bXPHPzPLGC3CVGMne7f4OY49WAHJZln+8urA50ledu33Ode6phxm7CpeDlO1
         yU9slimxy1vB6DrOyzaqlGsbxpN1BG/Hdhsl01UM78hUu5Mea5FPPmlmICBWXtN8ez
         gqzsipYHEJCIYYQkNlHaBwotm0157C8ABI4ky5HHrMRo7LKnAnHh+77q8GcMfd5hMq
         TkmiKF2I2Q1VLzz+ZM6bxTHYyaTCzjeQ2EYDy2azSHsTnV45vhbjkE6Y4Js1EBHV0K
         LaiEV1hrAga7ouyj4jzDk4uD7IGWb2EvF11I9aB8K2UfhdFQhMb4yM/xS6ZbGHXpgY
         kkuZdEUgx4Ovw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60775c070001>; Thu, 15 Apr 2021 09:17:59 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 15 Apr 2021 09:17:59 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.015; Thu, 15 Apr 2021 09:17:59 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: Re: [PATCH v1 2/4] i2c: mpc: Remove CONFIG_PM_SLEEP ifdeffery
Thread-Topic: [PATCH v1 2/4] i2c: mpc: Remove CONFIG_PM_SLEEP ifdeffery
Thread-Index: AQHXMHKa81ZV92D9rkOWsO5qOgYw4qqyU4eAgADR4ICAAJfTgA==
Date:   Wed, 14 Apr 2021 21:17:59 +0000
Message-ID: <1a41249d-997e-9ba6-6e78-19f7d22463f4@alliedtelesis.co.nz>
References: <20210413143756.60138-1-andriy.shevchenko@linux.intel.com>
 <20210413143756.60138-2-andriy.shevchenko@linux.intel.com>
 <c6bae18f-a83f-675d-78a3-a4441b8c46f3@alliedtelesis.co.nz>
 <YHbcq31AVvuFq/9A@smile.fi.intel.com>
In-Reply-To: <YHbcq31AVvuFq/9A@smile.fi.intel.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <62F8BE64B0A40C43998887F1ABC8A3CA@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=3YhXtTcJ-WEA:10 a=uBRA9nhwTqNYg-qt4OQA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAxNS8wNC8yMSAxMjoxNCBhbSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiBPbiBUdWUs
IEFwciAxMywgMjAyMSBhdCAxMTo0MzoyNVBNICswMDAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0K
Pj4gT24gMTQvMDQvMjEgMjozNyBhbSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPj4+IFVzZSBf
X21heWJlX3VudXNlZCBmb3IgdGhlIHN1c3BlbmQoKS9yZXN1bWUoKSBob29rcyBhbmQgZ2V0IHJp
ZCBvZg0KPj4+IHRoZSBDT05GSUdfUE1fU0xFRVAgaWZkZWZmZXJ5IHRvIGltcHJvdmUgdGhlIGNv
ZGUuDQo+PiBUaGlzIGhhcyBhIHRyaXZpYWwgY29uZmxpY3Qgd2l0aCBteSBzZXJpZXMgYmVjYXVz
ZSBJJ20gYWxzbyB0b3VjaGluZw0KPj4gc3RydWN0IG1wY19pMmMuIGdpdCBhbSAtMyBzZWVtcyB0
byBkZWFsIHdpdGggaXQgYnV0IHdvdWxkIGl0IGJlIGVhc2llcg0KPj4gaWYgSSBwaWNrZWQgdXAg
dGhlc2UgNCBjaGFuZ2VzIGFuZCBpbmNsdWRlZCB0aGVtIHdpdGggbXkgbmV4dCBzdWJtaXNzaW9u
Pw0KPiBJdCB3b3VsZCBiZSBpZGVhbCB0byBtZSENCk9LIEkndmUgcGlja2VkIHRoZW0gdXAuDQo+
Pj4gLSNkZWZpbmUgTVBDX0kyQ19QTV9PUFMJKCZtcGNfaTJjX3BtX29wcykNCj4+PiAtI2Vsc2UN
Cj4+PiAtI2RlZmluZSBNUENfSTJDX1BNX09QUwlOVUxMDQo+Pj4gLSNlbmRpZg0KPj4+ICAgIA0K
Pj4+ICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXBjX2kyY19kYXRhIG1wY19pMmNfZGF0YV81MTJ4
ID0gew0KPj4+ICAgIAkuc2V0dXAgPSBtcGNfaTJjX3NldHVwXzUxMngsDQo+PiBUaGVyZSdzIGEg
cmVmZXJlbmNlIHRvIE1QQ19JMkNfUE1fT1BTIGluIG1wY19pMmNfZHJpdmVyIHdoaWNoIG5lZWRz
DQo+PiBjaGFuZ2luZyBJIHRoaW5rIHRoZSBmb2xsb3dpbmcgaXMgbmVlZGVkDQo+IFRydWUuIHNv
cnJ5IHRoYXQgbXkgYnVpbGQgdGVzdCBoYWQgYmVlbiBicm9rZW4uDQo+IFRlbGwgbWUgaWYgeW91
IHdhbnQgdjIgd2l0aCB0aGlzIGZpeGVkIG9yIHlvdSBtYXkgZm9sZCB0aGF0IGNoYW5nZSBzaW5j
ZSB0aGUNCj4gYWJvdmUgYWdyZWVtZW50Lg0KPg0KSSBjYW4gZm9sZCB0aGUgZml4IGJlbG93IGlu
LiBObyBuZWVkIGZvciBhIHYyIGZyb20geW91Lg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtbXBjLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jDQo+PiBpbmRl
eCAxMzA4Zjc0OWRjNzUuLjdmZGUxMzQ3MmMwOSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtbXBjLmMNCj4+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMN
Cj4+IEBAIC04NjIsNyArODYyLDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXBj
X2kyY19kcml2ZXIgPSB7DQo+PiAgIMKgwqDCoMKgwqDCoMKgIC5kcml2ZXIgPSB7DQo+PiAgIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAubmFtZSA9IERSVl9OQU1FLA0KPj4gICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLm9mX21hdGNoX3RhYmxlID0gbXBjX2kyY19vZl9t
YXRjaCwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5wbSA9IE1QQ19JMkNfUE1f
T1BTLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnBtID0gJm1wY19pMmNfcG1f
b3BzLA0KPj4gICDCoMKgwqDCoMKgwqDCoCB9LA0KPj4gICDCoH07DQo+Pg0KPj4=
