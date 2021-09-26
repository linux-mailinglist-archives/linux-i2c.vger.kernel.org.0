Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C701C418800
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Sep 2021 12:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbhIZKBe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Sep 2021 06:01:34 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:42217 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230250AbhIZKBb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Sep 2021 06:01:31 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id C4B8A580FD1;
        Sun, 26 Sep 2021 05:59:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 26 Sep 2021 05:59:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=KbpD7QDsVxr0s
        hguUMq4LBuqqbF0i6Fnb7YHPNOz3ek=; b=qUZpi53zHUD80M8nqu661ADs8im9g
        H6m6Mzdi6cRJ8NlT1f0sYVYv/7lnNa2vam1C9M7qUXc8Ze1S2wScKJYYiXIBtbM+
        QX9LBZ0yXEU0nvI+Q7rC5udRfhf3J5gP1P/0lPDZ7xxosHFLeMy/EWkdXxIVqBsk
        ngsa4Mn/NZxRACP15t3rrjxZAA0GEAWqa/EYorxkfXUAtrcf1tNumgUwDbOOFlvm
        0WEHWpi0Fi4WZSJGz4PVhkxdG415DFVMyqjNM9RFzHQgqtAU9+hl7QI+aamn2gJY
        BSr2rOUriYt/cj+aYQC/EfTuDwOSyeWmuyx7kmk+StJQCFDEI5jXbJHRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=KbpD7QDsVxr0shguUMq4LBuqqbF0i6Fnb7YHPNOz3ek=; b=nyyiw9q+
        Cp+FfyGYWwkGuV6q61ImTxR7ybE9CossQWXltL7CYV5fGrBJ8NFESWwQFhv0sQKn
        yuHHHMX6NBQ7sk6gG+nw6ASpr7tp0GbvsaWoWgUaesN2hQB38Yo1TRS+T9H6bGbo
        Y4MKz8rpd065L+5YcYsOxm1LsUQ5WOkEEcsa22z23nzGPH40fZZu7/ltJ8c6/BC2
        BG7akP526ty4d6wHShl2bFyQBxMLUr7JXIen9yhOW/w1vP/RM3YHLcycZ5XpRLsn
        JLDV+Pqc0/C2pe/RHrNueacCEoMgbfy+HfJLDFBRaa/Ngbz7bW7XmW1tz266n168
        y5bbkaYgxCtr8Q==
X-ME-Sender: <xms:mkRQYcGXwuhaRUvEmZRtsxt-DcPkwKCJGjM2FuazJDANj49lWSG7pw>
    <xme:mkRQYVUfFHvMx_oqde4HWaPwaYLSnnDq6Mh2dIuHGC_1kQvvEjrHWj6-5V5Az43yT
    wvbbpsStkQIUKRuhuA>
X-ME-Received: <xmr:mkRQYWINdAsd491lSj1sxKX1kcuLygitrE7qn3lcqdMLxImm3h-HheOj1vpASPybPoL_lFUfJqT-qNfpelU8CbgBAhXzhp_8MP8ff2no-GE9H5a3a5OAGgU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejiedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcu
    rfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvg
    hrnheptedvkeetleeuffffhfekteetffeggffgveehieelueefvddtueffveevlefhfeej
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepshhvvg
    hnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:mkRQYeEqq7vPywGJxFw1B_Dmfp-rcN8_A29LRsWdzn6eFD9a8xOOcw>
    <xmx:mkRQYSUsF5JptwPyJPt0aKdDykdMPYcL0E-KX655jVMCQippbcjLsA>
    <xmx:mkRQYROmiU6Yd7WtM_I22qP789qdsRA9xyjFbjMVsv7jqcLkITpoNg>
    <xmx:mkRQYbV1lji43E9w4x5B4fwEhxE6pjyKlgLPyjtLdrfxi-uHGnTsmQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Sep 2021 05:59:52 -0400 (EDT)
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
Subject: [PATCH 07/10] i2c: pasemi: Allow to configure bus frequency
Date:   Sun, 26 Sep 2021 11:58:44 +0200
Message-Id: <20210926095847.38261-8-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210926095847.38261-1-sven@svenpeter.dev>
References: <20210926095847.38261-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Right now the bus frequency has always been hardcoded as
100 KHz with the specific reference clock used in the PASemi
PCI controllers. Make this configurable to prepare for the
platform driver.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 8 +++-----
 drivers/i2c/busses/i2c-pasemi-core.h | 1 +
 drivers/i2c/busses/i2c-pasemi-pci.c  | 4 ++++
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 7c6715f5dbb8..a39e3258b162 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -39,9 +39,6 @@
 #define CTL_MTR		0x00000200
 #define CTL_CLK_M	0x000000ff
 
-#define CLK_100K_DIV	84
-#define CLK_400K_DIV	21
-
 static inline void reg_write(struct pasemi_smbus *smbus, int reg, int val)
 {
 	dev_dbg(smbus->dev, "smbus write reg %lx val %08x\n",
@@ -63,8 +60,9 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 
 static void pasemi_reset(struct pasemi_smbus *smbus)
 {
-	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
-		  (CLK_100K_DIV & CTL_CLK_M)));
+	u32 val = (CTL_MTR | CTL_MRR | (smbus->clk_div & CTL_CLK_M));
+
+	reg_write(smbus, REG_CTL, val);
 }
 
 static void pasemi_smb_clear(struct pasemi_smbus *smbus)
diff --git a/drivers/i2c/busses/i2c-pasemi-core.h b/drivers/i2c/busses/i2c-pasemi-core.h
index 7acc33de6ce1..30a7990825ef 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.h
+++ b/drivers/i2c/busses/i2c-pasemi-core.h
@@ -14,6 +14,7 @@ struct pasemi_smbus {
 	void __iomem		*ioaddr;
 	unsigned long		 base;
 	int			 size;
+	unsigned int		 clk_div;
 };
 
 int pasemi_i2c_common_probe(struct pasemi_smbus *smbus);
diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
index 9a19df31866b..7405e0b48514 100644
--- a/drivers/i2c/busses/i2c-pasemi-pci.c
+++ b/drivers/i2c/busses/i2c-pasemi-pci.c
@@ -17,6 +17,9 @@
 
 #include "i2c-pasemi-core.h"
 
+#define CLK_100K_DIV	84
+#define CLK_400K_DIV	21
+
 static struct pci_driver pasemi_smb_pci_driver;
 
 static int pasemi_smb_pci_probe(struct pci_dev *dev,
@@ -35,6 +38,7 @@ static int pasemi_smb_pci_probe(struct pci_dev *dev,
 	smbus->dev = &dev->dev;
 	smbus->base = pci_resource_start(dev, 0);
 	smbus->size = pci_resource_len(dev, 0);
+	smbus->clk_div = CLK_100K_DIV;
 
 	if (!request_region(smbus->base, smbus->size,
 			    pasemi_smb_pci_driver.name)) {
-- 
2.25.1

