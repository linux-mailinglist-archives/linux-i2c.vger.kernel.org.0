Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D02B13469BD
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Mar 2021 21:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233244AbhCWUW3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 16:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233228AbhCWUWF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Mar 2021 16:22:05 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 550BEC061574
        for <linux-i2c@vger.kernel.org>; Tue, 23 Mar 2021 13:22:05 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4B6BA891AE;
        Wed, 24 Mar 2021 09:22:01 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1616530921;
        bh=BDIYsPirbtYm6xznZoyWhaO+s5HVKu9e1IdTPONNYXg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=PwRzreRDA4or+tEJnuWdOKwxx5F8OQipdM868RqJ/JFQI5iLjBfRjTRNfm74YKdj2
         NQK7E7wcEdSZ6ClqTEiCEqJ6STPqEISLwCo14iePXoOmi7w6Hlf/P1hhVeXTD5QRvm
         YegrZdRRXMdFE2/vcmGVibzmBJwdK72Vb0My71l+zMacl+52xEZMU/3ZljUgpONZWn
         yov+sqkDt3diwbIcKFnjKySAPKxPpgu5eosr52A8h58TMKRAlgQMuBkQXnAG0K+TMc
         55HpTj7RC64dbv3MzEWlVy6vo3jWet38rzqgl/4G71jFAz2ZDHa9LCZmuNPx7ByE2r
         fBRBz+e+8QA5A==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B605a4de90001>; Wed, 24 Mar 2021 09:22:01 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 24 Mar 2021 09:22:00 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Wed, 24 Mar 2021 09:22:00 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Rob Herring <robh@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: i2c: convert i2c-mpc to json-schema
Thread-Topic: [PATCH 2/6] dt-bindings: i2c: convert i2c-mpc to json-schema
Thread-Index: AQHXH5233LnDPck5U0iG88OvYj8e5KqRKb2AgAABdQA=
Date:   Tue, 23 Mar 2021 20:22:00 +0000
Message-ID: <f5e86696-07f1-f1d2-9596-af7fa6ae1cdd@alliedtelesis.co.nz>
References: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
 <20210323043331.21878-3-chris.packham@alliedtelesis.co.nz>
 <1616530607.398955.1244764.nullmailer@robh.at.kernel.org>
In-Reply-To: <1616530607.398955.1244764.nullmailer@robh.at.kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <CACD322AAEA783469DFBE409B6144F50@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=voM4FWlXAAAA:8 a=QcnDgq45NsFIHwn4wVcA:9 a=QEXdDO2ut3YA:10 a=IC2XNlieTeVoXbcui8wp:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgUm9iLA0KDQpPbiAyNC8wMy8yMSA5OjE2IGFtLCBSb2IgSGVycmluZyB3cm90ZToNCj4gT24g
VHVlLCAyMyBNYXIgMjAyMSAxNzozMzoyNyArMTMwMCwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4+
IENvbnZlcnQgaTJjLW1wYyB0byBZQU1MLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFBh
Y2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4+IC0tLQ0KPj4gICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW1wYy50eHQgICAgICAgfCA2MiAtLS0tLS0t
LS0tLS0NCj4+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tcGMueWFtbCAgICAg
IHwgOTkgKysrKysrKysrKysrKysrKysrKw0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDk5IGluc2Vy
dGlvbnMoKyksIDYyIGRlbGV0aW9ucygtKQ0KPj4gICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXBjLnR4dA0KPj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXBj
LnlhbWwNCj4+DQo+IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFrZSBkdF9iaW5kaW5n
X2NoZWNrJyBvbiB5b3VyIHBhdGNoOg0KPg0KPiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6DQo+
IC4vRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXBjLnlhbWw6MTk6
OTogW3dhcm5pbmddIHdyb25nIGluZGVudGF0aW9uOiBleHBlY3RlZCAxMCBidXQgZm91bmQgOCAo
aW5kZW50YXRpb24pDQo+IC4vRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9p
MmMtbXBjLnlhbWw6MjA6MTE6IFt3YXJuaW5nXSB3cm9uZyBpbmRlbnRhdGlvbjogZXhwZWN0ZWQg
MTIgYnV0IGZvdW5kIDEwIChpbmRlbnRhdGlvbikNCkhtbSBJIGRpZCBydW4gJ21ha2UgZHRfYmlu
ZGluZ19jaGVjaycgaXMgeWFtbGxpbnQgcnVuIHNlcGFyYXRlbHkgKG9yIG5vdCANCnJ1biBpZiBp
dCdzIG5vdCBpbnN0YWxsZWQ/KS4NCj4gZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoNCj4N
Cj4gU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvMTQ1NzA1Mw0KPg0KPiBU
aGlzIGNoZWNrIGNhbiBmYWlsIGlmIHRoZXJlIGFyZSBhbnkgZGVwZW5kZW5jaWVzLiBUaGUgYmFz
ZSBmb3IgYSBwYXRjaA0KPiBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBtb3N0IHJlY2VudCByYzEu
DQo+DQo+IElmIHlvdSBhbHJlYWR5IHJhbiAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBhbmQgZGlk
bid0IHNlZSB0aGUgYWJvdmUNCj4gZXJyb3IocyksIHRoZW4gbWFrZSBzdXJlICd5YW1sbGludCcg
aXMgaW5zdGFsbGVkIGFuZCBkdC1zY2hlbWEgaXMgdXAgdG8NCj4gZGF0ZToNCj4NCj4gcGlwMyBp
bnN0YWxsIGR0c2NoZW1hIC0tdXBncmFkZQ0KPg0KPiBQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1p
dC4NClNob3VsZCBiZSBlYXN5IHRvIGZpeCB0aGUgYmluZGluZyBidXQgSSdsbCBzcGVuZCBhIGJp
dCBvZiB0aW1lIHRyeWluZyB0byANCmdldCBteSB0b29saW5nIHNvcnRlZC4=
