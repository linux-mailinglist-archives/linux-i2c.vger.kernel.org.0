Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C80B79C19A
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Sep 2023 03:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235040AbjILBYY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Sep 2023 21:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235063AbjILBYD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Sep 2023 21:24:03 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5ADD13AE0
        for <linux-i2c@vger.kernel.org>; Mon, 11 Sep 2023 17:29:35 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0C7AE2C053B;
        Tue, 12 Sep 2023 12:28:04 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1694478484;
        bh=4BnR2/Pe4zsWpCGRueYCt2ZABjHfH4H2LohJTDmVp5I=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=EmWKdC8+IVuejVGdtMgZG1CuLRnfXuZi+kOX/RpOxGi1JqwaUSWnTQzvIGtrtpNNL
         aCWtUVNAX3WnpbYUKqNijFZi3Iwo8PJFK3NllGKathFTALtJtZYzblfM+6A1NE7Avd
         M5qEutgujceigD3J75rcfaLaGtQ/wfVoFqXM8YAZ/jC+5HzNt0NmlAVPrKTF5Ac3+A
         r+f54q4OLDBShD/1qd9odVJUPm8Uj06WMkn3APqASUFX2xicYrDkCw7YPdmqp8MLdQ
         eMZLvPnPgQ/uZUbb4cQpHPkbwBc220CvDFyMwMLmMPLee5YPiTYstY6uonP3HMHptG
         IDGgq9MBIUYKQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B64ffb0930000>; Tue, 12 Sep 2023 12:28:03 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.37; Tue, 12 Sep 2023 12:28:03 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Tue, 12 Sep 2023 12:28:03 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.037; Tue, 12 Sep 2023 12:28:03 +1200
From:   Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>
To:     "andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC:     Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c:octeon:Add block-mode r/w
Thread-Topic: [PATCH] i2c:octeon:Add block-mode r/w
Thread-Index: AQHZr5q3r2c2MLptDkmOgF4YLLXmVq/KZ7iAgCKcq4CAG5lIAIACRR2AgAC6nQCAClo2gA==
Date:   Tue, 12 Sep 2023 00:28:03 +0000
Message-ID: <29186bdd021eae1ed6a0b92af7213db23b7b6f06.camel@alliedtelesis.co.nz>
References: <20230903123446.vjgpplnogejbzneb@zenone.zhora.eu>
         <20230904231439.485925-1-aryan.srivastava@alliedtelesis.co.nz>
         <20230905102234.nlaeskxbbvu74co2@zenone.zhora.eu>
In-Reply-To: <20230905102234.nlaeskxbbvu74co2@zenone.zhora.eu>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.26]
Content-Type: text/plain; charset="utf-8"
Content-ID: <703BA02D23F4D84AB6E00CB5F2E20982@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=fYfTNHYF c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=JMFsQdWQCw4A:10 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=ukSZkMMagyX6BzUICnMA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGksIEFuZGksDQoNCk9uIFR1ZSwgMjAyMy0wOS0wNSBhdCAxMjoyMiArMDIwMCwgQW5kaSBTaHl0
aSB3cm90ZToNCj4gSGkgQXJ5YW4sDQo+IA0KPiBJbiB0aGUgdGl0bGUsIHBsZWFzZSBsZWF2ZSBh
IHNwYWNlIGFmdGVyIHRoZSAnOicNCj4gDQo+ICAgIGkyYzogb2N0ZW9uOiBBZGQgYmxvY2stbW9k
ZSByL3cNCj4gDQo+IFBsZWFzZSBjaGVjayB3aXRoICJnaXQgbG9nIGRyaXZlcnMuLi4iIHRvIHNl
ZSB3aGF0J3MgdGhlIHJ1bGUgaW4NCj4gYSBwYXJ0aWN1bGFyIGNvbW11bml0eS4NCj4gDQo+IEkg
Z3Vlc3MgV29sZnJhbSBjYW4gZml4IHRoaXMsIHRob3VnaCwgYmVmb3JlIHB1c2hpbmcuDQo+IA0K
PiBbLi4uXQ0KPiANCkRvbmUNCg0KPiA+ICsvKiBoaWdoLWxldmVsLWNvbnRyb2xsZXIgY29tcG9z
aXRlIGJsb2NrIHdyaXRlK3JlYWQsIG1zZzA9YWRkciwNCj4gPiBtc2cxPWRhdGEgKi8NCj4gDQo+
IEkgdGhpbmsgdGhpcyBjb21tZW50IGlzIGZpbmUgYW5kIGdyZWF0IHRvIGhhdmUgaXQsIGJ1dCBp
dCdzDQo+IG1pc3NpbmcgYSBiaXQgb2YgY2xhcml0eSwgY2FuIHlvdSBwbGVhc2UgZXhwYW5kIHRo
ZSBjb25jZXB0Pw0KPiANCkRvbmUsIGxldCBtZSBrbm93IGlmIHlvdSB3YW50IG1lIHRvIGFkZCBt
b3JlIGhlcmUuDQoNCj4gPiArc3RhdGljIGludCBvY3Rlb25faTJjX2hsY19ibG9ja19jb21wX3Jl
YWQoc3RydWN0IG9jdGVvbl9pMmMgKmkyYywNCj4gPiBzdHJ1Y3QgaTJjX21zZyAqbXNncykNCj4g
PiArew0KPiA+ICsJaW50IGksIGosIGxlbiwgcmV0ID0gMDsNCj4gPiArCXU2NCBjbWQgPSAwLCBy
ZCA9IDA7DQo+IA0KPiBjYW4gcGxlYXNlIHlvdSBtb3ZlIHJkLCBqIGluc2lkZSB0aGUgZm9yIGxv
b3A/IFRoZSBiYXNpYyBjb21tb24NCj4gc2Vuc2UgaXMgdG8gaGF2ZSBhbGwgdmFyaWFibGUgZGVj
bGFyZWQgaW4gdGhlIGlubmVybW9zdCBzZWN0aW9uDQo+IGluIG9yZGVyIHRvIGF2b2lkIGNvbmZ1
c2lvbi4NCj4gDQo+IEl0J3MgYSBuaXRwaWNrIHRob3VnaCwgbm90IGEgc3Ryb25nIGNvbW1lbnQg
YW5kLCBhZmFpaywgbm90IGENCj4gcmVhbCBydWxlLg0KPiANCj4gU2FtZSBjb21tZW50IGZvciB0
aGUgZnVuY3Rpb24gYmVsb3cuDQo+IA0KRG9uZSwgSSBhZ3JlZSB0aGV5IHNob3VsZCBiZSBkZWZp
bmVkIHdpdGhpbiBsb29wLiBJIHdhcyBqdXN0IHRyeWluZyB0bw0KbWF0Y2ggdGhlIG90aGVyIGhs
YyByL3cuDQoNCj4gPiArDQo+ID4gKwlvY3Rlb25faTJjX2hsY19lbmFibGUoaTJjKTsNCj4gPiAr
CW9jdGVvbl9pMmNfYmxvY2tfZW5hYmxlKGkyYyk7DQo+ID4gKw0KPiA+ICsJLyogV3JpdGUgKHNp
emUgLSAxKSBpbnRvIGJsb2NrIGNvbnRyb2wgcmVnaXN0ZXIgKi8NCj4gPiArCWxlbiA9IG1zZ3Nb
MV0ubGVuIC0gMTsNCj4gPiArCW9jdGVvbl9pMmNfd3JpdGVxX2ZsdXNoKCh1NjQpKGxlbiksIGky
Yy0+dHdzaV9iYXNlICsNCj4gPiBUV1NJX0JMT0NLX0NUTChpMmMpKTsNCj4gPiArDQo+ID4gKwkv
KiBQcmVwYXJlIGNvcmUgY29tbWFuZCAqLw0KPiA+ICsJY21kID0gU1dfVFdTSV9WIHwgU1dfVFdT
SV9SIHwgU1dfVFdTSV9TT1ZSOw0KPiA+ICsJY21kIHw9ICh1NjQpKG1zZ3NbMF0uYWRkciAmIDB4
N2Z1bGwpIDw8IFNXX1RXU0lfQUREUl9TSElGVDsNCj4gPiArDQo+ID4gKwlpZiAobXNnc1swXS5m
bGFncyAmIEkyQ19NX1RFTikNCj4gPiArCQljbWQgfD0gU1dfVFdTSV9PUF8xMF9JQTsNCj4gPiAr
CWVsc2UNCj4gPiArCQljbWQgfD0gU1dfVFdTSV9PUF83X0lBOw0KPiA+ICtObywgYnV0IHRoaXMg
ZG9lc250IHJlYWxseSBtYXR0ZXIgYXMgdGhlIGludGVybmFsIGogbG9vcCB3aWxsIHRha2UNCj4g
PiBjYXJlIG9mIHRoZSByZW1haW5pbmcgYnl0ZXMuDQo+ID4gDQo+ID4gZS5nLiBpZiB0aGUgbGVu
IGlzIDksIHRoZW4gd2Ugd2lsbCBkbw0KPiA+IDAtNyBpbiB0aGUgZmlyc3QsIHRoZW4gaSA9IDgs
IHdoaWNoIGlzIDwgbGVuLCBhbmQgdGhlbiB0aGUgaW50ZXJuYWwNCj4gPiBsb29wIHdpbGwgZG8g
OC0xNy4NCj4gPiArCWlmIChtc2dzWzBdLmxlbiA9PSAyKSB7DQo+ID4gKwkJdTY0IGV4dCA9IDA7
DQo+ID4gKw0KPiA+ICsJCWNtZCB8PSBTV19UV1NJX0VJQTsNCj4gPiArCQlleHQgPSAodTY0KW1z
Z3NbMF0uYnVmWzBdIDw8IFNXX1RXU0lfSUFfU0hJRlQ7DQo+ID4gKwkJY21kIHw9ICh1NjQpbXNn
c1swXS5idWZbMV0gPDwgU1dfVFdTSV9JQV9TSElGVDsNCj4gPiArCQlvY3Rlb25faTJjX3dyaXRl
cV9mbHVzaChleHQsIGkyYy0+dHdzaV9iYXNlICsNCj4gPiBTV19UV1NJX0VYVChpMmMpKTsNCj4g
PiArCX0gZWxzZSB7DQo+ID4gKwkJY21kIHw9ICh1NjQpbXNnc1swXS5idWZbMF0gPDwgU1dfVFdT
SV9JQV9TSElGVDsNCj4gPiArCX0NCj4gDQo+IFRoaXMgZmlyc3QgcGFydCBpcyBiYXNpY2FsbHkg
YSBjb3B5L3Bhc3RlIHdpdGggdGhlIHdyaXRlKCkNCj4gZnVuY3Rpb24uLi4gY2FuIHdlIHB1dCB0
aGVtIHRvZ2V0aGVyIGluIGEgY29tbW9uIGZ1bmN0aW9uPw0KPiANCj4gQ2FuIHdlIHB1dCBhcyBt
dWNoIGFzIHdlIGNhbiBpbiBhIHNpbmdsZSBmdW5jdGlvbj8NCj4gDQpEb25lLiBDb3VsZCBub3Qg
bWFrZSBhIGNvbW1vbiBmb3IgdGhlIHdyaXRlK3dyaXRlcywgYXMgdGhleSB3YXkgd2UNCmluc2Vy
dCBkYXRhIGludG8gYnVmZmVycyBmb3Igd3JpdGluZyBhcmUgc2lnbmlmaWNhbnRseSBkaWZmZXJl
bnQsDQphbmQgZG9uJ3Qgb2NjdXIgYWZ0ZXIgdGhlIGNvcmUgY29tbWFuZCBzZW5kIChpLmUuIHRo
ZSBjb3JlIGNvbW1hbmQgaXMNCnNlbnQgd2l0aC9jb25jdXJyZW50bHkgd2l0aCB0aGUgd3JpdGUg
ZGF0YSkuIFVubGlrZSB0aGUgcmVhZCwgd2hpY2gNCnNlbmRzIGFsbW9zdCBpZGVudGljYWwgY29y
ZSBjb21tYW5kcyBhbmQgcmVhZHMgdGhlIGJ1ZmZlciBkaWZmZXJlbnRseQ0KYWZ0ZXJ3YXJkcy4g
VGhvdWdoIGlmIHdvdWxkIGxpa2UgaXQgSSBjb3VsZCBtYW5nbGUgdG9nZXRoZXIgYSBmdW5jdGlv
bg0KZm9yIHRoZXNlIGFzIHdlbGwuDQoNCj4gPiArCS8qIFNlbmQgY29tbWFuZCB0byBjb3JlIChz
ZW5kIGRhdGEgdG8gRklGTykgKi8NCj4gPiArCW9jdGVvbl9pMmNfaGxjX2ludF9jbGVhcihpMmMp
Ow0KPiA+ICsJb2N0ZW9uX2kyY193cml0ZXFfZmx1c2goY21kLCBpMmMtPnR3c2lfYmFzZSArIFNX
X1RXU0koaTJjKSk7DQo+ID4gKw0KPiA+ICsJLyogV2FpdCBmb3IgdHJhbnNhY3Rpb24gdG8gY29t
cGxldGUgKi8NCj4gPiArCXJldCA9IG9jdGVvbl9pMmNfaGxjX3dhaXQoaTJjKTsNCj4gPiArCWlm
IChyZXQpDQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKwljbWQgPSBfX3Jhd19yZWFk
cShpMmMtPnR3c2lfYmFzZSArIFNXX1RXU0koaTJjKSk7DQo+ID4gKwlpZiAoKGNtZCAmIFNXX1RX
U0lfUikgPT0gMCkNCj4gPiArCQlyZXR1cm4gb2N0ZW9uX2kyY19jaGVja19zdGF0dXMoaTJjLCBm
YWxzZSk7DQo+ID4gKw0KPiA+ICsJLyogcmVhZCBkYXRhIGluIEZJRk8gKi8NCj4gPiArCW9jdGVv
bl9pMmNfd3JpdGVxX2ZsdXNoKFRXU0lfQkxPQ0tfU1RTX1JFU0VUX1BUUiwgaTJjLQ0KPiA+ID50
d3NpX2Jhc2UgKyBUV1NJX0JMT0NLX1NUUyhpMmMpKTsNCj4gPiArCWZvciAoaSA9IDA7IGkgPCBs
ZW47IGkgKz0gOCkgew0KPiA+ICsJCXJkID0gX19yYXdfcmVhZHEoaTJjLT50d3NpX2Jhc2UgKw0K
PiA+IFRXU0lfQkxPQ0tfRklGTyhpMmMpKTsNCj4gPiArCQlmb3IgKGogPSA3OyBqID49IDA7IGot
LSkNCj4gDQo+IGlzIGxlbiBhbHdheXMgYSBtdWx0aXBsZSBvZiA4Pw0KPiANCj4gPiArCQkJbXNn
c1sxXS5idWZbaSArICg3IC0gaildID0gKHJkID4+ICg4ICogaikpICYNCj4gPiAweGZmOw0KPiA+
ICsJfQ0KPiA+ICsNCj4gPiArCW9jdGVvbl9pMmNfYmxvY2tfZGlzYWJsZShpMmMpOw0KPiA+ICsJ
cmV0dXJuIHJldDsNCj4gPiArfQ0KPiANCj4gWy4uLl0NCg0KTm8sIGJ1dCB0aGlzIGRvZXNudCBy
ZWFsbHkgbWF0dGVyIGFzIHRoZSBpbnRlcm5hbCBqIGxvb3Agd2lsbCB0YWtlIGNhcmUNCm9mIHRo
ZSByZW1haW5pbmcgYnl0ZXMuDQoNCmUuZy4gaWYgdGhlIGxlbiBpcyA5LCB0aGVuIHdlIHdpbGwg
ZG8NCjAtNyBpbiB0aGUgZmlyc3QsIHRoZW4gaSA9IDgsIHdoaWNoIGlzIDwgbGVuLCBhbmQgdGhl
biB0aGUgaW50ZXJuYWwNCmxvb3Agd2lsbCBkbyA4LTE3Lg0KPiANCj4gPiAtCQkgICAgbXNnc1sx
XS5sZW4gPiAwICYmIG1zZ3NbMV0ubGVuIDw9IDggJiYNCj4gPiArCQkgICAgbXNnc1sxXS5sZW4g
PiAwICYmDQo+ID4gIAkJICAgIG1zZ3NbMF0uYWRkciA9PSBtc2dzWzFdLmFkZHIpIHsNCj4gPiAt
CQkJaWYgKG1zZ3NbMV0uZmxhZ3MgJiBJMkNfTV9SRCkNCj4gPiAtCQkJCXJldCA9IG9jdGVvbl9p
MmNfaGxjX2NvbXBfcmVhZChpMmMsDQo+ID4gbXNncyk7DQo+ID4gLQkJCWVsc2UNCj4gPiAtCQkJ
CXJldCA9IG9jdGVvbl9pMmNfaGxjX2NvbXBfd3JpdGUoaTJjLA0KPiA+IG1zZ3MpOw0KPiA+IC0J
CQlnb3RvIG91dDsNCj4gPiArCQkJaWYgKG1zZ3NbMV0ubGVuIDw9IDgpIHsNCj4gPiArCQkJCWlm
IChtc2dzWzFdLmZsYWdzICYgSTJDX01fUkQpDQo+ID4gKwkJCQkJcmV0ID0NCj4gPiBvY3Rlb25f
aTJjX2hsY19jb21wX3JlYWQoaTJjLCBtc2dzKTsNCj4gPiArCQkJCWVsc2UNCj4gPiArCQkJCQly
ZXQgPQ0KPiA+IG9jdGVvbl9pMmNfaGxjX2NvbXBfd3JpdGUoaTJjLCBtc2dzKTsNCj4gPiArCQkJ
CWdvdG8gb3V0Ow0KPiA+ICsJCQl9IGVsc2UgaWYgKG1zZ3NbMV0ubGVuIDw9IDEwMjQgJiYNCj4g
PiBUV1NJX0JMT0NLX0NUTChpMmMpKSB7DQo+ID4gKwkJCQlpZiAobXNnc1sxXS5mbGFncyAmIEky
Q19NX1JEKQ0KPiA+ICsJCQkJCXJldCA9DQo+ID4gb2N0ZW9uX2kyY19obGNfYmxvY2tfY29tcF9y
ZWFkKGkyYywgbXNncyk7DQo+ID4gKwkJCQllbHNlDQo+ID4gKwkJCQkJcmV0ID0NCj4gPiBvY3Rl
b25faTJjX2hsY19ibG9ja19jb21wX3dyaXRlKGkyYywgbXNncyk7DQo+ID4gKwkJCQlnb3RvIG91
dDsNCj4gPiArCQkJfQ0KPiANCj4gdGhlIHJlc3QgbG9va3MgZ29vZC4uLg0KPiANCj4gVGhhbmtz
LA0KPiBBbmRpDQoNClRoYW5rcywNCkFyeWFuDQo=
