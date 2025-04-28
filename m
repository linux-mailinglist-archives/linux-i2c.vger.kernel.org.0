Return-Path: <linux-i2c+bounces-10658-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F3DA9EDEF
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 12:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C490A3B99A3
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 10:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7514266B51;
	Mon, 28 Apr 2025 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yld4XMe2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47922676CF;
	Mon, 28 Apr 2025 10:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835940; cv=none; b=hbEiMOmLX+flApm6vc2oLWL2jGEGzgoSJ3dLxRPQBdfgXr2t+lWaDBXInETDPZJRDK27hUnO+W1wjxthAp1bhKMeCAVjPVzKV7kzj0ljpY4aWMnCZ0tDmOBibSCbY6Puf+6F7ooWNMpzEiYAUtM2VNItrpUwsMD+kVfT7U2lc4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835940; c=relaxed/simple;
	bh=5f3lIdzZo5QBxN2OkhODVNYCc7xZacb7TJSK4Zl4+GY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLw5eKDu7q9K8Aj7qapiOCO0FgAJalnrTivw6XCEO4WutbMg7KrP36wkDITOzzqdShKkxS4GaHzil4J+xlsQxUTQXe/CizjU9LH0zo/qLMa+KrnRyeO2DBGm4JhNlUwAQI364Iz4a1BLgAzXJypuDVFOafwGFpVlVfQomgrH3jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yld4XMe2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso41099995e9.2;
        Mon, 28 Apr 2025 03:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745835937; x=1746440737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sR+4IcQa19Yw7axS7f98CW/quiDY/S4+FIxh+Zej2/I=;
        b=Yld4XMe2EiFLeV7W+RsquZlvt32ghgs8dMN43zE5vV5VfWE3+srG68Ef1lAvW18kfx
         2llRqkB8yGngAYiyD3+NvnGwj258kn2Pm5IYE2ZiSCnTASwbZ5MgVpdiIyeOEQ6cxNyp
         Hu3+aFHJ+uYMy9xo1whsstyAWYBI2yELUprHQzZiFAZkBWGKrj3T8xjnrWx2MM1Ns+AJ
         aQR7B6MFJITNl9JYGCCB7cLHrFX3XLb9iY+zlLwyVAJ8JEPinOBFiw3v4ha2P144eLgR
         GywQsIo48K67/dMlQoR4BxGARAVfq9i66hZ40O08TY8qcwUtAiFfSHBOD34SiqpBcF8Y
         N+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745835937; x=1746440737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sR+4IcQa19Yw7axS7f98CW/quiDY/S4+FIxh+Zej2/I=;
        b=ZbQ5ec8MfV6B5L7XGYICQPmuqnnOW7u65Gvv8GlRTBGhkoSAm6X/Ig93QvdcMCysjI
         vHJJ56D1WPndxa3i4DmoI09g5Wjc8BPNatDQF3cijWVseXcGBobBGV6pp/2VKcPyPuTJ
         Llyq+aagYQVqFq/ePmJcW97VjvA5++uxUiuYRpCKwVHK0KRLS4JOU3xKwAOAnFJ+Qp/P
         BN5tkDBPm2Mh3JAAhCt7IqREh5y7b7ccevFu7SosE3hjAWDzCTadO86EHdTcSll4j3eo
         7nIPhy3vHqXBXXpVICyhUV3QWyj7Zw8uMGS/M33xHq+KagN9en3ZJ8E4mW8sWaF3wsto
         Yw0A==
X-Forwarded-Encrypted: i=1; AJvYcCU9IzHlTQp2/Z2yt8E2ACl0TXIs7SVp2II9c6zOT2lHo0K9Q0Y1wvWYcYoAJtANt6aejZA4wEXJBKw=@vger.kernel.org, AJvYcCV4FCN2Ed00phZvXafgZiOweRcF4ZrJeSRpUztoUifb4x/76C6rRufFTOqFUJSezf0jb08Kjapp8drnAGk=@vger.kernel.org, AJvYcCX72MucFtprT6T3yzxzfDWDMfPWglB0z7ofvu3gQCTZrzO/uB9AQ4yIziH06Eoa2TiZRxCk2XUGpv4e/0a2@vger.kernel.org
X-Gm-Message-State: AOJu0YxshrOXVxhLuPblbXiCzljndtP8+Fb2msKWrC9zpxQKvuSdvmgs
	6CmnR9621hVRj3/6VZ7t6sC8ZvXbhbAQVStYn2JOzEk4RzqjkwFx
X-Gm-Gg: ASbGncud2f0QvSzYWJ/vy0UkhsYI7HVu4VzyYvyK5He+agdg1/UPntC+96rorUQTjs3
	1ZY7arVw/Fd5dkzHD1MFqe996/6o7Q9se5N5QQ7PEiNl3p3qUSUy+Ck+JBT/8VwyfbzClXUEnA3
	nrwQvZrgjLSD6hhErB76TnIfA+IAV5lAjjO+WpijebzvXdBKClLLPRE4VaAvUR8f6Gs0pd2rK9X
	v5gHggn9S3j3EDDX0LH8McddcbN03cCdMSwG+4R4dxPwa/xPEoNldOHK2jgUVMEjcrJ70wWXyYp
	151IBt4zKMC2MrVALBCPeCDcSkwXAxCcXhAuagaSLYc4b1qCswDG
X-Google-Smtp-Source: AGHT+IEFNbcnZf3R8IkyRTJKxfZ19fo6znhbgZ6oXmeQ/PdJfLfA9dofuZxxW6koajZc6kojtKVT6w==
X-Received: by 2002:a05:600c:4e51:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-440ab79f582mr89351575e9.10.1745835937187;
        Mon, 28 Apr 2025 03:25:37 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310ad2sm118825295e9.21.2025.04.28.03.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:25:36 -0700 (PDT)
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
Subject: [PATCH v4 8/9] i2c: atr: add static flag
Date: Mon, 28 Apr 2025 13:25:13 +0300
Message-ID: <20250428102516.933571-9-demonsingur@gmail.com>
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
index e2350fcf3d68..721dd680f2ac 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -341,12 +341,16 @@ i2c_atr_create_mapping_by_addr(struct i2c_atr_chan *chan, u16 addr)
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
2.49.0


