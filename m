Return-Path: <linux-i2c+bounces-8585-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9A99F5B38
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 01:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5482C7A4840
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 00:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AC75733A;
	Wed, 18 Dec 2024 00:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iT7aW0sJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA9B3597E;
	Wed, 18 Dec 2024 00:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734480999; cv=none; b=PAyczZxxj1Lm0IPhbZ+mhfnjrQnHN/WyaWq3morF8gkhXv1HOrSL08G9OS3Nv77UtfaaoRrpMcd1hTOctwaV5cY0DfM/jS8io7S/FbfBLN7v5ucPjWew5Uj0+XnsnMFyeHq2dEFODj0Zk/E8s0HjZGGuIQMe8PECEX5VPWbo52M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734480999; c=relaxed/simple;
	bh=I+lgjWblbzkc1ig97IwoLEh2egL2X+/F4HqtKjUg5bc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bXG6914Yv3umCdSo72DPmP2ORmSkbeMASUxI4MRH3DK7f4e+72GzjZ+FbLQ2gCKTKaj/LiFP7ww+0relDpcK5wtv1W7LPtp0bPnyH1LDpjQf1FxuyxfMeW52/X2zvWz1p5+/jxqbNN6RgM223n5UMhwYll1mBXva677wVYAZ2rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iT7aW0sJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43623f0c574so41536665e9.2;
        Tue, 17 Dec 2024 16:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734480996; x=1735085796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDPkBWjxoGBevYa/wanarFSpMlhYS8wLWm9t+ADkfqI=;
        b=iT7aW0sJMe046SiT83W2dZYgGGlmeWpKf5KclYDxI/XuS4Jz40p9OsQvuJLk/lFwDf
         iOsG/su7hz4k46jGUQXkLf87ujFnSIqgMJ/uAixhPvrnIQlWip8kpPdmREaG9TkctUE0
         H7j+YBjflP5A0WIEFaN1OYZ2QCv3zVpdyMyF+bLxreWVvR5HEgj5TjAt9NdP7sxvK3S3
         QDbQm5iHuh1/ablRJ7Q3mMmYuXIn3n1xib/Ip0qfoUR3MqF2BouZ3H0mloQ/l9uH3qq8
         0BtDkrvAiO0BUm+P/xcLVDPnSId59UFqhjh+MjYVM+2R980nosmKwlXUL9b2IdmStyY5
         7zFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734480996; x=1735085796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDPkBWjxoGBevYa/wanarFSpMlhYS8wLWm9t+ADkfqI=;
        b=Hbr6TBpcCfvmnzKTi+x4l1z69wITIaXlpvLdcsO5F0p5rNf1GGHLa6jyiLgM6AfDTp
         hQkwwbivubvpbt0oTneXFabKzHTDJA+TKz7j1MJLXdTGyQsSoyQxN5VDxKquJwGdacpQ
         UAUOZCb5n14HrnwoiwkzFdV2ofu2oVGP9zzYC/6QLTfUOUfdRaeA+qzIbSdd/grKwxAH
         dggSOD0nArg4OlkTu1tSmsbolwKbJpMwRAwLyv+XxzdbPQguveF0km9sanFvHMwvbJpM
         sqazxYxv3XjOV25a2XV/F7QrfJ5i2P6r/uHQAL/nheaHz9QbGZASY9IcPlWRz9Tpj2os
         KXnA==
X-Forwarded-Encrypted: i=1; AJvYcCV3mBn/ctZDsG3TCozFGrJIvD81Hy3KKVxxUK7w62gpmumbUvxvnsJVUmm6BJGq4tXNcwr2Av45Iqg=@vger.kernel.org, AJvYcCVfTVml0BoCUIBG8lqPkG9BbvkkrOUPONF+7GI+WC2PRxp1WwgzPXsJ8HqzifxOT3at8Ks23oY5Y1ddw7t1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Mi5tyR1G3ITb6ADJeDX/fjVuTyhnvdywwAWNBWOEaIfrHvF2
	JxA4kYvrEtW3yVy3HkdiWwfAqIDIY4pUaGvs8dzNQ7V8BoneYkVd
X-Gm-Gg: ASbGnctTEClEJVKcGOpbxku5sB/An5seBPlRrvsCS3blEb1uuqR8p7x0Jbik6QB0lKh
	Albh+3SAwpTqodkpkIf6cmTMP0HJCzfQ5SyFIovI6inYEAugV0Etuw59qxKG5K7O7Xx12izuYC7
	lJrVL6+5+XFftkqw6u/7rdIPhWZkrH3Ex/mr266emB7J551/n5AbASE3xN+ovTLZzdspYfDNABu
	BLkYKdK2mObBVyh3mnVzzT1/AD002KW1T2gLuOiY/JeW4GjWH5HOqYoJARE1aCExjjWqbSP/670
	yr9Idqwbcw==
X-Google-Smtp-Source: AGHT+IH6FM2SgII9gWPoT+4RHw2XMcC9XTb0s51E93sZoOCM9Rfjm2XRQlFECQCqt1kvmCkAOGmPjw==
X-Received: by 2002:a05:6000:4711:b0:385:f821:e97e with SMTP id ffacd0b85a97d-388e4d6c078mr558608f8f.9.1734480996372;
        Tue, 17 Dec 2024 16:16:36 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:ca61:1d3a:8af0:1c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b1f638sm2135495e9.37.2024.12.17.16.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:16:35 -0800 (PST)
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
Subject: [PATCH v2 5/9] i2c: riic: Make use of devres helper to request deasserted reset line
Date: Wed, 18 Dec 2024 00:16:14 +0000
Message-ID: <20241218001618.488946-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Simplify the `riic_i2c_probe()` function by using the
`devm_reset_control_get_optional_exclusive_deasserted()` API to request a
deasserted reset line. This eliminates the need to manually deassert the
reset control and the additional cleanup.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Updated error message
---
 drivers/i2c/busses/i2c-riic.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index ddae4b74a86b..edf2212e96ea 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -422,11 +422,6 @@ static struct riic_irq_desc riic_irqs[] = {
 	{ .res_num = 5, .isr = riic_tend_isr, .name = "riic-nack" },
 };
 
-static void riic_reset_control_assert(void *data)
-{
-	reset_control_assert(data);
-}
-
 static int riic_i2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -447,18 +442,10 @@ static int riic_i2c_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(riic->clk),
 				     "missing controller clock");
 
-	riic->rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
+	riic->rstc = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(riic->rstc))
 		return dev_err_probe(dev, PTR_ERR(riic->rstc),
-				     "Error: missing reset ctrl\n");
-
-	ret = reset_control_deassert(riic->rstc);
-	if (ret)
-		return ret;
-
-	ret = devm_add_action_or_reset(dev, riic_reset_control_assert, riic->rstc);
-	if (ret)
-		return ret;
+				     "failed to acquire deasserted reset\n");
 
 	for (i = 0; i < ARRAY_SIZE(riic_irqs); i++) {
 		ret = platform_get_irq(pdev, riic_irqs[i].res_num);
-- 
2.43.0


