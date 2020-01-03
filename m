Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88DE012F64B
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2020 10:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbgACJtN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jan 2020 04:49:13 -0500
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:23501 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727520AbgACJtN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jan 2020 04:49:13 -0500
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
IronPort-SDR: zcTxnuMqBV/VDZlx2YLX4M4AsiU+oy0SrywAOQJ+47ihAH0hnWvyvCEAqwZVEU3nYztAmw7CJA
 FhSnWZw9goio7KQUQuWMjACiZnP6l/hUV1k3BOdN28ekPkOHpCSPDiuagslljp+2TxrF/EpELC
 tjarAE6x06onlR6fYztiNKw5ga/+qK88tSfUiNfzKaDtosjoM8Lgj4tP4od1Liy69K+761iLox
 xWWcTV1aMZpYq0efK1qyNyPQ7aDfvk0IajWMzEboo80DXPbe3Mnwhj6Qhm17AzOAh2elXreSp0
 Rzo=
X-IronPort-AV: E=Sophos;i="5.69,390,1571727600"; 
   d="scan'208";a="63549992"
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
 b=T5/6Ps8cLWAe1V5lt5ELetDSN8swpk9i0rFZ9o/ZoGRy/khJ+pfpMBWR2dVv5UG7iLJz0UiUmSH6GO4wfK1GlqaLouwiMrLSR3OMIxPYE1oflSobTSRc5Qd7oCaUwxGn/GLFwvD7k8zEomA/LHnpfi8cPMK6c3CEh4PZT2EotmDUGitG3JK9X6jrKTqJVMqZZ0+W6y1L6XQ5ON47O0/YPESppTIeraNDfQJ53z0ZGD2El7uJWDddSiRkK/LcfrK9VJTA8yB34yXoh+XIpM4HTqFl9zhM+R0evT+z/mJhY3LD2MVFOVNlL70cik4WCsZ4qGU87r2CiXlPqoSuiaGHpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNlY4/geJghROeW3WAIqePb9FJ3R0XEowKqPU+31Cz4=;
 b=abDN0uzl85sz8Buedy+c4lfNnG1J+R/Mchb+0i0mMkrOj+3RefOOtnfq2TGC1qnk8SQ9YbNePt9cHUnAACUJ57MOwWOagmK6ttyyzRyDXcAU5Ygtz108bW40/XAXq/VpAYeV/e1Dur+sMhYiKKh7ze0VyZuaB0OD2s4Ah2e48z9kErqjx517UHdNrmW85dnpv/jyH1TMnWSTCiiOa7sB6/N6jczMFf4PE0lShjjBiYqCWuXc7A2U3Ow4MVZ02/VPANQcR4S0zfbQe3qqwVnKprJNv5+aXzEbTBohI5oGiEokJRtuBDubC5j8VrDzpuYKu3WTzaTCjRMVxUh61XVM9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNlY4/geJghROeW3WAIqePb9FJ3R0XEowKqPU+31Cz4=;
 b=Rc21yiw55y2lBBPD4UvHxqmJUvM/Uj1hWzmNdflySrCum4RbQZgfJw0THhfEDGjfJdhaebtJHcZHUhJ6WdDt7cmxONpVv7YPDoVLDp2/9iTZBfDEu+eMhNBZWrCVU6ou7w2TO7w8c1v9Qs/kmyUZy7MflwUCEZX8uaOxkMjPmaI=
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
Subject: [PATCH v2 5/6] ARM: at91/dt: sama5d4: add i2c gpio pinctrl
Thread-Topic: [PATCH v2 5/6] ARM: at91/dt: sama5d4: add i2c gpio pinctrl
Thread-Index: AQHVwhsLamZuwKYHskigz/jRdMTeAQ==
Date:   Fri, 3 Jan 2020 09:49:08 +0000
Message-ID: <20200103094821.13185-6-codrin.ciubotariu@microchip.com>
References: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
In-Reply-To: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [188.25.143.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31a3c802-fee1-442e-08a7-08d790322ea5
x-ms-traffictypediagnostic: BY5PR11MB4322:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4322678648C1AB7344CBE645E7230@BY5PR11MB4322.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 0271483E06
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(376002)(136003)(39860400002)(396003)(346002)(189003)(199004)(36756003)(478600001)(4326008)(6512007)(6486002)(110136005)(54906003)(316002)(5660300002)(186003)(66946007)(66446008)(64756008)(66476007)(66556008)(8676002)(86362001)(6506007)(1076003)(8936002)(76116006)(26005)(81166006)(2906002)(91956017)(71200400001)(81156014)(2616005);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR11MB4322;H:BY5PR11MB4497.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9ZsEwlLaRH4ggki1zHIrtvTe8URLGQ3XuebQn0vhWt+PBqNtoqe52QhuBOavbE5GkFORisOKJQhsj7lWad3Pfnx49Jbbz4LRiO4dGn3Kj8MRaKNCcA5FVJv0Ei9hAnlcN/FM1/n4FUi89usCJm5gCBwNWOWqp5b8I2Lurjj3l+ggK10l4sz1p2RjebfcPUQsh2oNx1peAqMvL/1mGkAYw7pNeMcVWcuGGj53TPTmth6gx0gtUQo815UUOqaN1PkA4/P6EuFhvUox02pS6V5A+c8hGw0rOXm8AETH3JbKr4vtdFxObZZTy93emy6jmoIylnBEgZULLus6E8qrhHA0hZcAQAPCRGhjrfl12hsrg91KY+lfq6FQj+mFg6HSOsh6JghOY9VdM0HDMW72l2S1W5bJZaJbyA5HKOd4eXaVG29b0ndVj5X61451h8XeHlrr
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a3c802-fee1-442e-08a7-08d790322ea5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2020 09:49:08.8124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AUqqcUE0bKx90Lblv5YZ+zbm0HuPmteg27MVPiOVQtOnlm/1V9/p6BeMdH0JaFIKe4UmPedtixeRxbCzSupH47+Xuc4H8T/ybcJMMyVThLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4322
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Kamel Bouhara <kamel.bouhara@bootlin.com>

Add the i2c gpio pinctrls so the i2c bus recovery option can be enabled

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---

Changes in v2:
 - none;

 arch/arm/boot/dts/sama5d4.dtsi | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dts=
i
index 6ab27a7b388d..34351baab985 100644
--- a/arch/arm/boot/dts/sama5d4.dtsi
+++ b/arch/arm/boot/dts/sama5d4.dtsi
@@ -458,8 +458,11 @@
 					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
 					| AT91_XDMAC_DT_PERID(3))>;
 				dma-names =3D "tx", "rx";
-				pinctrl-names =3D "default";
+				pinctrl-names =3D "default", "gpio";
 				pinctrl-0 =3D <&pinctrl_i2c0>;
+				pinctrl-1 =3D <&pinctrl_i2c0_gpio>;
+				sda-gpios =3D <&pioA 30 GPIO_ACTIVE_HIGH>;
+				scl-gpios =3D <&pioA 31 GPIO_ACTIVE_HIGH>;
 				#address-cells =3D <1>;
 				#size-cells =3D <0>;
 				clocks =3D <&pmc PMC_TYPE_PERIPHERAL 32>;
@@ -477,8 +480,11 @@
 					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
 					| AT91_XDMAC_DT_PERID(5))>;
 				dma-names =3D "tx", "rx";
-				pinctrl-names =3D "default";
+				pinctrl-names =3D "default", "gpio";
 				pinctrl-0 =3D <&pinctrl_i2c1>;
+				pinctrl-1 =3D <&pinctrl_i2c1_gpio>;
+				sda-gpios =3D <&pioE 29 GPIO_ACTIVE_HIGH>;
+				scl-gpios =3D <&pioE 30 GPIO_ACTIVE_HIGH>;
 				#address-cells =3D <1>;
 				#size-cells =3D <0>;
 				clocks =3D <&pmc PMC_TYPE_PERIPHERAL 33>;
@@ -519,8 +525,11 @@
 					(AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
 					| AT91_XDMAC_DT_PERID(7))>;
 				dma-names =3D "tx", "rx";
-				pinctrl-names =3D "default";
+				pinctrl-names =3D "default", "gpio";
 				pinctrl-0 =3D <&pinctrl_i2c2>;
+				pinctrl-1 =3D <&pinctrl_i2c2_gpio>;
+				sda-gpios =3D <&pioB 29 GPIO_ACTIVE_HIGH>;
+				scl-gpios =3D <&pioB 30 GPIO_ACTIVE_HIGH>;
 				#address-cells =3D <1>;
 				#size-cells =3D <0>;
 				clocks =3D <&pmc PMC_TYPE_PERIPHERAL 34>;
@@ -1122,6 +1131,12 @@
 							<AT91_PIOA 30 AT91_PERIPH_A AT91_PINCTRL_NONE
 							 AT91_PIOA 31 AT91_PERIPH_A AT91_PINCTRL_NONE>;
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
@@ -1130,6 +1145,12 @@
 							<AT91_PIOE 29 AT91_PERIPH_C AT91_PINCTRL_NONE	/* TWD1, conflicts wi=
th UART0 RX and DIBP */
 							 AT91_PIOE 30 AT91_PERIPH_C AT91_PINCTRL_NONE>;	/* TWCK1, conflicts=
 with UART0 TX and DIBN */
 					};
+
+					pinctrl_i2c1_gpio: i2c1-gpio {
+						atmel,pins =3D
+							<AT91_PIOE 29 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP
+							 AT91_PIOE 30 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP>;
+					};
 				};
=20
 				i2c2 {
@@ -1138,6 +1159,12 @@
 							<AT91_PIOB 29 AT91_PERIPH_A AT91_PINCTRL_NONE	/* TWD2, conflicts wi=
th RD0 and PWML1 */
 							 AT91_PIOB 30 AT91_PERIPH_A AT91_PINCTRL_NONE>; /* TWCK2, conflicts=
 with RF0 */
 					};
+
+					pinctrl_i2c2_gpio: i2c2-gpio {
+						atmel,pins =3D
+							<AT91_PIOB 29 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP
+							 AT91_PIOB 30 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP>;
+					};
 				};
=20
 				isi {
--=20
2.20.1
