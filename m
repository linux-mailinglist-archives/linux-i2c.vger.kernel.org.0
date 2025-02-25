Return-Path: <linux-i2c+bounces-9575-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42570A43DEF
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 12:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC1903BB7D9
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 11:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21D0268FFD;
	Tue, 25 Feb 2025 11:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mByTob3X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A35268FDD;
	Tue, 25 Feb 2025 11:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483603; cv=none; b=ikIE3T8yvlj2OXD4yZHbhRHupKHBugoOLoqzG4x33EfgXhPZc8H/w333OQ9PaV5HDQ95b3b1NgbQ6fg19KcWtBMlB72i4RD7vPr6wqkHOXQcfAhERXqo2ZNWm8txqPoBAiP15WlTUjMopGqhaqoAKlQ49c0Pctd7YPjNZIWjjlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483603; c=relaxed/simple;
	bh=09Sp2mWLnAegYNwA8F2u352PpyBaXNXliN8Ag4OkvzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cx4IHrsoX+sGLT9KY3KRgy881q9w73RTZBXpS61oZ3+yjGs5qwxmpxMr5ymnagl8MQRPLvUL9X9BL89X6JIpVUPpPsf58xnCv97JotdDCPFxvW2XNqURMVsy5hYm+ChTorpVvubUEkOlstZDFC64eQegNpfTWZjYwZBSmYmbnpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mByTob3X; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abb8045c3f3so676366266b.2;
        Tue, 25 Feb 2025 03:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740483600; x=1741088400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLO2Wt1zOV1CJ5zuVwnVC3DTITBXMZP+UbGnpAaCAMY=;
        b=mByTob3X/WbaMFhuGvkOMnJkFtHp9uTV+LcXzORSJUB+QEclUiBE11UPceme2sifYf
         WVPG7/usYmDdKR+JS7QbRvEzFkY7dGz5bYKrXTZpqFA3sZtJlsFMbph9dXgbeDzwcc+d
         cwPxnKLOq5LbR9aqCHGsANKD6e/D2NA7pk2UOPZRFR08V+2AdLEfijiepZqcBjdltfQ/
         r3D1/7U4lNobvvdL2P5n9HdrGClc/ymdl6K/Kz5f/hC2BnEf/6zeBBBFeK3qNhqqDvG7
         Cpd8aFL88HeF4OuGP7jDUH48sNF7GkFGRV7F6ahJM0jYP+dY4Y8LhkGDMF7jwnBplqbF
         5Vuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483600; x=1741088400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLO2Wt1zOV1CJ5zuVwnVC3DTITBXMZP+UbGnpAaCAMY=;
        b=Y5gSl8uB/dUJc0LKZCJhIJo7wji8Al4FTNskIRxKZaWrFj40YidCKjVTrariInM23/
         oPwZBnWchBIrKQ8hW7S2PkbbQpXSy6kpG1xrghe+23ZHbOKyWL7qjCuB1aXe0hP32oYy
         O54fCGyA6zSCY+K9JfH2xgOVa1Yby06EI67809vr0iRw+7gbzS1/xGqKuaEf5y7T0PMT
         XowsqarcbyPh+lOd/Vv42A6cy/j/pb+ml/ifqisQVoC8C1sn0IvdRUe11YcyD/86Y1Pf
         Ayisu9j5vk1i8/ZeoIPhfPdRuwNiLNmyYUTw6NQPLiTi4Yz0pCsxIgYRY/dy43B2+/UC
         exew==
X-Forwarded-Encrypted: i=1; AJvYcCUhD0mNRBYUBebKFC3xX0bNVvVS16oi5nmbMIm7fQGIJXb+07PygX1z2dk4eQz7+6GGzB9k2dilEKhDTXRG@vger.kernel.org, AJvYcCWfBXgGw8Ql2wQk7lec0JaZXtlprL3ZvbJ+7so7x7bgEF5/FFUTvC3XN+sITClFizMGIidW1Lm81mE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDN/6lxyOsW9r61Ad5m5T/6RIuOz++pnjNqu91SkIxs+EV4vd9
	QLhDXArsp3AFqQ22KWXQoJ0zZjiNvaYW+fiHD3VyMo4P1KVSmTi5
X-Gm-Gg: ASbGncuoUCiWMcO5R6RmHeP0lEN86cRxNDrLqyLVEHW6k+nPb1i15ubHb5IxoRQ5eA6
	l0Y+kVC9w3aB4YQj3hOVt8nQbqcGVEwMH2TnRorm3utrlDWeFN8iHHPqVHxUDPXmzmFK4EvVFTM
	BRyV8ASaXdKcFQmJnGaNxRim9g/O/+m212XN4CHamWJD8R9X7Y7S1n6V3IiIABkvMUdgv50jEFq
	OR2X3j0rS4SUAA0tNRkTfxEf1PKEL7HE2jWfRtrDPq+V/1VA2L+aGioZOXEsP//P+0GhM9Fqg4O
	TFzoF4xE8p9n+3nd5ZDS70Krq5NoifQGUuBvdVM=
X-Google-Smtp-Source: AGHT+IF8P+MAckBDQjFe1PQsS4Rk01Tzs/TC2jlZ9olXvr5z+Ya3lVc7Jp7BfoON9lcNDneOHnWEMQ==
X-Received: by 2002:a17:907:6ea5:b0:abb:e6e1:22c1 with SMTP id a640c23a62f3a-abc09bf55bfmr1984381766b.35.1740483599961;
        Tue, 25 Feb 2025 03:39:59 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201231dsm125510166b.115.2025.02.25.03.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:39:59 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 9/9] i2c: atr: add passthrough flag
Date: Tue, 25 Feb 2025 13:39:37 +0200
Message-ID: <20250225113939.49811-10-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225113939.49811-1-demonsingur@gmail.com>
References: <20250225113939.49811-1-demonsingur@gmail.com>
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
---
 drivers/i2c/i2c-atr.c   | 3 +++
 include/linux/i2c-atr.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index f7b853f55630..1986fa055f20 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -394,6 +394,9 @@ static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
 		c2a = i2c_atr_get_mapping_by_addr(chan, msgs[i].addr);
 
 		if (!c2a) {
+			if (atr->flags & I2C_ATR_PASSTHROUGH)
+				continue;
+
 			dev_err(atr->dev, "client 0x%02x not mapped!\n",
 				msgs[i].addr);
 
diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
index 2f79d0d9140f..b3797a930a7a 100644
--- a/include/linux/i2c-atr.h
+++ b/include/linux/i2c-atr.h
@@ -22,9 +22,11 @@ struct i2c_atr;
  * enum i2c_atr_flags - Flags for an I2C ATR driver
  *
  * @I2C_ATR_STATIC: ATR does not support dynamic mapping, use static mapping
+ * @I2C_ATR_PASSTHROUGH: Allow unmapped incoming addresses to pass through
  */
 enum i2c_atr_flags {
 	I2C_ATR_STATIC = BIT(0),
+	I2C_ATR_PASSTHROUGH = BIT(1),
 };
 
 /**
-- 
2.48.1


