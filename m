Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCA47A53C0
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 12:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731424AbfIBKM2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 06:12:28 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:46031 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730221AbfIBKM2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 06:12:28 -0400
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
IronPort-SDR: Efz8BBq+xCC+UomCcjdiYYlJqL7SjLmyMGOHj7nOTwXwxYppmIdctA+oc10Fh1boLC1DLaW+xA
 1acXlCTR2OXtVf79Nzagl7wkZLCVZ/FQpeK1wtVIg++AyH0KD+Y7VDAMiAFIwaHSEoJEFvdv6q
 tSqhAkjK2vMkJ4nUaV7+fGe9MITe6A26BEOPXhD4gEa4Txryx0mcW+fSbErayAF9Hhx75r7NM3
 QkVfRZGy4C8AGWfGtJSCceAIuKqa5W3bvmhxVokh+2YwZ+wd6t5UHJvxAC2UHwlamreefcpkbb
 F+Y=
X-IronPort-AV: E=Sophos;i="5.64,457,1559545200"; 
   d="scan'208";a="47478249"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2019 03:12:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Sep 2019 03:12:17 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 2 Sep 2019 03:12:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvmzYvFU6uY7FsXdjstqk2wko2SINqTreqHdtI64JuWMBnqU2AcDcEvC0akUg/oBzUQJQ66iIol6zLAl7yfzMmfppbxz6xeLdBPwehmIKsqSIvqDt18q5fyx9j+D2RoW1bU9op6abtF8yguWjkpD93ic2GkHlZc6wdoQMX8hOM+Xa5WwNP4dzQvJsxdTOplcEAqnbbbTeXreflT2rkQLS2E/Dfr73f93/VSyWvZ9AUR4CDN+gpGNNi8uZSYhDSkNNS6tHFryVAOo5D6SraPFKz0yQdZcci8AtJ8WZTmKXqtwQgY6Vd4cWs++Tz3panS1RA02yfXbLyMlxJebizT8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMcizKAfiW37gXlXohTEcISQ3pYX2e1KkrSYC8omnJQ=;
 b=RYuOqb7vbuBJANGPrD9mNbTXC5VVERKrW+OInNJUpC0M+K4GGUwF40RErJfWh3t/qiBV2CVpQqwheo3MjiwtnOsDkLLnmOYW4qMsnICFGEsQG+cWLZeYmWheuXrD+ryQRVoxZtAqE2lD7K5ngFWtiBLjdvxIHV/OQdkhPYXHYkjFUvIhlAaG83JTzfwNVTens4jGkAaAUn1BH4gwzp6UXQUHG4rYHq1iSjDTR/oZM0HXnjkcdSSMw1ufNoz9N8gXQv57wS9QjverKBhYiv04R8hwCh4T04Fq0gA1t5L7+Ft8AHEqlzQqNXq0ff2Ddgh3ru3+H1bInpnluRr7Z6+ZpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMcizKAfiW37gXlXohTEcISQ3pYX2e1KkrSYC8omnJQ=;
 b=c/UN5vyTEBtCp4qnK4C+2ctqyn9JoBJovBTQte3KLYVnWEtn9K87sIP5q+o8IjRfS0g9Sl4hJ3hv96YsI4+99zTQHRSnawdfhBbJGPh/xRfOygGtyFLolxecLKO0V8DDIKQoetPLb91AN3ObQOzjHkOn/edbcnb+T4X+JoiCmKs=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB0044.namprd11.prod.outlook.com (10.164.155.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16; Mon, 2 Sep 2019 10:12:15 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::c457:dc57:6e6f:f4f3%10]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 10:12:14 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wsa@the-dreams.de>, <peda@axentia.se>, <mark.rutland@arm.com>,
        <Ludovic.Desroches@microchip.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pierre-yves.mordret@st.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>
CC:     <Nicolas.Ferre@microchip.com>, <Eugen.Hristev@microchip.com>
Subject: [PATCH v4 7/9] i2c: at91: add support for analog filtering
Thread-Topic: [PATCH v4 7/9] i2c: at91: add support for analog filtering
Thread-Index: AQHVYXbkGC7w+czn+U2wOd7rScSMIQ==
Date:   Mon, 2 Sep 2019 10:12:14 +0000
Message-ID: <1567418773-2427-8-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 4f206ee4-4c64-4f8a-fb45-08d72f8e0716
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB0044;
x-ms-traffictypediagnostic: DM5PR11MB0044:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB0044AA9030D79A582BE1062BE8BE0@DM5PR11MB0044.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(136003)(39850400004)(346002)(366004)(189003)(199004)(2906002)(66446008)(2201001)(66556008)(66476007)(64756008)(8936002)(305945005)(3846002)(7736002)(66946007)(6512007)(446003)(6116002)(86362001)(36756003)(5660300002)(52116002)(2501003)(11346002)(476003)(2616005)(256004)(6486002)(486006)(50226002)(14454004)(386003)(6506007)(53936002)(76176011)(186003)(99286004)(66066001)(81166006)(110136005)(7416002)(4326008)(107886003)(54906003)(71190400001)(26005)(102836004)(6436002)(71200400001)(316002)(8676002)(81156014)(478600001)(25786009)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB0044;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FKSYuVcnYEho+7cST0NdzPlxAQ0ryQFUfDZMtIXdMP/poSGsWqlC2Y++R9PFhMf5UY8dAKeTTT9cL3dvlKo/3omuk2tXv+OcJQ2ZX7mCoES1qLsfZxBNcE+6yLqdVzTuqjfjHcO6pDbSSdwOmLbaqkFxq4rw2NmyWowAPpl+2I3V4xOfQ7vJfH3g4BnvA7EQOlHeXWeXIYMMk91ZCgqXfBgswYYHcCDdl8jtwoqOZjOFbZtIq/dI2UBxTeNyYrRVfS3s81dawxTmdLOOodYCSfewQjRKhdhTnH7ktOCnkfGVyWhSlvr+qB7TK6jDAE0OEYwzZp7BvOIFbJZ+LcE6KrbGGzG7j1oCNzPDMboQI/jlHA3WoYb/bAUmIIY7X/7TZlxktJ9WrlXMg9f3ZZX/llz5nl2IOut/dtDeM/fJp1E=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f206ee4-4c64-4f8a-fb45-08d72f8e0716
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 10:12:14.8282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1UuHZty3qCLIZbTmmUUpWwsI4leRReZbqF644G9AGTGv7KKtsQya9elvkrahfg4/OCLGLc342HD0FV2PDIGmwISlRLyDyycvR9xAuBcALRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0044
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
index 078bbde..68e1ca7 100644
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

