Return-Path: <linux-i2c+bounces-4700-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5452C929312
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F0D12814D4
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25DF157E78;
	Sat,  6 Jul 2024 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IRdBNqvV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3467F153506
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264923; cv=none; b=UUaLFNbtcufTvbeVkXEOmtkWjFdXPDBjPxX97ALCvx66Qv/rIcW3dw/xKJIfzloLcF1QzyC4n7rPwUoPszKPqD8gvVnfGptXFHNAEPaH060N6cbjMNBN8zXAPGPACxArWLsWHBMd2SDzAGe/vNrsE62avnswbm22UyD3ASuH4AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264923; c=relaxed/simple;
	bh=/pre7y9zQAqiTpguhYev4JRunh/mORvfT+ltkPz6LuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pRwBKvs1BVa0sUWhXM8vqrjaVHMPNY6KR6RQjL5DmWGdcSa61Hg1pz5u+KTAJEwRxCaFAJ3ziEh32VkMBYm2EXRnjE4bc6FXvnpaGCY3rkeFC6Q5u74BeKTcSWPGMi0a5fhjpPsU/Ww5qZkkebBeskX+Tt9m0lwKsPj9dFpwGnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IRdBNqvV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=HQCk7DO6hU38Dyc/nf2rcEWHOg3LjU+USrXlQ2610Iw=; b=IRdBNq
	vVaqq5+x1F4Fwoq8bPnJZkaAVU+exmIklp6gz5VJPCv/OmiqxMOvakbc7KAvm8m7
	/sWl6hZrwAODvl3soec03CbMNG4kYdbtX1A83ESndh8dJLN5/TwEpg0EProD9LLl
	V0DRabARUEbjKJBArVBNRlrgHgM4ys6HyDW17wJvdPo7y6QGzCymvERB15oYh+3L
	BVrYMym6UIEGKTWVH7B8zSY3rj6Z8slj+Ua9XOyWPLrny/+6Ni7+Mb3NTvcHtG7o
	dS4/BlQC2pVKYsov1ou6Lj2lQKj+VU/tB1aUWVoC80Yy2MADSc3O9oT8ZE20bNef
	fzIgAfOnuW/9lc3A==
Received: (qmail 3810389 invoked from network); 6 Jul 2024 13:21:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:44 +0200
X-UD-Smtp-Session: l3s3148p1@40qHYpIcgoZQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 31/60] i2c: mt7621: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:31 +0200
Message-ID: <20240706112116.24543-32-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
specifications and replace "master/slave" with more appropriate terms.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Stefan Roese <sr@denx.de>
---
 drivers/i2c/busses/i2c-mt7621.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 81d46169bc1f..23d417ff5e71 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -117,27 +117,27 @@ static int mtk_i2c_check_ack(struct mtk_i2c *i2c, u32 expected)
 	return ((ack & ack_expected) == ack_expected) ? 0 : -ENXIO;
 }
 
-static int mtk_i2c_master_start(struct mtk_i2c *i2c)
+static int mtk_i2c_start(struct mtk_i2c *i2c)
 {
 	iowrite32(SM0CTL1_START | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
 	return mtk_i2c_wait_idle(i2c);
 }
 
-static int mtk_i2c_master_stop(struct mtk_i2c *i2c)
+static int mtk_i2c_stop(struct mtk_i2c *i2c)
 {
 	iowrite32(SM0CTL1_STOP | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
 	return mtk_i2c_wait_idle(i2c);
 }
 
-static int mtk_i2c_master_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len)
+static int mtk_i2c_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len)
 {
 	iowrite32(cmd | SM0CTL1_TRI | SM0CTL1_PGLEN(page_len),
 		  i2c->base + REG_SM0CTL1_REG);
 	return mtk_i2c_wait_idle(i2c);
 }
 
-static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
-			       int num)
+static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			int num)
 {
 	struct mtk_i2c *i2c;
 	struct i2c_msg *pmsg;
@@ -157,7 +157,7 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			goto err_timeout;
 
 		/* start sequence */
-		ret = mtk_i2c_master_start(i2c);
+		ret = mtk_i2c_start(i2c);
 		if (ret)
 			goto err_timeout;
 
@@ -169,14 +169,14 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			if (pmsg->flags & I2C_M_RD)
 				addr |= 1;
 			iowrite32(addr, i2c->base + REG_SM0D0_REG);
-			ret = mtk_i2c_master_cmd(i2c, SM0CTL1_WRITE, 2);
+			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 2);
 			if (ret)
 				goto err_timeout;
 		} else {
 			/* 7 bits address */
 			addr = i2c_8bit_addr_from_msg(pmsg);
 			iowrite32(addr, i2c->base + REG_SM0D0_REG);
-			ret = mtk_i2c_master_cmd(i2c, SM0CTL1_WRITE, 1);
+			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 1);
 			if (ret)
 				goto err_timeout;
 		}
@@ -202,7 +202,7 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 				cmd = SM0CTL1_WRITE;
 			}
 
-			ret = mtk_i2c_master_cmd(i2c, cmd, page_len);
+			ret = mtk_i2c_cmd(i2c, cmd, page_len);
 			if (ret)
 				goto err_timeout;
 
@@ -222,7 +222,7 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		}
 	}
 
-	ret = mtk_i2c_master_stop(i2c);
+	ret = mtk_i2c_stop(i2c);
 	if (ret)
 		goto err_timeout;
 
@@ -230,7 +230,7 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	return i;
 
 err_ack:
-	ret = mtk_i2c_master_stop(i2c);
+	ret = mtk_i2c_stop(i2c);
 	if (ret)
 		goto err_timeout;
 	return -ENXIO;
@@ -247,8 +247,8 @@ static u32 mtk_i2c_func(struct i2c_adapter *a)
 }
 
 static const struct i2c_algorithm mtk_i2c_algo = {
-	.master_xfer	= mtk_i2c_master_xfer,
-	.functionality	= mtk_i2c_func,
+	.xfer = mtk_i2c_xfer,
+	.functionality = mtk_i2c_func,
 };
 
 static const struct of_device_id i2c_mtk_dt_ids[] = {
-- 
2.43.0


