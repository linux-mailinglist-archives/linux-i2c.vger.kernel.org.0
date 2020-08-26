Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E27F253A43
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Aug 2020 00:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgHZWbY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 18:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbgHZWbY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Aug 2020 18:31:24 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08ED6C061756
        for <linux-i2c@vger.kernel.org>; Wed, 26 Aug 2020 15:31:22 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B029B84488;
        Thu, 27 Aug 2020 10:31:19 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1598481079;
        bh=YHPoF+51bOdepTKWJCrdx4WL1wXTdNAnOkwJyDMBigA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=ZgC5LTsFP0rT45lvM9MbDWyFY7yJvpl3lBGsMQDJue70UF+iTCTO8MkAQYz45BL/z
         GHjBYp4NFEbn9z/T5hXU5dcW4mS4zqsilhFbAQLFft+x9cvL/j+T0h2DjN80uABPMu
         pozDy0ytPUpiVD+yLCM4ckUg/7VSRCqs5fcc+DTv6R1e4FgxGrMUJuRNgb+myX1lmY
         0TbPK01vzfMF9Lj4XdcnZI2fdBV4X0bbvo28v1YXMQwfXZhyR2HZfbHcaHTLi2vhnw
         aCTwngJpOs+61znnQXLV7oMruz0Alca4bvKvsjRsZLNF8fysrzEyZqDQITD1SSTFh2
         l7FhH2YKO+Htg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f46e2b80000>; Thu, 27 Aug 2020 10:31:20 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 Aug 2020 10:31:17 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Thu, 27 Aug 2020 10:31:17 +1200
From:   Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>
To:     "wsa@kernel.org" <wsa@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: mv64xxx: Add bus error recovery
Thread-Topic: [PATCH v2] i2c: mv64xxx: Add bus error recovery
Thread-Index: AQHWemlTTDgULukltE+nyDPgUsKP9alHxY+AgAJtrAA=
Date:   Wed, 26 Aug 2020 22:31:16 +0000
Message-ID: <cc85a29ff0392811e2a79567eb849c12de7adb8f.camel@alliedtelesis.co.nz>
References: <20200824225254.1114-1-mark.tomlinson@alliedtelesis.co.nz>
         <20200825092613.GJ1861@ninjato>
In-Reply-To: <20200825092613.GJ1861@ninjato>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:23:892c:c4d4:ea5c:aa4e]
Content-Type: text/plain; charset="utf-8"
Content-ID: <403509DF2EBEE24BBC785EF5DAD030C7@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gVHVlLCAyMDIwLTA4LTI1IGF0IDExOjI2ICswMjAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+
IE9uIFR1ZSwgQXVnIDI1LCAyMDIwIGF0IDEwOjUyOjU0QU0gKzEyMDAsIE1hcmsgVG9tbGluc29u
IHdyb3RlOg0KPiANCj4gVGhpcyBhZGRzIGkyYyBidXMgcmVjb3ZlcnkgdG8gdGhlIG12NjR4eHgg
ZHJpdmVyLg0KPiANCj4gSW1wbGVtZW50IGJ1cyByZWNvdmVyeSB0byByZWNvdmVyIGZyb20gU0NM
L1NEQSBzdHVjayBsb3cuDQo+IA0KPiBUaGlzIHVzZXMgdGhlIGdlbmVyaWMgcmVjb3ZlcnkgZnVu
Y3Rpb24sIHNldHRpbmcgdGhlIGNsb2NrL2RhdGEgbGluZXMgYXMNCj4gR1BJTyBwaW5zLCBhbmQg
c2VuZGluZyA5IGNsb2NrcyB0byB0cnkgYW5kIHJlY292ZXIgdGhlIGJ1cy4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IE1hcmsgVG9tbGluc29uIDxtYXJrLnRvbWxpbnNvbkBhbGxpZWR0ZWxlc2lzLmNv
Lm56Pg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2MjoNCj4gIC0gdXNlIGdlbmVyaWMgR1BJTyByZWNv
dmVyeSBmdW5jdGlvbi4NCj4gDQo+IFRoYW5rIHlvdSBmb3IgZG9pbmcgdGhhdCEgR2xhZCB0byBz
ZWUgdGhlIG5ldyBoZWxwZXIgZnVuY3Rpb24gd29ya3MgZm9yDQo+IHlvdSBhcyB3ZWxsLiBUaGUg
aW5pdGlhbGl6YXRpb24gY29kZSBpcyBhbGwgd2VsbCwgYnV0IEkgd29uZGVyIGFib3V0IHRoZQ0K
PiB1c2Ugb2YgaTJjX3JlY292ZXJfYnVzKCkuIFJlY292ZXJ5IHNob3VsZCBiZSB0cmllZCBvbmx5
IGlmIGl0IGlzDQo+IGRldGVjdGVkIHRoYXQgU0RBIGlzIHB1bGxlZCBsb3cgd2hlbiB0aGUgYnVz
IHNob3VsZCBiZSBmcmVlLiBTbywgeW91DQo+IHNob3VsZG4ndCBjYWxsIGkyY19yZWNvdmVyX2J1
cygpIGluIHVuY29uZGl0aW9uYWxseSBpbiBwcm9iZSgpLiBDYW4geW91cg0KPiBIVyBkZXRlY3Qg
aWYgU0RBIGlzIHN0dWNrIGxvdz8NCg0KV2UgYWN0dWFsbHkgZG9uJ3QgbmVlZCB0aGlzIGNhbGws
IGFzIHRoZSBib290bG9hZGVyIGNoZWNrcyBhbmQgbGVhdmVzIHRoZQ0KYnVzIGluIGEgZ29vZCBz
dGF0ZS4gSSB3aWxsIHJlbW92ZSB0aGlzIGZyb20gdGhlIHBhdGNoLg0KDQo=
