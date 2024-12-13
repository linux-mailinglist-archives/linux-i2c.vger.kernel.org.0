Return-Path: <linux-i2c+bounces-8496-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D459F147E
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 18:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 774D3280D94
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 17:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C241EBA0B;
	Fri, 13 Dec 2024 17:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoQHTe4M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED001E7678;
	Fri, 13 Dec 2024 17:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734112718; cv=none; b=QmuTZVDEIILEDGdO68SCiaJhEj+YNsoyICTSrBQkQrYVO0d1oOTo8vpzsOmHGFcdRk3b3Kc9GLADuc07Z0CBF2PocVTcPO4B7vVO2MTvbCua9gBGKdQQqQVlTd/NFG6BVfIlyns6DoeIHfZ9lVtzPr/f2a2VLk+P86/UT6mn9kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734112718; c=relaxed/simple;
	bh=owd0zn1P5YfeNkYMC+oUSuFlHqUQWKes+FGyKpfhQiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4Qssf6R612kieiu71c4CQgkbDSrjK6WuEBZoKO9Fp53gZX/7X3x8Dd8zAgW9Y5beb+QsJfzI6e0+IauhuXS505EQ5ldCPUKtwyCh4y0G2oE4VpCpk0a4G17/hvZMHyNNWKmHR9uMwLV1t5xyttcLvHf1h5QrqvmgagUUtFWY98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoQHTe4M; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385df53e559so1623667f8f.3;
        Fri, 13 Dec 2024 09:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734112715; x=1734717515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaLlRj3ObamRETdZi3/ztjW/T2zRB+N3Lr9QOtAkYD0=;
        b=SoQHTe4MyI3oCh1N9dJDjCGa7nLyAvbc2ypJYLT0Jnpz17dpe7lZxRETaahj6v/EQN
         aLH7NuwyhYpFhngBcK/ZlI0le1kXyyfC+GOKELWP5WbLMaoAzn1kCUUbuDQ3t7DaJw0H
         kzZa6aYrc8cOExic4ftrdpSOd3vObS7Xj95LInVfbsEuNCVspKogAvvemvXfhKQmpzJZ
         U+mc45Z+1KcvgDncl4xFa8A1YdSoSFQcXS9VZxHdAUrSEEPCQyI8gJSb5YHyNCwnqNpm
         vCJzIWdCmGUpKW/5Q0e7FMg2/5SJ7TwqkwMQBo+ubIsGJiuIWcJal1zUIR8l6kitcQ9T
         YTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734112715; x=1734717515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaLlRj3ObamRETdZi3/ztjW/T2zRB+N3Lr9QOtAkYD0=;
        b=gtRH2MLsRGVoWO80autOCuO9N4cMcWsCRWa1FUT54dtWZ2dCxygIM4raKV1F3q0q2Q
         Hz+3hhXvzQV8HC47Ag+BAwiT4pFBhhYDv3lDquIWo8uf2KsFv3171lcJad7vOQciEp42
         +xyoZ4XrB0bC8GGcra0+ZTWyhREz30PtlQbg/QPVclqO99G5gEi9d070wHpTyhnhEtQS
         OtcMkZCqkg+Ivwe+AbfdzAZrJFkBSr8oGrCR+/cMMrfXBO+pHljAHgITKC6QGc0d7WeU
         A20hfUEBkXdUz71aU3pYKzKTMzidZ2KhKM3Y/PUKcYpu+RixC2htE0zaix3x8o4Be3cu
         sFNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnQh8P4ImyrW5ytmKdOHdCm1TB0lbFMmCghnjNOhjSShfwYeyF79Kr9AdaSX4+f0l1+p1MnQ2GiyU=@vger.kernel.org, AJvYcCVdTx7cdcw2C+JFtJPhnNTF6tM7yJTgMmF4BUuf+DNJbqlJaeyyi+AP8y0V8P1kmgOqqmhIhUffmN0Vfkls@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0A6uPZna2cLGbHZOwBN7l9POjTN0ZyCZDEigGyfcxAapNrnUJ
	h4Yn2U76ewY50shxo5TVSGq89q1LjQm/MoHp8Yyx1Mc0jUsD2Zf275rn9g==
X-Gm-Gg: ASbGncvRmxG9l+8yciHLNVnQQVXhHPlX5UiH9UbmspmYkgop7ETtHxGrXuCUqgtzA98
	F3ANt6z67MVF1BlXqmtFxHofo+11I9VVs6M4gXE5VIgh6OqOnjv5YbflnQgfEvg18FHvsJdDcZV
	5KXToAXzvhc57Weyza/7bWXhnwT0uTXSYwM4/5Jsn3ioOdfLWTYet6Wcp4lMNT8EUd4yd0YYjIw
	nuioBMC4Egk7uMywFR92iIG8ZUUC80L2ek4ZhlollAVHAGYmVLRqEzO7ubi3ikcRWrecKAXhQes
	mFUXk/i3Iw==
X-Google-Smtp-Source: AGHT+IGM2iCVKSaOg2DupxSNUtFLUFBnepSblvZs1s4dgrr1Uu7AOUZYvAO9rnQwyUgNWxIvzWbb1w==
X-Received: by 2002:a05:6000:188f:b0:386:3e87:2cd6 with SMTP id ffacd0b85a97d-3888e0f4779mr2647388f8f.38.1734112715063;
        Fri, 13 Dec 2024 09:58:35 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:4eec:e99c:89a6:d7a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c804d573sm119088f8f.64.2024.12.13.09.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 09:58:34 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/9] i2c: riic: Use local `dev` pointer in `dev_err_probe()`
Date: Fri, 13 Dec 2024 17:58:21 +0000
Message-ID: <20241213175828.909987-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the `riic_init_hw()` function to use the local `dev` pointer in
calls to `dev_err_probe()`. Previously, `riic_init_hw()` used
`riic->adapter.dev` in error reporting. Since this function is invoked
during the probe phase, the I2C adapter is not yet initialized, leading to
`(null) ...` being printed in error messages. This patch fixes the issue by
consistently using the local `dev` pointer, which points to
`riic->adapter.dev.parent`.

Additionally, replace `dev_err()` with `dev_err_probe()` throughout
`riic_init_hw()` for consistency.

Fixes: d982d66514192 ("i2c: riic: remove clock and frequency restrictions")
Fixes: 71dacb2565ed (i2c: riic: Simplify unsupported bus speed handling")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 7ab32aeead4b..d01bb52d86ed 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -320,7 +320,7 @@ static int riic_init_hw(struct riic_dev *riic)
 				      : I2C_MAX_FAST_MODE_FREQ;
 
 	if (t->bus_freq_hz > max_freq)
-		return dev_err_probe(&riic->adapter.dev, -EINVAL,
+		return dev_err_probe(dev, -EINVAL,
 				     "unsupported bus speed %uHz (%u max)\n",
 				     t->bus_freq_hz, max_freq);
 
@@ -356,11 +356,9 @@ static int riic_init_hw(struct riic_dev *riic)
 		rate /= 2;
 	}
 
-	if (brl > (0x1F + 3)) {
-		dev_err(&riic->adapter.dev, "invalid speed (%lu). Too slow.\n",
-			(unsigned long)t->bus_freq_hz);
-		return -EINVAL;
-	}
+	if (brl > (0x1F + 3))
+		return dev_err_probe(dev, -EINVAL, "invalid speed (%lu). Too slow.\n",
+				     (unsigned long)t->bus_freq_hz);
 
 	brh = total_ticks - brl;
 
-- 
2.43.0


