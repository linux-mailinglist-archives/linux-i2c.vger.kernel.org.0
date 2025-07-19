Return-Path: <linux-i2c+bounces-11970-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 424CFB0B00F
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Jul 2025 14:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C7C517F1A8
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Jul 2025 12:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431B72874F4;
	Sat, 19 Jul 2025 12:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KL37mwbE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFC8286D76;
	Sat, 19 Jul 2025 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752929794; cv=none; b=NdZPJ07v2cAgeNkKTRHkYd1I/uCPgdVJFCUKYNhsngMh9DA8R2GAToRcSG7aLe203MKAYnQNyFKV261/VXuC7RtPuWTUsnbt3Bij4KKbfew6dryS4Wai7BoQvEBkjeuHoPaS+HHLVa9/bUjT76Yvydr9TaGn/TnV6EMQ1YmUqLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752929794; c=relaxed/simple;
	bh=m5Tye1okCu95gDaX9otALibtu1rA5BK/+GhVYodIZCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bvHjImcWfrK8M8Zkyt2bTrTDKTrj9BVTsN4DKlI1Vz/OBdjPXwss8YQYMedVRWdlpGhfFJP5jsY6sX5dEt/bpyX+7kH5t2RdkjD9IuWzRgzpLu7k5oprCdfh/41o84hdyjqb5uxpKkLgfa9iplwxx8N8voIjsHq1VME3cJvNJFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KL37mwbE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so13387145e9.3;
        Sat, 19 Jul 2025 05:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752929790; x=1753534590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2w7YNdeV3UKe4gbJgUahKR4SR/Wo2xZsY+ZJfiRzrE=;
        b=KL37mwbEq5N7Mo679u/YDENwT0Nvbtg9PeAr+VLuTE/wTRDy3sJtzJcB3bhz8+kMsP
         o8S7tojxvsTQ2HI0EakJaRm3pduRpRlXsMZJjNwv6z6fPLwFegw+5i6aqGNXEOujk76k
         1uXOsvK0SdBA49YTU0GudyRkfufzYSvu5YXqJGIjzce4PaPxR8kKwdun7mVEQhFR6Trd
         ZTPcTvfBmicg8SrBKIh5dOboLW2qyiSm2tjhkQZ8HnizkjxxmrFNhLikSXfiNrhHl3lI
         +vWttVbjJl9f7QcUuqBvEyxqALOJgyjj2opSVxe31Gnc/NZnk83GhTu18Uo+pTSSeUlj
         c14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752929790; x=1753534590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2w7YNdeV3UKe4gbJgUahKR4SR/Wo2xZsY+ZJfiRzrE=;
        b=CwqymW3/sgkFT4NzH09K09/zkmoc9D9i8nrpFPs31hcQf8ldkME6Bv3zbzd033gn7o
         VxLv5D5NamBr0tuhHFohkREPxqU2kxKIbDZaQnXeEHUmSqmgloQBH8m+joO0UIrEIKQb
         Wq/KNC68JE4dqTGXU8buiQTXMwhtkOpA4RjhCWyoBwVFuiX9gZfSfaJ0mp3wNszfx8RM
         7tKtrGlsEyU+gPcwkaFN+WZSrY8wecuE87NG43G0RTqn4vyOyPD6lLEeKI34jSx+KrQN
         VX1kXkzbiDaz6ktg0qBUqkozXnPz6HzJqq3GM4Bd+wSEwPZbedee1lf/VhZ44ttKPD4w
         o7Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUPck6xfls+LSNCMM6eXCY5nO/htWZ1QSwjx79/i0eYIsAEPs9DXX1yjNlap8frK2Y4elkfZSrBvKQo4S/5@vger.kernel.org, AJvYcCVqIsVoAWHYIplCEiW5DLeIYU25evBinmpayrYxcc/PKE9nMF8RK0+MEv3p42cq8JHV/TJkQdqhTDyC@vger.kernel.org, AJvYcCWiie8ASD1yUOgrCjbdH3dOSy0GA2rgg+4gBdmJfM7E8F8GQ7jqPvowRqeIky/kFj6swrGF6om9F4oJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1YMXssFrD8HMYpoSP/fOXy5rfGROhMpivEoehM7mNmQsMngvH
	S+71iDT5Tt70e7RuqTY2cb9ciIwI0zbj+CpB2BJSxxu6bWZo7uF3I7ng
X-Gm-Gg: ASbGncuBMdOhDFBbnvjv5tLlA12uipb9mEryyXg+qcWvFn80MvSLczrZoCP2OCLswwq
	fkNoDo2gzqGvXBgLkrPjG15vhN9CAssnablA+QfViCea23BbT0n76O4ebOCILoiLNExGGb2vOvv
	9XAsjbc5ZAJcVUTk00kUfytb8M6VId4Y/GdAP7Z8NyV5Rd2ZYCnwgPT0FletSVQ4vI8xiozIB8/
	vzaduILbooGlaPeDhyOPZwUzl8NCqbA2tcwK9/Z+BWyruAgYfqOBSiYiaFwpPZv/Kg9pIbbFL72
	BYd3GIUebgbxBqm4CIrshPMYPiTFvD2YALXG4n8A3C+DGuC5xia1dKcCrjOZvAJ1NvzKuJ6rehY
	JS0QUT3891CvvCDMYQKMoAEN6rD0SMpLfciSjb7LkMmKcMX8HwdJNUqXGtxp5A1baio+TorT+GX
	Vx
X-Google-Smtp-Source: AGHT+IEO9YWESJShcqk3FC7Utf1NPhIrZbrIwKsGuQ+IRsKWJH3ytffL3q840LYxpCzfHn8RWeT7sA==
X-Received: by 2002:a05:600c:4e8a:b0:456:1824:4808 with SMTP id 5b1f17b1804b1-4562e2a5c56mr119864705e9.32.1752929790243;
        Sat, 19 Jul 2025 05:56:30 -0700 (PDT)
Received: from Ansuel-XPS24 (host-212-171-170-230.retail.telecomitalia.it. [212.171.170.230])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4562e81ccb4sm106688005e9.17.2025.07.19.05.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 05:56:29 -0700 (PDT)
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
Subject: [PATCH 1/5] i2c: mt7621: rework cmd/wait OPs to support atomic afer variant
Date: Sat, 19 Jul 2025 14:56:11 +0200
Message-ID: <20250719125617.8886-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250719125617.8886-1-ansuelsmth@gmail.com>
References: <20250719125617.8886-1-ansuelsmth@gmail.com>
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


