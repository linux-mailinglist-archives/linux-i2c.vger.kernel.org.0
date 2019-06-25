Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E120525F4
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 10:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729655AbfFYIFU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 04:05:20 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:54065 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729595AbfFYIFS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jun 2019 04:05:18 -0400
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
   d="scan'208";a="40295053"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jun 2019 01:05:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Jun 2019 01:04:59 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 25 Jun 2019 01:04:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDO3qwrrF7hiHY/VBA1TAnl83V9Lp6Gck2T3kGD0HNI=;
 b=W/4ZROOxFKatNLYsnuPATuI3ySjxQyMtu0iVPz9TWKMUPKFTGcYBIIxc/wy9eQFb4iWZ5qIgJjt6cV8rlP355OLAXTSdiQd9bjjihs+f71grKZnVzK68rGSim6n8F46RjqV5cnYIKdofl8PPaWfopuktsJf+qK66XYljj/9UUE8=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1289.namprd11.prod.outlook.com (10.168.103.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 08:04:58 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322%9]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 08:04:58 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v2 5/9] i2c: at91: add support for advanced digital filtering
Thread-Topic: [PATCH v2 5/9] i2c: at91: add support for advanced digital
 filtering
Thread-Index: AQHVKyyuQuuXT2xyGkiCRNlaMpjKGA==
Date:   Tue, 25 Jun 2019 08:04:57 +0000
Message-ID: <1561449642-26956-6-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 035e8e3f-ee83-4b55-ae30-08d6f943d060
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1289;
x-ms-traffictypediagnostic: DM5PR11MB1289:
x-microsoft-antispam-prvs: <DM5PR11MB1289DAEFE55998C2C18A1D10E8E30@DM5PR11MB1289.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(39860400002)(366004)(396003)(346002)(189003)(199004)(6512007)(53936002)(86362001)(110136005)(6486002)(6436002)(2201001)(316002)(14454004)(2906002)(478600001)(72206003)(66556008)(5660300002)(64756008)(66946007)(66476007)(66446008)(256004)(71200400001)(71190400001)(36756003)(107886003)(305945005)(7736002)(6116002)(25786009)(73956011)(4326008)(3846002)(68736007)(446003)(11346002)(386003)(52116002)(76176011)(2501003)(99286004)(6506007)(486006)(476003)(2616005)(8676002)(66066001)(186003)(26005)(102836004)(50226002)(81166006)(8936002)(81156014)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1289;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CCWHiJ+i2wiEWrOz/PNf84ka6GC1w4NXEo+B5RlrzoZsBqOYz6Cw4eNuzeJ2J9aUQdgtMXAzTspksaZ66lcTngrc2TtuDpPO+atQSgPaV5fbv+W4XV90D19Cdxg04vMr57T7XaBFRbnTWZg9LNWGHTO/z9LYZvR/TBtsSnokUAywRTNzO+OBuZFcH2t5RmOyJ/AIQ8QL4zX6tRS9uYqwcjauk1zy2J3pPctTJuMZBHIQxFvDendA7qa6n651vK864bZ2hSaCx8lt8VU7+20CIPqrR9zWu/S6Wr+1JfAfOO0ITIoi38MYT3eT90A+MWlaSYk/LqgcQOD5LPwVietTVll7pshg/t9G+qPkV/5NPjtKKfx+54LIv+KVSPn451jbV2GJ6WwewNXTYwo8kNmTADlvlLo2igEvNGpaDeNbI00=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 035e8e3f-ee83-4b55-ae30-08d6f943d060
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 08:04:57.9120
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
bmV3IHBsYXRmb3JtIGRhdGEgc3VwcG9ydCBmb3IgYWR2YW5jZWQgZGlnaXRhbCBmaWx0ZXJpbmcg
Zm9yIGkyYy4NClRoZSBzYW1hNWQyIGFuZCBzYW05eDYwIHN1cHBvcnQgdGhpcyBmZWF0dXJlLg0K
VGhpcyBkaWdpdGFsIGZpbHRlciBhbGxvd3MgdGhlIHVzZXIgdG8gY29uZmlndXJlIHRoZSBtYXhp
bXVtDQp3aWR0aCBvZiB0aGUgc3Bpa2VzIHRoYXQgY2FuIGJlIGZpbHRlcmVkLg0KDQpTaWduZWQt
b2ZmLWJ5OiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5jb20+DQotLS0N
CiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtY29yZS5jICAgfCA5ICsrKysrKysrKw0KIGRy
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuYyB8IDYgKysrKysrDQogZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1hdDkxLmggICAgICAgIHwgMyArKysNCiAzIGZpbGVzIGNoYW5nZWQsIDE4
IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5
MS1jb3JlLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtY29yZS5jDQppbmRleCA2MjYx
MGFmLi4zYmJlMzdjIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLWNv
cmUuYw0KKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLWNvcmUuYw0KQEAgLTY5LDYg
KzY5LDcgQEAgc3RhdGljIHN0cnVjdCBhdDkxX3R3aV9wZGF0YSBhdDkxcm05MjAwX2NvbmZpZyA9
IHsNCiAJLmhhc19hbHRfY21kID0gZmFsc2UsDQogCS5oYXNfaG9sZF9maWVsZCA9IGZhbHNlLA0K
IAkuaGFzX2RpZ19maWx0ciA9IGZhbHNlLA0KKwkuaGFzX2Fkdl9kaWdfZmlsdHIgPSBmYWxzZSwN
CiB9Ow0KIA0KIHN0YXRpYyBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEgYXQ5MXNhbTkyNjFfY29uZmln
ID0gew0KQEAgLTc4LDYgKzc5LDcgQEAgc3RhdGljIHN0cnVjdCBhdDkxX3R3aV9wZGF0YSBhdDkx
c2FtOTI2MV9jb25maWcgPSB7DQogCS5oYXNfYWx0X2NtZCA9IGZhbHNlLA0KIAkuaGFzX2hvbGRf
ZmllbGQgPSBmYWxzZSwNCiAJLmhhc19kaWdfZmlsdHIgPSBmYWxzZSwNCisJLmhhc19hZHZfZGln
X2ZpbHRyID0gZmFsc2UsDQogfTsNCiANCiBzdGF0aWMgc3RydWN0IGF0OTFfdHdpX3BkYXRhIGF0
OTFzYW05MjYwX2NvbmZpZyA9IHsNCkBAIC04Nyw2ICs4OSw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXQ5
MV90d2lfcGRhdGEgYXQ5MXNhbTkyNjBfY29uZmlnID0gew0KIAkuaGFzX2FsdF9jbWQgPSBmYWxz
ZSwNCiAJLmhhc19ob2xkX2ZpZWxkID0gZmFsc2UsDQogCS5oYXNfZGlnX2ZpbHRyID0gZmFsc2Us
DQorCS5oYXNfYWR2X2RpZ19maWx0ciA9IGZhbHNlLA0KIH07DQogDQogc3RhdGljIHN0cnVjdCBh
dDkxX3R3aV9wZGF0YSBhdDkxc2FtOWcyMF9jb25maWcgPSB7DQpAQCAtOTYsNiArOTksNyBAQCBz
dGF0aWMgc3RydWN0IGF0OTFfdHdpX3BkYXRhIGF0OTFzYW05ZzIwX2NvbmZpZyA9IHsNCiAJLmhh
c19hbHRfY21kID0gZmFsc2UsDQogCS5oYXNfaG9sZF9maWVsZCA9IGZhbHNlLA0KIAkuaGFzX2Rp
Z19maWx0ciA9IGZhbHNlLA0KKwkuaGFzX2Fkdl9kaWdfZmlsdHIgPSBmYWxzZSwNCiB9Ow0KIA0K
IHN0YXRpYyBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEgYXQ5MXNhbTlnMTBfY29uZmlnID0gew0KQEAg
LTEwNSw2ICsxMDksNyBAQCBzdGF0aWMgc3RydWN0IGF0OTFfdHdpX3BkYXRhIGF0OTFzYW05ZzEw
X2NvbmZpZyA9IHsNCiAJLmhhc19hbHRfY21kID0gZmFsc2UsDQogCS5oYXNfaG9sZF9maWVsZCA9
IGZhbHNlLA0KIAkuaGFzX2RpZ19maWx0ciA9IGZhbHNlLA0KKwkuaGFzX2Fkdl9kaWdfZmlsdHIg
PSBmYWxzZSwNCiB9Ow0KIA0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlX2lk
IGF0OTFfdHdpX2RldnR5cGVzW10gPSB7DQpAQCAtMTM2LDYgKzE0MSw3IEBAIHN0YXRpYyBzdHJ1
Y3QgYXQ5MV90d2lfcGRhdGEgYXQ5MXNhbTl4NV9jb25maWcgPSB7DQogCS5oYXNfYWx0X2NtZCA9
IGZhbHNlLA0KIAkuaGFzX2hvbGRfZmllbGQgPSBmYWxzZSwNCiAJLmhhc19kaWdfZmlsdHIgPSBm
YWxzZSwNCisJLmhhc19hZHZfZGlnX2ZpbHRyID0gZmFsc2UsDQogfTsNCiANCiBzdGF0aWMgc3Ry
dWN0IGF0OTFfdHdpX3BkYXRhIHNhbWE1ZDRfY29uZmlnID0gew0KQEAgLTE0NSw2ICsxNTEsNyBA
QCBzdGF0aWMgc3RydWN0IGF0OTFfdHdpX3BkYXRhIHNhbWE1ZDRfY29uZmlnID0gew0KIAkuaGFz
X2FsdF9jbWQgPSBmYWxzZSwNCiAJLmhhc19ob2xkX2ZpZWxkID0gdHJ1ZSwNCiAJLmhhc19kaWdf
ZmlsdHIgPSB0cnVlLA0KKwkuaGFzX2Fkdl9kaWdfZmlsdHIgPSBmYWxzZSwNCiB9Ow0KIA0KIHN0
YXRpYyBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEgc2FtYTVkMl9jb25maWcgPSB7DQpAQCAtMTU0LDYg
KzE2MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEgc2FtYTVkMl9jb25maWcgPSB7
DQogCS5oYXNfYWx0X2NtZCA9IHRydWUsDQogCS5oYXNfaG9sZF9maWVsZCA9IHRydWUsDQogCS5o
YXNfZGlnX2ZpbHRyID0gdHJ1ZSwNCisJLmhhc19hZHZfZGlnX2ZpbHRyID0gdHJ1ZSwNCiB9Ow0K
IA0KIHN0YXRpYyBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEgc2FtOXg2MF9jb25maWcgPSB7DQpAQCAt
MTYzLDYgKzE3MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEgc2FtOXg2MF9jb25m
aWcgPSB7DQogCS5oYXNfYWx0X2NtZCA9IHRydWUsDQogCS5oYXNfaG9sZF9maWVsZCA9IHRydWUs
DQogCS5oYXNfZGlnX2ZpbHRyID0gdHJ1ZSwNCisJLmhhc19hZHZfZGlnX2ZpbHRyID0gdHJ1ZSwN
CiB9Ow0KIA0KIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGF0bWVsX3R3aV9kdF9p
ZHNbXSA9IHsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtbWFzdGVy
LmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtbWFzdGVyLmMNCmluZGV4IDdhZmNlNjIu
LmQ4MjYwMWIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtbWFzdGVy
LmMNCisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuYw0KQEAgLTQzLDYg
KzQzLDEyIEBAIHZvaWQgYXQ5MV9pbml0X3R3aV9idXNfbWFzdGVyKHN0cnVjdCBhdDkxX3R3aV9k
ZXYgKmRldikNCiAJLyogZW5hYmxlIGRpZ2l0YWwgZmlsdGVyICovDQogCWlmIChwZGF0YS0+aGFz
X2RpZ19maWx0ciAmJiBkZXYtPmVuYWJsZV9kaWdfZmlsdCkNCiAJCWF0OTFfdHdpX3dyaXRlKGRl
diwgQVQ5MV9UV0lfRklMVFIsIEFUOTFfVFdJX0ZJTFRSX0ZJTFQpOw0KKw0KKwkvKiBlbmFibGUg
YWR2YW5jZWQgZGlnaXRhbCBmaWx0ZXIgKi8NCisJaWYgKHBkYXRhLT5oYXNfYWR2X2RpZ19maWx0
ciAmJiBkZXYtPmVuYWJsZV9kaWdfZmlsdCkNCisJCWF0OTFfdHdpX3dyaXRlKGRldiwgQVQ5MV9U
V0lfRklMVFIsIEFUOTFfVFdJX0ZJTFRSX0ZJTFQgfA0KKwkJCSAgICAgICAoQVQ5MV9UV0lfRklM
VFJfVEhSRVMoNykgJg0KKwkJCQlBVDkxX1RXSV9GSUxUUl9USFJFU19NQVNLKSk7DQogfQ0KIA0K
IC8qDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLmggYi9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLWF0OTEuaA0KaW5kZXggYzc1NDQ3ZS4uN2I4YzM3MSAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS5oDQorKysgYi9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLWF0OTEuaA0KQEAgLTg2LDYgKzg2LDggQEANCiANCiAjZGVmaW5lIEFUOTFfVFdJX0ZJ
TFRSCQkweDAwNDQNCiAjZGVmaW5lIEFUOTFfVFdJX0ZJTFRSX0ZJTFQJQklUKDApDQorI2RlZmlu
ZSBBVDkxX1RXSV9GSUxUUl9USFJFUyh2KQkJKCh2KSA8PCA4KQ0KKyNkZWZpbmUgQVQ5MV9UV0lf
RklMVFJfVEhSRVNfTUFTSwlHRU5NQVNLKDEwLCA4KQ0KIA0KICNkZWZpbmUJQVQ5MV9UV0lfRk1S
CQkweDAwNTAJLyogRklGTyBNb2RlIFJlZ2lzdGVyICovDQogI2RlZmluZQlBVDkxX1RXSV9GTVJf
VFhSRFlNKG1vZGUpCSgoKG1vZGUpICYgMHgzKSA8PCAwKQ0KQEAgLTExMiw2ICsxMTQsNyBAQCBz
dHJ1Y3QgYXQ5MV90d2lfcGRhdGEgew0KIAlib29sIGhhc19hbHRfY21kOw0KIAlib29sIGhhc19o
b2xkX2ZpZWxkOw0KIAlib29sIGhhc19kaWdfZmlsdHI7DQorCWJvb2wgaGFzX2Fkdl9kaWdfZmls
dHI7DQogCXN0cnVjdCBhdF9kbWFfc2xhdmUgZG1hX3NsYXZlOw0KIH07DQogDQotLSANCjIuNy40
DQoNCg==
