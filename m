Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359CC4187FD
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Sep 2021 11:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhIZKBa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Sep 2021 06:01:30 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:49943 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230239AbhIZKB0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Sep 2021 06:01:26 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 65B07580FC9;
        Sun, 26 Sep 2021 05:59:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 26 Sep 2021 05:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=c7KwfXz039aW1
        wfmY7eI8n7gO1ZrMIuHg4HVlfkwtsE=; b=J+sJvzwElGAyYmuAvc+rvWp0ItHSg
        UkKXp+NTBtufjuhICbmcyyS2Y7XpX4ciCDBOSZ6cCr5HoMREX/78fOC8VPba+4Y3
        ajmwYa2UkJh+c9eBEKkpyXvoxaMibp9C13GKrV/KdRR8l3N4EXQo0NYiz9BKDDz+
        GC11uKyOW3445Pvm4hyG8nCT4vadtC0G3BeFO3fVPQAFNUTe1LUqhjMjHoLLw+P0
        jqQHJkSzviLCaIBK/t16bFQltKEQat2mlb/MA+drT4p33AcdGtZe8rBqc5MlWi58
        t7HLLniy9mKvTij2eYbNlOF/gME4ZJYfC+XJ0EBx6k0rYvlWuUZqfnkiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=c7KwfXz039aW1wfmY7eI8n7gO1ZrMIuHg4HVlfkwtsE=; b=CQdA+M9m
        8yYPyUKfAxMHgcy0vuzT9QRKKTgSfIcgujXFDNuOJufIWXQxvyEWEgURSKR4Ncen
        7QrcI8X2zCfQmCAxVpUyVj7+VeWPftpGuZOk9edB7s8AkkTyOgCFHCTmIF/8guUD
        93fOlr/KLdkUwBM7SqdKGt2GdlowekQZOnluj6+LD+L5xOKSrSrgrYksUNFpAIxl
        BBNx38PGwEDGG5BG2eWE9ps9u2X8AceBorRhF+95MnAiaU/lx9nRFEKMTRTUYwYD
        r9e0ai6Hf+MxzYozenUa0EEaf0gJQAi9RwjyGxbtH87T4aJejU7mD4L68MyzO7NJ
        tYV8jj+rsphUig==
X-ME-Sender: <xms:lkRQYeLNy5g_gbbhxN6eUauQG8lS2oOILrn8zMsWxBdHqTkDdHVhPg>
    <xme:lkRQYWLRDTrTo0elW9sx2oez6T9DKJA3fVn0NRWrActx27VXOHfeGKk8fTVImXahI
    aEJjoz2v-6RMBpVgCA>
X-ME-Received: <xmr:lkRQYeuKuBtjrJY1u8QDK9ZzekrSGrpE-2Gx3DckFJcDwopQ5c07X1CPCQc_y73zSvuVc98cU_J8Izu68FTkuiRzpp8Ibj4IOcN_-r8fMaTsKrSemxS6_EA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejiedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcu
    rfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvg
    hrnheptedvkeetleeuffffhfekteetffeggffgveehieelueefvddtueffveevlefhfeej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvg
    hnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:lkRQYTa06bnislySjDh8RbSjmfrXHf9YTH1bg_RMvH0wASbgR1qkCg>
    <xmx:lkRQYVYDdlJ3zeDMsi84BSOkmEI8AmDAeskLlJye3Mr09oEHmN8jeQ>
    <xmx:lkRQYfBLbUtOvl6FYiodksgIf47MPbAcouPnOaLnrQNFltPff1N1ZA>
    <xmx:lkRQYZrS0c3De-7eMFCAtYKC5NYuMaEePOWfhVBlSYlC3ceiChIfzw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Sep 2021 05:59:48 -0400 (EDT)
From:   Sven Peter <sven@svenpeter.dev>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>
Cc:     Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] i2c: pasemi: Split pci driver to its own file
Date:   Sun, 26 Sep 2021 11:58:42 +0200
Message-Id: <20210926095847.38261-6-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210926095847.38261-1-sven@svenpeter.dev>
References: <20210926095847.38261-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Split off the PCI driver so that we can reuse common code for the
platform driver.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/Makefile                   |  1 +
 .../{i2c-pasemi.c => i2c-pasemi-core.c}       | 88 +----------------
 drivers/i2c/busses/i2c-pasemi-core.h          | 19 ++++
 drivers/i2c/busses/i2c-pasemi-pci.c           | 96 +++++++++++++++++++
 4 files changed, 118 insertions(+), 86 deletions(-)
 rename drivers/i2c/busses/{i2c-pasemi.c => i2c-pasemi-core.c} (81%)
 create mode 100644 drivers/i2c/busses/i2c-pasemi-core.h
 create mode 100644 drivers/i2c/busses/i2c-pasemi-pci.c

diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 1336b04f40e2..0ab1b4cb2228 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -84,6 +84,7 @@ obj-$(CONFIG_I2C_NPCM7XX)	+= i2c-npcm7xx.o
 obj-$(CONFIG_I2C_OCORES)	+= i2c-ocores.o
 obj-$(CONFIG_I2C_OMAP)		+= i2c-omap.o
 obj-$(CONFIG_I2C_OWL)		+= i2c-owl.o
+i2c-pasemi-objs := i2c-pasemi-core.o i2c-pasemi-pci.o
 obj-$(CONFIG_I2C_PASEMI)	+= i2c-pasemi.o
 obj-$(CONFIG_I2C_PCA_PLATFORM)	+= i2c-pca-platform.o
 obj-$(CONFIG_I2C_PNX)		+= i2c-pnx.o
diff --git a/drivers/i2c/busses/i2c-pasemi.c b/drivers/i2c/busses/i2c-pasemi-core.c
similarity index 81%
rename from drivers/i2c/busses/i2c-pasemi.c
rename to drivers/i2c/busses/i2c-pasemi-core.c
index 9d69ff63f674..3eda5e375fa2 100644
--- a/drivers/i2c/busses/i2c-pasemi.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -15,15 +15,7 @@
 #include <linux/slab.h>
 #include <linux/io.h>
 
-static struct pci_driver pasemi_smb_driver;
-
-struct pasemi_smbus {
-	struct device           *dev;
-	struct i2c_adapter	 adapter;
-	void __iomem		*ioaddr;
-	unsigned long		 base;
-	int			 size;
-};
+#include "i2c-pasemi-core.h"
 
 /* Register offsets */
 #define REG_MTXFIFO	0x00
@@ -329,7 +321,7 @@ static const struct i2c_algorithm smbus_algorithm = {
 	.functionality	= pasemi_smb_func,
 };
 
-static int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
+int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 {
 	int error;
 
@@ -352,79 +344,3 @@ static int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 
 	return 0;
 }
-
-static int pasemi_smb_probe(struct pci_dev *dev,
-				      const struct pci_device_id *id)
-{
-	struct pasemi_smbus *smbus;
-	int error;
-
-	if (!(pci_resource_flags(dev, 0) & IORESOURCE_IO))
-		return -ENODEV;
-
-	smbus = kzalloc(sizeof(struct pasemi_smbus), GFP_KERNEL);
-	if (!smbus)
-		return -ENOMEM;
-
-	smbus->dev = &dev->dev;
-	smbus->base = pci_resource_start(dev, 0);
-	smbus->size = pci_resource_len(dev, 0);
-
-	if (!request_region(smbus->base, smbus->size,
-			    pasemi_smb_driver.name)) {
-		error = -EBUSY;
-		goto out_kfree;
-	}
-
-	smbus->ioaddr = ioport_map(smbus->base, smbus->size);
-	if (!smbus->ioaddr) {
-		error = -EBUSY;
-		goto out_release_region;
-	}
-
-	int error = pasemi_i2c_common_probe(smbus);
-	if (error)
-		goto out_ioport_unmap;
-
-	pci_set_drvdata(dev, smbus);
-
-	return 0;
-
- out_ioport_unmap:
-	ioport_unmap(smbus->ioaddr);
- out_release_region:
-	release_region(smbus->base, smbus->size);
- out_kfree:
-	kfree(smbus);
-	return error;
-}
-
-static void pasemi_smb_remove(struct pci_dev *dev)
-{
-	struct pasemi_smbus *smbus = pci_get_drvdata(dev);
-
-	i2c_del_adapter(&smbus->adapter);
-	ioport_unmap(smbus->ioaddr);
-	release_region(smbus->base, smbus->size);
-	kfree(smbus);
-}
-
-static const struct pci_device_id pasemi_smb_ids[] = {
-	{ PCI_DEVICE(0x1959, 0xa003) },
-	{ 0, }
-};
-
-MODULE_DEVICE_TABLE(pci, pasemi_smb_ids);
-
-static struct pci_driver pasemi_smb_driver = {
-	.name		= "i2c-pasemi",
-	.id_table	= pasemi_smb_ids,
-	.probe		= pasemi_smb_probe,
-	.remove		= pasemi_smb_remove,
-};
-
-module_pci_driver(pasemi_smb_driver);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR ("Olof Johansson <olof@lixom.net>");
-MODULE_DESCRIPTION("PA Semi PWRficient SMBus driver");
diff --git a/drivers/i2c/busses/i2c-pasemi-core.h b/drivers/i2c/busses/i2c-pasemi-core.h
new file mode 100644
index 000000000000..7acc33de6ce1
--- /dev/null
+++ b/drivers/i2c/busses/i2c-pasemi-core.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/atomic.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/i2c-smbus.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+
+struct pasemi_smbus {
+	struct device		*dev;
+	struct i2c_adapter	 adapter;
+	void __iomem		*ioaddr;
+	unsigned long		 base;
+	int			 size;
+};
+
+int pasemi_i2c_common_probe(struct pasemi_smbus *smbus);
diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
new file mode 100644
index 000000000000..9a19df31866b
--- /dev/null
+++ b/drivers/i2c/busses/i2c-pasemi-pci.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2006-2007 PA Semi, Inc
+ *
+ * SMBus host driver for PA Semi PWRficient
+ */
+
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/kernel.h>
+#include <linux/stddef.h>
+#include <linux/sched.h>
+#include <linux/i2c.h>
+#include <linux/delay.h>
+#include <linux/slab.h>
+#include <linux/io.h>
+
+#include "i2c-pasemi-core.h"
+
+static struct pci_driver pasemi_smb_pci_driver;
+
+static int pasemi_smb_pci_probe(struct pci_dev *dev,
+				      const struct pci_device_id *id)
+{
+	struct pasemi_smbus *smbus;
+	int error;
+
+	if (!(pci_resource_flags(dev, 0) & IORESOURCE_IO))
+		return -ENODEV;
+
+	smbus = kzalloc(sizeof(struct pasemi_smbus), GFP_KERNEL);
+	if (!smbus)
+		return -ENOMEM;
+
+	smbus->dev = &dev->dev;
+	smbus->base = pci_resource_start(dev, 0);
+	smbus->size = pci_resource_len(dev, 0);
+
+	if (!request_region(smbus->base, smbus->size,
+			    pasemi_smb_pci_driver.name)) {
+		error = -EBUSY;
+		goto out_kfree;
+	}
+
+	smbus->ioaddr = ioport_map(smbus->base, smbus->size);
+	if (!smbus->ioaddr) {
+		error = -EBUSY;
+		goto out_release_region;
+	}
+
+	error = pasemi_i2c_common_probe(smbus);
+	if (error)
+		goto out_ioport_unmap;
+
+	pci_set_drvdata(dev, smbus);
+
+	return 0;
+
+ out_ioport_unmap:
+	ioport_unmap(smbus->ioaddr);
+ out_release_region:
+	release_region(smbus->base, smbus->size);
+ out_kfree:
+	kfree(smbus);
+	return error;
+}
+
+static void pasemi_smb_pci_remove(struct pci_dev *dev)
+{
+	struct pasemi_smbus *smbus = pci_get_drvdata(dev);
+
+	i2c_del_adapter(&smbus->adapter);
+	ioport_unmap(smbus->ioaddr);
+	release_region(smbus->base, smbus->size);
+	kfree(smbus);
+}
+
+static const struct pci_device_id pasemi_smb_pci_ids[] = {
+	{ PCI_DEVICE(0x1959, 0xa003) },
+	{ 0, }
+};
+
+MODULE_DEVICE_TABLE(pci, pasemi_smb_pci_ids);
+
+static struct pci_driver pasemi_smb_pci_driver = {
+	.name		= "i2c-pasemi",
+	.id_table	= pasemi_smb_pci_ids,
+	.probe		= pasemi_smb_pci_probe,
+	.remove		= pasemi_smb_pci_remove,
+};
+
+module_pci_driver(pasemi_smb_pci_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Olof Johansson <olof@lixom.net>");
+MODULE_DESCRIPTION("PA Semi PWRficient SMBus driver");
-- 
2.25.1

