Return-Path: <linux-i2c+bounces-9533-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B88E5A408BF
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2025 14:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA1BD70139A
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2025 13:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0117E13B58B;
	Sat, 22 Feb 2025 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nC6VFvdj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1A18635C;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740231522; cv=none; b=hXEcsd5NCumRcmMtCRGuLvZM2clrzKsjIO++c83UN0JPfrlUL2FkadWpmcagd15vClH5iFGc3rCY1U4TbeChT2dWOFY2zpsKGFoibT9eLejefPWyPykdjI2UrGl/EM1lM0tQfpqE7Nz/vUUp0WvY0eInNMJKSBJKQOOQwLku7JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740231522; c=relaxed/simple;
	bh=8Zkxgch9g5+DTeW63q//4eNTvjzsWBLujizGZ2Rb/XA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c26XuzLkBA8/9EYNE7ULajxigN27a9fTyjDUPQ+yfMsiCMS6qF5AIfGNfkYlYbkGLEeK6wMG8NeRjX/raceYxIeF19eQPqUTf4cQcDAxx7ZWIdg2YaT2O4YgegpNL6LTWOtJf4XRNKZXI78M+jfQ9bjiIjddc9Vi0ZlocMGfA2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nC6VFvdj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F325C4CEEC;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740231522;
	bh=8Zkxgch9g5+DTeW63q//4eNTvjzsWBLujizGZ2Rb/XA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nC6VFvdjzBsZDWH5RX70Kx6s9SAooZ8ghZyHjSSeXQPwlCjS5qFhlH+WnzNANaYf6
	 26OHYklHnhoasCg2j2Xx4DwkpoQ4kRotv7CQN0HcWZlH/uW+sBDpPha0+8nQAq5V2X
	 RXy6gk8iE0C66rvbffgrw0PaKw0/NJXk5og/r2Zfx7c7JYCy4mpXOz13sP0J23+5sT
	 SjGYQolx0YS0O61HXeHM/9FKywwA+0L4fY4V5MaV7YzoTNxc77PoXffOUcznP+T5PS
	 goPAwG3EU+EHSPGsqBz0ghfJqPn3OsxAm7n0kfTOlFpDL1QDtA97eP3lgyj37g7N/u
	 bC5UMNCWiD2hA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74951C021B8;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 22 Feb 2025 13:38:36 +0000
Subject: [PATCH 4/4] i2c: pasemi: Log bus reset causes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-pasemi-fixes-v1-4-d7ea33d50c5e@svenpeter.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=Jxw9FakomFtq1Asfv39ujqR2viJkk3GlzvSkFwhw82g=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/rOy/G9bPs878o/+CTRkbdfmm/Lhezdx5g13m4KbKiT/
 8G38L5BRykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiGxQZ/qnyVAicXbnM/M1T
 hl+P9OxCS5f+WvFccDXf9t2Pfm+YK5DG8D+rcuO/gvTpxdKxP2UqBZRYb+95m3Jgi/zta3tq3zI
 JZbIAAA==
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev

From: Hector Martin <marcan@marcan.st>

This ensures we get all information we need to debug issues when users
forward us their logs.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 8f0ba975172f..ae0181a76470 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -21,6 +21,7 @@
 /* Register offsets */
 #define REG_MTXFIFO	0x00
 #define REG_MRXFIFO	0x04
+#define REG_XFSTA	0x0c
 #define REG_SMSTA	0x14
 #define REG_IMASK	0x18
 #define REG_CTL		0x1c
@@ -84,7 +85,7 @@ static void pasemi_reset(struct pasemi_smbus *smbus)
 
 static int pasemi_smb_clear(struct pasemi_smbus *smbus)
 {
-	unsigned int status;
+	unsigned int status, xfstatus;
 	int timeout = TRANSFER_TIMEOUT_MS;
 
 	status = reg_read(smbus, REG_SMSTA);
@@ -95,15 +96,21 @@ static int pasemi_smb_clear(struct pasemi_smbus *smbus)
 		status = reg_read(smbus, REG_SMSTA);
 	}
 
+	xfstatus = reg_read(smbus, REG_XFSTA);
+
 	if (timeout < 0) {
-		dev_warn(smbus->dev, "Bus is still stuck (status 0x%08x)\n", status);
+		dev_warn(smbus->dev, "Bus is still stuck (status 0x%08x xfstatus 0x%08x)\n",
+			 status, xfstatus);
 		return -EIO;
 	}
 
 	/* If any badness happened or there is data in the FIFOs, reset the FIFOs */
 	if ((status & (SMSTA_MRNE | SMSTA_JMD | SMSTA_MTO | SMSTA_TOM | SMSTA_MTN | SMSTA_MTA)) ||
-		!(status & SMSTA_MTE))
+		!(status & SMSTA_MTE)) {
+		dev_warn(smbus->dev, "Issuing reset due to status 0x%08x (xfstatus 0x%08x)\n",
+			 status, xfstatus);
 		pasemi_reset(smbus);
+	}
 
 	/* Clear the flags */
 	reg_write(smbus, REG_SMSTA, status);

-- 
2.34.1



