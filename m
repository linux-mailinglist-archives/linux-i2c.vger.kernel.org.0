Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF4663306E8
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 05:39:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234209AbhCHEib (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Mar 2021 23:38:31 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:46082 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232474AbhCHEh4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 7 Mar 2021 23:37:56 -0500
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0D08A891AE;
        Mon,  8 Mar 2021 17:37:49 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1615178269;
        bh=NXLFfI7BQjptcdFkSZ0hwO090fqmTSBgkr9D2madENE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=1412BhugzOdifScxDGYfVQ3ZalUfK4y4p4tdAbJpukHHqDHeiKwB2D8Opa2IPc36P
         jtS/M3uP5usFbvkT/OMkJoAq1D5F00iienDaeXyWbSQLRbAmA9lDNtFM6LC7ld1n8L
         MvpShKUftN4eYolZTBEU8WrWveHg/Yo1L/iVnXLhuV05EtoXgXKRJJ0yPhNtTZBKC7
         TaC4XXiq3vQhSZ/ylQ2hx9zb1eh8BA32NfRgunEl2qRtA7MmSDFGsE/d57WqvsRmDv
         xLgPR89JfrtDARkpt4GepnDNpzz/Zrru/1e9vegkdq9PQMrbGtldJauS/T/pFE8Kck
         KHyjuJehuGb1w==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B6045aa1c0001>; Mon, 08 Mar 2021 17:37:48 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 8 Mar 2021 17:37:48 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Mon, 8 Mar 2021 17:37:48 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Guenter Roeck <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXE6SbssdAOSHgwE+zIRhtn11Sk6p4Y2sAgAAgcACAACSBgA==
Date:   Mon, 8 Mar 2021 04:37:47 +0000
Message-ID: <a67ea323-634d-d34e-c63e-b1aaa4737b19@alliedtelesis.co.nz>
References: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
 <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
 <4a1b1494-df96-2d8c-9323-beb2c2ba706b@alliedtelesis.co.nz>
In-Reply-To: <4a1b1494-df96-2d8c-9323-beb2c2ba706b@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4C7845C248C3D4EB8EC3956E6D5AD71@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=C7uXNjH+ c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=OylRmCEKjCub7zUREboA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiA4LzAzLzIxIDM6MjcgcG0sIENocmlzIFBhY2toYW0gd3JvdGU6DQo+DQo+IE9uIDgvMDMv
MjEgMTozMSBwbSwgR3VlbnRlciBSb2VjayB3cm90ZToNCj4+IE9uIDMvNy8yMSAyOjUyIFBNLCBD
aHJpcyBQYWNraGFtIHdyb3RlOg0KPj4+IEhpLA0KPj4+DQo+Pj4gSSd2ZSBnb3QgYSBzeXN0ZW0g
dXNpbmcgYSBQb3dlclBDIFQyMDgwIFNvQyBhbmQgYW1vbmcgb3RoZXIgdGhpbmdzIGhhcw0KPj4+
IGFuIExNODEgaHdtb24gY2hpcC4NCj4+Pg0KPj4+IFVuZGVyIGEgaGlnaCBDUFUgbG9hZCB3ZSBz
ZWUgZXJyYW50IHJlYWRpbmdzIGZyb20gdGhlIExNODEgYXMgd2VsbCBhcw0KPj4+IGFjdHVhbCBm
YWlsdXJlcy4gSXQncyB0aGUgZXJyYW50IHJlYWRpbmdzIHRoYXQgY2F1c2UgdGhlIG1vc3QgY29u
Y2Vybg0KPj4+IHNpbmNlIHdlIGNhbiBlYXNpbHkgaWdub3JlIHRoZSByZWFkIGVycm9ycyBpbiBv
dXIgbW9uaXRvcmluZyANCj4+PiBhcHBsaWNhdGlvbg0KPj4+IChhbHRob3VnaCBpdCB3b3VsZCBi
ZSBiZXR0ZXIgaWYgdGhleSB3ZXJlbid0IHRoZXJlIGF0IGFsbCkuDQo+Pj4NCj4+PiBJJ20gYWJs
ZSB0byByZXByb2R1Y2UgdGhpcyB3aXRoIGEgdGVzdCBhcHBsaWNhdGlvblswXSB0aGF0IGFydGlm
aWNpYWxseQ0KPj4+IGNyZWF0ZXMgYSBoaWdoIENQVSBsb2FkIHRoZW4gYnkgcmVwZWF0ZWRseSBj
aGVja2luZyBmb3IgdGhlIGFsbC0xcw0KPj4+IHZhbHVlcyBmcm9tIHRoZSBMTTgxIGRhdGFzaGVl
dFsxXShwYWdlIDE3KS4gVGhlIGFsbC0xcyByZWFkaW5ncyBzdGljaw0KPj4+IG91dCBhcyB0aGV5
IGFyZSBvYnZpb3VzbHkgaGlnaGVyIHRoYW4gdGhlIHZvbHRhZ2UgcmFpbHMgdGhhdCBhcmUNCj4+
PiBjb25uZWN0ZWQgYW5kIGRpc2FncmVlIHdpdGggbWVhc3VyZW1lbnRzIHRha2VuIHdpdGggYSBt
dWx0aW1ldGVyLg0KPj4+DQo+Pj4gSGVyZSdzIHRoZSBvdXRwdXQgZnJvbSBteSBkZXZpY2UNCj4+
Pg0KPj4+IFtyb290QGxpbnV4Ym94IH5dIyBjcHVsb2FkIDkwJg0KPj4+IFtyb290QGxpbnV4Ym94
IH5dIyAod2hpbGUgdHJ1ZTsgZG8gY2F0IA0KPj4+IC9zeXMvY2xhc3MvaHdtb24vaHdtb24wL2lu
Kl9pbnB1dA0KPj4+IHwgZ3JlcCAnMzMyMFx8NDM4M1x8NjY0MVx8MTU5MzBcfDM1ODYnOyBzbGVl
cCAxOyBkb25lKSYNCj4+PiAzNTg2DQo+Pj4gMzU4Ng0KPj4+IGNhdDogcmVhZCBlcnJvcjogTm8g
c3VjaCBkZXZpY2Ugb3IgYWRkcmVzcw0KPj4+IGNhdDogcmVhZCBlcnJvcjogTm8gc3VjaCBkZXZp
Y2Ugb3IgYWRkcmVzcw0KPj4+IDMzMjANCj4+PiAzMzIwDQo+Pj4gMzU4Ng0KPj4+IDM1ODYNCj4+
PiA2NjQxDQo+Pj4gNjY0MQ0KPj4+IDQzODMNCj4+PiA0MzgzDQo+Pj4NCj4+PiBGdW5kYW1lbnRh
bGx5IEkgdGhpbmsgdGhpcyBpcyBhIHByb2JsZW0gd2l0aCB0aGUgZmFjdCB0aGF0IHRoZSBMTTgx
IGlzDQo+Pj4gYW4gU01CdXMgZGV2aWNlIGJ1dCB0aGUgVDIwODAgKGFuZCBvdGhlciBGcmVlc2Nh
bGUgU29DcykgdXNlcyBpMmMgDQo+Pj4gYW5kIHdlDQo+Pj4gZW11bGF0ZSBTTUJ1cy4gSSBzdXNw
ZWN0IHRoZSBlcnJhbnQgcmVhZGluZ3MgYXJlIHdoZW4gd2UgZG9uJ3QgZ2V0IA0KPj4+IHJvdW5k
DQo+Pj4gdG8gY29tcGxldGluZyB0aGUgcmVhZCB3aXRoaW4gdGhlIHRpbWVvdXQgc3BlY2lmaWVk
IGJ5IHRoZSBTTUJ1cw0KPj4+IHNwZWNpZmljYXRpb24uIERlcGVuZGluZyBvbiB3aGVuIHRoYXQg
aGFwcGVucyB3ZSBlaXRoZXIgZmFpbCB0aGUNCj4+PiB0cmFuc2ZlciBvciBpbnRlcnByZXQgdGhl
IHJlc3VsdCBhcyBhbGwtMXMuDQo+Pj4NCj4+IFRoYXQgaXMgcXVpdGUgdW5saWtlbHkuIE1hbnkg
c2Vuc29yIGNoaXBzIGFyZSBTTUJ1cyBjaGlwcyBjb25uZWN0ZWQgdG8NCj4+IGkyYyBidXNzZXMu
IEl0IGlzIG11Y2ggbW9yZSBsaWtlbHkgdGhhdCB0aGVyZSBpcyBhIGJ1ZyBpbiB0aGUgVDIwODAg
DQo+PiBpMmMgZHJpdmVyLA0KPj4gdGhhdCB0aGUgY2hpcCBkb2Vzbid0IGxpa2UgdGhlIGJ1bGsg
cmVhZCBjb21tYW5kIGlzc3VlZCB0aHJvdWdoIA0KPj4gcmVnbWFwLCB0aGF0DQo+PiB0aGUgY2hp
cCBoYXMgcHJvYmxlbXMgd2l0aCB0aGUgaTJjIGJ1cyBzcGVlZCwgb3IgdGhhdCB0aGUgaTJjIGJ1
cyBpcyANCj4+IG5vaXN5Lg0KPiBQZXJoYXBzIHNvbWV0aGluZyBnZXRzIHVwc2V0IHdoZW4gaW50
ZXJydXB0IHByb2Nlc3NpbmcgaXMgZGVsYXllZCANCj4gYmVjYXVzZSBvZiBDUFUgbG9hZC4gSSBk
b24ndCBzZWUgdGhlIHByb2JsZW0gd2hlbiB0aGVyZSBpc24ndCBhIENQVSANCj4gbG9hZCBzbyBJ
IHRoaW5rIHRoYXQgZWxpbWluYXRlcyBib2FyZCBpc3N1ZXMuDQo+PiBJbiB0aGlzIGNvbnRleHQs
IHRoZSAiTm8gc3VjaCBkZXZpY2Ugb3IgYWRkcmVzcyIgcmVzcG9uc2VzIGFyZSB2ZXJ5IA0KPj4g
c3VzcGljaW91cy4NCj4+IFRob3NlIGFyZSByZXBvcnRlZCBieSB0aGUgaTJjIGRyaXZlciwgbm90
IGJ5IHRoZSBod21vbiBkcml2ZXIsIGFuZCANCj4+IHN1Z2dlc3QNCj4+IHRoYXQgdGhlIGNoaXAg
ZGlkIG5vdCByZXNwb25kIHRvIGEgcmVhZCByZXF1ZXN0LiBNYXliZSBpdCBoZWxwcyB0byANCj4+
IGVuYWJsZQ0KPj4gZGVidWdnaW5nIHRvIHRoZSBpMmMgZHJpdmVyIHRvIHNlZSBpZiBpdCByZXBv
cnRzIGFueXRoaW5nIHVzZWZ1bC4gRXZlbg0KPj4gYmV0dGVyIG1pZ2h0IGJlIHRvIGNvbm5lY3Qg
YW4gaTJjIGJ1cyBhbmFseXplciB0byB0aGUgaTJjIGJ1cyBhbmQgY2hlY2sNCj4+IHdoYXQgaXMg
Z29pbmcgb24uDQo+IFRoYXQncyBmcm9tIC1FTlhJTyB3aGljaCBpcyB1c2VkIGluIG9ubHkgb25l
IHBsYWNlIGluIGkyYy1tcGMuYy4gSSdsbCANCj4gZW5hYmxlIHNvbWUgZGVidWcgYW5kIHNlZSB3
aGF0IHdlIGdldC4NCg0KRm9yIHRoZSBlcnJhbnQgcmVhZGluZ3MgdGhlcmUgd2FzIG5vdGhpbmcg
YWJub3JtYWwgcmVwb3J0ZWQgYnkgdGhlIGRyaXZlci4NCg0KRm9yIHRoZSAiTm8gc3VjaCBkZXZp
Y2Ugb3IgYWRkcmVzcyIgSSBzYXcgIm1wYy1pMmMgZmZlMTE5MDAwLmkyYzogTm8gDQpSWEFLIiB3
aGljaCBtYXRjaGVzIHVwIHdpdGggdGhlIC1FTlhJTyByZXR1cm4uDQo=
