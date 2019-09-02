Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBCAA53C3
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 12:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731442AbfIBKMd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 06:12:33 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:46285 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730221AbfIBKMc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 06:12:32 -0400
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
IronPort-SDR: vrRXf7lnCh4vg4uZbjy6b4MSpflrm0omLQ+jDkejBolsulkzH+ZCLRe48AuvFTAcxvVl6O247Z
 xO8jWGOav6SPSQ9kVOMEMpKRyLYGIf20+RK9kv0Ur0HPzE/JsXXgSM4U9P+qSC//Xm8Cj/Ttkj
 EgW70JiOM+kGGUqwO75vmWisDxYYhGAgyRaiNSZuRrZHlvnt6qR+vj+REaUlTL9E/XrjurRC4G
 0dQnKbmrK6HLiPohjTVWTgka9APSu+TJPoJlm5szbETZuZS/3V0vD4LpvO2jnlzAKjHArRssTk
 PGQ=
X-IronPort-AV: E=Sophos;i="5.64,457,1559545200"; 
   d="scan'208";a="44561044"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2019 03:12:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Sep 2019 03:12:13 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 2 Sep 2019 03:12:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7PKaVEtYRQP+wmF5Zjy6Fogpq9MwnHVxNTKpijY9++0tf11bZH7iMwpdEngYancQSzVgH171aMmCzY+Ob4E9fOivLXesuiR8xFBQhTtRGpNjEU15z6qvEk0UcyGczl/CDUWHAzq1ykzhqxuLvRCH9taUfadN7SP5KGiFozTKvJi9oOLXfCaK6h5LoV4xEIuhFvdouMWdphsrxcr/8FNbtF0Xu6meHRzdnmx7yC7Ak9cw7TG8mPCApA7DrjVwrigrzZxHGNgcFDZX23lKk0ofqifYRuF/YfQpNR/xfiGwKd2Kkrj6Fdne6PQ0CN3V8DREVZwTPXCGI6GUMFt9Kjksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tz1MuKv4JFNk8U0127MciEKiPTA99KSnYRItPTS7yKA=;
 b=VF2XpRZP0JBnTlBjxMBhmzOyb+NZJbiWYK8AwQa/vXURng7QgTlbDuEFJu7FBp3oB9fPMj8FXfRHJtRoyvAiGtFVuMyjORN4HIvJ3RdUf1n6DuIiYT6ejnuaYCBejwKQG+kvQK35p//sNVgwhWCzomlxQekELp42ToJTFQzyKJLRaCC3q+bY6OYyeIVmCILtPoO1LAlPnwFsbr2bc6nDDpx5w92Owk+49AtYMZqjAUnhLv6dwRR/p1BQPRMGwGoGniBUIPhgWxdeiASpm8y35wrW0skv6sJg5oOipf8oQVcuI3L7HYy323Ib48RbjUDxKycLlO2oGIiBvp4NOk1gdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tz1MuKv4JFNk8U0127MciEKiPTA99KSnYRItPTS7yKA=;
 b=bsO9qqvVYKcwl9ypMXKWMxF0xCwWFNutIPe5d1FOjglb5renwqrDB0iH3sx5yXbEMlKV8IRQEdHalhUQLTSNQeTBiY26r+lU6W5C6py+WfApP9pxgO6IZX6dB1ixFd+gNW1jm/glB21BbIAxIX2Voni37NO1rOi+/tJRDBj+2E8=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB0044.namprd11.prod.outlook.com (10.164.155.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16; Mon, 2 Sep 2019 10:12:12 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3%10]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 10:12:12 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pierre-yves.mordret@st.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>
CC:     <Nicolas.Ferre@microchip.com>, <Eugen.Hristev@microchip.com>
Subject: [PATCH v4 6/9] i2c: at91: add support for advanced digital filtering
Thread-Topic: [PATCH v4 6/9] i2c: at91: add support for advanced digital
 filtering
Thread-Index: AQHVYXbjL03PBSJaLkaDW+7lYo40kQ==
Date:   Mon, 2 Sep 2019 10:12:12 +0000
Message-ID: <1567418773-2427-7-git-send-email-eugen.hristev@microchip.com>
References: <1567418773-2427-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1567418773-2427-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P189CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::31) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 941b68a1-5486-4ca2-28f7-08d72f8e0586
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB0044;
x-ms-traffictypediagnostic: DM5PR11MB0044:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB00449705CC4F4B4C34F4CC45E8BE0@DM5PR11MB0044.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(136003)(39850400004)(346002)(366004)(189003)(199004)(2906002)(66446008)(2201001)(66556008)(66476007)(64756008)(8936002)(305945005)(3846002)(7736002)(66946007)(6512007)(446003)(6116002)(86362001)(36756003)(5660300002)(52116002)(2501003)(11346002)(476003)(2616005)(256004)(6486002)(486006)(50226002)(14454004)(386003)(6506007)(53936002)(76176011)(186003)(99286004)(66066001)(81166006)(110136005)(7416002)(4326008)(107886003)(54906003)(71190400001)(26005)(102836004)(6436002)(71200400001)(316002)(8676002)(81156014)(478600001)(25786009)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB0044;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rK95BXeT9LMnPlA3vtU8MB+u+GD9aHBKAOE/fIQq2qa2m8jv8X+vf6GuonTG6gkY9BIUqiP2lfFnZqW3Y5IkgU2zqcbWOAha3DXX7VTtv3A9OJq2F+7fDAW1sIcJq+jZiAn+6JeI21xR+64xq6GRddPbjjYPVLNWe1mJGmGQh31/Eo8dIbblF8EchQgYH5z0r9NQyztg0olCuLSegC5u7KSBFJUUGDsWRTs8gGgiswazfaaccG4uNqJ5Re0+JxS6aofWy5nmKR36Z8fgn+jEoIjvdtELE8RcjzHnzc4jIZNLNr5IY1/UD/JYinOaAmMiIGAs3Q8LNezdVF/H9Typ2xDEtMLDrpcQVan12rgO5an9lRWnMXbRXcmG53S14+u5+Ss5hXTWxyNPp7FyqqKhQx47YtE4gIJYIGKz/JYSMOY=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 941b68a1-5486-4ca2-28f7-08d72f8e0586
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 10:12:12.2083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gSo2/RzXcndCoUo7ZwFwskpH9xnf2wiYN5LmrR1E3u7kpxedNKem0AbFVkIuxtkjP0x+r3F1dLpqCXlZcgiv1LPXz6Rk134bPnN1hEStQ5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0044
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
index df80557..078bbde 100644
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

