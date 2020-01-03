Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D179E12F659
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2020 10:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbgACJtY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jan 2020 04:49:24 -0500
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:23766 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727537AbgACJtO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jan 2020 04:49:14 -0500
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
  Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="Codrin.Ciubotariu@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com; spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: QGRPuk8gB/8sMupB7q64mmJk3yuh2lpLS21WykBpz3SQ52ZRhjM8lHko16ERwejTa5mAUKwx50
 /0W68Q1IKfazcR7odV491XUep2DTX9b28ZqLRziwwp7M/NJu36hAVSlJuBuxm+8T3FUe4o9Z9p
 kZLLhDR0Lr0N69D9nwYA64v7TfHiUm4MOdl+09aJq2e16KJHw3U5XcVJ3WADTwd7EVppzDJYS8
 0esV2tvwXb7OWPAofQf+3yHEc5dfjpuGvNbpA+J/59MOZplG0zly5cAMsOh+GcpJfUrASst9jF
 APo=
X-IronPort-AV: E=Sophos;i="5.69,390,1571727600"; 
   d="scan'208";a="60069284"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jan 2020 02:49:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 3 Jan 2020 02:49:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 3 Jan 2020 02:49:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnSfnsFAGirEDmN0Fc4V7aXR1HJVSmnW3TqlMR5TiKRSmDRkeNxvnWnEj4dxTVnM1n5wfjyc66rrW+6Ffx++lWNk/AMDglstvogVi3bWGO+IVwMZiJWvdds2jWGVWJ2NKjFveVntOzNNxgVPGoL/wxNz4DqbdmoMGjOfegUM4Ga+rr2kcNhEbMI3PZxKQmYp3zM571L5PO/g+8p649PvKznqoen5h58yc8fQJSVl3AD2q7ngGktlw2hhEKiO2tfEq0F1cfmbNxMRn4p5V3JbOK0kg7nxlAMQBgiUY45pAIdnkyz14bFNveteH/xyujnbbI4VPDbztZccIFBMFk8mBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6bwmnCiDUsQGEXgrGEXUCfuT+rLtPs6FYZ31p5mIOY=;
 b=ZqmsCmFEIWkTtyPSKm3WqN9gbH/MT06uQ9/dgqrJdJsRrpRgc5owvih0Ap+ur+PZ9YWeUa3BSJeHV55azYKgNJd2CWc0UYMw+w3y2/i3dXzJmQvEph5xrXigv5cCzHzKLxCBk+fqloRK+enqSfZutQYpt4r5nqH3XuU8cjhw1gqNM1peCzZjEQgUSyB13YpAPqGv4P0osAX01NXaFfMlla7dnYtWVCRV3kRbnPkEEssc/gyDYMnPXv1j7VuchYUXde9+mJjAr6kdAtSw0KTCb7HOJpuEbv1JvWGcc7KD18t5gJudrfEZIcG3WhTLLH9mpjFYZPPX4uh0BZGTLv32Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6bwmnCiDUsQGEXgrGEXUCfuT+rLtPs6FYZ31p5mIOY=;
 b=Iz0kLaNyZhJT8datfs4hmeA5PA8PwuLkQCP+oYqLoQaU4LH3zhWJPA8JfGfmogLZpA9lSWDijeSyEyuSKaLQFdzP4I11AIKN0MYaQWQ5G6NC8mCPytqsR4ytfHMa/1v1arZl3gziBpJAkPSzxot6WPL5+DZM0dQuZRDx+DWuzEA=
Received: from BY5PR11MB4497.namprd11.prod.outlook.com (52.132.255.220) by
 BY5PR11MB4322.namprd11.prod.outlook.com (10.255.89.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.10; Fri, 3 Jan 2020 09:49:10 +0000
Received: from BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::6189:c32:b55b:b3fd]) by BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::6189:c32:b55b:b3fd%5]) with mapi id 15.20.2602.012; Fri, 3 Jan 2020
 09:49:10 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <kamel.bouhara@bootlin.com>, <wsa@the-dreams.de>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <robh@kernel.org>
Subject: [PATCH v2 6/6] ARM: at91/dt: sama5d2: add i2c gpio pinctrl
Thread-Topic: [PATCH v2 6/6] ARM: at91/dt: sama5d2: add i2c gpio pinctrl
Thread-Index: AQHVwhsLFgQ03HwbOEOfeRBM/f7rHw==
Date:   Fri, 3 Jan 2020 09:49:09 +0000
Message-ID: <20200103094821.13185-7-codrin.ciubotariu@microchip.com>
References: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
In-Reply-To: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [188.25.143.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5fd67e0-952d-430e-0831-08d790322eeb
x-ms-traffictypediagnostic: BY5PR11MB4322:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB43223ACB4A390F181DC51C57E7230@BY5PR11MB4322.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0271483E06
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(376002)(136003)(39860400002)(396003)(346002)(189003)(199004)(36756003)(478600001)(4326008)(6512007)(6486002)(110136005)(54906003)(316002)(5660300002)(186003)(66946007)(66446008)(64756008)(66476007)(66556008)(8676002)(86362001)(6506007)(1076003)(8936002)(76116006)(26005)(81166006)(2906002)(91956017)(71200400001)(81156014)(2616005);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR11MB4322;H:BY5PR11MB4497.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k8x9WlqxGlivoSvKONm587fmmHlCKPDnGQTxdGQv53xHbv/lLahsP8qRNjHNQtlNeY1Qn0pDbhkVkKeXiDNy0Ymn2WovVNGF9C80HA6S4pIxSlchDVk7TEqOKzKi+uIhV2k6xr3vzqw44FQsHnXA2XggLHt/wotzId5lOu7On8vqLceteMOk4u2MVA7TphjwfTv4jPnUHPivcywivK5giAJcBzD6JUWHb+btEIWJHky0zwk4tpZ/6O3JQawJ84rRlspHcSZZQYQSGK8grzE0inXI5+v+7vt9WYDHsVTYHhYKaU7eU1/JHqNZG1bbxju5sTWNFUZZFLJ+/Xvr6DvOwz7ichhQY2RscWzr1o4+YgN6p8rIIVZZwRgnso7iNq+NVH1htAJkNpuzpZj1Nl7EW86ZGOkzAZrgqxpEV0atbSIF0Y62y9cyoS5qcUyXaGi/
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d5fd67e0-952d-430e-0831-08d790322eeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2020 09:49:09.3501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pPUfn8DfI9sJCI8j/KwJT/xpRF6DD+BeRp2ci/JsBYiGmzW0Btpq6HLs2KqH9LkFaisN2cJ7JQNJfprlJvU/+FeNdxAOzVWvwHZSGS9QEgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4322
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Kamel Bouhara <kamel.bouhara@bootlin.com>

Add the i2c gpio pinctrls to support the i2c bus recovery

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---

Changes in v2:
 - new changes;

 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts   | 33 +++++++++++++++++++--
 arch/arm/boot/dts/at91-sama5d2_xplained.dts | 33 +++++++++++++++++++--
 2 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts b/arch/arm/boot/dts/=
at91-sama5d2_ptc_ek.dts
index ba7f3e646c26..b3cd651ecda0 100644
--- a/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts
+++ b/arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts
@@ -180,8 +180,11 @@
=20
 			i2c0: i2c@f8028000 {
 				dmas =3D <0>, <0>;
-				pinctrl-names =3D "default";
+				pinctrl-names =3D "default", "gpio";
 				pinctrl-0 =3D <&pinctrl_i2c0_default>;
+				pinctrl-1 =3D <&pinctrl_i2c0_gpio>;
+				sda-gpios =3D <&pioA PIN_PD21 GPIO_ACTIVE_HIGH>;
+				scl-gpios =3D <&pioA PIN_PD22 GPIO_ACTIVE_HIGH>;
 				status =3D "okay";
 			};
=20
@@ -198,8 +201,11 @@
 					#address-cells =3D <1>;
 					#size-cells =3D <0>;
 					clocks =3D <&pmc PMC_TYPE_PERIPHERAL 19>;
-					pinctrl-names =3D "default";
+					pinctrl-names =3D "default", "gpio";
 					pinctrl-0 =3D <&pinctrl_flx0_default>;
+					pinctrl-1 =3D <&pinctrl_flx0_gpio>;
+					sda-gpios =3D <&pioA PIN_PB28 GPIO_ACTIVE_HIGH>;
+					scl-gpios =3D <&pioA PIN_PB29 GPIO_ACTIVE_HIGH>;
 					atmel,fifo-size =3D <16>;
 					status =3D "okay";
 				};
@@ -226,8 +232,11 @@
=20
 			i2c1: i2c@fc028000 {
 				dmas =3D <0>, <0>;
-				pinctrl-names =3D "default";
+				pinctrl-names =3D "default", "gpio";
 				pinctrl-0 =3D <&pinctrl_i2c1_default>;
+				pinctrl-1 =3D <&pinctrl_i2c1_gpio>;
+				sda-gpios =3D <&pioA PIN_PC6 GPIO_ACTIVE_HIGH>;
+				scl-gpios =3D <&pioA PIN_PC7 GPIO_ACTIVE_HIGH>;
 				status =3D "okay";
=20
 				at24@50 {
@@ -244,18 +253,36 @@
 					bias-disable;
 				};
=20
+				pinctrl_flx0_gpio: flx0_gpio {
+					pinmux =3D <PIN_PB28__GPIO>,
+						 <PIN_PB29__GPIO>;
+					bias-pull-up;
+				};
+
 				pinctrl_i2c0_default: i2c0_default {
 					pinmux =3D <PIN_PD21__TWD0>,
 						 <PIN_PD22__TWCK0>;
 					bias-disable;
 				};
=20
+				pinctrl_i2c0_gpio: i2c0_gpio {
+					pinmux =3D <PIN_PD21__GPIO>,
+						 <PIN_PD22__GPIO>;
+					bias-pull-up;
+				};
+
 				pinctrl_i2c1_default: i2c1_default {
 					pinmux =3D <PIN_PC6__TWD1>,
 						 <PIN_PC7__TWCK1>;
 					bias-disable;
 				};
=20
+				pinctrl_i2c1_gpio: i2c1_gpio {
+					pinmux =3D <PIN_PC6__GPIO>,
+						 <PIN_PC7__GPIO>;
+					bias-pull-up;
+				};
+
 				pinctrl_key_gpio_default: key_gpio_default {
 					pinmux =3D <PIN_PA10__GPIO>;
 					bias-pull-up;
diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained.dts b/arch/arm/boot/dt=
s/at91-sama5d2_xplained.dts
index 9d0a7fbea725..500e49eeb8cc 100644
--- a/arch/arm/boot/dts/at91-sama5d2_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
@@ -129,8 +129,11 @@
=20
 			i2c0: i2c@f8028000 {
 				dmas =3D <0>, <0>;
-				pinctrl-names =3D "default";
+				pinctrl-names =3D "default", "gpio";
 				pinctrl-0 =3D <&pinctrl_i2c0_default>;
+				pinctrl-1 =3D <&pinctrl_i2c0_gpio>;
+				sda-gpios =3D <&pioA PIN_PD21 GPIO_ACTIVE_HIGH>;
+				scl-gpios =3D <&pioA PIN_PD22 GPIO_ACTIVE_HIGH>;
 				i2c-sda-hold-time-ns =3D <350>;
 				status =3D "okay";
=20
@@ -331,8 +334,11 @@
 					#address-cells =3D <1>;
 					#size-cells =3D <0>;
 					clocks =3D <&pmc PMC_TYPE_PERIPHERAL 23>;
-					pinctrl-names =3D "default";
+					pinctrl-names =3D "default", "gpio";
 					pinctrl-0 =3D <&pinctrl_flx4_default>;
+					pinctrl-1 =3D <&pinctrl_flx4_gpio>;
+					sda-gpios =3D <&pioA PIN_PD12 GPIO_ACTIVE_HIGH>;
+					scl-gpios =3D <&pioA PIN_PD13 GPIO_ACTIVE_HIGH>;
 					atmel,fifo-size =3D <16>;
 					i2c-analog-filter;
 					i2c-digital-filter;
@@ -343,11 +349,14 @@
=20
 			i2c1: i2c@fc028000 {
 				dmas =3D <0>, <0>;
-				pinctrl-names =3D "default";
+				pinctrl-names =3D "default", "gpio";
 				pinctrl-0 =3D <&pinctrl_i2c1_default>;
 				i2c-analog-filter;
 				i2c-digital-filter;
 				i2c-digital-filter-width-ns =3D <35>;
+				pinctrl-1 =3D <&pinctrl_i2c1_gpio>;
+				sda-gpios =3D <&pioA PIN_PD4 GPIO_ACTIVE_HIGH>;
+				scl-gpios =3D <&pioA PIN_PD5 GPIO_ACTIVE_HIGH>;
 				status =3D "okay";
=20
 				at24@54 {
@@ -441,18 +450,36 @@
 					bias-disable;
 				};
=20
+				pinctrl_flx4_gpio: flx4_gpio {
+					pinmux =3D <PIN_PD12__GPIO>,
+						 <PIN_PD13__GPIO>;
+					bias-pull-up;
+				};
+
 				pinctrl_i2c0_default: i2c0_default {
 					pinmux =3D <PIN_PD21__TWD0>,
 						 <PIN_PD22__TWCK0>;
 					bias-disable;
 				};
=20
+				pinctrl_i2c0_gpio: i2c0_gpio {
+					pinmux =3D <PIN_PD21__GPIO>,
+						 <PIN_PD22__GPIO>;
+					bias-pull-up;
+				};
+
 				pinctrl_i2c1_default: i2c1_default {
 					pinmux =3D <PIN_PD4__TWD1>,
 						 <PIN_PD5__TWCK1>;
 					bias-disable;
 				};
=20
+				pinctrl_i2c1_gpio: i2c1_gpio {
+					pinmux =3D <PIN_PD4__GPIO>,
+						 <PIN_PD5__GPIO>;
+					bias-pull-up;
+				};
+
 				pinctrl_i2s0_default: i2s0_default {
 					pinmux =3D <PIN_PC1__I2SC0_CK>,
 						 <PIN_PC2__I2SC0_MCK>,
--=20
2.20.1
