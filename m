Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C121312F651
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2020 10:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727507AbgACJtL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jan 2020 04:49:11 -0500
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:23766 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbgACJtL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jan 2020 04:49:11 -0500
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
IronPort-SDR: /X7ryBPnlJoKzdeuoZN5hdxhrmtpfRTLjBJpof4SC+EEz0cTu7+I1IQMtfkZF1OyjjST8EZxxF
 XZnkpxSUv3gfIj6reSG5bWCIMIa3icA+6v3oJUeZM73Gdvsk/vXfgc9J28cfTxWYGTHmwWYo21
 5k56nsyKSQgBxrEqeti5I/DrJNDn/13tZPAAD12M2r44x4c3fJKrEyz+f9wtJ0rbSukzufJoG9
 YFZgFN5FO0VX2JxyFUxNCNQq3U32ScWpHAXh6OK8SKhAsjBlVbBiTlHEndxXfY9A2vhd8iX+26
 mNw=
X-IronPort-AV: E=Sophos;i="5.69,390,1571727600"; 
   d="scan'208";a="60069279"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jan 2020 02:49:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 3 Jan 2020 02:49:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 3 Jan 2020 02:49:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHLE/YGlWnBpERipTEej+os0T9TDls0B66MtA3HfC+hXNeH8kRPNWFVakcJeh7pFJQggi8rjYQzThlLlNkrMQGBir3ILrfAUy+Y6OAek5Cg7Jzb4SnDKU8WeVyqAAoXo00NtD2WhnSjQT+JHrba7xOjsLW6DNujSFCnJusP6Epebf96vGJyFFXATds0b5y1NEIVV1kbLNBjip0vcGcG0H1MqgbCFWp9Hn+FssRu03YVRmDaRvIjiXQmhmvXxBIjJ/bL+bI6nm3FwEfao2SCFwR4A+lRfpgw/JykTKH9RWp/A3lLz3W5jx+Ddsv4pBz5yZDCeSVpWugAGlQMhGVSYgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxCtcrCwWDKwNlQKPJIiIcCVxKPTfh1F28q3inb/ink=;
 b=TpTmG67zfBhbQlRK7LLT1uHlstokzQquvMAV15MlL5Zy0WlZswt7HkTO1SmIoirCRLhI567LxZKeCciU3BtX7qPkg2HCZoXUec2gZSvBx5BQHtdBHYCI2/icgQl2CRQJB97RkW605H0XhYP9IoIEHTUEB+isOAJCuFm9BH+Ktu7Iy2cM3fREwS8mKyxsbGlN0GQCm+WCbRORg3OLanc46oXZ+bxlcBdA8ttOFVuYFdYyI+5kHDQENYicdP+yISGtXBcxtJT+hGPGx1wb6SfLJiOUBmVcfDzIkoPHnmQQo1rcmTHeGN7YetsUdL5ImhN/kUiUNDxdq8QUrT0HTyypXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxCtcrCwWDKwNlQKPJIiIcCVxKPTfh1F28q3inb/ink=;
 b=RpWB7TwGYZgMr3u4n25evkYn3MxHfgjVnfJzIx95ugcLCluWGVJQxZ6TPgC/6G3CDMoMbj8/QRI+/cYP/6935Gx+ezwSzcUnx+6qoEjxhcNVHrH2JFmscBVSj9ZQeH94lhBmJd14ACKwF/G/ABS/ayOYiN0GznEj/Jv7Zcfld5w=
Received: from BY5PR11MB4497.namprd11.prod.outlook.com (52.132.255.220) by
 BY5PR11MB4322.namprd11.prod.outlook.com (10.255.89.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.10; Fri, 3 Jan 2020 09:49:08 +0000
Received: from BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::6189:c32:b55b:b3fd]) by BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::6189:c32:b55b:b3fd%5]) with mapi id 15.20.2602.012; Fri, 3 Jan 2020
 09:49:08 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <kamel.bouhara@bootlin.com>, <wsa@the-dreams.de>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <robh@kernel.org>,
        <Codrin.Ciubotariu@microchip.com>
Subject: [PATCH v2 2/6] i2c: at91: implement i2c bus recovery
Thread-Topic: [PATCH v2 2/6] i2c: at91: implement i2c bus recovery
Thread-Index: AQHVwhsKxM62dO/65kaQpOISnuFHxQ==
Date:   Fri, 3 Jan 2020 09:49:07 +0000
Message-ID: <20200103094821.13185-3-codrin.ciubotariu@microchip.com>
References: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
In-Reply-To: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [188.25.143.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3fe6360-f8af-43ac-5245-08d790322daa
x-ms-traffictypediagnostic: BY5PR11MB4322:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB43220948F67106F2A9BDDD1BE7230@BY5PR11MB4322.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0271483E06
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(376002)(136003)(39860400002)(396003)(346002)(189003)(199004)(36756003)(478600001)(4326008)(6512007)(6486002)(110136005)(54906003)(316002)(5660300002)(107886003)(186003)(66946007)(66446008)(64756008)(66476007)(66556008)(8676002)(86362001)(6506007)(1076003)(8936002)(76116006)(26005)(81166006)(2906002)(91956017)(71200400001)(81156014)(2616005);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR11MB4322;H:BY5PR11MB4497.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uMZ5FuNWzyhte8zKubUksQ4o3kOQvEF3SucBzi+eCaH6YPYRFR9mJkzFUQ7hVqZHpsz9FGGaWl50tZAg2KSP1Y+vQQpeYPZEDeG8QKcDmOUe7LT/3J+I1tTQV3ih2wxWwEGnOZuNdMz48iKn9FrRZoMcsns2/GvMgafOjM+ValWWlDoZoj29rMP1yplBbThcfsFDq0JKbe+I3VlLpfgvueiGjbNd/XELBgihxze/aQX9FJfnxB2I0ck8t5ftfmrGeR4W2WnUM235+VT0G8Ay8UjO8MresVichaOZ+yaq88Hsx9nARSyI0Wo1na7ajHyPWLtA8FCvSQW7xioTtd4g9K7HNA9ieFRLymXZ/+JnEv7dpu6MOwRG1GyZWytqD0Am5m4EkdmBi1Ov5fYN6wdpZusRVI0eTPmKb2+hWlbyoHky1/nRKTRV0+jf56hd7/8P
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b3fe6360-f8af-43ac-5245-08d790322daa
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2020 09:49:07.3162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5jK8IfA3yIC/cGcbRwiC0iVn64PXmz59StYsnAzM2wBgJmZd/CCgvJpo0uZBwI8mTAQ22pQEbqnvAp3QxHm2CWvHzwgpRpMt66cVqG16RTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4322
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Kamel Bouhara <kamel.bouhara@bootlin.com>

Implement i2c bus recovery when slaves devices might hold SDA low.
In this case re-assign SCL/SDA to gpios and issue 9 dummy clock pulses
until the slave release SDA.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
[codrin.ciubotariu@microchip.com: release gpios on error; move i2c_recover_=
bus]
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

Changes in v2:
 - called i2c_recover_bus() after an error occurs, if SDA is down;
 - release gpios if recovery information is incomplete;

 drivers/i2c/busses/i2c-at91-master.c | 79 ++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-at91.h        |  8 +++
 2 files changed, 87 insertions(+)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-=
at91-master.c
index 7a862e00b475..c55e8ff35201 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -18,11 +18,13 @@
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/dma-atmel.h>
 #include <linux/pm_runtime.h>
@@ -478,6 +480,7 @@ static int at91_do_twi_transfer(struct at91_twi_dev *de=
v)
 	unsigned long time_left;
 	bool has_unre_flag =3D dev->pdata->has_unre_flag;
 	bool has_alt_cmd =3D dev->pdata->has_alt_cmd;
+	struct i2c_bus_recovery_info *rinfo =3D &dev->rinfo;
=20
 	/*
 	 * WARNING: the TXCOMP bit in the Status Register is NOT a clear on
@@ -637,6 +640,13 @@ static int at91_do_twi_transfer(struct at91_twi_dev *d=
ev)
 		at91_twi_write(dev, AT91_TWI_CR,
 			       AT91_TWI_THRCLR | AT91_TWI_LOCKCLR);
 	}
+
+	if (rinfo->get_sda && !(rinfo->get_sda(&dev->adapter))) {
+		dev_dbg(dev->dev,
+			"SDA is down; clear bus using gpio\n");
+		i2c_recover_bus(&dev->adapter);
+	}
+
 	return ret;
 }
=20
@@ -806,6 +816,71 @@ static int at91_twi_configure_dma(struct at91_twi_dev =
*dev, u32 phy_addr)
 	return ret;
 }
=20
+static void at91_prepare_twi_recovery(struct i2c_adapter *adap)
+{
+	struct at91_twi_dev *dev =3D i2c_get_adapdata(adap);
+
+	pinctrl_select_state(dev->pinctrl, dev->pinctrl_pins_gpio);
+}
+
+static void at91_unprepare_twi_recovery(struct i2c_adapter *adap)
+{
+	struct at91_twi_dev *dev =3D i2c_get_adapdata(adap);
+
+	pinctrl_select_state(dev->pinctrl, dev->pinctrl_pins_default);
+}
+
+static int at91_init_twi_recovery_info(struct platform_device *pdev,
+				       struct at91_twi_dev *dev)
+{
+	struct i2c_bus_recovery_info *rinfo =3D &dev->rinfo;
+
+	dev->pinctrl =3D devm_pinctrl_get(&pdev->dev);
+	if (!dev->pinctrl || IS_ERR(dev->pinctrl)) {
+		dev_info(dev->dev, "can't get pinctrl, bus recovery not supported\n");
+		return PTR_ERR(dev->pinctrl);
+	}
+
+	dev->pinctrl_pins_default =3D pinctrl_lookup_state(dev->pinctrl,
+							 PINCTRL_STATE_DEFAULT);
+	dev->pinctrl_pins_gpio =3D pinctrl_lookup_state(dev->pinctrl,
+						      "gpio");
+	rinfo->sda_gpiod =3D devm_gpiod_get(&pdev->dev, "sda", GPIOD_IN);
+	if (PTR_ERR(rinfo->sda_gpiod) =3D=3D -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
+	rinfo->scl_gpiod =3D devm_gpiod_get(&pdev->dev, "scl",
+					  GPIOD_OUT_HIGH_OPEN_DRAIN);
+	if (PTR_ERR(rinfo->scl_gpiod) =3D=3D -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
+	if (IS_ERR(rinfo->sda_gpiod) ||
+	    IS_ERR(rinfo->scl_gpiod) ||
+	    IS_ERR(dev->pinctrl_pins_default) ||
+	    IS_ERR(dev->pinctrl_pins_gpio)) {
+		dev_info(&pdev->dev, "recovery information incomplete\n");
+		if (!IS_ERR(rinfo->sda_gpiod)) {
+			gpiod_put(rinfo->sda_gpiod);
+			rinfo->sda_gpiod =3D NULL;
+		}
+		if (!IS_ERR(rinfo->scl_gpiod)) {
+			gpiod_put(rinfo->scl_gpiod);
+			rinfo->scl_gpiod =3D NULL;
+		}
+		return -EINVAL;
+	}
+
+	dev_info(&pdev->dev, "using scl%s for recovery\n",
+		 rinfo->sda_gpiod ? ",sda" : "");
+
+	rinfo->prepare_recovery =3D at91_prepare_twi_recovery;
+	rinfo->unprepare_recovery =3D at91_unprepare_twi_recovery;
+	rinfo->recover_bus =3D i2c_generic_scl_recovery;
+	dev->adapter.bus_recovery_info =3D rinfo;
+
+	return 0;
+}
+
 int at91_twi_probe_master(struct platform_device *pdev,
 			  u32 phy_addr, struct at91_twi_dev *dev)
 {
@@ -838,6 +913,10 @@ int at91_twi_probe_master(struct platform_device *pdev=
,
 						     "i2c-analog-filter");
 	at91_calc_twi_clock(dev);
=20
+	rc =3D at91_init_twi_recovery_info(pdev, dev);
+	if (rc =3D=3D -EPROBE_DEFER)
+		return rc;
+
 	dev->adapter.algo =3D &at91_twi_algorithm;
 	dev->adapter.quirks =3D &at91_twi_quirks;
=20
diff --git a/drivers/i2c/busses/i2c-at91.h b/drivers/i2c/busses/i2c-at91.h
index 977a67bc0f88..eb335b71e775 100644
--- a/drivers/i2c/busses/i2c-at91.h
+++ b/drivers/i2c/busses/i2c-at91.h
@@ -151,6 +151,10 @@ struct at91_twi_dev {
 	u32 fifo_size;
 	struct at91_twi_dma dma;
 	bool slave_detected;
+	struct i2c_bus_recovery_info rinfo;
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pinctrl_pins_default;
+	struct pinctrl_state *pinctrl_pins_gpio;
 #ifdef CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL
 	unsigned smr;
 	struct i2c_client *slave;
@@ -171,6 +175,10 @@ void at91_init_twi_bus_master(struct at91_twi_dev *dev=
);
 int at91_twi_probe_master(struct platform_device *pdev, u32 phy_addr,
 			  struct at91_twi_dev *dev);
=20
+void at91_twi_prepare_recovery(struct i2c_adapter *adap);
+void at91_twi_unprepare_recovery(struct i2c_adapter *adap);
+void at91_twi_init_recovery_info(struct at91_twi_dev *dev);
+
 #ifdef CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL
 void at91_init_twi_bus_slave(struct at91_twi_dev *dev);
 int at91_twi_probe_slave(struct platform_device *pdev, u32 phy_addr,
--=20
2.20.1
