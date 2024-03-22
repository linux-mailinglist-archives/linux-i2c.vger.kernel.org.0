Return-Path: <linux-i2c+bounces-2525-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CA5886D34
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:35:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15611B23579
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393D962813;
	Fri, 22 Mar 2024 13:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OQ0uH+2W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C8A626B2
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114033; cv=none; b=enIUheWHHJe1dLfwmxx5p7AjoKLNMTzOuvw2/xjFkOM6I0tTkrLLOD24RFL49lpH1+I+ugg52ochaOCae1BMXhoRdYC+T+pT7l5ZJQyM9Fo9i9LLgTKhS9kXEb6V6k0dVyM2tWTEkGKTgi7U7+KH/vW1Hoh9K1H4EiMh0zpOcuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114033; c=relaxed/simple;
	bh=+RS+UhS6WUjSbCY0xfU+zM9YHKbLEi8gdstYXT6GhQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g8zQwJPlgI/kkJ6UjRZlIR39y16BDjG0LrQZmoGtHzvHmechWhzDtAuJ0aTTSEgS8sFxuxcEcklFozn8ibFkPocm8Tfu/HrbwpsMOoxqRiLXv3ZnBGWrkYvM8JGBrDvo3QHVrxQ8TzHW9EQBt5KpdGOVKw++PEMlTob6glzVFr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OQ0uH+2W; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=udgUjkpefuQ9OwJPC3EPycZIK/sxdg4g3sqFLxJebvM=; b=OQ0uH+
	2WnKS8IffATf4BWVHvcEa2AgwrtH8px3F2SELW7HV4ZsdRcKoa0yhp6qk7t5rImU
	sJLJzbas/WdMD1al3K66D/hCW59ZRbfq4oaGUKVBa1iuU7+UZOalN5aWDdPQaFQb
	QABMkiX2uzowp9UEe9e7iMDBrakyuSm/HwYhIeH29iAutn8VH0XdvwIgMDqqGmWy
	hh7smvMWSQrdsRL3ON8auBlSBSZI6GInGpoARaXe9LQyhtrKqF6+ymZ5HC3jXeXG
	jRjSmo2Tr1+O+LOFV2c5BlWgvvqZK88fyBpkWY5QzmrKswW353WRx4bG3LEfbHrf
	YTkOfrJvSrAoacbA==
Received: (qmail 3871338 invoked from network); 22 Mar 2024 14:26:53 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:53 +0100
X-UD-Smtp-Session: l3s3148p1@Wvvvxj8UarBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Robert Richter <rric@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 39/64] i2c: octeon-core: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:32 +0100
Message-ID: <20240322132619.6389-40-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-octeon-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2c-octeon-core.c
index 845eda70b8ca..a0e6c9a43168 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -215,14 +215,14 @@ static int octeon_i2c_check_status(struct octeon_i2c *i2c, int final_read)
 	case STAT_LOST_ARB_B0:
 		return -EAGAIN;
 
-	/* Being addressed as slave, should back off & listen */
+	/* Being addressed as target, should back off & listen */
 	case STAT_SLAVE_60:
 	case STAT_SLAVE_70:
 	case STAT_GENDATA_ACK:
 	case STAT_GENDATA_NAK:
 		return -EOPNOTSUPP;
 
-	/* Core busy as slave */
+	/* Core busy as target */
 	case STAT_SLAVE_80:
 	case STAT_SLAVE_88:
 	case STAT_SLAVE_A0:
@@ -595,7 +595,7 @@ static int octeon_i2c_hlc_comp_write(struct octeon_i2c *i2c, struct i2c_msg *msg
 }
 
 /**
- * octeon_i2c_xfer - The driver's master_xfer function
+ * octeon_i2c_xfer - The driver's xfer function
  * @adap: Pointer to the i2c_adapter structure
  * @msgs: Pointer to the messages to be processed
  * @num: Length of the MSGS array
-- 
2.43.0


