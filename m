Return-Path: <linux-i2c+bounces-10260-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD39A85B7E
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 13:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C1C5160DE5
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 11:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F9F298CBE;
	Fri, 11 Apr 2025 11:23:08 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E758D27BF82;
	Fri, 11 Apr 2025 11:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370588; cv=none; b=NISdDc6Omjmgem7C69e9RxmnYmlUwWCPIyumGFIpR3ofgYJelsjOdPBeQ8mkrVMX/TNED5HP4W8aYQRwFHReux2CpYPNXGWthED3igyVL+00niXTfXt+514XYUfbC2TRwrhYxvEqVyZJuvKlIY3qCy3R34I0qyk3FuaZR1oDw/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370588; c=relaxed/simple;
	bh=JPqWn5zSZ2P34Z5dMgc400dC1XwDpykcXnA7Qi26IZA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tJ+bGrVcW/geo7qrozwZ05S9rZP6jJPc+xckmnElDPl+bRWU2Mvw3fpyfW2ipxzlyVjXv6n0MTBDVtIGt1iS2v7RshUasdmbwH8ZIjEKoEGiL6NszrNHM9/qUuEvPBB22QjJA+1c/X8KsbQAck5fSQMdbt5jVVTZfCyKYBludjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 002BF106F;
	Fri, 11 Apr 2025 04:23:06 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 619213F694;
	Fri, 11 Apr 2025 04:23:05 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: xgene-slimpro: Simplify PCC shared memory region handling
Date: Fri, 11 Apr 2025 12:23:03 +0100
Message-Id: <20250411112303.1149086-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCC driver now handles mapping and unmapping of shared memory
areas as part of pcc_mbox_{request,free}_channel(). Without these before,
this xgene-slimpro I2C driver did handling of those mappings like several
other PCC mailbox client drivers.

There were redundant operations, leading to unnecessary code. Maintaining
the consistency across these driver was harder due to scattered handling
of shmem.

Just use the mapped shmem and remove all redundant operations from this
driver.

Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/i2c/busses/i2c-xgene-slimpro.c | 39 +++-----------------------
 1 file changed, 4 insertions(+), 35 deletions(-)

Hi,

This is just resend of the same patch that was part of a series [1].
Only core PCC mailbox changes were merged during v6.15 merge window.
So dropping all the maintainer(Andi) acks and reposting it so that it can
be picked up for v6.16 via maintainers tree.

Regards,
Sudeep

[1] https://lore.kernel.org/all/20250313-pcc_fixes_updates-v3-10-019a4aa74d0f@arm.com/

diff --git a/drivers/i2c/busses/i2c-xgene-slimpro.c b/drivers/i2c/busses/i2c-xgene-slimpro.c
index 663fe5604dd6..a0880f4a056d 100644
--- a/drivers/i2c/busses/i2c-xgene-slimpro.c
+++ b/drivers/i2c/busses/i2c-xgene-slimpro.c
@@ -101,8 +101,6 @@ struct slimpro_i2c_dev {
 	struct completion rd_complete;
 	u8 dma_buffer[I2C_SMBUS_BLOCK_MAX + 1]; /* dma_buffer[0] is used for length */
 	u32 *resp_msg;
-	phys_addr_t comm_base_addr;
-	void *pcc_comm_addr;
 };
 
 #define to_slimpro_i2c_dev(cl)	\
@@ -148,7 +146,8 @@ static void slimpro_i2c_rx_cb(struct mbox_client *cl, void *mssg)
 static void slimpro_i2c_pcc_rx_cb(struct mbox_client *cl, void *msg)
 {
 	struct slimpro_i2c_dev *ctx = to_slimpro_i2c_dev(cl);
-	struct acpi_pcct_shared_memory *generic_comm_base = ctx->pcc_comm_addr;
+	struct acpi_pcct_shared_memory __iomem *generic_comm_base =
+							ctx->pcc_chan->shmem;
 
 	/* Check if platform sends interrupt */
 	if (!xgene_word_tst_and_clr(&generic_comm_base->status,
@@ -169,7 +168,8 @@ static void slimpro_i2c_pcc_rx_cb(struct mbox_client *cl, void *msg)
 
 static void slimpro_i2c_pcc_tx_prepare(struct slimpro_i2c_dev *ctx, u32 *msg)
 {
-	struct acpi_pcct_shared_memory *generic_comm_base = ctx->pcc_comm_addr;
+	struct acpi_pcct_shared_memory __iomem *generic_comm_base =
+							ctx->pcc_chan->shmem;
 	u32 *ptr = (void *)(generic_comm_base + 1);
 	u16 status;
 	int i;
@@ -464,15 +464,12 @@ static int xgene_slimpro_i2c_probe(struct platform_device *pdev)
 	} else {
 		struct pcc_mbox_chan *pcc_chan;
 		const struct acpi_device_id *acpi_id;
-		int version = XGENE_SLIMPRO_I2C_V1;
 
 		acpi_id = acpi_match_device(pdev->dev.driver->acpi_match_table,
 					    &pdev->dev);
 		if (!acpi_id)
 			return -EINVAL;
 
-		version = (int)acpi_id->driver_data;
-
 		if (device_property_read_u32(&pdev->dev, "pcc-channel",
 					     &ctx->mbox_idx))
 			ctx->mbox_idx = MAILBOX_I2C_INDEX;
@@ -494,34 +491,6 @@ static int xgene_slimpro_i2c_probe(struct platform_device *pdev)
 			goto mbox_err;
 		}
 
-		/*
-		 * This is the shared communication region
-		 * for the OS and Platform to communicate over.
-		 */
-		ctx->comm_base_addr = pcc_chan->shmem_base_addr;
-		if (ctx->comm_base_addr) {
-			if (version == XGENE_SLIMPRO_I2C_V2)
-				ctx->pcc_comm_addr = memremap(
-							ctx->comm_base_addr,
-							pcc_chan->shmem_size,
-							MEMREMAP_WT);
-			else
-				ctx->pcc_comm_addr = memremap(
-							ctx->comm_base_addr,
-							pcc_chan->shmem_size,
-							MEMREMAP_WB);
-		} else {
-			dev_err(&pdev->dev, "Failed to get PCC comm region\n");
-			rc = -ENOENT;
-			goto mbox_err;
-		}
-
-		if (!ctx->pcc_comm_addr) {
-			dev_err(&pdev->dev,
-				"Failed to ioremap PCC comm region\n");
-			rc = -ENOMEM;
-			goto mbox_err;
-		}
 	}
 	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
 	if (rc)
-- 
2.34.1


