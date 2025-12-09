Return-Path: <linux-i2c+bounces-14476-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F6CCAFCEA
	for <lists+linux-i2c@lfdr.de>; Tue, 09 Dec 2025 12:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39DB03097BB4
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Dec 2025 11:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA532E2852;
	Tue,  9 Dec 2025 11:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iJDXEzWu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633A92E975F
	for <linux-i2c@vger.kernel.org>; Tue,  9 Dec 2025 11:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765280490; cv=none; b=GRE0PDvftJqDaY7R+g/Sm+XlxRiEwygC83YsCi6ffAhgsd78voqplD28PMKryBdQGdV0LBllCqgM84Xus/vA6y9PQgsskoIStD/ByVBCe9aJRK33+IPc8DPz+0rxVKd4ExXUmt12Uxkz8RFv+MPZ1FBpdcDQaJeP8h/GxMeAtZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765280490; c=relaxed/simple;
	bh=YXNtV+Vdnj9V5HmbInqMeie6ojhBt0TgobcWxdMwcl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ix78Kvc49kb2WN4cqogoqYwHQSOT0/bR6Tn+ySZZdlOhyo9KHyRSuv+jlVNtg9jPkLXLHZAEdwnBOk49EpigKYx8/9NDvP7iFT3XJpvNvUEFmUqJY6ztZM3SQc4x0ccbHRBk0vMEr2EfoxoMMGdxzS4XiuazytmucU+fLpiw3II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iJDXEzWu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso27851165e9.2
        for <linux-i2c@vger.kernel.org>; Tue, 09 Dec 2025 03:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765280487; x=1765885287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wd3Z4KYvF0dD65L7DPvviKR5Z1NQM0iwjwdQuL1cHwg=;
        b=iJDXEzWuVzFyc3c8jk1noOc7EiDdjWzNXDqwFg941t4Rb4pcweHAVGHhxd0HZmFBV2
         Vd6Kzwc+LRMeB/8XDX7NTFVc53Wkz2YlPZErer4qslXAQKiI+qsUSBP68XPn95fIEXDw
         dWK5wkqkHOvMApBQZ+dIQwTMZs+ueajoSTiRVdvZKOyt7BxOzChhJtb5QjHIInckkcuL
         N8fKkprVkEetfDmNf2q7zhcUa8KdWZQr4pzVazAYLQhEH/H282Xerc9UrI9AUSoyp/kb
         hvcTMh1b/ywbP2886Rqxp4nuH/1ufASyc2QoyBY0ABVL5MNJwwyRAvAUVhNNB8nUhI9C
         Xnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765280487; x=1765885287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wd3Z4KYvF0dD65L7DPvviKR5Z1NQM0iwjwdQuL1cHwg=;
        b=F4Ue9Gzg1fTqWWIlgHWJ2qM2dxjxtNQwnBc6Y20LTq6aRvhGLeqXrh3gwssGnMMd+8
         D4BZ7Y3TTI92qgEBb56T5g3M5hgq9gxnIxcr6ioZ88LsoXb6qaMWKdHEmDN+1OeuUIXn
         k0ZJCFxTPveujInup+ouBzwDfeI7sR19U2/EWr16omLy18Bnw63FvTgB3mAmvf0YLyhg
         LVgZc2WzSe4erc3p0js/LsKX5o6SMFUrQdooN2ZlRnM78w5aKZ/H/mxUah8ApKYXgdb1
         DOP0WDacVYVkuPN/L1TW59FRN8E4aW+ST20JuL31jec3e8iPGSeqPWBwUKDvjFtS49jj
         bapg==
X-Forwarded-Encrypted: i=1; AJvYcCVsjxNRu940RKLzcKtL1k8XY20ddN3Fzai3bUjol54Gi1X9xYRCwhCiCThaxB29WRCq/0YCVn6y7Oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnGgcQKgHsRXcfj9cTYHpScJ/owiPMQJHadc/dfh6a39QI46tM
	ErNgrKB8ojyRAP3FYHx8m8EnT5bpeZ/8Ta3t0+Kp/xCKfuQnnZmuZarJUbRTHK7F3/5dM01thEX
	nILvc
X-Gm-Gg: ASbGnctC/PGwgYUf37u4eMAti4VldHkf3aw2r1S83VlP0aKplcTFuldOp9JkI5ZWlkl
	2YS3W2L1ubYOTtKiG4YYldZZ/jgB6BKrrdcXfQ5klFWS2D+/69zoCh8OcEruL6VlcVsev4kbHJY
	kE5QvIzkwjdt/Xmk/kTKbjLSuJh12TRG0pz7ilOTdQul842jLOJjBHchLLOI2IbWuQJz8cGkz1h
	jDhZuL1tX4yOl/1Tff6Ad75YMa1Fb6+cScKZe2eKCikpMYZS8+IzqW9IcIaM+hM+Og/YElp6vWq
	WekqYax0Wq/4Nz0SJQYnlLZZmtV46d4BUiETRtbtJu93tl7W2dnvT6efXPB9HuqT9aRRHBwHRDG
	6wsqYs3L8zw2tK1wJWif9XBIlzUCqJjoXTFMYWyJ8luDkryACsyttANeFeYHxfOXWxonI/zd0xw
	Mib3TpiTMgKnaku1p3/QyYq5gZX7ur1mgpZV+1CUoeWZSS/i/OrgsNzNBjXv3hvM+wYXVer3WDz
	aE=
X-Google-Smtp-Source: AGHT+IHHuEvpcoKORlw30IlhcBh1e4pcDw71sf4iDJdmgzkWvf/FjxDAXF+Ko3/c/puYTdhF2sl9Aw==
X-Received: by 2002:a7b:cc17:0:b0:47a:7fbf:d5c8 with SMTP id 5b1f17b1804b1-47a7fcf1a0bmr9909865e9.26.1765280486547;
        Tue, 09 Dec 2025 03:41:26 -0800 (PST)
Received: from localhost (p200300f65f00660846b2ba6e435ad603.dip0.t-ipconnect.de. [2003:f6:5f00:6608:46b2:ba6e:435a:d603])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7d331a4fsm34712660f8f.33.2025.12.09.03.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 03:41:26 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: Ninad Palsule <ninad@linux.ibm.com>,
	linux-fsi@lists.ozlabs.org,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/13] i2c: fsi: Drop assigning fsi bus
Date: Tue,  9 Dec 2025 12:40:28 +0100
Message-ID:  <8a36a0dba809d3bfe225627fd178daece10ff6a5.1765279318.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765279318.git.u.kleine-koenig@baylibre.com>
References: <cover.1765279318.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=799; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=YXNtV+Vdnj9V5HmbInqMeie6ojhBt0TgobcWxdMwcl4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOAq9zNegZqa1wjuAOOn4xg/8fl9JG81iUbT8f Tc+6+Zews2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTgKvQAKCRCPgPtYfRL+ TiICCACH/a6b/DA0OoKBiD1H/ZF6cgKeZWRn9faoWbhmFszSfpE4w5/CavC/ChSDHOFRrzhykfU M2DU3MbnWz1gk59midovBAEfVIHBUEeW/dBnvyL0DYrEQ0bE9C85cNDIjrtq+4P850X6m8sw2p0 g6rjAIXGhQ+fXkfmh7xg7bwEmNC7F1uxetrtJ5zLjGwWyxCxOz331plNdoArKoiP7JuJw9vMadO lC1tarO9a6AmpZ5qbVR2xZ3XpID0/5On/vj3peRrmZLaIXX+wDYv8I5PS0YWuuiBwBq8gYu+V1T Py8Bsrb5maxD4KeVfAVLstDv92Gs4SWIdOCqmnoYMpKYM9se
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit FIXME ("fsi: Assign driver's bus in fsi_driver_register()")
module_fsi_driver() cares about assigning the driver's bus member. Drop
the explicit driver specific assignment.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-fsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index ae016a9431da..e98dd5dcac0f 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -763,7 +763,6 @@ static struct fsi_driver fsi_i2c_driver = {
 	.id_table = fsi_i2c_ids,
 	.drv = {
 		.name = "i2c-fsi",
-		.bus = &fsi_bus_type,
 		.probe = fsi_i2c_probe,
 		.remove = fsi_i2c_remove,
 	},
-- 
2.47.3


