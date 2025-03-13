Return-Path: <linux-i2c+bounces-9830-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBCAA5F9F2
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 16:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1F78420D25
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 15:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA8C26A0FF;
	Thu, 13 Mar 2025 15:29:28 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFD626A0C7;
	Thu, 13 Mar 2025 15:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741879768; cv=none; b=JuoJ/t2tVgfAJYs8wDDjYY5NXS2pN0vjpK86MB2b0R25bFB9T7eb9lXHLp3fIUSqKZjOx8i3oFDCZa9UtB8UyBHjYqUuF3mSaJxKXpZdbn2aBnz0P6yf+n4H8vf1Hf6GoZSR6+yr52FRMKQxE/baNOSErTRF5JTEQKffz6K9XRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741879768; c=relaxed/simple;
	bh=MfSTY+8Javma4iMKIMRIP5AOm3S32ksYO4b7JbopmcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gryJjGWJOgyefA9oF3uzbr6imU3Q7+Sj8EHSIjQt+HEuKYrcgjfyMdQsEUAgHsDnpeeCg1t3Ch96uzmXMm89qvKlg7p9Q9LPj9DtdwmsoJtdThulWMLnW0TcqU+/JKPNThZY5E78xnPKUvYFhqtYT0dzTQX5EYaiwvleT/ozFpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9E8D1F91;
	Thu, 13 Mar 2025 08:29:36 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CCFA3F694;
	Thu, 13 Mar 2025 08:29:24 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Thu, 13 Mar 2025 15:28:56 +0000
Subject: [PATCH v3 10/13] i2c: xgene-slimpro: Simplify PCC shared memory
 region handling
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-pcc_fixes_updates-v3-10-019a4aa74d0f@arm.com>
References: <20250313-pcc_fixes_updates-v3-0-019a4aa74d0f@arm.com>
In-Reply-To: <20250313-pcc_fixes_updates-v3-0-019a4aa74d0f@arm.com>
To: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Huisong Li <lihuisong@huawei.com>, 
 Adam Young <admiyo@os.amperecomputing.com>, 
 Robbie King <robbiek@xsightlabs.com>, Andi Shyti <andi.shyti@kernel.org>, 
 linux-i2c@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3735; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=MfSTY+8Javma4iMKIMRIP5AOm3S32ksYO4b7JbopmcE=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn0vnECAkFm0g4ggECz10cy8pN/4x3dJjvyoS7c
 BFd5gCqqs2JAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9L5xAAKCRAAQbq8MX7i
 mFhoEADJhHjPfVYHP9j+YNYHDWqa0U5K8kY635HEcqa4mvxMeAnBw/ydgkzg4z1Cwva4cXyzzBM
 23yiRRTCageAHMmCDBkSv+x9zkhWf8+nh4uO/CqLvSgZ3tBIu2b2IdxwB8vTHrzmF3T+VgE4l0g
 cM34CUpZIdfl0pzLa11fA3OYNraMLmBJbXjm60NMLdt72pXElQXNGAedPvwWw5hldDkJKDwVq8u
 8RRZc9s+KIryyFp3D8oP4IB3u7I2xTltQarhynLNwrbGEPQarP86KXE4esmWCSS9m3ARATTfce1
 45pjxzX3O8cQH7SKi5PUNW76kQPlrJkdqxE0ywwDPaW0zVW3i4NAZbOKgXIA/DLzyo0UDcbcltH
 OvprmFjfF+UGCauYnkdhU4oOp1WnDwwEsrLX596CS5Y5umOIWPaLZkVGOxX9uVSL/7HLaHeO+hg
 e/fOQA8eXJXaSAHEyABHOesdontefLkjeCUscxgjfuXSnmn1uV7HtjW7ZmManoDvEssZSNMDQjY
 MG21LXdkYS2anzppHcwYedtZeHOhX+kQb2FQ7mrytqVZWPFRrFFi5n+BCV/APUl9KzgAR6BLt/b
 sGv91/0T1XR1QCmvDm9MqD8nNe4os7TurEMF7sWjq0RiP22G+yCmhTz9Erzt5viMdFbpE1K4rSh
 pJJCQl/GV38e1Kg==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

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
 drivers/i2c/busses/i2c-xgene-slimpro.c | 39 ++++------------------------------
 1 file changed, 4 insertions(+), 35 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xgene-slimpro.c b/drivers/i2c/busses/i2c-xgene-slimpro.c
index 663fe5604dd64b80e57f906e1f7430dcf6d5e95b..a0880f4a056d2b8abbac9f58416215a7fc9b130e 100644
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


