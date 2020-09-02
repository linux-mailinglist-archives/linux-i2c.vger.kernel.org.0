Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AAD825B5BB
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Sep 2020 23:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgIBVPy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 17:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbgIBVPv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 17:15:51 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99F6C061244
        for <linux-i2c@vger.kernel.org>; Wed,  2 Sep 2020 14:15:50 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E9EC3806B5;
        Thu,  3 Sep 2020 09:15:47 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1599081347;
        bh=q4GGIkhlaHm4FjxDpDQ2kOnfg6glCs3Rp8TegxtnfVc=;
        h=From:To:Cc:Subject:Date;
        b=YdLCm4KWILAlaI8gu5XuIk1aHYamrcPPVZHPKFEIq71gibxDMQOUF4y0jHgyJ6vS1
         RAvVqNUqrHEkdsyYQSTq+Je8faAjVw9i0UKp+6hq4MbTtXS6p6Kpr0yUi+lBgQckWc
         RbkQIrHe+PnqYzM6urUqVW6GhdPEskdpGtJSrIwA5d20IbyQfohPzu1QBJHIoPPOk+
         EdplCz6nZXbNjxQVgl4YV6aP2XZyHuv7ae3ec7FUHBbrC7p5bSFoV8nEvxIa6Ekvzs
         o5zUrhidByNHMo8rks9eOoJImIP5IPAjb/R2WIs7XYzdT7ZlfZYIzHEb8QgUEeMCBN
         H6GW4TvG6iM4A==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f500b820000>; Thu, 03 Sep 2020 09:15:46 +1200
Received: from evann-dl.ws.atlnz.lc (evann-dl.ws.atlnz.lc [10.33.23.31])
        by smtp (Postfix) with ESMTP id C0BFE13EEB7;
        Thu,  3 Sep 2020 09:15:46 +1200 (NZST)
Received: by evann-dl.ws.atlnz.lc (Postfix, from userid 1780)
        id 687C11A4E97; Thu,  3 Sep 2020 09:15:47 +1200 (NZST)
From:   Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
To:     wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        jarkko.nikula@linux.intel.com, jdelvare@suse.de,
        chris.packham@alliedtelesis.co.nz
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
Subject: [PATCH v3 1/1] i2c: algo-pca: Reapply i2c bus settings after reset
Date:   Thu,  3 Sep 2020 09:15:32 +1200
Message-Id: <20200902211532.22684-1-evan.nimmo@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If something goes wrong (such as the SCL being stuck low) then we need
to reset the PCA chip. The issue with this is that on reset we lose all
config settings and the chip ends up in a disabled state which results
in a lock up/high CPU usage. We need to re-apply any configuration that
had previously been set and re-enable the chip.

Signed-off-by: Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---
changes in v2:
- changed lowercase "pca to uppercase "PCA".
- reworded and reformatted the multiline comment.
- moved the clock frequency KERN_INFO closer to the call that sets this.
- moved the i2c_bus_settings struct to the more generic i2c.h and removed
- the comments indicating this as being for the pca chip.

changes in v3:
- changed lowercase "cpu" to uppercase "CPU".

 drivers/i2c/algos/i2c-algo-pca.c | 36 +++++++++++++++++++++-----------
 include/linux/i2c-algo-pca.h     |  1 +
 include/linux/i2c.h              | 14 +++++++++++++
 3 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pca.c b/drivers/i2c/algos/i2c-alg=
o-pca.c
index 710fbef9a9c2..8b98b737b499 100644
--- a/drivers/i2c/algos/i2c-algo-pca.c
+++ b/drivers/i2c/algos/i2c-algo-pca.c
@@ -41,8 +41,22 @@ static void pca_reset(struct i2c_algo_pca_data *adap)
 		pca_outw(adap, I2C_PCA_INDPTR, I2C_PCA_IPRESET);
 		pca_outw(adap, I2C_PCA_IND, 0xA5);
 		pca_outw(adap, I2C_PCA_IND, 0x5A);
+
+		/*
+		 * After a reset we need to re-apply any configuration
+		 * (calculated in pca_init) to get the bus in a working state.
+		 */
+		pca_outw(adap, I2C_PCA_INDPTR, I2C_PCA_IMODE);
+		pca_outw(adap, I2C_PCA_IND, adap->bus_settings.mode);
+		pca_outw(adap, I2C_PCA_INDPTR, I2C_PCA_ISCLL);
+		pca_outw(adap, I2C_PCA_IND, adap->bus_settings.tlow);
+		pca_outw(adap, I2C_PCA_INDPTR, I2C_PCA_ISCLH);
+		pca_outw(adap, I2C_PCA_IND, adap->bus_settings.thi);
+
+		pca_set_con(adap, I2C_PCA_CON_ENSIO);
 	} else {
 		adap->reset_chip(adap->data);
+		pca_set_con(adap, I2C_PCA_CON_ENSIO | adap->bus_settings.clock_freq);
 	}
 }
=20
@@ -423,13 +437,15 @@ static int pca_init(struct i2c_adapter *adap)
 				" Use the nominal frequency.\n", adap->name);
 		}
=20
-		pca_reset(pca_data);
-
 		clock =3D pca_clock(pca_data);
+
 		printk(KERN_INFO "%s: Clock frequency is %dkHz\n",
 		     adap->name, freqs[clock]);
=20
-		pca_set_con(pca_data, I2C_PCA_CON_ENSIO | clock);
+		/* Store settings as these will be needed when the PCA chip is reset *=
/
+		pca_data->bus_settings.clock_freq =3D clock;
+
+		pca_reset(pca_data);
 	} else {
 		int clock;
 		int mode;
@@ -496,19 +512,15 @@ static int pca_init(struct i2c_adapter *adap)
 			thi =3D tlow * min_thi / min_tlow;
 		}
=20
+		/* Store settings as these will be needed when the PCA chip is reset *=
/
+		pca_data->bus_settings.mode =3D mode;
+		pca_data->bus_settings.tlow =3D tlow;
+		pca_data->bus_settings.thi =3D thi;
+
 		pca_reset(pca_data);
=20
 		printk(KERN_INFO
 		     "%s: Clock frequency is %dHz\n", adap->name, clock * 100);
-
-		pca_outw(pca_data, I2C_PCA_INDPTR, I2C_PCA_IMODE);
-		pca_outw(pca_data, I2C_PCA_IND, mode);
-		pca_outw(pca_data, I2C_PCA_INDPTR, I2C_PCA_ISCLL);
-		pca_outw(pca_data, I2C_PCA_IND, tlow);
-		pca_outw(pca_data, I2C_PCA_INDPTR, I2C_PCA_ISCLH);
-		pca_outw(pca_data, I2C_PCA_IND, thi);
-
-		pca_set_con(pca_data, I2C_PCA_CON_ENSIO);
 	}
 	udelay(500); /* 500 us for oscillator to stabilise */
=20
diff --git a/include/linux/i2c-algo-pca.h b/include/linux/i2c-algo-pca.h
index d03071732db4..97d1f4cd8e56 100644
--- a/include/linux/i2c-algo-pca.h
+++ b/include/linux/i2c-algo-pca.h
@@ -64,6 +64,7 @@ struct i2c_algo_pca_data {
 	 * For PCA9665, use the frequency you want here. */
 	unsigned int			i2c_clock;
 	unsigned int			chip;
+	struct i2c_bus_settings		bus_settings;
 };
=20
 int i2c_pca_add_bus(struct i2c_adapter *);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index fc55ea41d323..8c5138fbe532 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -724,6 +724,20 @@ struct i2c_adapter {
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
=20
+/**
+ * struct i2c_bus_settings - The configured i2c bus settings
+ * @mode: Configured i2c bus mode
+ * @tlow: Configured SCL LOW period
+ * @thi: Configured SCL HIGH period
+ * @clock_freq: The configured clock frequency
+ */
+struct i2c_bus_settings {
+	int mode;
+	int tlow;
+	int thi;
+	int clock_freq;
+};
+
 static inline void *i2c_get_adapdata(const struct i2c_adapter *adap)
 {
 	return dev_get_drvdata(&adap->dev);
--=20
2.27.0

