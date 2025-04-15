Return-Path: <linux-i2c+bounces-10355-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B30F4A8A2EE
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 17:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B7241901E86
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 15:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3E829DB71;
	Tue, 15 Apr 2025 15:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBdxMbZs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2CE2973A0;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731437; cv=none; b=TLGGEXE64Nu736UTXaK4s36f9aTeqbx6zZKODuntjR6s8632HLjmDyiSMulIaxMQSAnIR6OF99dAypApFDk0pEew0Pv4loCNDeu6hDCuCezSA3WGVEYqUVFbYM72eub5bn8qsAlE4MNBpy1HEEwa4UeFveuyyE+vhFfda5H81yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731437; c=relaxed/simple;
	bh=F6ydi+3Kh9gLpG3MhIJVGmiYu4P4h2LRSPQzIzRGasg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HPv1xWERjuRNT/IDA7Nx6t8adW1xmFKg6zd77ueVXCUKpOlqE0tU/s0h5vfquVT80Uk1C7W/u9gE/NE2jsKRrUdVISsSsJzfU8DlOdMYcpmLN5REr4cwCJ6xHSAI+M7RQCvY6DbhkqlIB9kvPiNDDzD6HxjN6mmeqc+IpHbjNuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBdxMbZs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 541E0C4CEF1;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731437;
	bh=F6ydi+3Kh9gLpG3MhIJVGmiYu4P4h2LRSPQzIzRGasg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nBdxMbZseuEol55Y1Ny/cpNeEYq7uiD50JIs/gwKO1Foa2wPiCEWrc90lL1haY55m
	 1U/Avo4ZIeTMGB3B0hc8RtHCP+fUz1bh2A2nXzqENOb+2WfvRXprDXBqeNLCoJuZLD
	 zEBzma6f58T7jbVHsEsmRO/7k15L34RmCdGfwwtOcxHX2/PGwMxk0Rl2AUyFdDAssB
	 m1CvNeYIsiA8Aek7Vq8uG2im5lz8Ku3au63TEM2C6vbDxZy5V1Zeq34gNfiIOXXi7b
	 +Ckbnl3Dd3I78yvbAcdPdFDJ24wap6NTAymjMZa8wXc2v/uNtLmmcjAZd5/3bavVVv
	 hOwn1ihr8SoqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457E4C369BA;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Tue, 15 Apr 2025 15:36:57 +0000
Subject: [PATCH v2 3/6] i2c: pasemi: Improve timeout handling
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-pasemi-fixes-v2-3-c543bf53151a@svenpeter.dev>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
In-Reply-To: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2138; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=pieYM48LE5ENsb4OlGmWM38fJJzel5K/67CDk0KItDE=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/q/WvWKcJ/Ij8b3P05fYM58StKf7c2kj6UO6rKVr2u/R
 bN/jY3vKGVhEONgkBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAExk7yWG/w5Skwunb99z8fBu
 o7eC/youx5b+YzCc+W/XoprbuSEdnPcZGU4/lzac0t5wuYzjwwGL5tcNvtVFW7/VPLu1Y0rwgYr
 9DAwA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev

From: Sven Peter <sven@svenpeter.dev>

Add proper timeout handling for the interrupt path.
Previously, this was only correctly done for the polling path.
Note that we drop reg_write(smbus, REG_SMSTA, status) here which
will be done anyway whenever the next transaction starts via
pasemi_smb_clear.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index df1b0087dcacb0a3b94196368137d5e20b0e6d7e..9b611dbdfef23e78a4ea75ac0311938d52b6ba96 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -91,32 +91,42 @@ static void pasemi_smb_clear(struct pasemi_smbus *smbus)
 static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
 {
 	int timeout = 100;
+	int ret;
 	unsigned int status;
 
 	if (smbus->use_irq) {
 		reinit_completion(&smbus->irq_completion);
 		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
-		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
+		ret = wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
 		reg_write(smbus, REG_IMASK, 0);
 		status = reg_read(smbus, REG_SMSTA);
+
+		if (ret < 0) {
+			dev_err(smbus->dev,
+				"Completion wait failed with %d, status 0x%08x\n",
+				ret, status);
+			return ret;
+		} else if (ret == 0) {
+			dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
+			return -ETIME;
+		}
 	} else {
 		status = reg_read(smbus, REG_SMSTA);
 		while (!(status & SMSTA_XEN) && timeout--) {
 			msleep(1);
 			status = reg_read(smbus, REG_SMSTA);
 		}
+
+		if (timeout < 0) {
+			dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
+			return -ETIME;
+		}
 	}
 
 	/* Got NACK? */
 	if (status & SMSTA_MTN)
 		return -ENXIO;
 
-	if (timeout < 0) {
-		dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
-		reg_write(smbus, REG_SMSTA, status);
-		return -ETIME;
-	}
-
 	/* Clear XEN */
 	reg_write(smbus, REG_SMSTA, SMSTA_XEN);
 

-- 
2.34.1



