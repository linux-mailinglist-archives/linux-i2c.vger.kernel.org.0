Return-Path: <linux-i2c+bounces-9049-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7377A0B6E7
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 13:28:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFE7E16214D
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 12:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CD223A564;
	Mon, 13 Jan 2025 12:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7156tSE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4D2235BED;
	Mon, 13 Jan 2025 12:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771225; cv=none; b=q3EPWn673Qho7J3R7hazd3H3JTszjjnAnUBGvOz0Lk5GG77dQpeFRQ6PBgnqpoUw50gohA3tJKEB9I7Rifs0k4Rh0oPsq0ENgaeMYqWMOEquQmwcIQmEET/C5wDFw+Mdcs2eMT5Nji8P/OotBdPdRfbSCNPk3hQ6cMRWXBp69yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771225; c=relaxed/simple;
	bh=J9hyRBKSuXe8hqhiAoUA3WRKFV5ZyRq8cJJ8EI+szls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QfYjUIbmmuQhfV1irrk1v0Eb/5tVqR0hnMi4bMxlYAR08cmiPZxtZwiD6EywPfevTucT+lhX8zyZ9KWds0FsyskfClHieLJOUDZbznfMMgoGg+nUwdGo5//rXRXsm8jFHvu/UJMXiP74THOzRUTmckVDrkjmQ57s9W1z2pEMGDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7156tSE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so3656713f8f.0;
        Mon, 13 Jan 2025 04:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736771222; x=1737376022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwlrU1/L4OoVV250darEN+AvnT2p06BYtepXz4Se2OE=;
        b=k7156tSEtY8eE1t/IVqJltlcubA8LnyEp/DGob24HZgZM0qrbmRBHSkvyoIAE5/HYy
         rDm3XsuW0UQBnmp2LaIWzvj+wplCFXlyHwHHnpIit5Q5mg6zZFBTX8I5lK496JNPSyJG
         wtNLyTn4x26haQjBeWUtD2TZkwT+E+ahyr2ql8UX/YJoneNiMGJs/y3FkxrnnBHSvovD
         y3l6Cx2tXhDZSNt6TrpaeEXB4kcJapIbs5yMLP5xcuQGnqzJUSJgdDXdNBeCnqRniov/
         c1JvAl/8POsiq5RrKmOfB/pnh0CReAF0ktPLNq3xv6P+ig8uAteHNg0uhsBTf26KaFZ5
         ikpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736771222; x=1737376022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwlrU1/L4OoVV250darEN+AvnT2p06BYtepXz4Se2OE=;
        b=fAv7uvhteunOX2F6E9k6pjApIgTYAzsBsuHWblO5py+K6ubQ5CyIbU7KXFlseLOTtj
         0M412Pol3x3EFMz8JpKFniNJApdxNse5A26bg0/WlTUM9ZE8f6og6IhtGEMWcFsohDWU
         TcM1FB6LpUXG/CXafvh5/VM4DtJ5vtDVXkeFGPW6B7q5MScRqBKcRlNkuW0RWViAJspC
         yO+g09kTaPYeKnvRQPX/sjOQLvTnPpndT/lPXRvC660mM7XQdlM3P3BChGWwNjRKfZYT
         JPrn4By2FNV1/nsOt/c2YCoI3wBza+9WANLDAyPsrcthfObtdOE4dG6MD0rDyZ6s8pDM
         J9rw==
X-Forwarded-Encrypted: i=1; AJvYcCWXLt2PtiDhXfz4uSWMjyf/f3eiXLML4E4yPxhgadMSeUfVYAggKriAu3cprjlgb8KuHPomDNWGi4w=@vger.kernel.org, AJvYcCWl9wnPu+xdj4Vi2LekXhlHknSc+qk8ci+hAM5Qg8SOqVAyKhvTfgIp05YkGKOqjBV+eeJ51eSA6lmRBJcN@vger.kernel.org
X-Gm-Message-State: AOJu0YwojPtCGdg41Jtz585AOA7MMJLDkd21DKbtbHtNAxO8nVzQvff/
	arN61y/KZBG3IIiVC2fw1ml1zw7vSsw8E6w1ASeAzjoGySvrcgdxz6uXCc4HwiA=
X-Gm-Gg: ASbGncvau0QO+esxn2HU52McaJ/6WpMYbGdH/0U7bvtKNORmmh83i4M90KJbpSGfQjH
	T9weJx1SKcU7cLsYYG88y1LRXG0jXI+Am7398IJx20U+8RQGPHeETyDIAaqhatwKdQHqhs+YAap
	72YJEGAFd1grCuiW3XWpqArGo8seKiw5jTG/Y1D2UNDptYT7Tml01H49D12j0s7gLs2M9VpTK9e
	sPrXYBRl2Xf/ehECLxESJ6WN2Im2+F67yR6M0lDuqjcNbHnhfMyZZ/eimasBFoj/0UPkwC14Izs
	tLhWM33RmA==
X-Google-Smtp-Source: AGHT+IFFobk5AQ2m4K7uPD7TeaYAsYgBxs8uq8w+kSbuaKt94jIejAPw3myughySRCs1PqIrI6LI7Q==
X-Received: by 2002:a05:6000:4711:b0:386:2d40:a192 with SMTP id ffacd0b85a97d-38a872f51ffmr18082388f8f.34.1736771221625;
        Mon, 13 Jan 2025 04:27:01 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:acc9:404c:3a6c:d1aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c23dcsm11812720f8f.101.2025.01.13.04.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:27:01 -0800 (PST)
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
Subject: [PATCH v6 07/10] i2c: riic: Mark riic_irqs array as const
Date: Mon, 13 Jan 2025 12:26:40 +0000
Message-ID: <20250113122643.819379-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The riic_irqs array describes the supported IRQs by the RIIC driver and
does not change at runtime.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v6
- Included RB tag from Wolfram

v3->v4
- No change

v2->v3
- Collected RB and tested tags

v1->v2
- Collected RB tag from Geert
---
 drivers/i2c/busses/i2c-riic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 577be1fb941e..d1768b38b12d 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -415,7 +415,7 @@ static int riic_init_hw(struct riic_dev *riic)
 	return 0;
 }
 
-static struct riic_irq_desc riic_irqs[] = {
+static const struct riic_irq_desc riic_irqs[] = {
 	{ .res_num = 0, .isr = riic_tend_isr, .name = "riic-tend" },
 	{ .res_num = 1, .isr = riic_rdrf_isr, .name = "riic-rdrf" },
 	{ .res_num = 2, .isr = riic_tdre_isr, .name = "riic-tdre" },
-- 
2.43.0


