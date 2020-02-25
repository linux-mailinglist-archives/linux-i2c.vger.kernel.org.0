Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE22716EA7F
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 16:50:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730642AbgBYPuY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 10:50:24 -0500
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:50124 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729181AbgBYPuY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Feb 2020 10:50:24 -0500
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
  Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="Codrin.Ciubotariu@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Codrin.Ciubotariu@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com; spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: Wv+Si0dR4PIa4Fd4+dshtZunVdPt2kALIzHXWNfhOkIoruj948TOGCVA9wUdOV+r/MrbCJV35N
 BRACPKRNwE78A0LNXnmWkd+CpKEb+almYxQk0QIhbBoH1i5OTDIsxy8D5nb+HsVJZ2TgWewhQZ
 0/yo/htPhrYMDFwRD9gJWjBx3f/7DlUtryfLe8efPBXg4U1OgsG34orYESmyG95oMysLB+IbtL
 El9w4FwjpLbxfplhE72LCfWlBYxo3kOJH0VqK6qrRQw8Uj6LAMXstIQOO15vZsKh82WngqIhFI
 E1Y=
X-IronPort-AV: E=Sophos;i="5.70,484,1574146800"; 
   d="scan'208";a="66666906"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Feb 2020 08:50:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Feb 2020 08:50:15 -0700
Received: from rob-ult-m19940.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Tue, 25 Feb 2020 08:50:25 -0700
From:   Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <ludovic.desroches@microchip.com>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>,
        <peda@axentia.se>, <linux@armlinux.org.uk>, <wsa@the-dreams.de>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [PATCH v4 1/4] i2c: at91: Send bus clear command if SDA is down
Date:   Tue, 25 Feb 2020 17:50:09 +0200
Message-ID: <20200225155012.22764-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

After a transfer timeout, some faulty I2C slave devices might hold down
the SDA pin. We can generate a bus clear command, hoping that the slave
might release the pins.
If the CLEAR command is not supported, we will use gpio recovery, if
available, to reset the bus.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

Changes in v4:
 - moved the HW bus clear command in a recover_bus() function, to be able
   to just call i2c_recover_bus() if a transfer fails;
 - recovery gpios are no longer taken if HW bus clear command is
   supported;  

Changes in v3:
 - removed unnecessary condition from info print;
 - removed unneded declarations;

Changes in v2:
 - called i2c_recover_bus() after an error occurs, if SDA is down;
 - release gpios if recovery information is incomplete;

 drivers/i2c/busses/i2c-at91-core.c   |  2 ++
 drivers/i2c/busses/i2c-at91-master.c | 49 ++++++++++++++++++++++++----
 drivers/i2c/busses/i2c-at91.h        |  7 +++-
 3 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
index 3da1a8acecb5..e14edd236108 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -131,6 +131,7 @@ static struct at91_twi_pdata sama5d2_config = {
 	.has_dig_filtr = true,
 	.has_adv_dig_filtr = true,
 	.has_ana_filtr = true,
+	.has_clear_cmd = false,	/* due to errata, CLEAR cmd is not working */
 };
 
 static struct at91_twi_pdata sam9x60_config = {
@@ -142,6 +143,7 @@ static struct at91_twi_pdata sam9x60_config = {
 	.has_dig_filtr = true,
 	.has_adv_dig_filtr = true,
 	.has_ana_filtr = true,
+	.has_clear_cmd = true,
 };
 
 static const struct of_device_id atmel_twi_dt_ids[] = {
diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index 0aba51a7df32..776e95962ab6 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -480,7 +480,6 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
 	unsigned long time_left;
 	bool has_unre_flag = dev->pdata->has_unre_flag;
 	bool has_alt_cmd = dev->pdata->has_alt_cmd;
-	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
 
 	/*
 	 * WARNING: the TXCOMP bit in the Status Register is NOT a clear on
@@ -641,11 +640,12 @@ static int at91_do_twi_transfer(struct at91_twi_dev *dev)
 			       AT91_TWI_THRCLR | AT91_TWI_LOCKCLR);
 	}
 
-	if (rinfo->get_sda && !(rinfo->get_sda(&dev->adapter))) {
-		dev_dbg(dev->dev,
-			"SDA is down; clear bus using gpio\n");
-		i2c_recover_bus(&dev->adapter);
-	}
+	/*
+	 * some faulty I2C slave devices might hold SDA down;
+	 * we can send a bus clear command, hoping that the pins will be
+	 * released
+	 */
+	i2c_recover_bus(&dev->adapter);
 
 	return ret;
 }
@@ -830,7 +830,7 @@ static void at91_unprepare_twi_recovery(struct i2c_adapter *adap)
 	pinctrl_select_state(dev->pinctrl, dev->pinctrl_pins_default);
 }
 
-static int at91_init_twi_recovery_info(struct platform_device *pdev,
+static int at91_init_twi_recovery_gpio(struct platform_device *pdev,
 				       struct at91_twi_dev *dev)
 {
 	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
@@ -880,6 +880,41 @@ static int at91_init_twi_recovery_info(struct platform_device *pdev,
 	return 0;
 }
 
+static int at91_twi_recover_bus_cmd(struct i2c_adapter *adap)
+{
+	struct at91_twi_dev *dev = i2c_get_adapdata(adap);
+
+	dev->transfer_status |= at91_twi_read(dev, AT91_TWI_SR);
+	if (!(dev->transfer_status & AT91_TWI_SDA)) {
+		dev_dbg(dev->dev, "SDA is down; sending bus clear command\n");
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
+	return 0;
+}
+
+static int at91_init_twi_recovery_info(struct platform_device *pdev,
+				       struct at91_twi_dev *dev)
+{
+	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
+	bool has_clear_cmd = dev->pdata->has_clear_cmd;
+
+	if (!has_clear_cmd)
+		return at91_init_twi_recovery_gpio(pdev, dev);
+
+	rinfo->recover_bus = at91_twi_recover_bus_cmd;
+	dev->adapter.bus_recovery_info = rinfo;
+
+	return 0;
+}
+
 int at91_twi_probe_master(struct platform_device *pdev,
 			  u32 phy_addr, struct at91_twi_dev *dev)
 {
diff --git a/drivers/i2c/busses/i2c-at91.h b/drivers/i2c/busses/i2c-at91.h
index f57a6cab96b4..7e7b4955ca7f 100644
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
 
 #define AT91_TWI_FILTR		0x0044
@@ -118,6 +122,7 @@ struct at91_twi_pdata {
 	bool has_dig_filtr;
 	bool has_adv_dig_filtr;
 	bool has_ana_filtr;
+	bool has_clear_cmd;
 	struct at_dma_slave dma_slave;
 };
 
-- 
2.20.1

