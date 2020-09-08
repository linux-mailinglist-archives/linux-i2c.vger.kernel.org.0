Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B378526212D
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 22:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgIHUdC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 16:33:02 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:46641 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgIHUdC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 16:33:02 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C05EA806B5;
        Wed,  9 Sep 2020 08:32:56 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1599597176;
        bh=rwV/xSJfjutzpYJ4zBUGBqee/pB4wUosVEzaIEIqS9w=;
        h=From:To:Cc:Subject:Date;
        b=ZIyCzS7yW2Fo+L0Hw6H+bFNw1YTAUzoX5gn3nTdUwHErTvGcHKP7gvMZU2RH0ZkKr
         I6FAzR3SNBSvSJJV/Sh/WNEO8d72Tk5QVpr13MnGKRE8SDPaVgtKYXJM6UsC78Rw+P
         sozudACqIdLxX6t3kNhtUhnDvQaNbh+Aa/oJDcS2uqFxpnl3LMwL2QVJhBnunweFLs
         Wxf9t4jxTlyqE9JVPVCHTOriqOchbme7mpRtG+CG0RgPe3X67ywZORLP7vNHYC9tSK
         +WyN9Zeij0S8q5OCPeEIKFm5Gk+8yLjWmN3jLlu9jpUrxBhPkIpmt32oBXBqkXKaNF
         vShDaCRF2OTQw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f57ea770000>; Wed, 09 Sep 2020 08:32:55 +1200
Received: from evann-dl.ws.atlnz.lc (evann-dl.ws.atlnz.lc [10.33.23.31])
        by smtp (Postfix) with ESMTP id 5833C13EEB7;
        Wed,  9 Sep 2020 08:32:56 +1200 (NZST)
Received: by evann-dl.ws.atlnz.lc (Postfix, from userid 1780)
        id 79E4D1A4E97; Wed,  9 Sep 2020 08:32:56 +1200 (NZST)
From:   Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
To:     wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        chris.packham@alliedtelesis.co.nz, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
Subject: [PATCH v4 1/1] i2c: algo-pca: Reapply i2c bus settings after reset
Date:   Wed,  9 Sep 2020 08:32:47 +1200
Message-Id: <20200908203247.14374-1-evan.nimmo@alliedtelesis.co.nz>
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
Reviewed-by: Wolfram Sang <wsa@kernel.org>
---
changes in v2:
- changed lowercase "pca to uppercase "PCA".
- reworded and reformatted the multiline comment.
- moved the clock frequency KERN_INFO closer to the call that sets this.
- moved the i2c_bus_settings struct to the more generic i2c.h and removed
- the comments indicating this as being for the pca chip.

changes in v3:
- changed lowercase "cpu" to uppercase "CPU".

changes in v4:
- renamed the struct i2c_bus_settings struct to struct pca_i2c_bus_settin=
gs.
- moved the struct pca_i2c_bus_settings struct from i2c.h to i2c-algo-pca=
.h.
- adjusted the struct field in the struct i2c_algo_pca_data struct to be =
of type
- struct pca_i2c_bus settings.
- removed an extra line in i2c-algo-pca.c

 drivers/i2c/algos/i2c-algo-pca.c | 35 +++++++++++++++++++++-----------
 include/linux/i2c-algo-pca.h     | 15 ++++++++++++++
 2 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pca.c b/drivers/i2c/algos/i2c-alg=
o-pca.c
index 710fbef9a9c2..384af88e58ad 100644
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
@@ -423,13 +437,14 @@ static int pca_init(struct i2c_adapter *adap)
 				" Use the nominal frequency.\n", adap->name);
 		}
=20
-		pca_reset(pca_data);
-
 		clock =3D pca_clock(pca_data);
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
@@ -496,19 +511,15 @@ static int pca_init(struct i2c_adapter *adap)
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
index d03071732db4..7c522fdd9ea7 100644
--- a/include/linux/i2c-algo-pca.h
+++ b/include/linux/i2c-algo-pca.h
@@ -53,6 +53,20 @@
 #define I2C_PCA_CON_SI		0x08 /* Serial Interrupt */
 #define I2C_PCA_CON_CR		0x07 /* Clock Rate (MASK) */
=20
+/**
+ * struct pca_i2c_bus_settings - The configured PCA i2c bus settings
+ * @mode: Configured i2c bus mode
+ * @tlow: Configured SCL LOW period
+ * @thi: Configured SCL HIGH period
+ * @clock_freq: The configured clock frequency
+ */
+struct pca_i2c_bus_settings {
+	int mode;
+	int tlow;
+	int thi;
+	int clock_freq;
+};
+
 struct i2c_algo_pca_data {
 	void 				*data;	/* private low level data */
 	void (*write_byte)		(void *data, int reg, int val);
@@ -64,6 +78,7 @@ struct i2c_algo_pca_data {
 	 * For PCA9665, use the frequency you want here. */
 	unsigned int			i2c_clock;
 	unsigned int			chip;
+	struct pca_i2c_bus_settings		bus_settings;
 };
=20
 int i2c_pca_add_bus(struct i2c_adapter *);
--=20
2.27.0

