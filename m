Return-Path: <linux-i2c+bounces-9016-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF85A08203
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 22:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 236503A4FB4
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 21:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D7020013C;
	Thu,  9 Jan 2025 21:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GS6AcOZd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5934877102;
	Thu,  9 Jan 2025 21:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736457136; cv=none; b=slbM475vbaN+JuY/2an3tPuFtjFgm8rtbGdEg23R5PdiB2u8azMWdgD+0ooBKgCyHbYp/ImTFrkCXClbDvtaQJAEeJ8x/L2LkcQjQOInTRX4OTx/NkN2w/n9A8P6Jm+x6CerDRiKghJZN6OPibQG4b4PLl/fB4woE5Rj4ZKNSWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736457136; c=relaxed/simple;
	bh=n+48N+KMLDOLAc+DGe1WXYIz8bHUgYLyJb5NMET5jCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qRHl7UdMel6qbEdvzChCumSkMc/aRJNbK8a361ZxI7eJ75QUtIFDRtcuVtIweJrtMJTgasehbbG3sqyzS+OOc0J1J7f3Mqhj06sgF5Iig5bI8xGlaxJrubaemfff4Wa/c9qkv5SCNAW+tfHf2LrmYT+NJnxyNGtBoEzQfDG8838=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GS6AcOZd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43626213fffso16064605e9.1;
        Thu, 09 Jan 2025 13:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736457132; x=1737061932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YSVe9jAuCPgn9OZNBfybA57DnVbYnPyzHwTZpcnu7hA=;
        b=GS6AcOZdRGor6J+SSWVW0vR/7VbJF0e1yTv1MmaIIADKhGjJZC7uLX6ZtFjI4++adm
         FJs7FIB1cC7jYGeGVr2ZJweBQlDq6u4g6lvIEzmZvqevXmbWDWLEaSTIB4A6+ktZTkKr
         IuPSU116otK3/3kdjm9PGD0uAryHX236428qUypwkWIhnOzFyq00/NkM59ofV9udOd7d
         3jmrDR4cl9SeS9Q6ODVnFQQS8GCMI9iJudF3r4pirnODTFOL7k3DT6iO2h+yHrbW9JR2
         CL9wbSA/oFElxRq6Vi9ZKAmZ04T0AhsYdkvyg7wwjMOjlyqoi17S+su4xNy8I9uU+9O8
         rTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736457132; x=1737061932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSVe9jAuCPgn9OZNBfybA57DnVbYnPyzHwTZpcnu7hA=;
        b=I6k4jiYSJcBwlCgfCPl3XXr0sI7puzs81BU3FDgYEQEti7OIojbQqxEhinrkASzFNO
         EXuLkhTcAGA8J+eaLtBbtYFPv7k4+XLn6HA3WGaN1W+JpuY+XifDyhUEyDEil3FVdcrS
         p37FJSIOadIGEnpwbtzUmNykc/juX+JJ7HtgC8B4zYns4g4Fn2Xs8hI8pWy1si/KnaC0
         LlSvjeRe+hXdxe9kfsYIKmPKij15iIYEifd6Y8DpKNSyE8o8wqbkeZnv+v8x74USS9kd
         P6NIUZt1s8qpOf+vYl5trvRDReW6k/iHY8koFaOfr6nkeWg2S7ipDstfUCjEskQIfOtd
         0nNg==
X-Forwarded-Encrypted: i=1; AJvYcCWRvMwLEMQywv9n7W8atYnHjUn27n3TuIio8M7f6ktSDASPLA/ezukbLtzkGh/f3B6inM9wRMXm6pA=@vger.kernel.org, AJvYcCXGUgXoFS4mrH3y0mmH6VTNDo+9vHa7M08jypb2RI7H0JpN/cLIaSuYn3WfwUNk5MrQXEDl55VeiotDWiGX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj5J34ih8/f1Ic8NERJraa8rWRy+T3KiwZsILxpIgpsr9Qqufw
	m7AZJtdaBwkAAxNqre3hw6YC2GdctTry115O9Nptd2VQrtqCWav6
X-Gm-Gg: ASbGncttgLyR3Bpwya1LELcC/tSwbtyxB35sJj3AZfgYJ6vrUA3/sCuz+GTciOZmzjg
	A5qXbk8VQuxrI8D8c7VidO9JKwHyTukpnT+uSsKSTGz3a/QkkPG4xnHjSzNx7FzueJv8hSMGMTm
	zNZvkz2N+0n0uUPCmzYgViEY0ZpWAgX3cwSyj1iOLD75ka8OJaVlZE6k4GPHBL/dqieq89eoZO1
	XVDTn6h3XpkJrBwwCI3FkfTkM2T5tQeUMiQKiwnDKP2szctV7Yxm/lBBB3N5dYmR3TA1OBBhxnU
	zGUWFoFw
X-Google-Smtp-Source: AGHT+IH4ED1OfDt2ayBeUeZjlnhogQM3G306NhISXUzKPz6uPpGzIHvQbGCQiP7tGJLOdYlZPyjh+w==
X-Received: by 2002:a05:6000:4026:b0:385:e10a:4d97 with SMTP id ffacd0b85a97d-38a8b0f0b77mr4717492f8f.21.1736457132300;
        Thu, 09 Jan 2025 13:12:12 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:c62:5432:d9a7:c0dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e383623sm2778315f8f.32.2025.01.09.13.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 13:12:11 -0800 (PST)
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
Subject: [PATCH v5] i2c: riic: Introduce a separate variable for IRQ
Date: Thu,  9 Jan 2025 21:12:05 +0000
Message-ID: <20250109211206.241385-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
---
Note, this patch is part of series [0], as requested by Andi, sending
only patch 1/9 from series [0].

[0] https://lore.kernel.org/all/20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v4->v5
- validate return value of platform_get_irq()
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


