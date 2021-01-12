Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36F602F2B60
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 10:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405927AbhALJd7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 04:33:59 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:31398 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405928AbhALJd7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jan 2021 04:33:59 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-13-HBs_pSLqOtmm_-BghNSOCQ-1; Tue, 12 Jan 2021 09:32:19 +0000
X-MC-Unique: HBs_pSLqOtmm_-BghNSOCQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 12 Jan 2021 09:32:19 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Tue, 12 Jan 2021 09:32:19 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Sowjanya Komatineni' <skomatineni@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v1] i2c: tegra: Fix i2c_writesl() to use writel() instead
 of writesl()
Thread-Topic: [PATCH v1] i2c: tegra: Fix i2c_writesl() to use writel() instead
 of writesl()
Thread-Index: AQHW6EDeq/yKQNYjeUCTCd50xXUD26ojuaww
Date:   Tue, 12 Jan 2021 09:32:19 +0000
Message-ID: <790fa75aaec146f0bb27703157c0e77a@AcuMS.aculab.com>
References: <1603166634-13639-1-git-send-email-skomatineni@nvidia.com>
 <20201020074846.GA1877013@ulmo>
 <538d8436-260d-40a8-b0a3-a822a0f9c909@nvidia.com>
 <c37f8618-5100-4087-3bc3-fe421d40f3b8@gmail.com>
 <2212a21b-7dff-4ba0-a193-badd5a1770c8@gmail.com>
 <6373bc13-a53d-2bb2-98f5-f6f01b0b8b69@nvidia.com>
In-Reply-To: <6373bc13-a53d-2bb2-98f5-f6f01b0b8b69@nvidia.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

RnJvbTogU293amFueWEgS29tYXRpbmVuaQ0KPiBTZW50OiAxMSBKYW51YXJ5IDIwMjEgMTc6MzgN
Ci4uLg0KPiBVc2luZyB3cml0ZXNsKCkgZm9yIGZpbGxpbmcgVFhfRklGTyBjYXVzaW5nIHNpbGVu
dCBoYW5nIGltbWVkaWF0ZSBvbiBhbnkNCj4gaTJjIHJlZ2lzdGVyIGFjY2VzcyBhZnRlciBmaWxs
aW5nIEZJRk8gd2l0aCA4IHdvcmRzIGFuZCBzb21lIHRpbWVzIHdpdGgNCj4gNiB3b3JkcyBhcyB3
ZWxsLg0KPiANCj4gU28gY291bGRuJ3QgSU5URVJSVVBUX1NUQVRVUyByZWdpc3RlcnMgdG8gY2hl
Y2sgZm9yIFRYIEZJRk8gT3ZlcmZsb3dzDQo+IHdoZW4gdGhpcyBzaWxlbnQgaGFuZyBoYXBwZW5z
Lg0KPiANCj4gVHJpZWQgdG8gcmVhZCB0aHJ1IGJhY2stZG9vciAoSlRBRyBwYXRoKSBidXQgY291
bGQgbm90IGNvbm5lY3QgdG8gSlRBRw0KPiBlaXRoZXIuIExvb2tzIGxpa2UgVGVncmEgY2hpcCBp
cyBpbiBzb21lIHdlaXJkIHN0YXRlLg0KPiANCj4gQnV0IHVzaW5nIHdyaXRlbCgpIGZvbGxvd2Vk
IGJ5IGkyY19yZWFkbCBoZWxwcy4gTm90IHN1cmUgaWYgYW55IHRoaW5nDQo+IHJlbGF0ZWQgdG8g
cmVnaXN0ZXIgYWNjZXNzIGRlbGF5IG9yIHNvbWUgb3RoZXIgaXNzdWUuDQoNCkhvdyBtdWNoIGRv
ZXMgdGhlIGkyY19yZWFkKCkgc2xvdyBkb3duIHRoZSB0cmFuc2Zlcj8NCklmIHRoZSBkZXZpY2Ug
aXMgUENJZSBpdCBpcyBwcm9iYWJseSBzaWduaWZpY2FudC4NCg0KSWYgdGhlIHVuZGVybHlpbmcg
cHJvYmxlbSBpcyB0aGF0IHRoZSBUZWdyYSBjaGlwIGNhbid0IGhhbmRsZQ0KYmFjayB0byBiYWNr
IHdyaXRlcyB0byB0aGUgdHggZmlmbyBtYXliZSB0aGVyZSBhcmUgb3RoZXIgc29sdXRpb25zIQ0K
MSkgU2VuZCBpdCBiYWNrIGFuZCBhc2sgZm9yIGEgd29ya2luZyBjaGlwIDotKQ0KMikgTWF5YmUg
YW4gaW50ZXJsZWF2ZWQgd3JpdGUgd2lsbCBzbG93IHRoaW5ncyBkb3duIGVub3VnaD8NCg0KSXQg
bWF5IGJlIHdvcnRoIHRlc3RpbmcgYmFjayB0byBiYWNrIHdyaXRlcyB0byBvdGhlciByZWdpc3Rl
cnMNCnRvIHNlZSBpZiBpdCBpcyBhIHByb2JsZW0gdGhhdCBpcyBzcGVjaWZpYyB0byB0aGUgdHgg
Zmlmby4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxl
eSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0
aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

