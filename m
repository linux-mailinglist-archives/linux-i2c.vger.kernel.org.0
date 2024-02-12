Return-Path: <linux-i2c+bounces-1686-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC19851206
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Feb 2024 12:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0187EB21779
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Feb 2024 11:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6D438DE1;
	Mon, 12 Feb 2024 11:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRmTs1vE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AC32BAE7;
	Mon, 12 Feb 2024 11:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707736784; cv=none; b=U3hL1es0tlx+jz6IctTkiDsFCOkbJ5RJdDNZ3KRiUb2hGDoWO/qXogK3mTxkHjLB8+D58SGyUrwYMhh90GTKt0a5bJOsrIjtkuHu6e3DqTIJ60XQsYcRSK6JETLawoTfo4b9GH8l90CjRYfhxHwyr+/mPAMFwnopWVfmCDLnEP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707736784; c=relaxed/simple;
	bh=tWF0UWclQ/NoslADhYsN71fCn5aAl9tVNo99KfKidvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bf5KbAb2fdmjTjhZ3sO5X32P5YPNqIYEUDvj3wBqwzNj2LVaIWyhtYuSaSGG26AHTYLU+EvSp4xKUVV1CmbS9vD27zh1pQwOzKnLpO6tdZZniy8l3XJuJhN9NHpLaZRyuGP8vdkqymtGTmewcahhIY0FFxuePcKhgI0HECzb//g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRmTs1vE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C47C0C433F1;
	Mon, 12 Feb 2024 11:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707736783;
	bh=tWF0UWclQ/NoslADhYsN71fCn5aAl9tVNo99KfKidvQ=;
	h=From:To:Cc:Subject:Date:From;
	b=mRmTs1vEJdlljNDjvZu6R0W1Wa3NOZ9ZwI+XspkWtO+1QTAq4wj8UV8GJc1smFBwC
	 6zFi06tclH1qtjP7G/h89Xp6dniA/CXx+GsnKK8j5FDWhE3V4RnWZZpgZxfd/GlRxO
	 Xn54RVt6jB1K6X6QjY6FbdGwZttElmLriRplpPnGA3lSELh7hY20UixxevaX6a0ZYJ
	 nRQ5phyfdHevnCJ5/Z4ZeOurZQvDyjmQx6a9+xLelK2evbl0q6yvhz/2RRg9xvGNdA
	 rzPQkXOdw7OTOJqguy5CtpdyJ4T8fnKDpA1jOmMti3FbZ4uGlAOW0bslU+JYSe31UL
	 BvwkwaAtXCRRA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Wolfram Sang <wsa@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] i2c: pasemi: split driver into two separate modules
Date: Mon, 12 Feb 2024 12:19:04 +0100
Message-Id: <20240212111933.963985-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On powerpc, it is possible to compile test both the new apple (arm) and
old pasemi (powerpc) drivers for the i2c hardware at the same time,
which leads to a warning about linking the same object file twice:

scripts/Makefile.build:244: drivers/i2c/busses/Makefile: i2c-pasemi-core.o is added to multiple modules: i2c-apple i2c-pasemi

Rework the driver to have an explicit helper module, letting Kbuild
take care of whether this should be built-in or a loadable driver.

Fixes: 9bc5f4f660ff ("i2c: pasemi: Split pci driver to its own file")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/i2c/busses/Makefile          | 6 ++----
 drivers/i2c/busses/i2c-pasemi-core.c | 6 ++++++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 3757b9391e60..aa0ee8ecd6f2 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -90,10 +90,8 @@ obj-$(CONFIG_I2C_NPCM)		+= i2c-npcm7xx.o
 obj-$(CONFIG_I2C_OCORES)	+= i2c-ocores.o
 obj-$(CONFIG_I2C_OMAP)		+= i2c-omap.o
 obj-$(CONFIG_I2C_OWL)		+= i2c-owl.o
-i2c-pasemi-objs := i2c-pasemi-core.o i2c-pasemi-pci.o
-obj-$(CONFIG_I2C_PASEMI)	+= i2c-pasemi.o
-i2c-apple-objs := i2c-pasemi-core.o i2c-pasemi-platform.o
-obj-$(CONFIG_I2C_APPLE)	+= i2c-apple.o
+obj-$(CONFIG_I2C_PASEMI)	+= i2c-pasemi-core.o i2c-pasemi-pci.o
+obj-$(CONFIG_I2C_APPLE)		+= i2c-pasemi-core.o i2c-pasemi-platform.o
 obj-$(CONFIG_I2C_PCA_PLATFORM)	+= i2c-pca-platform.o
 obj-$(CONFIG_I2C_PNX)		+= i2c-pnx.o
 obj-$(CONFIG_I2C_PXA)		+= i2c-pxa.o
diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 7d54a9f34c74..bd8becbdeeb2 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -369,6 +369,7 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pasemi_i2c_common_probe);
 
 irqreturn_t pasemi_irq_handler(int irq, void *dev_id)
 {
@@ -378,3 +379,8 @@ irqreturn_t pasemi_irq_handler(int irq, void *dev_id)
 	complete(&smbus->irq_completion);
 	return IRQ_HANDLED;
 }
+EXPORT_SYMBOL_GPL(pasemi_irq_handler);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Olof Johansson <olof@lixom.net>");
+MODULE_DESCRIPTION("PA Semi PWRficient SMBus driver");
-- 
2.39.2


