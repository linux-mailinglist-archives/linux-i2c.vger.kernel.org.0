Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18E0B35E9CC
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 01:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhDMXpq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 19:45:46 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:40552 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbhDMXpq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 19:45:46 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0C1B9891AE;
        Wed, 14 Apr 2021 11:45:24 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618357524;
        bh=qZw7G5794U45odDYgXsJQj3C7TokmOE3AqJXkNep6PQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=okqi0jB/7T3WfYKXDbO13vTrY3E4kRC+F/hvn1lIG5NIbe3F066aa48yBBVqYJ3kc
         Ivl02fkesxrN1sfDbT9iIYjAqiTtt86LZZskkXCvg5TGip9Q+PMrAX7Wr2Tr3P90Oz
         C++Zo2DWY2w0mq9snsM98MsBQdR+4d0N0I7phHeE7yNmXYAJjjkiSMV9iUjQ6yfjIb
         msPtZ6LTNh53/lm9/gNrZLLHOzKOUV8p+sdRN3/lcKIl8RptawXoq8sdulAYZcXxp5
         egotgFNcjxUKO65V/6zGEQfjT3NYlt+S+0OmK78RmqMTgqQBhzoQaj014qBMKdEX33
         MLnCxqgi5cDjQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60762d130001>; Wed, 14 Apr 2021 11:45:23 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 14 Apr 2021 11:45:23 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Wed, 14 Apr 2021 11:45:23 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "wsa@kernel.org" <wsa@kernel.org>
Subject: Re: [PATCH v1 3/4] i2c: mpc: Use device_get_match_data() helper
Thread-Topic: [PATCH v1 3/4] i2c: mpc: Use device_get_match_data() helper
Thread-Index: AQHXMHKbbBJP2ejiokSgQrN6+3P23qqyVBSA
Date:   Tue, 13 Apr 2021 23:45:23 +0000
Message-ID: <40361b01-5325-e4e7-410e-35c96b08e0f9@alliedtelesis.co.nz>
References: <20210413143756.60138-1-andriy.shevchenko@linux.intel.com>
 <20210413143756.60138-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210413143756.60138-3-andriy.shevchenko@linux.intel.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA47C775D7C7E2418D3D89A7F386D38F@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=3YhXtTcJ-WEA:10 a=QyXUC8HyAAAA:8 a=6xEYI4xkx2HupiHu31AA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAxNC8wNC8yMSAyOjM3IGFtLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+IFVzZSB0aGUg
ZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkgaGVscGVyIGluc3RlYWQgb2Ygb3BlbiBjb2RpbmcuDQo+
DQo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tPg0KUmV2aWV3ZWQtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1A
YWxsaWVkdGVsZXNpcy5jby5uej4NCj4gLS0tDQo+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1t
cGMuYyB8IDEyICsrKystLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMv
aTJjLW1wYy5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYw0KPiBpbmRleCAyMzc2YWNj
ZDRlOGUuLmVjOWQ3ZDkzZTgwZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1tcGMuYw0KPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jDQo+IEBAIC0xOSw2
ICsxOSw3IEBADQo+ICAgI2luY2x1ZGUgPGxpbnV4L29mX2FkZHJlc3MuaD4NCj4gICAjaW5jbHVk
ZSA8bGludXgvb2ZfaXJxLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L29mX3BsYXRmb3JtLmg+DQo+
ICsjaW5jbHVkZSA8bGludXgvcHJvcGVydHkuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvc2xhYi5o
Pg0KPiAgIA0KPiAgICNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCj4gQEAgLTY0MywxMCArNjQ0LDkg
QEAgc3RhdGljIHN0cnVjdCBpMmNfYnVzX3JlY292ZXJ5X2luZm8gZnNsX2kyY19yZWNvdmVyeV9p
bmZvID0gew0KPiAgIAkucmVjb3Zlcl9idXMgPSBmc2xfaTJjX2J1c19yZWNvdmVyeSwNCj4gICB9
Ow0KPiAgIA0KPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXBjX2kyY19vZl9t
YXRjaFtdOw0KPiAgIHN0YXRpYyBpbnQgZnNsX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpvcCkNCj4gICB7DQo+IC0JY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAqbWF0Y2g7DQo+
ICsJY29uc3Qgc3RydWN0IG1wY19pMmNfZGF0YSAqZGF0YTsNCj4gICAJc3RydWN0IG1wY19pMmMg
KmkyYzsNCj4gICAJY29uc3QgdTMyICpwcm9wOw0KPiAgIAl1MzIgY2xvY2sgPSBNUENfSTJDX0NM
T0NLX0xFR0FDWTsNCj4gQEAgLTY1NSwxMCArNjU1LDYgQEAgc3RhdGljIGludCBmc2xfaTJjX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKm9wKQ0KPiAgIAlzdHJ1Y3QgY2xrICpjbGs7DQo+
ICAgCWludCBlcnI7DQo+ICAgDQo+IC0JbWF0Y2ggPSBvZl9tYXRjaF9kZXZpY2UobXBjX2kyY19v
Zl9tYXRjaCwgJm9wLT5kZXYpOw0KPiAtCWlmICghbWF0Y2gpDQo+IC0JCXJldHVybiAtRUlOVkFM
Ow0KPiAtDQo+ICAgCWkyYyA9IGRldm1fa3phbGxvYygmb3AtPmRldiwgc2l6ZW9mKCppMmMpLCBH
RlBfS0VSTkVMKTsNCj4gICAJaWYgKCFpMmMpDQo+ICAgCQlyZXR1cm4gLUVOT01FTTsNCj4gQEAg
LTcwOSw4ICs3MDUsOCBAQCBzdGF0aWMgaW50IGZzbF9pMmNfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqb3ApDQo+ICAgCQkJY2xvY2sgPSAqcHJvcDsNCj4gICAJfQ0KPiAgIA0KPiAtCWlm
IChtYXRjaC0+ZGF0YSkgew0KPiAtCQljb25zdCBzdHJ1Y3QgbXBjX2kyY19kYXRhICpkYXRhID0g
bWF0Y2gtPmRhdGE7DQo+ICsJZGF0YSA9IGRldmljZV9nZXRfbWF0Y2hfZGF0YSgmb3AtPmRldik7
DQo+ICsJaWYgKGRhdGEpIHsNCj4gICAJCWRhdGEtPnNldHVwKG9wLT5kZXYub2Zfbm9kZSwgaTJj
LCBjbG9jayk7DQo+ICAgCX0gZWxzZSB7DQo+ICAgCQkvKiBCYWNrd2FyZHMgY29tcGF0aWJpbGl0
eSAqLw==
