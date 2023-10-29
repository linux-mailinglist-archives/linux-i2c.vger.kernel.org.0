Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E28F27DAE5C
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Oct 2023 22:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbjJ2VCi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 29 Oct 2023 17:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjJ2VCh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 29 Oct 2023 17:02:37 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB7FBC
        for <linux-i2c@vger.kernel.org>; Sun, 29 Oct 2023 14:02:34 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 08B9C2C04A8;
        Mon, 30 Oct 2023 10:02:32 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1698613352;
        bh=B09d4lIdDANJfUjjq7WALyCU4zBVl2nQ2e3xFu+mesQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=1+E71eghvObYnW8IgIPprH0EwPuRbQrQFdc4HWOQYrKE/8GweBzEOevYnp9iRiMLC
         AfeUfqjwbc86l0EXMChCT3bkwNtbcbPUZzuqFr5eKu5T5dx0JB9hugheb/dKxyqC5y
         wy+vmlShMksYrLTSv8z4W9Lq5QJ1h67wxvMvO8krcOnmvC8GDNeUdpEOrJ33reVonL
         48xY9s//UsykhI76PtFmhEnW2Mdy8akVMgRG/HAaeu0e6FWKWhILZVUwD+wCnj+bON
         QJ9yehtZLkY9nDEmWbMhDnKSs31gr6l4o0DNZPR5wIk1hNXytaNXnh4AF4MI5KsBDc
         o1UIMNGKqxZog==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B653ec8670001>; Mon, 30 Oct 2023 10:02:31 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 30 Oct 2023 10:02:31 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.039; Mon, 30 Oct 2023 10:02:31 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] i2c: mv64xxx: add an optional bus-reset-gpios
 property
Thread-Topic: [PATCH v5 2/2] i2c: mv64xxx: add an optional bus-reset-gpios
 property
Thread-Index: AQHaCIYGLKsizTKN0UyQHbkVO99aL7BcpjeAgAACoICAABXxgIADrLSA
Date:   Sun, 29 Oct 2023 21:02:31 +0000
Message-ID: <8ffbd670-52c5-4344-9119-d7e55367092b@alliedtelesis.co.nz>
References: <20231027033104.1348921-1-chris.packham@alliedtelesis.co.nz>
 <20231027033104.1348921-3-chris.packham@alliedtelesis.co.nz>
 <65911ec0-e073-435f-846a-c5501dd5d3a9@linaro.org>
 <9eebec9b-e6fd-4a22-89ea-b434f446e061@linaro.org>
 <20231027125537.5d5cu3wc4r4c2yb4@zenone.zhora.eu>
In-Reply-To: <20231027125537.5d5cu3wc4r4c2yb4@zenone.zhora.eu>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <68B8A453696C744C9B89AAD75D34DE72@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=62ntRvTiAAAA:8 a=g14jhrGyAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=W1AI2-169aiEXg90ZX8A:9 a=QEXdDO2ut3YA:10 a=pToNdpNmrtiFLRE6bQ9Z:22 a=P511sJaWzJIkUf5biGsp:22 a=AjGcO6oz07-iQ99wixmX:22 a=cvBusfyB2V15izCimMoJ:22
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAyOC8xMC8yMyAwMTo1NSwgQW5kaSBTaHl0aSB3cm90ZToNCj4gSGkgS3J6eXN6dG9mLA0K
Pg0KPiBPbiBGcmksIE9jdCAyNywgMjAyMyBhdCAwMTozNzowNVBNICswMjAwLCBLcnp5c3p0b2Yg
S296bG93c2tpIHdyb3RlOg0KPj4gT24gMjcvMTAvMjAyMyAxMzoyNywgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToNCj4+PiBPbiAyNy8xMC8yMDIzIDA1OjMxLCBDaHJpcyBQYWNraGFtIHdyb3Rl
Og0KPj4+PiBTb21lIGhhcmR3YXJlIGRlc2lnbnMgaGF2ZSBhIEdQSU8gdXNlZCB0byBjb250cm9s
IHRoZSByZXNldCBvZiBhbGwgdGhlDQo+Pj4+IGRldmljZXMgb24gYW5kIEkyQyBidXMuIEl0J3Mg
bm90IHBvc3NpYmxlIGZvciBldmVyeSBjaGlsZCBub2RlIHRvDQo+Pj4+IGRlY2xhcmUgYSByZXNl
dC1ncGlvcyBwcm9wZXJ0eSBhcyBvbmx5IHRoZSBmaXJzdCBkZXZpY2UgcHJvYmVkIHdvdWxkIGJl
DQo+Pj4+IGFibGUgdG8gc3VjY2Vzc2Z1bGx5IHJlcXVlc3QgaXQgKHRoZSBvdGhlcnMgd2lsbCBn
ZXQgLUVCVVNZKS4gUmVwcmVzZW50DQo+PiBDYzogTWFyaywNCj4+DQo+PiBBbHNvIHRoaXMgcGFy
dCBpcyBub3QgdHJ1ZS4gSWYgdGhlIGJ1cyBpcyBub24tZGlzY292ZXJhYmxlLCB0aGVuIGl0IGlz
DQo+PiBwb3NzaWJsZSB0byBoYXZlIHJlc2V0LWdwaW9zIGluIGVhY2ggcHJvYmVkIGRldmljZS4g
WW91IGNhbiBzaGFyZSBHUElPcywNCj4+IHNvIG5vIHByb2JsZW0gd2l0aCAtRUJVU1kgYXQgYWxs
Lg0KPj4NCj4+IFRoZSBwcm9ibGVtIGlzIGRvaW5nIHJlc2V0Og0KPj4gMS4gaW4gcHJvcGVyIG1v
bWVudCBmb3IgYWxsIGRldmljZXMNCj4+IDIuIHdpdGhvdXQgYWZmZWN0aW5nIG90aGVyIGRldmlj
ZXMgd2hlbiBvbmUgdW5iaW5kcy9yZW1vdmUoKQ0KPiB5ZXMsIEkgdGhvdWdodCB0aGF0IHdlIGNv
dWxkIGdldCB0byB0aGlzIHBvaW50LCBidXQgSSBkaWQgbm90DQo+IG9iamVjdCB0aGUgcGF0Y2gg
YXMgSSBkaWRuJ3Qgc2VlIGFuIGltbWVkaWF0ZSBiZXR0ZXIgc29sdXRpb24uIEkNCj4gd291bGQg
c3RpbGwgYmUgT0sgdG8gbWVyZ2UgaXQgdW50aWwgd2UgZGV2ZWxvcCBzb21ldGhpbmcgYmV0dGVy
Lg0KPg0KPiBMZXQgbWUgbXVsbCB0aGlzIG92ZXIgYW5kIHdpbGwgYmUgYmFjayB0byB0aGUgdG9w
aWMuDQoNCklmIHdlJ3JlIGhhcHB5IHdpdGggcGxhaW4gR1BJT3MgSSBjYW4gbW92ZSB3aGF0IEkn
dmUgZG9uZSBzbyBmYXIgdG8gDQpzb21ld2hlcmUgaW4gdGhlIEkyQyBjb3JlLiBJIGtub3cgd2Un
dmUgZ290IG90aGVyIGhhcmR3YXJlIGRlc2lnbnMgd2l0aCANCmRpZmZlcmVudCBjb250cm9sbGVy
cyB0aGF0IGFsc28gaGF2ZSBtdXhlcyBjb25uZWN0ZWQgdG8gYSBjb21tb24gcmVzZXQgDQpHUElP
IHNvIEkgd291bGQgaGF2ZSBlbmRlZCB1cCBtb3ZpbmcgdGhpcyBjb2RlIHRvIEkyQyBjb3JlIGV2
ZW50dWFsbHkuDQoNCklmIHdlJ3JlIHRhbGtpbmcgYSBwcm9wZXIgcmVzZXQgZHJpdmVyIGltcGxl
bWVudGVkIHVzaW5nIEdQSU9zIHRoZW4gdGhhdCANCm1pZ2h0IGJlIGEgYml0IG9mIGJpZ2dlciB0
YXNrLg0KDQo+IFRoYW5rcywgS3J6eXN6dG9mIQ0KPiBBbmRpDQo+DQo+PiBUaGUgKDIpIGFib3Zl
IGlzIG5vdCBzb2x2ZWFibGUgZWFzeSBpbiBrZXJuZWwgYW5kIHdlIGFscmVhZHkgaGFkIG5pY2UN
Cj4+IHRhbGtzIGFib3V0IGl0IGp1c3QgZmV3IGRheXMgYWdvOg0KPj4gMS4gQXBwbGUgY2FzZToN
Cj4+IGh0dHBzOi8vc2Nhbm1haWwudHJ1c3R3YXZlLmNvbS8/Yz0yMDk4OCZkPTFMTzc1UjJucmUx
TFAzVHlFV01ZZzFJczRNei1ZUk9QUThKeHNKcXdrZyZ1PWh0dHBzJTNhJTJmJTJmc29jaWFsJTJl
dHJlZWhvdXNlJTJlc3lzdGVtcyUyZiU0MG1hcmNhbiUyZjExMTI2ODc4MDMxMTYzNDE2MA0KPj4N
Cj4+IDIuIG15IFdTQTg4NHg6DQo+PiBodHRwczovL3NjYW5tYWlsLnRydXN0d2F2ZS5jb20vP2M9
MjA5ODgmZD0xTE83NVIybnJlMUxQM1R5RVdNWWcxSXM0TXotWVJPUFE4SXZ0TWZoeVEmdT1odHRw
cyUzYSUyZiUyZmxvcmUlMmVrZXJuZWwlMmVvcmclMmZhbHNhLWRldmVsJTJmODRmOWYxYzQtMDYy
Ny00OTg2LTgxNjAtYjRhYjk5NDY5YjgxJTQwbGluYXJvJTJlb3JnJTJmDQo+Pg0KPj4gTGFzdCwN
Cj4+IEkgd291bGQgbGlrZSB0byBhcG9sb2dpemUgdG8geW91IENocmlzLiBJIHVuZGVyc3RhbmQg
dGhhdCBicmluZ2luZyBzdWNoDQo+PiBmZWVkYmFjayBhdCB2NSBpcyBub3QgdGhhdCBnb29kLiBJ
IGhhZCBwbGVudHkgb2YgdGltZSB0byBzYXkgc29tZXRoaW5nDQo+PiBlYXJsaWVyLCBzbyB0aGlz
IGlzIG5vdCByZWFsbHkgcHJvZmVzc2lvbmFsIGZyb20gbXkgc2lkZS4gSSBhbSBzb3JyeSwNCj4+
IGp1c3QgbXkgYnJhaW4gZGlkIG5vdCBjb25uZWN0IGFsbCB0aGVzZSB0b3BpY3MgdG9nZXRoZXIu
DQo+Pg0KPj4gSSBhcG9sb2dpemUuDQo+Pg0KPj4gQmVzdCByZWdhcmRzLA0KPj4gS3J6eXN6dG9m
