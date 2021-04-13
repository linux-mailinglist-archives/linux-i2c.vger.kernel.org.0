Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F14BA35E9CE
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 01:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348127AbhDMXqL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 19:46:11 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:40560 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348119AbhDMXqJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 19:46:09 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5DA13891AE;
        Wed, 14 Apr 2021 11:45:48 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618357548;
        bh=7JjHI84NN+6eHIraD4+0OLm5DF62VJuY3rklHOwdEaU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=v6aKN5SJ1Nmr1Py2/7l12TaXJIGjdMMtA2cQYqplqZ976nyGLDpmL4Pl2Rkmy1JYO
         iOODxX1KevWB/2gAiqcwSoSb6w0XCo+e2UZgXTSsUDlAgjm1AWJu6fBz0ZcEW+rFZf
         LBoDaStlJtYVfVCwPNNdMZx5TBKpP/bCBOqZ+XXvLj8Cr45n9Vk9xN2P24NW+ql/YB
         SLzVAGUPlUDKdUpHQLvWSRyfpUuKFjR65hveQvPP4YiCaiLr3gGxcU6ncAoT2sFEDQ
         I/9kBzWFg6hY3KroRY/htsGkSqvFbPLceJc8h+MHPK50ayWxbkyVvraTzXa57UKOLT
         HVzJ+qiwWsatw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60762d2c0001>; Wed, 14 Apr 2021 11:45:48 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 14 Apr 2021 11:45:47 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Wed, 14 Apr 2021 11:45:47 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "wsa@kernel.org" <wsa@kernel.org>
Subject: Re: [PATCH v1 4/4] i2c: mpc: Drop duplicate message from
 devm_platform_ioremap_resource()
Thread-Topic: [PATCH v1 4/4] i2c: mpc: Drop duplicate message from
 devm_platform_ioremap_resource()
Thread-Index: AQHXMHKaTHYURnovGESMsVEuqYUsMKqyVDGA
Date:   Tue, 13 Apr 2021 23:45:47 +0000
Message-ID: <74be4395-3267-f578-02b8-77794a10921f@alliedtelesis.co.nz>
References: <20210413143756.60138-1-andriy.shevchenko@linux.intel.com>
 <20210413143756.60138-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210413143756.60138-4-andriy.shevchenko@linux.intel.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D33C7A12F2BE2B49A24EA960FF57B362@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=3YhXtTcJ-WEA:10 a=QyXUC8HyAAAA:8 a=g2ZYQr3lN4BsSeXOv6MA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAxNC8wNC8yMSAyOjM3IGFtLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+IGRldm1fcGxh
dGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIHByaW50cyBhIG1lc3NhZ2UgaW4gY2FzZSBvZiBlcnJv
ci4NCj4gRHJvcCBjdXN0b20gb25lLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVu
a28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4NClJldmlld2VkLWJ5OiBDaHJp
cyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+IC0tLQ0KPiAg
IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMgfCA0ICstLS0NCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYw0K
PiBpbmRleCBlYzlkN2Q5M2U4MGYuLjY4NGE4Y2QxN2VmZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1tcGMuYw0KPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1w
Yy5jDQo+IEBAIC02NjQsMTAgKzY2NCw4IEBAIHN0YXRpYyBpbnQgZnNsX2kyY19wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpvcCkNCj4gICAJaW5pdF93YWl0cXVldWVfaGVhZCgmaTJjLT5x
dWV1ZSk7DQo+ICAgDQo+ICAgCWkyYy0+YmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNv
dXJjZShvcCwgMCk7DQo+IC0JaWYgKElTX0VSUihpMmMtPmJhc2UpKSB7DQo+IC0JCWRldl9lcnIo
aTJjLT5kZXYsICJmYWlsZWQgdG8gbWFwIGNvbnRyb2xsZXJcbiIpOw0KPiArCWlmIChJU19FUlIo
aTJjLT5iYXNlKSkNCj4gICAJCXJldHVybiBQVFJfRVJSKGkyYy0+YmFzZSk7DQo+IC0JfQ0KPiAg
IA0KPiAgIAlpMmMtPmlycSA9IHBsYXRmb3JtX2dldF9pcnEob3AsIDApOw0KPiAgIAlpZiAoaTJj
LT5pcnEgPCAwKQ==
