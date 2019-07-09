Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01123636B1
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2019 15:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbfGINTt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jul 2019 09:19:49 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:48060 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbfGINTs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jul 2019 09:19:48 -0400
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
IronPort-SDR: U0i1btNI/c7v3gumnK5wB2apsNSVdEkvLnwss1V+ZIeD0PrtJB7d8cqP87m1vj5yvZvoxHaVZK
 FX056Kb9Q2I4nMvlF2cODd+WL8MdfaWVg7PylE0KDuppTfau4pJyYja1sax2TL8cqJ+PCDe24W
 wzaUrRAxpvQMTU1FBBCxcWOxPyoqitn92nSCybtQ3sWgpSfZGl1nHJZGdMIkx8wLATdzg9EqaN
 qyYxC2FnCPJ3qPdY7imyIoBs8NLihu/5rp6NzqfDoBjnrF0GAAGnuLJLp21/bEO+HJxxl1qc1U
 yjo=
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; 
   d="scan'208";a="37467822"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jul 2019 06:19:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 9 Jul 2019 06:19:46 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 9 Jul 2019 06:19:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtfFAjhWF7zyhBsTpkKQMMF6FnzUEzlq1GL8CSUmW1c=;
 b=VV3SGYOgDUsEyvOmZHInQPo550AoFqBJoqsRS1h9okisV6PrVvml9guUBECMTFNH4Y2zkelk2BzruuHbk4RsXyJ40vWgunq+OTa0CqZ5AGYXpsB7PiukoVA+bH/c7ZlA91B8jmQx+h087ojeLBuBSE9f7k2Gxv9Dhspw8Lxk5WY=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1866.namprd11.prod.outlook.com (10.175.87.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 13:19:45 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925%8]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 13:19:45 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pierre-yves.mordret@st.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>
CC:     <Nicolas.Ferre@microchip.com>, <Eugen.Hristev@microchip.com>
Subject: [PATCH v3 6/9] i2c: at91: add support for advanced digital filtering
Thread-Topic: [PATCH v3 6/9] i2c: at91: add support for advanced digital
 filtering
Thread-Index: AQHVNlj6EHV1bX79Z0OLt4gejk1ZRw==
Date:   Tue, 9 Jul 2019 13:19:45 +0000
Message-ID: <1562678049-17581-7-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: c3cf058f-8888-4cd1-766c-08d704701c5e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1866;
x-ms-traffictypediagnostic: DM5PR11MB1866:
x-microsoft-antispam-prvs: <DM5PR11MB1866CD1CD925283ED327F6EDE8F10@DM5PR11MB1866.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(366004)(136003)(376002)(39860400002)(189003)(199004)(72206003)(50226002)(86362001)(4326008)(76176011)(110136005)(66066001)(14454004)(54906003)(2201001)(7416002)(316002)(5660300002)(8936002)(71190400001)(52116002)(71200400001)(8676002)(66446008)(2616005)(66476007)(446003)(53936002)(11346002)(26005)(6512007)(107886003)(256004)(6486002)(6436002)(81166006)(81156014)(64756008)(386003)(66946007)(73956011)(2906002)(66556008)(25786009)(486006)(102836004)(476003)(2501003)(305945005)(68736007)(478600001)(186003)(99286004)(6116002)(6506007)(3846002)(7736002)(36756003)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1866;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: J9EZZ2s2W1dsGfUEMPPntMgMXK6iz6GhI2u1y0KxTAlRe1UrCDMfZ8vPEZRJ2GMHji3QNW4zJ80nK3tHd41XRt0egaH5I1nGvqpd0KC+vOVU/rr1CHjutrc7vaU1CfFHsf6NUo/JPU3QvShMKq++8hDGLqik/g4Ta82qUSQc9qvJu4oeWYH0HeXLywrTx2W+ei74wdQ4HMhP6oQkU6npB8ejS3E1V2muqY96JVJVrNea/5T20ai1dKGS6MFxB7n3wW1PY6nCTOgbrK9Ex3d1YZjW5Veep/Sy0h9FaTSvA5dFOZbDZ0twOBYy2KCGrbU57n/gQUnGBXXoZmkKIPQ6uKzwdCgQGfBrLdPNoN+Qe2eAzKsNLbDJRwCVGP3pQFBe1cxHctyxr5VyxnI5cMXKSiPJpNvSagpmCk3GnXRERss=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c3cf058f-8888-4cd1-766c-08d704701c5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 13:19:45.7707
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

Add new platform data support for advanced digital filtering for i2c.
The sama5d2 and sam9x60 support this feature.
This digital filter allows the user to configure the maximum
width of the spikes that can be filtered.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/i2c/busses/i2c-at91-core.c   |  9 +++++++++
 drivers/i2c/busses/i2c-at91-master.c | 30 +++++++++++++++++++++++++++---
 drivers/i2c/busses/i2c-at91.h        |  5 +++++
 3 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at=
91-core.c
index 62610af..3bbe37c 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -69,6 +69,7 @@ static struct at91_twi_pdata at91rm9200_config =3D {
 	.has_alt_cmd =3D false,
 	.has_hold_field =3D false,
 	.has_dig_filtr =3D false,
+	.has_adv_dig_filtr =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9261_config =3D {
@@ -78,6 +79,7 @@ static struct at91_twi_pdata at91sam9261_config =3D {
 	.has_alt_cmd =3D false,
 	.has_hold_field =3D false,
 	.has_dig_filtr =3D false,
+	.has_adv_dig_filtr =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9260_config =3D {
@@ -87,6 +89,7 @@ static struct at91_twi_pdata at91sam9260_config =3D {
 	.has_alt_cmd =3D false,
 	.has_hold_field =3D false,
 	.has_dig_filtr =3D false,
+	.has_adv_dig_filtr =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9g20_config =3D {
@@ -96,6 +99,7 @@ static struct at91_twi_pdata at91sam9g20_config =3D {
 	.has_alt_cmd =3D false,
 	.has_hold_field =3D false,
 	.has_dig_filtr =3D false,
+	.has_adv_dig_filtr =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9g10_config =3D {
@@ -105,6 +109,7 @@ static struct at91_twi_pdata at91sam9g10_config =3D {
 	.has_alt_cmd =3D false,
 	.has_hold_field =3D false,
 	.has_dig_filtr =3D false,
+	.has_adv_dig_filtr =3D false,
 };
=20
 static const struct platform_device_id at91_twi_devtypes[] =3D {
@@ -136,6 +141,7 @@ static struct at91_twi_pdata at91sam9x5_config =3D {
 	.has_alt_cmd =3D false,
 	.has_hold_field =3D false,
 	.has_dig_filtr =3D false,
+	.has_adv_dig_filtr =3D false,
 };
=20
 static struct at91_twi_pdata sama5d4_config =3D {
@@ -145,6 +151,7 @@ static struct at91_twi_pdata sama5d4_config =3D {
 	.has_alt_cmd =3D false,
 	.has_hold_field =3D true,
 	.has_dig_filtr =3D true,
+	.has_adv_dig_filtr =3D false,
 };
=20
 static struct at91_twi_pdata sama5d2_config =3D {
@@ -154,6 +161,7 @@ static struct at91_twi_pdata sama5d2_config =3D {
 	.has_alt_cmd =3D true,
 	.has_hold_field =3D true,
 	.has_dig_filtr =3D true,
+	.has_adv_dig_filtr =3D true,
 };
=20
 static struct at91_twi_pdata sam9x60_config =3D {
@@ -163,6 +171,7 @@ static struct at91_twi_pdata sam9x60_config =3D {
 	.has_alt_cmd =3D true,
 	.has_hold_field =3D true,
 	.has_dig_filtr =3D true,
+	.has_adv_dig_filtr =3D true,
 };
=20
 static const struct of_device_id atmel_twi_dt_ids[] =3D {
diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-=
at91-master.c
index 099161a..344fd26 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -43,6 +43,12 @@ void at91_init_twi_bus_master(struct at91_twi_dev *dev)
 	/* enable digital filter */
 	if (pdata->has_dig_filtr && dev->enable_dig_filt)
 		at91_twi_write(dev, AT91_TWI_FILTR, AT91_TWI_FILTR_FILT);
+
+	/* enable advanced digital filter */
+	if (pdata->has_adv_dig_filtr && dev->enable_dig_filt)
+		at91_twi_write(dev, AT91_TWI_FILTR, AT91_TWI_FILTR_FILT |
+			       (AT91_TWI_FILTR_THRES(dev->filter_width) &
+				AT91_TWI_FILTR_THRES_MASK));
 }
=20
 /*
@@ -51,7 +57,7 @@ void at91_init_twi_bus_master(struct at91_twi_dev *dev)
  */
 static void at91_calc_twi_clock(struct at91_twi_dev *dev)
 {
-	int ckdiv, cdiv, div, hold =3D 0;
+	int ckdiv, cdiv, div, hold =3D 0, filter_width =3D 0;
 	struct at91_twi_pdata *pdata =3D dev->pdata;
 	int offset =3D pdata->clk_offset;
 	int max_ckdiv =3D pdata->clk_max_div;
@@ -90,11 +96,29 @@ static void at91_calc_twi_clock(struct at91_twi_dev *de=
v)
 		}
 	}
=20
+	if (pdata->has_adv_dig_filtr) {
+		/*
+		 * filter width =3D 0 to AT91_TWI_FILTR_THRES_MAX
+		 * peripheral clocks
+		 */
+		filter_width =3D DIV_ROUND_UP(t->filter_width_ns
+				* (clk_get_rate(dev->clk) / 1000), 1000000);
+		if (filter_width > AT91_TWI_FILTR_THRES_MAX) {
+			dev_warn(dev->dev,
+				"Filter threshold set to its maximum value (%d instead of %d)\n",
+				AT91_TWI_FILTR_THRES_MAX, filter_width);
+			filter_width =3D AT91_TWI_FILTR_THRES_MAX;
+		}
+	}
+
 	dev->twi_cwgr_reg =3D (ckdiv << 16) | (cdiv << 8) | cdiv
 			    | AT91_TWI_CWGR_HOLD(hold);
=20
-	dev_dbg(dev->dev, "cdiv %d ckdiv %d hold %d (%d ns)\n",
-		cdiv, ckdiv, hold, t->sda_hold_ns);
+	dev->filter_width =3D filter_width;
+
+	dev_dbg(dev->dev, "cdiv %d ckdiv %d hold %d (%d ns), filter_width %d (%d =
ns)\n",
+		cdiv, ckdiv, hold, t->sda_hold_ns, filter_width,
+		t->filter_width_ns);
 }
=20
 static void at91_twi_dma_cleanup(struct at91_twi_dev *dev)
diff --git a/drivers/i2c/busses/i2c-at91.h b/drivers/i2c/busses/i2c-at91.h
index c75447e..d7cf01e3 100644
--- a/drivers/i2c/busses/i2c-at91.h
+++ b/drivers/i2c/busses/i2c-at91.h
@@ -86,6 +86,9 @@
=20
 #define AT91_TWI_FILTR		0x0044
 #define AT91_TWI_FILTR_FILT	BIT(0)
+#define AT91_TWI_FILTR_THRES(v)		((v) << 8)
+#define AT91_TWI_FILTR_THRES_MAX	7
+#define AT91_TWI_FILTR_THRES_MASK	GENMASK(10, 8)
=20
 #define	AT91_TWI_FMR		0x0050	/* FIFO Mode Register */
 #define	AT91_TWI_FMR_TXRDYM(mode)	(((mode) & 0x3) << 0)
@@ -112,6 +115,7 @@ struct at91_twi_pdata {
 	bool has_alt_cmd;
 	bool has_hold_field;
 	bool has_dig_filtr;
+	bool has_adv_dig_filtr;
 	struct at_dma_slave dma_slave;
 };
=20
@@ -150,6 +154,7 @@ struct at91_twi_dev {
 	struct i2c_client *slave;
 #endif
 	bool enable_dig_filt;
+	u32 filter_width;
 };
=20
 unsigned at91_twi_read(struct at91_twi_dev *dev, unsigned reg);
--=20
2.7.4

