Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6764B705146
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 16:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234041AbjEPOwj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 10:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234040AbjEPOwh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 10:52:37 -0400
X-Greylist: delayed 2398 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 16 May 2023 07:52:34 PDT
Received: from mx3.securetransport.de (mx3.securetransport.de [IPv6:2a01:4f8:c0c:92be::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 766ED49CC;
        Tue, 16 May 2023 07:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
        s=dhelectronicscom; t=1684243982;
        bh=VV7WD56ZPBPmmjnYrQTEXVS/doSEeRvJARSHrkh3R8k=;
        h=From:To:CC:Subject:Date:From;
        b=mjWzJJUn1YfiYmLlFptrapFVs4uBQCn1N2yVVLXp4E1Di7cMW9ehB/2Kr9fAHjF8i
         sFd7gNeeX1uRrDfAYqR0DniUI/MAV9RKEEskaAjy9H+ZBsB9/32agMtn+g+EZciq0E
         VNuUXB41bfO80Y9vcvBjLlVY9Ejy5NPcxpqP9r/COkE415H5nTMY7+ghPIErbwDEB5
         M9JheU0EcnHjlfRagLSHgIi6qL30fJMZPr9Af4udhPKoNV13WFmMcMPJVXRAjIpT3a
         AiAMPsNnVy8g1SwZyP2sukB9VXjtglyx2mQGoi39J0BXRK7VrJJat3bkVYR4fB1fTF
         sMnO17QoXhofw==
X-secureTransport-forwarded: yes
From:   Ludwig Zenz <lzenz@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC:     "Matti.Vaittinen@fi.rohmeurope.com" 
        <Matti.Vaittinen@fi.rohmeurope.com>,
        "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        "khalasa@piap.pl" <khalasa@piap.pl>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
        "m.tretter@pengutronix.de" <m.tretter@pengutronix.de>,
        "marex@denx.de" <marex@denx.de>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "mpagano@gentoo.org" <mpagano@gentoo.org>,
        "peda@axentia.se" <peda@axentia.se>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "satish.nagireddy@getcruise.com" <satish.nagireddy@getcruise.com>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: Re: [PATCH v13 6/8] media: i2c: add DS90UB960 driver
Thread-Topic: [PATCH v13 6/8] media: i2c: add DS90UB960 driver
Thread-Index: AdmH94aJYfpSTDyZQpaZXJi+tH9eKw==
Date:   Tue, 16 May 2023 13:32:55 +0000
Message-ID: <e13dade162f74a3e812f9331b83928f0@dh-electronics.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBIaSwNCj4gDQo+IE9uIDE2LzA1LzIwMjMgMTU6MzUsIEx1ZHdpZyBaZW56IHdyb3RlOg0KPj4g
T24gV2VkLCAyNiBBcHIgMjAyMyAxNDo1MToxMiArMDMwMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6
DQo+Pg0KPj4gWy4uLl0NCj4+DQo+Pj4gICArc3RhdGljIGludCB1Yjk2MF9jb25maWd1cmVfcG9y
dHNfZm9yX3N0cmVhbWluZyhzdHJ1Y3QgdWI5NjBfZGF0YSAqcHJpdiwNCj4+PiAgICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2NGwyX3N1YmRldl9zdGF0
ZSAqc3RhdGUpDQo+Pj4gICArew0KPj4+ICAgKyAgdTggZndkX2N0bDsNCj4+PiAgICsgIHN0cnVj
dCB7DQo+Pj4gICArICAgICAgICAgIHUzMiBudW1fc3RyZWFtczsNCj4+PiAgICsgICAgICAgICAg
dTggcGl4ZWxfZHQ7DQo+Pj4gICArICAgICAgICAgIHU4IG1ldGFfZHQ7DQo+Pj4gICArICAgICAg
ICAgIHUzMiBtZXRhX2xpbmVzOw0KPj4+ICAgKyAgICAgICAgICB1MzIgdHhfcG9ydDsNCj4+PiAg
ICsgIH0gcnhfZGF0YVtVQjk2MF9NQVhfUlhfTlBPUlRTXSA9IHt9Ow0KPj4+ICAgKyAgdTggdmNf
bWFwW1VCOTYwX01BWF9SWF9OUE9SVFNdID0ge307DQo+Pj4gICArICBzdHJ1Y3QgdjRsMl9zdWJk
ZXZfcm91dGUgKnJvdXRlOw0KPj4+ICAgKyAgdW5zaWduZWQgaW50IG5wb3J0Ow0KPj4+ICAgKyAg
aW50IHJldDsNCj4+PiAgICsNCj4+PiAgICsgIHJldCA9IHViOTYwX3ZhbGlkYXRlX3N0cmVhbV92
Y3MocHJpdik7DQo+Pj4gICArICBpZiAocmV0KQ0KPj4+ICAgKyAgICAgICAgICByZXR1cm4gcmV0
Ow0KPj4+ICAgKw0KPj4+ICAgKyAgdWI5NjBfZ2V0X3ZjX21hcHMocHJpdiwgc3RhdGUsIHZjX21h
cCk7DQo+Pj4gICArDQo+Pj4gICArICBmb3JfZWFjaF9hY3RpdmVfcm91dGUoJnN0YXRlLT5yb3V0
aW5nLCByb3V0ZSkgew0KPj4+ICAgKyAgICAgICAgICBzdHJ1Y3QgdWI5NjBfcnhwb3J0ICpyeHBv
cnQ7DQo+Pj4gICArICAgICAgICAgIHN0cnVjdCB1Yjk2MF90eHBvcnQgKnR4cG9ydDsNCj4+PiAg
ICsgICAgICAgICAgc3RydWN0IHY0bDJfbWJ1c19mcmFtZWZtdCAqZm10Ow0KPj4+ICAgKyAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgdWI5NjBfZm9ybWF0X2luZm8gKnViOTYwX2ZtdDsNCj4+PiAgICsg
ICAgICAgICAgdW5zaWduZWQgaW50IG5wb3J0Ow0KPj4+ICAgKw0KPj4+ICAgKyAgICAgICAgICBu
cG9ydCA9IHViOTYwX3BhZF90b19wb3J0KHByaXYsIHJvdXRlLT5zaW5rX3BhZCk7DQo+Pj4gICAr
DQo+Pj4gICArICAgICAgICAgIHJ4cG9ydCA9IHByaXYtPnJ4cG9ydHNbbnBvcnRdOw0KPj4+ICAg
KyAgICAgICAgICBpZiAoIXJ4cG9ydCkNCj4+PiAgICsgICAgICAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsNCj4+PiAgICsNCj4+PiAgICsgICAgICAgICAgdHhwb3J0ID0gcHJpdi0+dHhwb3J0
c1t1Yjk2MF9wYWRfdG9fcG9ydChwcml2LCByb3V0ZS0+c291cmNlX3BhZCldOw0KPj4+ICAgKyAg
ICAgICAgICBpZiAoIXR4cG9ydCkNCj4+PiAgICsgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4+PiAgICsNCj4+PiAgICsgICAgICAgICAgcnhfZGF0YVtucG9ydF0udHhfcG9ydCA9
IHViOTYwX3BhZF90b19wb3J0KHByaXYsIHJvdXRlLT5zb3VyY2VfcGFkKTsNCj4+PiAgICsNCj4+
PiAgICsgICAgICAgICAgcnhfZGF0YVtucG9ydF0ubnVtX3N0cmVhbXMrKzsNCj4+PiAgICsNCj4+
PiAgICsgICAgICAgICAgLyogRm9yIHRoZSByZXN0LCB3ZSBhcmUgb25seSBpbnRlcmVzdGVkIGlu
IHBhcmFsbGVsIGJ1c3NlcyAqLw0KPj4+ICAgKyAgICAgICAgICBpZiAocnhwb3J0LT5yeF9tb2Rl
ID09IFJYUE9SVF9NT0RFX0NTSTJfU1lOQyB8fA0KPj4+ICAgKyAgICAgICAgICAgICAgcnhwb3J0
LT5yeF9tb2RlID09IFJYUE9SVF9NT0RFX0NTSTJfQVNZTkMpDQo+Pj4gICArICAgICAgICAgICAg
ICAgICAgY29udGludWU7DQo+Pj4gICArDQo+Pj4gICArICAgICAgICAgIGlmIChyeF9kYXRhW25w
b3J0XS5udW1fc3RyZWFtcyA+IDIpDQo+Pj4gICArICAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
UElQRTsNCj4+PiAgICsNCj4+PiAgICsgICAgICAgICAgZm10ID0gdjRsMl9zdWJkZXZfc3RhdGVf
Z2V0X3N0cmVhbV9mb3JtYXQoc3RhdGUsDQo+Pj4gICArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJvdXRlLT5zaW5rX3BhZCwNCj4+PiAgICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcm91dGUtPnNp
bmtfc3RyZWFtKTsNCj4+PiAgICsgICAgICAgICAgaWYgKCFmbXQpDQo+Pj4gICArICAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FUElQRTsNCj4+PiAgICsNCj4+PiAgICsgICAgICAgICAgdWI5NjBf
Zm10ID0gdWI5NjBfZmluZF9mb3JtYXQoZm10LT5jb2RlKTsNCj4+PiAgICsgICAgICAgICAgaWYg
KCF1Yjk2MF9mbXQpDQo+Pj4gICArICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FUElQRTsNCj4+
PiAgICsNCj4+PiAgICsgICAgICAgICAgaWYgKHViOTYwX2ZtdC0+bWV0YSkgew0KPj4+ICAgKyAg
ICAgICAgICAgICAgICAgIGlmIChmbXQtPmhlaWdodCA+IDMpIHsNCj4+PiAgICsgICAgICAgICAg
ICAgICAgICAgICAgICAgIGRldl9lcnIoJnByaXYtPmNsaWVudC0+ZGV2LA0KPj4+ICAgKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAicngldTogdW5zdXBwb3J0ZWQgbWV0YWRhdGEg
aGVpZ2h0ICV1XG4iLA0KPj4+ICAgKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBu
cG9ydCwgZm10LT5oZWlnaHQpOw0KPj4+ICAgKyAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FUElQRTsNCj4+PiAgICsgICAgICAgICAgICAgICAgICB9DQo+Pj4gICArDQo+Pj4gICAr
ICAgICAgICAgICAgICAgICAgcnhfZGF0YVtucG9ydF0ubWV0YV9kdCA9IHViOTYwX2ZtdC0+ZGF0
YXR5cGU7DQo+Pj4gICArICAgICAgICAgICAgICAgICAgcnhfZGF0YVtucG9ydF0ubWV0YV9saW5l
cyA9IGZtdC0+aGVpZ2h0Ow0KPj4+ICAgKyAgICAgICAgICB9IGVsc2Ugew0KPj4+ICAgKyAgICAg
ICAgICAgICAgICAgIHJ4X2RhdGFbbnBvcnRdLnBpeGVsX2R0ID0gdWI5NjBfZm10LT5kYXRhdHlw
ZTsNCj4+PiAgICsgICAgICAgICAgfQ0KPj4+ICAgKyAgfQ0KPj4+ICAgKw0KPj4+ICAgKyAgLyog
Q29uZmlndXJlIFJYIHBvcnRzICovDQo+Pj4gICArDQo+Pj4gICArICBmd2RfY3RsID0gMDsNCj4+
DQo+PiBIZWxsbywgSSBoYXZlIG9ubHkgdXNlZCB0aGUgZmlyc3QgUlggcG9ydCBpbiBteSBzZXR1
cCAoZHM5MHViOTMzIHRvIGRzOTB1Yjk2NCkuIFRoZSBsb2dpYyBmb3IgYWN0aXZhdGluZy9kZWFj
dGl2YXRpbmcgdGhlIFJ4IHBvcnRzIGRpZCBub3Qgd29yayBmb3IgbWUuIE15IHN1Z2dlc3Rpb24g
aXM6DQo+IA0KPiBXaHkgZG9lc24ndCBpdCB3b3JrPyBXaGF0IGhhcHBlbnM/DQo+IA0KPiAgVG9t
aQ0KDQpIZWxsbyBUb21pLA0KDQp0aGUgcG9ydCByeDAgd2hpY2ggSSBuZWVkIHdhcyBkaXNhYmxl
ZCBhbmQgdGhlIG90aGVyIHBvcnRzIHJ4MSB0byByeDMgd2VyZSBlbmFibGVkLiBJbiBvdGhlciB3
b3JkcywgdGhlIGV4YWN0IGludmVyc2Ugb2YgdGhlIHJlcXVpcmVkIHNlbGVjdGlvbi4NCg0KPj4+
ICArCQkvKiBGb3J3YXJkaW5nICovDQo+Pj4gICsNCj4+PiAgKwkJZndkX2N0bCB8PSBCSVQoNCAr
IG5wb3J0KTsgLyogZm9yd2FyZCBkaXNhYmxlICovDQpBY2NvcmRpbmcgdG8gdGhlIGRhdGEgc2hl
ZXQsIGEgc2V0IGJpdDQtNyBpbiBmd2RfY3RsIG1lYW5zIHRoYXQgdGhlIGNoYW5uZWwgaXMgZGlz
YWJsZWQuIFNvIHRoZSBjb21tZW50ICdmb3J3YXJkIGRpc2FibGUnIGlzIGNvcnJlY3QuIFdoaWxl
IGRlYnVnZ2luZywgaG93ZXZlciwgdGhpcyBjb2RlIHdhcyBvbmx5IHJlYWNoZWQgZm9yIHRoZSBw
b3J0cyB0byBiZSBlbmFibGVkIGJ1dCBub3QgZm9yIHRoZSBvbmVzIHdoaWNoIHNob3VsZCBiZSBk
aXNhYmxlZC4NCg0KcmVnYXJkcywNCkx1ZHdpZw0K
