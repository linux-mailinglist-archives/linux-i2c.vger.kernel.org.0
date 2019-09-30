Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD75DC1C91
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2019 10:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729849AbfI3IKx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Sep 2019 04:10:53 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:23356 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbfI3IKx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Sep 2019 04:10:53 -0400
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="Codrin.Ciubotariu@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: B6uLi4Qbu9FFLFCGSo0DY8CEcMIpWJyexRQUgfJbohKBqupmT9+BGvpbYOCrgdsWvr46fiHjuz
 7peqgYEy57fh316Hk1KTWABe1+wro3xJMFrStFgCrBx2QCbi9f9Z0cdvnS8KIfp74Ch0oU/R6G
 899haWDs2PHyFzkce9PlX0yLtuD+Mzdi1Mt0QMNatnOzgGwTWrd4Vp8vHbY3nAm/7a/JEEznb+
 UC9Pxe04J7MkMuWjq5xzgmGTZ0tCm716uyfblLTN1gQ7VMTP1i2RQOBXfJyfvHZbxo3pl7usMw
 /EA=
X-IronPort-AV: E=Sophos;i="5.64,565,1559545200"; 
   d="scan'208";a="52398108"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Sep 2019 01:10:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Sep 2019 01:10:52 -0700
Received: from rob-ult-m19940.microchip.com (10.10.85.251) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Mon, 30 Sep 2019 01:10:48 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <wsa@the-dreams.de>,
        <Claudiu.Beznea@microchip.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [PATCH v3] i2c: at91: Send bus clear command if SCL or SDA is down
Date:   Mon, 30 Sep 2019 11:10:36 +0300
Message-ID: <20190930081036.17803-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

After a transfer timeout, some faulty I2C slave devices might hold down
the SCL or the SDA pins. We can generate a bus clear command, hoping that
the slave might release the pins.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---

Changes in v3:
 - fixed kbuild warning;

Changes in v2:
 - added '.has_clear_cmd' struct member to specify which IPs support the
   clear command; for now, only SAMA5D2 supports it;
 - added Ludovic's V1 ack since there were no major changes;

 drivers/i2c/busses/i2c-at91-core.c   |  8 ++++++++
 drivers/i2c/busses/i2c-at91-master.c | 22 ++++++++++++++++++++++
 drivers/i2c/busses/i2c-at91.h        |  7 ++++++-
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
index 435c7d7377a3..cb07489e698f 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -68,6 +68,7 @@ static struct at91_twi_pdata at91rm9200_config = {
 	.has_unre_flag = true,
 	.has_alt_cmd = false,
 	.has_hold_field = false,
+	.has_clear_cmd = false,
 };
 
 static struct at91_twi_pdata at91sam9261_config = {
@@ -76,6 +77,7 @@ static struct at91_twi_pdata at91sam9261_config = {
 	.has_unre_flag = false,
 	.has_alt_cmd = false,
 	.has_hold_field = false,
+	.has_clear_cmd = false,
 };
 
 static struct at91_twi_pdata at91sam9260_config = {
@@ -84,6 +86,7 @@ static struct at91_twi_pdata at91sam9260_config = {
 	.has_unre_flag = false,
 	.has_alt_cmd = false,
 	.has_hold_field = false,
+	.has_clear_cmd = false,
 };
 
 static struct at91_twi_pdata at91sam9g20_config = {
@@ -92,6 +95,7 @@ static struct at91_twi_pdata at91sam9g20_config = {
 	.has_unre_flag = false,
 	.has_alt_cmd = false,
 	.has_hold_field = false,
+	.has_clear_cmd = false,
 };
 
 static struct at91_twi_pdata at91sam9g10_config = {
@@ -100,6 +104,7 @@ static struct at91_twi_pdata at91sam9g10_config = {
 	.has_unre_flag = false,
 	.has_alt_cmd = false,
 	.has_hold_field = false,
+	.has_clear_cmd = false,
 };
 
 static const struct platform_device_id at91_twi_devtypes[] = {
@@ -130,6 +135,7 @@ static struct at91_twi_pdata at91sam9x5_config = {
 	.has_unre_flag = false,
 	.has_alt_cmd = false,
 	.has_hold_field = false,
+	.has_clear_cmd = false,
 };
 
 static struct at91_twi_pdata sama5d4_config = {
@@ -138,6 +144,7 @@ static struct at91_twi_pdata sama5d4_config = {
 	.has_unre_flag = false,
 	.has_alt_cmd = false,
 	.has_hold_field = true,
+	.has_clear_cmd = false,
 };
 
 static struct at91_twi_pdata sama5d2_config = {
@@ -146,6 +153,7 @@ static struct at91_twi_pdata sama5d2_config = {
 	.has_unre_flag = true,
 	.has_alt_cmd = true,
 	.has_hold_field = true,
+	.has_clear_cmd = true,
 };
 
 static const struct of_device_id atmel_twi_dt_ids[] = {
diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index a3fcc35ffd3b..12d4fa946a82 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -440,6 +440,7 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
 	unsigned long time_left;
 	bool has_unre_flag = dev->pdata->has_unre_flag;
 	bool has_alt_cmd = dev->pdata->has_alt_cmd;
+	bool has_clear_cmd = dev->pdata->has_clear_cmd;
 
 	/*
 	 * WARNING: the TXCOMP bit in the Status Register is NOT a clear on
@@ -599,6 +600,27 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
 		at91_twi_write(dev, AT91_TWI_CR,
 			       AT91_TWI_THRCLR | AT91_TWI_LOCKCLR);
 	}
+
+	/*
+	 * After timeout, some faulty I2C slave devices might hold SCL/SDA down;
+	 * we can send a bus clear command, hoping that the pins will be
+	 * released
+	 */
+	if (has_clear_cmd &&
+	    (!(dev->transfer_status & AT91_TWI_SDA) ||
+	     !(dev->transfer_status & AT91_TWI_SCL))) {
+		dev_dbg(dev->dev,
+			"SDA/SCL are down; sending bus clear command\n");
+		if (dev->use_alt_cmd) {
+			unsigned int acr;
+
+			acr = at91_twi_read(dev, AT91_TWI_ACR);
+			acr &= ~AT91_TWI_ACR_DATAL_MASK;
+			at91_twi_write(dev, AT91_TWI_ACR, acr);
+		}
+		at91_twi_write(dev, AT91_TWI_CR, AT91_TWI_CLEAR);
+	}
+
 	return ret;
 }
 
diff --git a/drivers/i2c/busses/i2c-at91.h b/drivers/i2c/busses/i2c-at91.h
index 499b506f6128..0827c28a84db 100644
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
 
 #define	AT91_TWI_INT_MASK \
 	(AT91_TWI_TXCOMP | AT91_TWI_RXRDY | AT91_TWI_TXRDY | AT91_TWI_NACK \
@@ -81,7 +84,8 @@
 #define	AT91_TWI_THR		0x0034	/* Transmit Holding Register */
 
 #define	AT91_TWI_ACR		0x0040	/* Alternative Command Register */
-#define	AT91_TWI_ACR_DATAL(len)	((len) & 0xff)
+#define	AT91_TWI_ACR_DATAL_MASK	GENMASK(15, 0)
+#define	AT91_TWI_ACR_DATAL(len)	((len) & AT91_TWI_ACR_DATAL_MASK)
 #define	AT91_TWI_ACR_DIR	BIT(8)
 
 #define	AT91_TWI_FMR		0x0050	/* FIFO Mode Register */
@@ -108,6 +112,7 @@ struct at91_twi_pdata {
 	bool has_unre_flag;
 	bool has_alt_cmd;
 	bool has_hold_field;
+	bool has_clear_cmd;
 	struct at_dma_slave dma_slave;
 };
 
-- 
2.20.1

