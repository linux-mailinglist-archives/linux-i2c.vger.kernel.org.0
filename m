Return-Path: <linux-i2c+bounces-9532-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B914DA408C0
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2025 14:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14E7818961C9
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2025 13:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B1513AA20;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjRifRoV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C57F7DA93;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740231522; cv=none; b=rDffAUYcYZegCzQapYbVeQQQFmWGagBL3tCj2ju8KhNgIhDLokH1bcwO5p9dHu8w8bYFhsITiE1DE72UZmeeykXJXiBPJvAlrK3CI5Mmu+4/wrjDalcD3U9qQLbRk2n+K8vnaU99DZf2tXmEDCcIPwHHABUsv5MbMoYyM/lmrAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740231522; c=relaxed/simple;
	bh=yyBin1h0CvRmrVfUw16qTKb6+CAFkoi2GN8BdSp/Ys8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IOhpP3SUFHcxjA/4yU7VXBYfekvwQ8WJYlyJO51ug0XuKcIkEgm79HszAL+YelKlkccUV7G1WtTRx+2oamd+YObaV8520yjitQzBQsfl7rNzO8tJwxci4vXMc1kyKeeRGg/fwt2L10uGWtnhwq+rFekXLyB9BMFhWIvLeoaoF5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjRifRoV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52C26C4CEE6;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740231522;
	bh=yyBin1h0CvRmrVfUw16qTKb6+CAFkoi2GN8BdSp/Ys8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VjRifRoVnEdkqsIkzS09ngJyZvwcXIhzH8fD8rpVNqvwfgo+/OAFnvqAIobNA7Lzc
	 dOjmyZYGlVO6Ose1Q/bpG7kM0bSZwWuY7WKdKCEUVutmqzbxmsiaRxzs0q7wnN6iRw
	 yLnbdQ4QSOqmf0TkuLPcDbx8LJWhkNux6am4+UggTR4VOK67gyBGTKc7MRwP1zElgT
	 gohHB+4lSJHlDabiStl/6aSAm/bdEcwYnSwtseqKloM5FfYW+CVUmPXwaqA06s3Ktr
	 pDKuL+jdnErsTjrfnwOa++w77PJw7j1VlLt524UGxtgO1nM9dUXUE9d9EE2y2eWkAf
	 JxWVvmBlLy86A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41204C021B8;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 22 Feb 2025 13:38:33 +0000
Subject: [PATCH 1/4] i2c: pasemi: Add registers bits and switch to BIT()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-pasemi-fixes-v1-1-d7ea33d50c5e@svenpeter.dev>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
In-Reply-To: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2037; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=iPv0XjpNaU2PSc1JHoHKcgCr0CRP3yf1b4EAPEcXwng=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/rOy9ESFaHHtpUbMr91cTRekSrY3mPm4vwl4djZsz+Kw
 0rCA+o7SlkYxDgYZMUUWbbvtzd98vCN4NJNl97DzGFlAhnCwMUpABPpSWZk+Okau99t7x9PDrd7
 Bewzl0+r1NyzLGjKtR6F2u6Y5ZpbHzIyzBb9undnbnzudPf6usJzQa0X5xRkCsf4CkWc3b3xodM
 7JgA=
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev

From: Sven Peter <sven@svenpeter.dev>

Add the missing register bits to the defines and also switch
those to use the BIT macro which is much more readable than
using hardcoded masks

Co-developed-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 40 ++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index dac694a9d781..bd128ab2e2eb 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -5,6 +5,7 @@
  * SMBus host driver for PA Semi PWRficient
  */
 
+#include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/kernel.h>
@@ -26,21 +27,30 @@
 #define REG_REV		0x28
 
 /* Register defs */
-#define MTXFIFO_READ	0x00000400
-#define MTXFIFO_STOP	0x00000200
-#define MTXFIFO_START	0x00000100
-#define MTXFIFO_DATA_M	0x000000ff
-
-#define MRXFIFO_EMPTY	0x00000100
-#define MRXFIFO_DATA_M	0x000000ff
-
-#define SMSTA_XEN	0x08000000
-#define SMSTA_MTN	0x00200000
-
-#define CTL_MRR		0x00000400
-#define CTL_MTR		0x00000200
-#define CTL_EN		0x00000800
-#define CTL_CLK_M	0x000000ff
+#define MTXFIFO_READ	BIT(10)
+#define MTXFIFO_STOP	BIT(9)
+#define MTXFIFO_START	BIT(8)
+#define MTXFIFO_DATA_M	GENMASK(7, 0)
+
+#define MRXFIFO_EMPTY	BIT(8)
+#define MRXFIFO_DATA_M	GENMASK(7, 0)
+
+#define SMSTA_XIP	BIT(28)
+#define SMSTA_XEN	BIT(27)
+#define SMSTA_JMD	BIT(25)
+#define SMSTA_JAM	BIT(24)
+#define SMSTA_MTO	BIT(23)
+#define SMSTA_MTA	BIT(22)
+#define SMSTA_MTN	BIT(21)
+#define SMSTA_MRNE	BIT(19)
+#define SMSTA_MTE	BIT(16)
+#define SMSTA_TOM	BIT(6)
+
+#define CTL_EN		BIT(11)
+#define CTL_MRR		BIT(10)
+#define CTL_MTR		BIT(9)
+#define CTL_UJM		BIT(8)
+#define CTL_CLK_M	GENMASK(7, 0)
 
 static inline void reg_write(struct pasemi_smbus *smbus, int reg, int val)
 {

-- 
2.34.1



