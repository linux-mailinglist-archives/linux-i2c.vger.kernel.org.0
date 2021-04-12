Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2661F35D3E1
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 01:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243863AbhDLXWO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 19:22:14 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:38535 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237522AbhDLXWN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Apr 2021 19:22:13 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 60C16891AE;
        Tue, 13 Apr 2021 11:21:51 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618269711;
        bh=RQS9l5X7lIKJocG/GeDuj14T7toAGfgs7RyORpOR6jA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=XE2sJJYQmv65gHsaw+v7wid/k/ufCaa4zm0Humf2aHzzZyc1kDB6Yk+o3A93xohDY
         dUd916DEMmSKFgE10025p8MD69/ikVjygY7rkPfhkwFWvzdVyViT3mRSXZSA+i9TFb
         ZJEi8c0JMzL9fv60GqDFDo9B0NF1jIW/BmMTmUqbUD55bogvFCqcF9oOgKP+TdcC6i
         uzjhHHwFHAJARruLGgqEpMerw0CcXKrjJTDLYd7qrBm8+s7ZZGfKHzMxqtAdbUnyr7
         K65HSJhrhwhgDH1DuWOsB2qq4n3/+MpwNVvUPqvZR17axuzxLKUnAhrk4S9mM96hre
         JZJci3lk/2gFg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B6074d60f0001>; Tue, 13 Apr 2021 11:21:51 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 11:21:50 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Tue, 13 Apr 2021 11:21:50 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] i2c: mpc: use device managed APIs
Thread-Topic: [PATCH v2 5/6] i2c: mpc: use device managed APIs
Thread-Index: AQHXJD4hPkOAx7p/C0SxShLnf1dXjKqwy3IAgAAIIgA=
Date:   Mon, 12 Apr 2021 23:21:49 +0000
Message-ID: <c9af3c98-7680-b7d1-a23b-f09c90e19b91@alliedtelesis.co.nz>
References: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
 <20210329015206.17437-6-chris.packham@alliedtelesis.co.nz>
 <CAHp75VfRXeeP0uQFDBUS6=n2TvG+_5=pe8rWp6BpbDNMz6=OSg@mail.gmail.com>
In-Reply-To: <CAHp75VfRXeeP0uQFDBUS6=n2TvG+_5=pe8rWp6BpbDNMz6=OSg@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CF19CA71FCC3C4198CE627F21BA20D1@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=3YhXtTcJ-WEA:10 a=H-jxdX1ajvg_SQcKcx4A:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAxMy8wNC8yMSAxMDo1MiBhbSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiBPbiBNb24s
IE1hciAyOSwgMjAyMSBhdCA0OjU0IEFNIENocmlzIFBhY2toYW0NCj4gPGNocmlzLnBhY2toYW1A
YWxsaWVkdGVsZXNpcy5jby5uej4gd3JvdGU6DQo+PiBVc2UgZGV2aWNlIG1hbmFnZWQgZnVuY3Rp
b25zIGFuIGNsZWFuIHVwIGVycm9yIGhhbmRsaW5nLg0KPiBGb3IgdGhlIGdvZCBzYWtlIGhvdyBo
YXZlIHlvdSB0ZXN0ZWQgdGhpcz8NCj4gVGhlIHBhdGNoIGlzIGJyb2tlbi4NCkkndmUgY2xlYXJs
eSBtaXNzZWQgdGhlIHJlbW92ZSBwYXRoIGluIG15IHRlc3RpbmcuIEkgd2FzIGZvY3VzZWQgb24g
dGhlIA0KaW50ZXJydXB0IGJldmhhdmlvdXIgbm90IHRoZSBwcm9iZS9yZW1vdmUgd2hpY2ggSSds
bCBtYWtlIHN1cmUgdG8gY2hlY2sgDQpmb3IgdGhlIG5leHQgcm91bmQu
