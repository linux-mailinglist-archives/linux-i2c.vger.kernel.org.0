Return-Path: <linux-i2c+bounces-11971-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17095B0B012
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Jul 2025 14:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC3AE7AF564
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Jul 2025 12:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341602877CF;
	Sat, 19 Jul 2025 12:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDB6CnFE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62547287504;
	Sat, 19 Jul 2025 12:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752929796; cv=none; b=Zr0ZGwyl1jJTZEWYO2hduHsBff0SHpV8WsQ5CEMKdl4JIiwGTi8vqrqgpiHs98TAgioeoJTqh+uOq9f5gYrUPsVZdDlVTwRE3MB6IbDVnqcMV6/B9lG47ds2MnXefynh6zglHLdM12QmYnIKN6CHS+/I+8/jBELjTyrYrUiVx24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752929796; c=relaxed/simple;
	bh=gCTLtnVEWTLUGy/YqhtrwDKE2ztfQikmDUvErDItnQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkncgLAc2/aIPzylZS5c8zL71iZcBtWzoJv5f7Lv+TYH2k691Jmrat0ZgvNFzHJDW/WJmxFawDT8JiHokpPZ4nOI5QoQSa8M8WFLaUl10yUwL11jr7h/Uewm9lS/MKlDFK9MzDw6eVblp+Xy+JRB4Q+rPajzaeFRZAg+px/6I8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDB6CnFE; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a54690d369so2411630f8f.3;
        Sat, 19 Jul 2025 05:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752929793; x=1753534593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G45LkEjjfWLu5Gg4t0c9h2G9tyU2GytQmU3UOMJ0qRU=;
        b=aDB6CnFEBHoMsV/hA9ac3UyjBv5BSxpftZAvTPYwtc4kS1HNbIWFxm9ng8sjZlD8Ve
         j9ueqkLKGh5abso+Xetrt4wcHw/DHcZeTVII0HGoUHOvMIucK2g8EvPNXEA8PemZLkSm
         BDP+K3V29tT01hHf+dPS6tQZeYnqwxCGFu5euP/LE6Y/j6VCQJIdUE4jBn2pvfwN8+Fw
         ZXOuuIinjEpeGdtpYocG64WvnfuDOhp95GfZw067sLB7mY1RzBPorUsAbfXbdFaqYuSl
         c3zla/t3l7YpybCeF2+ARKcd91gLNlVBetwc8TOUyjBkwKWT/AP4EQKw2k+4tu8i0KMm
         zk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752929793; x=1753534593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G45LkEjjfWLu5Gg4t0c9h2G9tyU2GytQmU3UOMJ0qRU=;
        b=ZMBKuhNJD5Mpafws/NKLXInMpwtO8YWC7WIg5nylnVhPL14E4v8jzTD2MuuMzxAvao
         8jLAR3CwhYrf4tG8hz0tpkOcJKRxvSGyPWIHSYd2m8TC/qPwhVs3/N4O3PDGf1/cVhLG
         NG5PQLsstsDRMifwmE6d4D1NAnr2pr5GVoUpX92j9SIuYcZuc1AIW99593673dPlsFSp
         Rw8Xax7IzXIVe5xeZitXX0VN2uH2Ih6EwiIer82OVGGEd0lCiNJ/4NgXN2c++57TS1jA
         zGN/oH7aJ424BPk25MH/bCKsI7ZrKcV6/zLmgbG4cFLFTiQNVYSGV1vBSjgAp0jUd6ex
         bZ1w==
X-Forwarded-Encrypted: i=1; AJvYcCVVt3/bJxgkDJyfhl5qd0axoe51VyWlRzCVyzS5lRm/AfTYQ4fgrwP+EmWbi61hvMUSlpgT1Rcc92Lr13A/@vger.kernel.org, AJvYcCWm9ByEz+rnDsuGLdM1m4Fm3hG3qiedjzQV1pWspsDQ2L9D86l2U00X851mffs/B2PpXjVHPpmY3n5T@vger.kernel.org, AJvYcCXOJHDVDaR65UZpKxj7zUN5P49vu1WdgWo2aUaFFUwp6i4RGZZEmnm8YJ5tl0094fB1+3LKQIPpowfy@vger.kernel.org
X-Gm-Message-State: AOJu0YwjUBQqJr/+veaEK8oTbvXZyn+zqnx/uMofztEWN7VfTBhrSXQR
	KrtPAP+TbcBtN5sY0yokd1eyeZpTg/GCAKTM2b1MO86R8FylbO8KJ2HI
X-Gm-Gg: ASbGnctTogoMmKsGrbEGspqGmQ218woDnC5lxuF5bbBzM7eL0i0vuQlV5QmGKGiFsI7
	5chvKeDysWmODbz2OHi84xcTAgvdflgIJ+axZJw9U/R8/vt0+fCabXCaqhwK/y3GxF1LARvKqCw
	QTrkbCPIL8dxu6iFWXgPiq9olwssfwV83LgJ4y5fyEEeRF1RUawxfnvesljyu5TMHO3I8nC370S
	v44JaCyqJN4Q/5M4um4Z8jQqUEPXw7w+1/OBM540CKIYZmrLIsMwnxZ5CeqoOt0z+Kp7t7t1Tvv
	YBAcCEizMbCLVfqnVUGjOB+zcUFGETWeXHGEVBiSufzaqNpE0jn8NGtXvi0aXQ4o+w2l5+Ipj9y
	xCvTgRYS4zBodzs8mH26h+8UjNn/6TjieRKXBEoFNxgvH1mHUiusGKtQHxftGvFxjVM45y0569Z
	BJ
X-Google-Smtp-Source: AGHT+IEJqOmnIsKpuH3a4tDdiJtXnRHjaCXYYkD0bKPWYqXyqBE5DeAv6RMzSTFPplWMswJA772euQ==
X-Received: by 2002:a05:6000:1a8b:b0:3b3:c4b1:a212 with SMTP id ffacd0b85a97d-3b60e4b8576mr10995429f8f.7.1752929792353;
        Sat, 19 Jul 2025 05:56:32 -0700 (PDT)
Received: from Ansuel-XPS24 (host-212-171-170-230.retail.telecomitalia.it. [212.171.170.230])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4562e81ccb4sm106688005e9.17.2025.07.19.05.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 05:56:32 -0700 (PDT)
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
Subject: [PATCH 2/5] i2c: mt7621: clear pending interrupt on i2c reset
Date: Sat, 19 Jul 2025 14:56:12 +0200
Message-ID: <20250719125617.8886-3-ansuelsmth@gmail.com>
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

On resetting the i2c bus, clear any pending interrupt to have a more
consistent state on the next operation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index c0e13f9af3e5..58c3da92cea3 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -101,6 +101,8 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
 		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
+	/* Clear any pending interrupt */
+	iowrite32(1, i2c->base + REG_PINTEN_REG);
 }
 
 static void mtk_i2c_dump_reg(struct mtk_i2c *i2c)
-- 
2.50.0


