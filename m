Return-Path: <linux-i2c+bounces-2828-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C0989BBAE
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 11:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85AE41F21F2E
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 09:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B51B4645B;
	Mon,  8 Apr 2024 09:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/5tfw9k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336D844C94;
	Mon,  8 Apr 2024 09:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712568574; cv=none; b=nrBTKebsWyan1Pa5HHDlV4jWYe+jWes3U3N4UqhjbacB0jh2+rW2ygtkd82uvurGxEaHJRIG33+yiecgZ1jNC7Eho6WrARbO0/VYpn9vlpBlaFX3o+IX0egjyOBLLGo/VUFzC35xx7y0/x3EOCLo/fbPTZ8j8pAelQxH1o4FMxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712568574; c=relaxed/simple;
	bh=rBe98hJNY8XuRDecuH4PlMK9Yxww2sRXOAuYjPRlaSo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FjwqbiPfk898reaieovxhcnA+S/TTiYn+0K8t6o/YPof5FEloo7+mOefr5retlMEG2LwS96zg8xMb/+KVsMlVWmGx2+pJhHDJ9ig3THazx33+xFxdadDXMV3LkTP7NQHRJ85EjcWZkYOJqjHEbu1RvH6KUlUT9ufqNjGqX0JkB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/5tfw9k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53DB5C433F1;
	Mon,  8 Apr 2024 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712568574;
	bh=rBe98hJNY8XuRDecuH4PlMK9Yxww2sRXOAuYjPRlaSo=;
	h=From:To:Cc:Subject:Date:From;
	b=F/5tfw9k/x4622llVirTzKRAmTFIFVEW9tt360apuDlDTQ9eGswCsqVW5y9GwqngK
	 dMcgm1UeYSkA+sPdVRHJ+0i/fiWliU5R3hHxJy73wWJClqR27AqTGk5Mn2GEIJUJiV
	 oYP4PyAUaSgLaxlXGgav7sKDlrsWYvEwa/o+fIs/PrbIBtM+0z/RseVXehWb4s3bUt
	 uB7iOqmEaiuExGwCgrhIN0CB2zQhBpDddZVM0L8qC9LDcLr0oyrnjTW2NvzxlKhuFV
	 fmXmYim5kTYd4kBg7hslAnPwQpmshGG863YD+COo1SFOe3g1Sxo5atQZkeBpw0RqiV
	 ljAlL/QZOfO2g==
From: Arnd Bergmann <arnd@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Peter Korsgaard <peter@korsgaard.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: ocores: convert to ioport_map() for IORESOURCE_IO
Date: Mon,  8 Apr 2024 11:28:36 +0200
Message-Id: <20240408092923.2816928-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

There is at least one machine that uses this driver but does not
have support for inb()/outb() instructions.

Convert this to using ioport_map() so it can build on architectures
that don't provide these but work correctly on machines that require
using port I/O.

Fixes: 53f44c1005ba ("i2c: add HAS_IOPORT dependencies")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Link: https://lore.kernel.org/lkml/CAMuHMdVUQ2WgtpYPYfO2T=itMmZ7w=geREqDtsP8Q3ODh9rxdw@mail.gmail.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/i2c/busses/Kconfig      |  1 -
 drivers/i2c/busses/i2c-ocores.c | 21 +++++++--------------
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 2d5e74ac9ea0..64c985ec0fae 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -886,7 +886,6 @@ config I2C_NPCM
 
 config I2C_OCORES
 	tristate "OpenCores I2C Controller"
-	depends on HAS_IOPORT
 	help
 	  If you say yes to this option, support will be included for the
 	  OpenCores I2C controller. For details see
diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index e106af83cef4..56a4dabf5a38 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -32,7 +32,6 @@
  */
 struct ocores_i2c {
 	void __iomem *base;
-	int iobase;
 	u32 reg_shift;
 	u32 reg_io_width;
 	unsigned long flags;
@@ -136,16 +135,6 @@ static inline u8 oc_getreg_32be(struct ocores_i2c *i2c, int reg)
 	return ioread32be(i2c->base + (reg << i2c->reg_shift));
 }
 
-static void oc_setreg_io_8(struct ocores_i2c *i2c, int reg, u8 value)
-{
-	outb(value, i2c->iobase + reg);
-}
-
-static inline u8 oc_getreg_io_8(struct ocores_i2c *i2c, int reg)
-{
-	return inb(i2c->iobase + reg);
-}
-
 static inline void oc_setreg(struct ocores_i2c *i2c, int reg, u8 value)
 {
 	i2c->setreg(i2c, reg, value);
@@ -618,15 +607,19 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 		res = platform_get_resource(pdev, IORESOURCE_IO, 0);
 		if (!res)
 			return -EINVAL;
-		i2c->iobase = res->start;
 		if (!devm_request_region(&pdev->dev, res->start,
 					 resource_size(res),
 					 pdev->name)) {
 			dev_err(&pdev->dev, "Can't get I/O resource.\n");
 			return -EBUSY;
 		}
-		i2c->setreg = oc_setreg_io_8;
-		i2c->getreg = oc_getreg_io_8;
+		i2c->base = devm_ioport_map(&pdev->dev, res->start,
+					    resource_size(res));
+		if (!i2c->base) {
+			dev_err(&pdev->dev, "Can't map I/O resource.\n");
+			return -EBUSY;
+		}
+		i2c->reg_io_width = 1;
 	}
 
 	pdata = dev_get_platdata(&pdev->dev);
-- 
2.39.2


