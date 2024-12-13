Return-Path: <linux-i2c+bounces-8499-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 329C89F148A
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 18:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA05016AF3A
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 17:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66ACD1EF092;
	Fri, 13 Dec 2024 17:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgbyM5lZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689201EE006;
	Fri, 13 Dec 2024 17:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734112723; cv=none; b=fKJFqC4b/EpL1XVOI3iGiMRgTWyA1+0SS+Df7Ye9uGTXCQlUlmv9+hq+y9STm/q8clGDafiiP0Vewbzi3ujiVisUE09RPHjUSwdP0I825OgQmGyNPg36zZ08uIGgu7k7Boy4zC5Op7Pg7TeGFJIrKqnhFIA++cn2UnBOq4d8ttY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734112723; c=relaxed/simple;
	bh=AhbwkG5EX1Hcj27wbvdujXUKwhLkJuv+2Gb2iyjaGg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zd8Qgspss6Ata5TLC9oVc8BiraR5BckWRfoCk2+jRYbKFw2SODreuYS5lGTMIbRB78y+X93SDJc1/abBMV5uAzUgtfnt3GfpF1B5HNnlCrVZuz+6Q9Ot6S5eHJHi9brv/8f6yZd1Kr3S8ug514/QFG9UqlocLbbdjs9qlAdb2as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgbyM5lZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361f796586so24560535e9.3;
        Fri, 13 Dec 2024 09:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734112720; x=1734717520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMWKkTzdj8DKVIv1nP3k0aiD5Wz9gMpH8BYSjw4iCUE=;
        b=DgbyM5lZFDu9k/W3XsNy1YR4w2yvCYLAQz15nkFMmMwVAA4wZyvvRPFnTgZgcwmMYF
         Msk4e3jEQu3wgQpDb1sx7t16RBo+Qcf7v8UaSb44lxu2feIwi897yD4am5/HFgAikgdl
         PttiIJ5toRa2QDdaAJFPfCdgW0IisXrT3e2sFunwREDGgNOrZtfOLjGK8lFfj7Z7Bm7A
         cgt+dTE8ejC77q6AZILiLR42EXzDHqn+PvehCNjq2FOOwbWePEdqxg27R79EzKLVlo3K
         cKtURHK8hPHTxM3NS3hHt1PeqDCcX49vMDQhQPzs+EDEEe9TYQNGXupv3VQXQyK8lRuM
         +XEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734112720; x=1734717520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMWKkTzdj8DKVIv1nP3k0aiD5Wz9gMpH8BYSjw4iCUE=;
        b=QwseuB6mo46BIACMVsQVwenGvesyOAoUaxsEvW4M9rlVYSwfEnLiZNEitVb/Po/58s
         2DMNdso0H4TcX81ZMdvWt75W/3k41CGlPFtXUtQ/GlpTNntWiidT2xOY0ugLIFvScGSw
         Z9SpKYIX1CmTTDk0WwWAjYuUgnBobhEGNvYKANuXVB98L6sxrjl16zJp/1E5z0FlCXpK
         V2wj0H5DvIgi0wzkNtVwiS1LTVSuwZudMyAT95FBMwXBNgq61MNHldD6jwp4QH+pHqnh
         4o6YdSOZfng04tlNDpm6VYmJohrJbF4ZgU1KK8/bAJ0f4WTiVB52klYhDSw6CUAHtRoy
         qr+w==
X-Forwarded-Encrypted: i=1; AJvYcCV+H6pwXW9gSVK/FtlL1cwQ50zHcWPfX/oIEYPVojnj1c5h/lIxYnKUG6xlpL1OPEJZB2E9UrKLuMk=@vger.kernel.org, AJvYcCXjyx/CVVJbPPjLbG66TwehGpSnaqJ8mGxAujBZKRVVvE08ZkJhjkfxM7PxAQYZC74spJomBXGP3LdEBFix@vger.kernel.org
X-Gm-Message-State: AOJu0YwSQgy1OUgFKrZ5Zw+4ginVTGX2Ql8/tI8vJg/qMNIOjgpgPFXy
	EZBHn8u3SDgBBipGxt50xTwm4nXVUSrIvxqeWmZP8qgc6V+BWpoa
X-Gm-Gg: ASbGncs3zFcVJVXNHPodpXfjYrB01tCFJXXZ85s4vnX666KaqSQLTL5oPMRm58uBbG4
	okD08Ki8TlqKjlyz5C+QYDXjqeasFtVS4PLiaqcn+r6oY33/D/OAC1PF/twzlibLirrpW5JzFhB
	GYZMD2fxSu4J/B4eYLGVn6HIz36AhRxKdLtkDKr2kmbfcoKq2FcuuUiqEYr6rasuC3eTjZJ1xK7
	sykDdjweeGbMX+W+A5fjy64cBlydRBe9+pu15NK7O4wUQehEXsX+UrYKqcfWYD834603sARLxwI
	ai/gVcvGBw==
X-Google-Smtp-Source: AGHT+IFFvzvo+BgYEIPYdv9QhG0mMtRndQ0E4BmMrB01WgpcQo+o6kij8Qugk5H0PSio32gzXM2Srw==
X-Received: by 2002:a05:600c:524c:b0:436:2238:97f6 with SMTP id 5b1f17b1804b1-4362aa1af5emr31723585e9.1.1734112719414;
        Fri, 13 Dec 2024 09:58:39 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:4eec:e99c:89a6:d7a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c804d573sm119088f8f.64.2024.12.13.09.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 09:58:38 -0800 (PST)
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
Subject: [PATCH 5/9] i2c: riic: Make use of devres helper to request deasserted reset line
Date: Fri, 13 Dec 2024 17:58:24 +0000
Message-ID: <20241213175828.909987-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Simplify the `riic_i2c_probe()` function by using the
`devm_reset_control_get_optional_exclusive_deasserted()` API to request a
deasserted reset line. This eliminates the need to manually deassert the
reset control and the additional cleanup.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 487fa26264b0..032cf0b1368e 100644
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
+				     "Failed to acquire deasserted reset control\n");
 
 	for (i = 0; i < ARRAY_SIZE(riic_irqs); i++) {
 		ret = platform_get_irq(pdev, riic_irqs[i].res_num);
-- 
2.43.0


