Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 526DB397F1B
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jun 2021 04:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbhFBCeD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Jun 2021 22:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbhFBCeD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Jun 2021 22:34:03 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09828C061574
        for <linux-i2c@vger.kernel.org>; Tue,  1 Jun 2021 19:32:20 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 8C2DC83646;
        Wed,  2 Jun 2021 14:32:15 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1622601135;
        bh=EQQVSK+0QJTK16+K58HZ49/bcvwdWuz0jHQrnvLd4Rg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=f4uR3oEr9dZfwpQW/NPhDpbNV3Ljrtr0hrZyn5BtOFIDDvKQ1jkHD1llcvJv/frXU
         7nnR/5DCWpoTVF1xPhUCIezwUtLoRJeXPdSyhvxr7IbAKS8x/3V9XyxihZEacURcdZ
         /USqNJ0YcxueNqOK0L+t3+Bmj6bwYbPsCBMznPaJTByl4PQNCVYSTpdSAoERLNoacM
         4o6E6M0tOxFis2B/jyntHEV9cxt9AakpwCED+ZU6I4Mn0nhswNbO466DcryCCMxsaX
         wEZS5PCM7TPeyHPByggpnARkh5SGrby06O9FtxZd+5G3Mm6asmfiKhLXgmlEhjAj1M
         lLXD6kNOE4dCw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60b6edaf0001>; Wed, 02 Jun 2021 14:32:15 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 2 Jun 2021 14:32:15 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.018; Wed, 2 Jun 2021 14:32:15 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Ray Jui <ray.jui@broadcom.com>, "wsa@kernel.org" <wsa@kernel.org>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Richard Laing <Richard.Laing@alliedtelesis.co.nz>
Subject: Re: [PATCH] i2c: bcm-iproc: Add i2c recovery support
Thread-Topic: [PATCH] i2c: bcm-iproc: Add i2c recovery support
Thread-Index: AQHXVacbqgXaQg7ZR0qJitirfUU45Kr+3pAAgABb9QA=
Date:   Wed, 2 Jun 2021 02:32:14 +0000
Message-ID: <d133a136-11c1-1693-6f9b-e6fcf6a448f6@alliedtelesis.co.nz>
References: <20210530225659.17138-1-chris.packham@alliedtelesis.co.nz>
 <7962c2ae-f3c6-66a4-e976-f7edbf80781c@broadcom.com>
In-Reply-To: <7962c2ae-f3c6-66a4-e976-f7edbf80781c@broadcom.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <87BADBB809678C4FA734F022485B7B0B@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=WOcBoUkR c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=r6YtysWOX24A:10 a=4CoGGOvJKCGszEM0gbIA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAyLzA2LzIxIDk6MDMgYW0sIFJheSBKdWkgd3JvdGU6DQo+DQo+IE9uIDUvMzAvMjAyMSAz
OjU2IFBNLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4gRnJvbTogUmljaGFyZCBMYWluZyA8cmlj
aGFyZC5sYWluZ0BhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KPj4NCj4+IFRoZSBiY20taXByb2MgY29u
dHJvbGxlciBjYW4gcHV0IHRoZSBTREEvU0NMIGxpbmVzIGludG8gYml0LWJhbmcgbW9kZSwNCj4+
IG1ha2UgdXNlIG9mIHRoaXMgdG8gc3VwcG9ydCBpMmMgYnVzIHJlY292ZXJ5Lg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IFJpY2hhcmQgTGFpbmcgPHJpY2hhcmQubGFpbmdAYWxsaWVkdGVsZXNpcy5j
by5uej4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxs
aWVkdGVsZXNpcy5jby5uej4NCj4+IC0tLQ0KPHNuaXA+DQo+ICsNCj4+ICtzdGF0aWMgc3RydWN0
IGkyY19idXNfcmVjb3ZlcnlfaW5mbyBiY21faXByb2NfcmVjb3ZlcnlfaW5mbyA9IHsNCj4gc3Rh
dGljIGNvbnN0IHN0cnVjdCAuLi4NCg0KVGhlIGtlcm5lbCB0ZXN0IGJvdCBkb2Vzbid0IGxpa2Ug
dGhlIHN1Z2dlc3Rpb24uDQoNCiA+PiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWJjbS1pcHJvYy5j
OjEyNjQ6MjY6IGVycm9yOiBhc3NpZ25pbmcgdG8gDQonc3RydWN0IGkyY19idXNfcmVjb3Zlcnlf
aW5mbyAqJyBmcm9tICdjb25zdCBzdHJ1Y3QgDQppMmNfYnVzX3JlY292ZXJ5X2luZm8gKicgZGlz
Y2FyZHMgcXVhbGlmaWVycyANClstV2Vycm9yLC1XaW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXMt
ZGlzY2FyZHMtcXVhbGlmaWVyc10NCg0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkYXAtPmJ1c19y
ZWNvdmVyeV9pbmZvID0gJmJjbV9pcHJvY19yZWNvdmVyeV9pbmZvOw0KIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF4g
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQoNCkkgY2FuIHNlZSB3aHkuIEFyZSB5b3UgaGFwcHkg
Zm9yIG1lIHRvIGRyb3AgdGhlIGNvbnN0IGluIHYzPyBPciBwZXJoYXBzIA0KeW91IGhhdmUgYSBi
ZXR0ZXIgc3VnZ2VzdGlvbi4NCg==
