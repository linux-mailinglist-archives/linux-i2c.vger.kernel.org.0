Return-Path: <linux-i2c+bounces-2523-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DFA886D31
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE54B28A45F
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AECF626BD;
	Fri, 22 Mar 2024 13:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JCMAymug"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6946169F
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114031; cv=none; b=K2gGaP2B92ZQVPiBrL97pThYPvwavMWA4KinZ+L34rcvIZO+1PaLnaKNYP3pVIKf60LAKbQObViGExkfYw5aJFcpocN/JY0bJGO6zghE0a6EHIOqE97JYn+LWOGP1G58pOtVHIrurdFVDsoZjJ+/92K8Lku2cXD7QRHY2XjuA60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114031; c=relaxed/simple;
	bh=d93/wLGnI5/n0fe59/25C/Z1j+ZGzmWXJC4x/8Nz3Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GLZ9I63HrzNqnO8S5vMS18T/EyQAopAydhXbFeJeE/sG47whdgfidbnEq9F0XP/SRGhFdrRGAMbyFTXxC6FDKgdCCpZdnqqASkrb9Z+WzHZQI8PP0zZEn+FNAhEbJdw/U5MDtb10YkDqvVwTEBCzb3FOrE5gg+Y8t4IOrdxxClU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JCMAymug; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=IJHYhfVob2IIWsQ5AQJ5s3UyVYL/b57GkPzyj7v/jBg=; b=JCMAym
	uga3ra3pl3AOnmrwJi+DoCpjdViinewm+Jrkxp2tUUg5+4qvjHsMoVJDnMYzdOdP
	Rc9GL2yFF8CmeEY+oX5O+hrHfZnckry2xlToCZuJ6LGvjDwBU5cOzQyv2kkXRdmv
	JS8OVBwmZTDS9PqcEF99N57dVzwLQNXwvDxMeuCmtqBC9eaMDIlFM+YAyZRwLtLq
	t5+4ttz9MxH3DOPGqSiIR+S1pd7/p7+DiPO2hygssgv3ZBw4OYt9TxJe4g1/TBn9
	FJlquben0fO4ZN1YD/GYRLqXAxwBY63oNrCbfL+VHWLFG49I55JAP1XwVl3IJqVx
	x3fhs7hLAXxyq6IA==
Received: (qmail 3871264 invoked from network); 22 Mar 2024 14:26:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:51 +0100
X-UD-Smtp-Session: l3s3148p1@y13Wxj8UVLBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 37/64] i2c: mt7621: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:30 +0100
Message-ID: <20240322132619.6389-38-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-mt7621.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 81d46169bc1f..c567a2cf4a90 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -117,26 +117,26 @@ static int mtk_i2c_check_ack(struct mtk_i2c *i2c, u32 expected)
 	return ((ack & ack_expected) == ack_expected) ? 0 : -ENXIO;
 }
 
-static int mtk_i2c_master_start(struct mtk_i2c *i2c)
+static int mtk_i2c_host_start(struct mtk_i2c *i2c)
 {
 	iowrite32(SM0CTL1_START | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
 	return mtk_i2c_wait_idle(i2c);
 }
 
-static int mtk_i2c_master_stop(struct mtk_i2c *i2c)
+static int mtk_i2c_host_stop(struct mtk_i2c *i2c)
 {
 	iowrite32(SM0CTL1_STOP | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
 	return mtk_i2c_wait_idle(i2c);
 }
 
-static int mtk_i2c_master_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len)
+static int mtk_i2c_host_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len)
 {
 	iowrite32(cmd | SM0CTL1_TRI | SM0CTL1_PGLEN(page_len),
 		  i2c->base + REG_SM0CTL1_REG);
 	return mtk_i2c_wait_idle(i2c);
 }
 
-static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			       int num)
 {
 	struct mtk_i2c *i2c;
@@ -157,7 +157,7 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			goto err_timeout;
 
 		/* start sequence */
-		ret = mtk_i2c_master_start(i2c);
+		ret = mtk_i2c_host_start(i2c);
 		if (ret)
 			goto err_timeout;
 
@@ -169,14 +169,14 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			if (pmsg->flags & I2C_M_RD)
 				addr |= 1;
 			iowrite32(addr, i2c->base + REG_SM0D0_REG);
-			ret = mtk_i2c_master_cmd(i2c, SM0CTL1_WRITE, 2);
+			ret = mtk_i2c_host_cmd(i2c, SM0CTL1_WRITE, 2);
 			if (ret)
 				goto err_timeout;
 		} else {
 			/* 7 bits address */
 			addr = i2c_8bit_addr_from_msg(pmsg);
 			iowrite32(addr, i2c->base + REG_SM0D0_REG);
-			ret = mtk_i2c_master_cmd(i2c, SM0CTL1_WRITE, 1);
+			ret = mtk_i2c_host_cmd(i2c, SM0CTL1_WRITE, 1);
 			if (ret)
 				goto err_timeout;
 		}
@@ -202,7 +202,7 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 				cmd = SM0CTL1_WRITE;
 			}
 
-			ret = mtk_i2c_master_cmd(i2c, cmd, page_len);
+			ret = mtk_i2c_host_cmd(i2c, cmd, page_len);
 			if (ret)
 				goto err_timeout;
 
@@ -222,7 +222,7 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		}
 	}
 
-	ret = mtk_i2c_master_stop(i2c);
+	ret = mtk_i2c_host_stop(i2c);
 	if (ret)
 		goto err_timeout;
 
@@ -230,7 +230,7 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	return i;
 
 err_ack:
-	ret = mtk_i2c_master_stop(i2c);
+	ret = mtk_i2c_host_stop(i2c);
 	if (ret)
 		goto err_timeout;
 	return -ENXIO;
@@ -247,7 +247,7 @@ static u32 mtk_i2c_func(struct i2c_adapter *a)
 }
 
 static const struct i2c_algorithm mtk_i2c_algo = {
-	.master_xfer	= mtk_i2c_master_xfer,
+	.xfer	= mtk_i2c_xfer,
 	.functionality	= mtk_i2c_func,
 };
 
-- 
2.43.0


