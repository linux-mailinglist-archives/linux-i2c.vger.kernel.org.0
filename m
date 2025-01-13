Return-Path: <linux-i2c+bounces-9044-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AE1A0B6DA
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 13:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 799773AAD0C
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 12:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C4522C324;
	Mon, 13 Jan 2025 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3MXtZX/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEE922A4D8;
	Mon, 13 Jan 2025 12:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771219; cv=none; b=VwqC62gFhBswfoofGmUsS9GQKA16W/zmm0jXY2rpgIaR9bWxF6y5LxjbUORYJqK5or71n6BqxGZI1t/GDiA02hxArkXPcBYcDvOIQxHVuPKgTtEEYTINfV7UiuWDIdOJ858Q7S2h/zZNC/FbN1kMrFF49I9ZwEeyU7A/kc6+avQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771219; c=relaxed/simple;
	bh=xPxmZJPzgiB1EkmfuTmM3PZFUFf/FL1WQSgyJtf/1sM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QbaSO9o11uWtnWeFEkLepRCOmIU1niDTjpGY0fUVIipMOVNebgl7hQEYicRp7LWj8NlqkWbLEcesbzI7D4/fmid3Fw+ZzuKnIYLFiQmxXmZosvq86ZBUL9CRwHG6/miDdrLNB8CR34wf3jhBH7yAyoZXBPU9raxXB/TGwmHJZVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3MXtZX/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4363ae65100so43700695e9.0;
        Mon, 13 Jan 2025 04:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736771216; x=1737376016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rNx74P1jADybHGnkrn/6e/0CTICNmCpKRaJWriNlBY=;
        b=N3MXtZX/ACm0aS0a/Xb4msFjyaIGYA+9S3hlKQIepQe1JLH1LCpX5L0Da55RvJaSOd
         lsE7EhlJDQokRVSjiev9FVxAD/yEWUhGh8iyH35FEioed0oz6aNpiN9uvzWECiC+zSNx
         NW9tLjeasQwybAFBpI1GzmXVNVV5o7vo/XSH25wCTGThOJApmKzGxrcBfbJ8tJL5jcAJ
         FQ+ejaZ91J96groyYDmgHWSz2XkKSc+ERbXhgowSskzIiF2ZAYXgiVA0xRC9YIazLIxZ
         ul043wa+CNmXMGuC6k74aYMlgrHzwuDAIxJFsA4fWj/oUIaar7O8B0chRu/KJA4xidWC
         mNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736771216; x=1737376016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rNx74P1jADybHGnkrn/6e/0CTICNmCpKRaJWriNlBY=;
        b=QnGnungwzGkEVcMyOEib66ZDXHCF5jVl1QHpLwUVxA9zRVScZI334f8AUs6hqwZtVi
         bKOlIhHHB0l6mtt1pYjBLG32zgyaoYaNBHWcTzbBVIxxyOK99q1I4LACnTG+PVypeXX2
         2RXd04Kqpo2x9ylw1qb/S8k2s1SGEAYZWqBf0vTvUN+nUxBAzuwernfrf4VyCVXMUxiY
         LWF9C7pNvHY8L7/LUWiIFn1MWOaxWLdYV8uSCgYvt35J/+mjg/5N5AGwsZtnAUEWmi8v
         /ZLbbR2U3GTLyvsk7ZqUSqTtlUea/KMB4E15AJ0cPP07Q9s3naD+MqScgqh4fD4aV+Mr
         0A5w==
X-Forwarded-Encrypted: i=1; AJvYcCVmXS4DnVwV/M3vf7NwZ3wlocD6eihQduMAistuIInkocjUXzW9J9pw9DoY3K74AQ0ii2CZpGHkooI=@vger.kernel.org, AJvYcCVxgVfH9vTRZeP77yZN+Nf44sX7gAGnwT03Ewdnh2m+rp8wHNi05eVLQBpcwYhINbOslUHqKtU0ntDhuq2V@vger.kernel.org
X-Gm-Message-State: AOJu0YzNybTavB8UdW3Nn+pWiVjsMnrpYTRIvPk0iznfXgksw7fbnMCM
	hw6nu4/TaGG42z7CdexRbYZlHnigxty+kGZmb6Cx+RFUfmOk+2UQ
X-Gm-Gg: ASbGncs9o8lDGKDMYRmU26kM7ck3kyYK7YQYN/yLj+cGyI72KTY2+BuZ4t67elBprxQ
	uGh4rqV2F2dK/vkdotmjX2CfSGad4gyD/TvV6WVuyiAb3WsugnVaEih/ZuorQBksNZf4vobZ6TC
	81266tBa6hZFWOWSE63TwWyl59gE617RTKyIdpUzbz6yNKSkhB7CgXMyHau16WAhPLChw4ZCmQA
	xxEhaLBFVbz+afrB8LvOVtDx0IwvYJENOAQcIr4P8nuxuSPvulQ0GU5mJArpIB+BjWeXW1/i5xZ
	rLJ1awm2Tg==
X-Google-Smtp-Source: AGHT+IEiYjukAIxRXXeGT+ERN00ZzABAxetvZIxM+7Ej1bgXJ1tTG2/IXdBox3XmCl9Yt+E/1UAVrg==
X-Received: by 2002:a05:6000:2107:b0:38b:d7d2:131c with SMTP id ffacd0b85a97d-38bd7d215f8mr3819777f8f.32.1736771215660;
        Mon, 13 Jan 2025 04:26:55 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:acc9:404c:3a6c:d1aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c23dcsm11812720f8f.101.2025.01.13.04.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:26:55 -0800 (PST)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 01/10] i2c: riic: Introduce a separate variable for IRQ
Date: Mon, 13 Jan 2025 12:26:34 +0000
Message-ID: <20250113122643.819379-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor the IRQ handling in riic_i2c_probe by introducing a local variable
`irq` to store IRQ numbers instead of assigning them to `ret`. This change
improves code readability and clarity.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
v5->v6
- Included RB tags
---
 drivers/i2c/busses/i2c-riic.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 9264adc97ca9..9809ac095710 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -464,11 +464,13 @@ static int riic_i2c_probe(struct platform_device *pdev)
 		return ret;
 
 	for (i = 0; i < ARRAY_SIZE(riic_irqs); i++) {
-		ret = platform_get_irq(pdev, riic_irqs[i].res_num);
-		if (ret < 0)
-			return ret;
+		int irq;
+
+		irq = platform_get_irq(pdev, riic_irqs[i].res_num);
+		if (irq < 0)
+			return irq;
 
-		ret = devm_request_irq(dev, ret, riic_irqs[i].isr,
+		ret = devm_request_irq(dev, irq, riic_irqs[i].isr,
 				       0, riic_irqs[i].name, riic);
 		if (ret) {
 			dev_err(dev, "failed to request irq %s\n", riic_irqs[i].name);
-- 
2.43.0


