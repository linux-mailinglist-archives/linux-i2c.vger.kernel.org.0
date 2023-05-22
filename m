Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93D7170BC11
	for <lists+linux-i2c@lfdr.de>; Mon, 22 May 2023 13:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbjEVLoR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 May 2023 07:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232937AbjEVLoQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 May 2023 07:44:16 -0400
Received: from mx2.securetransport.de (mx2.securetransport.de [IPv6:2a03:4000:13:6c7::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5116197;
        Mon, 22 May 2023 04:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
        s=dhelectronicscom; t=1684755748;
        bh=DXBNab3wDYbzqElhq6r5AwLIPShxiRZZ8AMAgvWKKzk=;
        h=From:To:CC:Subject:Date:From;
        b=MWVySWDBYpzCd5iJYcshYSyx/okeLK9jI4qXC5d5B5cDJIXCyTAj54gdmjbK3sjSo
         r1NfM2VC1UPJ3uU/9ykh96aC7XRrRTUUgTAY4G6ZMRx94FjHfz99z5Wat0S03ZpMLA
         tGCaNqhj7xJiOQ3aCG2ZfZDEt6519AmbA17qHE4rd7q3Xasc+ewExer6pbDV+c6dGY
         4QItaf8l6a8G7De/zlqC9v3GtyGtNctYk4ntbgz6C64Cjko0KlV+3eoIIctmuX9rlX
         Y4Wh3K57ZmTsrU5hJxvvI7w3BI+sJk0UnyinSrIuimVg2P5gNEbIFd1At1vHnSLuuq
         d30dRWWnUSRIQ==
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
Thread-Index: AdmMoJ2P0iXi87HrST+FnMU7CXcJlQ==
Date:   Mon, 22 May 2023 11:42:24 +0000
Message-ID: <d7e992a23c7d40b09e0a931bd6857d53@dh-electronics.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiBPbiAxNi8wNS8yMDIzIDIyOjA1LCBMdWR3aWcgWmVueiB3cm90ZToNCj4+PiBPbiAxNi8wNS8y
MDIzIDE2OjMyLCBMdWR3aWcgWmVueiB3cm90ZToNCj4+Pj4+IEhpLA0KPj4+Pj4NCj4+Pj4+IE9u
IDE2LzA1LzIwMjMgMTU6MzUsIEx1ZHdpZyBaZW56IHdyb3RlOg0KPj4+Pj4+IE9uIFdlZCwgMjYg
QXByIDIwMjMgMTQ6NTE6MTIgKzAzMDAsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOg0KPj4+Pj4+DQo+
Pj4+Pj4gWy4uLl0NCj4+Pj4+Pg0KPj4+Pj4+PiAgICAgK3N0YXRpYyBpbnQgdWI5NjBfY29uZmln
dXJlX3BvcnRzX2Zvcl9zdHJlYW1pbmcoc3RydWN0IHViOTYwX2RhdGEgKnByaXYsDQo+Pj4+Pj4+
ICAgICArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdjRs
Ml9zdWJkZXZfc3RhdGUgKnN0YXRlKQ0KPj4+Pj4+PiAgICAgK3sNCj4+Pj4+Pj4gICAgICsgIHU4
IGZ3ZF9jdGw7DQo+Pj4+Pj4+ICAgICArICBzdHJ1Y3Qgew0KPj4+Pj4+PiAgICAgKyAgICAgICAg
ICB1MzIgbnVtX3N0cmVhbXM7DQo+Pj4+Pj4+ICAgICArICAgICAgICAgIHU4IHBpeGVsX2R0Ow0K
Pj4+Pj4+PiAgICAgKyAgICAgICAgICB1OCBtZXRhX2R0Ow0KPj4+Pj4+PiAgICAgKyAgICAgICAg
ICB1MzIgbWV0YV9saW5lczsNCj4+Pj4+Pj4gICAgICsgICAgICAgICAgdTMyIHR4X3BvcnQ7DQo+
Pj4+Pj4+ICAgICArICB9IHJ4X2RhdGFbVUI5NjBfTUFYX1JYX05QT1JUU10gPSB7fTsNCj4+Pj4+
Pj4gICAgICsgIHU4IHZjX21hcFtVQjk2MF9NQVhfUlhfTlBPUlRTXSA9IHt9Ow0KPj4+Pj4+PiAg
ICAgKyAgc3RydWN0IHY0bDJfc3ViZGV2X3JvdXRlICpyb3V0ZTsNCj4+Pj4+Pj4gICAgICsgIHVu
c2lnbmVkIGludCBucG9ydDsNCj4+Pj4+Pj4gICAgICsgIGludCByZXQ7DQo+Pj4+Pj4+ICAgICAr
DQo+Pj4+Pj4+ICAgICArICByZXQgPSB1Yjk2MF92YWxpZGF0ZV9zdHJlYW1fdmNzKHByaXYpOw0K
Pj4+Pj4+PiAgICAgKyAgaWYgKHJldCkNCj4+Pj4+Pj4gICAgICsgICAgICAgICAgcmV0dXJuIHJl
dDsNCj4+Pj4+Pj4gICAgICsNCj4+Pj4+Pj4gICAgICsgIHViOTYwX2dldF92Y19tYXBzKHByaXYs
IHN0YXRlLCB2Y19tYXApOw0KPj4+Pj4+PiAgICAgKw0KPj4+Pj4+PiAgICAgKyAgZm9yX2VhY2hf
YWN0aXZlX3JvdXRlKCZzdGF0ZS0+cm91dGluZywgcm91dGUpIHsNCj4+Pj4+Pj4gICAgICsgICAg
ICAgICAgc3RydWN0IHViOTYwX3J4cG9ydCAqcnhwb3J0Ow0KPj4+Pj4+PiAgICAgKyAgICAgICAg
ICBzdHJ1Y3QgdWI5NjBfdHhwb3J0ICp0eHBvcnQ7DQo+Pj4+Pj4+ICAgICArICAgICAgICAgIHN0
cnVjdCB2NGwyX21idXNfZnJhbWVmbXQgKmZtdDsNCj4+Pj4+Pj4gICAgICsgICAgICAgICAgY29u
c3Qgc3RydWN0IHViOTYwX2Zvcm1hdF9pbmZvICp1Yjk2MF9mbXQ7DQo+Pj4+Pj4+ICAgICArICAg
ICAgICAgIHVuc2lnbmVkIGludCBucG9ydDsNCj4+Pj4+Pj4gICAgICsNCj4+Pj4+Pj4gICAgICsg
ICAgICAgICAgbnBvcnQgPSB1Yjk2MF9wYWRfdG9fcG9ydChwcml2LCByb3V0ZS0+c2lua19wYWQp
Ow0KPj4+Pj4+PiAgICAgKw0KPj4+Pj4+PiAgICAgKyAgICAgICAgICByeHBvcnQgPSBwcml2LT5y
eHBvcnRzW25wb3J0XTsNCj4+Pj4+Pj4gICAgICsgICAgICAgICAgaWYgKCFyeHBvcnQpDQo+Pj4+
Pj4+ICAgICArICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4+Pj4+ICAgICAr
DQo+Pj4+Pj4+ICAgICArICAgICAgICAgIHR4cG9ydCA9IHByaXYtPnR4cG9ydHNbdWI5NjBfcGFk
X3RvX3BvcnQocHJpdiwgcm91dGUtPnNvdXJjZV9wYWQpXTsNCj4+Pj4+Pj4gICAgICsgICAgICAg
ICAgaWYgKCF0eHBvcnQpDQo+Pj4+Pj4+ICAgICArICAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7DQo+Pj4+Pj4+ICAgICArDQo+Pj4+Pj4+ICAgICArICAgICAgICAgIHJ4X2RhdGFbbnBv
cnRdLnR4X3BvcnQgPSB1Yjk2MF9wYWRfdG9fcG9ydChwcml2LCByb3V0ZS0+c291cmNlX3BhZCk7
DQo+Pj4+Pj4+ICAgICArDQo+Pj4+Pj4+ICAgICArICAgICAgICAgIHJ4X2RhdGFbbnBvcnRdLm51
bV9zdHJlYW1zKys7DQo+Pj4+Pj4+ICAgICArDQo+Pj4+Pj4+ICAgICArICAgICAgICAgIC8qIEZv
ciB0aGUgcmVzdCwgd2UgYXJlIG9ubHkgaW50ZXJlc3RlZCBpbiBwYXJhbGxlbCBidXNzZXMgKi8N
Cj4+Pj4+Pj4gICAgICsgICAgICAgICAgaWYgKHJ4cG9ydC0+cnhfbW9kZSA9PSBSWFBPUlRfTU9E
RV9DU0kyX1NZTkMgfHwNCj4+Pj4+Pj4gICAgICsgICAgICAgICAgICAgIHJ4cG9ydC0+cnhfbW9k
ZSA9PSBSWFBPUlRfTU9ERV9DU0kyX0FTWU5DKQ0KPj4+Pj4+PiAgICAgKyAgICAgICAgICAgICAg
ICAgIGNvbnRpbnVlOw0KPj4+Pj4+PiAgICAgKw0KPj4+Pj4+PiAgICAgKyAgICAgICAgICBpZiAo
cnhfZGF0YVtucG9ydF0ubnVtX3N0cmVhbXMgPiAyKQ0KPj4+Pj4+PiAgICAgKyAgICAgICAgICAg
ICAgICAgIHJldHVybiAtRVBJUEU7DQo+Pj4+Pj4+ICAgICArDQo+Pj4+Pj4+ICAgICArICAgICAg
ICAgIGZtdCA9IHY0bDJfc3ViZGV2X3N0YXRlX2dldF9zdHJlYW1fZm9ybWF0KHN0YXRlLA0KPj4+
Pj4+PiAgICAgKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByb3V0ZS0+c2lua19wYWQsDQo+Pj4+Pj4+ICAgICArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJvdXRlLT5zaW5rX3N0cmVhbSk7DQo+Pj4+
Pj4+ICAgICArICAgICAgICAgIGlmICghZm10KQ0KPj4+Pj4+PiAgICAgKyAgICAgICAgICAgICAg
ICAgIHJldHVybiAtRVBJUEU7DQo+Pj4+Pj4+ICAgICArDQo+Pj4+Pj4+ICAgICArICAgICAgICAg
IHViOTYwX2ZtdCA9IHViOTYwX2ZpbmRfZm9ybWF0KGZtdC0+Y29kZSk7DQo+Pj4+Pj4+ICAgICAr
ICAgICAgICAgIGlmICghdWI5NjBfZm10KQ0KPj4+Pj4+PiAgICAgKyAgICAgICAgICAgICAgICAg
IHJldHVybiAtRVBJUEU7DQo+Pj4+Pj4+ICAgICArDQo+Pj4+Pj4+ICAgICArICAgICAgICAgIGlm
ICh1Yjk2MF9mbXQtPm1ldGEpIHsNCj4+Pj4+Pj4gICAgICsgICAgICAgICAgICAgICAgICBpZiAo
Zm10LT5oZWlnaHQgPiAzKSB7DQo+Pj4+Pj4+ICAgICArICAgICAgICAgICAgICAgICAgICAgICAg
ICBkZXZfZXJyKCZwcml2LT5jbGllbnQtPmRldiwNCj4+Pj4+Pj4gICAgICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgInJ4JXU6IHVuc3VwcG9ydGVkIG1ldGFkYXRhIGhlaWdodCAl
dVxuIiwNCj4+Pj4+Pj4gICAgICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnBv
cnQsIGZtdC0+aGVpZ2h0KTsNCj4+Pj4+Pj4gICAgICsgICAgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiAtRVBJUEU7DQo+Pj4+Pj4+ICAgICArICAgICAgICAgICAgICAgICAgfQ0KPj4+Pj4+
PiAgICAgKw0KPj4+Pj4+PiAgICAgKyAgICAgICAgICAgICAgICAgIHJ4X2RhdGFbbnBvcnRdLm1l
dGFfZHQgPSB1Yjk2MF9mbXQtPmRhdGF0eXBlOw0KPj4+Pj4+PiAgICAgKyAgICAgICAgICAgICAg
ICAgIHJ4X2RhdGFbbnBvcnRdLm1ldGFfbGluZXMgPSBmbXQtPmhlaWdodDsNCj4+Pj4+Pj4gICAg
ICsgICAgICAgICAgfSBlbHNlIHsNCj4+Pj4+Pj4gICAgICsgICAgICAgICAgICAgICAgICByeF9k
YXRhW25wb3J0XS5waXhlbF9kdCA9IHViOTYwX2ZtdC0+ZGF0YXR5cGU7DQo+Pj4+Pj4+ICAgICAr
ICAgICAgICAgIH0NCj4+Pj4+Pj4gICAgICsgIH0NCj4+Pj4+Pj4gICAgICsNCj4+Pj4+Pj4gICAg
ICsgIC8qIENvbmZpZ3VyZSBSWCBwb3J0cyAqLw0KPj4+Pj4+PiAgICAgKw0KPj4+Pj4+PiAgICAg
KyAgZndkX2N0bCA9IDA7DQo+Pj4+Pj4NCj4+Pj4+PiBIZWxsbywgSSBoYXZlIG9ubHkgdXNlZCB0
aGUgZmlyc3QgUlggcG9ydCBpbiBteSBzZXR1cCAoZHM5MHViOTMzIHRvIGRzOTB1Yjk2NCkuIFRo
ZSBsb2dpYyBmb3IgYWN0aXZhdGluZy9kZWFjdGl2YXRpbmcgdGhlIFJ4IHBvcnRzIGRpZCBub3Qg
d29yayBmb3IgbWUuIE15IHN1Z2dlc3Rpb24gaXM6DQo+Pj4+Pj4NCj4+Pj4+IFdoeSBkb2Vzbid0
IGl0IHdvcms/IFdoYXQgaGFwcGVucz8NCj4+Pj4+DQo+Pj4+PiAgICBUb21pDQo+Pj4+DQo+Pj4+
IEhlbGxvIFRvbWksDQo+Pj4+DQo+Pj4+IHRoZSBwb3J0IHJ4MCB3aGljaCBJIG5lZWQgd2FzIGRp
c2FibGVkIGFuZCB0aGUgb3RoZXIgcG9ydHMgcngxIHRvIHJ4MyB3ZXJlIGVuYWJsZWQuIEluIG90
aGVyIHdvcmRzLCB0aGUgZXhhY3QgaW52ZXJzZSBvZiB0aGUgcmVxdWlyZWQgc2VsZWN0aW9uLg0K
Pj4+Pg0KPj4+Pj4+PiAgICArICAgICAgICAgICAgICAgIC8qIEZvcndhcmRpbmcgKi8NCj4+Pj4+
Pj4gICAgKw0KPj4+Pj4+PiAgICArICAgICAgICAgICAgICAgIGZ3ZF9jdGwgfD0gQklUKDQgKyBu
cG9ydCk7IC8qIGZvcndhcmQgZGlzYWJsZSAqLw0KPj4+PiBBY2NvcmRpbmcgdG8gdGhlIGRhdGEg
c2hlZXQsIGEgc2V0IGJpdDQtNyBpbiBmd2RfY3RsIG1lYW5zIHRoYXQgdGhlIGNoYW5uZWwgaXMg
ZGlzYWJsZWQuIFNvIHRoZSBjb21tZW50ICdmb3J3YXJkIGRpc2FibGUnIGlzIGNvcnJlY3QuIFdo
aWxlIGRlYnVnZ2luZywgaG93ZXZlciwgdGhpcyBjb2RlIHdhcyBvbmx5IHJlYWNoZWQgZm9yIHRo
ZSBwb3J0cyB0byBiZSBlbmFibGVkIGJ1dCBub3QgZm9yIHRoZSBvbmVzIHdoaWNoIHNob3VsZCBi
ZSBkaXNhYmxlZC4NCj4+DQo+Pj4gVGhpcyBpcyBqdXN0IGEgc2V0dXAgcGhhc2UsIHdoZXJlIHdl
IGluaXRpYWxpemUgdGhlIHJlZ2lzdGVycyBmb3IgdGhlIHBvcnRzIHdlIHdhbnQgdG8gdXNlLiBU
aGUgZm9yd2FyZGluZyBpcyB0aGVuIGVuYWJsZWQgbGF0ZXIsIGluIHViOTYwX2VuYWJsZV9yeF9w
b3J0LCBhbmQgZXZlbiBsYXRlciBkaXNhYmxlZCBpbiB1Yjk2MF9kaXNhYmxlX3J4X3BvcnQuDQo+
Pg0KPj4gVGhhbmsgeW91IGZvciB0aGUgY2xhcmlmaWNhdGlvbi4gSSBoYWQgbWlzaW50ZXJwcmV0
ZWQgdGhlIGludGVudGlvbiBvZiB0aGUgY29kZSBoZXJlLg0KPj4NCj4+PiBUaGlzIGFzc3VtZXMg
dGhhdCB0aGUgZm9yd2FyZGluZyBpcyBkaXNhYmxlZCBpbiB0aGUgcmVnaXN0ZXJzIGJ5IGRlZmF1
bHQgKHdoaWNoIGl0IGlzIGluIFVCOTYwKS4NCj4+Pg0KPj4+IEkgbmVlZCB0byB0cnkgdGhpcyBv
biBteSBIVyB0byB2ZXJpZnkgbXkgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0LCBidXQgbG9va2lu
ZyBhdCB0aGUgY29kZSwgaXQgaXMgaW5kZWVkIGEgYml0IGJ1Z2d5Lg0KPj4+DQo+Pj4gQXQgdGhp
cyBzZXR1cCBwaGFzZSB3ZSBkaXNhYmxlIHRoZSBmb3J3YXJkaW5nIGZvciBwb3J0cyB3ZSdsbCB1
c2UsIGFuZCBlbmFibGUgdGhlIGZvcndhcmRpbmcgZm9yIHBvcnRzIHdlIGRvbid0IHVzZSAod2hp
Y2ggZG9lc24ndCBtYWtlIHNlbnNlKS4NCj4+PiBMYXRlciwgd2hlbiB0aGUgc3RyZWFtaW5nIGlz
IHN0YXJ0ZWQgZm9yIHRoYXQgcG9ydCwgd2UgZW5hYmxlIHRoZSBmb3J3YXJkaW5nLiBTbyBoZXJl
IHdlIHNob3VsZCBqdXN0IGFsd2F5cyBkaXNhYmxlIHRoZSBmb3J3YXJkaW5nIGZvciBhbGwgcG9y
dHMuDQo+Pj4NCj4+DQo+PiBUaGUgdW51c2VkIFJ4IHBvcnRzIHdlcmUgbm90IGRpc2FibGVkIGlu
IG15IHRlc3RzLiBEaXNhYmxpbmcgYWxsIHBvcnRzIGhlcmUgc2hvdWxkIGFsc28gd29yayBmb3Ig
bXkgc2V0dXAuDQo+Pg0KPj4+IFNheWluZyAiZGlzYWJsZSB0aGUgZm9yd2FyZGluZyIgaXMgcGVy
aGFwcyBhIGJpdCBjb25mdXNpbmcgaGVyZSwgYXMgdGhlIHRoZQ0KPiBmb3J3YXJkaW5nIHNob3Vs
ZCBhbHJlYWR5IGJlIGRpc2FibGVkIGluIHRoZSBIVyBoZXJlIGFueXdheS4gQnV0IGFzIHdlIHdy
aXRlDQo+IHRoZSBVQjk2MF9TUl9GV0RfQ1RMMSwgd2UgbmVlZCB0byBzZXQgdGhhdCBiaXQuDQo+
Pj4NCj4+PiBTby4gWW91IHNob3VsZCBzZWUgdGhlIHJ4MCBnZXR0aW5nIGVuYWJsZWQgKGxhdGVy
LCBpbiB1Yjk2MF9lbmFibGVfcnhfcG9ydCksDQo+IGFuZCBJJ20gY3VyaW91cyB3aHkgeW91IGRv
bid0IHNlZSB0aGF0Lg0KPj4NCj4+IEkgd2lsbCBoYXZlIGFub3RoZXIgbG9vayBhdCB0aGF0IG5l
eHQgd2Vlay4gSXQgY291bGQgd2VsbCBiZSB0aGF0IGluIHRoZSBlbmQgb25seQ0KPiB0aGUgZW5h
YmxlZCBidXQgdW51c2VkIHBvcnRzIGFyZSB0aGUgcHJvYmxlbS4NCj4gDQo+IFRoaXMgc2hvdWxk
IGZpeCB0aGUgaXNzdWU6DQo+IA0KPiBAIC0yNDg2LDcgKzI0ODgsNyBAQCBzdGF0aWMgaW50DQo+
IHViOTYwX2NvbmZpZ3VyZV9wb3J0c19mb3Jfc3RyZWFtaW5nKHN0cnVjdCB1Yjk2MF9kYXRhICpw
cml2LA0KPiANCj4gICAgICAgICAgLyogQ29uZmlndXJlIFJYIHBvcnRzICovDQo+IA0KPiAtICAg
ICAgIGZ3ZF9jdGwgPSAwOw0KPiArICAgICAgIGZ3ZF9jdGwgPSBHRU5NQVNLKDcsIDQpOw0KPiAN
Cj4gICAgICAgICAgZm9yIChucG9ydCA9IDA7IG5wb3J0IDwgcHJpdi0+aHdfZGF0YS0+bnVtX3J4
cG9ydHM7IG5wb3J0KyspIHsNCj4gICAgICAgICAgICAgICAgICBzdHJ1Y3QgdWI5NjBfcnhwb3J0
ICpyeHBvcnQgPSBwcml2LT5yeHBvcnRzW25wb3J0XTsgQEAgLTI1MzYsOA0KPiArMjUzOCw2IEBA
IHN0YXRpYyBpbnQgdWI5NjBfY29uZmlndXJlX3BvcnRzX2Zvcl9zdHJlYW1pbmcoc3RydWN0DQo+
IHViOTYwX2RhdGEgKnByaXYsDQo+IA0KPiAgICAgICAgICAgICAgICAgIC8qIEZvcndhcmRpbmcg
Ki8NCj4gDQo+IC0gICAgICAgICAgICAgICBmd2RfY3RsIHw9IEJJVCg0ICsgbnBvcnQpOyAvKiBm
b3J3YXJkIGRpc2FibGUgKi8NCj4gLQ0KPiAgICAgICAgICAgICAgICAgIGlmIChyeF9kYXRhW25w
b3J0XS50eF9wb3J0ID09IDEpDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBmd2RfY3RsIHw9
IEJJVChucG9ydCk7IC8qIGZvcndhcmQgdG8gVFgxICovDQo+ICAgICAgICAgICAgICAgICAgZWxz
ZQ0KPiANCg0KSGVsbG8gVG9taSwNCg0KeWVzLCB0aGlzIGRvZXMgZml4IHRoZSBpc3N1ZS4gSSB3
YXMgYWJsZSB0byB0ZXN0IGl0IHN1Y2Nlc3NmdWxseSB0b2RheSB3aXRoIG15IGhhcmR3YXJlIChk
czkwdWI5MzMgKyBkczkwdWI5NjQgKyBpLk1YOE1wbHVzKS4NCg0KVGhhbmtzIGFuZCByZWdhcmRz
LA0KTHVkd2lnDQo=
