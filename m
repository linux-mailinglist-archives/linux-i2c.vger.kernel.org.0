Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87524705956
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 23:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjEPVPb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 17:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjEPVPa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 17:15:30 -0400
X-Greylist: delayed 5401 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 16 May 2023 14:15:26 PDT
Received: from mx4.securetransport.de (mx4.securetransport.de [178.254.6.145])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CCA665B4;
        Tue, 16 May 2023 14:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
        s=dhelectronicscom; t=1684264823;
        bh=et+110nyHj10F9KET/LAY5/YnQT3zsearjzO3i3m29U=;
        h=From:To:CC:Subject:Date:From;
        b=cHJTWPmyUAC4gYK2HL8p8VQ2rCwtSl5pglrYB4IJrPD7Sx0egmfStfjVuleTbV7Sl
         55WPlC07E8NNcSujJzwpg4sgwpim4iAV+YwbTnuby3y3yTzIX7+95tpAQ+iaywwmTz
         PGlXLNVCYRmU4JowBCL6b4IzbhA/6/A7TQ0V5yNFjQTGf/+5iYPANPBOck7WSi1B6l
         Ixrp8DLHKMuy+O7j8Klm9YUuabUWmuunppek6UDbRKF47dzuentaHbQXc0DjKrM3oM
         0BoBz+uoYdZyWHAkismb3mzMgBoVJ6hc+OqjSMWqtEAtjBs/O8lLEf1xhRO1FxB2Ko
         j7Mhb7zO5xoyg==
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
Thread-Index: AdmIJPsII8U46khKT5Cu8bF7d5gwnw==
Date:   Tue, 16 May 2023 19:05:10 +0000
Message-ID: <5abbcb606e4c4a49821be5d107d9ddfc@dh-electronics.com>
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

PiBPbiAxNi8wNS8yMDIzIDE2OjMyLCBMdWR3aWcgWmVueiB3cm90ZToNCj4+PiBIaSwNCj4+Pg0K
Pj4+IE9uIDE2LzA1LzIwMjMgMTU6MzUsIEx1ZHdpZyBaZW56IHdyb3RlOg0KPj4+PiBPbiBXZWQs
IDI2IEFwciAyMDIzIDE0OjUxOjEyICswMzAwLCBUb21pIFZhbGtlaW5lbiB3cm90ZToNCj4+Pj4N
Cj4+Pj4gWy4uLl0NCj4+Pj4NCj4+Pj4+ICAgICtzdGF0aWMgaW50IHViOTYwX2NvbmZpZ3VyZV9w
b3J0c19mb3Jfc3RyZWFtaW5nKHN0cnVjdCB1Yjk2MF9kYXRhICpwcml2LA0KPj4+Pj4gICAgKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHY0bDJfc3ViZGV2
X3N0YXRlICpzdGF0ZSkNCj4+Pj4+ICAgICt7DQo+Pj4+PiAgICArICB1OCBmd2RfY3RsOw0KPj4+
Pj4gICAgKyAgc3RydWN0IHsNCj4+Pj4+ICAgICsgICAgICAgICAgdTMyIG51bV9zdHJlYW1zOw0K
Pj4+Pj4gICAgKyAgICAgICAgICB1OCBwaXhlbF9kdDsNCj4+Pj4+ICAgICsgICAgICAgICAgdTgg
bWV0YV9kdDsNCj4+Pj4+ICAgICsgICAgICAgICAgdTMyIG1ldGFfbGluZXM7DQo+Pj4+PiAgICAr
ICAgICAgICAgIHUzMiB0eF9wb3J0Ow0KPj4+Pj4gICAgKyAgfSByeF9kYXRhW1VCOTYwX01BWF9S
WF9OUE9SVFNdID0ge307DQo+Pj4+PiAgICArICB1OCB2Y19tYXBbVUI5NjBfTUFYX1JYX05QT1JU
U10gPSB7fTsNCj4+Pj4+ICAgICsgIHN0cnVjdCB2NGwyX3N1YmRldl9yb3V0ZSAqcm91dGU7DQo+
Pj4+PiAgICArICB1bnNpZ25lZCBpbnQgbnBvcnQ7DQo+Pj4+PiAgICArICBpbnQgcmV0Ow0KPj4+
Pj4gICAgKw0KPj4+Pj4gICAgKyAgcmV0ID0gdWI5NjBfdmFsaWRhdGVfc3RyZWFtX3Zjcyhwcml2
KTsNCj4+Pj4+ICAgICsgIGlmIChyZXQpDQo+Pj4+PiAgICArICAgICAgICAgIHJldHVybiByZXQ7
DQo+Pj4+PiAgICArDQo+Pj4+PiAgICArICB1Yjk2MF9nZXRfdmNfbWFwcyhwcml2LCBzdGF0ZSwg
dmNfbWFwKTsNCj4+Pj4+ICAgICsNCj4+Pj4+ICAgICsgIGZvcl9lYWNoX2FjdGl2ZV9yb3V0ZSgm
c3RhdGUtPnJvdXRpbmcsIHJvdXRlKSB7DQo+Pj4+PiAgICArICAgICAgICAgIHN0cnVjdCB1Yjk2
MF9yeHBvcnQgKnJ4cG9ydDsNCj4+Pj4+ICAgICsgICAgICAgICAgc3RydWN0IHViOTYwX3R4cG9y
dCAqdHhwb3J0Ow0KPj4+Pj4gICAgKyAgICAgICAgICBzdHJ1Y3QgdjRsMl9tYnVzX2ZyYW1lZm10
ICpmbXQ7DQo+Pj4+PiAgICArICAgICAgICAgIGNvbnN0IHN0cnVjdCB1Yjk2MF9mb3JtYXRfaW5m
byAqdWI5NjBfZm10Ow0KPj4+Pj4gICAgKyAgICAgICAgICB1bnNpZ25lZCBpbnQgbnBvcnQ7DQo+
Pj4+PiAgICArDQo+Pj4+PiAgICArICAgICAgICAgIG5wb3J0ID0gdWI5NjBfcGFkX3RvX3BvcnQo
cHJpdiwgcm91dGUtPnNpbmtfcGFkKTsNCj4+Pj4+ICAgICsNCj4+Pj4+ICAgICsgICAgICAgICAg
cnhwb3J0ID0gcHJpdi0+cnhwb3J0c1tucG9ydF07DQo+Pj4+PiAgICArICAgICAgICAgIGlmICgh
cnhwb3J0KQ0KPj4+Pj4gICAgKyAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4+
Pj4gICAgKw0KPj4+Pj4gICAgKyAgICAgICAgICB0eHBvcnQgPSBwcml2LT50eHBvcnRzW3ViOTYw
X3BhZF90b19wb3J0KHByaXYsIHJvdXRlLT5zb3VyY2VfcGFkKV07DQo+Pj4+PiAgICArICAgICAg
ICAgIGlmICghdHhwb3J0KQ0KPj4+Pj4gICAgKyAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPj4+Pj4gICAgKw0KPj4+Pj4gICAgKyAgICAgICAgICByeF9kYXRhW25wb3J0XS50eF9w
b3J0ID0gdWI5NjBfcGFkX3RvX3BvcnQocHJpdiwgcm91dGUtPnNvdXJjZV9wYWQpOw0KPj4+Pj4g
ICAgKw0KPj4+Pj4gICAgKyAgICAgICAgICByeF9kYXRhW25wb3J0XS5udW1fc3RyZWFtcysrOw0K
Pj4+Pj4gICAgKw0KPj4+Pj4gICAgKyAgICAgICAgICAvKiBGb3IgdGhlIHJlc3QsIHdlIGFyZSBv
bmx5IGludGVyZXN0ZWQgaW4gcGFyYWxsZWwgYnVzc2VzICovDQo+Pj4+PiAgICArICAgICAgICAg
IGlmIChyeHBvcnQtPnJ4X21vZGUgPT0gUlhQT1JUX01PREVfQ1NJMl9TWU5DIHx8DQo+Pj4+PiAg
ICArICAgICAgICAgICAgICByeHBvcnQtPnJ4X21vZGUgPT0gUlhQT1JUX01PREVfQ1NJMl9BU1lO
QykNCj4+Pj4+ICAgICsgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4+Pj4+ICAgICsNCj4+
Pj4+ICAgICsgICAgICAgICAgaWYgKHJ4X2RhdGFbbnBvcnRdLm51bV9zdHJlYW1zID4gMikNCj4+
Pj4+ICAgICsgICAgICAgICAgICAgICAgICByZXR1cm4gLUVQSVBFOw0KPj4+Pj4gICAgKw0KPj4+
Pj4gICAgKyAgICAgICAgICBmbXQgPSB2NGwyX3N1YmRldl9zdGF0ZV9nZXRfc3RyZWFtX2Zvcm1h
dChzdGF0ZSwNCj4+Pj4+ICAgICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcm91dGUtPnNpbmtfcGFkLA0KPj4+Pj4gICAgKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByb3V0ZS0+c2lua19zdHJlYW0p
Ow0KPj4+Pj4gICAgKyAgICAgICAgICBpZiAoIWZtdCkNCj4+Pj4+ICAgICsgICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVQSVBFOw0KPj4+Pj4gICAgKw0KPj4+Pj4gICAgKyAgICAgICAgICB1Yjk2
MF9mbXQgPSB1Yjk2MF9maW5kX2Zvcm1hdChmbXQtPmNvZGUpOw0KPj4+Pj4gICAgKyAgICAgICAg
ICBpZiAoIXViOTYwX2ZtdCkNCj4+Pj4+ICAgICsgICAgICAgICAgICAgICAgICByZXR1cm4gLUVQ
SVBFOw0KPj4+Pj4gICAgKw0KPj4+Pj4gICAgKyAgICAgICAgICBpZiAodWI5NjBfZm10LT5tZXRh
KSB7DQo+Pj4+PiAgICArICAgICAgICAgICAgICAgICAgaWYgKGZtdC0+aGVpZ2h0ID4gMykgew0K
Pj4+Pj4gICAgKyAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycigmcHJpdi0+Y2xpZW50
LT5kZXYsDQo+Pj4+PiAgICArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyeCV1
OiB1bnN1cHBvcnRlZCBtZXRhZGF0YSBoZWlnaHQgJXVcbiIsDQo+Pj4+PiAgICArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG5wb3J0LCBmbXQtPmhlaWdodCk7DQo+Pj4+PiAgICAr
ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVQSVBFOw0KPj4+Pj4gICAgKyAgICAg
ICAgICAgICAgICAgIH0NCj4+Pj4+ICAgICsNCj4+Pj4+ICAgICsgICAgICAgICAgICAgICAgICBy
eF9kYXRhW25wb3J0XS5tZXRhX2R0ID0gdWI5NjBfZm10LT5kYXRhdHlwZTsNCj4+Pj4+ICAgICsg
ICAgICAgICAgICAgICAgICByeF9kYXRhW25wb3J0XS5tZXRhX2xpbmVzID0gZm10LT5oZWlnaHQ7
DQo+Pj4+PiAgICArICAgICAgICAgIH0gZWxzZSB7DQo+Pj4+PiAgICArICAgICAgICAgICAgICAg
ICAgcnhfZGF0YVtucG9ydF0ucGl4ZWxfZHQgPSB1Yjk2MF9mbXQtPmRhdGF0eXBlOw0KPj4+Pj4g
ICAgKyAgICAgICAgICB9DQo+Pj4+PiAgICArICB9DQo+Pj4+PiAgICArDQo+Pj4+PiAgICArICAv
KiBDb25maWd1cmUgUlggcG9ydHMgKi8NCj4+Pj4+ICAgICsNCj4+Pj4+ICAgICsgIGZ3ZF9jdGwg
PSAwOw0KPj4+Pg0KPj4+PiBIZWxsbywgSSBoYXZlIG9ubHkgdXNlZCB0aGUgZmlyc3QgUlggcG9y
dCBpbiBteSBzZXR1cCAoZHM5MHViOTMzIHRvIGRzOTB1Yjk2NCkuIFRoZSBsb2dpYyBmb3IgYWN0
aXZhdGluZy9kZWFjdGl2YXRpbmcgdGhlIFJ4IHBvcnRzIGRpZCBub3Qgd29yayBmb3IgbWUuIE15
IHN1Z2dlc3Rpb24gaXM6DQo+Pj4+DQo+Pj4gV2h5IGRvZXNuJ3QgaXQgd29yaz8gV2hhdCBoYXBw
ZW5zPw0KPj4+DQo+Pj4gICBUb21pDQo+Pg0KPj4gSGVsbG8gVG9taSwNCj4+DQo+PiB0aGUgcG9y
dCByeDAgd2hpY2ggSSBuZWVkIHdhcyBkaXNhYmxlZCBhbmQgdGhlIG90aGVyIHBvcnRzIHJ4MSB0
byByeDMgd2VyZSBlbmFibGVkLiBJbiBvdGhlciB3b3JkcywgdGhlIGV4YWN0IGludmVyc2Ugb2Yg
dGhlIHJlcXVpcmVkIHNlbGVjdGlvbi4NCj4+DQo+Pj4+PiAgICsgICAgICAgICAgICAgICAgLyog
Rm9yd2FyZGluZyAqLw0KPj4+Pj4gICArDQo+Pj4+PiAgICsgICAgICAgICAgICAgICAgZndkX2N0
bCB8PSBCSVQoNCArIG5wb3J0KTsgLyogZm9yd2FyZCBkaXNhYmxlICovDQo+PiBBY2NvcmRpbmcg
dG8gdGhlIGRhdGEgc2hlZXQsIGEgc2V0IGJpdDQtNyBpbiBmd2RfY3RsIG1lYW5zIHRoYXQgdGhl
IGNoYW5uZWwgaXMgZGlzYWJsZWQuIFNvIHRoZSBjb21tZW50ICdmb3J3YXJkIGRpc2FibGUnIGlz
IGNvcnJlY3QuIFdoaWxlIGRlYnVnZ2luZywgaG93ZXZlciwgdGhpcyBjb2RlIHdhcyBvbmx5IHJl
YWNoZWQgZm9yIHRoZSBwb3J0cyB0byBiZSBlbmFibGVkIGJ1dCBub3QgZm9yIHRoZSBvbmVzIHdo
aWNoIHNob3VsZCBiZSBkaXNhYmxlZC4NCg0KPiBUaGlzIGlzIGp1c3QgYSBzZXR1cCBwaGFzZSwg
d2hlcmUgd2UgaW5pdGlhbGl6ZSB0aGUgcmVnaXN0ZXJzIGZvciB0aGUgcG9ydHMgd2Ugd2FudCB0
byB1c2UuIFRoZSBmb3J3YXJkaW5nIGlzIHRoZW4gZW5hYmxlZCBsYXRlciwgaW4gdWI5NjBfZW5h
YmxlX3J4X3BvcnQsIGFuZCBldmVuIGxhdGVyIGRpc2FibGVkIGluIHViOTYwX2Rpc2FibGVfcnhf
cG9ydC4NCg0KVGhhbmsgeW91IGZvciB0aGUgY2xhcmlmaWNhdGlvbi4gSSBoYWQgbWlzaW50ZXJw
cmV0ZWQgdGhlIGludGVudGlvbiBvZiB0aGUgY29kZSBoZXJlLg0KDQo+IFRoaXMgYXNzdW1lcyB0
aGF0IHRoZSBmb3J3YXJkaW5nIGlzIGRpc2FibGVkIGluIHRoZSByZWdpc3RlcnMgYnkgZGVmYXVs
dCAod2hpY2ggaXQgaXMgaW4gVUI5NjApLg0KPiANCj4gSSBuZWVkIHRvIHRyeSB0aGlzIG9uIG15
IEhXIHRvIHZlcmlmeSBteSB1bmRlcnN0YW5kaW5nIGlzIGNvcnJlY3QsIGJ1dCBsb29raW5nIGF0
IHRoZSBjb2RlLCBpdCBpcyBpbmRlZWQgYSBiaXQgYnVnZ3kuDQo+IA0KPiBBdCB0aGlzIHNldHVw
IHBoYXNlIHdlIGRpc2FibGUgdGhlIGZvcndhcmRpbmcgZm9yIHBvcnRzIHdlJ2xsIHVzZSwgYW5k
IGVuYWJsZSB0aGUgZm9yd2FyZGluZyBmb3IgcG9ydHMgd2UgZG9uJ3QgdXNlICh3aGljaCBkb2Vz
bid0IG1ha2Ugc2Vuc2UpLg0KPiBMYXRlciwgd2hlbiB0aGUgc3RyZWFtaW5nIGlzIHN0YXJ0ZWQg
Zm9yIHRoYXQgcG9ydCwgd2UgZW5hYmxlIHRoZSBmb3J3YXJkaW5nLiBTbyBoZXJlIHdlIHNob3Vs
ZCBqdXN0IGFsd2F5cyBkaXNhYmxlIHRoZSBmb3J3YXJkaW5nIGZvciBhbGwgcG9ydHMuDQo+IA0K
DQpUaGUgdW51c2VkIFJ4IHBvcnRzIHdlcmUgbm90IGRpc2FibGVkIGluIG15IHRlc3RzLiBEaXNh
YmxpbmcgYWxsIHBvcnRzIGhlcmUgc2hvdWxkIGFsc28gd29yayBmb3IgbXkgc2V0dXAuDQoNCj4g
U2F5aW5nICJkaXNhYmxlIHRoZSBmb3J3YXJkaW5nIiBpcyBwZXJoYXBzIGEgYml0IGNvbmZ1c2lu
ZyBoZXJlLCBhcyB0aGUgdGhlIGZvcndhcmRpbmcgc2hvdWxkIGFscmVhZHkgYmUgZGlzYWJsZWQg
aW4gdGhlIEhXIGhlcmUgYW55d2F5LiBCdXQgYXMgd2Ugd3JpdGUgdGhlIFVCOTYwX1NSX0ZXRF9D
VEwxLCB3ZSBuZWVkIHRvIHNldCB0aGF0IGJpdC4NCj4gDQo+IFNvLiBZb3Ugc2hvdWxkIHNlZSB0
aGUgcngwIGdldHRpbmcgZW5hYmxlZCAobGF0ZXIsIGluIHViOTYwX2VuYWJsZV9yeF9wb3J0KSwg
YW5kIEknbSBjdXJpb3VzIHdoeSB5b3UgZG9uJ3Qgc2VlIHRoYXQuDQoNCkkgd2lsbCBoYXZlIGFu
b3RoZXIgbG9vayBhdCB0aGF0IG5leHQgd2Vlay4gSXQgY291bGQgd2VsbCBiZSB0aGF0IGluIHRo
ZSBlbmQgb25seSB0aGUgZW5hYmxlZCBidXQgdW51c2VkIHBvcnRzIGFyZSB0aGUgcHJvYmxlbS4N
Cg0KcmVnYXJkcywNCkx1ZHdpZw0K
