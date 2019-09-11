Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5CA1AF7C3
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2019 10:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727401AbfIKIYi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Sep 2019 04:24:38 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:28434 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727425AbfIKIYg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Sep 2019 04:24:36 -0400
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
IronPort-SDR: UtfyqmQrYxwkAnchjViAzO12bQjF0aPab9FGNjlVrsgbX9mMLYFMWJrrxYPRrhoK2PwNXs2Yo6
 mwgOdF6ohEqLQgZ+pvfzaRZnAEdlxrzaW36MhVz1w8t/l+KT3JYkfwtMmmtvlM9kHnMwZParv2
 zO9a0dvTDo9NtRsFN6F4+HuOZD0bjxUg3zbqB/uw9A3bfycm8tDr6t2OFQxUAVLYUhhMIMrepg
 lTmJ84+qxQIDV112AIrP5CI+Zee7dzAHhy5k1RBlyExNuqn86wwqRoteHuJP6+Ep1e0AGwMb6i
 L2Q=
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; 
   d="scan'208";a="47514880"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Sep 2019 01:24:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Sep 2019 01:24:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 11 Sep 2019 01:24:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHjGKLyRfyc67h0Mh8jR+0+MT5OVgYTBO6kkc+RB1IRV4JZJgIeQS/JPMOE9gtLku39T8WwEagFji1CxGA5Flr7cq+ZiJuhEeE8/xXYdcLezrXbzJOTtlLOm9tuJrnVxQ2oQ3+AZw665YRsoJgxE3hChXGTLMskuo48K2+6A/+XQ5Drw6J81lEYqnORcmrQdeWHKxw9AYcG2ZI7mcAvIuzOP4LCok2JPNYlWgbq0POt1Bwwf3eN15VYmBv0sDJsuqtwWNXbIHFn1K8/LB4Nkg0YSvt3f3l0aeVUlpYowUUHwXu2ndzsQwJvDdIspcmVfuhXhEgnZqdJ44FdtrBGTuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gr2MfqdgqE+JT1T489HFdTZhMKMRS796LrD2oiILBkw=;
 b=TBjmzjqzp6AtIyLwN07Bgyg5b2459eHM9g3jUevfK6+/IYUN9FGCLRcY8Pcin/JcEF5mV1axhWQDgIwbcsEBR7qJpc1Es554Hy7A9GBtnyRZsXA7alTDh+0JFYH28VZVGwgT/QJi0SNqWfJn9lqHkaWoCL3bVxYKjFyYr3Qy8QARiDtGTk/Y2rPJS60j63xDNU2aMdDKbwxihs7iV9PjDNyjAQMDRl5pGNUVUcCGTFeYJcoUkx7VoQCXIRn08xBcx9DxVpTw1LWIi859dVieVorw3mMY+zxZVwzvFoG7cFUVYTXpPe5txMUcW40v4NZ0C7e8G7WtFCb4HpjfBTZvcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gr2MfqdgqE+JT1T489HFdTZhMKMRS796LrD2oiILBkw=;
 b=DI2sKzZxGA/GGJSybTUF7F/GWLllU9zyjzNxrJFE6rs9SJN0uWkaFTG6u0/F5ylCXvIpqDpyOHfjRw17QC8xmgiXtMMfQxF4faoiVgOyHRJe3LsvzT9nvROqttpvaWEvSCEE9+DI7tOzIXgUWXuIkdtds41WZ2lCdiyCJ7xcmfE=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1452.namprd11.prod.outlook.com (10.172.36.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 08:24:34 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::a141:1974:9668:fbe2%12]) with mapi id 15.20.2241.018; Wed, 11 Sep
 2019 08:24:34 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>
CC:     <Eugen.Hristev@microchip.com>, <Nicolas.Ferre@microchip.com>
Subject: [PATCH v5 7/9] i2c: at91: add support for analog filtering
Thread-Topic: [PATCH v5 7/9] i2c: at91: add support for analog filtering
Thread-Index: AQHVaHpXDHMdOo/14EOByNt7NRfDtA==
Date:   Wed, 11 Sep 2019 08:24:34 +0000
Message-ID: <1568189911-31641-8-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: fca19e3b-5e54-4570-09e1-08d736917a05
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1452;
x-ms-traffictypediagnostic: DM5PR11MB1452:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1452A6C8B7E559E2B4E53D9FE8B10@DM5PR11MB1452.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(52116002)(3846002)(2501003)(66556008)(66476007)(66946007)(54906003)(110136005)(478600001)(25786009)(316002)(6436002)(6116002)(76176011)(66066001)(386003)(14454004)(2906002)(102836004)(486006)(476003)(2616005)(11346002)(446003)(6506007)(186003)(26005)(4326008)(8936002)(81166006)(81156014)(7736002)(66446008)(8676002)(5660300002)(50226002)(64756008)(86362001)(2201001)(99286004)(71190400001)(71200400001)(53936002)(36756003)(256004)(107886003)(6512007)(305945005)(6486002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1452;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fN+cslpRznAr1qorHQkVXgBJ1QOM4xxRRZjDLNiiM7GHEoEbUsKUJITWWCmtPy8mtRuM1nwGKWGpPb+Q0AobmQaB7VMIZuquQPw7ZfHdJK9IK+S5KWwuQJ0Kl7uiOI0sGGddR3I1bcSWaSF+ZzzH1yBfMcRUVy501xdektQJV+U4fHo3DBQ49Uae7emC3ANl/QDDABMT/2j9nWNmJ0MPHwk4617+caOwUy88NcgdU5aglXwk0To2E47W/lJ5kXRIUA3josIOIe+Nlyg2MIQ3zVe8V8MedcV0PrwWbH1cWj1l+lYeDgYnJMvOy7xLBqZVkGneCwtWmwRRllMfwwnfR6xydUvgzCod1iceXlyhMhGfiymy2SKtOfiU54UK2ah0+JSHjP8s4iPD/V8F6uIT/En1IMeO22miIZuLw0TKO3s=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fca19e3b-5e54-4570-09e1-08d736917a05
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 08:24:34.3611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R8PYw0da6n6+xgtm9Ce03bY6ou9hL4avB4Wk3zje/wjjIOt7bc0ka4/ij2xgBEkdSCiBcKKVCfa1kd4Nn8y8xMdiw0TEyjDWBcKPPaGjTs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1452
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
index 1f4ee7e..e13af48 100644
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
index 273bd8b..6e0b554 100644
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
@@ -826,6 +834,8 @@ int at91_twi_probe_master(struct platform_device *pdev,
 	dev->enable_dig_filt =3D of_property_read_bool(pdev->dev.of_node,
 						     "i2c-digital-filter");
=20
+	dev->enable_ana_filt =3D of_property_read_bool(pdev->dev.of_node,
+						     "i2c-analog-filter");
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

