Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C81082584F4
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 02:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgIAA5v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 20:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgIAA5u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Aug 2020 20:57:50 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23611C061575
        for <linux-i2c@vger.kernel.org>; Mon, 31 Aug 2020 17:57:48 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 81573806B5;
        Tue,  1 Sep 2020 12:57:41 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1598921861;
        bh=61tA8ADfiUKIPzf4noCShchjQM84gHOrhzv61rsnI0o=;
        h=From:To:Cc:Subject:Date;
        b=yCaGR7qukdtDKMsGp7Q7j2QbxT9+XR8yJfvSCw+MB8tKM9rAIZVzrXCRJnItlf7xR
         N/W59Af2pq/KurDYgzq1rkjQjO6Cek7t07ib2e3PKjkl8jJyVm3ZYDxoSUWHd5j5kI
         4fVa4cVmXhItB8Ew2W8U+zPhhpRde93BXzMOF3cggfU4nKfMMW6C/jgKSYNFULEGFz
         7DinQMG30LarX68ZMS77TU2wXHGNWxc3S9OOGqMekj1tiNvzj9OutnOF5HdbfYExEU
         VsK9cNXYnKz1+jsGEqzFBhGeapHWnbgxA+Ze55LNRFQat2d2UWOrL/NA0FWwIbO68t
         RLMPmg4zx319Q==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f4d9c840000>; Tue, 01 Sep 2020 12:57:41 +1200
Received: from evann-dl.ws.atlnz.lc (evann-dl.ws.atlnz.lc [10.33.23.31])
        by smtp (Postfix) with ESMTP id 0B4AC13EEB7;
        Tue,  1 Sep 2020 12:57:39 +1200 (NZST)
Received: by evann-dl.ws.atlnz.lc (Postfix, from userid 1780)
        id BD8421A4E97; Tue,  1 Sep 2020 12:57:39 +1200 (NZST)
From:   Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
To:     wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        jdelvare@suse.de, jarkko.nikula@linux.intel.com,
        chris.packham@alliedtelesis.co.nz
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
Subject: [PATCH] i2c: algo-pca: Reapply i2c bus settings after reset
Date:   Tue,  1 Sep 2020 12:57:13 +1200
Message-Id: <20200901005713.27453-1-evan.nimmo@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If something goes wrong (such as the SCL being stuck low) then we need
to reset the pca chip. The issue with this is that on reset we lose all
config settings and the chip ends up in a disabled state which results
in a lock up/high cpu usage. We need to re-apply any configuration that
had previously been set and re-enable the chip.

Signed-off-by: Evan Nimmo <evan.nimmo@alliedtelesis.co.nz>
---
 drivers/i2c/algos/i2c-algo-pca.c | 36 +++++++++++++++++++++-----------
 include/linux/i2c-algo-pca.h     | 15 +++++++++++++
 2 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pca.c b/drivers/i2c/algos/i2c-alg=
o-pca.c
index 710fbef9a9c2..2e4e27073f40 100644
--- a/drivers/i2c/algos/i2c-algo-pca.c
+++ b/drivers/i2c/algos/i2c-algo-pca.c
@@ -41,8 +41,22 @@ static void pca_reset(struct i2c_algo_pca_data *adap)
 		pca_outw(adap, I2C_PCA_INDPTR, I2C_PCA_IPRESET);
 		pca_outw(adap, I2C_PCA_IND, 0xA5);
 		pca_outw(adap, I2C_PCA_IND, 0x5A);
+
+		/* We need to apply any configuration settings that
+		 * were calculated in the pca_init function. The reset
+		 * results in these changes being set back to defaults.
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
+		clock =3D pca_clock(pca_data);
+
+		/* Store settings as these will be needed when the pca chip is reset *=
/
+		pca_data->bus_settings.clock_freq =3D clock;
+
 		pca_reset(pca_data);
=20
-		clock =3D pca_clock(pca_data);
 		printk(KERN_INFO "%s: Clock frequency is %dkHz\n",
 		     adap->name, freqs[clock]);
-
-		pca_set_con(pca_data, I2C_PCA_CON_ENSIO | clock);
 	} else {
 		int clock;
 		int mode;
@@ -496,19 +512,15 @@ static int pca_init(struct i2c_adapter *adap)
 			thi =3D tlow * min_thi / min_tlow;
 		}
=20
+		/* Store settings as these will be needed when the pca chip is reset *=
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
index d03071732db4..ebeadb80c797 100644
--- a/include/linux/i2c-algo-pca.h
+++ b/include/linux/i2c-algo-pca.h
@@ -53,6 +53,20 @@
 #define I2C_PCA_CON_SI		0x08 /* Serial Interrupt */
 #define I2C_PCA_CON_CR		0x07 /* Clock Rate (MASK) */
=20
+/**
+ * struct i2c_bus_settings - The configured i2c bus settings
+ * @mode: Configured i2c bus mode (PCA9665)
+ * @tlow: Configured SCL LOW period (PCA9665)
+ * @thi: Configured SCL HIGH period (PCA9665)
+ * @clock_freq: The configured clock frequency (PCA9564)
+ */
+struct i2c_bus_settings {
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
+	struct i2c_bus_settings		bus_settings;
 };
=20
 int i2c_pca_add_bus(struct i2c_adapter *);
--=20
2.27.0

