Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8342C4C817
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 09:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbfFTHQY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 03:16:24 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:43228 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbfFTHQX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jun 2019 03:16:23 -0400
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,396,1557212400"; 
   d="scan'208";a="38158413"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jun 2019 00:16:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 20 Jun 2019 00:16:14 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 20 Jun 2019 00:16:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cN+5xsPEDLvxd8OuF3X+j6jVmD8gBhULlm1qLztT5mk=;
 b=kkN0S/k10QazR8rIZGQZ74r1ak7JCCsZzQOVCCHnYPyNVEHThh2LNajPGMggXipbxzpdLlrbOz5OC551p5i+lvAdAxKm1DMW9Gf0gPSsV0MQhdtn8x70/4ieAnGvtgjRXH9yY5sOGEGHyG2qD7wHueVm0+ijPk1DbM+7UQYTuc4=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1802.namprd11.prod.outlook.com (10.175.87.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 07:16:13 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322%9]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 07:16:13 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH 3/5] i2c: at91: add support for digital filtering
Thread-Topic: [PATCH 3/5] i2c: at91: add support for digital filtering
Thread-Index: AQHVJzgKQnaxfk8mV0C5xiMA7uCgiQ==
Date:   Thu, 20 Jun 2019 07:16:13 +0000
Message-ID: <1561014676-22446-3-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 3c40f75a-4cb1-4e70-24dd-08d6f54f2cfc
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1802;
x-ms-traffictypediagnostic: DM5PR11MB1802:
x-microsoft-antispam-prvs: <DM5PR11MB180285970C4D8E72B3A95DF0E8E40@DM5PR11MB1802.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(136003)(346002)(366004)(39860400002)(189003)(199004)(64756008)(73956011)(305945005)(3846002)(66556008)(8676002)(71200400001)(8936002)(81156014)(81166006)(66446008)(186003)(36756003)(110136005)(50226002)(2616005)(76176011)(446003)(476003)(53936002)(102836004)(71190400001)(52116002)(14454004)(2501003)(107886003)(99286004)(26005)(316002)(2906002)(6486002)(11346002)(6506007)(386003)(486006)(256004)(66066001)(2201001)(68736007)(66946007)(6116002)(478600001)(7736002)(72206003)(6512007)(4326008)(25786009)(6436002)(66476007)(86362001)(5660300002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1802;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KV3Ob/RFCVpzeKMTeuQZ1p56urJTkTqgb3k4qfXA/knPgO9MvcxiyrTxNgfpey/nunHBKut1zS1UzteIgRy4L/r0iLxTkRUg2ESbsLOMTCRd+QJeshAsgVuPez6Si21cKVNRUVKlrLXn2kdyokHxGrVVClOFE8mU5hOudBBVDxT5E+ZRLsf0GUn7u0rcAzetKC3OJ1V5aoGdLKmoS82M0B39LYUePX2wmt9wc2KwiRpYmq8vWP8uSSxeBQfNufaCUSLjOwzQH8/iLH9g9h8z/glIxB98fAo7SdnoemQr1JaN9RnWkf6F9VLteK9YNvTW7IA2flAT76rmxB46+GZpkDuiwJC86IFNgKS/sLgNw9uaueSGNH+aIeFBVfakx/Zzkp86QZr0YMjkAQJo/YEWhebUIGEY8tKCVsqxGG3Q4L0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c40f75a-4cb1-4e70-24dd-08d6f54f2cfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 07:16:13.4104
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
bmV3IHBsYXRmb3JtIGRhdGEgc3VwcG9ydCBmb3IgZGlnaXRhbCBmaWx0ZXJpbmcgZm9yIGkyYy4N
ClRoZSBzYW1hNWQ0LCBzYW1hNWQyIGFuZCBzYW05eDYwIHN1cHBvcnQgdGhpcyBmZWF0dXJlLg0K
DQpTaWduZWQtb2ZmLWJ5OiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5j
b20+DQotLS0NCiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtY29yZS5jICAgfCA5ICsrKysr
KysrKw0KIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuYyB8IDYgKysrKysrDQog
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLmggICAgICAgIHwgNCArKysrDQogMyBmaWxlcyBj
aGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLWF0OTEtY29yZS5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLWNvcmUuYw0K
aW5kZXggYTY2M2E3YS4uNjI2MTBhZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtYXQ5MS1jb3JlLmMNCisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1jb3JlLmMN
CkBAIC02OCw2ICs2OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEgYXQ5MXJtOTIw
MF9jb25maWcgPSB7DQogCS5oYXNfdW5yZV9mbGFnID0gdHJ1ZSwNCiAJLmhhc19hbHRfY21kID0g
ZmFsc2UsDQogCS5oYXNfaG9sZF9maWVsZCA9IGZhbHNlLA0KKwkuaGFzX2RpZ19maWx0ciA9IGZh
bHNlLA0KIH07DQogDQogc3RhdGljIHN0cnVjdCBhdDkxX3R3aV9wZGF0YSBhdDkxc2FtOTI2MV9j
b25maWcgPSB7DQpAQCAtNzYsNiArNzcsNyBAQCBzdGF0aWMgc3RydWN0IGF0OTFfdHdpX3BkYXRh
IGF0OTFzYW05MjYxX2NvbmZpZyA9IHsNCiAJLmhhc191bnJlX2ZsYWcgPSBmYWxzZSwNCiAJLmhh
c19hbHRfY21kID0gZmFsc2UsDQogCS5oYXNfaG9sZF9maWVsZCA9IGZhbHNlLA0KKwkuaGFzX2Rp
Z19maWx0ciA9IGZhbHNlLA0KIH07DQogDQogc3RhdGljIHN0cnVjdCBhdDkxX3R3aV9wZGF0YSBh
dDkxc2FtOTI2MF9jb25maWcgPSB7DQpAQCAtODQsNiArODYsNyBAQCBzdGF0aWMgc3RydWN0IGF0
OTFfdHdpX3BkYXRhIGF0OTFzYW05MjYwX2NvbmZpZyA9IHsNCiAJLmhhc191bnJlX2ZsYWcgPSBm
YWxzZSwNCiAJLmhhc19hbHRfY21kID0gZmFsc2UsDQogCS5oYXNfaG9sZF9maWVsZCA9IGZhbHNl
LA0KKwkuaGFzX2RpZ19maWx0ciA9IGZhbHNlLA0KIH07DQogDQogc3RhdGljIHN0cnVjdCBhdDkx
X3R3aV9wZGF0YSBhdDkxc2FtOWcyMF9jb25maWcgPSB7DQpAQCAtOTIsNiArOTUsNyBAQCBzdGF0
aWMgc3RydWN0IGF0OTFfdHdpX3BkYXRhIGF0OTFzYW05ZzIwX2NvbmZpZyA9IHsNCiAJLmhhc191
bnJlX2ZsYWcgPSBmYWxzZSwNCiAJLmhhc19hbHRfY21kID0gZmFsc2UsDQogCS5oYXNfaG9sZF9m
aWVsZCA9IGZhbHNlLA0KKwkuaGFzX2RpZ19maWx0ciA9IGZhbHNlLA0KIH07DQogDQogc3RhdGlj
IHN0cnVjdCBhdDkxX3R3aV9wZGF0YSBhdDkxc2FtOWcxMF9jb25maWcgPSB7DQpAQCAtMTAwLDYg
KzEwNCw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEgYXQ5MXNhbTlnMTBfY29uZmln
ID0gew0KIAkuaGFzX3VucmVfZmxhZyA9IGZhbHNlLA0KIAkuaGFzX2FsdF9jbWQgPSBmYWxzZSwN
CiAJLmhhc19ob2xkX2ZpZWxkID0gZmFsc2UsDQorCS5oYXNfZGlnX2ZpbHRyID0gZmFsc2UsDQog
fTsNCiANCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBsYXRmb3JtX2RldmljZV9pZCBhdDkxX3R3aV9k
ZXZ0eXBlc1tdID0gew0KQEAgLTEzMCw2ICsxMzUsNyBAQCBzdGF0aWMgc3RydWN0IGF0OTFfdHdp
X3BkYXRhIGF0OTFzYW05eDVfY29uZmlnID0gew0KIAkuaGFzX3VucmVfZmxhZyA9IGZhbHNlLA0K
IAkuaGFzX2FsdF9jbWQgPSBmYWxzZSwNCiAJLmhhc19ob2xkX2ZpZWxkID0gZmFsc2UsDQorCS5o
YXNfZGlnX2ZpbHRyID0gZmFsc2UsDQogfTsNCiANCiBzdGF0aWMgc3RydWN0IGF0OTFfdHdpX3Bk
YXRhIHNhbWE1ZDRfY29uZmlnID0gew0KQEAgLTEzOCw2ICsxNDQsNyBAQCBzdGF0aWMgc3RydWN0
IGF0OTFfdHdpX3BkYXRhIHNhbWE1ZDRfY29uZmlnID0gew0KIAkuaGFzX3VucmVfZmxhZyA9IGZh
bHNlLA0KIAkuaGFzX2FsdF9jbWQgPSBmYWxzZSwNCiAJLmhhc19ob2xkX2ZpZWxkID0gdHJ1ZSwN
CisJLmhhc19kaWdfZmlsdHIgPSB0cnVlLA0KIH07DQogDQogc3RhdGljIHN0cnVjdCBhdDkxX3R3
aV9wZGF0YSBzYW1hNWQyX2NvbmZpZyA9IHsNCkBAIC0xNDYsNiArMTUzLDcgQEAgc3RhdGljIHN0
cnVjdCBhdDkxX3R3aV9wZGF0YSBzYW1hNWQyX2NvbmZpZyA9IHsNCiAJLmhhc191bnJlX2ZsYWcg
PSB0cnVlLA0KIAkuaGFzX2FsdF9jbWQgPSB0cnVlLA0KIAkuaGFzX2hvbGRfZmllbGQgPSB0cnVl
LA0KKwkuaGFzX2RpZ19maWx0ciA9IHRydWUsDQogfTsNCiANCiBzdGF0aWMgc3RydWN0IGF0OTFf
dHdpX3BkYXRhIHNhbTl4NjBfY29uZmlnID0gew0KQEAgLTE1NCw2ICsxNjIsNyBAQCBzdGF0aWMg
c3RydWN0IGF0OTFfdHdpX3BkYXRhIHNhbTl4NjBfY29uZmlnID0gew0KIAkuaGFzX3VucmVfZmxh
ZyA9IHRydWUsDQogCS5oYXNfYWx0X2NtZCA9IHRydWUsDQogCS5oYXNfaG9sZF9maWVsZCA9IHRy
dWUsDQorCS5oYXNfZGlnX2ZpbHRyID0gdHJ1ZSwNCiB9Ow0KIA0KIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIGF0bWVsX3R3aV9kdF9pZHNbXSA9IHsNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtbWFzdGVyLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LWF0OTEtbWFzdGVyLmMNCmluZGV4IGU4NzIzMmYuLjM2NmU5MGYgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtbWFzdGVyLmMNCisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtYXQ5MS1tYXN0ZXIuYw0KQEAgLTMxLDEyICszMSwxOCBAQA0KIA0KIHZvaWQgYXQ5MV9p
bml0X3R3aV9idXNfbWFzdGVyKHN0cnVjdCBhdDkxX3R3aV9kZXYgKmRldikNCiB7DQorCXN0cnVj
dCBhdDkxX3R3aV9wZGF0YSAqcGRhdGEgPSBkZXYtPnBkYXRhOw0KKw0KIAkvKiBGSUZPIHNob3Vs
ZCBiZSBlbmFibGVkIGltbWVkaWF0ZWx5IGFmdGVyIHRoZSBzb2Z0d2FyZSByZXNldCAqLw0KIAlp
ZiAoZGV2LT5maWZvX3NpemUpDQogCQlhdDkxX3R3aV93cml0ZShkZXYsIEFUOTFfVFdJX0NSLCBB
VDkxX1RXSV9GSUZPRU4pOw0KIAlhdDkxX3R3aV93cml0ZShkZXYsIEFUOTFfVFdJX0NSLCBBVDkx
X1RXSV9NU0VOKTsNCiAJYXQ5MV90d2lfd3JpdGUoZGV2LCBBVDkxX1RXSV9DUiwgQVQ5MV9UV0lf
U1ZESVMpOw0KIAlhdDkxX3R3aV93cml0ZShkZXYsIEFUOTFfVFdJX0NXR1IsIGRldi0+dHdpX2N3
Z3JfcmVnKTsNCisNCisJLyogZW5hYmxlIGRpZ2l0YWwgZmlsdGVyICovDQorCWlmIChwZGF0YS0+
aGFzX2RpZ19maWx0cikNCisJCWF0OTFfdHdpX3dyaXRlKGRldiwgQVQ5MV9UV0lfRklMVFIsIEFU
OTFfVFdJX0ZJTFRSX0ZJTFQpOw0KIH0NCiANCiAvKg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtYXQ5MS5oIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLmgNCmluZGV4
IDQ5OWI1MDYuLjNlODA4MTEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0
OTEuaA0KKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLmgNCkBAIC04NCw2ICs4NCw5
IEBADQogI2RlZmluZQlBVDkxX1RXSV9BQ1JfREFUQUwobGVuKQkoKGxlbikgJiAweGZmKQ0KICNk
ZWZpbmUJQVQ5MV9UV0lfQUNSX0RJUglCSVQoOCkNCiANCisjZGVmaW5lIEFUOTFfVFdJX0ZJTFRS
CQkweDAwNDQNCisjZGVmaW5lIEFUOTFfVFdJX0ZJTFRSX0ZJTFQJQklUKDApDQorDQogI2RlZmlu
ZQlBVDkxX1RXSV9GTVIJCTB4MDA1MAkvKiBGSUZPIE1vZGUgUmVnaXN0ZXIgKi8NCiAjZGVmaW5l
CUFUOTFfVFdJX0ZNUl9UWFJEWU0obW9kZSkJKCgobW9kZSkgJiAweDMpIDw8IDApDQogI2RlZmlu
ZQlBVDkxX1RXSV9GTVJfVFhSRFlNX01BU0sJKDB4MyA8PCAwKQ0KQEAgLTEwOCw2ICsxMTEsNyBA
QCBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEgew0KIAlib29sIGhhc191bnJlX2ZsYWc7DQogCWJvb2wg
aGFzX2FsdF9jbWQ7DQogCWJvb2wgaGFzX2hvbGRfZmllbGQ7DQorCWJvb2wgaGFzX2RpZ19maWx0
cjsNCiAJc3RydWN0IGF0X2RtYV9zbGF2ZSBkbWFfc2xhdmU7DQogfTsNCiANCi0tIA0KMi43LjQN
Cg0K
