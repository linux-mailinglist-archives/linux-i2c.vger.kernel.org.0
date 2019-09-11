Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E04EAF7CE
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2019 10:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfIKIYv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Sep 2019 04:24:51 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:10202 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727447AbfIKIYm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Sep 2019 04:24:42 -0400
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: q2Gppv3dqs3WCUC709Dg+CTshs5FcXOTjjOSug1UmeRylzI4kFIWgvlEGkKhqyldD78UhrlIaz
 4mCp228YhV4obFxF1o+kMfQ7dRVO6afA7fLwq7MsFx1kn4eXc0wGCZL2fwK8kvuNpk1scoJJSZ
 xsGKDqk7+mfDnnpiUmYBQHrfnVIxj6CB5O8r1DnL14yTwfGJqzjl/vWvsEJwhb2XNJIYKmgWYj
 h1q4bTyMVgBiVOTHtjKI868tuuAgh53hkqDkCfwVLlx6HW5epvn6euV61nhlIV4NgjgMVycuuB
 174=
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; 
   d="scan'208";a="47036050"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Sep 2019 01:24:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Sep 2019 01:24:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 11 Sep 2019 01:24:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAUjLigdsYYIxiG2PRgHmgktd/xUA0N5lZsgztjJmjE/K+4Qp9nW32BdQucAIqSIaJS+Jqdqyj0VDbzB3kL3h7TQY1BN7bQ/DBZipNVZUQrxKR40ejJLTIm0HCRKN6HiRJz0evH7zOUtSXwLNWJb/8JvZqoecUz96tZEYz0MW5/c9QxbLXmQFoirjiSSodUZmgW1OlaX3vZiali47M2SxJh9sSIh7Pd+ziCnwjAZ7xWrZOV4DdrGpbrrw9MPIk6q5C+LkK3s+jZGiNFBdsSTAJgXqilXWxaXAVnimShL1srG0V1Vjmv+hsKGFUDClUdBlB15Pct4NO/nlkgbEk9ezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9IBcdoZOiF2OFUwwq5xd7VoCpgH+rEzEOB0u5csHOE=;
 b=ZExvQXNZ1qz1Lot0v3ZLbmt/Qf6LckmajFyozga9E9yUGpUBExJTxUgKg9rnitAuYk1cKscnNnPYffdGPkOBk841j1JVcrm9PrUGPCnsBglg5BjCsme1pGpstbIACk7c+t40JIQpCOI9V3L9HjDnY+Dl+a5kHp+aQY9Fn8OYpeOLjjl6MLnDSj7GMB7Jvt7smugNdmsNrVUu5xIC7T3o5jIZiCl4DdCe0Xc0IhgMd36+jzZ9UFvbzMgvR1gEm77UrOqtaQr3SMHXYcOHqHWqhassNNo/7OL36+u5QlEYl3L24xqp42YervhNTzKUf12FfXkcmjpw+NCkL63IRFx3Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9IBcdoZOiF2OFUwwq5xd7VoCpgH+rEzEOB0u5csHOE=;
 b=NFo5ONto6j5NFrY7OlgR8e9w34//sMQp1gTyuZd7JaDdrY0XF1f29ODOtymoZI2xSg2rJfmh4y2Lie4d5l3rSDVb6TdV/40yovasAty855boWVToKFnyS6Lv8JPiceJmQ0sMt8HHt49QBzpNJisMfHNkzG91+0S6wT2DtSWOfPU=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1452.namprd11.prod.outlook.com (10.172.36.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 08:24:40 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2%12]) with mapi id 15.20.2241.018; Wed, 11 Sep
 2019 08:24:40 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>
CC:     <Eugen.Hristev@microchip.com>, <Nicolas.Ferre@microchip.com>
Subject: [PATCH v5 9/9] ARM: dts: at91: sama5d4_xplained: add digital filter
 for i2c
Thread-Topic: [PATCH v5 9/9] ARM: dts: at91: sama5d4_xplained: add digital
 filter for i2c
Thread-Index: AQHVaHpbUSFTGa51BEiMWzE14UyEHg==
Date:   Wed, 11 Sep 2019 08:24:40 +0000
Message-ID: <1568189911-31641-10-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 0a4e80a8-2c6d-4e0d-242b-08d736917d6d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1452;
x-ms-traffictypediagnostic: DM5PR11MB1452:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1452D8A3E76E88E95533EB85E8B10@DM5PR11MB1452.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(52116002)(3846002)(2501003)(66556008)(66476007)(66946007)(54906003)(110136005)(478600001)(25786009)(316002)(6436002)(6116002)(76176011)(66066001)(386003)(14454004)(2906002)(102836004)(486006)(476003)(2616005)(11346002)(446003)(6506007)(186003)(26005)(4326008)(8936002)(81166006)(81156014)(7736002)(66446008)(8676002)(5660300002)(50226002)(64756008)(86362001)(2201001)(99286004)(71190400001)(4744005)(71200400001)(53936002)(36756003)(256004)(107886003)(6512007)(305945005)(6486002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1452;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eZmxleknuklWIuX4FdodjGdK/sbk2atl/Bas6/Ig38Kb+VV6F9cxamPeUj/pRqptGNnUHLgZEVUwF+DGooTmnUNpXEXxiLbKOr209jagV/dE6LgaINGSeq3bfqsjnejrVOPZSMVEOlYJcNIjePNyusDik5Z9VtgrKJBvUyKozWxjHEJnqMDZvUCH7ih+UHuwCjmuAa4cHp6K8QzheqyWPU0Db8v8O5v7DgsoT2NBiGRBcN+J2R6+mJfumm4RbEA4Imp45ZF2vf9vI9OjWdxt0frx9vc4tRChw+4P5M6w44ZKo6ZlVzUvs2CGa+T7ofFb9QBmCZ54XQLbcALiF0/CmIALunw9dDYMY35fQrd2rn4YXyzdzRC+s/HkGDJUAfBYeXAyH1qOqYPXijiOWAQsy5Ps5f0NQ1zdxkxc/LPXXy0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4e80a8-2c6d-4e0d-242b-08d736917d6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 08:24:40.1985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KTxLvU4064K3svVvyjFDcebvW4DlLyzuT/VLRcJCyOxMg7h6T4q9+TIUBJOE0RJ/v0OQF6LYf4tssu0Y+3/eIipne4JcHQk0JugQ2Yl/6N0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1452
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Add property for digital filter for i2c0 node sama5d4_xplained

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 arch/arm/boot/dts/at91-sama5d4_xplained.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/at91-sama5d4_xplained.dts b/arch/arm/boot/dt=
s/at91-sama5d4_xplained.dts
index fdfc37d..924d949 100644
--- a/arch/arm/boot/dts/at91-sama5d4_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d4_xplained.dts
@@ -49,6 +49,7 @@
 			};
=20
 			i2c0: i2c@f8014000 {
+				i2c-digital-filter;
 				status =3D "okay";
 			};
=20
--=20
2.7.4

