Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E55AF6B6D35
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 02:53:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbjCMBxN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 21:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjCMBxM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 21:53:12 -0400
X-Greylist: delayed 21445 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 12 Mar 2023 18:53:08 PDT
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D4710412
        for <linux-i2c@vger.kernel.org>; Sun, 12 Mar 2023 18:53:06 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D3B132C04A0;
        Mon, 13 Mar 2023 14:53:03 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1678672383;
        bh=kmx8IMF7L9WBplpGyVKjCFprafkQYV4d9TQsg8LDb+U=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=ZRRk9iu2qRTu3pRbW9E29ARCT1DZUZDnhW8/b4tC6AkpmwsY2w784h88oN6IC3Wne
         e+ZBROv2zYXBK1vg1cKpCMsjCTVidL2wk1Kpgco2x7fMOlDcusrjf6ymxzwqNXJzk0
         qintyaOKaAh0GBSy9K/hEeaQmkscxGcnCfNvjWTVWFWAeNy/p1dX+xuKr6z4nlNfCC
         ivXym6B5RETCGQ3xLySb9OPKk7DcmXyePmbqkrcqLftq7pYATHg3RgiOasoZtZzpmu
         /B2dm1PAYd0X4J/piddEvd+wepIIl4S/wMg5SphjbaaDbaYSNvAibT7/IdjRSX/sIq
         x1u09OemG/r5Q==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B640e81ff0001>; Mon, 13 Mar 2023 14:53:03 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.47; Mon, 13 Mar 2023 14:53:03 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.047; Mon, 13 Mar 2023 14:53:03 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v3 2/3] i2c: mpc: Use of_property_read_u32 instead of
 of_get_property
Thread-Topic: [PATCH v3 2/3] i2c: mpc: Use of_property_read_u32 instead of
 of_get_property
Thread-Index: AQHZVTuGS7MPAPRYVUGq/EDVWl6Itq73GLEA
Date:   Mon, 13 Mar 2023 01:53:02 +0000
Message-ID: <4ef22309-5033-f5da-9080-acb46f907b9e@alliedtelesis.co.nz>
References: <20230312233613.303408-1-andi.shyti@kernel.org>
 <20230312233613.303408-3-andi.shyti@kernel.org>
In-Reply-To: <20230312233613.303408-3-andi.shyti@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8DCCEE88454104486B66E1F46C7F03D@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GdlpYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=k__wU0fu6RkA:10 a=VwQbUJbxAAAA:8 a=3OfLPlVfzznAoFkny0UA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAxMy8wMy8yMyAxMjozNiwgQW5kaSBTaHl0aSB3cm90ZToNCj4gIm9mX3Byb3BlcnR5X3Jl
YWRfdTMyKCkiIGlzIHByZWZlcnJlZCB0byAib2ZfZ2V0X3Byb3BlcnR5KCkiIGZvcg0KPiByZXRy
ZWl2aW5nIHUzMiBmcm9tIHRoZSBkZXZpY2UgdHJlZS4gUmVwbGFjZSBpdC4NCj4NCj4gU3VnZ2Vz
dGVkLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+
DQo+IFNpZ25lZC1vZmYtYnk6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAa2VybmVsLm9yZz4NCg0K
UmV2aWV3ZWQtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5j
by5uej4NCg0KR2F2ZSB0aGUgcGF0Y2hlcyBhIHNwaW4gb24gYSBQMjA0MVJEQiBzbw0KDQpUZXN0
ZWQtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4N
Cg0KPiAtLS0NCj4gICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jIHwgMjUgKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAx
MiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
bXBjLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jDQo+IGluZGV4IDgxYWM5MmJiNGY2
Zi4uODdlNWMxNzI1NzUwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1w
Yy5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMNCj4gQEAgLTc3MCw3ICs3
NzAsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19hbGdvcml0aG0gbXBjX2FsZ28gPSB7DQo+
ICAgc3RhdGljIHN0cnVjdCBpMmNfYWRhcHRlciBtcGNfb3BzID0gew0KPiAgIAkub3duZXIgPSBU
SElTX01PRFVMRSwNCj4gICAJLmFsZ28gPSAmbXBjX2FsZ28sDQo+IC0JLnRpbWVvdXQgPSBIWiwN
Cj4gICB9Ow0KPiAgIA0KPiAgIHN0YXRpYyBzdHJ1Y3QgaTJjX2J1c19yZWNvdmVyeV9pbmZvIGZz
bF9pMmNfcmVjb3ZlcnlfaW5mbyA9IHsNCj4gQEAgLTc4MSwxMSArNzgwLDkgQEAgc3RhdGljIGlu
dCBmc2xfaTJjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKm9wKQ0KPiAgIHsNCj4gICAJ
Y29uc3Qgc3RydWN0IG1wY19pMmNfZGF0YSAqZGF0YTsNCj4gICAJc3RydWN0IG1wY19pMmMgKmky
YzsNCj4gLQljb25zdCB1MzIgKnByb3A7DQo+IC0JdTMyIGNsb2NrID0gTVBDX0kyQ19DTE9DS19M
RUdBQ1k7DQo+IC0JaW50IHJlc3VsdCA9IDA7DQo+IC0JaW50IHBsZW47DQo+ICAgCXN0cnVjdCBj
bGsgKmNsazsNCj4gKwlpbnQgcmVzdWx0Ow0KPiArCXUzMiBjbG9jazsNCj4gICAJaW50IGVycjsN
Cj4gICANCj4gICAJaTJjID0gZGV2bV9remFsbG9jKCZvcC0+ZGV2LCBzaXplb2YoKmkyYyksIEdG
UF9LRVJORUwpOw0KPiBAQCAtODMxLDEwICs4MjgsMTAgQEAgc3RhdGljIGludCBmc2xfaTJjX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKm9wKQ0KPiAgIAlpZiAob2ZfcHJvcGVydHlfcmVh
ZF9ib29sKG9wLT5kZXYub2Zfbm9kZSwgImZzbCxwcmVzZXJ2ZS1jbG9ja2luZyIpKSB7DQo+ICAg
CQljbG9jayA9IE1QQ19JMkNfQ0xPQ0tfUFJFU0VSVkU7DQo+ICAgCX0gZWxzZSB7DQo+IC0JCXBy
b3AgPSBvZl9nZXRfcHJvcGVydHkob3AtPmRldi5vZl9ub2RlLCAiY2xvY2stZnJlcXVlbmN5IiwN
Cj4gLQkJCQkJJnBsZW4pOw0KPiAtCQlpZiAocHJvcCAmJiBwbGVuID09IHNpemVvZih1MzIpKQ0K
PiAtCQkJY2xvY2sgPSAqcHJvcDsNCj4gKwkJcmVzdWx0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIo
b3AtPmRldi5vZl9ub2RlLA0KPiArCQkJCQkgICAgICAiY2xvY2stZnJlcXVlbmN5IiwgJmNsb2Nr
KTsNCj4gKwkJaWYgKHJlc3VsdCkNCj4gKwkJCWNsb2NrID0gTVBDX0kyQ19DTE9DS19MRUdBQ1k7
DQo+ICAgCX0NCj4gICANCj4gICAJZGF0YSA9IGRldmljZV9nZXRfbWF0Y2hfZGF0YSgmb3AtPmRl
dik7DQo+IEBAIC04NDYsMTIgKzg0MywxNiBAQCBzdGF0aWMgaW50IGZzbF9pMmNfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqb3ApDQo+ICAgCQkJbXBjX2kyY19zZXR1cF84eHh4KG9wLT5k
ZXYub2Zfbm9kZSwgaTJjLCBjbG9jayk7DQo+ICAgCX0NCj4gICANCj4gLQlwcm9wID0gb2ZfZ2V0
X3Byb3BlcnR5KG9wLT5kZXYub2Zfbm9kZSwgImZzbCx0aW1lb3V0IiwgJnBsZW4pOw0KPiAtCWlm
IChwcm9wICYmIHBsZW4gPT0gc2l6ZW9mKHUzMikpIHsNCj4gLQkJbXBjX29wcy50aW1lb3V0ID0g
KnByb3AgKiBIWiAvIDEwMDAwMDA7DQo+ICsJcmVzdWx0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIo
b3AtPmRldi5vZl9ub2RlLA0KPiArCQkJCSAgICAgICJmc2wsdGltZW91dCIsICZtcGNfb3BzLnRp
bWVvdXQpOw0KPiArCWlmICghcmVzdWx0KSB7DQo+ICsJCW1wY19vcHMudGltZW91dCAqPSBIWiAv
IDEwMDAwMDA7DQo+ICAgCQlpZiAobXBjX29wcy50aW1lb3V0IDwgNSkNCj4gICAJCQltcGNfb3Bz
LnRpbWVvdXQgPSA1Ow0KPiArCX0gZWxzZSB7DQo+ICsJCW1wY19vcHMudGltZW91dCA9IEhaOw0K
PiAgIAl9DQo+ICsNCj4gICAJZGV2X2luZm8oaTJjLT5kZXYsICJ0aW1lb3V0ICV1IHVzXG4iLCBt
cGNfb3BzLnRpbWVvdXQgKiAxMDAwMDAwIC8gSFopOw0KPiAgIA0KPiAgIAlpZiAob2ZfcHJvcGVy
dHlfcmVhZF9ib29sKG9wLT5kZXYub2Zfbm9kZSwgImZzbCxpMmMtZXJyYXR1bS1hMDA0NDQ3Iikp
