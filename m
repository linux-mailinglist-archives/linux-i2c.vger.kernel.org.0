Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77328C39B9
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2019 18:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbfJAQA4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Oct 2019 12:00:56 -0400
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:9752 "EHLO
        smtp-fw-6001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbfJAQA4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Oct 2019 12:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1569945654; x=1601481654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=xWH4lG20IIUw6dauOTepn7gZe73IqabzrfB2TTDNa6g=;
  b=PllNqCS3P+Lt+fA991x05MSX3RVeJ4DS+9SsduBoOIRGR8wP9z9Fjd6X
   lq6FZwAj+Fc3H3DNMHihpuz/Lb6vr4hvrRB8yM9E9M+8YYxbzTU9VO4vr
   fqvhNFQBq6FSPrjR625j70FmUTyVPYLH3rHW/m/Qc6sdGiMOnMBLOVTIw
   4=;
X-IronPort-AV: E=Sophos;i="5.64,571,1559520000"; 
   d="scan'208";a="419068224"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.124.125.6])
  by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP; 01 Oct 2019 16:00:53 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
        by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS id 51AF7A295F;
        Tue,  1 Oct 2019 16:00:47 +0000 (UTC)
Received: from EX13D02UWB004.ant.amazon.com (10.43.161.11) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 1 Oct 2019 16:00:18 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D02UWB004.ant.amazon.com (10.43.161.11) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 1 Oct 2019 16:00:17 +0000
Received: from 8c859006a84e.ant.amazon.com (172.26.203.30) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 1 Oct 2019 16:00:15 +0000
From:   Patrick Williams <alpawi@amazon.com>
CC:     Patrick Williams <alpawi@amazon.com>,
        Patrick Williams <patrick@stwcx.xyz>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Max Staudt <max@enpas.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Juergen Fitschen" <jfi@ssv-embedded.de>,
        Elie Morisse <syniurge@gmail.com>,
        Ajay Gupta <ajayg@nvidia.com>, Stefan Roese <sr@denx.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        "Paul Cercueil" <paul@crapouillou.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Enrico Weigelt" <info@metux.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] i2c: pxa: migrate to new i2c_slave APIs
Date:   Tue, 1 Oct 2019 10:59:59 -0500
Message-ID: <20191001160001.2388-2-alpawi@amazon.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20191001160001.2388-1-alpawi@amazon.com>
References: <20191001160001.2388-1-alpawi@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2c subsystem was enhanced circa 2015 to support operating as
an i2c-slave device.  Prior to that, the i2c-pxa driver supported
an i2c-slave but had its own APIs.  There are no existing in-kernel
drivers or platforms that utilize the i2c-pxa APIs.

Migrate the i2c-pxa driver to the general i2c-slave APIs so that
existing drivers, such as the i2c-slave-eeprom, can be used.

This has been tested with a Marvell EspressoBin, using i2c-pxa and
i2c-slave-eeprom, acting as a slave, and a RaspeberryPi 3, using the
at24 driver, acting as a master.

Signed-off-by: Patrick Williams <alpawi@amazon.com>
---
 drivers/i2c/busses/Kconfig   |  1 +
 drivers/i2c/busses/i2c-pxa.c | 74 +++++++++++++++++++++++++++++-------
 2 files changed, 61 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 146ce40d8e0a..d0c79ac9ffdb 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -874,6 +874,7 @@ config I2C_PXA_PCI
 config I2C_PXA_SLAVE
 	bool "Intel PXA2XX I2C Slave comms support"
 	depends on I2C_PXA && !X86_32
+	select I2C_SLAVE
 	help
 	  Support I2C slave mode communications on the PXA I2C bus.  This
 	  is necessary for systems where the PXA may be a target on the
diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 2c3c3d6935c0..c811646e809f 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -180,7 +180,7 @@ struct pxa_i2c {
 	struct i2c_adapter	adap;
 	struct clk		*clk;
 #ifdef CONFIG_I2C_PXA_SLAVE
-	struct i2c_slave_client *slave;
+	struct i2c_client	*slave;
 #endif
 
 	unsigned int		irqlogidx;
@@ -544,22 +544,23 @@ static void i2c_pxa_slave_txempty(struct pxa_i2c *i2c, u32 isr)
 	if (isr & ISR_BED) {
 		/* what should we do here? */
 	} else {
-		int ret = 0;
+		u8 byte = 0;
 
 		if (i2c->slave != NULL)
-			ret = i2c->slave->read(i2c->slave->data);
+			i2c_slave_event(i2c->slave, I2C_SLAVE_READ_PROCESSED,
+					&byte);
 
-		writel(ret, _IDBR(i2c));
+		writel(byte, _IDBR(i2c));
 		writel(readl(_ICR(i2c)) | ICR_TB, _ICR(i2c));   /* allow next byte */
 	}
 }
 
 static void i2c_pxa_slave_rxfull(struct pxa_i2c *i2c, u32 isr)
 {
-	unsigned int byte = readl(_IDBR(i2c));
+	u8 byte = readl(_IDBR(i2c));
 
 	if (i2c->slave != NULL)
-		i2c->slave->write(i2c->slave->data, byte);
+		i2c_slave_event(i2c->slave, I2C_SLAVE_WRITE_RECEIVED, &byte);
 
 	writel(readl(_ICR(i2c)) | ICR_TB, _ICR(i2c));
 }
@@ -572,9 +573,18 @@ static void i2c_pxa_slave_start(struct pxa_i2c *i2c, u32 isr)
 		dev_dbg(&i2c->adap.dev, "SAD, mode is slave-%cx\n",
 		       (isr & ISR_RWM) ? 'r' : 't');
 
-	if (i2c->slave != NULL)
-		i2c->slave->event(i2c->slave->data,
-				 (isr & ISR_RWM) ? I2C_SLAVE_EVENT_START_READ : I2C_SLAVE_EVENT_START_WRITE);
+	if (i2c->slave != NULL) {
+		if (isr & ISR_RWM) {
+			u8 byte = 0;
+
+			i2c_slave_event(i2c->slave, I2C_SLAVE_READ_REQUESTED,
+					&byte);
+			writel(byte, _IDBR(i2c));
+		} else {
+			i2c_slave_event(i2c->slave, I2C_SLAVE_WRITE_REQUESTED,
+					NULL);
+		}
+	}
 
 	/*
 	 * slave could interrupt in the middle of us generating a
@@ -607,7 +617,7 @@ static void i2c_pxa_slave_stop(struct pxa_i2c *i2c)
 		dev_dbg(&i2c->adap.dev, "ISR: SSD (Slave Stop)\n");
 
 	if (i2c->slave != NULL)
-		i2c->slave->event(i2c->slave->data, I2C_SLAVE_EVENT_STOP);
+		i2c_slave_event(i2c->slave, I2C_SLAVE_STOP, NULL);
 
 	if (i2c_debug > 2)
 		dev_dbg(&i2c->adap.dev, "ISR: SSD (Slave Stop) acked\n");
@@ -619,6 +629,38 @@ static void i2c_pxa_slave_stop(struct pxa_i2c *i2c)
 	if (i2c->msg)
 		i2c_pxa_master_complete(i2c, I2C_RETRY);
 }
+
+static int i2c_pxa_slave_reg(struct i2c_client *slave)
+{
+	struct pxa_i2c *i2c = slave->adapter->algo_data;
+
+	if (i2c->slave)
+		return -EBUSY;
+
+	if (!i2c->reg_isar)
+		return -EAFNOSUPPORT;
+
+	i2c->slave = slave;
+	i2c->slave_addr = slave->addr;
+
+	writel(i2c->slave_addr, _ISAR(i2c));
+
+	return 0;
+}
+
+static int i2c_pxa_slave_unreg(struct i2c_client *slave)
+{
+	struct pxa_i2c *i2c = slave->adapter->algo_data;
+
+	WARN_ON(!i2c->slave);
+
+	i2c->slave_addr = I2C_PXA_SLAVE_ADDR;
+	writel(i2c->slave_addr, _ISAR(i2c));
+
+	i2c->slave = NULL;
+
+	return 0;
+}
 #else
 static void i2c_pxa_slave_txempty(struct pxa_i2c *i2c, u32 isr)
 {
@@ -1141,11 +1183,19 @@ static u32 i2c_pxa_functionality(struct i2c_adapter *adap)
 static const struct i2c_algorithm i2c_pxa_algorithm = {
 	.master_xfer	= i2c_pxa_xfer,
 	.functionality	= i2c_pxa_functionality,
+#ifdef CONFIG_I2C_PXA_SLAVE
+	.reg_slave	= i2c_pxa_slave_reg,
+	.unreg_slave	= i2c_pxa_slave_unreg,
+#endif
 };
 
 static const struct i2c_algorithm i2c_pxa_pio_algorithm = {
 	.master_xfer	= i2c_pxa_pio_xfer,
 	.functionality	= i2c_pxa_functionality,
+#ifdef CONFIG_I2C_PXA_SLAVE
+	.reg_slave	= i2c_pxa_slave_reg,
+	.unreg_slave	= i2c_pxa_slave_unreg,
+#endif
 };
 
 static const struct of_device_id i2c_pxa_dt_ids[] = {
@@ -1270,10 +1320,6 @@ static int i2c_pxa_probe(struct platform_device *dev)
 	i2c->highmode_enter = false;
 
 	if (plat) {
-#ifdef CONFIG_I2C_PXA_SLAVE
-		i2c->slave_addr = plat->slave_addr;
-		i2c->slave = plat->slave;
-#endif
 		i2c->adap.class = plat->class;
 	}
 
-- 
2.17.2 (Apple Git-113)

