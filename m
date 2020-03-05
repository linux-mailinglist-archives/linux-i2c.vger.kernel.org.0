Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED85917B0FF
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Mar 2020 22:58:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgCEV6m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Mar 2020 16:58:42 -0500
Received: from mail-eopbgr80103.outbound.protection.outlook.com ([40.107.8.103]:59686
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725991AbgCEV6l (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Mar 2020 16:58:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jB6ikyIsmNIPQEwC3Iv7V2+BHyLhG5aGUtk8UJ2xll3mGJTIuTH/TzqebXmWqsDfVPKHc+Qb8oZoFe+xG6nftauR+nNmFRgxhCV5PPzEqcoUJ7leSonBqgBhmkzEWejjbsQ3C0rIf9rYNxKSCYV1dh7qrgL3rEC5khKLeETHB06x+6196zugjss+rd24MiHGFP8AFDLjsoXgtDlEUW3N3mWLdF493p8+Vk5MRjetY5iGrimGaeX0OvlJz8ECHtu99WNyAzIByqXaekpatokRLn4DG0O8xktmALFk/dmnv7L7jEqGAc/hfwvsjjYHLYvwme3RkVsnOJc0TPIyh6QCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5d/HqHpsjUD5apMBotUuVs5iRETSDC9gE5pWHVj9TBU=;
 b=h0CZz62m6f2QyyznIsdhMtc7G8UX2I7OKiunwPRzLunEZTwTgWc52AWBuhVE5bJubCfXQg9/ogO133QrcfOibnXBSkNMwHEtnzIoJ4hKDqDZv7vGAJTMZq1AZXpgK5bLF3yowUfhtp8ZhVxAIneGVbkhk4nFaahoAz3RfwimtcctfcB94DFSs6TwR7dW07gUgeJOsNjvxuF1m9JDAWvNGIP/2XlFKoGg2fDGYZkZnmQIEUIYvGs3c/niKPaetoRd6SOtK56fj+6q7PWOiIY2U7FQxWmWXlUPqwn1sLKBJ/ChYPHNhkjNIQ+RgZeS8mANMQUusLyR0DVC1Co7/1U4ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5d/HqHpsjUD5apMBotUuVs5iRETSDC9gE5pWHVj9TBU=;
 b=BSmggPHWcbh4YGrVwm69GUDV2++FFjZMn7orDqhWZn64iGLoB7T1YrrtcCOIp9tOjOeNi/VdezGaO/Vzd89tG8/QufaIjNkENDWwRltGQG1UXA6x1fMGen48eS28eq6303tT0UiWluOMtjJJBYZs2Y7vF44upfmXQCPRMYI1Ia0=
Received: from AM6PR0202MB3432.eurprd02.prod.outlook.com (52.133.11.29) by
 AM6PR0202MB3320.eurprd02.prod.outlook.com (52.133.10.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Thu, 5 Mar 2020 21:58:29 +0000
Received: from AM6PR0202MB3432.eurprd02.prod.outlook.com
 ([fe80::b033:bd0f:6ca3:ff71]) by AM6PR0202MB3432.eurprd02.prod.outlook.com
 ([fe80::b033:bd0f:6ca3:ff71%7]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 21:58:29 +0000
Received: from [192.168.13.3] (213.112.137.122) by HE1PR05CA0236.eurprd05.prod.outlook.com (2603:10a6:3:fb::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.15 via Frontend Transport; Thu, 5 Mar 2020 21:58:26 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 1/3] i2c: core: Provide generic definitions for bus
 frequencies
Thread-Topic: [PATCH v2 1/3] i2c: core: Provide generic definitions for bus
 frequencies
Thread-Index: AQHV7Wh1uDmtveRExUGIyGYzPhlJjKg6l5EA
Date:   Thu, 5 Mar 2020 21:58:29 +0000
Message-ID: <73b9a005-e4b1-5dbf-5769-ee0866ba8c4e@axentia.se>
References: <20200227122129.65516-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200227122129.65516-1-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
x-originating-ip: [213.112.137.122]
x-clientproxiedby: HE1PR05CA0236.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::12) To AM6PR0202MB3432.eurprd02.prod.outlook.com
 (2603:10a6:209:26::29)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83f02b7a-989d-461f-d76e-08d7c1505686
x-ms-traffictypediagnostic: AM6PR0202MB3320:
x-microsoft-antispam-prvs: <AM6PR0202MB33205DDD4075BEEED0B5AD3DBCE20@AM6PR0202MB3320.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03333C607F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(346002)(396003)(366004)(39830400003)(199004)(189003)(508600001)(956004)(2616005)(6486002)(16526019)(31696002)(86362001)(2906002)(8676002)(81156014)(81166006)(8936002)(31686004)(186003)(71200400001)(26005)(66946007)(66446008)(64756008)(66556008)(66476007)(5660300002)(52116002)(4326008)(53546011)(16576012)(316002)(110136005)(36756003)(41533002);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR0202MB3320;H:AM6PR0202MB3432.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8MJXaXO9IF91U6B+X97MU6RoC5qWXkn1gGnCJJ+3P1Uz+bYEnAVLQE2mXRfvq8F3DhNV9GPTRDmJFRZWem4JCiuIwjibqLtzWHw5XqOoZIoRKiMjsXrrKMS/RgFQ7xKPi6fmZ3Y5soEf6DUmkIk1zzr+M/f5f9xzeVWZffyeW2KdnwcIdyJOSfJwzYeCF/rs0PY1BJluOGDn1ZAt5lt1vXFjYGnLUd1e08bHp4qgl3+XnsOS9Es1x2Y6dXyK3OJnlsU+nObTg9iPirAnPgnZK7zRtW0QNl//nWl4S0dxOwkK0UCw95j2IWDKRvQHdq1ECC154KGspSZZCWHPPGOpieDuqsWohAZ7S6Al3T6sqZGtyG715sFqb7wPXB9ADvbZ3rQYLGCycKC7Wq4IHwHHuxuU9IuNSmgd7ngNzXHQYjzXvMLzMi0YQsVu54OVE32dc+AzoXuJSf9XydqL2M5hkGG0SWmVRjZx5kJCWNPRi8E6ShQDQqgBfzyl1rBOmmdQ
x-ms-exchange-antispam-messagedata: E6Eqf0N9ZbPb4AH2i4nTAPEGDxW++jZqPNCEJaFI3gE+EAIXP4/D3qpvMO8IlpNWkugtBh0yqxgfB+xSqn59Hzim3Agh9ZhpsFoFwhyZFPvJbrSQZx4eRbex3YKGkNzETYLUgeLX+LW1pT4YM92OEQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <86B913E90015374A97408C9CA45EF8E7@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f02b7a-989d-461f-d76e-08d7c1505686
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2020 21:58:29.1105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Iub4FHUzKDS2IRgjaPhlwHkOkNlSaIado745IxjNq7cKxFVbb3uwluPqecXqEpp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0202MB3320
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAyMC0wMi0yNyAxMzoyMSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiBUaGVyZSBhcmUg
ZmV3IG1heGltdW0gYnVzIGZyZXF1ZW5jaWVzIGJlaW5nIHVzZWQgaW4gdGhlIEnCskMgY29yZSBj
b2RlLg0KPiBQcm92aWRlIGdlbmVyaWMgZGVmaW5pdGlvbnMgZm9yIGJ1cyBmcmVxdWVuY2llcyBh
bmQgdXNlIHRoZW0gaW4gdGhlIGNvcmUuDQo+IA0KPiBUaGUgZHJpdmVycyBtYXkgdXNlIHByZWRl
ZmluZWQgY29uc3RhbnRzIHdoZXJlIGl0IGlzIGFwcHJvcHJpYXRlLg0KPiBTb21lIG9mIHRoZW0g
YXJlIGFscmVhZHkgdXNpbmcgdGhlc2UgdW5kZXIgc2xpZ2h0bHkgZGlmZmVyZW50IG5hbWVzLg0K
PiBXZSB3aWxsIGNvbnZlcnQgdGhlbSBsYXRlciB0byB1c2UgbmV3bHkgaW50cm9kdWNlZCBkZWZp
bmVzLg0KPiANCj4gVGhlc2UgZGVmaW5pdGlvbnMgd2lsbCBhbHNvIGhlbHAgdG8gYXZvaWQgdHlw
b3MgaW4gdGhlIG51bWJlcnMgdGhhdA0KPiBtYXkgbGVhZCB0byBzdWJ0bGUgZXJyb3JzLg0KPiAN
Cj4gQWNrZWQtYnk6IE1pa2EgV2VzdGVyYmVyZyA8bWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVs
LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5r
b0BsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiB2MjoNCj4gICBzdGFydGVkIHdpdGggYSBjb3Jl
IHBhdGNoDQo+ICAgdXNlZCBNQVggaW4gdGhlIGRlZmluaXRpb24gbmFtZXMNCj4gICBkcm9wcGVk
IEhaX1BFUl8qDQo+ICAgYWRkZWQgdGFnDQo+IA0KPiAgZHJpdmVycy9pMmMvaTJjLWNvcmUtYWNw
aS5jIHwgMiArLQ0KPiAgZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jIHwgOCArKysrLS0tLQ0K
PiAgaW5jbHVkZS9saW51eC9pMmMuaCAgICAgICAgIHwgOCArKysrKysrKw0KPiAgMyBmaWxlcyBj
aGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWFjcGkuYyBiL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWFj
cGkuYw0KPiBpbmRleCA4ZjNkYmM5N2EwNTcuLjc2NjU2ODVlM2NhOCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9pMmMvaTJjLWNvcmUtYWNwaS5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2kyYy1jb3Jl
LWFjcGkuYw0KPiBAQCAtMzE4LDcgKzMxOCw3IEBAIHN0YXRpYyBhY3BpX3N0YXR1cyBpMmNfYWNw
aV9sb29rdXBfc3BlZWQoYWNwaV9oYW5kbGUgaGFuZGxlLCB1MzIgbGV2ZWwsDQo+ICAJCWxvb2t1
cC0+bWluX3NwZWVkID0gbG9va3VwLT5zcGVlZDsNCj4gIA0KPiAgCWlmIChhY3BpX21hdGNoX2Rl
dmljZV9pZHMoYWRldiwgaTJjX2FjcGlfZm9yY2VfNDAwa2h6X2RldmljZV9pZHMpID09IDApDQo+
IC0JCWxvb2t1cC0+Zm9yY2Vfc3BlZWQgPSA0MDAwMDA7DQo+ICsJCWxvb2t1cC0+Zm9yY2Vfc3Bl
ZWQgPSBJMkNfTUFYX0ZBU1RfTU9ERV9GUkVROw0KPiAgDQo+ICAJcmV0dXJuIEFFX09LOw0KPiAg
fQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jIGIvZHJpdmVycy9p
MmMvaTJjLWNvcmUtYmFzZS5jDQo+IGluZGV4IGNlZmFkMDg4MTk0Mi4uOWIyOTcyYzdmYWEyIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMNCj4gKysrIGIvZHJpdmVy
cy9pMmMvaTJjLWNvcmUtYmFzZS5jDQo+IEBAIC0xNjEyLDEzICsxNjEyLDEzIEBAIHZvaWQgaTJj
X3BhcnNlX2Z3X3RpbWluZ3Moc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgaTJjX3RpbWluZ3Mg
KnQsIGJvb2wgdXNlX2RlDQo+ICANCj4gIAlyZXQgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF91MzIo
ZGV2LCAiY2xvY2stZnJlcXVlbmN5IiwgJnQtPmJ1c19mcmVxX2h6KTsNCj4gIAlpZiAocmV0ICYm
IHVzZV9kZWZhdWx0cykNCj4gLQkJdC0+YnVzX2ZyZXFfaHogPSAxMDAwMDA7DQo+ICsJCXQtPmJ1
c19mcmVxX2h6ID0gSTJDX01BWF9TVEFOREFSRF9NT0RFX0ZSRVE7DQo+ICANCj4gIAlyZXQgPSBk
ZXZpY2VfcHJvcGVydHlfcmVhZF91MzIoZGV2LCAiaTJjLXNjbC1yaXNpbmctdGltZS1ucyIsICZ0
LT5zY2xfcmlzZV9ucyk7DQo+ICAJaWYgKHJldCAmJiB1c2VfZGVmYXVsdHMpIHsNCj4gLQkJaWYg
KHQtPmJ1c19mcmVxX2h6IDw9IDEwMDAwMCkNCj4gKwkJaWYgKHQtPmJ1c19mcmVxX2h6IDw9IEky
Q19NQVhfU1RBTkRBUkRfTU9ERV9GUkVRKQ0KPiAgCQkJdC0+c2NsX3Jpc2VfbnMgPSAxMDAwOw0K
PiAtCQllbHNlIGlmICh0LT5idXNfZnJlcV9oeiA8PSA0MDAwMDApDQo+ICsJCWVsc2UgaWYgKHQt
PmJ1c19mcmVxX2h6IDw9IEkyQ19NQVhfRkFTVF9NT0RFX0ZSRVEpDQo+ICAJCQl0LT5zY2xfcmlz
ZV9ucyA9IDMwMDsNCj4gIAkJZWxzZQ0KPiAgCQkJdC0+c2NsX3Jpc2VfbnMgPSAxMjA7DQo+IEBA
IC0xNjI2LDcgKzE2MjYsNyBAQCB2b2lkIGkyY19wYXJzZV9md190aW1pbmdzKHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IGkyY190aW1pbmdzICp0LCBib29sIHVzZV9kZQ0KPiAgDQo+ICAJcmV0
ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMyKGRldiwgImkyYy1zY2wtZmFsbGluZy10aW1lLW5z
IiwgJnQtPnNjbF9mYWxsX25zKTsNCj4gIAlpZiAocmV0ICYmIHVzZV9kZWZhdWx0cykgew0KPiAt
CQlpZiAodC0+YnVzX2ZyZXFfaHogPD0gNDAwMDAwKQ0KPiArCQlpZiAodC0+YnVzX2ZyZXFfaHog
PD0gSTJDX01BWF9GQVNUX01PREVfRlJFUSkNCj4gIAkJCXQtPnNjbF9mYWxsX25zID0gMzAwOw0K
PiAgCQllbHNlDQo+ICAJCQl0LT5zY2xfZmFsbF9ucyA9IDEyMDsNCj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvaTJjLmggYi9pbmNsdWRlL2xpbnV4L2kyYy5oDQo+IGluZGV4IGY4MzQ2ODc5
ODlmNy4uZGY3MGM0OTNhZWQ1IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2kyYy5oDQo+
ICsrKyBiL2luY2x1ZGUvbGludXgvaTJjLmgNCj4gQEAgLTM5LDYgKzM5LDE0IEBAIGVudW0gaTJj
X3NsYXZlX2V2ZW50Ow0KPiAgdHlwZWRlZiBpbnQgKCppMmNfc2xhdmVfY2JfdCkoc3RydWN0IGky
Y19jbGllbnQgKmNsaWVudCwNCj4gIAkJCSAgICAgIGVudW0gaTJjX3NsYXZlX2V2ZW50IGV2ZW50
LCB1OCAqdmFsKTsNCj4gIA0KPiArLyogSTJDIEZyZXF1ZW5jeSBNb2RlcyAqLw0KPiArI2RlZmlu
ZSBJMkNfTUFYX1NUQU5EQVJEX01PREVfRlJFUQkxMDAwMDANCj4gKyNkZWZpbmUgSTJDX01BWF9G
QVNUX01PREVfRlJFUQkJNDAwMDAwDQo+ICsjZGVmaW5lIEkyQ19NQVhfRkFTVF9QTFVTX01PREVf
RlJFUQkxMDAwMDAwDQo+ICsjZGVmaW5lIEkyQ19NQVhfVFVSQk9fTU9ERV9GUkVRCQkxNDAwMDAw
DQo+ICsjZGVmaW5lIEkyQ19NQVhfSElHSF9TUEVFRF9NT0RFX0ZSRVEJMzQwMDAwMA0KPiArI2Rl
ZmluZSBJMkNfTUFYX1VMVFJBX1NQRUVEX01PREVfRlJFUQk1MDAwMDAwDQoNCkFtIEkgdGhlIG9u
bHkgb25lIHdobyBkbyAvbm90LyBmaW5kIHRoZXNlIG5hbWVzIHJlYWRhYmxlPyBJIGNhbid0IHNl
ZW0gdG8NCnJlbWVtYmVyIHdoYXQgZnJlcXVlbmN5IFRVUkJPLCBISUdILCBldGMgYXJlIGFuZCB0
aGVpciBvcmRlcmluZyBpcw0KZGlmZmljdWx0LiBJdCdzIGFsbCBzb3VuZHMgbGlrZSBtYXJrZXRp
bmcgYnV6eiB0byBtZSBhbmQgbXkgYnJhaW4gc2h1dHMNCm9mZiBpbnN0YW50bHkuDQoNClRoaXMg
ZmVlbHMgYSBsb3QgbGlrZSBtb3ZpbmcgYXdheSBmcm9tIG9jdGFsIHBlcm1pc3Npb25zIGZvciBm
aWxlcywgd2hpY2gNCmlzIGZyb3duZWQgdXBvbi4uLg0KDQpDYW4gd2UgaW5jbHVkZSBzb21lIGtp
bmQgb2YgaW5kaWNhdGlvbiBvZiB0aGUgYWN0dWFsIGZyZXF1ZW5jeSBpbiB0aGUNCm5hbWVzIGFz
IHdlbGwgcGxlYXNlPw0KDQpQZXJoYXBzIHNvbWV0aGluZyBsaWtlIEkyQ19NQVhfU1RBTkRBUkRf
TU9ERV8xMDBLSFo/DQoNCkNoZWVycywNClBldGVyDQoNCj4gKw0KPiAgc3RydWN0IG1vZHVsZTsN
Cj4gIHN0cnVjdCBwcm9wZXJ0eV9lbnRyeTsNCj4gIA0KPiANCg==
