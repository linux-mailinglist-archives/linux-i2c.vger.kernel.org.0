Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34FBD525E6
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 10:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbfFYIEv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 04:04:51 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:51981 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728879AbfFYIEu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jun 2019 04:04:50 -0400
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
   d="scan'208";a="38763707"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jun 2019 01:04:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Jun 2019 01:04:59 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 25 Jun 2019 01:04:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpHS0J5OsHpYij8HC+sB0AGII92NtqEih9oHcnfEpxM=;
 b=1S77yBJfwzyYJGceJ6ehSu4QGv4H+Ny2ejtkF2Jc+QHsVGZCmWGyMendQ/hIX8WxreA5h2tBoXqdd52a+s6TiBFg6fDNnZj8vvuE1imqVpCj1z2CNyA+7PLimWsvgeFixKb22KgrWgoQBtMxe5qnBzJMiq2DnAFtZaquumpen00=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1289.namprd11.prod.outlook.com (10.168.103.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 08:04:48 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322%9]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 08:04:48 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v2 2/9] i2c: at91: add new platform support for sam9x60
Thread-Topic: [PATCH v2 2/9] i2c: at91: add new platform support for sam9x60
Thread-Index: AQHVKyyoXoG+v3rgXU6y64NB66yNDw==
Date:   Tue, 25 Jun 2019 08:04:48 +0000
Message-ID: <1561449642-26956-3-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: acd26efd-77f5-4e5f-69c5-08d6f943cac2
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1289;
x-ms-traffictypediagnostic: DM5PR11MB1289:
x-microsoft-antispam-prvs: <DM5PR11MB128907319DDB879D2EBA38F9E8E30@DM5PR11MB1289.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(39860400002)(366004)(396003)(346002)(189003)(199004)(6512007)(53936002)(86362001)(110136005)(6486002)(6436002)(2201001)(316002)(14454004)(2906002)(478600001)(72206003)(66556008)(5660300002)(4744005)(64756008)(66946007)(66476007)(66446008)(256004)(71200400001)(71190400001)(36756003)(107886003)(305945005)(7736002)(6116002)(25786009)(73956011)(4326008)(3846002)(68736007)(446003)(11346002)(386003)(52116002)(76176011)(2501003)(99286004)(6506007)(486006)(476003)(2616005)(8676002)(66066001)(186003)(26005)(102836004)(50226002)(81166006)(8936002)(81156014)(138113003)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1289;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SYaJ6mBct1HlhKKOrrm1y/CiXDzPEqVSKRlhasET3PfULtej0wRDaPuIVvVR0EaOp/cMYRukmrRB+2jl3aOgP0g5d0xF7+yA8A0HLKOeIdreQhbBrcQ/LR3WDE+SmTno7eA85eYdhx4lCev+ppz+dGiLL2uGjfdo3Y+ncX1NZDl9ej0xjfP4is/sH598ZsYPkvjfdnRYlNPTpb5JtX6K8wkg4IL0LUJ5s/dr0gCyBBByRaY95nwnGuq9L/lA4IxC4YA88dIjHJ0EqBn13BIo7igfbty0wI/eSk98D4Cgnuxqt2FWgcKcyoFC2y1iW4nvG9hViBzCAsSPIaOXcU22EjyvSaF13e3SfdTkXjVvlbJhHaBiMveh8ZTRINqCK7K/i3N3HT7Dr9DM4I8GaUlu5vmg1xfjZypvXvA5Io0ItoI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: acd26efd-77f5-4e5f-69c5-08d6f943cac2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 08:04:48.6863
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
bmV3IHBsYXRmb3JtIGRhdGEgc3VwcG9ydCBmb3IgdGhlIHNhbTl4NjAgU29DDQoNClNpZ25lZC1v
ZmYtYnk6IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9jaGlwLmNvbT4NCi0tLQ0K
IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1jb3JlLmMgfCAxMSArKysrKysrKysrKw0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLWF0OTEtY29yZS5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hdDkxLWNv
cmUuYw0KaW5kZXggOGQ1NWNkZC4uYTY2M2E3YSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtYXQ5MS1jb3JlLmMNCisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXQ5MS1j
b3JlLmMNCkBAIC0xNDgsNiArMTQ4LDE0IEBAIHN0YXRpYyBzdHJ1Y3QgYXQ5MV90d2lfcGRhdGEg
c2FtYTVkMl9jb25maWcgPSB7DQogCS5oYXNfaG9sZF9maWVsZCA9IHRydWUsDQogfTsNCiANCitz
dGF0aWMgc3RydWN0IGF0OTFfdHdpX3BkYXRhIHNhbTl4NjBfY29uZmlnID0gew0KKwkuY2xrX21h
eF9kaXYgPSA3LA0KKwkuY2xrX29mZnNldCA9IDQsDQorCS5oYXNfdW5yZV9mbGFnID0gdHJ1ZSwN
CisJLmhhc19hbHRfY21kID0gdHJ1ZSwNCisJLmhhc19ob2xkX2ZpZWxkID0gdHJ1ZSwNCit9Ow0K
Kw0KIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGF0bWVsX3R3aV9kdF9pZHNbXSA9
IHsNCiAJew0KIAkJLmNvbXBhdGlibGUgPSAiYXRtZWwsYXQ5MXJtOTIwMC1pMmMiLA0KQEAgLTE3
NCw2ICsxODIsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBhdG1lbF90d2lf
ZHRfaWRzW10gPSB7DQogCQkuY29tcGF0aWJsZSA9ICJhdG1lbCxzYW1hNWQyLWkyYyIsDQogCQku
ZGF0YSA9ICZzYW1hNWQyX2NvbmZpZywNCiAJfSwgew0KKwkJLmNvbXBhdGlibGUgPSAibWljcm9j
aGlwLHNhbTl4NjAtaTJjIiwNCisJCS5kYXRhID0gJnNhbTl4NjBfY29uZmlnLA0KKwl9LCB7DQog
CQkvKiBzZW50aW5lbCAqLw0KIAl9DQogfTsNCi0tIA0KMi43LjQNCg0K
