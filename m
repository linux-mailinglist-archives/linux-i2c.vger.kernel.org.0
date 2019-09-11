Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A33CFAF7CD
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2019 10:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbfIKIYq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Sep 2019 04:24:46 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:41441 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727448AbfIKIYn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Sep 2019 04:24:43 -0400
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
IronPort-SDR: 2ZLt5eT37fsOrsZhfcS2vcs6KifSOwJbd16GlLH224OB0dOVip6NDetTZXm8BUVH3ku8Qz8rnr
 YFo+Kj/10LoDLKhxSzIv3jGL/aLat5egVa9wq8BDuviOk4jEs9gA6TTq5AzpnJLFPwbw722tim
 1L7eyCWr72EGp+HG52/IC8WEDmwKWpvzYRSInFwT1uirCcx7FKz0lk5mjH8VjjHHqZDMPcXGPF
 KXklLYF6dzqnYrqZ1injlBXEwdUPxWCPNAzIVQxOKjnEQK3Suo5qfj6MoHRiVByNTWvPg27xaQ
 avA=
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; 
   d="scan'208";a="48642370"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Sep 2019 01:24:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Sep 2019 01:24:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 11 Sep 2019 01:24:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bv1+PK8jRmegidQosb5GMDqt0HHtzQwTWociGuxL6AMr85gG2DsTPHrgZRdsXfXp8jcjoLWHXtHhU6Z6nMakdzBqQUGcqn0SiR9X6zUC/++bLAqdVpIjI+8B6kdV/rkpp/KdWSqWkAVDKR8MJv2uuwPE57pw+z8UG4GADItt9iF9wN/vWZZZt5WFHftDTAtRyNMOnOVyDFOH2vopWJPw0xvS8yWzrAu1KwGgzRwLR6lLiha2gVk9LvMEwEeF/rM++bEfK0Mp8gq5IQlV5wUYZGQDpHb2QVERjxMUwBkXoX3mwFRloAkPN4vPrqUrkdheAHm6xfT5/gTAg9yK7u+j1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOMRzf4H7eeeMZitPyO4ZMWYjxjbYb/chIExeqG8oho=;
 b=LwEe5air5PR1ZZv22ecj9XChOl3p5VPUmRo2smHpD8d1Ny7rQWrXzYBiHAtog7olEE+DfWdlETkMdnIIwlLbBUIjxU0Ndl1e1vUe+uqmao/3K7vriB08XAmt5zs+1cBx7SUFWWp1zVlGlR0xIIvOM8fPz90G4f5Ms5/DK6UaL+vG9udyRH7Z90XdurD92pr9y59R5TLoKaGyEEgnsNKV5JQ5htSKUVVyMYcs3nkAu+pQ8qHSx4z5N99AH7m+p0lHc9vV0hVynO5YevYAcn4yx4AkMZ/AqnEdAas3lPIzZiPM76XMlitvhy7tWRS7u7MsC/sj45IP1f4whaU7jHCvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOMRzf4H7eeeMZitPyO4ZMWYjxjbYb/chIExeqG8oho=;
 b=Ae2G46p692VCWVDwWdkVPTczF+pI2/J/pr/Y7mW5ccFIYlnMXHHEEY1Rlvr+sZj5+zxc7/FAKjA+73BhglsDRB1xyVLtN9hn0G5FRTZwKTRYOf3XOCBBKEFoPIvAgiutsdMgkSOfLj7buWDpwanuR617UZRc/yELh1Z3J6niNM4=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1452.namprd11.prod.outlook.com (10.172.36.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 08:24:31 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2%12]) with mapi id 15.20.2241.018; Wed, 11 Sep
 2019 08:24:31 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>
CC:     <Eugen.Hristev@microchip.com>, <Nicolas.Ferre@microchip.com>
Subject: [PATCH v5 6/9] i2c: at91: add support for advanced digital filtering
Thread-Topic: [PATCH v5 6/9] i2c: at91: add support for advanced digital
 filtering
Thread-Index: AQHVaHpVeESikn7R1E+uNNjYv0u2rQ==
Date:   Wed, 11 Sep 2019 08:24:31 +0000
Message-ID: <1568189911-31641-7-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: e29b488f-c037-421f-121d-08d736917859
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1452;
x-ms-traffictypediagnostic: DM5PR11MB1452:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1452E09B8038C11C99210328E8B10@DM5PR11MB1452.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(52116002)(3846002)(2501003)(66556008)(66476007)(66946007)(54906003)(110136005)(478600001)(25786009)(316002)(6436002)(6116002)(76176011)(66066001)(386003)(14454004)(2906002)(102836004)(486006)(476003)(2616005)(11346002)(446003)(6506007)(186003)(26005)(4326008)(8936002)(81166006)(81156014)(7736002)(66446008)(8676002)(5660300002)(50226002)(64756008)(86362001)(2201001)(99286004)(71190400001)(71200400001)(53936002)(36756003)(256004)(107886003)(6512007)(305945005)(6486002)(921003)(1121003)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1452;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GD/kXNh+vfxR5aTF/96j96Z3ft5OsWK6ySRMhNbcASniulsy9xCzP1SPiXMw9RhV48LeuUxyoveZ5Py0YJ9fCJFQvyaDPoNReM5J9drCpdFZWQXcEHzA2wQHhk3Zpq+ThFps80f0INIDDYbq/bfEW4kHwiVmh5tmiarQnTwSzPvXDs5CAIbOqHSIw6ULTmx397DpHFcyyUpDU8LDd+8RqGx6xUjXBwnWimAETcbLxgvDoHhW+o3R2gl0K+Fnvn7MnjZRIFnPp3A+0CUf4eau+ehXgfcDJ+khmJGaHcIXbnY2ldn1pS3Vvupx71ZiGrptrpS3VSu35Pube2ce/niJXk2eL6BBpBO2DuOioLNjm1pBQB2jwgHV3Wtup0JOhWcu3ORhhWbHWysOMHhJ9iO75wYWR852ceete+yPMeqf/aQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e29b488f-c037-421f-121d-08d736917859
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 08:24:31.6304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HbBcEZl3loIfFH/iSIIfY6aA1f0MJb8m/MDkojGdgLSSBDltOXPK3Iw8l5D4U91bhpvojQVdxCDidC+nzwnZxHh/U4oekOVIgYyqRaUODvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1452
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
index e96360f..1f4ee7e 100644
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
index df80557..273bd8b 100644
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
+		filter_width =3D DIV_ROUND_UP(t->digital_filter_width_ns
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
+		t->digital_filter_width_ns);
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

