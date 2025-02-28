Return-Path: <linux-i2c+bounces-9655-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6BEA49D25
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 16:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2806D189374F
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 15:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB6927FE66;
	Fri, 28 Feb 2025 15:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aK8b6/TH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A198D276056;
	Fri, 28 Feb 2025 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740755872; cv=none; b=tPhL6RgXbDhfSBwGdFj6DgzwiwgFhzfTKsja9fAb54eNMIksriCHE7k9C1MZmiHvK2iFFqqRw4ATOw6S98urWNVo2d3an7lkTnEkEyejkpUG5qawxV28mvv0T3RaRGg9qVi7HQxWM3VT1WEaXZQaNvVDJH71JhRuPFy1ArDPEfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740755872; c=relaxed/simple;
	bh=zySZKiDk2pU70jsTWXkfe6mit7pyCQg+lVYRE9yFqqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jgs910y2NlVBDHcQlJcu8Ha6dW8jag4n/rTokqLMMCTpBlCWvxZpR4Ap7y5oZz5b/kCyDfVx06gJZjkgkUEIovtVH5EOujP+j/68RkJQxanla3lWYBB/6arWpWFKCG0eKGYRcCnLsmDhx2jYQtnpV/jbsweREt+wygEd3X3Hky4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aK8b6/TH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-439a4fc2d65so23726025e9.3;
        Fri, 28 Feb 2025 07:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740755869; x=1741360669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dH8Nv3XF23c+759r1qgbeESvQOxywxLnq33sKq9oyz8=;
        b=aK8b6/THC54rkJpHI54JMrGiWeZ8Gdal/ad1Nhq1hDS1dHnKZoxbG8kOO7bQVqQSbS
         wmQ154D6wjJt3QgbrEIlUur2BS/wQKQuFqATtgmwxPO4Hn5wsN+ZwSjK8ka2gJ/A6qAJ
         f1NDBa7qWDKhwXTq+bfNxIJpdPNBaRzCJgwQo8kjcWSR0x4CFugPr7NJOF0vyTpNrT6C
         1noXKLjxFwyKQX7mRYWHm9rxEYGvtPUD58wVr1fOetAPPC20u3YPbJ+4UnaBeB5qDN+U
         OH6mNuj/giXCiWGP/BBh+Lg405iUkqauyHlCnVp6ihuW9uv4gWupijvVQDN7xjHP0T42
         Rr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740755869; x=1741360669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dH8Nv3XF23c+759r1qgbeESvQOxywxLnq33sKq9oyz8=;
        b=YFkki/DnGWKuGtfEYr1XLN3z9m+U6DcxQQVtV2gQJ9D+55BCObSl+aBSLHnHHt6PPa
         +Q3F63ICjmzWMY6HxX8OH9ovq+KrFtvG4q0HeNIxtv8Us2J83Ol6JFLk11TwK1dG8Q4n
         OT7Z7XzHcxg4C/FcQDILS3ZEVlTiczCjqxyonXcMCc6nsn9qXQV3KJvoh8545pE7WOdu
         kEmF5cfRYFkQBDdURLam2JaoVOjlbM6OYSI3RV1leoLIpsMy65Qhc2vrXPmGZqbxIcOw
         aAUdhGNS70wYn5E0zCL8Ho/Z/FML1g9j1WlDzaZ55wW3nf/NUqXCw2XoG0+zW0PpuMsw
         j4FQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6Zaz6zXui444bcFqkIi4TY29+hIMc8nFzYnvSGV4rttbESjCBMxQZVUOmB/wPt6Xk+jQ6y8vzi98=@vger.kernel.org, AJvYcCVxnfpOiSHsiC5/9n/ghySMvQC4nRrqYVSJI2IKBY7rNj6YtZpTPN+JFOF/oPLnV3vJFlkRpEdBPFxlAIE=@vger.kernel.org, AJvYcCWIoIYYKecCy8tMJMAfpLaf8aCHx3ZPh3PipV9JzjCX+GTxV6cAAiM2XhYm5QjcURLNzpda7DG+kWjtoPNN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywheazc2P4HEUTQsiTS6Ct3CJhZkHXOfrzadx1WKzSoOf/ydGp3
	r/oNjB48U1qUUz365tSYoBzRDOHvvIppF2xvF5coBBlwRykscq7y
X-Gm-Gg: ASbGncvhGA3chpzR75/YkFfuqcpBS8rZUNiIbVo4EKlmE+lxEHenhEhQjKwzPDA8mM9
	yS0P4BHuHnodGl62RJCxe7YWwqkbDrNBlb6GJKnEOtP3TmcYejovxKPTuTap5Z8muWHs3TaX//D
	m5MWzjLu1fI9LJArlh8nRgvzNIJLLUueosntaL/8ABJj1Kd9oo2690yBj7TNbCGafeW1B+mP5+h
	ieWSJs7jaCjSz6NDqkcpF4svBev/dqzYYgk/LxvrVIJGnaI8vEosDWpMqBs6w4nZffX+rYDv7/W
	8O+K5Xc40Y9FaDAwMGuiLhCdi1JY52HsbncK6+8=
X-Google-Smtp-Source: AGHT+IGRCq0UXQ7og5IS+ewv0s/9Bb61n5faLSQSAEyZCLqb+fhWTneTwPRLwPq2lwsS5ZjxwOIIpw==
X-Received: by 2002:a05:600c:1c05:b0:439:98ca:e39b with SMTP id 5b1f17b1804b1-43ba675c3bbmr40163335e9.29.1740755868753;
        Fri, 28 Feb 2025 07:17:48 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b694524c6sm63096825e9.0.2025.02.28.07.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:17:48 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 8/9] i2c: atr: add static flag
Date: Fri, 28 Feb 2025 17:17:25 +0200
Message-ID: <20250228151730.1874916-9-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228151730.1874916-1-demonsingur@gmail.com>
References: <20250228151730.1874916-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some I2C ATRs do not support dynamic remapping, only static mapping
of direct children.

Add a new flag that prevents old mappings to be replaced or new mappings
to be created in the alias finding code paths.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c   | 6 +++++-
 include/linux/i2c-atr.h | 3 +++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index b3ad70a9d5f8..699cf23185c0 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -337,12 +337,16 @@ i2c_atr_create_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 static struct i2c_atr_alias_pair *
 i2c_atr_get_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
 {
+	struct i2c_atr *atr = chan->atr;
 	struct i2c_atr_alias_pair *c2a;
 
 	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
 	if (c2a)
 		return c2a;
 
+	if (atr->flags & I2C_ATR_F_STATIC)
+		return NULL;
+
 	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
 	if (c2a)
 		return c2a;
@@ -541,7 +545,7 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 	mutex_lock(&chan->alias_pairs_lock);
 
 	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
-	if (!c2a)
+	if (!c2a && !(atr->flags & I2C_ATR_F_STATIC))
 		c2a = i2c_atr_replace_mapping_by_addr(chan, addr);
 
 	if (!c2a) {
diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
index 5082f4dd0e23..7c6a9627191d 100644
--- a/include/linux/i2c-atr.h
+++ b/include/linux/i2c-atr.h
@@ -20,8 +20,11 @@ struct i2c_atr;
 
 /**
  * enum i2c_atr_flags - Flags for an I2C ATR driver
+ *
+ * @I2C_ATR_F_STATIC: ATR does not support dynamic mapping, use static mapping
  */
 enum i2c_atr_flags {
+	I2C_ATR_F_STATIC = BIT(0),
 };
 
 /**
-- 
2.48.1


