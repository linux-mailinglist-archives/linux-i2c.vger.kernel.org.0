Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEB2426F2A
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Oct 2021 18:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240266AbhJHQjI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Oct 2021 12:39:08 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:59489 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239741AbhJHQil (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Oct 2021 12:38:41 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 5650658101A;
        Fri,  8 Oct 2021 12:36:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 08 Oct 2021 12:36:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=X1fW3jErcM0wF
        qDDyhC22DVevKA+s2U39zD/IcX7T2Y=; b=RlbSNg0LEvakuBBPEiDxWb/WeiPY+
        lPw9Yx065rIxZop4zvLP8s/GdPbr+eiFRrvs4yhiW2RtEpTpRo7/X/gOpp3z3cMt
        tWIs441p+FMiEQz17te7EC3E+/TlTqgkQcHdUUp9GsNrar3WZMriAoz0TBrcZX5E
        tiBGKNyy91P1MdobLeyaOm0Nblh2R0jx711FvUpj9v+PqMM8EK0IOSJNVa3xNUXp
        7znPYaOSMa2P3A3kykryXRgAgpP8IB+8d2CVbO4/gylZ3JV1hX2D4XoupoyoxoBn
        ReYHXXFOWU5wPQRBk0UMj4xHfknZp1Uvch4sP4yS3QkRaoLJKBKfwvACA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=X1fW3jErcM0wFqDDyhC22DVevKA+s2U39zD/IcX7T2Y=; b=gGQ9/szq
        CMn5XSJV/7/vEIUHwSCbtc0uamf9mPtpDmyjXJWEp5UFSNLNkTcyc4CSNivr1jGV
        P8uTTJ0S1l6ND9tSkXMAra5bS+lfpSQRYgtNTPSB58dZAm7jmUsGZcnyv4mdYvOc
        3a2W11eFHd5Adr3X5B2/IOBKN3c2lsapz2eK5zeUTpJ0UdKTNpA9n9ifvrcBeHNG
        IzBJdHo3+fi1Z7Id3IU3snPOBSR5L3++TUJ1FsKG8+ajPITArwewVxN/HlEcJeOR
        NZq1HFyBZ1/vooF39hK1GEJ3q0tXZa6yx4KnTTfK7MN9hCfipLUXXkMlv49lra9V
        2ZDjMeUtupr+9g==
X-ME-Sender: <xms:nXNgYcd10G_X36ldALmzdCeWhOIdobnMeL80GvwfAREh22OS18Ch8Q>
    <xme:nXNgYeML_VIqLSUFDTQJC1eroGRS7k6DjemtsIzlLMPRuvwsfM7jc1ycb0EbQR8KI
    jWHROG7DrrIr7-dppU>
X-ME-Received: <xmr:nXNgYdhZEHW_A7TwXLuZ378nranoEcqOVT_sMl3sj5ytgrhkptRRUY2_kz2l1AUX3wUQVubO6KOsUeXeX0jhribD3-yPSAEGX1z-xb3q35mlBC-GL5cZa_0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhvvghn
    ucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtth
    gvrhhnpeetvdekteeluefffffhkeetteffgefggfevheeileeufedvtdeuffevveelhfef
    jeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvh
    gvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:nXNgYR-9sfB_-3lGixjfD6OCTi0o3PJq4PdzMejvBsIGTvwRfRD9xw>
    <xmx:nXNgYYskb6Lzb4KsMr5Jqe73Z2NTfF1V7m65BLAhZkQatA0rsDK17Q>
    <xmx:nXNgYYENMr-qx-fQ_bGQeJSH8F_JQO5h-FzE58M3INR3bIPtD8YeAA>
    <xmx:nXNgYcN9FzoqOquBSzG4yT6XutteFLtbnazcuXyblYJskgOBuKPM8g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 12:36:42 -0400 (EDT)
From:   Sven Peter <sven@svenpeter.dev>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/11] i2c: pasemi: Set enable bit for Apple variant
Date:   Fri,  8 Oct 2021 18:35:32 +0200
Message-Id: <20211008163532.75569-12-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20211008163532.75569-1-sven@svenpeter.dev>
References: <20211008163532.75569-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some later revisions after the original PASemi I2C controller introduce
what likely is an enable bit to the CTL register. Without setting it the
actual i2c transmission is never started.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
v1 -> v2: no changes

 drivers/i2c/busses/i2c-pasemi-core.c | 8 ++++++++
 drivers/i2c/busses/i2c-pasemi-core.h | 3 +++
 drivers/i2c/busses/i2c-pasemi-pci.c  | 6 ++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 3d87b64dd9f7..4e161a4089d8 100644
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
index 4251e7b9f177..1ab1f28744fb 100644
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

