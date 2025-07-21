Return-Path: <linux-i2c+bounces-11984-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2630DB0CA3E
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 20:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48BBD3BAF99
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 18:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994982E2659;
	Mon, 21 Jul 2025 18:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsiS3+hE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9432E041F;
	Mon, 21 Jul 2025 18:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753121251; cv=none; b=Y/Aw6ZOndNDsF3E/zgi81amOvpOhWIALxPy9DtLorJgAAprr2jCwnHOzF9PSeKGYxdr/4JkiqqYRx8D85l+8wckWs0S5E9jV+KqYrnt3hqXyHJ3wKHp3/pcs8nM3XNwqZg0iNZiXJTu7GA5RkI98ke7xfPqcvY7ZC/09LSKy88c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753121251; c=relaxed/simple;
	bh=m5Tye1okCu95gDaX9otALibtu1rA5BK/+GhVYodIZCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LpxCzcS6w8WE6509SN7r9sP+JZJJJ0hvafeml9+R+RsGPIVOcSC/P0+QI+Y2ejg08kX1UWAqMQfUFfVS2DiSoqzrALSAxLoAMQHsNl0lVSPpx5f1gseRrHx57HxrhuK7S19PN8hYWWKBSTUYy2K7taj0Vk4CCXCnvIlGgfOx1R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsiS3+hE; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b5e6bfb427so2600355f8f.2;
        Mon, 21 Jul 2025 11:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753121248; x=1753726048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2w7YNdeV3UKe4gbJgUahKR4SR/Wo2xZsY+ZJfiRzrE=;
        b=OsiS3+hE8LZTOsAVWE1r7FbJPm0jwoMJ9qP3mBdUANh9b/8QfRv0+b9ByANH0qoiSR
         Eg0qxscvCzI21sWJI2OLcCJewlSofF/5IajflP6nT8b8lqG/qyxl1TahjkgXEeYaVFw9
         TRBnBEucisZni1ofmb1K/ZFWaHCiFH+90W9vmDyV844+1UHar8c8xZR6NLCPqLpzmSLE
         SQ3wimp5nWVLft0A8pcSic2ECJGoA8FdyOYMEpGzjVsYdM+oeG0qlDmetyakM3jHMIOB
         5/BRMrTZzQfEF4V0ppHz1IkHDlZOy1eh+srBchADaDuRvpRBXZ28lLFTBOa9ulO2B3Dh
         Fu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753121248; x=1753726048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2w7YNdeV3UKe4gbJgUahKR4SR/Wo2xZsY+ZJfiRzrE=;
        b=K9U+dmEVJA2nlXJsPtBeVyTY+o8kesMWx4zGOMI0XrfRv0oOZuGlW3HqKlyrThxiFL
         IcXuhMjxgm7g7lUL8AsDZgdUxcTH/mnk46g6gcxuoMqBpWZPkxnPJ/E+Eatg8mRtu8qs
         3/owfjpjkrPKa8DIq/Gj9T6BADl/Xaj9BBJx7GvsHRX5BVeZgjftZ0QtOYrID/8zXU0+
         kD+pM5QMn2aaFQg3H575evOEKuJVZw0sjNjDjBOvk0BVAXHxxtuzUrxssMVCGTwzJIYC
         HPREx3m/IX8fWdSh0V4B7zXXU1uS1/X1i2U3ac1D1hiEVwR7nAv/joBCT+Krz9LGqtHy
         RbqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6SIh66n6LKtWzMNXvyi4XjGskQXxUPjdl5VxX1SB4LK6HX8Wf8ATPUMzXFg8YVrbj17KclAO7iKVv@vger.kernel.org, AJvYcCXK/iGAbF/WCHMFN3xQk8wmbKXJfezprHHoOP3IgH9FmGyGbNR80t2UWYO/VsZoVWwo19gNuFZGzx/UOHQR@vger.kernel.org, AJvYcCXz6SDQODZ3UxwX03/Ug1CWSEK2nDLoTAwDFKMV8PKpm0eV+Y3ZP3kiUDemymW8YXDeJyiEXvs+ttTU@vger.kernel.org
X-Gm-Message-State: AOJu0YyacRTT1tQ9fm0Mp86E7D6QlYscPtgQK1FrpbZd6zroF8aUAI0K
	M58J+1hQxMTevgzpdGFhFBQEub+2UsxeHtMr49ghJMBgfkVbWV8TuNnS
X-Gm-Gg: ASbGncsKRfUOePlsVB9eVkYbRI0HFaw67gWlBkISTZPkpNi4psbzo3xMn3Jx7oNhVl9
	IDM+bS9eKJQUgsaNR3fvriHvia8r2eCst3BQZW0Gb/ElneBogfO7RFGIk7VOPcWQG8JIujJlXfD
	H1w6X0n50+J/DlLg+Bv7U4Q+3tLkpRKG7ACFSCiDqBi5N8uNLWSOylffsCXbi/uuFvY4er5i0lc
	KxdJFIzA8ilSeJXznU9iTyQE5wfOeu2gQFZE/vidHdZyfpM4MEjcV/x4DHHvHsVLtKWzHqlqUWM
	57fPmUmaPxRllxN2Bef0e5MeXZfLuu6Wq6N4AyF4QczsvnI9+HTezGk5cn+rlII3XbgjOi9ZHP1
	LWa8BgiEALGKs95LKrNbP5iM=
X-Google-Smtp-Source: AGHT+IGYHvoIqXYmG9yQPodcuC8yICZXTkPFoNGcxMbPnfnBTzexQFmzBmrG3T3lmTwxSiAjYQZz+g==
X-Received: by 2002:a5d:5c02:0:b0:3a4:dc32:6cbc with SMTP id ffacd0b85a97d-3b61b0f2f8dmr10615647f8f.20.1753121247732;
        Mon, 21 Jul 2025 11:07:27 -0700 (PDT)
Received: from Ansuel-XPS24 ([109.52.136.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca25443sm11183370f8f.9.2025.07.21.11.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:07:27 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 1/5] i2c: mt7621: rework cmd/wait OPs to support atomic afer variant
Date: Mon, 21 Jul 2025 20:05:52 +0200
Message-ID: <20250721180710.2116-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250721180710.2116-1-ansuelsmth@gmail.com>
References: <20250721180710.2116-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was reported the need for atomic operation on some Airoha SoC that
makes use of I2C bus. Rework the cmd/wait OPs to suppor the xfer_atomic
variant. To support this it's mainlin needed to do the readl poll in
atomic context.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 59 ++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 2103f21f9ddd..c0e13f9af3e5 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -67,14 +67,19 @@ struct mtk_i2c {
 	struct clk *clk;
 };
 
-static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
+static int mtk_i2c_wait_idle(struct mtk_i2c *i2c, bool atomic)
 {
 	int ret;
 	u32 val;
 
-	ret = readl_relaxed_poll_timeout(i2c->base + REG_SM0CTL1_REG,
-					 val, !(val & SM0CTL1_TRI),
-					 10, TIMEOUT_MS * 1000);
+	if (atomic)
+		ret = readl_relaxed_poll_timeout_atomic(i2c->base + REG_SM0CTL1_REG,
+							val, !(val & SM0CTL1_TRI),
+							10, TIMEOUT_MS * 1000);
+	else
+		ret = readl_relaxed_poll_timeout(i2c->base + REG_SM0CTL1_REG,
+						 val, !(val & SM0CTL1_TRI),
+						 10, TIMEOUT_MS * 1000);
 	if (ret)
 		dev_dbg(i2c->dev, "idle err(%d)\n", ret);
 
@@ -117,27 +122,28 @@ static int mtk_i2c_check_ack(struct mtk_i2c *i2c, u32 expected)
 	return ((ack & ack_expected) == ack_expected) ? 0 : -ENXIO;
 }
 
-static int mtk_i2c_start(struct mtk_i2c *i2c)
+static int mtk_i2c_start(struct mtk_i2c *i2c, bool atomic)
 {
 	iowrite32(SM0CTL1_START | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
-	return mtk_i2c_wait_idle(i2c);
+	return mtk_i2c_wait_idle(i2c, atomic);
 }
 
-static int mtk_i2c_stop(struct mtk_i2c *i2c)
+static int mtk_i2c_stop(struct mtk_i2c *i2c, bool atomic)
 {
 	iowrite32(SM0CTL1_STOP | SM0CTL1_TRI, i2c->base + REG_SM0CTL1_REG);
-	return mtk_i2c_wait_idle(i2c);
+	return mtk_i2c_wait_idle(i2c, atomic);
 }
 
-static int mtk_i2c_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len)
+static int mtk_i2c_cmd(struct mtk_i2c *i2c, u32 cmd, int page_len,
+		       bool atomic)
 {
 	iowrite32(cmd | SM0CTL1_TRI | SM0CTL1_PGLEN(page_len),
 		  i2c->base + REG_SM0CTL1_REG);
-	return mtk_i2c_wait_idle(i2c);
+	return mtk_i2c_wait_idle(i2c, atomic);
 }
 
-static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
-			int num)
+static int mtk_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			       int num, bool atomic)
 {
 	struct mtk_i2c *i2c;
 	struct i2c_msg *pmsg;
@@ -152,12 +158,12 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		pmsg = &msgs[i];
 
 		/* wait hardware idle */
-		ret = mtk_i2c_wait_idle(i2c);
+		ret = mtk_i2c_wait_idle(i2c, atomic);
 		if (ret)
 			goto err_timeout;
 
 		/* start sequence */
-		ret = mtk_i2c_start(i2c);
+		ret = mtk_i2c_start(i2c, atomic);
 		if (ret)
 			goto err_timeout;
 
@@ -169,14 +175,16 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			if (pmsg->flags & I2C_M_RD)
 				addr |= 1;
 			iowrite32(addr, i2c->base + REG_SM0D0_REG);
-			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 2);
+			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 2,
+					  atomic);
 			if (ret)
 				goto err_timeout;
 		} else {
 			/* 7 bits address */
 			addr = i2c_8bit_addr_from_msg(pmsg);
 			iowrite32(addr, i2c->base + REG_SM0D0_REG);
-			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 1);
+			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 1,
+					  atomic);
 			if (ret)
 				goto err_timeout;
 		}
@@ -202,7 +210,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 				cmd = SM0CTL1_WRITE;
 			}
 
-			ret = mtk_i2c_cmd(i2c, cmd, page_len);
+			ret = mtk_i2c_cmd(i2c, cmd, page_len, atomic);
 			if (ret)
 				goto err_timeout;
 
@@ -222,7 +230,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		}
 	}
 
-	ret = mtk_i2c_stop(i2c);
+	ret = mtk_i2c_stop(i2c, atomic);
 	if (ret)
 		goto err_timeout;
 
@@ -230,7 +238,7 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	return i;
 
 err_ack:
-	ret = mtk_i2c_stop(i2c);
+	ret = mtk_i2c_stop(i2c, atomic);
 	if (ret)
 		goto err_timeout;
 	return -ENXIO;
@@ -241,6 +249,18 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	return ret;
 }
 
+static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			int num)
+{
+	return mtk_i2c_xfer_common(adap, msgs, num, false);
+}
+
+static int mtk_i2c_xfer_atomic(struct i2c_adapter *adap,
+			       struct i2c_msg *msgs, int num)
+{
+	return mtk_i2c_xfer_common(adap, msgs, num, true);
+}
+
 static u32 mtk_i2c_func(struct i2c_adapter *a)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_PROTOCOL_MANGLING;
@@ -248,6 +268,7 @@ static u32 mtk_i2c_func(struct i2c_adapter *a)
 
 static const struct i2c_algorithm mtk_i2c_algo = {
 	.xfer = mtk_i2c_xfer,
+	.xfer_atomic = mtk_i2c_xfer_atomic,
 	.functionality = mtk_i2c_func,
 };
 
-- 
2.50.0


