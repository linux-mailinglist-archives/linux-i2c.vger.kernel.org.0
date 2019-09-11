Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F34B8AF7B4
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2019 10:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbfIKIYU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Sep 2019 04:24:20 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:28399 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbfIKIYU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Sep 2019 04:24:20 -0400
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: jlxofZVjmXM8EW3GH6URBu0IT0Gv+thefZ52ntqlJW+5Apya9gonryb/R8p5jXL3X/7lp3Xnu9
 PSdett7GhRxC98O1wakZqFno/U2+RKX50W249bs5ckQZB0uFwRb0vQ70PN65fOVnNdat2j08hG
 HSAqRvdbSTJM6UwluPEXs3Go961jTQgC02vEoBchlGHzH+fabSXT8Tupc8V8Lqv3y3iZcP/dbH
 Osi/OnZCDyCPeEFaJMa3udKccWlog1EG/DYZP3He1HBvfDCcWgdw2oWnhZJHVCpZ9DvS0za/pD
 ZKU=
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; 
   d="scan'208";a="47514755"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Sep 2019 01:24:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Sep 2019 01:24:18 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 11 Sep 2019 01:24:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbznzX65OJxNp8mK3bCrn/etSDfNnm/r5s88Qcr7q/pX4S6kTW73i8riL6nvzhFuRx7Bc0WwKbAYJj2R6rRN5gpFMyt8asciDTjAAVGg5QpXsr05blcjdbeyWAe5fosHhWl+DVRW7HNjwiUfpjZ1XQLshrJ8I9+wq71greA4+sWHAw3k3xpOwSCIvYcwEyhWOfqqnZ0JbFlrwlnJAzrOl46V4BNmTfzIoBp7ueAn4HqNO8q8pXjQ5FU3G4q1EtpyD5mwWlb+IgcDMIVF9GK/Nd4KpCHYA5xV2qwKvCAPus/9uSx9ZyZT1gWSyHgnDqlaUaNH/61ap5myCzanVA7oiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5MENNtYd7Nb0C+oVW0i6uVQAnAKpqkec78APXH+wOc=;
 b=BjGam/wanvB1cpR6rhC/wV0aS2z5b4YKF0GTenrBMv2ZniSJ6xRhxwZt3nCYkAC6X/pX7xw+bOC2133gTSuleTxmJirRiRRCci+Or04yxC8tIBn8XU1PtwdFPxp/Q+yBRFwC3WpZs8/2sBrKXxdeq3mnzKQaoMrXnQUkxs2dfPlG96cJu//geTyMrQzlCgmJ4e3sez4elNen9OH2WI3kSiGMrODvV1cVGfq9HxcfIHReKzwBOmHCYQBJKPlEy2gdDHNYq7S4WdgEp48caa10RwgzLbwmeFNiM+FhhU2Vp9l04YUlHqBxjly4agAyDq1T1FzQu1rxpJYCZyTdwhoHDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5MENNtYd7Nb0C+oVW0i6uVQAnAKpqkec78APXH+wOc=;
 b=t6PI/qqu0RC2FStOhhoHLiM7eyAQ6ANdkWiJsu9lcliEaH48LfkiyYrseL3CduKWX8MTHnhvy4n0xzi0CmC8OLD+EXj+Tw8vEiqn+2h5fvWUxgrhC92PTu/0FTRAYH/3hLjLqQWCCPzAizfTvl0khbYibRFAMiZhnXGGoE/YGGc=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1452.namprd11.prod.outlook.com (10.172.36.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 08:24:17 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2%12]) with mapi id 15.20.2241.018; Wed, 11 Sep
 2019 08:24:17 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>
CC:     <Eugen.Hristev@microchip.com>, <Nicolas.Ferre@microchip.com>
Subject: [PATCH v5 1/9] dt-bindings: i2c: at91: add new compatible
Thread-Topic: [PATCH v5 1/9] dt-bindings: i2c: at91: add new compatible
Thread-Index: AQHVaHpNPpdbU+8jvE6t1yiCmfdevQ==
Date:   Wed, 11 Sep 2019 08:24:17 +0000
Message-ID: <1568189911-31641-2-git-send-email-eugen.hristev@microchip.com>
References: <1568189911-31641-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1568189911-31641-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::21) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d39d1e1-f765-4036-34aa-08d736916fcb
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1452;
x-ms-traffictypediagnostic: DM5PR11MB1452:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB145271C07EEC9456A5A2EE06E8B10@DM5PR11MB1452.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(52116002)(3846002)(2501003)(66556008)(66476007)(66946007)(54906003)(110136005)(478600001)(25786009)(316002)(6436002)(6116002)(76176011)(66066001)(386003)(14454004)(2906002)(102836004)(486006)(476003)(2616005)(11346002)(446003)(6506007)(186003)(26005)(4326008)(8936002)(81166006)(81156014)(7736002)(66446008)(8676002)(5660300002)(50226002)(64756008)(86362001)(2201001)(99286004)(71190400001)(4744005)(71200400001)(53936002)(36756003)(14444005)(256004)(107886003)(6512007)(305945005)(6486002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1452;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uhRMZ1ZRlD0SnFZyQnbKrbsEJNhIJsbpV3OaDQxaugWvbQuO9Joxz4qWDSXZ6EZCjywOLjTsww5dPYn1bGUqKa9VW/V6yeO/NntKc2Iv/TsWem5lDcmMhsXgqZ00C8GTDxCORP+uhXahQEdvv8uhHs37eqkuCDCDuwxx2jA61LZIPDJ/89ouf5z8dhGe0V2JNQMWT/VeZf1L2P1VnwNXika/ZPkms56awWzA4xvMta3vTzn0lUbROwoWVmN3P0emTibi2evaodelN/GElVY+dqzIOOBzzpwcJi3tkjcRR/ne2ALl5aJ6ZNMx+6f+7IBczQiByxMgXIKqMqzvl3uPry0TV1GYtUbJW1NAFsBqnT0VyI+WPz8BUUq/QdP8SF0ydvfyNHsA0PjDHpaDTOanvAS39fw14f7I0MmoL/cEF1I=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d39d1e1-f765-4036-34aa-08d736916fcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 08:24:17.3469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H7LqELgakGS0vw8MutzOlipswI/UX0NvYaACEjGImJ2c6EFu8Ewy2gnTLF2KorZ8EKNLcthLrU0HKiIHwxLAERCItHnTGk+JbuHz0R4vc2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1452
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Add compatible for new Microchip SoC, sam9x60

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 Documentation/devicetree/bindings/i2c/i2c-at91.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-at91.txt b/Documenta=
tion/devicetree/bindings/i2c/i2c-at91.txt
index b7cec17..2210f43 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-at91.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-at91.txt
@@ -3,7 +3,8 @@ I2C for Atmel platforms
 Required properties :
 - compatible : Must be "atmel,at91rm9200-i2c", "atmel,at91sam9261-i2c",
      "atmel,at91sam9260-i2c", "atmel,at91sam9g20-i2c", "atmel,at91sam9g10-=
i2c",
-     "atmel,at91sam9x5-i2c", "atmel,sama5d4-i2c" or "atmel,sama5d2-i2c"
+     "atmel,at91sam9x5-i2c", "atmel,sama5d4-i2c", "atmel,sama5d2-i2c" or
+     "microchip,sam9x60-i2c"
 - reg: physical base address of the controller and length of memory mapped
      region.
 - interrupts: interrupt number to the cpu.
--=20
2.7.4

