Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8931B331A04
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 23:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbhCHWKl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Mar 2021 17:10:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhCHWKL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Mar 2021 17:10:11 -0500
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A68C06174A
        for <linux-i2c@vger.kernel.org>; Mon,  8 Mar 2021 14:10:08 -0800 (PST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3692C891AE;
        Tue,  9 Mar 2021 11:10:06 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1615241406;
        bh=lntyDAshQOAKHnLfKXv3IxH+DDU3YTr4lV7rUyg0loU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=yhE9TKTzbJwEdBEqyx/36MaPHLfQDk8hISpeNF8AaCHU3KbaVfgVjGMJQouGFpHXF
         lOkAtW6ehKU5sy7mKYi1OTF5tYZcPkYKz+W3XCLIcCmlr9/VhGr5IDHb36AIlNCqmD
         KvydVz/BJA8MZLi8WfT6ZLl+sTKGQPSL6iglJe4fLmehBMlQyUSEMA/cQkXersJsCo
         wDCW/JidQeEM9VDgJVJ9PR1SrVhtkWs+f5y3nos6xIctUY54Wm2ZytRPrOclVsV5lO
         K0fcrqKWJuMoekCLRq3uTijU0xv0t+WVilig+ZCsib2oiIw+0TwTJ4EBdMVjo81iCf
         UjLRDyCyd70LA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B6046a0be0001>; Tue, 09 Mar 2021 11:10:06 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 9 Mar 2021 11:10:05 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Tue, 9 Mar 2021 11:10:05 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Guenter Roeck <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXE6SbssdAOSHgwE+zIRhtn11Sk6p4Y2sAgAAgcACAACSBgIAABe+AgAEgEgA=
Date:   Mon, 8 Mar 2021 22:10:04 +0000
Message-ID: <61f68c59-593b-e393-5520-d9acc14fdf97@alliedtelesis.co.nz>
References: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
 <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
 <4a1b1494-df96-2d8c-9323-beb2c2ba706b@alliedtelesis.co.nz>
 <a67ea323-634d-d34e-c63e-b1aaa4737b19@alliedtelesis.co.nz>
 <5709f180-04b5-09b2-e1c4-53eb5c9345d8@roeck-us.net>
In-Reply-To: <5709f180-04b5-09b2-e1c4-53eb5c9345d8@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <3640F36EA07E514C90647B7E2CDC9D64@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=C7uXNjH+ c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=PTGF5A0OB_MCYIXsh5sA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiA4LzAzLzIxIDU6NTkgcG0sIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+IE9uIDMvNy8yMSA4
OjM3IFBNLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPiBbIC4uLiBdDQo+Pj4gVGhhdCdzIGZyb20g
LUVOWElPIHdoaWNoIGlzIHVzZWQgaW4gb25seSBvbmUgcGxhY2UgaW4gaTJjLW1wYy5jLiBJJ2xs
DQo+Pj4gZW5hYmxlIHNvbWUgZGVidWcgYW5kIHNlZSB3aGF0IHdlIGdldC4NCj4+IEZvciB0aGUg
ZXJyYW50IHJlYWRpbmdzIHRoZXJlIHdhcyBub3RoaW5nIGFibm9ybWFsIHJlcG9ydGVkIGJ5IHRo
ZSBkcml2ZXIuDQo+Pg0KPj4gRm9yIHRoZSAiTm8gc3VjaCBkZXZpY2Ugb3IgYWRkcmVzcyIgSSBz
YXcgIm1wYy1pMmMgZmZlMTE5MDAwLmkyYzogTm8NCj4+IFJYQUsiIHdoaWNoIG1hdGNoZXMgdXAg
d2l0aCB0aGUgLUVOWElPIHJldHVybi4NCj4+DQo+IElkIHN1Z2dlc3QgdG8gY2hlY2sgdGhlIHRp
bWUgdW50aWwgbm90IGJ1c3kgYW5kIHN0b3AgaW4gbXBjX3hmZXIoKS4NCj4gVGhvc2UgaG90IGxv
b3BzIGFyZSB1bnVzdWFsLCBhbmQgbWF5IHdlbGwgbWVzcyB1cCB0aGUgY29kZSBlc3BlY2lhbGx5
DQo+IGlmIHByZWVtcHQgaXMgZW5hYmxlZC4NClJld29ya2luZyB0aG9zZSBsb29wcyBzZWVtcyB0
byBoYXZlIGhhZCBhIHBvc2l0aXZlIHJlc3VsdC4gSSdsbCBkbyBhIGJpdCANCm1vcmUgdGVzdGlu
ZyBhbmQgaG9wZWZ1bGx5IGdldCBhIHBhdGNoIG91dCBsYXRlciB0b2RheS4NCj4gICBBbHNvLCBh
cmUgeW91IHVzaW5nIGludGVycnVwdHMgb3IgcG9sbGluZyBpbg0KPiB5b3VyIHN5c3RlbSA/IFRo
ZSBpbnRlcnJ1cHQgaGFuZGxlciBsb29rcyBhIGJpdCBvZGQsIHdpdGggIlJlYWQgYWdhaW4NCj4g
dG8gYWxsb3cgcmVnaXN0ZXIgdG8gc3RhYmlsaXNlIi4NCj4NCj4gRG8geW91IGhhdmUgZnNsLHRp
bWVvdXQgc2V0IGluIHRoZSBkZXZpY2V0cmVlIHByb3BlcnRpZXMgYW5kLCBpZiBzbywNCj4gaGF2
ZSB5b3UgcGxheWVkIHdpdGggaXQgPw0KPg0KPiBPdGhlciB0aGFuIHRoYXQsIHRoZSBvbmx5IG90
aGVyIHJlYWwgaWRlYSBJIGhhdmUgd291bGQgYmUgdG8gbW9uaXRvcg0KPiB0aGUgaTJjIGJ1cy4N
Cj4NCj4gR3VlbnRlcg==
