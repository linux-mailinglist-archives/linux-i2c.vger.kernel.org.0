Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AAD24C81B
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 09:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730858AbfFTHQY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 03:16:24 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:43228 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfFTHQY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jun 2019 03:16:24 -0400
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
   d="scan'208";a="38158416"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jun 2019 00:16:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 20 Jun 2019 00:16:17 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 20 Jun 2019 00:16:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=my+DQ0e+0Z+tOf376xw4mzsosx+Xxq4CzM2hvpyQs+s=;
 b=H8cgh2GAKSEL5QHFo6m+C5yvGrjAXHx96uKt2ZLTK26jy9BzrK4S35JccKt/szUOaEyOGc6NInRH2y/BTow1kEqzhQ/a9dGKW2CkE6mxehBhSIMxj7hrNZdc7ZKYgfriIdEbxembiVabzjsfCKfjh6jfx8r/w6wes7xaKs4L3vs=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1802.namprd11.prod.outlook.com (10.175.87.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 07:16:16 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322%9]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 07:16:16 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH 4/5] i2c: at91: add support for advanced digital filtering
Thread-Topic: [PATCH 4/5] i2c: at91: add support for advanced digital
 filtering
Thread-Index: AQHVJzgMLxo/gDUwhUutQfkQdWnHNA==
Date:   Thu, 20 Jun 2019 07:16:16 +0000
Message-ID: <1561014676-22446-4-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: c5d83e54-05cf-4326-adb4-08d6f54f2f03
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1802;
x-ms-traffictypediagnostic: DM5PR11MB1802:
x-microsoft-antispam-prvs: <DM5PR11MB1802412F97E66EE58930F2E5E8E40@DM5PR11MB1802.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(136003)(346002)(366004)(39860400002)(189003)(199004)(64756008)(73956011)(305945005)(3846002)(66556008)(8676002)(71200400001)(8936002)(81156014)(81166006)(66446008)(186003)(36756003)(110136005)(50226002)(2616005)(76176011)(446003)(476003)(53936002)(102836004)(71190400001)(52116002)(14454004)(2501003)(107886003)(99286004)(26005)(316002)(2906002)(6486002)(11346002)(6506007)(386003)(486006)(256004)(66066001)(2201001)(68736007)(66946007)(6116002)(478600001)(7736002)(72206003)(6512007)(4326008)(25786009)(6436002)(66476007)(86362001)(5660300002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1802;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nrMab4+kN/kniizX1GbeoI5aOt+MtZjz4/0Z9AilNDC+C6oAIxi4EMbENTS4oh+MWcCi+sAqLcckb4ri2hXBdnalDf+l+RTxYwyORPUgGeeMv4IwQWoif6dnevEddJdnU3uWV4hRFyCkEHKp7pz1xuitnE1RCaSlczY23EhjVP8V5aiAD+5N5ZZTEQjOaggTKbz+Fb8Ct8aNk6GWAKjyQMwQTHuRodNEdJ3UDoIsHlmnzBTCRRtZm1zSVNSlXukBfYtRnHCQnypaSewzxaQVInEEPmgdtGcgIJbfu1/g5SDrN5cEmrrv8mRrl4tYfd6VsJyFuucJyi6vKX3JY3D93pl+dpn8JzQlpYRN7uasm4TfiAKJthbR73vLIYr//oMuEn3vETlumcpHB/YArJhKUnMbyxIcvb0Y488ZQT4T36M=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d83e54-05cf-4326-adb4-08d6f54f2f03
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 07:16:16.3528
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
LmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtbWFzdGVyLmMNCmluZGV4IDM2NmU5MGYu
LmI5ZTYwMWUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtbWFzdGVy
LmMNCisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuYw0KQEAgLTQzLDYg
KzQzLDEyIEBAIHZvaWQgYXQ5MV9pbml0X3R3aV9idXNfbWFzdGVyKHN0cnVjdCBhdDkxX3R3aV9k
ZXYgKmRldikNCiAJLyogZW5hYmxlIGRpZ2l0YWwgZmlsdGVyICovDQogCWlmIChwZGF0YS0+aGFz
X2RpZ19maWx0cikNCiAJCWF0OTFfdHdpX3dyaXRlKGRldiwgQVQ5MV9UV0lfRklMVFIsIEFUOTFf
VFdJX0ZJTFRSX0ZJTFQpOw0KKw0KKwkvKiBlbmFibGUgYWR2YW5jZWQgZGlnaXRhbCBmaWx0ZXIg
Ki8NCisJaWYgKHBkYXRhLT5oYXNfYWR2X2RpZ19maWx0cikNCisJCWF0OTFfdHdpX3dyaXRlKGRl
diwgQVQ5MV9UV0lfRklMVFIsIEFUOTFfVFdJX0ZJTFRSX0ZJTFQgfA0KKwkJCSAgICAgICAoQVQ5
MV9UV0lfRklMVFJfVEhSRVMoNykgJg0KKwkJCQlBVDkxX1RXSV9GSUxUUl9USFJFU19NQVNLKSk7
DQogfQ0KIA0KIC8qDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLmgg
Yi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEuaA0KaW5kZXggM2U4MDgxMS4uY2NmMThiYSAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS5oDQorKysgYi9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLWF0OTEuaA0KQEAgLTg2LDYgKzg2LDggQEANCiANCiAjZGVmaW5lIEFU
OTFfVFdJX0ZJTFRSCQkweDAwNDQNCiAjZGVmaW5lIEFUOTFfVFdJX0ZJTFRSX0ZJTFQJQklUKDAp
DQorI2RlZmluZSBBVDkxX1RXSV9GSUxUUl9USFJFUyh2KQkJKCh2KSA8PCA4KQ0KKyNkZWZpbmUg
QVQ5MV9UV0lfRklMVFJfVEhSRVNfTUFTSwlHRU5NQVNLKDEwLCA4KQ0KIA0KICNkZWZpbmUJQVQ5
MV9UV0lfRk1SCQkweDAwNTAJLyogRklGTyBNb2RlIFJlZ2lzdGVyICovDQogI2RlZmluZQlBVDkx
X1RXSV9GTVJfVFhSRFlNKG1vZGUpCSgoKG1vZGUpICYgMHgzKSA8PCAwKQ0KQEAgLTExMiw2ICsx
MTQsNyBAQCBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEgew0KIAlib29sIGhhc19hbHRfY21kOw0KIAli
b29sIGhhc19ob2xkX2ZpZWxkOw0KIAlib29sIGhhc19kaWdfZmlsdHI7DQorCWJvb2wgaGFzX2Fk
dl9kaWdfZmlsdHI7DQogCXN0cnVjdCBhdF9kbWFfc2xhdmUgZG1hX3NsYXZlOw0KIH07DQogDQot
LSANCjIuNy40DQoNCg==
