Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23DA0636C2
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2019 15:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbfGINUP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jul 2019 09:20:15 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:27118 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbfGINUP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jul 2019 09:20:15 -0400
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: j/jbH2V5QjkQrGLBLJYIMwllcxdfJdthXILBJ0MG6pgKqADF3siYKWghhrMR1QY9YAoosVsm3W
 R9A61ENMpNqGv3zdxFywaKjSKj8/kjjPSISWqEcrN9mfB42qvwkXFkcCRy/STtjE6noXqjpUxV
 4gedm1yUhHw33DJlB6qkZPijH9DHq8VTCEKkg9q/jU/P61WLU/2u7MjT5UkIlbHnQmyjbhIFmS
 c+sMx+qfqg7DND+cCQvOFTle6EcxBkLRyeGwr1gc8AGbwVzzeSBAFMiUUdJrOBvOyWr9ykeckP
 +9s=
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; 
   d="scan'208";a="40572156"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jul 2019 06:19:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 9 Jul 2019 06:19:43 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 9 Jul 2019 06:19:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ub58eHA65Ju96UFnMPgCZ1EHKAAOf7u5adUkGcFywH8=;
 b=VEMEI+ZH/Z/Gjv+Cp2Gw1p+Pp1tOM3VMh8t0UFG0uGHHBU4ljl0jkj319EFdTACXSqkWJw4btGU3AcsL3RcQ92c/iyOw/q1x+Jz+qWu4qYKIeaYhKTlGYDCrFEtdPSI7QMk7FuRvxD96yMn205+FA78++A/T0bkYz09Rny8VbgM=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1802.namprd11.prod.outlook.com (10.175.87.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 13:19:42 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925%8]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 13:19:42 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pierre-yves.mordret@st.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>
CC:     <Nicolas.Ferre@microchip.com>, <Eugen.Hristev@microchip.com>
Subject: [PATCH v3 5/9] i2c: at91: add support for digital filtering
Thread-Topic: [PATCH v3 5/9] i2c: at91: add support for digital filtering
Thread-Index: AQHVNlj4SZXsGDZbFke7Py4QXQ+nTw==
Date:   Tue, 9 Jul 2019 13:19:42 +0000
Message-ID: <1562678049-17581-6-git-send-email-eugen.hristev@microchip.com>
References: <1562678049-17581-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1562678049-17581-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0141.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::19) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e39996b-a11a-4405-a9c1-08d704701a85
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1802;
x-ms-traffictypediagnostic: DM5PR11MB1802:
x-microsoft-antispam-prvs: <DM5PR11MB18023740466EE80F5EDC4C49E8F10@DM5PR11MB1802.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(396003)(136003)(376002)(346002)(189003)(199004)(102836004)(256004)(68736007)(476003)(72206003)(2501003)(5660300002)(52116002)(73956011)(6486002)(386003)(6116002)(305945005)(486006)(11346002)(7736002)(66946007)(2616005)(6506007)(2906002)(86362001)(478600001)(8676002)(6436002)(8936002)(3846002)(446003)(66066001)(53936002)(81166006)(71190400001)(26005)(316002)(54906003)(6512007)(36756003)(71200400001)(25786009)(110136005)(99286004)(66446008)(186003)(4326008)(66556008)(7416002)(50226002)(66476007)(81156014)(2201001)(76176011)(14454004)(64756008)(107886003)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1802;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: W5FRMwJx2EMvq8T7Nv2aXBqaB0n0xfVT+Xkkfx0N69/jehMfkGVjFfxzerpCbJk2IHAaD5kMmzp0siwL2idCPuMHKnGdsCMilhHvoZwdKOZ6u0bZ3Y9s4r2I+O5lw+bpZxko+xx3dcnDyD3QqPRYZSiQDqsWL8Ysnu2mWpY0MzKFrrDOy5Ta6sFdok8FqIs8dEnRj8pLR0hAvc3+bCWwp2GxZVP54Ely1Mw3H2KKxDM33zDPxHo+Qt/ZO2zWThaohcr1HFX0WBLbJ6tHE3DHDTckQ4/GX3knFGb9z9dkomxcElwo9jtOvPyFY4Zssi8Wcok1XwSAYqKUL/usYrMNKiDdTecqQU8u91xxOLmuiuktoLAmkX2x8XOyQz9RUj9KH19JOa4oJV/US3jqqyLtBQhSWVDSUtcJrm+qjv2jrws=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e39996b-a11a-4405-a9c1-08d704701a85
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 13:19:42.5571
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

From: Eugen Hristev <eugen.hristev@microchip.com>

Add new platform data support for digital filtering for i2c.
The sama5d4, sama5d2 and sam9x60 support this feature.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/i2c/busses/i2c-at91-core.c   | 9 +++++++++
 drivers/i2c/busses/i2c-at91-master.c | 9 +++++++++
 drivers/i2c/busses/i2c-at91.h        | 5 +++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at=
91-core.c
index a663a7a..62610af 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -68,6 +68,7 @@ static struct at91_twi_pdata at91rm9200_config =3D {
 	.has_unre_flag =3D true,
 	.has_alt_cmd =3D false,
 	.has_hold_field =3D false,
+	.has_dig_filtr =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9261_config =3D {
@@ -76,6 +77,7 @@ static struct at91_twi_pdata at91sam9261_config =3D {
 	.has_unre_flag =3D false,
 	.has_alt_cmd =3D false,
 	.has_hold_field =3D false,
+	.has_dig_filtr =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9260_config =3D {
@@ -84,6 +86,7 @@ static struct at91_twi_pdata at91sam9260_config =3D {
 	.has_unre_flag =3D false,
 	.has_alt_cmd =3D false,
 	.has_hold_field =3D false,
+	.has_dig_filtr =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9g20_config =3D {
@@ -92,6 +95,7 @@ static struct at91_twi_pdata at91sam9g20_config =3D {
 	.has_unre_flag =3D false,
 	.has_alt_cmd =3D false,
 	.has_hold_field =3D false,
+	.has_dig_filtr =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9g10_config =3D {
@@ -100,6 +104,7 @@ static struct at91_twi_pdata at91sam9g10_config =3D {
 	.has_unre_flag =3D false,
 	.has_alt_cmd =3D false,
 	.has_hold_field =3D false,
+	.has_dig_filtr =3D false,
 };
=20
 static const struct platform_device_id at91_twi_devtypes[] =3D {
@@ -130,6 +135,7 @@ static struct at91_twi_pdata at91sam9x5_config =3D {
 	.has_unre_flag =3D false,
 	.has_alt_cmd =3D false,
 	.has_hold_field =3D false,
+	.has_dig_filtr =3D false,
 };
=20
 static struct at91_twi_pdata sama5d4_config =3D {
@@ -138,6 +144,7 @@ static struct at91_twi_pdata sama5d4_config =3D {
 	.has_unre_flag =3D false,
 	.has_alt_cmd =3D false,
 	.has_hold_field =3D true,
+	.has_dig_filtr =3D true,
 };
=20
 static struct at91_twi_pdata sama5d2_config =3D {
@@ -146,6 +153,7 @@ static struct at91_twi_pdata sama5d2_config =3D {
 	.has_unre_flag =3D true,
 	.has_alt_cmd =3D true,
 	.has_hold_field =3D true,
+	.has_dig_filtr =3D true,
 };
=20
 static struct at91_twi_pdata sam9x60_config =3D {
@@ -154,6 +162,7 @@ static struct at91_twi_pdata sam9x60_config =3D {
 	.has_unre_flag =3D true,
 	.has_alt_cmd =3D true,
 	.has_hold_field =3D true,
+	.has_dig_filtr =3D true,
 };
=20
 static const struct of_device_id atmel_twi_dt_ids[] =3D {
diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-=
at91-master.c
index e87232f..099161a 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -31,12 +31,18 @@
=20
 void at91_init_twi_bus_master(struct at91_twi_dev *dev)
 {
+	struct at91_twi_pdata *pdata =3D dev->pdata;
+
 	/* FIFO should be enabled immediately after the software reset */
 	if (dev->fifo_size)
 		at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_FIFOEN);
 	at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_MSEN);
 	at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_SVDIS);
 	at91_twi_write(dev, AT91_TWI_CWGR, dev->twi_cwgr_reg);
+
+	/* enable digital filter */
+	if (pdata->has_dig_filtr && dev->enable_dig_filt)
+		at91_twi_write(dev, AT91_TWI_FILTR, AT91_TWI_FILTR_FILT);
 }
=20
 /*
@@ -792,6 +798,9 @@ int at91_twi_probe_master(struct platform_device *pdev,
 		dev_info(dev->dev, "Using FIFO (%u data)\n", dev->fifo_size);
 	}
=20
+	dev->enable_dig_filt =3D of_property_read_bool(pdev->dev.of_node,
+						     "i2c-dig-filter");
+
 	at91_calc_twi_clock(dev);
=20
 	dev->adapter.algo =3D &at91_twi_algorithm;
diff --git a/drivers/i2c/busses/i2c-at91.h b/drivers/i2c/busses/i2c-at91.h
index 499b506..c75447e 100644
--- a/drivers/i2c/busses/i2c-at91.h
+++ b/drivers/i2c/busses/i2c-at91.h
@@ -84,6 +84,9 @@
 #define	AT91_TWI_ACR_DATAL(len)	((len) & 0xff)
 #define	AT91_TWI_ACR_DIR	BIT(8)
=20
+#define AT91_TWI_FILTR		0x0044
+#define AT91_TWI_FILTR_FILT	BIT(0)
+
 #define	AT91_TWI_FMR		0x0050	/* FIFO Mode Register */
 #define	AT91_TWI_FMR_TXRDYM(mode)	(((mode) & 0x3) << 0)
 #define	AT91_TWI_FMR_TXRDYM_MASK	(0x3 << 0)
@@ -108,6 +111,7 @@ struct at91_twi_pdata {
 	bool has_unre_flag;
 	bool has_alt_cmd;
 	bool has_hold_field;
+	bool has_dig_filtr;
 	struct at_dma_slave dma_slave;
 };
=20
@@ -145,6 +149,7 @@ struct at91_twi_dev {
 	unsigned smr;
 	struct i2c_client *slave;
 #endif
+	bool enable_dig_filt;
 };
=20
 unsigned at91_twi_read(struct at91_twi_dev *dev, unsigned reg);
--=20
2.7.4

