Return-Path: <linux-i2c+bounces-9571-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9FFA43DE6
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 12:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E92BD3A6439
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 11:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095732686AF;
	Tue, 25 Feb 2025 11:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8HNp2a0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3169226869C;
	Tue, 25 Feb 2025 11:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483597; cv=none; b=JKSIVdatUfZ2cxnUaSMQp2r2cMov5EuPHBX7ZqQ1NqOtfRhSr7inZ0Txq0XkELqPczgwHkiwkwnwNFCmQYhglzfsbbClXsAhzXRI2u3i72hbE2LgPJXDneFuxdPQHiURmACQdaLng7u9M5lM8swNOOBMPBus9F8pdZ5nZbLN5EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483597; c=relaxed/simple;
	bh=4PY50C8Avc+lTFpH8LdjHloYwAHg3iwYhHX7DA+Cyno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oUYKQ5+InqAZDnfZxyCyDzjzZyW83QSfEDCTpMTTtKq9QMxdrKf8VEWpytLQv07kfd5XdCbbqUpIPWkkICiYg9688/qt4Rl+A8g1gIYOLYRkzKgYXOEFz6+XxnftvJ0p9FOzmiQuHnejLAtyzGYQUDQmAJ/7LI2VebJU3q+9tMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8HNp2a0; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e04cb346eeso9138329a12.2;
        Tue, 25 Feb 2025 03:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740483593; x=1741088393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9kWaCJhtkh0bPdMO9DCBTqxCndKa3EBYb2BxDOBS9s=;
        b=c8HNp2a0qMI7MJYmUcswG6eBuOohlAcXNUou/q2nQcwlucdSpeorr8oieUC5+PdzMO
         P03qDP1ZUqc3ZG1OhUXUWdManvU5f7NCICzT//0Y+pUsGImFbcMM9/UASw/YFgeo+sAj
         g85j0IBoZTWUvZOvBFEWhHJycowJRFIXOlcULilQIbXSEw2bXYCk5ioMMbuEUL+xT9wQ
         gINSn2JDcKgCD2CrbCIejMdbcEkT5b8x0xc/PaELUnB/eFATOTrjUROLpKBZiWZBRy9m
         duzDreTwBG+mOzl5EYNFwvV3XJUUnI8WIZsgjGUTy3B9hUK3JaAiyRt3BKCx4wlIpd/x
         T7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483593; x=1741088393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9kWaCJhtkh0bPdMO9DCBTqxCndKa3EBYb2BxDOBS9s=;
        b=m1FowLqjSyLTajIF6HLQjFlqydS0NKx6H1Pz2L4hcYASZVs5p89LkIye55A5jat0Ie
         5oRfD0IxNpzUf21P8OMcvJO7BLhBqhds2pyghxEBALbA/CDTzlrQwQr2ec51SW3hAgu4
         gqTFoFlYrTIs0ZVhBKbEWBVg3Rth1b7Y7vvahB5Qotkfj61cLZljVp7ZiaRrghpGO9T2
         DTnc0QRK2EKhl8m2ZEtx6fUht5zjlDsaXmDdcDR/NRLoya774/53hB4M9XzoiZZaDAf2
         xhewMGhY8vkpPAXaJoVvFKvpfdvBuhX60tkmhpKdnhIHXl53jAE90u5HMTnYH0s8NDHE
         xTyw==
X-Forwarded-Encrypted: i=1; AJvYcCVT22/1OVhXRF+qTJI9j/CwaEnTC/hiOn1FjMPrrU3usYlEM4/CYObHoruxCG58C0nHbAdEqGHIIJGuyxNr@vger.kernel.org, AJvYcCXhrDM30QbcX0YGglrVZprBObAuZHgJykLC8rizOdeHy1765Z1mXc0BVmhfMMgXM2/3KZ2y9GxI/2o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ayblTple8afLDIuA2q1wrUNjgNzGL58pScSYftVYanazktcN
	LAX4Emcyu4LujPK3lNU/h/nmZEJSYayhw0yv45n0+FjA7KTb1GXa
X-Gm-Gg: ASbGncsgMPpO0vKMu3RTGV/4k2JiSetg0ErFnjSRJny+E6rXdROuhUF3vBYtsh1gdVv
	k5isGpVV45QVjKnxZPBiQSjiF/vMERWRlzy/J23RA94yiAd4BcYIKBwBtZNQuXT05TxVASqYK32
	KlOSgMIvll9FBa2zIU6lh+BAd1NnIx9pHcl0EfzgNCs9PPmUwEiAshxBGHNTHKtgOeX6bHe1vX0
	tJGjQiVgaRgkeUpu/P1wrNTIu8ZBu2Ke9ILu5JJHY6CG+tqojlGOTsbJ9govn69olxnfzUUEdX/
	Pv6mGsVB0u46efhxSbM9AXJU71oUKN5jhMVSvas=
X-Google-Smtp-Source: AGHT+IHP+GV77v428hueQ02JWwug2ZEcOVkY9IMYLBrI5f5rrEbAaKfIEc4ah4LFG4fuz4Yc1BcyaA==
X-Received: by 2002:a17:907:944b:b0:abb:c647:a4c1 with SMTP id a640c23a62f3a-abc09e37de2mr1881348866b.52.1740483593466;
        Tue, 25 Feb 2025 03:39:53 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201231dsm125510166b.115.2025.02.25.03.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:39:52 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v2 5/9] i2c: atr: do not create mapping in detach_addr()
Date: Tue, 25 Feb 2025 13:39:33 +0200
Message-ID: <20250225113939.49811-6-demonsingur@gmail.com>
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

It is useless to create a new mapping just to detach it immediately.

Use the newly added i2c_atr_find_mapping_by_addr() function to avoid it,
and exit without logging an error if not found.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 9c4e9e8ec802..b62aa6ae452e 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -586,10 +586,8 @@ static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
 
 	mutex_lock(&chan->alias_pairs_lock);
 
-	c2a = i2c_atr_get_mapping_by_addr(chan, addr);
+	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
 	if (!c2a) {
-		 /* This should never happen */
-		dev_warn(atr->dev, "Unable to find address mapping\n");
 		mutex_unlock(&chan->alias_pairs_lock);
 		return;
 	}
-- 
2.48.1


