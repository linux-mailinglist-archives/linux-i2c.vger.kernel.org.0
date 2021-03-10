Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63DD5333310
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 03:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbhCJCUP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Mar 2021 21:20:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbhCJCTq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Mar 2021 21:19:46 -0500
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13319C061760
        for <linux-i2c@vger.kernel.org>; Tue,  9 Mar 2021 18:19:46 -0800 (PST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9CACE891AE;
        Wed, 10 Mar 2021 15:19:42 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1615342782;
        bh=ynjd/8Ld7IjX+nN+ReBSD47ri0nvGf5EYjcBgqv7HqU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=n2fOU6ZsJKEaUmE5B+IzQCPxN/WbklRw6M6gwOYhetGgEOiS4qvBOyIq+moC55CZw
         alhBA8XmtmjPs/g4F1h0Cz2G7vHf2RyX6Y0JhtGxv3Ue2rJ5UaHkWaX9036OCr8IMr
         VoXl1mvYpv9zMI8FcsEjTpgMZ5U2q/5mXYykmg1WLkghQCKAroDMBTpIPjikkN+A+L
         4eHwVYgrzIiSK25Fi9vdHZk4mLpvpLJMmtFaQYl957uoXd0Qxsorwv/xO8gu8eF2UA
         yqenmLBRsgGRLbzReDav+TClSpzS3HRB6p06TZggPKLEn70LZcJ2uz7jN1bm3HyGUY
         2G01NJmget2IA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60482cbe0001>; Wed, 10 Mar 2021 15:19:42 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Mar 2021 15:19:42 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Wed, 10 Mar 2021 15:19:42 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Guenter Roeck <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXE6SbssdAOSHgwE+zIRhtn11Sk6p4Y2sAgAAgcACAACSBgIAABe+AgAEDagCAAfS7gA==
Date:   Wed, 10 Mar 2021 02:19:41 +0000
Message-ID: <1aa0dc23-0706-5902-2f46-0767de0e3ad6@alliedtelesis.co.nz>
References: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
 <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
 <4a1b1494-df96-2d8c-9323-beb2c2ba706b@alliedtelesis.co.nz>
 <a67ea323-634d-d34e-c63e-b1aaa4737b19@alliedtelesis.co.nz>
 <5709f180-04b5-09b2-e1c4-53eb5c9345d8@roeck-us.net>
 <d6074923-ee7e-4499-0e54-383a607d3c41@alliedtelesis.co.nz>
In-Reply-To: <d6074923-ee7e-4499-0e54-383a607d3c41@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0026D2B10AFD31449586F5F5A3AF42B8@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=C7uXNjH+ c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=pY-3r6TeYhhqQcfjg64A:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gOS8wMy8yMSA5OjI3IGFtLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPiBPbiA4LzAzLzIxIDU6
NTkgcG0sIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+PiBPdGhlciB0aGFuIHRoYXQsIHRoZSBvbmx5
IG90aGVyIHJlYWwgaWRlYSBJIGhhdmUgd291bGQgYmUgdG8gbW9uaXRvcg0KPj4gdGhlIGkyYyBi
dXMuDQo+IEkgYW0gaW4gdGhlIGZvcnR1bmF0ZSBwb3NpdGlvbiBvZiBiZWluZyBhYmxlIHRvIGdv
IGludG8gdGhlIG9mZmljZSBhbmQgDQo+IGV2ZW4gaGFwcGVuIHRvIGhhdmUgdGhlIGV4cGVuc2l2
ZSBzY29wZSBhdCB0aGUgbW9tZW50LiBOb3cgSSBqdXN0IG5lZWQgDQo+IHRvIGZpbmQgYSB0YW1l
IEhXIGVuZ2luZWVyIHNvIEkgZG9uJ3QgYnVybiBteXNlbGYgdHJ5aW5nIHRvIGF0dGFjaCB0aGUg
DQo+IHByb2Jlcy4NCk9uZSB0aGluZyBJIHNlZSBvbiB0aGUgc2NvcGUgaXMgdGhhdCB3aGVuIHRo
ZXJlIGlzIGEgQ1BVIGxvYWQgdGhlcmUgDQphcHBlYXJzIHRvIGJlIHNvbWUgY2xvY2sgc3RyZXRj
aGluZyBnb2luZyBvbiAoU0NMIGlzIGhlbGQgbG93IHNvbWUgDQp0aW1lcykuIEkgZG9uJ3Qgc2Vl
IGl0IHdpdGhvdXQgdGhlIENQVSBsb2FkLiBJdCdzIGhhcmQgdG8gY29ycmVsYXRlIGEgDQpjbG9j
ayBzdHJldGNoaW5nIGV2ZW50IHdpdGggYSBiYWQgcmVhZCBvciBlcnJvciBidXQgaXQgaXMgb25l
IGFyZWEgd2hlcmUgDQp0aGUgU01CVVMgc3BlYyBoYXMgYSBtYXhpbXVtIHRoYXQgbWlnaHQgY2F1
c2UgdGhlIGRldmljZSB0byBnaXZlIHVwIHdhaXRpbmcuDQo=
