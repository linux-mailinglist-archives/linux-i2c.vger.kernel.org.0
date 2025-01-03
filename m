Return-Path: <linux-i2c+bounces-8876-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 958A7A006BB
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 10:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D83643A42CA
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 09:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796091D5ACE;
	Fri,  3 Jan 2025 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0XTomPB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80271D5154;
	Fri,  3 Jan 2025 09:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735895964; cv=none; b=ZuYZmk9ta6WX0+nepi3qZl+U4hsL70DDEYLvYJSR3PQJ2LZUXg8U/ktSSpb5aADO7XPQfFDVCh39y86pjcNCeBSlyva4zMNs1eAxOW3o9vFeEA6OEb7S3b1BNFp1nYfHHaa3GLfqGekxxeJc6EgdDIajO2pfTqBx3AbMdSPsoMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735895964; c=relaxed/simple;
	bh=aK5JtUupKOmP6fpq0zjMaKUa69XCr4gZnjAvboTppgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7Ziq8CowANewtDs9AxzcBpk6d1tb6V+sOmf9Oo2FCzPVzwewtDBhRfQJ6W5Hpqq+gjAA1q88uY7zgX+mB1E20x2G+2pG85yluqox1TC7BUBCc/qnREGrC++Wgi4Ujl99G06L+ycZERjiqifJ5X+WhFDSwbkg1KRKnua6UEU0ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0XTomPB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so902655e9.1;
        Fri, 03 Jan 2025 01:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735895959; x=1736500759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dqc4S3D6pdOcxominqczIDsj878t38ZnFEbh7Pys8XE=;
        b=Z0XTomPB2v/62zLPCHYT9q6IlCCwKc26YuwVlk/EeW4dvQ6p+heD2e1q08LxpgiLj7
         UVPClLszj5YsS8IEfN49O//6WNOzAS/yB5tIHwzscyPfr4vx3wWA2jtYx5LwCPEuMsX6
         Ac2lGytkOXkEPGkEfCFZfzA12CpKiRBlhJAYkAmt47leql40mY/jy0I8TBg7wEXUMo5h
         kw14U0M6qga2NrH8tImtuvRo2rFjeiBxwtaAGcf+vD//c0wuUNFIQTrxmnVCrosWcnS7
         9pt2nBWH6bk4L4AKoNnbvE7SukZTNtexxskzme+k1f8krxCi9agdXubPBCPxisKpCb+k
         ozMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735895959; x=1736500759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dqc4S3D6pdOcxominqczIDsj878t38ZnFEbh7Pys8XE=;
        b=Qn3EZh1xWICNm1VpRDuSc39cwFoMCh0mw7MXh5SYUY8iyc7R9z7iuIML7t5JNCyWec
         3W51taOlKHj7F7crEwh3zmgTPyh68/TYvtECADDcLWd9UlpiiYvhVSs909L5zE2gYQHL
         i6nqpW/PoOkuA/6YQ464p7UiMRHZV2qYcBMGwVuarZ6VSYPLchYElGvm3HrvxBPPY1Vd
         M3IAQwt1WR+aGarwRYFoS9n+ImgELZ8CTUNbTjIGB2LTS9qhabww5ezEgKl+dY3J9HIW
         YcmNZLwcpYb05vw8stFIz/z0hg8vJvprUWM3KzeLTxG7bdbHC5Cx5/42uDqNVJ9GMOCX
         dShg==
X-Forwarded-Encrypted: i=1; AJvYcCUJEXCHifzjDBHGI5SHGqMNAIIyhCfG39TNgEMMLFcqsFAMDWwNH06UpbuPCLR+6BawNYLSDQPxRepU0Kbx@vger.kernel.org, AJvYcCXhnd+fY1D8JSaYX/3WhVv/5Re4dzcHlxiMbF77n3nZOjS36qxhroQZwLmh6vtchetttz3g4qW5l2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaCUVz+C5+slxd2tFw4Rc3YdSHJc/Ih+WPIPirPfWcsKQVgPEY
	AC0fnu+kkPE0m5JjtMIfQR/EAZanWF98SLedr2LTQpRp/q4kvFHd
X-Gm-Gg: ASbGncuh11jkJaHMhXiwngFYbqpDdiQAEhRZvWtkER+fBaCNW6hNETnNXMHeS3mt1jz
	rCWH0OzFdUclSgw1IYdnP/DbX+7jv8ZHLtzh645A0zgsCefCKgVDQBRzURM9iI7SRfxXJBV/Vx/
	iEGrLxaJfZroxNfFerT+AbpArtfHEHLD8KWLC3yUFCGsdoC9n2Bebzg0vmrqzZGsKtdbwWxJE/x
	QaSDvIGpIfqmk3DN74RsygAE7xPFLnGRFy168aoTf9kvVQtzyx+w1juByByUyol9gabSrwO4KSH
	NMXWSl1b/g==
X-Google-Smtp-Source: AGHT+IEFbAUFUDwmhAVIZRwPIXJ1h6DyvUqlZe4tom9/tX7Omh6fs1VNNnZ+JJsEecjqp3p1gvwmrw==
X-Received: by 2002:a05:600c:1c1a:b0:434:f0df:a14 with SMTP id 5b1f17b1804b1-43668548500mr377792285e9.2.1735895958863;
        Fri, 03 Jan 2025 01:19:18 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:84e9:7adb:b646:c9c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366a093cbfsm452493275e9.22.2025.01.03.01.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 01:19:18 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 7/9] i2c: riic: Mark riic_irqs array as const
Date: Fri,  3 Jan 2025 09:18:58 +0000
Message-ID: <20250103091900.428729-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The riic_irqs array describes the supported IRQs by the RIIC driver and
does not change at runtime.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v2->v3
- No change

v2->v3
- Collected RB and tested tags

v1->v2
- Collected RB tag from Geert
---
 drivers/i2c/busses/i2c-riic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 0953fedac786..eff1efd381dd 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -416,7 +416,7 @@ static int riic_init_hw(struct riic_dev *riic)
 	return 0;
 }
 
-static struct riic_irq_desc riic_irqs[] = {
+static const struct riic_irq_desc riic_irqs[] = {
 	{ .res_num = 0, .isr = riic_tend_isr, .name = "riic-tend" },
 	{ .res_num = 1, .isr = riic_rdrf_isr, .name = "riic-rdrf" },
 	{ .res_num = 2, .isr = riic_tdre_isr, .name = "riic-tdre" },
-- 
2.43.0


