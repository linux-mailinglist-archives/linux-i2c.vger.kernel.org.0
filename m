Return-Path: <linux-i2c+bounces-10872-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F2AAADEE8
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 14:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31B7F7B805B
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 12:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5750F265621;
	Wed,  7 May 2025 12:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUySwLQL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A1E263F43;
	Wed,  7 May 2025 12:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620379; cv=none; b=Bs/FlHD212HgS4R2iqPHn5GxHjabbbp35ZujiS7y9g0k0KRpNrLzLKRo2zd/f7pYFLgXZ3/kQygUavFqemuIbRlSQN6S2BNCVxyBkGSFVUedYD8QVnPgUlptuvUOqop+xgJcGFga7jUUf53z6CpkKxBKBLih5ysz9o8aMIoANro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620379; c=relaxed/simple;
	bh=IncmGeBrDS5I/fgmp8yiaekm5sPKDwdxDosYXHlXQvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SSC3hm0TRSAvz8mIqPO8PIjUemFHdL4cQH3HOMfPp3Lkca585NsahaaZocLqSPEipO6K7tZ445dRjgbmMKQsn1iJp3ND3CPwPE2WzkkRwvO+AWxxG+Jt+LAiauUzQvzZRsuoBpWrm7FPi4RuB7RG7YujJ6qimT+W4YPjH0cci5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUySwLQL; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5fbf007ea38so1190024a12.3;
        Wed, 07 May 2025 05:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746620376; x=1747225176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2KJ26YIlL26ps6IFL0kVpu1NN+yB+jxrYA5HLOizf4=;
        b=ZUySwLQLfldzo6fd8idLe9U9HwPfReOYHrzB7jHS2HbrIHMlkkLFrl2Wzh/3xaUHWx
         z7KdjC14Usz74/gGqI1T/EOVLtDyFRUIs1hGxiXuze0sTHF75ZzwY2/ZVigAuYYzaoUx
         MQXq4i8GM3Oqt6FW4M4RfQnOIHQerUjKkStOYLH/1kNMbHtEXfKQAPZb8qer2rXC0C5B
         95UaRPNmL48TjL9qOwKTJm9O488/ARb7CG3xCvg82GyVqt0Ik1jAoLOtQqmT+jg8GGlg
         EhJlgmXK7r19ypuyUcYFt/WsBkbjzrrYrmTNBt9YR0eJMdhtQwTmj9UpaO7m7l4EaHr1
         v1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746620376; x=1747225176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2KJ26YIlL26ps6IFL0kVpu1NN+yB+jxrYA5HLOizf4=;
        b=naDHX+JIe7IMsLirhM1rAA9qceoFn5NVTE4uWqbWiaDpRIaSRcpA9P+Ltr2N20XkeC
         1MwpP/tk09fL0VT9i9gPSg5aDkeHueNDRcOqYzo/ywkIIvd2Sq2HmbxgI5mo0UekjkbT
         Jfy8U6abj7+gySV0jmHym5Rs0hHtwWuURJLeOj8UTt/sfexYgehGNEpPrkbDXLhCLv0f
         w3IS+cOQuJaQSk+eJ1jC1i3Oiu7dL5lI1j9/VtVa2fFTTCQo4DU5QI32jhaQawSih7+/
         0LLxS4DK4yS7ft/jHNDqeDUJWgUBc8qbf74kkxvobQKzQEsQJZhTwZ36640mCuMVI0xv
         FMvw==
X-Forwarded-Encrypted: i=1; AJvYcCVB6HC5jjY/zkU+cQYM7yRSHPPYvmcliEGwlHgWgzTR4dXzvr4y3imBGFhq6Y39RqnwOxIz5d3/dc3vr0Y=@vger.kernel.org, AJvYcCW55V2Atdf7JtokIf+G9XqFT8pKuPtGLTp9+pBTerPsPNNYJ+JSMnphNla4dEFpJ3pWuIMgBPwiKhM=@vger.kernel.org, AJvYcCWytIJNremnxzsgzZBSzTzT1qYLPysaOgtEkTeJvXFehBWFIZSokedbt4is8Ab/mSy7ZfjaP89oSefSUUN+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvz5wHhIaOyRutHVENWuNSGrF9PYvitPdsApRC2X9v7fINAusE
	347gZcugZq1VjWFUHXPwuuyrB5MfgcYkTcNh8sE/DOcVZ8tj5+9U
X-Gm-Gg: ASbGnct4k8mOznOWPC2u/gJ15JXkVam7A29C28k4yDYoSZTbkUFIKtrhBwFQSgLAaW+
	FNJv29MxQ/YnmPksUCspTkOYTXp1e3mFNycFl1Z2Y1esW/16uu32JzY0YVUI01GAp5kYUUt0Hlo
	ACb3J295LmqQatdn/ZqKlc+t215nE9VeemlD5wRmVl1xgdUX2E/9aP3R1P2ZeSkHKNMRhceIAKh
	RtQ5sNxUajPLuChK+68W/HXl8jUTzbN8xXjQrfhcpCiTRS91/eY0u7aAzeSinbcUzOLor+nNyaF
	5FutpcJJ0OwOSaFjdqZNmF/0R0v3Gtwtew2NFrkxBcbZAU3EolXQ
X-Google-Smtp-Source: AGHT+IEvLotDHhdb7KPxeTvSHi1rKTMFXmu+F9vTFpZBRVBhkjY5JDO4yOcT8sqnDe3jtEEKcN3ozA==
X-Received: by 2002:a05:6402:4307:b0:5fa:a495:6904 with SMTP id 4fb4d7f45d1cf-5fbe9f3c4d7mr2450261a12.23.1746620375615;
        Wed, 07 May 2025 05:19:35 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777557b9sm9350002a12.10.2025.05.07.05.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:19:35 -0700 (PDT)
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
Subject: [PATCH v5 8/9] i2c: atr: add static flag
Date: Wed,  7 May 2025 15:19:14 +0300
Message-ID: <20250507121917.2364416-9-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507121917.2364416-1-demonsingur@gmail.com>
References: <20250507121917.2364416-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some I2C ATRs do not support dynamic remapping, only static mapping
of direct children.

Mappings will only be added or removed as a result of devices being
added or removed from a child bus.

The ATR pool will have to be big enough to accomodate all devices
expected to be added to the child buses.

Add a new flag that prevents old mappings to be replaced or new mappings
to be created in the alias finding code paths.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c   | 6 +++++-
 include/linux/i2c-atr.h | 7 +++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 121cabbdb85d..76d70efdf190 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -341,12 +341,16 @@ i2c_atr_replace_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
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
@@ -545,7 +549,7 @@ static int i2c_atr_attach_addr(struct i2c_adapter *adapter,
 	mutex_lock(&chan->alias_pairs_lock);
 
 	c2a = i2c_atr_create_mapping_by_addr(chan, addr);
-	if (!c2a)
+	if (!c2a && !(atr->flags & I2C_ATR_F_STATIC))
 		c2a = i2c_atr_replace_mapping_by_addr(chan, addr);
 
 	if (!c2a) {
diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
index 5082f4dd0e23..5aaab1598084 100644
--- a/include/linux/i2c-atr.h
+++ b/include/linux/i2c-atr.h
@@ -20,8 +20,15 @@ struct i2c_atr;
 
 /**
  * enum i2c_atr_flags - Flags for an I2C ATR driver
+ *
+ * @I2C_ATR_F_STATIC: ATR does not support dynamic mapping, use static mapping.
+ *                    Mappings will only be added or removed as a result of
+ *                    devices being added or removed from a child bus.
+ *                    The ATR pool will have to be big enough to accomodate all
+ *                    devices expected to be added to the child buses.
  */
 enum i2c_atr_flags {
+	I2C_ATR_F_STATIC = BIT(0),
 };
 
 /**
-- 
2.49.0


