Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B07DAF7C6
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2019 10:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbfIKIYm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Sep 2019 04:24:42 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:10202 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727445AbfIKIYl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Sep 2019 04:24:41 -0400
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
IronPort-SDR: pIdJ9mkEooxzjlDELIIZMdn5fz2Res3EIf/jUjP7NSP7BxWndryJy0qRm4E3+nAhMHr4sQ2enr
 hzvveFBq58bJRLsQ4KS//NTQP3F+x/Cf1w/CUNzLl3nqDuyhfObx2A0pCKvCSq0EE+Np81v3iS
 JUfFgGDpinZR3X10+b483FwY1I4/NuVbs3ugv61v6cyiIr9DUG2ibcwoZIsztmxjScF5o7s630
 ZZo49V9qjldiYkEaGKQpHvpa5jx3ruM0HHhNFme3KAVfpPpWgENmfVTGrWbQpE7u3nKJ+MBf4F
 lb8=
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; 
   d="scan'208";a="47036045"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Sep 2019 01:24:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Sep 2019 01:24:39 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 11 Sep 2019 01:24:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZHh/VVJn3KKXe+NBRnQabA59TkmWE9mfcw9LQcZ2VCCTCoJwjfm4T9V+Lx3Tx7mh2htvCgWYtCewf1H/tuSZQ93WlZBRk+FP/l1re4H+e+UBSiuVeHJONnG5VSKwlLvbtqyTmdoi+qt9ca9dYBvm27QcuPMYU4GCWmn65MGcFEm3wG/gmw3ENut82eJVp4tcPpGOs6uFhGKDYrkArWbHCsxH72JZbPSMevq3GWsPppRHo1QZBVAe06dmMcQSuiDVqnCbweq2MZ6KNN5qFXxRDk0i+mwI60ULPZMnGoC2z/0ObijoPKQlMFzhrAYWLjeO35EkFGYfU+eIO7o7NCocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpQwiIxQ/TmQ27nLRpfXe/hbJKYOjyGveN931UB9ROs=;
 b=iG7Uzj13fz7nylxwzaVSruUFLw8+BvaNaVbrrDwzVEnu5rbZVxNpx/Px/N+XA9Kyx7U8hKl6B64MXw8u333bximfk+7h6LaNEwa/Xtj/PPKMCQBvD9tLZ07CXXR7rfIymszwABxk+dJkUZDRMdmeJrXo+EpTpV+m9QGIQrNnTzGcXrvSwlduLld+2uJJqVQHfdWE3sdQAinIdm/ag3ddtNKvJ5+qNKZRi+9loH8bFpwAtXQIcbx7k7HjUq2I1RXb1RjZoYFNt71otXCbom4NzzbYZHkWdaNjsTdl1XMq3YvL3VCClbw3amohoXTzpTJo/gwJj7LqxMbUXyRraQfjaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpQwiIxQ/TmQ27nLRpfXe/hbJKYOjyGveN931UB9ROs=;
 b=ePXcoW5dTSMJJ1+5RzDY25/HK4lBLYSg6R3EpmzRaarO91EDS8jZkfkvnuvTlcY13gyYQXyHUx4yrIFwNcCJ0XWU+xbCPVmwIyliKxcDUY4c7YrWVsrfKI+/X6kW5wXxdx9YPUgqDJWhol+yH+nKqLeQz9k2LSSIfWwLDeQ7ldM=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1452.namprd11.prod.outlook.com (10.172.36.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 08:24:37 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2%12]) with mapi id 15.20.2241.018; Wed, 11 Sep
 2019 08:24:37 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>
CC:     <Eugen.Hristev@microchip.com>, <Nicolas.Ferre@microchip.com>
Subject: [PATCH v5 8/9] ARM: dts: at91: sama5d2_xplained: add analog and
 digital filter for i2c
Thread-Topic: [PATCH v5 8/9] ARM: dts: at91: sama5d2_xplained: add analog and
 digital filter for i2c
Thread-Index: AQHVaHpZizwa+oOgGUChanb3VVtwpg==
Date:   Wed, 11 Sep 2019 08:24:37 +0000
Message-ID: <1568189911-31641-9-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: dff9160a-dc2c-43bd-9e34-08d736917ba8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1452;
x-ms-traffictypediagnostic: DM5PR11MB1452:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1452F1EB5DC0C1A84ED3DC83E8B10@DM5PR11MB1452.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(52116002)(3846002)(2501003)(66556008)(66476007)(66946007)(54906003)(110136005)(478600001)(25786009)(316002)(6436002)(6116002)(76176011)(66066001)(386003)(14454004)(2906002)(102836004)(486006)(476003)(2616005)(11346002)(446003)(6506007)(186003)(26005)(4326008)(8936002)(81166006)(81156014)(7736002)(66446008)(8676002)(5660300002)(50226002)(64756008)(86362001)(2201001)(99286004)(71190400001)(4744005)(71200400001)(53936002)(36756003)(256004)(107886003)(6512007)(305945005)(6486002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1452;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9leJnsO9GDaMNSdPo14XhkWjv2/r3lFaLF4b1CFLBEU3TFQxjclV+Of0mNlWQaND+FJFygw1ssWvRpMe8XtgRpRPFlRk8XA2mZNip8e9pdTXqu+AMSx+A/wGt+k5del77p5gZ3dkCxozjHU1r0lDq8cG5p0MSDroGkgOCXAnX+XNy9YvioaqE93BN35k7H0W3lbE50LXKtSsZWdTJhl95QhqV7k+nZ9SfztsiLeHnyaPZLoEJbh0Sf0bDQ6A0qmurzs8hf8u5E3epDe6fsXA+zYoYPmd8UhFBGidleyPLrNidImy1aG8gf9A1+Iq9maY9RE9YX8QZ5E5bSOG8mswV3ZTa6tXtL4FLXhGsane1mCuogQ5CJF+Ge7YSvftaqhCTH9fmi+Y7cnOs3DBcNERIZloaVOWpT4rr10YfQPC4AA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dff9160a-dc2c-43bd-9e34-08d736917ba8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 08:24:37.2678
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 84PO10ajv4HVRZcgkko/eqMPvJFhqw9PDVZUfxoNx6D5wySlBEgtoBZmIM1kBlQHJ82h88W4z1NhFtxjrY63WJZuee33SAuaPhmY9KmCdE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1452
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Add property for analog and digital filter for i2c1 and i2c2 nodes
for sama5d2_xplained

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 arch/arm/boot/dts/at91-sama5d2_xplained.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained.dts b/arch/arm/boot/dt=
s/at91-sama5d2_xplained.dts
index 808e399..9d0a7fb 100644
--- a/arch/arm/boot/dts/at91-sama5d2_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
@@ -334,6 +334,9 @@
 					pinctrl-names =3D "default";
 					pinctrl-0 =3D <&pinctrl_flx4_default>;
 					atmel,fifo-size =3D <16>;
+					i2c-analog-filter;
+					i2c-digital-filter;
+					i2c-digital-filter-width-ns =3D <35>;
 					status =3D "okay";
 				};
 			};
@@ -342,6 +345,9 @@
 				dmas =3D <0>, <0>;
 				pinctrl-names =3D "default";
 				pinctrl-0 =3D <&pinctrl_i2c1_default>;
+				i2c-analog-filter;
+				i2c-digital-filter;
+				i2c-digital-filter-width-ns =3D <35>;
 				status =3D "okay";
=20
 				at24@54 {
--=20
2.7.4

