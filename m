Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39B794187F9
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Sep 2021 11:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhIZKBY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Sep 2021 06:01:24 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:56169 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230171AbhIZKBW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Sep 2021 06:01:22 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0325E580FC0;
        Sun, 26 Sep 2021 05:59:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 26 Sep 2021 05:59:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=lp+XUp7mIfXq3
        15prP8VbwTOoD7Xg/G3KhTR4HgHB0I=; b=n/bwUgzw0kmotuC8bjksXKblzHPTY
        5Z+L3BQ/jcwneG/mmwJoN+8F6M9gy6oHdqaz9QfN3RoTy4mk6WP4Drxan7UepCF+
        fM0juN6F67kV+eYkrR3yv4kYZVdO1QSRUnXGR7L+tVL47a7GeEWxWmWB4DjCrMOV
        dvami0204CRFW5KY0BYo7SIdEHTkpLK9kJ0n2Lv1JwBgycqtxD1hNpzNMxvDgJVq
        AxI86GIp85zbWPC2ohNofJx50w0ivWXF1ssqD2bZcfaRQnbH4ycZsRxpHBQk4D04
        1GQ3yjvR6SaP1JJm9KkDht2ZKYIhqZhVMPU9DQpFPVa4EneL7QiQtCEyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=lp+XUp7mIfXq315prP8VbwTOoD7Xg/G3KhTR4HgHB0I=; b=p+g75wOz
        QmwLuZ4yyIEva+90iJlSIj2jdKz/OkpP70yUTuXP8u9NsiBS8C9BdDBNwWdAA8Oi
        Mt2rPlrnq0I60VNhpHQRQ1wEC/H0PLSlphxOpz89oiaHM1z6pMHNn+5E5BEOB8ip
        7X18rYwIGDW/4quvHj0EBeQ6t3tI4L2cIDzGMlxK+25IyphCip54CxCVMYgoMVjS
        buTOcs/w0jkpKAqps50HoxbOUwNTdzQoeffP4cmitLW80CYKuRzoXKOo0LEXkoDt
        iIChz+cgTJGHFRcmfkR7PUC5/Iq5e+t36q0SftL+4ycY+fHhHPQlgbjew/tzBM47
        VBAY6n4kY9DZSQ==
X-ME-Sender: <xms:kURQYX2J0XyigC2dqdsYsRM3jhRCaZkARuXnK8v7Nnb65FVAoEB58A>
    <xme:kURQYWH079MdbiFZF_9RgY-InorHg5_WkLItLZV4_hJy1t8JtOJNHyBS_NwCcbF9Q
    q06VeQxABNYZtcmDcA>
X-ME-Received: <xmr:kURQYX6LhjEblI9uySoFgiLVO82aFA9LWdOtIOh0NXFs2eKSE1hxpfzDgkvzkB8UM3nzUQbSFuyeBeRc6hUymKH8TGeUn7_3JGe--NMdkY3TFSphD6O-ahc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejiedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcu
    rfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvg
    hrnheptedvkeetleeuffffhfekteetffeggffgveehieelueefvddtueffveevlefhfeej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvg
    hnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:kURQYc0EqBihZloO8NX0l86cEr1qbvadJcZ9ndDXdmKh8IM8W0TpFQ>
    <xmx:kURQYaH9GeOpyQlWHDxz4OJcKtW_w3nRL2eldZrG9RY6-u6N0Hp_JQ>
    <xmx:kURQYd8_Qvvl-nyOOue6a1RHbG9D31wB2z8wAK_efDgpLdfCJ_lQpQ>
    <xmx:kURQYWEFHKGAMlEk80zSEKe_KpszEoliC1PdDx_QCN_SjzC3D9BGoQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Sep 2021 05:59:43 -0400 (EDT)
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
Subject: [PATCH 03/10] i2c: pasemi: Remove usage of pci_dev
Date:   Sun, 26 Sep 2021 11:58:40 +0200
Message-Id: <20210926095847.38261-4-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210926095847.38261-1-sven@svenpeter.dev>
References: <20210926095847.38261-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Prepare to create a platform driver by removing all usages of pci_dev we
can.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi.c b/drivers/i2c/busses/i2c-pasemi.c
index dd31d902a621..5a25c2e54b9e 100644
--- a/drivers/i2c/busses/i2c-pasemi.c
+++ b/drivers/i2c/busses/i2c-pasemi.c
@@ -18,7 +18,7 @@
 static struct pci_driver pasemi_smb_driver;
 
 struct pasemi_smbus {
-	struct pci_dev		*dev;
+	struct device           *dev;
 	struct i2c_adapter	 adapter;
 	void __iomem		*ioaddr;
 	unsigned long		 base;
@@ -52,7 +52,7 @@ struct pasemi_smbus {
 
 static inline void reg_write(struct pasemi_smbus *smbus, int reg, int val)
 {
-	dev_dbg(&smbus->dev->dev, "smbus write reg %lx val %08x\n",
+	dev_dbg(smbus->dev, "smbus write reg %lx val %08x\n",
 		smbus->base + reg, val);
 	iowrite32(val, smbus->ioaddr + reg);
 }
@@ -61,7 +61,7 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 {
 	int ret;
 	ret = ioread32(smbus->ioaddr + reg);
-	dev_dbg(&smbus->dev->dev, "smbus read reg %lx val %08x\n",
+	dev_dbg(smbus->dev, "smbus read reg %lx val %08x\n",
 		smbus->base + reg, ret);
 	return ret;
 }
@@ -94,7 +94,7 @@ static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
 		return -ENXIO;
 
 	if (timeout < 0) {
-		dev_warn(&smbus->dev->dev, "Timeout, status 0x%08x\n", status);
+		dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
 		reg_write(smbus, REG_SMSTA, status);
 		return -ETIME;
 	}
@@ -342,7 +342,7 @@ static int pasemi_smb_probe(struct pci_dev *dev,
 	if (!smbus)
 		return -ENOMEM;
 
-	smbus->dev = dev;
+	smbus->dev = &dev->dev;
 	smbus->base = pci_resource_start(dev, 0);
 	smbus->size = pci_resource_len(dev, 0);
 
@@ -366,7 +366,7 @@ static int pasemi_smb_probe(struct pci_dev *dev,
 	smbus->adapter.algo_data = smbus;
 
 	/* set up the sysfs linkage to our parent device */
-	smbus->adapter.dev.parent = &dev->dev;
+	smbus->adapter.dev.parent = smbus->dev;
 
 	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
 		  (CLK_100K_DIV & CTL_CLK_M)));
-- 
2.25.1

