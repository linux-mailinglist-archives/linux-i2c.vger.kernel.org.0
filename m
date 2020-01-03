Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E031512F657
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2020 10:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727532AbgACJtN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jan 2020 04:49:13 -0500
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:23501 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727505AbgACJtM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jan 2020 04:49:12 -0500
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="Codrin.Ciubotariu@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: tdklW5nqeBRItvXvioX1YiwWH0NjFoPVgpis2wAKX4f+DgTiC4L9focbjE9qvUEkwMEgVlI3Sj
 6kZXqc13OIP5IEQYSdWX6W0lQIG9XP0BZ7agi3t0t5/GGvUVUnWaxoU4J8cpg4KQd4e3RqeTFW
 tT10S+PDv5FPYqekgvltvHs74D9qRJOD5NmFuQ4EWjj+JUkE1VAlRdHrO07f2UNU7urWk7777x
 w4/Fm3nV0jXarzjT/LBpgYuxqtCGd0+HkAAg4Hr6yGfUCfy1PuSIlfEpO2+mLDoGPnKHmFi5n8
 Npc=
X-IronPort-AV: E=Sophos;i="5.69,390,1571727600"; 
   d="scan'208";a="63549989"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jan 2020 02:49:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 3 Jan 2020 02:49:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 3 Jan 2020 02:49:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E94XzVKAiboPpc7fUQOdCztqRMGtkV8TGrAMeAeDR4BMTlxFd4ZKYsIiYYoXt9CbF89gvUEu1ebxTy+TGTPNaAvNferORys5fAOGS2me/liGBBoeGMXXe1K29H4qQ3BcAIsWroy0sV402ANjOg+Ek1usPGV77vDXPPOCvUZ6twl2OawpR6L19lfp3rvvMTfLv/tIt3s4IjZq/Trn2OHJW8EGj8xFnSWaB4rDhDSiy5Ddck1d3kpQNmvtB/50SY5sQ7ERWjQh33Xuls+3mUmRSN/HMUHseTFPLSIw/BNe1Dge7NMxfhMbYnpKuHbm9T4hYV3xqrGicNoqobmcNGM/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0faNSusnFY0oLWC3QmpbekQ4RtIJOw9yxLif3zF1GM=;
 b=jiNfHvDaWOBSVxIuKuwFd1Enc8GyLK229fpD5XrS1uzHHoLEvzfyS1ZZasTHQSdkpvEKZui1LDBd0Fd9LOnF8TIIXmXrZznazddpfMkZeNekDP4XUJH7silF64B0i0xyLNKLNXeMYPJOe+mRnELgIDdGUL41sc3k4fUlpcV++ZvB3wph58cS/ud1QPKmvJufjyC7HPfd8lifN9cpzvgY9XnXZmwNxuMuKPbx8h46LO2KA8ovmmMCl7BhK1v8Gk5iVltREJ5+2NBKcstqrjgOGOXLrMA/yS/iF3yhlGkAHqcMVzpTwP2B92AytEPwe928KgLpeoIFmSLjRIKcmCVbXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0faNSusnFY0oLWC3QmpbekQ4RtIJOw9yxLif3zF1GM=;
 b=jld1yPTVoAfpSeREMC7TY/l+X/3uuLCZK2937UUGcLMa4HPuwpWXorQmaRtaMVy3LlJU6WNBegmNxT1/0jpC71Cb355p9nVTNyJd7WhaAKMSNaxfQa64gVduMNQzEpslyrXFOzEf3emgc7yajTPorlZhpaK4P+SUhWYBuEpeu1c=
Received: from BY5PR11MB4497.namprd11.prod.outlook.com (52.132.255.220) by
 BY5PR11MB4322.namprd11.prod.outlook.com (10.255.89.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.10; Fri, 3 Jan 2020 09:49:09 +0000
Received: from BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::6189:c32:b55b:b3fd]) by BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::6189:c32:b55b:b3fd%5]) with mapi id 15.20.2602.012; Fri, 3 Jan 2020
 09:49:09 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <kamel.bouhara@bootlin.com>, <wsa@the-dreams.de>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <robh@kernel.org>
Subject: [PATCH v2 4/6] ARM: at91/dt: sama5d3: add i2c gpio pinctrl
Thread-Topic: [PATCH v2 4/6] ARM: at91/dt: sama5d3: add i2c gpio pinctrl
Thread-Index: AQHVwhsLdxsZpEnI6UWudjXfEFHmNw==
Date:   Fri, 3 Jan 2020 09:49:08 +0000
Message-ID: <20200103094821.13185-5-codrin.ciubotariu@microchip.com>
References: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
In-Reply-To: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [188.25.143.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b32bdd86-b601-4170-987b-08d790322e5c
x-ms-traffictypediagnostic: BY5PR11MB4322:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB43227236EEFA5E7967BA8802E7230@BY5PR11MB4322.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-forefront-prvs: 0271483E06
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(376002)(136003)(39860400002)(396003)(346002)(189003)(199004)(36756003)(478600001)(4326008)(6512007)(6486002)(110136005)(54906003)(316002)(5660300002)(186003)(66946007)(66446008)(64756008)(66476007)(66556008)(8676002)(86362001)(6506007)(1076003)(8936002)(76116006)(26005)(81166006)(2906002)(91956017)(71200400001)(81156014)(2616005);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR11MB4322;H:BY5PR11MB4497.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /gorkqQmQPKyu3PocDb71WlHaHCPtGnPO2wqlT3J7pjSZjDr4DcNaayRoaLsG1wOEA+6txDiMGPIEedMl8vTQWRDVHMTVdORrHldGp16P1B442sA1SBIJgIH/P6ld/1QbzvwTdwPrF9nVXKLpUYfIOZouSapiJj36uSqr5aMlLND2mhw+vTqUNNjEJe6XkPC3VFLuiW+gNSByIzNAdm/2uHjxc4aks/D0b0j72+bHFWMu34p2jG40IeXpsYCaWPC/E2olrGAeFJi6LSlEF+wrZsiT4hsnblAu1m+cKDmUn9CaDZjJbZAlQfzbzp0aozaGZegjdnkn02AC6yUI7SYpD531xxHUA91TzFlMNVZtBochVPHlYr37bJtTTWG85N4+EZQ5jEn6KXFIvtD8uE044MPXctB9a+VblJhxugfH4zceHQgepPCSfBH+3Xw7m10
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b32bdd86-b601-4170-987b-08d790322e5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2020 09:49:08.3187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I4m8CQeAuJqfZ/LKUK4nGv75rvFfHTDmjVuSxe0+AkUupNpAqDjepN6bu1B27/M+K/TF/mYGtHisMR3zmujMSSfW1xzvqQcdY1Ft0KcYup8=
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
 - none;

 arch/arm/boot/dts/sama5d3.dtsi | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dts=
i
index f770aace0efd..faf8907d8d7d 100644
--- a/arch/arm/boot/dts/sama5d3.dtsi
+++ b/arch/arm/boot/dts/sama5d3.dtsi
@@ -159,8 +159,11 @@
 				dmas =3D <&dma0 2 AT91_DMA_CFG_PER_ID(7)>,
 				       <&dma0 2 AT91_DMA_CFG_PER_ID(8)>;
 				dma-names =3D "tx", "rx";
-				pinctrl-names =3D "default";
+				pinctrl-names =3D "default", "gpio";
 				pinctrl-0 =3D <&pinctrl_i2c0>;
+				pinctrl-1 =3D <&pinctrl_i2c0_gpio>;
+				sda-gpios =3D <&pioA 30 GPIO_ACTIVE_HIGH>;
+				scl-gpios =3D <&pioA 31 GPIO_ACTIVE_HIGH>;
 				#address-cells =3D <1>;
 				#size-cells =3D <0>;
 				clocks =3D <&twi0_clk>;
@@ -174,8 +177,11 @@
 				dmas =3D <&dma0 2 AT91_DMA_CFG_PER_ID(9)>,
 				       <&dma0 2 AT91_DMA_CFG_PER_ID(10)>;
 				dma-names =3D "tx", "rx";
-				pinctrl-names =3D "default";
+				pinctrl-names =3D "default", "gpio";
 				pinctrl-0 =3D <&pinctrl_i2c1>;
+				pinctrl-1 =3D <&pinctrl_i2c1_gpio>;
+				sda-gpios =3D <&pioC 26 GPIO_ACTIVE_HIGH>;
+				scl-gpios =3D <&pioC 27 GPIO_ACTIVE_HIGH>;
 				#address-cells =3D <1>;
 				#size-cells =3D <0>;
 				clocks =3D <&twi1_clk>;
@@ -357,8 +363,11 @@
 				dmas =3D <&dma1 2 AT91_DMA_CFG_PER_ID(11)>,
 				       <&dma1 2 AT91_DMA_CFG_PER_ID(12)>;
 				dma-names =3D "tx", "rx";
-				pinctrl-names =3D "default";
+				pinctrl-names =3D "default", "gpio";
 				pinctrl-0 =3D <&pinctrl_i2c2>;
+				pinctrl-1 =3D <&pinctrl_i2c2_gpio>;
+				sda-gpios =3D <&pioA 18 GPIO_ACTIVE_HIGH>;
+				scl-gpios =3D <&pioA 19 GPIO_ACTIVE_HIGH>;
 				#address-cells =3D <1>;
 				#size-cells =3D <0>;
 				clocks =3D <&twi2_clk>;
@@ -639,6 +648,12 @@
 							<AT91_PIOA 30 AT91_PERIPH_A AT91_PINCTRL_NONE	/* PA30 periph A TWD0=
 pin, conflicts with URXD1, ISI_VSYNC */
 							 AT91_PIOA 31 AT91_PERIPH_A AT91_PINCTRL_NONE>;	/* PA31 periph A TW=
CK0 pin, conflicts with UTXD1, ISI_HSYNC */
 					};
+
+					pinctrl_i2c0_gpio: i2c0-gpio {
+						atmel,pins =3D
+							<AT91_PIOA 30 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP
+							 AT91_PIOA 31 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP>;
+					};
 				};
=20
 				i2c1 {
@@ -647,6 +662,12 @@
 							<AT91_PIOC 26 AT91_PERIPH_B AT91_PINCTRL_NONE	/* PC26 periph B TWD1=
 pin, conflicts with SPI1_NPCS1, ISI_D11 */
 							 AT91_PIOC 27 AT91_PERIPH_B AT91_PINCTRL_NONE>;	/* PC27 periph B TW=
CK1 pin, conflicts with SPI1_NPCS2, ISI_D10 */
 					};
+
+					pinctrl_i2c1_gpio: i2c1-gpio {
+						atmel,pins =3D
+							<AT91_PIOC 26 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP
+							 AT91_PIOC 27 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP>;
+					};
 				};
=20
 				i2c2 {
@@ -655,6 +676,12 @@
 							<AT91_PIOA 18 AT91_PERIPH_B AT91_PINCTRL_NONE	/* TWD2 pin, conflict=
s with LCDDAT18, ISI_D2 */
 							 AT91_PIOA 19 AT91_PERIPH_B AT91_PINCTRL_NONE>; /* TWCK2 pin, confl=
icts with LCDDAT19, ISI_D3 */
 					};
+
+					pinctrl_i2c2_gpio: i2c2-gpio {
+						atmel,pins =3D
+							<AT91_PIOA 18 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP
+							 AT91_PIOA 19 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP>;
+					};
 				};
=20
 				isi {
--=20
2.20.1
