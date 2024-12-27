Return-Path: <linux-i2c+bounces-8757-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E44E9FD3FB
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 12:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E143C1882B1F
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 11:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8EF8156228;
	Fri, 27 Dec 2024 11:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9ge8OQK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E021F3D26;
	Fri, 27 Dec 2024 11:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735300344; cv=none; b=XXWB5Fu/CNwBj1k7iSrDOqayMweo04gjrGt+NGQKlKGMI8DpfgIIX8iM4qVOENH6SDRbPJFehOjlu57HdYhAxh/Zcb7EgJv6QesnxtYJjtxokx1e+tYum/RL8scHYqLs2rM1iEYwWyImY6atfXFR9WflotPvldgK2neDWo0OFdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735300344; c=relaxed/simple;
	bh=pWYrPctcHjB+u0MD5MK8kQG+ASNgsWEjBAQzgKyQI9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rI7RalXCUGUlht8p+FfgQwEb5LFl+VsDydCLpWcDGvc9trEmnmHf4qnzbed2gNehQpWhY5G2D75V9gYtvhuZ4Tw4nyN9Mnwri3vPjD5pKImOHdvmjwnynJDIQvv5tLKEQGH65wAfrLy7+XSquQOMib6K/R8m+XM+sJh8TrD6YKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9ge8OQK; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2162c0f6a39so95378365ad.0;
        Fri, 27 Dec 2024 03:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735300342; x=1735905142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8oY5oTbQVZDPH/A0GVWyEqZ6b/K+sdv50js6rIf5Sk=;
        b=E9ge8OQKJMoDnLT26Ht2nlncKtgAIrSO0o+wQuhWcTcKzJClc8ozqygpVkCSF0+G6w
         TuRLtHOLhYmjMm3W6cQ/SrsmhDlNmcOa0gvO55wdMcRSvxKEvDlJylEPEI0x8Oh46naE
         /icivn3ALWS4d5QEpIld50YijN+uiP4TTAsUB5WCeBwXLLWiJk9SL7/wrFsQ7VC/yTd+
         oJE/lhikjFpVKRvx8WxnZoOnCSlCrH22JUb7sp5lMXtAWsXrwpeK8tOxWWUDB+6bv0tZ
         bsKBV1WG6y4f1gMZSWJ8DI1VTcKthM4pyyuPwctNXn1wbpxDbi70rxiGHp+p7R4j8hds
         9plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735300342; x=1735905142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8oY5oTbQVZDPH/A0GVWyEqZ6b/K+sdv50js6rIf5Sk=;
        b=hq5f6D8CrS7WG2JBdTRRc7QaVbJg+x4umW5KZAqGwHWGWVn3advHHUCotxrwYq7+RE
         x0ed82E7v0+NguARL4/Qc7FiZQQjKiWdblbG/6f7cxJP6k4cGlJDtDxu0S9rendt+pEt
         fNi/rbczkMFpr3sv+O/oNIAgAAb3A0Ub2gmL9oo9kctaMQPYvLDS2Ed3FXBFOC0p0soT
         oy0MTv+qqGhSus1jzR6rwvIBxVlm/6xTmvcCTdR67zqTkAbpzbXn8vPBYwUHqsQpt3t+
         cKGt/aJOj48btkH3hE/svkRplmD/wfKr3qGptIEmfJFaFWcIijBtvxAFecCLwYureCQc
         ke8w==
X-Forwarded-Encrypted: i=1; AJvYcCU7AdMg421wqbiQnIDtB6qv7/m9WSnEIySEw5b444UX7aY/gb7q6XT+d1HbxJRfrszk21OGnW5uFMo=@vger.kernel.org, AJvYcCVp9hUCWx24S5x0nPNrhruuDZxYJpvF5YZYU5Pn7tZVD/919Acy14w8bB9T99my/rpOqD6DowN0u+duw9fT@vger.kernel.org
X-Gm-Message-State: AOJu0YyNQw3s9FKPM4EkvQTAc8cozczZZoQk7kP+VkjXDDtbnxnN6ALV
	i1ZYTOUwuCkMx+1exmmvez/hxSShDurOInKkcD1D9uRwADXphXiH
X-Gm-Gg: ASbGncv0W6H8XM+11Fk/TIPEMe0bWWjWt5Sj03KnwE7opGWp3xVGlQ0cT7YT7DxlOwj
	g6rN3XLBVJj2iau3lTkNgX3QKhgPsr8Z6pav8CMR8z5HLq56VzVP7RHjaEorNkkLlbwWdcn6nb7
	Yreu/lMIgDDhS/jYQQrz7yVE8rSjoV1yXbdEPDC8MASisIjHwxRSj9iPJrg+6YZfaGjJ9PHPnxf
	xcCwFpoorBkidXS9W/4w5/4FxHEUQ2bgdu8BA55i9czyLts1DVqkU5wZr/LyVwo9BmINxRdzPh1
	SPJAUkU=
X-Google-Smtp-Source: AGHT+IHhOrlXifDprZrXy/XB3FzmU5oowjgUWr7eScjm2AeiT3HSQ6NsqfJduujIZteUgCktiysOuw==
X-Received: by 2002:a05:6a21:3291:b0:1e1:a434:296f with SMTP id adf61e73a8af0-1e5c6ef034bmr43880502637.10.1735300342244;
        Fri, 27 Dec 2024 03:52:22 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:9010:ac08:3a91:844a:cc65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbcbbsm14363990b3a.97.2024.12.27.03.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 03:52:21 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 5/8] i2c: riic: Make use of devres helper to request deasserted reset line
Date: Fri, 27 Dec 2024 11:51:51 +0000
Message-ID: <20241227115154.56154-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v2->v3
- Collected RB and tested tags

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


