Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B938525FC
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 10:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729503AbfFYIFO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 04:05:14 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:54065 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727705AbfFYIFN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jun 2019 04:05:13 -0400
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,415,1557212400"; 
   d="scan'208";a="40295037"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jun 2019 01:05:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Jun 2019 01:05:15 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 25 Jun 2019 01:05:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPtpqbILqCkHvj0cCIsvblV4Ujs4kfGwKiApPqwXVrE=;
 b=ZG1JZJcy9/qHMV4FkKqel1IOpzDkXBIpgqTeLtTUSIn5CIAmNPGgf/CzR7a03VeE7A7ZpZ5+VNROPLptKU/FBLPTpQ9L0usaLkMEaEL+oxxm0zE1BV2bwEC1eWbmcu5E3hoGoztD8RLbqSM7ULGPBjOTagnL24sCJVJhYmvlzy4=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1289.namprd11.prod.outlook.com (10.168.103.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 08:05:04 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322%9]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 08:05:03 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v2 7/9] i2c: at91: add support for analog filtering
Thread-Topic: [PATCH v2 7/9] i2c: at91: add support for analog filtering
Thread-Index: AQHVKyyxFUkNa/ZYyUGd5i25NVGhpQ==
Date:   Tue, 25 Jun 2019 08:05:03 +0000
Message-ID: <1561449642-26956-8-git-send-email-eugen.hristev@microchip.com>
References: <1561449642-26956-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1561449642-26956-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR10CA0105.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::34) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 696859fa-124f-4b92-8e0e-08d6f943d3ee
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1289;
x-ms-traffictypediagnostic: DM5PR11MB1289:
x-microsoft-antispam-prvs: <DM5PR11MB128904686B0C4D044B5E94B8E8E30@DM5PR11MB1289.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(39860400002)(366004)(396003)(346002)(189003)(199004)(6512007)(53936002)(86362001)(110136005)(6486002)(6436002)(2201001)(316002)(14454004)(2906002)(478600001)(72206003)(66556008)(5660300002)(64756008)(66946007)(66476007)(66446008)(256004)(71200400001)(71190400001)(36756003)(107886003)(305945005)(7736002)(6116002)(25786009)(73956011)(4326008)(3846002)(68736007)(446003)(11346002)(386003)(52116002)(76176011)(2501003)(99286004)(6506007)(486006)(476003)(2616005)(8676002)(66066001)(186003)(26005)(102836004)(50226002)(81166006)(8936002)(81156014)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1289;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cQBae6UjhoH0Mi+gG+RPBd+ZFxPaW7k8qoLnnqYYTo16EJBBzz4Pp8X8TKgrkKmATvmlwQIXNxvITlp8LRPE47TTfR3x64tvtXFEcI7lNetqr99fs1EK5OAth2gFOjBbsmhWEyBMo+8KF5SKpL2XTXyOqqsH4lRxbbEwn0KX2jxIi7pggLy+74168qZAwGMCSd4wdWtPFPIPKPcI4g9YKK0nc6SxLziKOZg80l+Zdai9PW565FepymI7d8R4Y3YB3Wv/p8m601tdffc/bwH6uYXOAciKiHkBfKmU7o7Zej9U4eSqi1H4tDTFFeNGZytzU9CxMfNzR0prgTtK5M/sFdSVmLX9Aa08aI0j/14xim9OCrOqIvzi+pLLjK98Ci33u0pPjq2zEivDEB4drT22UjnbmDyx/3lJlDsPiYvvAaE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 696859fa-124f-4b92-8e0e-08d6f943d3ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 08:05:03.8790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1289
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

RnJvbTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KDQpBZGQg
c3VwcG9ydCBmb3IgYW5hbG9nIGZpbHRlcmluZyBmb3IgaTJjIGxpbmVzLg0KVGhlIHNhbWE1ZDIg
YW5kIHNhbTl4NjAgc3VwcG9ydCB0aGlzIGZlYXR1cmUuDQoNClNpZ25lZC1vZmYtYnk6IEV1Z2Vu
IEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9jaGlwLmNvbT4NCi0tLQ0KIGRyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtYXQ5MS1jb3JlLmMgICB8ICA5ICsrKysrKysrKw0KIGRyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuYyB8IDE3ICsrKysrKysrKysrKystLS0tDQogZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1hdDkxLmggICAgICAgIHwgIDQgKysrKw0KIDMgZmlsZXMgY2hhbmdlZCwg
MjYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtYXQ5MS1jb3JlLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEt
Y29yZS5jDQppbmRleCAzYmJlMzdjLi5kMjg0MGJhIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1hdDkxLWNvcmUuYw0KKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkx
LWNvcmUuYw0KQEAgLTcwLDYgKzcwLDcgQEAgc3RhdGljIHN0cnVjdCBhdDkxX3R3aV9wZGF0YSBh
dDkxcm05MjAwX2NvbmZpZyA9IHsNCiAJLmhhc19ob2xkX2ZpZWxkID0gZmFsc2UsDQogCS5oYXNf
ZGlnX2ZpbHRyID0gZmFsc2UsDQogCS5oYXNfYWR2X2RpZ19maWx0ciA9IGZhbHNlLA0KKwkuaGFz
X2FuYV9maWx0ciA9IGZhbHNlLA0KIH07DQogDQogc3RhdGljIHN0cnVjdCBhdDkxX3R3aV9wZGF0
YSBhdDkxc2FtOTI2MV9jb25maWcgPSB7DQpAQCAtODAsNiArODEsNyBAQCBzdGF0aWMgc3RydWN0
IGF0OTFfdHdpX3BkYXRhIGF0OTFzYW05MjYxX2NvbmZpZyA9IHsNCiAJLmhhc19ob2xkX2ZpZWxk
ID0gZmFsc2UsDQogCS5oYXNfZGlnX2ZpbHRyID0gZmFsc2UsDQogCS5oYXNfYWR2X2RpZ19maWx0
ciA9IGZhbHNlLA0KKwkuaGFzX2FuYV9maWx0ciA9IGZhbHNlLA0KIH07DQogDQogc3RhdGljIHN0
cnVjdCBhdDkxX3R3aV9wZGF0YSBhdDkxc2FtOTI2MF9jb25maWcgPSB7DQpAQCAtOTAsNiArOTIs
NyBAQCBzdGF0aWMgc3RydWN0IGF0OTFfdHdpX3BkYXRhIGF0OTFzYW05MjYwX2NvbmZpZyA9IHsN
CiAJLmhhc19ob2xkX2ZpZWxkID0gZmFsc2UsDQogCS5oYXNfZGlnX2ZpbHRyID0gZmFsc2UsDQog
CS5oYXNfYWR2X2RpZ19maWx0ciA9IGZhbHNlLA0KKwkuaGFzX2FuYV9maWx0ciA9IGZhbHNlLA0K
IH07DQogDQogc3RhdGljIHN0cnVjdCBhdDkxX3R3aV9wZGF0YSBhdDkxc2FtOWcyMF9jb25maWcg
PSB7DQpAQCAtMTAwLDYgKzEwMyw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEgYXQ5
MXNhbTlnMjBfY29uZmlnID0gew0KIAkuaGFzX2hvbGRfZmllbGQgPSBmYWxzZSwNCiAJLmhhc19k
aWdfZmlsdHIgPSBmYWxzZSwNCiAJLmhhc19hZHZfZGlnX2ZpbHRyID0gZmFsc2UsDQorCS5oYXNf
YW5hX2ZpbHRyID0gZmFsc2UsDQogfTsNCiANCiBzdGF0aWMgc3RydWN0IGF0OTFfdHdpX3BkYXRh
IGF0OTFzYW05ZzEwX2NvbmZpZyA9IHsNCkBAIC0xMTAsNiArMTE0LDcgQEAgc3RhdGljIHN0cnVj
dCBhdDkxX3R3aV9wZGF0YSBhdDkxc2FtOWcxMF9jb25maWcgPSB7DQogCS5oYXNfaG9sZF9maWVs
ZCA9IGZhbHNlLA0KIAkuaGFzX2RpZ19maWx0ciA9IGZhbHNlLA0KIAkuaGFzX2Fkdl9kaWdfZmls
dHIgPSBmYWxzZSwNCisJLmhhc19hbmFfZmlsdHIgPSBmYWxzZSwNCiB9Ow0KIA0KIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlX2lkIGF0OTFfdHdpX2RldnR5cGVzW10gPSB7DQpA
QCAtMTQyLDYgKzE0Nyw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEgYXQ5MXNhbTl4
NV9jb25maWcgPSB7DQogCS5oYXNfaG9sZF9maWVsZCA9IGZhbHNlLA0KIAkuaGFzX2RpZ19maWx0
ciA9IGZhbHNlLA0KIAkuaGFzX2Fkdl9kaWdfZmlsdHIgPSBmYWxzZSwNCisJLmhhc19hbmFfZmls
dHIgPSBmYWxzZSwNCiB9Ow0KIA0KIHN0YXRpYyBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEgc2FtYTVk
NF9jb25maWcgPSB7DQpAQCAtMTUyLDYgKzE1OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXQ5MV90d2lf
cGRhdGEgc2FtYTVkNF9jb25maWcgPSB7DQogCS5oYXNfaG9sZF9maWVsZCA9IHRydWUsDQogCS5o
YXNfZGlnX2ZpbHRyID0gdHJ1ZSwNCiAJLmhhc19hZHZfZGlnX2ZpbHRyID0gZmFsc2UsDQorCS5o
YXNfYW5hX2ZpbHRyID0gZmFsc2UsDQogfTsNCiANCiBzdGF0aWMgc3RydWN0IGF0OTFfdHdpX3Bk
YXRhIHNhbWE1ZDJfY29uZmlnID0gew0KQEAgLTE2Miw2ICsxNjksNyBAQCBzdGF0aWMgc3RydWN0
IGF0OTFfdHdpX3BkYXRhIHNhbWE1ZDJfY29uZmlnID0gew0KIAkuaGFzX2hvbGRfZmllbGQgPSB0
cnVlLA0KIAkuaGFzX2RpZ19maWx0ciA9IHRydWUsDQogCS5oYXNfYWR2X2RpZ19maWx0ciA9IHRy
dWUsDQorCS5oYXNfYW5hX2ZpbHRyID0gdHJ1ZSwNCiB9Ow0KIA0KIHN0YXRpYyBzdHJ1Y3QgYXQ5
MV90d2lfcGRhdGEgc2FtOXg2MF9jb25maWcgPSB7DQpAQCAtMTcyLDYgKzE4MCw3IEBAIHN0YXRp
YyBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEgc2FtOXg2MF9jb25maWcgPSB7DQogCS5oYXNfaG9sZF9m
aWVsZCA9IHRydWUsDQogCS5oYXNfZGlnX2ZpbHRyID0gdHJ1ZSwNCiAJLmhhc19hZHZfZGlnX2Zp
bHRyID0gdHJ1ZSwNCisJLmhhc19hbmFfZmlsdHIgPSB0cnVlLA0KIH07DQogDQogc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgYXRtZWxfdHdpX2R0X2lkc1tdID0gew0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuYyBiL2RyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuYw0KaW5kZXggZDgyNjAxYi4uOGZlM2EyYyAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuYw0KKysrIGIvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1hdDkxLW1hc3Rlci5jDQpAQCAtMzIsNiArMzIsNyBAQA0KIHZvaWQgYXQ5
MV9pbml0X3R3aV9idXNfbWFzdGVyKHN0cnVjdCBhdDkxX3R3aV9kZXYgKmRldikNCiB7DQogCXN0
cnVjdCBhdDkxX3R3aV9wZGF0YSAqcGRhdGEgPSBkZXYtPnBkYXRhOw0KKwl1MzIgZmlsdHIgPSAw
Ow0KIA0KIAkvKiBGSUZPIHNob3VsZCBiZSBlbmFibGVkIGltbWVkaWF0ZWx5IGFmdGVyIHRoZSBz
b2Z0d2FyZSByZXNldCAqLw0KIAlpZiAoZGV2LT5maWZvX3NpemUpDQpAQCAtNDIsMTMgKzQzLDE5
IEBAIHZvaWQgYXQ5MV9pbml0X3R3aV9idXNfbWFzdGVyKHN0cnVjdCBhdDkxX3R3aV9kZXYgKmRl
dikNCiANCiAJLyogZW5hYmxlIGRpZ2l0YWwgZmlsdGVyICovDQogCWlmIChwZGF0YS0+aGFzX2Rp
Z19maWx0ciAmJiBkZXYtPmVuYWJsZV9kaWdfZmlsdCkNCi0JCWF0OTFfdHdpX3dyaXRlKGRldiwg
QVQ5MV9UV0lfRklMVFIsIEFUOTFfVFdJX0ZJTFRSX0ZJTFQpOw0KKwkJZmlsdHIgfD0gQVQ5MV9U
V0lfRklMVFJfRklMVDsNCiANCiAJLyogZW5hYmxlIGFkdmFuY2VkIGRpZ2l0YWwgZmlsdGVyICov
DQogCWlmIChwZGF0YS0+aGFzX2Fkdl9kaWdfZmlsdHIgJiYgZGV2LT5lbmFibGVfZGlnX2ZpbHQp
DQotCQlhdDkxX3R3aV93cml0ZShkZXYsIEFUOTFfVFdJX0ZJTFRSLCBBVDkxX1RXSV9GSUxUUl9G
SUxUIHwNCi0JCQkgICAgICAgKEFUOTFfVFdJX0ZJTFRSX1RIUkVTKDcpICYNCi0JCQkJQVQ5MV9U
V0lfRklMVFJfVEhSRVNfTUFTSykpOw0KKwkJZmlsdHIgfD0gQVQ5MV9UV0lfRklMVFJfRklMVCB8
DQorCQkJIChBVDkxX1RXSV9GSUxUUl9USFJFUyg3KSAmIEFUOTFfVFdJX0ZJTFRSX1RIUkVTX01B
U0spOw0KKw0KKwkvKiBlbmFibGUgYW5hbG9nIGZpbHRlciAqLw0KKwlpZiAocGRhdGEtPmhhc19h
bmFfZmlsdHIgJiYgZGV2LT5lbmFibGVfYW5hX2ZpbHQpDQorCQlmaWx0ciB8PSBBVDkxX1RXSV9G
SUxUUl9QQURGRU4gfCBBVDkxX1RXSV9GSUxUUl9QQURGQ0ZHOw0KKw0KKwlpZiAoZmlsdHIpDQor
CQlhdDkxX3R3aV93cml0ZShkZXYsIEFUOTFfVFdJX0ZJTFRSLCBmaWx0cik7DQogfQ0KIA0KIC8q
DQpAQCAtODA3LDYgKzgxNCw4IEBAIGludCBhdDkxX3R3aV9wcm9iZV9tYXN0ZXIoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldiwNCiAJZGV2LT5lbmFibGVfZGlnX2ZpbHQgPSBvZl9wcm9wZXJ0
eV9yZWFkX2Jvb2wocGRldi0+ZGV2Lm9mX25vZGUsDQogCQkJCQkJICAgICAiZW5hYmxlLWRpZy1m
aWx0Iik7DQogDQorCWRldi0+ZW5hYmxlX2FuYV9maWx0ID0gb2ZfcHJvcGVydHlfcmVhZF9ib29s
KHBkZXYtPmRldi5vZl9ub2RlLA0KKwkJCQkJCSAgICAgImVuYWJsZS1hbmEtZmlsdCIpOw0KIAlh
dDkxX2NhbGNfdHdpX2Nsb2NrKGRldik7DQogDQogCWRldi0+YWRhcHRlci5hbGdvID0gJmF0OTFf
dHdpX2FsZ29yaXRobTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEu
aCBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS5oDQppbmRleCA3YjhjMzcxLi40Y2E5YzE5
MSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS5oDQorKysgYi9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEuaA0KQEAgLTg2LDYgKzg2LDggQEANCiANCiAjZGVmaW5l
IEFUOTFfVFdJX0ZJTFRSCQkweDAwNDQNCiAjZGVmaW5lIEFUOTFfVFdJX0ZJTFRSX0ZJTFQJQklU
KDApDQorI2RlZmluZSBBVDkxX1RXSV9GSUxUUl9QQURGRU4JQklUKDEpDQorI2RlZmluZSBBVDkx
X1RXSV9GSUxUUl9QQURGQ0ZHCUJJVCgyKQ0KICNkZWZpbmUgQVQ5MV9UV0lfRklMVFJfVEhSRVMo
dikJCSgodikgPDwgOCkNCiAjZGVmaW5lIEFUOTFfVFdJX0ZJTFRSX1RIUkVTX01BU0sJR0VOTUFT
SygxMCwgOCkNCiANCkBAIC0xMTUsNiArMTE3LDcgQEAgc3RydWN0IGF0OTFfdHdpX3BkYXRhIHsN
CiAJYm9vbCBoYXNfaG9sZF9maWVsZDsNCiAJYm9vbCBoYXNfZGlnX2ZpbHRyOw0KIAlib29sIGhh
c19hZHZfZGlnX2ZpbHRyOw0KKwlib29sIGhhc19hbmFfZmlsdHI7DQogCXN0cnVjdCBhdF9kbWFf
c2xhdmUgZG1hX3NsYXZlOw0KIH07DQogDQpAQCAtMTUzLDYgKzE1Niw3IEBAIHN0cnVjdCBhdDkx
X3R3aV9kZXYgew0KIAlzdHJ1Y3QgaTJjX2NsaWVudCAqc2xhdmU7DQogI2VuZGlmDQogCWJvb2wg
ZW5hYmxlX2RpZ19maWx0Ow0KKwlib29sIGVuYWJsZV9hbmFfZmlsdDsNCiB9Ow0KIA0KIHVuc2ln
bmVkIGF0OTFfdHdpX3JlYWQoc3RydWN0IGF0OTFfdHdpX2RldiAqZGV2LCB1bnNpZ25lZCByZWcp
Ow0KLS0gDQoyLjcuNA0KDQo=
