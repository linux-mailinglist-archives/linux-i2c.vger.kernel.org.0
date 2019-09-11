Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 432E6AF7D3
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2019 10:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbfIKIYc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Sep 2019 04:24:32 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:28434 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfIKIYc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Sep 2019 04:24:32 -0400
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
IronPort-SDR: pjivRJ08USp1FD3jA1C+CpEpKWOHx7voY2Sn0WWqo1NpHBMwy272dTyej1OubCN3TVLwIEg6qp
 064BadlWfTP5cWcdTTJ7BKZzwAeChuOAnJNtw9D5eGL3fSXzNaLwWAWb39ELHLuEnuK1GAmy5R
 czQcCywqoUMjf8M8uD97sv7rosQkMlHE6jBiH1RWxq3ZfmFJAiQwNpFMSQ5j078H7GahPwU2Zz
 qHoJ+vUexD4V6ad4wXOJv/AtEhUSM0gq3iB6P/EfWkZg3O8oANI5xVuf8HBVQJ+tIhlI3UR0Of
 8qQ=
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; 
   d="scan'208";a="47514872"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Sep 2019 01:24:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Sep 2019 01:24:30 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 11 Sep 2019 01:24:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNIHpfmttniCKX1UV+W9I+yspdBi/dIffh8U752nYUJ2GGmpB/5lVjbXZoXz0qHBFU52nwYDztjckgXueY6nQTfSNczHlkU06NvrpHk51YiXW5CHHK8xiFfzI8qJQ3CJveWwK8bmFTm0MfC+bmTOpu8r1g0ptstlGOhz5GIpbUVasBS2SqyMSLym5060Vy7H3AAOmPRCr80j/EAizmvNnvWIvWEdMrt/cw0vjymCTEg2cE5PYrPYNdrzbWKQT88yBDHDT8sFzJNA9G2GDGAkU23bYWNFjt0360yG/9flAJnHnSFJlvIlWXjqoAgCsCnLiDxdsLFjoWQ7IkOmnALNdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lysMRDJuItjSsyVJJz4n+LiOmbx8YznG/q2CVYc8HI8=;
 b=P/Gq0kAuO71yokuEZYNeD8faLelqRE6+Jk2WXbwA70DEeGmUFafR/9TaW13YuHgU/ins7B+lQwzUYTxc2s+wl77f4dCBdnT36p6wYO5Shv32dAFhFwXPiZVUrMIvcanvI7b0+aUQ5z3FUE0pbkYpopFDL1Ma7onPia2cmhbrfRo5Mv666TdF3Q0j/deV39x+8LNPjoc9hc5+iFjU7TFODXvugOeJx9UshPxd3D+jjtXFqrd4Ju/6Iz1II0ymvRFwf7x6H5JhzXQaJb6l6nUgoATdIvqgVEb0cXeEx9JWVgAIGgYUQUib/xaP65FCH182uatyGgSRJ7YLGIzbzXEx9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lysMRDJuItjSsyVJJz4n+LiOmbx8YznG/q2CVYc8HI8=;
 b=si6rElJJBMsJ2m1kwm1hoSklsFdrpKjx5o2zDvIzsOhXkXP5DOdKnspVkFQZisTiagMuIF3MQUQyoshszmhOsq2dMKI4QTjdsV7wgkB/mis2SxW7s7k2MWHwSOVLsTf+Wx0R1b8RzNnVG5uDjoHVJaYU9n2zzgdcwu9yQMTcXPg=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1452.namprd11.prod.outlook.com (10.172.36.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 08:24:29 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2%12]) with mapi id 15.20.2241.018; Wed, 11 Sep
 2019 08:24:28 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>
CC:     <Eugen.Hristev@microchip.com>, <Nicolas.Ferre@microchip.com>
Subject: [PATCH v5 5/9] i2c: at91: add support for digital filtering
Thread-Topic: [PATCH v5 5/9] i2c: at91: add support for digital filtering
Thread-Index: AQHVaHpUF8/4sBZb20uY7HIPGe992w==
Date:   Wed, 11 Sep 2019 08:24:28 +0000
Message-ID: <1568189911-31641-6-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 5c1e24ff-bc8d-49fd-6d37-08d7369176a2
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1452;
x-ms-traffictypediagnostic: DM5PR11MB1452:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB14526432592458A1D0876D2FE8B10@DM5PR11MB1452.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(52116002)(3846002)(2501003)(66556008)(66476007)(66946007)(54906003)(110136005)(478600001)(25786009)(316002)(6436002)(6116002)(76176011)(66066001)(386003)(14454004)(2906002)(102836004)(486006)(476003)(2616005)(11346002)(446003)(6506007)(186003)(26005)(4326008)(8936002)(81166006)(81156014)(7736002)(66446008)(8676002)(5660300002)(50226002)(64756008)(86362001)(2201001)(99286004)(71190400001)(71200400001)(53936002)(36756003)(256004)(107886003)(6512007)(305945005)(6486002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1452;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1aF3jxAtmpvIyFFGoneBajoZGDmUe743EoMn0Ox005AtPGrNWwn4/a/4i1+MdkFYNwqooWRWBCI3tL5JeX2a+wBOWOh2tyt4twhhgJNpJSAAqkW/tXBbWigh0aMz4JyaY0QkmveSPjKX9XFSdxduDGihAiAwpRswvoHZT8eJePsgIdak+RfuFGyXwT/+R70uCHN+aaP06hMQoZE46TOuJxt1lNf4bcfhMm1qac/3baaFV0FffIIolku27td9FCe7J4wHmqbtvHtY30IOlcOdLl1/x6yDYb/18S1VPiiMkJo1+arAjmSEehbxMShgLi187WEsJrZrVDrwY/aVHcopAnQro+ukb97SaAvAL5ksf5Vsdq86TDfbDiP6Jruc5U303RkzbQVDUB7G60dpqvtxUIr0ZcRSsE1iRyEw2R5+CFE=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1e24ff-bc8d-49fd-6d37-08d7369176a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 08:24:28.8327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: picUN0FENe2Cfmu3sl0nJkIcTvXvGAHBux1rkdGGLZYh68YRqvzb0a+o9YLqCN/x3yGB2c3I3Mzaca/E6iX8pkuWe+YPXhHX94RjUP2c9+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1452
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
index caf1846..e96360f 100644
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
index a3fcc35..df80557 100644
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
@@ -793,6 +799,9 @@ int at91_twi_probe_master(struct platform_device *pdev,
 		dev_info(dev->dev, "Using FIFO (%u data)\n", dev->fifo_size);
 	}
=20
+	dev->enable_dig_filt =3D of_property_read_bool(pdev->dev.of_node,
+						     "i2c-digital-filter");
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

