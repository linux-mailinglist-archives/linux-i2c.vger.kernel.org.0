Return-Path: <linux-i2c+bounces-2520-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BF0886D29
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EC73289D05
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127BA61672;
	Fri, 22 Mar 2024 13:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mcEMV1/Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EE460EF8
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114027; cv=none; b=PyMe+M+C9wRRVEWJy1hQWg7NnB5pt6Rxxp2WpUC2olKtgdWc3Tu1o+vA0LI6hZXf+T7sx5OShrJldbPU9V9UgXjjSfqtKPB59fdPukicJiSTstw1AKFaZETWE309mp8of36IT0O3SF+b/bpfhqGlAf61g+eYrLsVpI2NImJyBhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114027; c=relaxed/simple;
	bh=w0h843T81O+CzW4YGtWlq/y3kUMxeT1ZLaogKPRPBYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sSMHKpAUVC5ZReMulyIgCSpgwGgQ/rbx8vodqKbPMR+RkBSNmEygRm+i6d5Q2qK8BE/jer3lfWAIwzxYvKXDgsWkizdM9XA2i9xvk1glJC41vJW1vuWJq7QbFZczCkMPgKDDz5qNEiBjreAN7iMDI9LXHeMjVH9yD1Y2MQoklZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mcEMV1/Q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=pVA6WDf6g9/z8AGBcr1q1z0H9ceUAD/J3z3hoNEhDL4=; b=mcEMV1
	/QvfbwmXZCuOmcBG+YtKHi2v2j8xLgFoFDWW4naekAG8tUAkxvHcrotg5HgWkBcY
	4uTnmOnfpIh+MKA+o7PntGhAAgbmbDm2dRb/xfMR+1uRuxLuIxnITDIzTg+cGnc8
	zUyVxoW+hdIvP9rvwOI367bbUJBVF1DtOsHD7Y5muQwP1UjkEMaEfrJ6i0Rj5RE7
	xIHk8/vg6+opmBWlEYwh1E4l7G4emXOkF+LyERCXOS2Gz4J1VSpuQeunbAZl8sHv
	s45c0A/pvpebeF8Wojg/454bxYah/qOVKzYn05E4nsUGGVLS8ANDSBpnyeh3OXzU
	xJ20u+1VaH0w4ykA==
Received: (qmail 3871141 invoked from network); 22 Mar 2024 14:26:49 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:49 +0100
X-UD-Smtp-Session: l3s3148p1@CDeuxj8UBpVehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 34/64] i2c: microchip-corei2c: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:27 +0100
Message-ID: <20240322132619.6389-35-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
specifications and replace "master/slave" with more appropriate terms.
They are also more specific because we distinguish now between a remote
entity ("client") and a local one ("target").

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-microchip-corei2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index 0b0a1c4d17ca..53a7a1bd535c 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -100,7 +100,7 @@
  * @bus_clk_rate:	current i2c bus clock rate
  * @isr_status:		cached copy of local ISR status
  * @msg_len:		number of bytes transferred in msg
- * @addr:		address of the current slave
+ * @addr:		address of the current client
  */
 struct mchp_corei2c_dev {
 	void __iomem *base;
@@ -359,7 +359,7 @@ static u32 mchp_corei2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm mchp_corei2c_algo = {
-	.master_xfer = mchp_corei2c_xfer,
+	.xfer = mchp_corei2c_xfer,
 	.functionality = mchp_corei2c_func,
 };
 
-- 
2.43.0


