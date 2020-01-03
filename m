Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40D3612F65C
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2020 10:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbgACJta (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jan 2020 04:49:30 -0500
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:52158 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727521AbgACJtM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jan 2020 04:49:12 -0500
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="Codrin.Ciubotariu@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: Q+LSbpm2UErjB1eA7uw7VqImjW/HmjZL6YdDBzMxoW0XQD9285B627MiDXiG7UnTEyRoYOHrHJ
 T3f+Nu+S5f8cz70BrWz2Y8t6NNjPoa9zQ068xoEM1D7cWeefJYcMuxw04cs4tscb2ftFzqkm2k
 sIwqOy8AP5ZW+QQS4OXRP+Fbh1comumvPMrwZb9I+cybBLmvKtkCwUo5G6rBzoTccTmJPLtCwR
 ULvR90FGQseQJXBnThRCIgc1ylz43lLLAZ4bG8qa5owYDFemR1gmg3fPI9X8895QHWfjN73q+d
 ykk=
X-IronPort-AV: E=Sophos;i="5.69,390,1571727600"; 
   d="scan'208";a="61520573"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jan 2020 02:49:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 3 Jan 2020 02:49:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 3 Jan 2020 02:49:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgjvJrEuVggWe61J2c7AcwtmmiVu21v3qqBkC4xRapfng1baZFa4cVQuRTvykvvTOq6gIWU6EiZ2I0TGOeVVyaJKzHQpcW7bsJt6RLydugPbVjLVvMIFYRRvJqa6if5ZgeqfqDwJClYT1SZKu/O09sXjNCBxDUluzFZHQwryZ0+LZPUAZ7Fkvmsi+/F2lXi5IoPIhDUICGExgy/PuW/Q0UzmWq+YmGvx3slA84d5QzOGpV3t2gyhrouE1QPrZDzO4NGhUR4pZBrParR0uAFpJkUCPLSIHmMOdhEEvKE3I22WjlC55u4oTDpc8PWBc0HIDUn36nmygDIkZ4cIp9eLVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnBNFMeHC83n5yAIWNIQJJ6T9Llh4/21RCpN9o3uih4=;
 b=Sp0XUEnAOPaNFSfKzcZx6ctts/dk2mEVFdZBq8n13Pr1PQ0Yy7bXsZU7NFZ6RpJOPpE/EOROsYWLBnFEKHy0qssuUqJPeCKHVL+bit+jKenHogsxFU37rfcypQzqJgzEFzgxAkVczr4dhAsbJcQ+/Nc0SxoxDSoitqoRsq0Wjlsep1FisFzvYLzq0n60DlSu2QlXPs1PfbnYuCpdJhA0K19HOrMzg3X/WUvL86E7n9S/N2vPli6BKws8ukPcSbRSXpBkMDIGgoxLsn4gXPOwHpm47VayFvQoHuREGEp53Ne2oNBXFVi2JjkJ+W5DIvEt1kgEGMUddLTWqZ67s4Jwfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnBNFMeHC83n5yAIWNIQJJ6T9Llh4/21RCpN9o3uih4=;
 b=UCAKr3H0HHzUA/hlTjG0b7pNdAIbkw4OKSi1Q1UsEdIKwEeJkWp2LRQ/7CpkmTZohbmkv2+q3S6w+B20YnaZj4uYQu7mqPXDmZEHL2gg5G9G0sU+hRXmM8Q+jMaW5g/lFxBYP5mtSV4s+AE9MIu1v6bxXKtpKCmOCAzVihwaYfg=
Received: from BY5PR11MB4497.namprd11.prod.outlook.com (52.132.255.220) by
 BY5PR11MB4322.namprd11.prod.outlook.com (10.255.89.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.10; Fri, 3 Jan 2020 09:49:09 +0000
Received: from BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::6189:c32:b55b:b3fd]) by BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::6189:c32:b55b:b3fd%5]) with mapi id 15.20.2602.012; Fri, 3 Jan 2020
 09:49:09 +0000
From:   <Codrin.Ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <kamel.bouhara@bootlin.com>, <wsa@the-dreams.de>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <robh@kernel.org>,
        <Codrin.Ciubotariu@microchip.com>
Subject: [PATCH v2 3/6] i2c: at91: Send bus clear command if SCL is down
Thread-Topic: [PATCH v2 3/6] i2c: at91: Send bus clear command if SCL is down
Thread-Index: AQHVwhsKlTodLDZUaUCcsTrXKcjnqA==
Date:   Fri, 3 Jan 2020 09:49:07 +0000
Message-ID: <20200103094821.13185-4-codrin.ciubotariu@microchip.com>
References: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
In-Reply-To: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [188.25.143.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48c1ff0e-8d07-407a-ed5b-08d790322df9
x-ms-traffictypediagnostic: BY5PR11MB4322:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB432210B5345745FBF7AAF9B9E7230@BY5PR11MB4322.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0271483E06
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(376002)(136003)(39860400002)(396003)(346002)(189003)(199004)(36756003)(478600001)(4326008)(6512007)(6486002)(110136005)(54906003)(316002)(5660300002)(107886003)(186003)(66946007)(66446008)(64756008)(66476007)(66556008)(8676002)(86362001)(6506007)(1076003)(8936002)(76116006)(26005)(81166006)(2906002)(91956017)(71200400001)(81156014)(2616005);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR11MB4322;H:BY5PR11MB4497.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kIkWpXULEM56jowsxou1tLZTHDNAcKwFEQDpCyv5Wn1qS12iUIcojprBSeREBhDSZmc+mh9GlhYPCxDPdR8M8JuwmoVVR8PuzMKaZd5bjkmIzObpfnLegtPmO2c+73Z84k8qPVsTZgnZj1c+eA8YjDkfoqCboojuhi706ngs8HRPItGZE2pjLcOdVuCVEgnhUVqkcdH0+jzH864v/Le3Pj5PwrbGVzALFx9gAKCb4BqTa07mju15r+dyd/DnvwaW4waOJszWdeTbdMp1oPh9nO7hhICb+9a6C5slS4+7iskCCpOlzzQteyDps86Jpe/F8m5inCw07IpwPOvco2h2VgoDRQhR7lelTeelzX//r4S4BUkaKFTe9hxKCUBFzSgD9DQVDyt5WRO+xhgQFQEdOAzis+HsPxxj9mSJjEjbfwsZYPAkLBHikFkKjqyV8Joz
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c1ff0e-8d07-407a-ed5b-08d790322df9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2020 09:49:07.8119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZF+hHykKyiPM5al98LRpBzLgIumCVJEa1YdgXfcVEnkdgCh61srtj7XO19CtQOjl2ij1B2b/dk6cTLwgYR1Nq1yH10Ov9WXrD7BYe1BUhHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4322
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

After a transfer timeout, some faulty I2C slave devices might hold down
the SCL pin. We can generate a bus clear command, hoping that the slave
might release the pins.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

Changes in v2:
 - use CLEAR command only if SDA is down; update patch subject to
   reflect this;
 - CLEAR command is no longer used for sama5d2, only sam9x60;

 drivers/i2c/busses/i2c-at91-core.c   |  9 ++++++++
 drivers/i2c/busses/i2c-at91-master.c | 32 +++++++++++++++++++++++-----
 drivers/i2c/busses/i2c-at91.h        |  7 +++++-
 3 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at=
91-core.c
index e13af4874976..128eafc05adb 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -71,6 +71,7 @@ static struct at91_twi_pdata at91rm9200_config =3D {
 	.has_dig_filtr =3D false,
 	.has_adv_dig_filtr =3D false,
 	.has_ana_filtr =3D false,
+	.has_clear_cmd =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9261_config =3D {
@@ -82,6 +83,7 @@ static struct at91_twi_pdata at91sam9261_config =3D {
 	.has_dig_filtr =3D false,
 	.has_adv_dig_filtr =3D false,
 	.has_ana_filtr =3D false,
+	.has_clear_cmd =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9260_config =3D {
@@ -93,6 +95,7 @@ static struct at91_twi_pdata at91sam9260_config =3D {
 	.has_dig_filtr =3D false,
 	.has_adv_dig_filtr =3D false,
 	.has_ana_filtr =3D false,
+	.has_clear_cmd =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9g20_config =3D {
@@ -104,6 +107,7 @@ static struct at91_twi_pdata at91sam9g20_config =3D {
 	.has_dig_filtr =3D false,
 	.has_adv_dig_filtr =3D false,
 	.has_ana_filtr =3D false,
+	.has_clear_cmd =3D false,
 };
=20
 static struct at91_twi_pdata at91sam9g10_config =3D {
@@ -115,6 +119,7 @@ static struct at91_twi_pdata at91sam9g10_config =3D {
 	.has_dig_filtr =3D false,
 	.has_adv_dig_filtr =3D false,
 	.has_ana_filtr =3D false,
+	.has_clear_cmd =3D false,
 };
=20
 static const struct platform_device_id at91_twi_devtypes[] =3D {
@@ -148,6 +153,7 @@ static struct at91_twi_pdata at91sam9x5_config =3D {
 	.has_dig_filtr =3D false,
 	.has_adv_dig_filtr =3D false,
 	.has_ana_filtr =3D false,
+	.has_clear_cmd =3D false,
 };
=20
 static struct at91_twi_pdata sama5d4_config =3D {
@@ -159,6 +165,7 @@ static struct at91_twi_pdata sama5d4_config =3D {
 	.has_dig_filtr =3D true,
 	.has_adv_dig_filtr =3D false,
 	.has_ana_filtr =3D false,
+	.has_clear_cmd =3D false,
 };
=20
 static struct at91_twi_pdata sama5d2_config =3D {
@@ -170,6 +177,7 @@ static struct at91_twi_pdata sama5d2_config =3D {
 	.has_dig_filtr =3D true,
 	.has_adv_dig_filtr =3D true,
 	.has_ana_filtr =3D true,
+	.has_clear_cmd =3D false,	/* due to errata, CLEAR cmd is not working */
 };
=20
 static struct at91_twi_pdata sam9x60_config =3D {
@@ -181,6 +189,7 @@ static struct at91_twi_pdata sam9x60_config =3D {
 	.has_dig_filtr =3D true,
 	.has_adv_dig_filtr =3D true,
 	.has_ana_filtr =3D true,
+	.has_clear_cmd =3D true,
 };
=20
 static const struct of_device_id atmel_twi_dt_ids[] =3D {
diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-=
at91-master.c
index c55e8ff35201..8c4f20317847 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -480,7 +480,7 @@ static int at91_do_twi_transfer(struct at91_twi_dev *de=
v)
 	unsigned long time_left;
 	bool has_unre_flag =3D dev->pdata->has_unre_flag;
 	bool has_alt_cmd =3D dev->pdata->has_alt_cmd;
-	struct i2c_bus_recovery_info *rinfo =3D &dev->rinfo;
+	bool has_clear_cmd =3D dev->pdata->has_clear_cmd;
=20
 	/*
 	 * WARNING: the TXCOMP bit in the Status Register is NOT a clear on
@@ -641,10 +641,32 @@ static int at91_do_twi_transfer(struct at91_twi_dev *=
dev)
 			       AT91_TWI_THRCLR | AT91_TWI_LOCKCLR);
 	}
=20
-	if (rinfo->get_sda && !(rinfo->get_sda(&dev->adapter))) {
-		dev_dbg(dev->dev,
-			"SDA is down; clear bus using gpio\n");
-		i2c_recover_bus(&dev->adapter);
+	/*
+	 * some faulty I2C slave devices might hold SDA down;
+	 * we can send a bus clear command, hoping that the pins will be
+	 * released
+	 */
+	if (has_clear_cmd) {
+		if (!(dev->transfer_status & AT91_TWI_SDA)) {
+			dev_dbg(dev->dev,
+				"SDA is down; sending bus clear command\n");
+			if (dev->use_alt_cmd) {
+				unsigned int acr;
+
+				acr =3D at91_twi_read(dev, AT91_TWI_ACR);
+				acr &=3D ~AT91_TWI_ACR_DATAL_MASK;
+				at91_twi_write(dev, AT91_TWI_ACR, acr);
+			}
+			at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_CLEAR);
+		}
+	} else {
+		struct i2c_bus_recovery_info *rinfo =3D &dev->rinfo;
+
+		if (rinfo->get_sda && !(rinfo->get_sda(&dev->adapter))) {
+			dev_dbg(dev->dev,
+				"SDA is down; clear bus using gpio\n");
+			i2c_recover_bus(&dev->adapter);
+		}
 	}
=20
 	return ret;
diff --git a/drivers/i2c/busses/i2c-at91.h b/drivers/i2c/busses/i2c-at91.h
index eb335b71e775..80f77d523346 100644
--- a/drivers/i2c/busses/i2c-at91.h
+++ b/drivers/i2c/busses/i2c-at91.h
@@ -36,6 +36,7 @@
 #define	AT91_TWI_SVDIS		BIT(5)	/* Slave Transfer Disable */
 #define	AT91_TWI_QUICK		BIT(6)	/* SMBus quick command */
 #define	AT91_TWI_SWRST		BIT(7)	/* Software Reset */
+#define	AT91_TWI_CLEAR		BIT(15) /* Bus clear command */
 #define	AT91_TWI_ACMEN		BIT(16) /* Alternative Command Mode Enable */
 #define	AT91_TWI_ACMDIS		BIT(17) /* Alternative Command Mode Disable */
 #define	AT91_TWI_THRCLR		BIT(24) /* Transmit Holding Register Clear */
@@ -69,6 +70,8 @@
 #define	AT91_TWI_NACK		BIT(8)	/* Not Acknowledged */
 #define	AT91_TWI_EOSACC		BIT(11)	/* End Of Slave Access */
 #define	AT91_TWI_LOCK		BIT(23) /* TWI Lock due to Frame Errors */
+#define	AT91_TWI_SCL		BIT(24) /* TWI SCL status */
+#define	AT91_TWI_SDA		BIT(25) /* TWI SDA status */
=20
 #define	AT91_TWI_INT_MASK \
 	(AT91_TWI_TXCOMP | AT91_TWI_RXRDY | AT91_TWI_TXRDY | AT91_TWI_NACK \
@@ -81,7 +84,8 @@
 #define	AT91_TWI_THR		0x0034	/* Transmit Holding Register */
=20
 #define	AT91_TWI_ACR		0x0040	/* Alternative Command Register */
-#define	AT91_TWI_ACR_DATAL(len)	((len) & 0xff)
+#define	AT91_TWI_ACR_DATAL_MASK	GENMASK(15, 0)
+#define	AT91_TWI_ACR_DATAL(len)	((len) & AT91_TWI_ACR_DATAL_MASK)
 #define	AT91_TWI_ACR_DIR	BIT(8)
=20
 #define AT91_TWI_FILTR		0x0044
@@ -118,6 +122,7 @@ struct at91_twi_pdata {
 	bool has_dig_filtr;
 	bool has_adv_dig_filtr;
 	bool has_ana_filtr;
+	bool has_clear_cmd;
 	struct at_dma_slave dma_slave;
 };
=20
--=20
2.20.1
