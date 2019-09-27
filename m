Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8233C03E5
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2019 13:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbfI0LPu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Sep 2019 07:15:50 -0400
Received: from mail-eopbgr40109.outbound.protection.outlook.com ([40.107.4.109]:45795
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726179AbfI0LPu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 27 Sep 2019 07:15:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0In+tg+StK9BIy4t+RxRXyr0SXflCkvTv1GWAhC2UvsW8YsbmjEvkvJ8nRjySWfKDiNFX0AQN1ljHI48opQZbAhQIDx5ubYLrR4kJc74ze3gVUkEED2QsX00PJiMi+yLyVK2EB7xdnhEozqmsGUCYh69MJivSl/URUP3AnsGO3BVFunBS7vdVkNtSFuw9XRJozikJzKQK4W8IjHEOT1zEwkVDY9BKcnx4lY1tsw+Hmj9yLjuo4Nde3ux+HeR5PfxHr36Niy+wU3t/njzSwVOBNwxSyel3E+Cg8/QZkxUt8GObgee4vhK6SsVnAG67xzCvYsoW4YzRBP/pDBhm6LQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZHO4QN2Yon058Mn/K0er+xQATf46gdGIdVimILnO/8=;
 b=lgRznJQceIOQw4m+WeW8jU5BWGT+4dG4FP3e5CegQXo5mCJoHUWGwucXO71ChPyRbAlU1/FaC9ZAaHRJSaTgjjtWvRDBalOPGC1tlGv2DuSMgx1kXs6vx4qO551IGpcWZ1RMkc1DGuQOcz7X5MLcWEHYUqJ+hnu7EpYyrmJuwHWunGTj2Gias4xbHuOu8TiQ/1xlTMfGXLBO6S3/lkAaCRs4VKGUBmvsWWLJsExjjQmtOZ78z0Bc3auGD5OJsBqXuHerhUMC8Cu6FKRGnMLYsQINkF9JKd/4J4TVQm7kuPfIWwjUec15eyUv0N4sMk2bM6SViXNMFfWm+R1rLze/PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZHO4QN2Yon058Mn/K0er+xQATf46gdGIdVimILnO/8=;
 b=GRomStr8DRyqbiZv8g5lKoze5V2oRIwHEBc1Kukj2XmFeStfuOTxzexY3hIuS49fUGZ6x9i8q5iRrzzeUEBpZakX97+Z0PHP72hMWp5lqC/wBtOYEHpu0LhWLvuXpzXZOyIWRMv7XgRXXMehL6e6ZgkDUzyNIL/rmNPU9zlU4jo=
Received: from AM6PR0702MB3527.eurprd07.prod.outlook.com (52.133.24.149) by
 AM6PR0702MB3575.eurprd07.prod.outlook.com (52.133.17.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Fri, 27 Sep 2019 11:15:46 +0000
Received: from AM6PR0702MB3527.eurprd07.prod.outlook.com
 ([fe80::7497:742a:1167:30dc]) by AM6PR0702MB3527.eurprd07.prod.outlook.com
 ([fe80::7497:742a:1167:30dc%6]) with mapi id 15.20.2305.013; Fri, 27 Sep 2019
 11:15:46 +0000
From:   "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] i2c: i801: Bring back Block Process Call support for
 certain platforms
Thread-Topic: [PATCH] i2c: i801: Bring back Block Process Call support for
 certain platforms
Thread-Index: AQHVdSQCyfoRzmtNCUS/Z+b9Fx2Hj6c/X4OA
Date:   Fri, 27 Sep 2019 11:15:46 +0000
Message-ID: <1ab328d1-a75d-e8b6-5652-4e4cfbcf320a@nokia.com>
References: <20190927110911.23045-1-jarkko.nikula@linux.intel.com>
In-Reply-To: <20190927110911.23045-1-jarkko.nikula@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.167]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
x-clientproxiedby: HE1PR0402CA0053.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::42) To AM6PR0702MB3527.eurprd07.prod.outlook.com
 (2603:10a6:209:11::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc11eda1-6fb2-42be-e665-08d7433c0b12
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: AM6PR0702MB3575:
x-microsoft-antispam-prvs: <AM6PR0702MB3575B5F1842812F78D154A1188810@AM6PR0702MB3575.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:541;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(199004)(189003)(71190400001)(58126008)(486006)(31696002)(71200400001)(2616005)(476003)(3846002)(256004)(14454004)(446003)(11346002)(478600001)(99286004)(6246003)(4326008)(76176011)(86362001)(52116002)(186003)(31686004)(6512007)(7736002)(2501003)(305945005)(36756003)(6436002)(6486002)(81166006)(64756008)(66476007)(66556008)(81156014)(5660300002)(66946007)(66446008)(8676002)(8936002)(229853002)(25786009)(102836004)(53546011)(6506007)(6116002)(2906002)(386003)(316002)(26005)(110136005)(54906003)(66066001)(65956001)(65806001);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR0702MB3575;H:AM6PR0702MB3527.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a+RDapjfb3GzPQJH70HkO/id9dCvIkBkazr86VyX3iq2uOd0mBT0eVpJwcpo53oYntBNuetsRUkIIFFahEs/opbyYcW+d8vo9xB1/JuD4T1etEw6HvYZgpnJ9SXNg/mG8LDlaX2Bk7Wf2s/gxgcS2NpUo+LXxo9zVBxNJpqg2eIMq93LyFBDCuIcCxd0TSFLWHmY3Qj1TwaE8QgMBIGFyVGfsReA13yGIP6wNC5Vfc6iEVD0m0GCzQoYXUL0UsLqSMghf7HSnAgqYG90xD5K3lW42AuCfwCRiV89pcpS0+m6gFyoDrYR2hTn78OeAQkbSKJkTn4KBoyYaRmO0mBeRIJJYlqgLXpqz26CaqgHpEzPv790NCgGL7S1VUmQWWjjUD88uydGWJhDuwCvnkc5kQ/UmypIhcAxaG70LAdLvKQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CACDBA10EACC1E4197F3819917B19CCC@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc11eda1-6fb2-42be-e665-08d7433c0b12
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 11:15:46.0760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Gz6NIGkhbMmVGAFXjJJ7vVFfTvQtKeHnCfsl2M+tP6MH7giAxDlMK9y04UD30wgZq2VgijUxE9QlUHPzOhWgjeRS3UVHxrjwcfgAAWIyCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0702MB3575
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

VGhhbmtzLCBKYXJra28hDQoNCk9uIDI3LzA5LzIwMTkgMTM6MDksIEphcmtrbyBOaWt1bGEgd3Jv
dGU6DQo+IENvbW1pdCBiODQzOThkNmQ3ZjkgKCJpMmM6IGk4MDE6IFVzZSBpVENPIHZlcnNpb24g
NiBpbiBDYW5ub24gTGFrZSBQQ0gNCj4gYW5kIGJleW9uZCIpIGxvb2tzIGxpa2UgdG8gZHJvcCBi
eSBhY2NpZGVudCBCbG9jayBXcml0ZS1CbG9jayBSZWFkIFByb2Nlc3MNCj4gQ2FsbCBzdXBwb3J0
IGZvciBJbnRlbCBTdW5yaXNlcG9pbnQsIExld2lzYnVyZywgRGVudmVydG9uIGFuZCBLYWJ5IExh
a2UuDQo+IA0KPiBUaGF0IHN1cHBvcnQgd2FzIGFkZGVkIGZvciBhYm92ZSBhbmQgbmV3ZXIgcGxh
dGZvcm1zIGJ5IHRoZSBjb21taXQNCj4gMzE1Y2Q2N2M5NDUzICgiaTJjOiBpODAxOiBBZGQgQmxv
Y2sgV3JpdGUtQmxvY2sgUmVhZCBQcm9jZXNzIENhbGwNCj4gc3VwcG9ydCIpIHNvIGJyaW5nIGl0
IGJhY2sgZm9yIGFib3ZlIHBsYXRmb3Jtcy4NCj4gDQo+IEZpeGVzOiBiODQzOThkNmQ3ZjkgKCJp
MmM6IGk4MDE6IFVzZSBpVENPIHZlcnNpb24gNiBpbiBDYW5ub24gTGFrZSBQQ0ggYW5kIGJleW9u
ZCIpDQoNClJldmlld2VkLWJ5OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxp
bkBub2tpYS5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogSmFya2tvIE5pa3VsYSA8amFya2tvLm5p
a3VsYUBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1p
ODAxLmMgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaTgwMS5jIGIvZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1pODAxLmMNCj4gaW5kZXggYTQ2MDhhMDQ3NDY4Li4xZmVkN2JmMDBhNmQgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaTgwMS5jDQo+ICsrKyBiL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtaTgwMS5jDQo+IEBAIC0xNzM2LDYgKzE3MzYsNyBAQCBzdGF0aWMgaW50
IGk4MDFfcHJvYmUoc3RydWN0IHBjaV9kZXYgKmRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2Vf
aWQgKmlkKQ0KPiAgCWNhc2UgUENJX0RFVklDRV9JRF9JTlRFTF9MRVdJU0JVUkdfU1NLVV9TTUJV
UzoNCj4gIAljYXNlIFBDSV9ERVZJQ0VfSURfSU5URUxfRE5WX1NNQlVTOg0KPiAgCWNhc2UgUENJ
X0RFVklDRV9JRF9JTlRFTF9LQUJZTEFLRV9QQ0hfSF9TTUJVUzoNCj4gKwkJcHJpdi0+ZmVhdHVy
ZXMgfD0gRkVBVFVSRV9CTE9DS19QUk9DOw0KPiAgCQlwcml2LT5mZWF0dXJlcyB8PSBGRUFUVVJF
X0kyQ19CTE9DS19SRUFEOw0KPiAgCQlwcml2LT5mZWF0dXJlcyB8PSBGRUFUVVJFX0lSUTsNCj4g
IAkJcHJpdi0+ZmVhdHVyZXMgfD0gRkVBVFVSRV9TTUJVU19QRUM7DQoNCi0tIA0KQmVzdCByZWdh
cmRzLA0KQWxleGFuZGVyIFN2ZXJkbGluLg0K
