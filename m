Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433944A38FE
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jan 2022 21:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356122AbiA3UWT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jan 2022 15:22:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356096AbiA3UWS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Jan 2022 15:22:18 -0500
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475E6C06173D
        for <linux-i2c@vger.kernel.org>; Sun, 30 Jan 2022 12:22:15 -0800 (PST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 43C6C2C0DEB;
        Sun, 30 Jan 2022 20:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1643574130;
        bh=cXgs3kIReWQGiPdJOtk4A6fSrKCVrdDRva3qT1rhBl0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=IVVQTCiLOoKAQeZhqLOe2jbp0N3tiGUqLI9khPnmoJkf4WeGOSjok2lQqRsDyWNP2
         CUGfCJIotEqQ7uTxbj6Ter621uR4xD4MZPJZO6aIVVtCzJnL4S6wPyzNE8XpvyNDeb
         x0dNngAgpdeXYArO5y4Vfd4YmbIhFX98+cbTllmmAfs5wdQOFtAO+uaK1YblGtidZO
         7DYV8Nn+HQMYsqBzNTVOdViq7VlLv2Vc0sUksyYy82Mk3D6MuLiH+P3DMIhoYY9tFG
         U9Dyl5qyts1H5X6FXhDrNrR1K2DQp7pOF5cWSNXgo+K+JNJJJf/0vxdYfcTUFaYpAc
         zUESA1ShEVxQg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B61f6f3720000>; Mon, 31 Jan 2022 09:22:10 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 31 Jan 2022 09:22:09 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.028; Mon, 31 Jan 2022 09:22:09 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Rob Herring <robh@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: i2c: mpc: Make each example a separate entry
Thread-Topic: [PATCH] dt-bindings: i2c: mpc: Make each example a separate
 entry
Thread-Index: AQHYDNdFglSjQQxUYUi2lOg8u+CdK6x7On6A
Date:   Sun, 30 Jan 2022 20:22:09 +0000
Message-ID: <48c561a7-0882-a346-ea16-5d30ded38e67@alliedtelesis.co.nz>
References: <20220119015234.2436754-1-robh@kernel.org>
In-Reply-To: <20220119015234.2436754-1-robh@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4F9BBE2BC0BB94FBD3A83564B0E7292@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=H6WlPNQi c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=DghFqjY3_ZEA:10 a=VwQbUJbxAAAA:8 a=XWggxnBfiOUHEbBFxfIA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgUm9iLA0KDQpPbiAxOS8wMS8yMiAxNDo1MiwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEVhY2gg
aW5kZXBlbmRlbnQgZXhhbXBsZSBzaG91bGQgYmUgYSBzZXBhcmF0ZSBlbnRyeS4gVGhpcyBhbGxv
d3MgZm9yDQo+ICdpbnRlcnJ1cHRzJyB0byBoYXZlIGRpZmZlcmVudCBjZWxsIHNpemVzLg0KPg0K
PiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KUmV2aWV3ZWQt
Ynk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4g
LS0tDQo+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXBjLnlh
bWwgfCAyICsrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXBjLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tcGMueWFtbA0K
PiBpbmRleCA5OGM2ZmNmN2JmMjYuLjAxOGUxYjk0NDQyNCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXBjLnlhbWwNCj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXBjLnlhbWwNCj4gQEAgLTcz
LDYgKzczLDcgQEAgZXhhbXBsZXM6DQo+ICAgICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MTAw
MDAwPjsNCj4gICAgICAgfTsNCj4gICANCj4gKyAgLSB8DQo+ICAgICAgIC8qIE1QQzUyMDBCIGJh
c2VkIGJvYXJkICovDQo+ICAgICAgIGkyY0AzZDAwIHsNCj4gICAgICAgICAgICNhZGRyZXNzLWNl
bGxzID0gPDE+Ow0KPiBAQCAtODQsNiArODUsNyBAQCBleGFtcGxlczoNCj4gICAgICAgICAgIGZz
bCxwcmVzZXJ2ZS1jbG9ja2luZzsNCj4gICAgICAgfTsNCj4gICANCj4gKyAgLSB8DQo+ICAgICAg
IC8qIE1QQzg1NDQgYmFzZSBib2FyZCAqLw0KPiAgICAgICBpMmNAMzEwMCB7DQo+ICAgICAgICAg
ICAjYWRkcmVzcy1jZWxscyA9IDwxPjs=
