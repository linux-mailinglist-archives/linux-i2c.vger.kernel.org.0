Return-Path: <linux-i2c+bounces-10873-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5646AADEF8
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 14:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A2EC3BB4B2
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 12:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDDD4266EF1;
	Wed,  7 May 2025 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQWiZG9h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017B6266569;
	Wed,  7 May 2025 12:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620381; cv=none; b=rhUS+VZJq2XZ5UL3SDAupkGyzcBvN+/k2/g/l3HjsMlD5ZH8LMm5gPIT1W0pD+7PfffbRzixHoRyoEfG56ew5Zn9ELbo1YzpVvqxGWhSTsxlq5+Z/VBRqlVrb0xUw5InvDUZxrmfFz+Nn6J7IuH/iIEUiRLeS5eq/wAT+rWDNT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620381; c=relaxed/simple;
	bh=3jljKQy3JilUwk5OeTWzq9vI3w85PUGJDm3mDHSbT8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMDzoUtxj50ptqGdN16vbI2gG/rMnRPQS4BUNuU3Yv8G61A1U7Xxbkh5K4AiFtPQhoHRCItT7i4jMOEnAQcazg/nEWvg7/POv4OGxaOKEKsk1uq0IBL4VPuhVwqZwTc5Fa8+dVG1rylsbPCRwEoTlOPPkjjAItMwP9S8juvCrMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQWiZG9h; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2c663a3daso1369791866b.2;
        Wed, 07 May 2025 05:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746620378; x=1747225178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ou6MOwGHqD731U9gMCJRk94Iq+LGR7LXnbZdgEjcxuk=;
        b=EQWiZG9h5D/duLWlAvxLI7EWqe8+Fpdou0w9enqahUiRr4GDD65nFRnZqGjAK7+vXe
         zFA8z/X6ZaHGCPeKukJv1t/IMK+GxXso9tobjOyLEG8o07SsakwIO1MYDdR/Ey/EMQNS
         eZ4Pg323rtvXdlGMQHhJo7J+FIqUS3WN3F/6SYpxyUp/JwDD3SDpR4X7/HEmIPVQreG/
         OutK8FLGHq0uxcVoCVSkPM3Ee4ZGaxv+r1T6hX79qzZJTbps5YLCTVBiWs7O7Liq0Pb3
         +UybsfXXvbjuLjj3PdtpDecjOvNJ8fvKuoRmqraGpXca+D73YcQjlfdBicn/w4PFSD/J
         7iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746620378; x=1747225178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ou6MOwGHqD731U9gMCJRk94Iq+LGR7LXnbZdgEjcxuk=;
        b=nAZA6sWlTUP63fyJu5D8pfkBK7qJyBwToSU2lhN5NhyVmTD3uT7knq5h/lX1WM38AQ
         Ie+XKbEpUHRtK7C+krJy2TKcfZMF81cKVUct3RT1lglMeF1OOxJJwcwIHrpt0gYXuH1s
         +Qyby537JOwzMuC91wwE84dnxlBuXXvjinY2S3xmxN2iaNozrzXUWOAha1PucG5pta77
         ZrDSbCSaKbSmH9NUTJp12AhYFV5Jp+ppLG86pztbAa+AOCvtNMODD9/UEeIirYj3JwUz
         RpdWYXJQpVwMpRUtx0x9RIUNnPLGUzh1Z+BHH2MFQemh17scHhWDgvgWxagffCsir+mc
         THdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0S/YjkXCJJvCKlGOoNDPDDJIzYPlrWgvY9yW1Dqf3s93REX5QSBpTSgzwp0fZC8jfOs7dHO2BqW9v5TE=@vger.kernel.org, AJvYcCVndks3EntTDkbpcOH/F2Q6f0nyk2O38M7EMOsiKXzwMEmFe0OUOgbiCu81dW3snrBrxisRIcZulFhZ5sT7@vger.kernel.org, AJvYcCXr/iF44hGZR9NQLF2r/6KE0ss90oBI7j4tUeQ2F+8E7fk03etol5dU0Mrfb5y4LmcvaYmxE7oxuA8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4C8os3QoDCwHmN57BlDFyRFCWTgrY14iBOIkachj6R3xnAmEH
	nBxkOMqrYog2q2cfB1e+4JExzY1NC/IigscxnGAA6btP6aidJbhw
X-Gm-Gg: ASbGncu4wecfRCPdyBUAv1r34VO/clI4TiO9bdYoYVEIbBT8THakaL0g4msN4/nKVsg
	h5yRxg8oflA3LODcuT68K6Twq1F3GqgkjN0jsOm0jXVEq8w7E9BwtBZxShDzHjXZVk5nq/V8wHf
	6aO1XBlMMmFVoDaj/HTGQujOdLo0iG+Th4TXF+gWFYNdIj4H5lB3CEIAeu9HOCbqMHgmTHJ1bbV
	kM7Q2y80zsgdC55OoqECh2ZJxn1cLgHEwQfG0o656FeDetW00+UN1J3gjniN6CAiFXlmLQkVpJY
	SINpoa1cdwM5WCjfBr7FLA8M57swcMEd+XQ1WdAMksAXbOw/0eRk
X-Google-Smtp-Source: AGHT+IF8d4mvPDamh8+NAYSDDhRH4GELbHrWX7qqTJyJjvKWNL1ITeDM9+p41l0nfll4OeRP/pke9w==
X-Received: by 2002:a17:907:3f9b:b0:ac7:ecea:8472 with SMTP id a640c23a62f3a-ad1e8bf158emr308173866b.26.1746620378128;
        Wed, 07 May 2025 05:19:38 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777557b9sm9350002a12.10.2025.05.07.05.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:19:37 -0700 (PDT)
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
Subject: [PATCH v5 9/9] i2c: atr: add passthrough flag
Date: Wed,  7 May 2025 15:19:15 +0300
Message-ID: <20250507121917.2364416-10-demonsingur@gmail.com>
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

Some I2C ATRs can have other I2C ATRs as children. The I2C messages of
the child ATRs need to be forwarded as-is if the parent I2C ATR can
only do static mapping.

In the case of GMSL, the deserializer I2C ATR actually doesn't have I2C
address remapping hardware capabilities, but it is able to select which
GMSL link to talk to, allowing it to change the address of the
serializer.

The child ATRs need to have their alias pools defined in such a way to
prevent overlapping addresses between them, but there's no way around
this without orchestration between multiple ATR instances.

To allow for this use-case, add a flag that allows unmapped addresses
to be passed through, since they are already remapped by the child ATRs.

There's no case where an address that has not been remapped by the child
ATR will hit the parent ATR.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/i2c/i2c-atr.c   | 7 +++++--
 include/linux/i2c-atr.h | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 76d70efdf190..be7d6d41e0b2 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -394,6 +394,9 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 		c2a = i2c_atr_get_mapping_by_addr(chan, msgs[i].addr);
 
 		if (!c2a) {
+			if (atr->flags & I2C_ATR_F_PASSTHROUGH)
+				continue;
+
 			dev_err(atr->dev, "client 0x%02x not mapped!\n",
 				msgs[i].addr);
 
@@ -486,13 +489,13 @@ static int i2c_atr_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 
 	c2a = i2c_atr_get_mapping_by_addr(chan, addr);
 
-	if (!c2a) {
+	if (!c2a && !(atr->flags & I2C_ATR_F_PASSTHROUGH)) {
 		dev_err(atr->dev, "client 0x%02x not mapped!\n", addr);
 		mutex_unlock(&chan->alias_pairs_lock);
 		return -ENXIO;
 	}
 
-	alias = c2a->alias;
+	alias = c2a ? c2a->alias : addr;
 
 	mutex_unlock(&chan->alias_pairs_lock);
 
diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
index 5aaab1598084..2bb54dc87c8e 100644
--- a/include/linux/i2c-atr.h
+++ b/include/linux/i2c-atr.h
@@ -26,9 +26,11 @@ struct i2c_atr;
  *                    devices being added or removed from a child bus.
  *                    The ATR pool will have to be big enough to accomodate all
  *                    devices expected to be added to the child buses.
+ * @I2C_ATR_F_PASSTHROUGH: Allow unmapped incoming addresses to pass through
  */
 enum i2c_atr_flags {
 	I2C_ATR_F_STATIC = BIT(0),
+	I2C_ATR_F_PASSTHROUGH = BIT(1),
 };
 
 /**
-- 
2.49.0


