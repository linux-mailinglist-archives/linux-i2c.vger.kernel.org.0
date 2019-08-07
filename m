Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE5084CE1
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2019 15:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387982AbfHGNZu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Aug 2019 09:25:50 -0400
Received: from skedge04.snt-world.com ([91.208.41.69]:56622 "EHLO
        skedge04.snt-world.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387981AbfHGNZu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Aug 2019 09:25:50 -0400
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by skedge04.snt-world.com (Postfix) with ESMTPS id 85EE367F489;
        Wed,  7 Aug 2019 15:25:46 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
 (10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 7 Aug 2019
 15:25:46 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Wed, 7 Aug 2019 15:25:46 +0200
From:   Schrempf Frieder <frieder.schrempf@kontron.de>
To:     Alexander Stein <alexander.stein@mailbox.org>
CC:     Wolfram Sang <wsa@the-dreams.de>, Jean Delvare <jdelvare@suse.de>,
        "Jarkko Nikula" <jarkko.nikula@linux.intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Ajay Gupta <ajayg@nvidia.com>,
        Shreesha Rajashekar <shreesha.rajashekar@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Elie Morisse <syniurge@gmail.com>,
        Stefan Roese <sr@denx.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: imx: Allow the driver to be built for ARM64 SoCs
 such as i.MX8M
Thread-Topic: [PATCH] i2c: imx: Allow the driver to be built for ARM64 SoCs
 such as i.MX8M
Thread-Index: AQHVTRVrY8XY4w2l80SM63DeuQxTsKbvdjUAgAAVVYA=
Date:   Wed, 7 Aug 2019 13:25:45 +0000
Message-ID: <552fae9f-a28d-3dd4-c169-ab860180e794@kontron.de>
References: <20190807114332.13312-1-frieder.schrempf@kontron.de>
 <2445092.UF1PKDTzN1@ws-140106>
In-Reply-To: <2445092.UF1PKDTzN1@ws-140106>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7B35F894732B74CB18AF4C07EB70188@snt-world.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 85EE367F489.AFBBA
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: ajayg@nvidia.com, alexander.stein@mailbox.org,
        f.fainelli@gmail.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, jfi@ssv-embedded.de, kdasu.kdev@gmail.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, shreesha.rajashekar@broadcom.com, sr@denx.de,
        syniurge@gmail.com, vigneshr@ti.com, wsa@the-dreams.de
X-Spam-Status: No
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMDcuMDguMTkgMTQ6MDksIEFsZXhhbmRlciBTdGVpbiB3cm90ZToNCj4gT24gV2VkbmVzZGF5
LCBBdWd1c3QgNywgMjAxOSwgMTo0NDowNiBQTSBDRVNUIFNjaHJlbXBmIEZyaWVkZXIgd3JvdGU6
DQo+PiBGcm9tOiBGcmllZGVyIFNjaHJlbXBmIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+
DQo+Pg0KPj4gVGhlIGlteCBJMkMgY29udHJvbGxlciBpcyB1c2VkIGluIHNvbWUgQVJNNjQgU29D
cyBzdWNoIGFzIGkuTVg4TS4NCj4+IFRvIG1ha2UgdXNlIG9mIGl0LCBhcHBlbmQgQVJNNjQgdG8g
dGhlIGxpc3Qgb2YgZGVwZW5kZW5jaWVzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEZyaWVkZXIg
U2NocmVtcGYgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZT4NCj4+IC0tLQ0KPj4gICBkcml2
ZXJzL2kyYy9idXNzZXMvS2NvbmZpZyB8IDIgKy0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJj
L2J1c3Nlcy9LY29uZmlnIGIvZHJpdmVycy9pMmMvYnVzc2VzL0tjb25maWcNCj4+IGluZGV4IDA5
MzY3ZmMwMTRjMy4uNDZiNjUzNjIxNTEzIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9pMmMvYnVz
c2VzL0tjb25maWcNCj4+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9LY29uZmlnDQo+PiBAQCAt
NjY0LDcgKzY2NCw3IEBAIGNvbmZpZyBJMkNfSU1HDQo+PiAgIA0KPj4gICBjb25maWcgSTJDX0lN
WA0KPj4gICAJdHJpc3RhdGUgIklNWCBJMkMgaW50ZXJmYWNlIg0KPj4gLQlkZXBlbmRzIG9uIEFS
Q0hfTVhDIHx8IEFSQ0hfTEFZRVJTQ0FQRSB8fCBDT0xERklSRQ0KPj4gKwlkZXBlbmRzIG9uIEFS
Q0hfTVhDIHx8IEFSQ0hfTEFZRVJTQ0FQRSB8fCBDT0xERklSRSB8fCBBUk02NA0KPiANCj4gSSBk
b24ndCB0aGluayB0aGlzIHNob3VsZCBiZSBuZWNlc3NhcnkgYXQgYWxsIGFzIEFSQ0hfTVhDIGlz
IGFsc28gYXZhaWxhYmxlIGZvciBhcm02NCwgc2VlIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2FyY2gvYXJtNjQv
S2NvbmZpZy5wbGF0Zm9ybXMjbjE2Nw0KPiBJIHJhdGhlciB3b25kZXIgd2h5IEFSQ0hfTVhDIGlz
IG5vdCBzZXQuIFNhbWUgZm9yIGZlYy4NCg0KWW91J3JlIHJpZ2h0IG9mIGNvdXJzZS4gSSBzb21l
aG93IG1hbmFnZWQgdG8gbWVzcyB1cCBteSBkZWZjb25maWcuIEkgDQpzdGFydGVkIG92ZXIgd2l0
aCBhIGNsZWFuIGNvbmZpZyBmcm9tIGFyY2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcgYW5kIA0K
ZXZlcnl0aGluZyBzZWVtcyBmaW5lIG5vdy4gU29ycnkgZm9yIHRoZSBub2lzZS4NCg0KPiANCj4+
ICAgCWhlbHANCj4+ICAgCSAgU2F5IFkgaGVyZSBpZiB5b3Ugd2FudCB0byB1c2UgdGhlIElJQyBi
dXMgY29udHJvbGxlciBvbg0KPj4gICAJICB0aGUgRnJlZXNjYWxlIGkuTVgvTVhDLCBMYXllcnNj
YXBlIG9yIENvbGRGaXJlIHByb2Nlc3NvcnMuDQo+Pg0KPiANCj4gDQo+IA0KPiA=
