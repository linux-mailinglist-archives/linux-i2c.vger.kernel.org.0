Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC81418807
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Sep 2021 12:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbhIZKBq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Sep 2021 06:01:46 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:58339 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230514AbhIZKBh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Sep 2021 06:01:37 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 547A3580FDE;
        Sun, 26 Sep 2021 06:00:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 26 Sep 2021 06:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=LP/8lz47saqkf
        hCVmeWif4VdrSPwoBp2uj9OD6MO2sI=; b=TboQyJyt4MGPZJh/xJ6qiczrTbGWj
        r5ApKe/VulYN+FhoEFA2Qa93FiZAbXkU1ZtaUwNCSiCTkM7hl0FX9DLDf+jafm3f
        ML33GGGZnp8Er/R2btTDv2FpAhfpz1+x/vLcShzcqnDh5KMv3csTx1pKg2qt2Hm0
        /UFXYA5NG4/gVSYBx6fUSeS8sBt2nV/Zy+VCZk/ZO/7i3diRgpap5XTrSuCsTbnH
        74QM1QWjmIdItbseJZ8MYjXn7Ex9BL3qaTpC+6dmHWTAA8ULeCMj5bZU1vXr4oPz
        ZtXKW6NHxB50qxOiEEKfzobdWl9ffVpkMaDSh5P9e1riYsA8inkxZo8TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=LP/8lz47saqkfhCVmeWif4VdrSPwoBp2uj9OD6MO2sI=; b=NxAyPacu
        lGio5pH75/BsAtFRtcWvrptpUnUxDJJjbRfdGf6+/V3X61T4rm7z+D4m3S/dKNN/
        UugMrelKaJ8AdH0p7lN0QCwSvJrLWpKPgwAlAYm17h5Uo5t0ZIZTGiHo09ud4K63
        N6U+7iP8DbcxjQnJ7oz1rC39WRsuofgUdAzRWJTExpc1N62l+C2Sb445bhMsmugi
        dO1hhWz6UaaRf6TZqEKim+KP9vk+8RcQ4u/RW6jlbdOBNsCDlX65pW74QeXdyrj0
        gYYZAfRWYnOPpqgaQnbcr6CAhyuMDhvcEmVLyLTIMPyee6M3eUKaXI54eriFTDtY
        Xnk91yd1fBBC5w==
X-ME-Sender: <xms:oURQYW6lSjhpfTKbyCfHTwZMKa2urpOLUYQn5zBhmDMUDNiOwSMNFg>
    <xme:oURQYf5fxzX5na2HVZRUfewcI1zj0D7QVIYBWh3j-tcHzaGV_4EDX4YcGqeJP5DU6
    UCEwFgVPR2o3jES5k4>
X-ME-Received: <xmr:oURQYVdrqr8DLl27asJv6excVrQEXxW1sHHlD8UQmgX-P-gA22DoGN4Y_MOd92rfV4EPvKHNgb4VKDl__dKjlZdVSW_IudK_dnfua0Ee5wkthPJA0kVKrQc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejiedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcu
    rfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvg
    hrnheptedvkeetleeuffffhfekteetffeggffgveehieelueefvddtueffveevlefhfeej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvg
    hnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:oURQYTJKF2PL7JbAJxAMlBB0SbikpwIlZocBMD86dnoGhzw9pMjYog>
    <xmx:oURQYaJH7xtoAqBQUbEcEFUgsah3qTIKr7g8QPpq6-LnbUiybMQz0w>
    <xmx:oURQYUyoe-VxOkdI5BK3V_Gi6acHpUpniaDbfJIF6j-JQhXxKEE2aA>
    <xmx:oURQYVYz0wefuikiDeuRSykuuZ95ZGcm6SDQJ5chrpMvtAIqiEIuKg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Sep 2021 05:59:59 -0400 (EDT)
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
Subject: [PATCH 10/10] i2c: pasemi: Set enable bit for Apple variant
Date:   Sun, 26 Sep 2021 11:58:47 +0200
Message-Id: <20210926095847.38261-11-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210926095847.38261-1-sven@svenpeter.dev>
References: <20210926095847.38261-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some later revisions after the original PASemi I2C controller introduce
what likely is an enable bit to the CTL register. Without setting it the
actual i2c transmission is never started.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 8 ++++++++
 drivers/i2c/busses/i2c-pasemi-core.h | 3 +++
 drivers/i2c/busses/i2c-pasemi-pci.c  | 6 ++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 0ec65263fd08..b52a65beda99 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -22,6 +22,7 @@
 #define REG_MRXFIFO	0x04
 #define REG_SMSTA	0x14
 #define REG_CTL		0x1c
+#define REG_REV		0x28
 
 /* Register defs */
 #define MTXFIFO_READ	0x00000400
@@ -37,6 +38,7 @@
 
 #define CTL_MRR		0x00000400
 #define CTL_MTR		0x00000200
+#define CTL_EN		0x00000800
 #define CTL_CLK_M	0x000000ff
 
 static inline void reg_write(struct pasemi_smbus *smbus, int reg, int val)
@@ -60,6 +62,9 @@ static void pasemi_reset(struct pasemi_smbus *smbus)
 {
 	u32 val = (CTL_MTR | CTL_MRR | (smbus->clk_div & CTL_CLK_M));
 
+	if (smbus->hw_rev >= 6)
+		val |= CTL_EN;
+
 	reg_write(smbus, REG_CTL, val);
 }
 
@@ -335,6 +340,9 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 	/* set up the sysfs linkage to our parent device */
 	smbus->adapter.dev.parent = smbus->dev;
 
+	if (smbus->hw_rev != PASEMI_HW_REV_PCI)
+		smbus->hw_rev = reg_read(smbus, REG_REV);
+
 	pasemi_reset(smbus);
 
 	error = devm_i2c_add_adapter(smbus->dev, &smbus->adapter);
diff --git a/drivers/i2c/busses/i2c-pasemi-core.h b/drivers/i2c/busses/i2c-pasemi-core.h
index aca4e2da9089..4655124a37f3 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.h
+++ b/drivers/i2c/busses/i2c-pasemi-core.h
@@ -8,11 +8,14 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 
+#define PASEMI_HW_REV_PCI -1
+
 struct pasemi_smbus {
 	struct device		*dev;
 	struct i2c_adapter	 adapter;
 	void __iomem		*ioaddr;
 	unsigned int		 clk_div;
+	int			 hw_rev;
 };
 
 int pasemi_i2c_common_probe(struct pasemi_smbus *smbus);
diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
index c1b8901110c0..2b7be35421bc 100644
--- a/drivers/i2c/busses/i2c-pasemi-pci.c
+++ b/drivers/i2c/busses/i2c-pasemi-pci.c
@@ -42,6 +42,12 @@ static int pasemi_smb_pci_probe(struct pci_dev *dev,
 	size = pci_resource_len(dev, 0);
 	smbus->clk_div = CLK_100K_DIV;
 
+	/*
+	 * The original PASemi PCI controllers don't have a register for
+	 * their HW revision.
+	 */
+	smbus->hw_rev = PASEMI_HW_REV_PCI;
+
 	if (!devm_request_region(&dev->dev, base, size,
 			    pasemi_smb_pci_driver.name))
 		return -EBUSY;
-- 
2.25.1

