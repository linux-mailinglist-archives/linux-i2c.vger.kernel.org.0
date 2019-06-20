Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 565CA4C821
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 09:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfFTHQo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 03:16:44 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:32239 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfFTHQo (ORCPT
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
   d="scan'208";a="39721222"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jun 2019 00:16:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 20 Jun 2019 00:16:11 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 20 Jun 2019 00:16:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpHS0J5OsHpYij8HC+sB0AGII92NtqEih9oHcnfEpxM=;
 b=PhN4sG784d+S04jseLn7PLzTuwz6Wapmq+bV5nkqr6pzWvaT0iM35cjOmU5ZapsqFHS3XtN7a0hnL3bptVMhDCU8pfreQW1v/Rhw6TBEqSeZeOpG5cqidHCofmru72E/BWANC89QCpCaZFcjH/k7uxaWo53WX2S7i3sfytJ2RoM=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1802.namprd11.prod.outlook.com (10.175.87.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 07:16:11 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322%9]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 07:16:11 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <wsa@the-dreams.de>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH 2/5] i2c: at91: add new platform support for sam9x60
Thread-Topic: [PATCH 2/5] i2c: at91: add new platform support for sam9x60
Thread-Index: AQHVJzgI/tU6YnJNJ068U+d2AuEWdQ==
Date:   Thu, 20 Jun 2019 07:16:09 +0000
Message-ID: <1561014676-22446-2-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: d110d672-06a8-4906-cf9a-08d6f54f2ae3
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1802;
x-ms-traffictypediagnostic: DM5PR11MB1802:
x-microsoft-antispam-prvs: <DM5PR11MB18029B49640AD74441F0C0ACE8E40@DM5PR11MB1802.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(136003)(346002)(366004)(39860400002)(189003)(199004)(64756008)(73956011)(305945005)(3846002)(66556008)(8676002)(71200400001)(8936002)(81156014)(81166006)(66446008)(186003)(36756003)(110136005)(50226002)(2616005)(76176011)(446003)(476003)(53936002)(102836004)(71190400001)(52116002)(14454004)(2501003)(107886003)(99286004)(26005)(316002)(2906002)(6486002)(11346002)(6506007)(386003)(486006)(256004)(66066001)(2201001)(68736007)(66946007)(6116002)(478600001)(7736002)(72206003)(6512007)(4326008)(25786009)(6436002)(4744005)(66476007)(86362001)(5660300002)(138113003)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1802;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vmcP6ir8MjAcIP+8hVcuViUkOejPBxcT9NPJufhswU2riKnDzWC3QFTUpxd+5oOcMXIE9TzAtK9TWNYYLcaswLTPLhXskZUCd5Fq8znonA8iD3xgVUNWoKnsNbUIfWcLCIQ4Nw/htPz9F5/ZnX3SPvcIhkstO1kuQ7F7r4FDP2om0NVXflKyn2LJjIMlwULJUzXPq9/NpBpKJmxhHVWdoqA8w7WpO+Kc8Zhcys/BfqLBvkjcx+JeFoxyp2ymLFT/n2dErxBV2emqcy8X86gcQZNCOTHf8GcWDS8Fh+RDjE7X+xEtvuood7H8KZIKs1TH59RBBZDfLOPfwVknDQWW2bIkiRGSl2r2Ej9fO7DSEqRPqrrOh2Ge+HU9b00J6q1ZkFmB3CD/UXHloHo2ipHeW/jcZ0R2jhl750ZbkR5rTnU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d110d672-06a8-4906-cf9a-08d6f54f2ae3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 07:16:10.1277
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
