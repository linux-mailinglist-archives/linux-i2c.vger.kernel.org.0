Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3BE035D3ED
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 01:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238264AbhDLX0k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 19:26:40 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:38567 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237594AbhDLX0k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Apr 2021 19:26:40 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 35783891AE;
        Tue, 13 Apr 2021 11:26:20 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618269980;
        bh=3IMOVN8icpdbOTHo2f+OJ4zZ310NYB3vCcF69OODyTc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=PCq4121uaIjpeX8wl/35Ka22Ov8P9l14tF0IimsBJ12bphEcw77/W7X4wonW8vwyZ
         BBuNKyEs85TqZpYxMhinm+Gef6+pnpwbcoT2zgC9OHvEKQ22M7+L3QevXV0wGUvbVY
         wgxPciHjby3Vt5iZ88E/lqIRwsOi8jsrvPuVKwhsRLpTOlNwSx1IqVKIBBiWJ8sKgK
         a2cQHvjq0+fIt92ZKL/c+cWzOY+oT5hpgWpidNa2kIJYiaFtasodqOaIj0mqi1XUrR
         hHQz+GLHAwTd00jVRsJswDjpbte5ttZHF3b3iK088ExcGHUS8Svh6I0JIGJDRgx5/i
         FRQWmVJZQvtDA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B6074d71c0001>; Tue, 13 Apr 2021 11:26:20 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 11:26:19 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Tue, 13 Apr 2021 11:26:19 +1200
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
Thread-Index: AQHXJD4hPkOAx7p/C0SxShLnf1dXjKqwy3IAgAAIIgCAAAE/AA==
Date:   Mon, 12 Apr 2021 23:26:18 +0000
Message-ID: <c85dcf3e-f63e-8e9f-d977-18a4b6e21328@alliedtelesis.co.nz>
References: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
 <20210329015206.17437-6-chris.packham@alliedtelesis.co.nz>
 <CAHp75VfRXeeP0uQFDBUS6=n2TvG+_5=pe8rWp6BpbDNMz6=OSg@mail.gmail.com>
 <c9af3c98-7680-b7d1-a23b-f09c90e19b91@alliedtelesis.co.nz>
In-Reply-To: <c9af3c98-7680-b7d1-a23b-f09c90e19b91@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD9A65E038D64948B760A68AA0DF1D6D@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=3YhXtTcJ-WEA:10 a=qlBYXRN-yFhSvp3jyXMA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAxMy8wNC8yMSAxMToyMSBhbSwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4NCj4gT24gMTMv
MDQvMjEgMTA6NTIgYW0sIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4+IE9uIE1vbiwgTWFyIDI5
LCAyMDIxIGF0IDQ6NTQgQU0gQ2hyaXMgUGFja2hhbQ0KPj4gPGNocmlzLnBhY2toYW1AYWxsaWVk
dGVsZXNpcy5jby5uej4gd3JvdGU6DQo+Pj4gVXNlIGRldmljZSBtYW5hZ2VkIGZ1bmN0aW9ucyBh
biBjbGVhbiB1cCBlcnJvciBoYW5kbGluZy4NCj4+IEZvciB0aGUgZ29kIHNha2UgaG93IGhhdmUg
eW91IHRlc3RlZCB0aGlzPw0KPj4gVGhlIHBhdGNoIGlzIGJyb2tlbi4NCj4gSSd2ZSBjbGVhcmx5
IG1pc3NlZCB0aGUgcmVtb3ZlIHBhdGggaW4gbXkgdGVzdGluZy4gSSB3YXMgZm9jdXNlZCBvbiAN
Cj4gdGhlIGludGVycnVwdCBiZXZoYXZpb3VyIG5vdCB0aGUgcHJvYmUvcmVtb3ZlIHdoaWNoIEkn
bGwgbWFrZSBzdXJlIHRvIA0KPiBjaGVjayBmb3IgdGhlIG5leHQgcm91bmQuDQoNClNob3VsZCBJ
IHNlbmQgYSByZXZlcnQgb3IgbGVhdmUgaXQgZm9yIFdvbGZyYW0/DQo=
