Return-Path: <linux-i2c+bounces-9722-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D51DA4E951
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 18:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1B6C8C58BC
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 17:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B204D2620DC;
	Tue,  4 Mar 2025 16:48:36 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3682620DE
	for <linux-i2c@vger.kernel.org>; Tue,  4 Mar 2025 16:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106916; cv=pass; b=e2dUQWwqPPye6QOk7ZxWXilpYc0ZrTN7XaJ1ifZxGNr2ePq3WXghV1AGsbBMkYa54d733z+rUnB0m0MsWCbjPO0qlG+YE8C7VJy65r06g7JGQT/LrneMqj4/9MTgbMkM+YCkEb0YAj031t+wOvW88a0o67aaHFvFBKurjrbBgFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106916; c=relaxed/simple;
	bh=MfSTY+8Javma4iMKIMRIP5AOm3S32ksYO4b7JbopmcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G7AkFdaPLWc9q/umkIs2R5N1YDh1atlzlMKmOxxGSrIngHsDIk1Qnp/6L0unHhB9F/ovd9uu6Piy4J4Ya5VpLtW98YuZc5UaXAfCgLuslebVb+KCMlM2Cemrw4f5XeW85JzUQdBpuyb+8JwaBNRSZQP0Rz9YACOAc51sUPU0UmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=cc.itu.edu.tr; arc=none smtp.client-ip=217.140.110.172; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=pass smtp.client-ip=160.75.25.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (unknown [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id 118CB4089532
	for <linux-i2c@vger.kernel.org>; Tue,  4 Mar 2025 19:48:33 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6hQx33J8zG4D4
	for <linux-i2c@vger.kernel.org>; Tue,  4 Mar 2025 19:46:33 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 026E642735; Tue,  4 Mar 2025 19:46:29 +0300 (+03)
X-Envelope-From: <linux-kernel+bounces-541452-bozkiru=itu.edu.tr@vger.kernel.org>
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
	by le2 (Postfix) with ESMTP id F12BF41B28
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:57:32 +0300 (+03)
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by fgw2.itu.edu.tr (Postfix) with SMTP id A59C52DCDE
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:57:32 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BB2C1731C1
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 10:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA5B1F942D;
	Mon,  3 Mar 2025 10:53:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346E01F875B;
	Mon,  3 Mar 2025 10:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740999221; cv=none; b=nJ0DldH+Er4DnwywR1QZQFQg3NeFcT2ust0M2aSiHXAGEkYPUIGZY111AuKePvW9NTEztoGYwsvRBJm/rGjT7mscDAYqo7IT9ToCtdm9lPhNxGU81VYdOlT5vr7reUJYHJ/uHDprOSPlWVBy+EkuUMvinQ9u/FND92hwvgGQVLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740999221; c=relaxed/simple;
	bh=MfSTY+8Javma4iMKIMRIP5AOm3S32ksYO4b7JbopmcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nj31qmXKISMpI7migibu2U0Ct3Wf5XKbreLzDRDw0v4RI6MWCyCiexUmya0LItvac2zLovhDMMmUKL1thynFe3Ty8pXHd13jt9q9jlnDBClLDSDp4NBqr64pjvB9lRWeGHXXsGbF0bmwK/Pvf5+D/5aGY43OD10xva92htvNMGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F20D62008;
	Mon,  3 Mar 2025 02:53:53 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8ECEC3F673;
	Mon,  3 Mar 2025 02:53:38 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 03 Mar 2025 10:51:46 +0000
Subject: [PATCH 11/14] i2c: xgene-slimpro: Simplify PCC shared memory
 region handling
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-pcc_fixes_updates-v1-11-3b44f3d134b1@arm.com>
References: <20250303-pcc_fixes_updates-v1-0-3b44f3d134b1@arm.com>
In-Reply-To: <20250303-pcc_fixes_updates-v1-0-3b44f3d134b1@arm.com>
To: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Huisong Li <lihuisong@huawei.com>, 
 Adam Young <admiyo@os.amperecomputing.com>, 
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3735; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=MfSTY+8Javma4iMKIMRIP5AOm3S32ksYO4b7JbopmcE=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnxYoi2nHgqkxUHTt758cixVVE8QA/rlgDBWi/d
 T7INXNU0HuJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ8WKIgAKCRAAQbq8MX7i
 mB+GEAC3iW/TRhSK3y8Krc/xktnm/Hfa1Tc/bl2PMFdgfLqbDRKR6bXC0V7m3HMXalYHqOsa0qT
 rMvYPKrdrUxTCeJyO0WIlrpRSsGLZ/GKgNWtWni1zVNoY1jrh6LjofUFMcmDYTVOPSdIA+Ykv3j
 Hkb/3MFb2TM+IuKjy8bcZBqJ0ER6a7K/so90OFPwZL7ju65vVLA0uAdA/2eioym+K/jG0B3fxaJ
 SO+f7mFRQSI9ys7zJo66abPTWDJ+F/ZEncQBzOs00asQdJWLNSAuMPJp292BnCxF5R0uWygi7DH
 2YBo+7y9tBFPr20XN0l4w9nrgS9YrekrB15Aws82VWGexu2DP5UhBItQTM16hRpDd1+v69vjgZ+
 n4l19dI9fGiIvGZ2/vXvrIU1/2jvoI4JR40Pd7JhcTEjmJTCbJD5lz2eBs/UKulnpOALUk/2f+u
 kXRkaIm2BvKMioRRzmd+j60OEyTekpt6TsuowOGZ4bxjxvNFo/0eLkIoiHqdlbbRA+Sy6dsBUhd
 vsGEXBf7vFJSCOhGFFazsJQlAkiIdRMMrnlZnF6vBz4x7X2pW8Dp34kQjduCQ/Mw05T0UoQWeTJ
 jvpVOV87Rk9KlAMlSzQW51wTUkSeuJngr9PSyhaOzkHlGFtC3RgcpsO6Rj0eDTBAslWJlAhMeaj
 NWURpMEQxip2LSg==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6hQx33J8zG4D4
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741711603.94474@rIl0L+/0jsZygj1DOsnJsg
X-ITU-MailScanner-SpamCheck: not spam

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



