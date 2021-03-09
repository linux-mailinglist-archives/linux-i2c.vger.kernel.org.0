Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8BC3331EC
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 00:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbhCIXfm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Mar 2021 18:35:42 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:48875 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbhCIXfK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Mar 2021 18:35:10 -0500
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 89F62891AE;
        Wed, 10 Mar 2021 12:35:08 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1615332908;
        bh=uI86jW6pWpZnO371tm5bCSjh+sq6Wm42ntNgWqBdKss=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=yMJLTWRQjO1i5IakXgJRV1w+B2b7uGCvOsMYX7q5MW9CA8B099sUEVoMdi2V6Yewh
         HcpysLOY80YGexFt1+L2xiJt44TYB/gTLTKwiVx3Zypapim+RGSoIq6ev5YwA34yUp
         2zPhkTjHqC0h5WVrSNkTlCMvtleg9BXMPGdqnFXdLrOhm/C6yJCNtw+NRRPlus7UW/
         ubfsSfST4TC8FLlySwwPCmaeDYpum4zf62+FlVKeACAeks+4YiaFB+j5Dq+eRbYBI2
         TMqGQRmW0LmRaSL4mjgQb50lgnceLXrkUtZAYasy+xdqTEwn0pjgvMMLc6FcJjF0Pv
         IV5erfRh9ulLQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B6048062c0001>; Wed, 10 Mar 2021 12:35:08 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 10 Mar 2021 12:35:08 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Wed, 10 Mar 2021 12:35:08 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Guenter Roeck <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXE6SbssdAOSHgwE+zIRhtn11Sk6p4Y2sAgAMVCoA=
Date:   Tue, 9 Mar 2021 23:35:07 +0000
Message-ID: <b1ba3f34-cbcc-4bbd-ea84-aad21f513682@alliedtelesis.co.nz>
References: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
 <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
In-Reply-To: <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BCA4FDE94F0A245BE39485AC5CF9D8F@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=C7uXNjH+ c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=H79plryXfxChRathHHkA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiA4LzAzLzIxIDE6MzEgcG0sIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+IE9uIDMvNy8yMSAy
OjUyIFBNLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4gRnVuZGFtZW50YWxseSBJIHRoaW5rIHRo
aXMgaXMgYSBwcm9ibGVtIHdpdGggdGhlIGZhY3QgdGhhdCB0aGUgTE04MSBpcw0KPj4gYW4gU01C
dXMgZGV2aWNlIGJ1dCB0aGUgVDIwODAgKGFuZCBvdGhlciBGcmVlc2NhbGUgU29DcykgdXNlcyBp
MmMgYW5kIHdlDQo+PiBlbXVsYXRlIFNNQnVzLiBJIHN1c3BlY3QgdGhlIGVycmFudCByZWFkaW5n
cyBhcmUgd2hlbiB3ZSBkb24ndCBnZXQgcm91bmQNCj4+IHRvIGNvbXBsZXRpbmcgdGhlIHJlYWQg
d2l0aGluIHRoZSB0aW1lb3V0IHNwZWNpZmllZCBieSB0aGUgU01CdXMNCj4+IHNwZWNpZmljYXRp
b24uIERlcGVuZGluZyBvbiB3aGVuIHRoYXQgaGFwcGVucyB3ZSBlaXRoZXIgZmFpbCB0aGUNCj4+
IHRyYW5zZmVyIG9yIGludGVycHJldCB0aGUgcmVzdWx0IGFzIGFsbC0xcy4NCj4gVGhhdCBpcyBx
dWl0ZSB1bmxpa2VseS4gTWFueSBzZW5zb3IgY2hpcHMgYXJlIFNNQnVzIGNoaXBzIGNvbm5lY3Rl
ZCB0bw0KPiBpMmMgYnVzc2VzLiBJdCBpcyBtdWNoIG1vcmUgbGlrZWx5IHRoYXQgdGhlcmUgaXMg
YSBidWcgaW4gdGhlIFQyMDgwIGkyYyBkcml2ZXIsDQo+IHRoYXQgdGhlIGNoaXAgZG9lc24ndCBs
aWtlIHRoZSBidWxrIHJlYWQgY29tbWFuZCBpc3N1ZWQgdGhyb3VnaCByZWdtYXAsIHRoYXQNCj4g
dGhlIGNoaXAgaGFzIHByb2JsZW1zIHdpdGggdGhlIGkyYyBidXMgc3BlZWQsIG9yIHRoYXQgdGhl
IGkyYyBidXMgaXMgbm9pc3kuDQpJIGhhdmUgbm90aWNlZCB0aGF0IHdpdGggdGhlIHN3aXRjaCB0
byByZWdtYXAgd2UgZW5kIHVwIHVzaW5nIHBsYWluIGkyYyANCmluc3RlYWQgb2YgU01CVVMuIFRo
ZXJlIGFwcGVhcnMgdG8gYmUgbm8gd2F5IG9mIHNheWluZyB1c2UgU01CVVMgDQpzZW1hbnRpY3Mg
aWYgdGhlIGkyYyBhZGFwdGVyIHJlcG9ydHMgSTJDX0ZVTkNfSTJDLg==
