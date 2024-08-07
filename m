Return-Path: <linux-i2c+bounces-5191-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A5194A4FC
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 12:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AE8B1C215A0
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 10:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4D21D3624;
	Wed,  7 Aug 2024 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDc6N/CG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DD91D47B1;
	Wed,  7 Aug 2024 10:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723025045; cv=none; b=lhV/ANyWq50hfzS8YluqtIsE7EakgcJt7HlCysXEIKHIxH1gJxjoytd+3Ub2LB28PlQuxLn24juxKchioH73LQNEzrc4kCYJs03I6cxxBD3npp/t0SCX7NNmESrzI9vI5pevdCqUhHu/5Aorby1rfvY1R+ispDrz35rvpAanmAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723025045; c=relaxed/simple;
	bh=sHXCEL6AQnmJEjDnggM+aJvNWrCPKKtV4Yz80r/JQbc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=WlOAr25hWmS+IKIoW4Klh3+qWwshaOGJVADAuJ0BB2L/JrgufJ/oZ9gOeTdy2QlYIRdXXaLcakKMAP8OL+MSNl6al3uiRdHQUx/2GeKL1ndew2vyPFZD3T6FSY3QHMJ9i+PAakHalnzhgQ+8buydBG6NOpHd/ynSzxtSkvZz2J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDc6N/CG; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-710887a8083so1237704b3a.0;
        Wed, 07 Aug 2024 03:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723025043; x=1723629843; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1JQZAPTxcfDOXPbIWl9UOyALCV+YMvtNIVhFTIQlcJQ=;
        b=dDc6N/CG/tOv490NwD3SqDLCcgLxHxAWkm428UJSWGg6oMfrk+dNASB6nCmIuXWZwG
         W+7muinaO7/9wBaYc/ohruNhO9wqGyuOkKWzNRwyteJ7OVUgsMgCuhgXNlvSAPqQdVj/
         5k6Kn1XNsPn9CMuuVYOVjCuKMQAiXFmbU3L3ETo0Aj/YSJL3pthUuRQ/uL6seF0upCpC
         2lCtgon367FKHWhE0Qcy+X0YS1cJw6MpRsvqaKN+cfgMX349JdIsxLhuZ4oZoyaAX36T
         zQ3/6Wy3NujfLKnGfaDhYVowB46+sdkhGyi+WtmEgFUX2tDQJTDgT9KPH5fzSnUuURT+
         Dsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723025043; x=1723629843;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JQZAPTxcfDOXPbIWl9UOyALCV+YMvtNIVhFTIQlcJQ=;
        b=sieVBwx4aJ00a9Swn/NWEu2BWoHftyHdQbn83DD/nlAO7UIh+vPqdm7JuaYBFHdUHq
         mpR9O3dvq4+IIxy+3HLO1xk/vJw0huSiEz3Xc1UOY+ztPU8wUx7HtBO5U09f7tzviloU
         Ps6o8qknyucnhKFBQKWgWzn/gmacb3N+OFZaE/RCnEERrY5Qve8suUSGmFj3lA4zi9Kq
         VP1hJ2QDOQ4jDljTtIIhfMIjLiSjAFy3bqCWgAZMLZuKWFQcqGo9Hsp//MlptnzjkpUF
         WgOi4K+s6lHda4juSvJ7XQWmiOimPLtKcaNTFrvzbmofj+keygRfPw1EK6d2oVouLZND
         UsOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYeZQKUPZPg//s6Bs2ZTImGlPdWgpdHjQPSrGyM+NxSXS0x8WMDYQe/6HnUl6UENlvuOHgjNaR6rJcPMHfZ1+Uu3LwVVA5agYK/cfC
X-Gm-Message-State: AOJu0YxY3LyblQoF3Wlsnmu2hvvKmP5Lv2gO7RyQ97KfS1rD2XqGy7gf
	lMFA+uYlOPkIyOBU/DUhH5jX6uMUjNFhAZShHdAQoPIT76nng8w=
X-Google-Smtp-Source: AGHT+IHLo+ice5A1u5x85W8GsjViC9J2LkR5NJKcSzy4BETbX/PdHIGxniL82sI4lZtiaksXi+tBjg==
X-Received: by 2002:a05:6a20:7346:b0:1c4:986a:de71 with SMTP id adf61e73a8af0-1c69960e1a1mr20396150637.35.1723025043040;
        Wed, 07 Aug 2024 03:04:03 -0700 (PDT)
Received: from localhost (2001-b400-e352-b705-880f-4661-e7a1-4abb.emome-ip6.hinet.net. [2001:b400:e352:b705:880f:4661:e7a1:4abb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ed15a42sm8111594b3a.182.2024.08.07.03.04.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 03:04:02 -0700 (PDT)
From: warp5tw@gmail.com
X-Google-Original-From: kfting@nuvoton.com
To: tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com,
	rand.sec96@gmail.com,
	kwliu@nuvoton.com,
	jjliu0@nuvoton.com,
	kfting@nuvoton.com,
	warp5tw@gmail.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v1 7/7] i2c: npcm: fix checkpatch
Date: Wed,  7 Aug 2024 18:02:44 +0800
Message-Id: <20240807100244.16872-8-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240807100244.16872-1-kfting@nuvoton.com>
References: <20240807100244.16872-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

Fix checkpatch warning.

Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 1af6a927b9c1..dbe652d628ee 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1783,7 +1783,7 @@ static int npcm_i2c_int_master_handler(struct npcm_i2c *bus)
 		/* reenable slave if it was enabled */
 		if (bus->slave)
 			iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR_SAEN,
-				bus->reg + NPCM_I2CADDR1);
+				 bus->reg + NPCM_I2CADDR1);
 #endif
 		return 0;
 	}
-- 
2.34.1


