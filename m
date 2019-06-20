Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E33714C823
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 09:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730936AbfFTHQp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 03:16:45 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:32239 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbfFTHQo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jun 2019 03:16:44 -0400
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
X-IronPort-AV: E=Sophos;i="5.63,396,1557212400"; 
   d="scan'208";a="39721223"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jun 2019 00:16:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 20 Jun 2019 00:16:19 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 20 Jun 2019 00:16:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZ+/ZI2mttB38VcwyprwWQss7zYyEVesL9VDiTmclgQ=;
 b=Zkx090YDuFroqIhgQ+qH0+aVVggVL9iypyZqzsViEwoqC7ivWosPUa2YasKzqRGjH6rttOtKL91BSJoxC5IG8c1HmSsiukQvKhfR6LwbrsO3hZJbuf+Xbp3eULqO3NvHvz7nw0Oh0kSAGHBMuHjNVIn0WV+V40OoOUjY0io2Gfc=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1802.namprd11.prod.outlook.com (10.175.87.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 07:16:19 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322%9]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 07:16:19 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH 5/5] i2c: at91: add support for analog filtering
Thread-Topic: [PATCH 5/5] i2c: at91: add support for analog filtering
Thread-Index: AQHVJzgOY3GBRV9Q1Ueiq+RyIVbQng==
Date:   Thu, 20 Jun 2019 07:16:19 +0000
Message-ID: <1561014676-22446-5-git-send-email-eugen.hristev@microchip.com>
References: <1561014676-22446-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1561014676-22446-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0054.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::43) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0129a79-d799-4faf-c2fd-08d6f54f30b6
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1802;
x-ms-traffictypediagnostic: DM5PR11MB1802:
x-microsoft-antispam-prvs: <DM5PR11MB1802E29980F9E6B8CEE566E7E8E40@DM5PR11MB1802.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(136003)(346002)(366004)(39860400002)(189003)(199004)(64756008)(73956011)(305945005)(3846002)(66556008)(8676002)(71200400001)(8936002)(81156014)(81166006)(66446008)(186003)(36756003)(110136005)(50226002)(2616005)(76176011)(446003)(476003)(53936002)(102836004)(71190400001)(52116002)(14454004)(2501003)(107886003)(99286004)(26005)(316002)(2906002)(6486002)(11346002)(6506007)(386003)(486006)(256004)(66066001)(2201001)(68736007)(66946007)(6116002)(478600001)(7736002)(72206003)(6512007)(4326008)(25786009)(6436002)(66476007)(86362001)(5660300002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1802;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RXlWfQ+FWkeCSx/L7YeAU1pZYMEK/QNwKsJmd6stTAWabW+uBedx6ZOl/kKA6Zssmz5LImpU8T41jDM09ImTqevszaQWFQdGFO3/GaS89a382YLmKlEEyV6/vx7RsgX7/Xum1MMUi8tdAtxb/3/Sx4GlT2/THVOOtJ8MreGkCkwJ+z6Rjvszf8mBhQxBgNtjH72MTsZTgFrA/rS76qqHJ2Y24eF5FcZcWOAm8mV+ZXaphweU47D/BtKp0SGwcAjdy8nc2u0P5i9rYN2A/DCcXaVMEJjNhpjuYoTy6/TLnjEFBm6IFULxBLREph+Q8KD60A61cozKE3A+hc5zwU8Qq5Syo1kCC9HKWkvaGlbGEIdoaVqaml9v8fyjn/7KSVOEZ0i8AOzNsJlEVeJExXzZGZTk8oBB0/gnv2InbmHmmcQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a0129a79-d799-4faf-c2fd-08d6f54f30b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 07:16:19.3743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1802
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

RnJvbTogRXVnZW4gSHJpc3RldiA8ZXVnZW4uaHJpc3RldkBtaWNyb2NoaXAuY29tPg0KDQpBZGQg
bmV3IHBsYXRmb3JtIGRhdGEgc3VwcG9ydCBmb3IgYW5hbG9nIGZpbHRlcmluZyBmb3IgaTJjLg0K
VGhlIHNhbWE1ZDIgYW5kIHNhbTl4NjAgc3VwcG9ydCB0aGlzIGZlYXR1cmUuDQoNClNpZ25lZC1v
ZmYtYnk6IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9jaGlwLmNvbT4NCi0tLQ0K
IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1jb3JlLmMgICB8ICA5ICsrKysrKysrKw0KIGRy
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuYyB8IDE1ICsrKysrKysrKysrLS0tLQ0K
IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS5oICAgICAgICB8ICAzICsrKw0KIDMgZmlsZXMg
Y2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1jb3JlLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMv
aTJjLWF0OTEtY29yZS5jDQppbmRleCAzYmJlMzdjLi5kMjg0MGJhIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLWNvcmUuYw0KKysrIGIvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1hdDkxLWNvcmUuYw0KQEAgLTcwLDYgKzcwLDcgQEAgc3RhdGljIHN0cnVjdCBhdDkxX3R3
aV9wZGF0YSBhdDkxcm05MjAwX2NvbmZpZyA9IHsNCiAJLmhhc19ob2xkX2ZpZWxkID0gZmFsc2Us
DQogCS5oYXNfZGlnX2ZpbHRyID0gZmFsc2UsDQogCS5oYXNfYWR2X2RpZ19maWx0ciA9IGZhbHNl
LA0KKwkuaGFzX2FuYV9maWx0ciA9IGZhbHNlLA0KIH07DQogDQogc3RhdGljIHN0cnVjdCBhdDkx
X3R3aV9wZGF0YSBhdDkxc2FtOTI2MV9jb25maWcgPSB7DQpAQCAtODAsNiArODEsNyBAQCBzdGF0
aWMgc3RydWN0IGF0OTFfdHdpX3BkYXRhIGF0OTFzYW05MjYxX2NvbmZpZyA9IHsNCiAJLmhhc19o
b2xkX2ZpZWxkID0gZmFsc2UsDQogCS5oYXNfZGlnX2ZpbHRyID0gZmFsc2UsDQogCS5oYXNfYWR2
X2RpZ19maWx0ciA9IGZhbHNlLA0KKwkuaGFzX2FuYV9maWx0ciA9IGZhbHNlLA0KIH07DQogDQog
c3RhdGljIHN0cnVjdCBhdDkxX3R3aV9wZGF0YSBhdDkxc2FtOTI2MF9jb25maWcgPSB7DQpAQCAt
OTAsNiArOTIsNyBAQCBzdGF0aWMgc3RydWN0IGF0OTFfdHdpX3BkYXRhIGF0OTFzYW05MjYwX2Nv
bmZpZyA9IHsNCiAJLmhhc19ob2xkX2ZpZWxkID0gZmFsc2UsDQogCS5oYXNfZGlnX2ZpbHRyID0g
ZmFsc2UsDQogCS5oYXNfYWR2X2RpZ19maWx0ciA9IGZhbHNlLA0KKwkuaGFzX2FuYV9maWx0ciA9
IGZhbHNlLA0KIH07DQogDQogc3RhdGljIHN0cnVjdCBhdDkxX3R3aV9wZGF0YSBhdDkxc2FtOWcy
MF9jb25maWcgPSB7DQpAQCAtMTAwLDYgKzEwMyw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXQ5MV90d2lf
cGRhdGEgYXQ5MXNhbTlnMjBfY29uZmlnID0gew0KIAkuaGFzX2hvbGRfZmllbGQgPSBmYWxzZSwN
CiAJLmhhc19kaWdfZmlsdHIgPSBmYWxzZSwNCiAJLmhhc19hZHZfZGlnX2ZpbHRyID0gZmFsc2Us
DQorCS5oYXNfYW5hX2ZpbHRyID0gZmFsc2UsDQogfTsNCiANCiBzdGF0aWMgc3RydWN0IGF0OTFf
dHdpX3BkYXRhIGF0OTFzYW05ZzEwX2NvbmZpZyA9IHsNCkBAIC0xMTAsNiArMTE0LDcgQEAgc3Rh
dGljIHN0cnVjdCBhdDkxX3R3aV9wZGF0YSBhdDkxc2FtOWcxMF9jb25maWcgPSB7DQogCS5oYXNf
aG9sZF9maWVsZCA9IGZhbHNlLA0KIAkuaGFzX2RpZ19maWx0ciA9IGZhbHNlLA0KIAkuaGFzX2Fk
dl9kaWdfZmlsdHIgPSBmYWxzZSwNCisJLmhhc19hbmFfZmlsdHIgPSBmYWxzZSwNCiB9Ow0KIA0K
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlX2lkIGF0OTFfdHdpX2RldnR5cGVz
W10gPSB7DQpAQCAtMTQyLDYgKzE0Nyw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEg
YXQ5MXNhbTl4NV9jb25maWcgPSB7DQogCS5oYXNfaG9sZF9maWVsZCA9IGZhbHNlLA0KIAkuaGFz
X2RpZ19maWx0ciA9IGZhbHNlLA0KIAkuaGFzX2Fkdl9kaWdfZmlsdHIgPSBmYWxzZSwNCisJLmhh
c19hbmFfZmlsdHIgPSBmYWxzZSwNCiB9Ow0KIA0KIHN0YXRpYyBzdHJ1Y3QgYXQ5MV90d2lfcGRh
dGEgc2FtYTVkNF9jb25maWcgPSB7DQpAQCAtMTUyLDYgKzE1OCw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
YXQ5MV90d2lfcGRhdGEgc2FtYTVkNF9jb25maWcgPSB7DQogCS5oYXNfaG9sZF9maWVsZCA9IHRy
dWUsDQogCS5oYXNfZGlnX2ZpbHRyID0gdHJ1ZSwNCiAJLmhhc19hZHZfZGlnX2ZpbHRyID0gZmFs
c2UsDQorCS5oYXNfYW5hX2ZpbHRyID0gZmFsc2UsDQogfTsNCiANCiBzdGF0aWMgc3RydWN0IGF0
OTFfdHdpX3BkYXRhIHNhbWE1ZDJfY29uZmlnID0gew0KQEAgLTE2Miw2ICsxNjksNyBAQCBzdGF0
aWMgc3RydWN0IGF0OTFfdHdpX3BkYXRhIHNhbWE1ZDJfY29uZmlnID0gew0KIAkuaGFzX2hvbGRf
ZmllbGQgPSB0cnVlLA0KIAkuaGFzX2RpZ19maWx0ciA9IHRydWUsDQogCS5oYXNfYWR2X2RpZ19m
aWx0ciA9IHRydWUsDQorCS5oYXNfYW5hX2ZpbHRyID0gdHJ1ZSwNCiB9Ow0KIA0KIHN0YXRpYyBz
dHJ1Y3QgYXQ5MV90d2lfcGRhdGEgc2FtOXg2MF9jb25maWcgPSB7DQpAQCAtMTcyLDYgKzE4MCw3
IEBAIHN0YXRpYyBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEgc2FtOXg2MF9jb25maWcgPSB7DQogCS5o
YXNfaG9sZF9maWVsZCA9IHRydWUsDQogCS5oYXNfZGlnX2ZpbHRyID0gdHJ1ZSwNCiAJLmhhc19h
ZHZfZGlnX2ZpbHRyID0gdHJ1ZSwNCisJLmhhc19hbmFfZmlsdHIgPSB0cnVlLA0KIH07DQogDQog
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgYXRtZWxfdHdpX2R0X2lkc1tdID0gew0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuYyBiL2RyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuYw0KaW5kZXggYjllNjAxZS4uNmI1OTFhYyAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuYw0KKysrIGIv
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLW1hc3Rlci5jDQpAQCAtMzIsNiArMzIsNyBAQA0K
IHZvaWQgYXQ5MV9pbml0X3R3aV9idXNfbWFzdGVyKHN0cnVjdCBhdDkxX3R3aV9kZXYgKmRldikN
CiB7DQogCXN0cnVjdCBhdDkxX3R3aV9wZGF0YSAqcGRhdGEgPSBkZXYtPnBkYXRhOw0KKwl1MzIg
ZmlsdHIgPSAwOw0KIA0KIAkvKiBGSUZPIHNob3VsZCBiZSBlbmFibGVkIGltbWVkaWF0ZWx5IGFm
dGVyIHRoZSBzb2Z0d2FyZSByZXNldCAqLw0KIAlpZiAoZGV2LT5maWZvX3NpemUpDQpAQCAtNDIs
MTMgKzQzLDE5IEBAIHZvaWQgYXQ5MV9pbml0X3R3aV9idXNfbWFzdGVyKHN0cnVjdCBhdDkxX3R3
aV9kZXYgKmRldikNCiANCiAJLyogZW5hYmxlIGRpZ2l0YWwgZmlsdGVyICovDQogCWlmIChwZGF0
YS0+aGFzX2RpZ19maWx0cikNCi0JCWF0OTFfdHdpX3dyaXRlKGRldiwgQVQ5MV9UV0lfRklMVFIs
IEFUOTFfVFdJX0ZJTFRSX0ZJTFQpOw0KKwkJZmlsdHIgfD0gQVQ5MV9UV0lfRklMVFJfRklMVDsN
CiANCiAJLyogZW5hYmxlIGFkdmFuY2VkIGRpZ2l0YWwgZmlsdGVyICovDQogCWlmIChwZGF0YS0+
aGFzX2Fkdl9kaWdfZmlsdHIpDQotCQlhdDkxX3R3aV93cml0ZShkZXYsIEFUOTFfVFdJX0ZJTFRS
LCBBVDkxX1RXSV9GSUxUUl9GSUxUIHwNCi0JCQkgICAgICAgKEFUOTFfVFdJX0ZJTFRSX1RIUkVT
KDcpICYNCi0JCQkJQVQ5MV9UV0lfRklMVFJfVEhSRVNfTUFTSykpOw0KKwkJZmlsdHIgfD0gQVQ5
MV9UV0lfRklMVFJfRklMVCB8DQorCQkJIChBVDkxX1RXSV9GSUxUUl9USFJFUyg3KSAmIEFUOTFf
VFdJX0ZJTFRSX1RIUkVTX01BU0spOw0KKw0KKwkvKiBlbmFibGUgYW5hbG9nIGZpbHRlciAqLw0K
KwlpZiAocGRhdGEtPmhhc19hbmFfZmlsdHIpDQorCQlmaWx0ciB8PSBBVDkxX1RXSV9GSUxUUl9Q
QURGRU4gfCBBVDkxX1RXSV9GSUxUUl9QQURGQ0ZHOw0KKw0KKwlpZiAoZmlsdHIpDQorCQlhdDkx
X3R3aV93cml0ZShkZXYsIEFUOTFfVFdJX0ZJTFRSLCBmaWx0cik7DQogfQ0KIA0KIC8qDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLmggYi9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLWF0OTEuaA0KaW5kZXggY2NmMThiYS4uZjAwOTc5OSAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS5oDQorKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0
OTEuaA0KQEAgLTg2LDYgKzg2LDggQEANCiANCiAjZGVmaW5lIEFUOTFfVFdJX0ZJTFRSCQkweDAw
NDQNCiAjZGVmaW5lIEFUOTFfVFdJX0ZJTFRSX0ZJTFQJQklUKDApDQorI2RlZmluZSBBVDkxX1RX
SV9GSUxUUl9QQURGRU4JQklUKDEpDQorI2RlZmluZSBBVDkxX1RXSV9GSUxUUl9QQURGQ0ZHCUJJ
VCgyKQ0KICNkZWZpbmUgQVQ5MV9UV0lfRklMVFJfVEhSRVModikJCSgodikgPDwgOCkNCiAjZGVm
aW5lIEFUOTFfVFdJX0ZJTFRSX1RIUkVTX01BU0sJR0VOTUFTSygxMCwgOCkNCiANCkBAIC0xMTUs
NiArMTE3LDcgQEAgc3RydWN0IGF0OTFfdHdpX3BkYXRhIHsNCiAJYm9vbCBoYXNfaG9sZF9maWVs
ZDsNCiAJYm9vbCBoYXNfZGlnX2ZpbHRyOw0KIAlib29sIGhhc19hZHZfZGlnX2ZpbHRyOw0KKwli
b29sIGhhc19hbmFfZmlsdHI7DQogCXN0cnVjdCBhdF9kbWFfc2xhdmUgZG1hX3NsYXZlOw0KIH07
DQogDQotLSANCjIuNy40DQoNCg==
