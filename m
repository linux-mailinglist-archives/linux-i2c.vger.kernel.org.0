Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAE46525EC
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 10:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbfFYIE6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 04:04:58 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:51992 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729080AbfFYIE5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jun 2019 04:04:57 -0400
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
X-IronPort-AV: E=Sophos;i="5.63,415,1557212400"; 
   d="scan'208";a="38763749"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jun 2019 01:04:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Jun 2019 01:04:56 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 25 Jun 2019 01:04:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CltJ5eFvBDcby0Kii91Zjitrd4Hbzx7iFt6FTdU2mUU=;
 b=X8J8r4vwFnld+4CyWXYYVDC5qf4nNPoy6QoO/O9twLBQ7TD2ZzKW2ZBy3p1C6OMwsBHBwqKPBDPQohjoQiuis4iAQrUv2/p4Sf3Y4C8ugs3d0niXEfWbeFvYa/eRFmIbenC5OwaUfs9lDLjl1AxjQ3y5RIqcU3nijRxpcULzk7M=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1289.namprd11.prod.outlook.com (10.168.103.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 08:04:54 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322%9]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 08:04:54 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v2 4/9] i2c: at91: add support for digital filtering
Thread-Topic: [PATCH v2 4/9] i2c: at91: add support for digital filtering
Thread-Index: AQHVKyysqSPCkaqZMECnl8zK+JUKvg==
Date:   Tue, 25 Jun 2019 08:04:54 +0000
Message-ID: <1561449642-26956-5-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 0ad3ca5a-f469-40b8-c5cd-08d6f943ce95
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1289;
x-ms-traffictypediagnostic: DM5PR11MB1289:
x-microsoft-antispam-prvs: <DM5PR11MB1289037324B401A5CBFFB5EFE8E30@DM5PR11MB1289.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(39860400002)(366004)(396003)(346002)(189003)(199004)(6512007)(53936002)(86362001)(110136005)(6486002)(6436002)(2201001)(316002)(14454004)(2906002)(478600001)(72206003)(66556008)(5660300002)(64756008)(66946007)(66476007)(66446008)(256004)(71200400001)(71190400001)(36756003)(107886003)(305945005)(7736002)(6116002)(25786009)(73956011)(4326008)(3846002)(68736007)(446003)(11346002)(386003)(52116002)(76176011)(2501003)(99286004)(6506007)(486006)(476003)(2616005)(8676002)(66066001)(186003)(26005)(102836004)(50226002)(81166006)(8936002)(81156014)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1289;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pYeQUprCz6QroI4xK021/J47LnxHuZKCpFtt1kxoTVocHzrCv0NTFvg8iQkD9g69t41qZLzaMCwEq66BsZ2NRbSSZLD15nEZ1+xV6EDDVEAAoZOkhPTqJBo8/hqIEIz2QGwgUkudPhxYyMYBayQ7fmz2Qa2uUIfZxEqxS7LOsrUFzsiOV1MoNVv7OlrpyAht7F2R8EzugjDJGydX8ihpEYjvvN8rbkO/tyDxcEdBp9DuSeD/NW5nPm3fAqKd2imW3lzukStQmarPvKfuL/yn89cFi1+DgT7kaFaYJVkkqcuGojQufvtkhEMgxdJVe5ncs9Siv2VC7Asc1AB7ik45JOOSIFk349vXOFuqq0tqfKp/muKCpDmKu7J+ScV//AqzJ8kwrU6AFTptgdLwcwTfszNDUQFnE4EZ7vJvOlWjwvM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad3ca5a-f469-40b8-c5cd-08d6f943ce95
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 08:04:54.8174
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
bmV3IHBsYXRmb3JtIGRhdGEgc3VwcG9ydCBmb3IgZGlnaXRhbCBmaWx0ZXJpbmcgZm9yIGkyYy4N
ClRoZSBzYW1hNWQ0LCBzYW1hNWQyIGFuZCBzYW05eDYwIHN1cHBvcnQgdGhpcyBmZWF0dXJlLg0K
DQpTaWduZWQtb2ZmLWJ5OiBFdWdlbiBIcmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5j
b20+DQotLS0NCiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtY29yZS5jICAgfCA5ICsrKysr
KysrKw0KIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1tYXN0ZXIuYyB8IDkgKysrKysrKysr
DQogZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLmggICAgICAgIHwgNSArKysrKw0KIDMgZmls
ZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1hdDkxLWNvcmUuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1jb3Jl
LmMNCmluZGV4IGE2NjNhN2EuLjYyNjEwYWYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLWF0OTEtY29yZS5jDQorKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEtY29y
ZS5jDQpAQCAtNjgsNiArNjgsNyBAQCBzdGF0aWMgc3RydWN0IGF0OTFfdHdpX3BkYXRhIGF0OTFy
bTkyMDBfY29uZmlnID0gew0KIAkuaGFzX3VucmVfZmxhZyA9IHRydWUsDQogCS5oYXNfYWx0X2Nt
ZCA9IGZhbHNlLA0KIAkuaGFzX2hvbGRfZmllbGQgPSBmYWxzZSwNCisJLmhhc19kaWdfZmlsdHIg
PSBmYWxzZSwNCiB9Ow0KIA0KIHN0YXRpYyBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEgYXQ5MXNhbTky
NjFfY29uZmlnID0gew0KQEAgLTc2LDYgKzc3LDcgQEAgc3RhdGljIHN0cnVjdCBhdDkxX3R3aV9w
ZGF0YSBhdDkxc2FtOTI2MV9jb25maWcgPSB7DQogCS5oYXNfdW5yZV9mbGFnID0gZmFsc2UsDQog
CS5oYXNfYWx0X2NtZCA9IGZhbHNlLA0KIAkuaGFzX2hvbGRfZmllbGQgPSBmYWxzZSwNCisJLmhh
c19kaWdfZmlsdHIgPSBmYWxzZSwNCiB9Ow0KIA0KIHN0YXRpYyBzdHJ1Y3QgYXQ5MV90d2lfcGRh
dGEgYXQ5MXNhbTkyNjBfY29uZmlnID0gew0KQEAgLTg0LDYgKzg2LDcgQEAgc3RhdGljIHN0cnVj
dCBhdDkxX3R3aV9wZGF0YSBhdDkxc2FtOTI2MF9jb25maWcgPSB7DQogCS5oYXNfdW5yZV9mbGFn
ID0gZmFsc2UsDQogCS5oYXNfYWx0X2NtZCA9IGZhbHNlLA0KIAkuaGFzX2hvbGRfZmllbGQgPSBm
YWxzZSwNCisJLmhhc19kaWdfZmlsdHIgPSBmYWxzZSwNCiB9Ow0KIA0KIHN0YXRpYyBzdHJ1Y3Qg
YXQ5MV90d2lfcGRhdGEgYXQ5MXNhbTlnMjBfY29uZmlnID0gew0KQEAgLTkyLDYgKzk1LDcgQEAg
c3RhdGljIHN0cnVjdCBhdDkxX3R3aV9wZGF0YSBhdDkxc2FtOWcyMF9jb25maWcgPSB7DQogCS5o
YXNfdW5yZV9mbGFnID0gZmFsc2UsDQogCS5oYXNfYWx0X2NtZCA9IGZhbHNlLA0KIAkuaGFzX2hv
bGRfZmllbGQgPSBmYWxzZSwNCisJLmhhc19kaWdfZmlsdHIgPSBmYWxzZSwNCiB9Ow0KIA0KIHN0
YXRpYyBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEgYXQ5MXNhbTlnMTBfY29uZmlnID0gew0KQEAgLTEw
MCw2ICsxMDQsNyBAQCBzdGF0aWMgc3RydWN0IGF0OTFfdHdpX3BkYXRhIGF0OTFzYW05ZzEwX2Nv
bmZpZyA9IHsNCiAJLmhhc191bnJlX2ZsYWcgPSBmYWxzZSwNCiAJLmhhc19hbHRfY21kID0gZmFs
c2UsDQogCS5oYXNfaG9sZF9maWVsZCA9IGZhbHNlLA0KKwkuaGFzX2RpZ19maWx0ciA9IGZhbHNl
LA0KIH07DQogDQogc3RhdGljIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2VfaWQgYXQ5MV90
d2lfZGV2dHlwZXNbXSA9IHsNCkBAIC0xMzAsNiArMTM1LDcgQEAgc3RhdGljIHN0cnVjdCBhdDkx
X3R3aV9wZGF0YSBhdDkxc2FtOXg1X2NvbmZpZyA9IHsNCiAJLmhhc191bnJlX2ZsYWcgPSBmYWxz
ZSwNCiAJLmhhc19hbHRfY21kID0gZmFsc2UsDQogCS5oYXNfaG9sZF9maWVsZCA9IGZhbHNlLA0K
KwkuaGFzX2RpZ19maWx0ciA9IGZhbHNlLA0KIH07DQogDQogc3RhdGljIHN0cnVjdCBhdDkxX3R3
aV9wZGF0YSBzYW1hNWQ0X2NvbmZpZyA9IHsNCkBAIC0xMzgsNiArMTQ0LDcgQEAgc3RhdGljIHN0
cnVjdCBhdDkxX3R3aV9wZGF0YSBzYW1hNWQ0X2NvbmZpZyA9IHsNCiAJLmhhc191bnJlX2ZsYWcg
PSBmYWxzZSwNCiAJLmhhc19hbHRfY21kID0gZmFsc2UsDQogCS5oYXNfaG9sZF9maWVsZCA9IHRy
dWUsDQorCS5oYXNfZGlnX2ZpbHRyID0gdHJ1ZSwNCiB9Ow0KIA0KIHN0YXRpYyBzdHJ1Y3QgYXQ5
MV90d2lfcGRhdGEgc2FtYTVkMl9jb25maWcgPSB7DQpAQCAtMTQ2LDYgKzE1Myw3IEBAIHN0YXRp
YyBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEgc2FtYTVkMl9jb25maWcgPSB7DQogCS5oYXNfdW5yZV9m
bGFnID0gdHJ1ZSwNCiAJLmhhc19hbHRfY21kID0gdHJ1ZSwNCiAJLmhhc19ob2xkX2ZpZWxkID0g
dHJ1ZSwNCisJLmhhc19kaWdfZmlsdHIgPSB0cnVlLA0KIH07DQogDQogc3RhdGljIHN0cnVjdCBh
dDkxX3R3aV9wZGF0YSBzYW05eDYwX2NvbmZpZyA9IHsNCkBAIC0xNTQsNiArMTYyLDcgQEAgc3Rh
dGljIHN0cnVjdCBhdDkxX3R3aV9wZGF0YSBzYW05eDYwX2NvbmZpZyA9IHsNCiAJLmhhc191bnJl
X2ZsYWcgPSB0cnVlLA0KIAkuaGFzX2FsdF9jbWQgPSB0cnVlLA0KIAkuaGFzX2hvbGRfZmllbGQg
PSB0cnVlLA0KKwkuaGFzX2RpZ19maWx0ciA9IHRydWUsDQogfTsNCiANCiBzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBhdG1lbF90d2lfZHRfaWRzW10gPSB7DQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLW1hc3Rlci5jIGIvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1hdDkxLW1hc3Rlci5jDQppbmRleCBlODcyMzJmLi43YWZjZTYyIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLW1hc3Rlci5jDQorKysgYi9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLWF0OTEtbWFzdGVyLmMNCkBAIC0zMSwxMiArMzEsMTggQEANCiANCiB2b2lkIGF0
OTFfaW5pdF90d2lfYnVzX21hc3RlcihzdHJ1Y3QgYXQ5MV90d2lfZGV2ICpkZXYpDQogew0KKwlz
dHJ1Y3QgYXQ5MV90d2lfcGRhdGEgKnBkYXRhID0gZGV2LT5wZGF0YTsNCisNCiAJLyogRklGTyBz
aG91bGQgYmUgZW5hYmxlZCBpbW1lZGlhdGVseSBhZnRlciB0aGUgc29mdHdhcmUgcmVzZXQgKi8N
CiAJaWYgKGRldi0+Zmlmb19zaXplKQ0KIAkJYXQ5MV90d2lfd3JpdGUoZGV2LCBBVDkxX1RXSV9D
UiwgQVQ5MV9UV0lfRklGT0VOKTsNCiAJYXQ5MV90d2lfd3JpdGUoZGV2LCBBVDkxX1RXSV9DUiwg
QVQ5MV9UV0lfTVNFTik7DQogCWF0OTFfdHdpX3dyaXRlKGRldiwgQVQ5MV9UV0lfQ1IsIEFUOTFf
VFdJX1NWRElTKTsNCiAJYXQ5MV90d2lfd3JpdGUoZGV2LCBBVDkxX1RXSV9DV0dSLCBkZXYtPnR3
aV9jd2dyX3JlZyk7DQorDQorCS8qIGVuYWJsZSBkaWdpdGFsIGZpbHRlciAqLw0KKwlpZiAocGRh
dGEtPmhhc19kaWdfZmlsdHIgJiYgZGV2LT5lbmFibGVfZGlnX2ZpbHQpDQorCQlhdDkxX3R3aV93
cml0ZShkZXYsIEFUOTFfVFdJX0ZJTFRSLCBBVDkxX1RXSV9GSUxUUl9GSUxUKTsNCiB9DQogDQog
LyoNCkBAIC03OTIsNiArNzk4LDkgQEAgaW50IGF0OTFfdHdpX3Byb2JlX21hc3RlcihzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2LA0KIAkJZGV2X2luZm8oZGV2LT5kZXYsICJVc2luZyBGSUZP
ICgldSBkYXRhKVxuIiwgZGV2LT5maWZvX3NpemUpOw0KIAl9DQogDQorCWRldi0+ZW5hYmxlX2Rp
Z19maWx0ID0gb2ZfcHJvcGVydHlfcmVhZF9ib29sKHBkZXYtPmRldi5vZl9ub2RlLA0KKwkJCQkJ
CSAgICAgImVuYWJsZS1kaWctZmlsdCIpOw0KKw0KIAlhdDkxX2NhbGNfdHdpX2Nsb2NrKGRldik7
DQogDQogCWRldi0+YWRhcHRlci5hbGdvID0gJmF0OTFfdHdpX2FsZ29yaXRobTsNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWF0OTEuaCBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtYXQ5MS5oDQppbmRleCA0OTliNTA2Li5jNzU0NDdlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1hdDkxLmgNCisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS5o
DQpAQCAtODQsNiArODQsOSBAQA0KICNkZWZpbmUJQVQ5MV9UV0lfQUNSX0RBVEFMKGxlbikJKChs
ZW4pICYgMHhmZikNCiAjZGVmaW5lCUFUOTFfVFdJX0FDUl9ESVIJQklUKDgpDQogDQorI2RlZmlu
ZSBBVDkxX1RXSV9GSUxUUgkJMHgwMDQ0DQorI2RlZmluZSBBVDkxX1RXSV9GSUxUUl9GSUxUCUJJ
VCgwKQ0KKw0KICNkZWZpbmUJQVQ5MV9UV0lfRk1SCQkweDAwNTAJLyogRklGTyBNb2RlIFJlZ2lz
dGVyICovDQogI2RlZmluZQlBVDkxX1RXSV9GTVJfVFhSRFlNKG1vZGUpCSgoKG1vZGUpICYgMHgz
KSA8PCAwKQ0KICNkZWZpbmUJQVQ5MV9UV0lfRk1SX1RYUkRZTV9NQVNLCSgweDMgPDwgMCkNCkBA
IC0xMDgsNiArMTExLDcgQEAgc3RydWN0IGF0OTFfdHdpX3BkYXRhIHsNCiAJYm9vbCBoYXNfdW5y
ZV9mbGFnOw0KIAlib29sIGhhc19hbHRfY21kOw0KIAlib29sIGhhc19ob2xkX2ZpZWxkOw0KKwli
b29sIGhhc19kaWdfZmlsdHI7DQogCXN0cnVjdCBhdF9kbWFfc2xhdmUgZG1hX3NsYXZlOw0KIH07
DQogDQpAQCAtMTQ1LDYgKzE0OSw3IEBAIHN0cnVjdCBhdDkxX3R3aV9kZXYgew0KIAl1bnNpZ25l
ZCBzbXI7DQogCXN0cnVjdCBpMmNfY2xpZW50ICpzbGF2ZTsNCiAjZW5kaWYNCisJYm9vbCBlbmFi
bGVfZGlnX2ZpbHQ7DQogfTsNCiANCiB1bnNpZ25lZCBhdDkxX3R3aV9yZWFkKHN0cnVjdCBhdDkx
X3R3aV9kZXYgKmRldiwgdW5zaWduZWQgcmVnKTsNCi0tIA0KMi43LjQNCg0K
