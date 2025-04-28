Return-Path: <linux-i2c+bounces-10655-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8E6A9EDD8
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 12:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2A5C1884B0D
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 10:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8827A266572;
	Mon, 28 Apr 2025 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAD5Z2Ke"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E289264609;
	Mon, 28 Apr 2025 10:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835935; cv=none; b=neeC8P+uknB2eBew4PqwF+4qnJa023QDzU+Q2Z9YLBd4C3GIOLqfH2jZx8SrFh6CeuyMEGqtf8If4UYevM6fxRssC/N9SEK9shCrjo3JBw6YT1Cg/OMGh50djfX5Tp7tnJ3rTQ3qdEAobPlLfWODDg6H+5xFmKfaxOoC/xf0zP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835935; c=relaxed/simple;
	bh=RZX3RZwJhM68tlxBvq0gT7tyXmfW8XV9yVFzxV/fu3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tpeCl+Up3A/NZ7XDw4uFj8UHnLxBYrvyf4bfonHvCE0CZCn8H79smCewtSj4tUutJ5P7dwNUj32Qq8lNutpLxK2xDqmipEmcBi67n3KcJZ5OwBhqgl2Wd2Och9gd66FHslsnRu57m8fLoeTXXxysbJGKrCYGP5O8tm3n2nRGcFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAD5Z2Ke; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso44657725e9.1;
        Mon, 28 Apr 2025 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745835932; x=1746440732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XZd2mLuh5yTdiZFrVrElau3tY1YQ8clmk2R66DBv1c=;
        b=TAD5Z2Keya6IIdDAv4vOefpo8G/Cx6n1KUlLQuxbrxW/eeeJDQjyIA/dTcXFTd/pvo
         LssvMZwFLnP9OccZ4yjln9Q5bo4O6LHLgKJX3GMQMJjB3eTV2d+MjIIlCBGZ+SsWuJui
         5eTmpp3BuAgaphYNXeTf/UsPw1YRCN0zZBatRaX8b6psQU4efBrD1V1B36x9+k+H2EyB
         9nUyNaCCuJimXHj/SqHd74mk4jz6Ty/gk5Bv4M8rcUuGRD3XhVNdLKIY3T/rFBBkWEj4
         Anp+TYe1QCIgZ5dyQGorEA99MwL0ws1AMAQikHPY09sMASsGv3g/rCnvTxRSURWR0UV8
         MDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745835932; x=1746440732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XZd2mLuh5yTdiZFrVrElau3tY1YQ8clmk2R66DBv1c=;
        b=PQYuROpOfMpktIRAhHyhSdrmddLwzxew7wLvDX4sZaXWOk2pw79/AKTnH3zjbwD3Rj
         +Y2yeuei+HoU9KUU/BqvSnTLMTbGlgWqNG3Jd9//WaTPN/Hrj5+ZhqydAVlzobdd8nNw
         ImxvAUWdSFgghaVTKLR0znAKPjrmvmko9XDXJZtvWiO6olbenLCV/F+dpB9cyVh0OdA+
         RtxTiFGqpMWzzERA5HRekaK9+Z0rCkYDiI6FNkFjlrYYjE0N25I2NdbTsdy32xWkfZeB
         iOY4nAT93i+SpoPY3UQKn7Uurb8Gr82uV0dniQkBuBofnSQVWut5tDX0iyyKO0Dx1GYr
         /n7g==
X-Forwarded-Encrypted: i=1; AJvYcCUyuRnJlyJDRiKD9Iip+pU8qHL3Wdss3iT+5xTduZBashdVsRrq3AbTDRD3NqCnIGLGVKFAXRqiafWoj88=@vger.kernel.org, AJvYcCV47pjR4gGdR1VBef7jpUsgjODvpSTxz6XzowPtg2zwBJonUmPjVueu28Mn2Yqjaw8qVo35hLNOXw2lCTsn@vger.kernel.org, AJvYcCW5WAd7OBHHl214aVHz0GM2n68SsWZVEoQ1Xyt2978acaA8Nnapv9BXw+V06d0hU4Jmd9PP0aitTtw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDFDr1z+N/GdNvl3oQsajFPc/wLFaPk3x5bGqekmLbd5hHw4/e
	2Sn1n1E1YKWLN7UkX2gZYRFTQL37SATms1J+P3P9f8X+PL8YBQeC
X-Gm-Gg: ASbGncvbmQNHvLt/UAj2pZVsztiAgLifOSBo4GIxPc7zwoA+wQFpbn/4Q+vaVV5MG90
	OMxQjoB2ZQH6ZX+48QVkW0mOY2EGr+xFUnIDcfdN1NRAmYFdKSv3HwHZRtFfTLyYyFBG5jw+3Gd
	Sww5ZajdywUKG9jfARSAvKVfL5NRfkoXRjxCcV1lG7rrNVA+gaOQmRhikYNdlIsSqx5n+E4Zxsk
	mEXOGsF7ddjHyBgKbjWgXZwIFplCN84Rg0Zc2MymgFTXiYvjf9tfoeitiV0Q4Ntf5Dw2msGbOM/
	gSD9m8GoZrf8c7x5UZozLGm4gjXqlF6GKV2n08TdKCY3RAUNBWzc
X-Google-Smtp-Source: AGHT+IHpbLSsWgVx50ME0I8RLI4raoVxE5AMCwfcymKj6lni4Mmyq4NCjB2u9e33xu4qS1vXxU3AfQ==
X-Received: by 2002:a05:600c:1d06:b0:43d:1f1:8cd with SMTP id 5b1f17b1804b1-440ab84518bmr55477265e9.24.1745835931856;
        Mon, 28 Apr 2025 03:25:31 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310ad2sm118825295e9.21.2025.04.28.03.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:25:31 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 5/9] i2c: atr: deduplicate logic in attach_addr()
Date: Mon, 28 Apr 2025 13:25:10 +0300
Message-ID: <20250428102516.933571-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428102516.933571-1-demonsingur@gmail.com>
References: <20250428102516.933571-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the same logic as in i2c_atr_create_mapping_by_addr().

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 42f433846f63..bf7b2ac5e9cf 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -538,38 +538,20 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 	struct i2c_atr_chan *chan = adapter->algo_data;
 	struct i2c_atr *atr = chan->atr;
 	struct i2c_atr_alias_pair *c2a;
-	u16 alias;
-	int ret;
-
-	ret = i2c_atr_reserve_alias(chan->alias_pool);
-	if (ret < 0) {
-		dev_err(atr->dev, "failed to find a free alias\n");
-		return ret;
-	}
-
-	alias = ret;
+	int ret = 0;
 
 	mutex_lock(&chan->alias_pairs_lock);
 
-	c2a = i2c_atr_create_c2a(chan, alias, addr);
+	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
 	if (!c2a) {
-		ret = -ENOMEM;
-		goto err_release_alias;
+		dev_err(atr->dev, "failed to find a free alias\n");
+		ret = -EBUSY;
+		goto out_unlock;
 	}
 
-	ret = atr->ops->attach_addr(atr, chan->chan_id, addr, alias);
-	if (ret)
-		goto err_del_c2a;
-
 	dev_dbg(atr->dev, "chan%u: using alias 0x%02x for addr 0x%02x\n",
-		chan->chan_id, alias, addr);
+		chan->chan_id, c2a->alias, addr);
 
-	goto out_unlock;
-
-err_del_c2a:
-	i2c_atr_destroy_c2a(&c2a);
-err_release_alias:
-	i2c_atr_release_alias(chan->alias_pool, alias);
 out_unlock:
 	mutex_unlock(&chan->alias_pairs_lock);
 	return ret;
-- 
2.49.0


