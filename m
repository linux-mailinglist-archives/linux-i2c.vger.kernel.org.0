Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6B7636B4
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2019 15:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbfGINTw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jul 2019 09:19:52 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:48060 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbfGINTv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jul 2019 09:19:51 -0400
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: W4By7rnWN36FO3XLkPVDKZTXmaZTcA2W8N32MjFh977Z8j1VclrqS27s93YJfC7gNMx5b1fisK
 7u0apUAtc+p0XO1gjCbIHgvhZk4P2wGDVBor+Cmrcsjr0u/uXGBffTKB+VueP1++y2wo8EBglF
 +aV9M1ZNq7l4XTEhLpBzLBF76P8gWT0MUJVlO27Kp50vgGDz3pTHRQfCwN8Ms2LvBfpbvxOQ+X
 C+Dw5Jfr/9Xg0n8z+sFAhfl6q5YDv8tXHZngjXDWgp7RLwK6g1emK5SJ640e/ojlnvrQ+CSdqY
 QHg=
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; 
   d="scan'208";a="37467836"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jul 2019 06:19:50 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 9 Jul 2019 06:19:48 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 9 Jul 2019 06:19:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cq8xIgYUxgUzQm29HmCZ/WEn8nbiSZ6TOWyjkwjX1Bc=;
 b=mqBoP2p/xEpjCfYDWBKGSpS0ANgHeP8PtEVygNdDMvjZlThIdaZIvNK69WVujs9dwj2SOvv3u1s7lCx4wfuJKWc5wv+lXQcBPJ8uwAa9fbcUKbUFQZo4HJa6Z7qHhhermy6qHZjsZU+7YDN6ty0bFKx0fQa/M6zjSnJSbEPqoZg=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1866.namprd11.prod.outlook.com (10.175.87.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 13:19:48 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925%8]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 13:19:48 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pierre-yves.mordret@st.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>
CC:     <Nicolas.Ferre@microchip.com>, <Eugen.Hristev@microchip.com>
Subject: [PATCH v3 7/9] i2c: at91: add support for analog filtering
Thread-Topic: [PATCH v3 7/9] i2c: at91: add support for analog filtering
Thread-Index: AQHVNlj791nOX1HT/U6j4xjMbRtzOA==
Date:   Tue, 9 Jul 2019 13:19:48 +0000
Message-ID: <1562678049-17581-8-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 44ef458d-72d2-49ff-6131-08d704701e27
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1866;
x-ms-traffictypediagnostic: DM5PR11MB1866:
x-microsoft-antispam-prvs: <DM5PR11MB1866BFABA82724FD4A7E23C7E8F10@DM5PR11MB1866.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(366004)(136003)(376002)(39860400002)(189003)(199004)(72206003)(50226002)(86362001)(4326008)(76176011)(110136005)(66066001)(14454004)(54906003)(2201001)(7416002)(316002)(5660300002)(8936002)(71190400001)(52116002)(71200400001)(8676002)(66446008)(2616005)(66476007)(446003)(53936002)(11346002)(26005)(6512007)(107886003)(256004)(6486002)(6436002)(81166006)(81156014)(64756008)(386003)(66946007)(73956011)(2906002)(66556008)(25786009)(486006)(102836004)(476003)(2501003)(305945005)(68736007)(478600001)(186003)(99286004)(6116002)(6506007)(3846002)(7736002)(36756003)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1866;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: T9Ajvtp1adjUFZMcwAmwfcIdx8tGIoS/aSR9fdN9rVz8KVX69LaYNVUYtmQ10bL65QEGZuEuO5NF2q7gSThF7wU5IqRBIMK6gvwy0Rt+VCC719W8cqFIr77G+X9zVghH0X6qlsPpIOpeKjbKD+oU0P5yaM1DdlsW/XJu8moLqScqD4fWPqw9884tacMsO/JZJpUAd7exK4OnRrIIz1NXSELi0qHHw2vZBphMfN2joyW2PWRe0mfqlDeiO4pZCXAujNeLVKcIG2KNjCVN/hI/16gr4Gh9M3gpadIL4GrD3cUtrHZuGMsVIKHpJZZux/+PVxciZExla4OBkiiC6XT3yGCC/dONpI+iXxx40CwIhrKFz0VZK6c5OTmCba+ljQNsGbxa8Wo6ADbqaC/M7WldKN6CIcTkr1YQnsIeFO05ofw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ef458d-72d2-49ff-6131-08d704701e27
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 13:19:48.6361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1866
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Add support for analog filtering for i2c lines.
The sama5d2 and sam9x60 support this feature.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/i2c/busses/i2c-at91-core.c   |  9 +++++++++
 drivers/i2c/busses/i2c-at91-master.c | 18 ++++++++++++++----
 drivers/i2c/busses/i2c-at91.h        |  3 +++
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at=
91-core.c
index 3bbe37c..d2840ba 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -70,6 +70,7 @@ static struct at91_twi_pdata at91rm9200_config =3D {
 	.has_hold_field =3D false,
 	.has_dig_filtr =3D false,
 	.has_adv_dig_filtr =3D false,
+	.has_ana_filtr =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9261_config =3D {
@@ -80,6 +81,7 @@ static struct at91_twi_pdata at91sam9261_config =3D {
 	.has_hold_field =3D false,
 	.has_dig_filtr =3D false,
 	.has_adv_dig_filtr =3D false,
+	.has_ana_filtr =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9260_config =3D {
@@ -90,6 +92,7 @@ static struct at91_twi_pdata at91sam9260_config =3D {
 	.has_hold_field =3D false,
 	.has_dig_filtr =3D false,
 	.has_adv_dig_filtr =3D false,
+	.has_ana_filtr =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9g20_config =3D {
@@ -100,6 +103,7 @@ static struct at91_twi_pdata at91sam9g20_config =3D {
 	.has_hold_field =3D false,
 	.has_dig_filtr =3D false,
 	.has_adv_dig_filtr =3D false,
+	.has_ana_filtr =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9g10_config =3D {
@@ -110,6 +114,7 @@ static struct at91_twi_pdata at91sam9g10_config =3D {
 	.has_hold_field =3D false,
 	.has_dig_filtr =3D false,
 	.has_adv_dig_filtr =3D false,
+	.has_ana_filtr =3D false,
 };
=20
 static const struct platform_device_id at91_twi_devtypes[] =3D {
@@ -142,6 +147,7 @@ static struct at91_twi_pdata at91sam9x5_config =3D {
 	.has_hold_field =3D false,
 	.has_dig_filtr =3D false,
 	.has_adv_dig_filtr =3D false,
+	.has_ana_filtr =3D false,
 };
=20
 static struct at91_twi_pdata sama5d4_config =3D {
@@ -152,6 +158,7 @@ static struct at91_twi_pdata sama5d4_config =3D {
 	.has_hold_field =3D true,
 	.has_dig_filtr =3D true,
 	.has_adv_dig_filtr =3D false,
+	.has_ana_filtr =3D false,
 };
=20
 static struct at91_twi_pdata sama5d2_config =3D {
@@ -162,6 +169,7 @@ static struct at91_twi_pdata sama5d2_config =3D {
 	.has_hold_field =3D true,
 	.has_dig_filtr =3D true,
 	.has_adv_dig_filtr =3D true,
+	.has_ana_filtr =3D true,
 };
=20
 static struct at91_twi_pdata sam9x60_config =3D {
@@ -172,6 +180,7 @@ static struct at91_twi_pdata sam9x60_config =3D {
 	.has_hold_field =3D true,
 	.has_dig_filtr =3D true,
 	.has_adv_dig_filtr =3D true,
+	.has_ana_filtr =3D true,
 };
=20
 static const struct of_device_id atmel_twi_dt_ids[] =3D {
diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-=
at91-master.c
index 344fd26..4b89610 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -32,6 +32,7 @@
 void at91_init_twi_bus_master(struct at91_twi_dev *dev)
 {
 	struct at91_twi_pdata *pdata =3D dev->pdata;
+	u32 filtr =3D 0;
=20
 	/* FIFO should be enabled immediately after the software reset */
 	if (dev->fifo_size)
@@ -42,13 +43,20 @@ void at91_init_twi_bus_master(struct at91_twi_dev *dev)
=20
 	/* enable digital filter */
 	if (pdata->has_dig_filtr && dev->enable_dig_filt)
-		at91_twi_write(dev, AT91_TWI_FILTR, AT91_TWI_FILTR_FILT);
+		filtr |=3D AT91_TWI_FILTR_FILT;
=20
 	/* enable advanced digital filter */
 	if (pdata->has_adv_dig_filtr && dev->enable_dig_filt)
-		at91_twi_write(dev, AT91_TWI_FILTR, AT91_TWI_FILTR_FILT |
-			       (AT91_TWI_FILTR_THRES(dev->filter_width) &
-				AT91_TWI_FILTR_THRES_MASK));
+		filtr |=3D AT91_TWI_FILTR_FILT |
+			 (AT91_TWI_FILTR_THRES(dev->filter_width) &
+			 AT91_TWI_FILTR_THRES_MASK);
+
+	/* enable analog filter */
+	if (pdata->has_ana_filtr && dev->enable_ana_filt)
+		filtr |=3D AT91_TWI_FILTR_PADFEN;
+
+	if (filtr)
+		at91_twi_write(dev, AT91_TWI_FILTR, filtr);
 }
=20
 /*
@@ -825,6 +833,8 @@ int at91_twi_probe_master(struct platform_device *pdev,
 	dev->enable_dig_filt =3D of_property_read_bool(pdev->dev.of_node,
 						     "i2c-dig-filter");
=20
+	dev->enable_ana_filt =3D of_property_read_bool(pdev->dev.of_node,
+						     "i2c-ana-filter");
 	at91_calc_twi_clock(dev);
=20
 	dev->adapter.algo =3D &at91_twi_algorithm;
diff --git a/drivers/i2c/busses/i2c-at91.h b/drivers/i2c/busses/i2c-at91.h
index d7cf01e3..977a67b 100644
--- a/drivers/i2c/busses/i2c-at91.h
+++ b/drivers/i2c/busses/i2c-at91.h
@@ -86,6 +86,7 @@
=20
 #define AT91_TWI_FILTR		0x0044
 #define AT91_TWI_FILTR_FILT	BIT(0)
+#define AT91_TWI_FILTR_PADFEN	BIT(1)
 #define AT91_TWI_FILTR_THRES(v)		((v) << 8)
 #define AT91_TWI_FILTR_THRES_MAX	7
 #define AT91_TWI_FILTR_THRES_MASK	GENMASK(10, 8)
@@ -116,6 +117,7 @@ struct at91_twi_pdata {
 	bool has_hold_field;
 	bool has_dig_filtr;
 	bool has_adv_dig_filtr;
+	bool has_ana_filtr;
 	struct at_dma_slave dma_slave;
 };
=20
@@ -154,6 +156,7 @@ struct at91_twi_dev {
 	struct i2c_client *slave;
 #endif
 	bool enable_dig_filt;
+	bool enable_ana_filt;
 	u32 filter_width;
 };
=20
--=20
2.7.4

