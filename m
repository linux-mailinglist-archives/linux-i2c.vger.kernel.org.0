Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9443F37EF2
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 22:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfFFUp5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 16:45:57 -0400
Received: from mail-eopbgr50118.outbound.protection.outlook.com ([40.107.5.118]:33036
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726875AbfFFUp5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 6 Jun 2019 16:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbeRTWr1O24Sl9iaAvq7f504Q+wpFP/ZhfFPd8lz5ec=;
 b=hJisxLS2taV7VlQX2JNb4JUAD9ToUJFwVTkvv6GuKFidAs26MLWKWp+hUTzU6ahCyqtgtZeOxN+BgfWlMWYj7A3ZnTTiqhGLyJDoPXBTTEkOlKKYH71CJRMRfu1qWtqhxY1Ym6r9IPh0+LdmOKmwOroB1CLf037/Z5sfBMOeVNQ=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3433.eurprd02.prod.outlook.com (52.134.70.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Thu, 6 Jun 2019 20:45:52 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::49ac:3a71:a3ec:d6bf%5]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 20:45:52 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
Subject: Re: [PATCH V4] drivers: i2c: tegra: fix checkpatch defects
Thread-Topic: [PATCH V4] drivers: i2c: tegra: fix checkpatch defects
Thread-Index: AQHVHDpwyItVqql7fkeBnaejnwwA46aPGS8A
Date:   Thu, 6 Jun 2019 20:45:52 +0000
Message-ID: <8df7648d-c5bd-7179-6368-66dab9b7fa39@axentia.se>
References: <1559806523-1352-1-git-send-email-bbiswas@nvidia.com>
In-Reply-To: <1559806523-1352-1-git-send-email-bbiswas@nvidia.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0701CA0083.eurprd07.prod.outlook.com
 (2603:10a6:3:64::27) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a21b851-dade-483d-8904-08d6eabff700
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3433;
x-ms-traffictypediagnostic: DB3PR0202MB3433:
x-microsoft-antispam-prvs: <DB3PR0202MB3433803F4789F7EA37583394BC170@DB3PR0202MB3433.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:854;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(396003)(136003)(346002)(366004)(376002)(189003)(199004)(316002)(6486002)(14454004)(64126003)(4326008)(14444005)(186003)(6436002)(7416002)(31696002)(256004)(26005)(476003)(68736007)(31686004)(2616005)(65826007)(99286004)(52116002)(6512007)(386003)(6506007)(102836004)(53546011)(76176011)(486006)(25786009)(446003)(229853002)(11346002)(66446008)(66556008)(64756008)(2906002)(508600001)(73956011)(86362001)(5660300002)(66946007)(81166006)(81156014)(66476007)(7736002)(66066001)(53936002)(65806001)(65956001)(8676002)(8936002)(71190400001)(71200400001)(6116002)(74482002)(54906003)(6246003)(110136005)(36756003)(58126008)(3846002)(305945005)(2201001)(2501003);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3433;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ekTSfQ9Pi0l2lPhHk/tnIMGR1nkIRr2zxP2kl213QIm3/6JEst3hTi8Eeohe53v+9tDg2kPlsEhAJATns4yclHswgXOFlgEyS9GQ+j2BOFRajFkT/CK8lxn7R7099jFGFJE9srDunByOcOe5s13Ji7pTiSkBoqCTEQ15neE1JOGDQfePckI2FYL5+EYjCaxD/cJvZbCR2UddcRq/jcG6d0MrWp15Z7VM3pmqOVr/9dbrg88BXDf90uN8l9+PVIFPWnieropTdwbZaDxRi+PGBZ+1Baql3d/iHy38NTO71eIMKHke94ketbpWSdxnti1CKyLc1yVOERSHTAQOM+9t+znpFYSsVYl6W7buXG589Zsi8r44ciSchSdfRX591jn7zSrdPe9+ZVk8yDYoCZeJRkiMdF1wnSlRvCnn8wvAld4=
Content-Type: text/plain; charset="utf-8"
Content-ID: <943E35E38B91464398F28017D5F4F6A1@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a21b851-dade-483d-8904-08d6eabff700
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 20:45:52.5533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peda@axentia.se
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3433
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0wNi0wNiAwOTozNSwgQml0YW4gQmlzd2FzIHdyb3RlOg0KPiBGaXggY2hlY2twYXRj
aC5wbCB3YXJuaW5nKHMpL2Vycm9yKHMpL2NoZWNrKHMpIGluIGkyYy10ZWdyYS5jDQo+IA0KPiBS
ZW1vdmUgcmVkdW5kYW50IEJVR19PTiBjYWxscyBvciByZXBsYWNlIHdpdGggV0FSTl9PTl9PTkNF
DQo+IGFzIG5lZWRlZC4gUmVwbGFjZSBCVUcoKSB3aXRoIGVycm9yIGhhbmRsaW5nIGNvZGUuDQo+
IERlZmluZSBJMkNfRVJSX1VORVhQRUNURURfU1RBVFVTIGZvciBlcnJvciBoYW5kbGluZy4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEJpdGFuIEJpc3dhcyA8YmJpc3dhc0BudmlkaWEuY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYyB8IDY3ICsrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDM3IGluc2Vy
dGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtdGVncmEuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYw0KPiBp
bmRleCA3NmI3OTI2Li41NWE1ZDg3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMv
aTJjLXRlZ3JhLmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy10ZWdyYS5jDQo+IEBA
IC03OCw2ICs3OCw3IEBADQo+ICAjZGVmaW5lIEkyQ19FUlJfTk9fQUNLCQkJCTB4MDENCj4gICNk
ZWZpbmUgSTJDX0VSUl9BUkJJVFJBVElPTl9MT1NUCQkweDAyDQo+ICAjZGVmaW5lIEkyQ19FUlJf
VU5LTk9XTl9JTlRFUlJVUFQJCTB4MDQNCj4gKyNkZWZpbmUgSTJDX0VSUl9VTkVYUEVDVEVEX1NU
QVRVUyAgICAgICAgICAgICAgIDB4MDgNCg0KVXNlIHRhYnMgbGlrZSB0aGUgdGhlIHN1cnJvdW5k
aW5nIGNvZGUuIEFuZCBwZXJoYXBzIGNvbnZlcnQgYWxsDQp0aGVzZSBmbGFncyB0byB1c2UgdGhl
IEJJVCgpIG1hY3JvPw0KDQo+ICANCj4gICNkZWZpbmUgUEFDS0VUX0hFQURFUjBfSEVBREVSX1NJ
WkVfU0hJRlQJMjgNCj4gICNkZWZpbmUgUEFDS0VUX0hFQURFUjBfUEFDS0VUX0lEX1NISUZUCQkx
Ng0KPiBAQCAtMTEyLDcgKzExMyw3IEBADQo+ICAjZGVmaW5lIEkyQ19DTEtFTl9PVkVSUklERQkJ
CTB4MDkwDQo+ICAjZGVmaW5lIEkyQ19NU1RfQ09SRV9DTEtFTl9PVlIJCQlCSVQoMCkNCj4gIA0K
PiAtI2RlZmluZSBJMkNfQ09ORklHX0xPQURfVElNRU9VVAkJCTEwMDAwMDANCj4gKyNkZWZpbmUg
STJDX0NPTkZJR19MT0FEX1RNT1VUCQkJMTAwMDAwMA0KDQpTaW1pbGFyIHRvIHhmZXJfdG0gYWxy
ZWFkeSBtZW50aW9uZWQgYnkgRG1pdHJ5OyBqdXN0IGtlZXAgaXQgYXMNCi4uLl9USU1FT1VUIGFu
ZCBpZ25vcmUgY2hlY2twYXRjaCBvbiB0aGlzIGlzc3VlLiBPciBqdWdnbGUgdGhlDQpjb2RlIGlu
IHNvbWUgb3RoZXIgd2F5IHRvIHBhY2lmeSBjaGVja3BhdGNoLiBFLmcuIGFiYnJldmlhdGUNCkNP
TkZJRyBpbnN0ZWFkPyBPciBzb21ldGhpbmcuIENPTkYgaXMgd2F5IGVhc2llciB0byByZWFkIHRo
YW4NClRNT1VUIElNSE8uLi4NCg0KQ2hlZXJzLA0KUGV0ZXINCg==
