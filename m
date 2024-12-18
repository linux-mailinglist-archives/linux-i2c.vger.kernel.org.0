Return-Path: <linux-i2c+bounces-8582-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6699F5B37
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 01:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AE39188E9CA
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 00:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684D43595A;
	Wed, 18 Dec 2024 00:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1zZgCyP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92931DFEF;
	Wed, 18 Dec 2024 00:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734480996; cv=none; b=mQysAaxdwmOJIW0QR+9ONcTZm66NWZhwL25v2/UXZCOaTiQ6D7B4a5VP+xNubhZDlUdQ/gYpvtgglHLasf6JUQckVs2C0cBNrr2tJKvW79+qAM06heZQSnAMwgaLgS7HfotSWkneiraPREaGeiiWpx7GbXWHaJXrtQxXoPR7Dpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734480996; c=relaxed/simple;
	bh=9Zgdf8GcOmbG5Lek1iph43k0r5RM2tt/ze3lY3aEvCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBaqDecdYGCNj78t/mripnMmn8Pee478rxx8UJuGZv2+NTdBgnqlH2dQaHryUF7q97UM4H+m2RGl6/2iyL0N1vgV6HPI76AmayW7rBF+z4SzrP9J+rYyZkMIs0hafUC60xVGkl8KGgpkAg4EQsMcJjqoHVr7mFUc+GFgthSQrJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1zZgCyP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43622267b2eso61993155e9.0;
        Tue, 17 Dec 2024 16:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734480991; x=1735085791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jdk+v5oA7a+91eT3zlymmBbh68yix47J5FdaOJ1BhfQ=;
        b=C1zZgCyPoIaw6msoRq0O4eNCrGzaF7tB5jWvHpb2IgTMzAOT1g5deOYafQSzl5R3sn
         a2nV5pFL/T7Ml9Kv0WhKwqbrk1qmNA47GBAIHgkcgUwfvNKOVLy+quRtPOc5GnBES1MP
         3i84qEn948CfOV+3tSb7SbSezojNXZmnvBGAlef5vEI+/wam5A6/yaJgNebRBarQ8Zwe
         YSnruydOmInx/W5iuWbYk/WWl7ifxbmcle92xPmKdh9p5rOKxONl3NKVaSJ16w6Z/KTV
         wRvE1NaxSntxuIfZw08KvGI4WINhnh80D2kKfehehG16+IZNBYiAZJCqkRjgR9OGbt/P
         nmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734480991; x=1735085791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jdk+v5oA7a+91eT3zlymmBbh68yix47J5FdaOJ1BhfQ=;
        b=kZ9xXEmUdjDGLKSMDkeF8o8PW/k3yV/ZgMoaJZdDY5SnUidtaF1iA0Hh2l3z5l0pzG
         2N7AHkG13YfCpatJScDsvHvEoCOFVlIhFCOlA5dB0F3RvcaIFGkQRIYEA1cJRjga3WeT
         5eQgUwtDrevuvXFibPT9w++yM0t9RIuOjxBh4MgqkRXJ7AzUdMADiRh+Axd863uunB5w
         JzzsgMpX/w/fF865kYrWPUWTjU9fqj9w3IGm+74lR5b7aEWEaVsCckoPiYBGEiN7hzYe
         i5jxATEA2HZiVnDRtbpRG8SoVUjfCHfKlKjcXW8RgjiYqOvFikYrjIW6KMjVYnxaQchb
         +YBg==
X-Forwarded-Encrypted: i=1; AJvYcCUOHq5/aYx5YyjVUEEyQv8yDnf4Yh3hfX0ANgnHfzAYGWPCYA3KqGZg81AIOsh7ywrypTiJb7ZZXaM=@vger.kernel.org, AJvYcCVaDQOT8lxmSHUqwj3wEK11BBmbxVzPIbiuoV67DNnlVIqsMarQtQ56yWJZvNB4DFFevlnHB6ttyGOLDgKS@vger.kernel.org
X-Gm-Message-State: AOJu0YyQhP3wtfsyZyf9MDhROd8UgtWcTfAXP3tfqvwbrs6Xs2JJ+1Ff
	iKmqpVlmqlxiPi9pxsSOJPKN72wrV3BzvQqArtmz9FK1W+CAp3mG
X-Gm-Gg: ASbGncvCXEmYpHhW4WTOELKW2qjwYcoz6l8ydMavkTEXvPu4wUZXU5TH1uaSD4tzqi7
	Vq/PHz6EsiLfZl6wo2ZncHWiZouS3MlLbqVOlpqNVhadoxjz7ZhyU38KE+fm0w/aO3R+ApdGmaN
	3UzgYa62O7BgkIn80fSVn9XTme5hXTlASL8xceoG7xN099WwyDYipL9Z79Ee0OY+ASzkjmOb5rM
	VAuyqXxfEfbj3pbVQI+7miWsf+a1Na6XyTN3VV9yad6eXk7gPBCfTZe+EQKwm42srHRom8VY848
	g+aMWKA3Xg==
X-Google-Smtp-Source: AGHT+IHs7nUpX9A8X7hKdIh/sm8IPJuB9OW+GNAAhaFZws+HFi2VUo+MYJe2v3HA0oleVxSgTOtWiw==
X-Received: by 2002:a05:600c:4586:b0:434:a1d3:a306 with SMTP id 5b1f17b1804b1-4365534535bmr4514145e9.5.1734480990861;
        Tue, 17 Dec 2024 16:16:30 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:ca61:1d3a:8af0:1c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b1f638sm2135495e9.37.2024.12.17.16.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:16:30 -0800 (PST)
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
Subject: [PATCH v2 2/9] i2c: riic: Use local `dev` pointer in `dev_err_probe()`
Date: Wed, 18 Dec 2024 00:16:11 +0000
Message-ID: <20241218001618.488946-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2
- Collected RB tag from Geert
---
 drivers/i2c/busses/i2c-riic.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index bfaa2d728a76..01195ffd4c07 100644
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


