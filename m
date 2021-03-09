Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64CF6331DEB
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Mar 2021 05:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhCIEhO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Mar 2021 23:37:14 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:47798 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbhCIEgu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Mar 2021 23:36:50 -0500
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 053C9891AE;
        Tue,  9 Mar 2021 17:36:48 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1615264608;
        bh=94GooBuqwjsN2PgXHFKVfo9ebg+N+xJNt2/7dlShRws=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=irpjd3IkktHH24EsvNqFEVrsY1yZOE4b1qCTwdTYeQ+BTR3SycnJTpytKc1FXyXjT
         Lg/GHcPX7uc8BeN+8yxUuOh1KTJEdpIy0u3JXD6agKl4CsaX0WVZBNIYd93uoRNPkA
         0FBUtUUJ3kLtQcuOVg7R2mwjCWLcctlpwjzXFvb0nSLavHJ9RptXqERBBCC9Hj97uZ
         1jfGrCGsrIpIe87CmMEyRChOxoPrQFRZ+fsX/KgG9vp/EIEXzg5q/lCO3NeTKJcTEm
         HjofLGn/k77WcCDmud82qzGYukn2gLqdhQQnRfZkk61K4stgGMOPZDd195Wu9BJkSO
         2AEJJ9yrEjWag==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B6046fb5f0001>; Tue, 09 Mar 2021 17:36:47 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 9 Mar 2021 17:36:47 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Tue, 9 Mar 2021 17:36:47 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Guenter Roeck <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXE6SbssdAOSHgwE+zIRhtn11Sk6p4Y2sAgAAgcACAACSBgIAABe+AgAEgEgCAAGwMgA==
Date:   Tue, 9 Mar 2021 04:36:47 +0000
Message-ID: <d36a85c2-4ec5-6c28-9e2a-282de1eaf955@alliedtelesis.co.nz>
References: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
 <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
 <4a1b1494-df96-2d8c-9323-beb2c2ba706b@alliedtelesis.co.nz>
 <a67ea323-634d-d34e-c63e-b1aaa4737b19@alliedtelesis.co.nz>
 <5709f180-04b5-09b2-e1c4-53eb5c9345d8@roeck-us.net>
 <61f68c59-593b-e393-5520-d9acc14fdf97@alliedtelesis.co.nz>
In-Reply-To: <61f68c59-593b-e393-5520-d9acc14fdf97@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <811CB1FD02E3674DAB25356F89E5D27F@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=C7uXNjH+ c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=brUy9DZNWyBmMtso1hQA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiA5LzAzLzIxIDExOjEwIGFtLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPg0KPiBPbiA4LzAz
LzIxIDU6NTkgcG0sIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+PiBPbiAzLzcvMjEgODozNyBQTSwg
Q2hyaXMgUGFja2hhbSB3cm90ZToNCj4+IFsgLi4uIF0NCj4+Pj4gVGhhdCdzIGZyb20gLUVOWElP
IHdoaWNoIGlzIHVzZWQgaW4gb25seSBvbmUgcGxhY2UgaW4gaTJjLW1wYy5jLiBJJ2xsDQo+Pj4+
IGVuYWJsZSBzb21lIGRlYnVnIGFuZCBzZWUgd2hhdCB3ZSBnZXQuDQo+Pj4gRm9yIHRoZSBlcnJh
bnQgcmVhZGluZ3MgdGhlcmUgd2FzIG5vdGhpbmcgYWJub3JtYWwgcmVwb3J0ZWQgYnkgdGhlIA0K
Pj4+IGRyaXZlci4NCj4+Pg0KPj4+IEZvciB0aGUgIk5vIHN1Y2ggZGV2aWNlIG9yIGFkZHJlc3Mi
IEkgc2F3ICJtcGMtaTJjIGZmZTExOTAwMC5pMmM6IE5vDQo+Pj4gUlhBSyIgd2hpY2ggbWF0Y2hl
cyB1cCB3aXRoIHRoZSAtRU5YSU8gcmV0dXJuLg0KPj4+DQo+PiBJZCBzdWdnZXN0IHRvIGNoZWNr
IHRoZSB0aW1lIHVudGlsIG5vdCBidXN5IGFuZCBzdG9wIGluIG1wY194ZmVyKCkuDQo+PiBUaG9z
ZSBob3QgbG9vcHMgYXJlIHVudXN1YWwsIGFuZCBtYXkgd2VsbCBtZXNzIHVwIHRoZSBjb2RlIGVz
cGVjaWFsbHkNCj4+IGlmIHByZWVtcHQgaXMgZW5hYmxlZC4NCj4gUmV3b3JraW5nIHRob3NlIGxv
b3BzIHNlZW1zIHRvIGhhdmUgaGFkIGEgcG9zaXRpdmUgcmVzdWx0LiBJJ2xsIGRvIGEgDQo+IGJp
dCBtb3JlIHRlc3RpbmcgYW5kIGhvcGVmdWxseSBnZXQgYSBwYXRjaCBvdXQgbGF0ZXIgdG9kYXku
DQpEJ29oIG15ICJmaXgiIHdhcyB0byByZXBsYWNlIHRoZSBjb25kX3Jlc2hlZCgpIHdpdGggbXNs
ZWVwKDEwKSB3aGljaCBkaWQgDQoiZml4IiB0aGUgcHJvYmxlbSBidXQgbWFkZSBldmVyeSBpMmMg
cmVhZCBzbG93LiBJIGRpZG4ndCBub3RpY2Ugd2hlbiANCnRlc3RpbmcganVzdCB0aGUgbG04MSBi
dXQgYXMgc29vbiBhcyBJIGJvb3RlZCB0aGUgc3lzdGVtIHdpdGggbW9yZSBpMmMgDQpkZXZpY2Vz
IEkgc2F3IHN0dXBpZGx5IHNsb3cgYm9vdCB0aW1lcy4NCj4+IMKgIEFsc28sIGFyZSB5b3UgdXNp
bmcgaW50ZXJydXB0cyBvciBwb2xsaW5nIGluDQo+PiB5b3VyIHN5c3RlbSA/IFRoZSBpbnRlcnJ1
cHQgaGFuZGxlciBsb29rcyBhIGJpdCBvZGQsIHdpdGggIlJlYWQgYWdhaW4NCj4+IHRvIGFsbG93
IHJlZ2lzdGVyIHRvIHN0YWJpbGlzZSIuDQo+Pg0KPj4gRG8geW91IGhhdmUgZnNsLHRpbWVvdXQg
c2V0IGluIHRoZSBkZXZpY2V0cmVlIHByb3BlcnRpZXMgYW5kLCBpZiBzbywNCj4+IGhhdmUgeW91
IHBsYXllZCB3aXRoIGl0ID8NCj4+DQo+PiBPdGhlciB0aGFuIHRoYXQsIHRoZSBvbmx5IG90aGVy
IHJlYWwgaWRlYSBJIGhhdmUgd291bGQgYmUgdG8gbW9uaXRvcg0KPj4gdGhlIGkyYyBidXMuDQo+
Pg0KPj4gR3VlbnRlcg==
