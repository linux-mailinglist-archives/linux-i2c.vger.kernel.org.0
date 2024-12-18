Return-Path: <linux-i2c+bounces-8586-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 090A09F5B3B
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 01:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBFE8189047F
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 00:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD357BB1D;
	Wed, 18 Dec 2024 00:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkQceh80"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5AE481B6;
	Wed, 18 Dec 2024 00:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734481001; cv=none; b=UoZX3PDLucQIHGDwHJsKT1UsrzzPDW/jOp6SJsNMpKbIJwBLzLRZWPRec8QWeesxuSH7Adt0P4AI/FPagjTykfaCesCwtr+p04QtSaUxfWaztpC4TfdOA5RByT+zkFdy3OhYrl0IEfDdGoN4b0vRq6XVSh0dwUvMiQDA4wksvmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734481001; c=relaxed/simple;
	bh=d7ouRJRAsjh+0R/ZF/yPJvwkwIA1GnjZ6lxInDFwtbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p559g/lfXGN50MuEBTGeLgcZ+6vV7oN1bDqunexPKVv87fL3zC7jk3kOhArNa5B1Z7hhgEkfwz2kqsonMxDCnMB98NoWYMCQrZIuzXesrlC4fnTp4YHZ6sU30BF7zWlXQxgI2uKjPUXYXeZ4aKS3cScrtzVYpqHVRyDkmP2LgU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkQceh80; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3863494591bso3176030f8f.1;
        Tue, 17 Dec 2024 16:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734480998; x=1735085798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEkYgx5IsCjOyNY4uIDVU82NRqAGn8PJfip+/UWwLso=;
        b=RkQceh8058Xra3zBjqi7hA8wQWzI1WCDbowWOtWqHmN3zFP+4YPjWgm0Ti/qYT+Ulr
         LYWTmB4od1yynJm/kjJhrnKcr8aHSTgq84yXGQpmbYPgcowRf7LNc3iUCaZW0uP4Kglm
         oQYamYCHGRmhvS0rmoLqbzhzqvW1usI3fKcC1LEDeEPqKm499z5I9mmAR3jewN0fDeUC
         p+KWBGUOH5jRiOS//GeTLYroiLMBVn0zYHIEVfxw1y2uc1Iq1vpVCwdXIFa9/2McwwIo
         eD2czDywZHYxmOonw/SmlgoFVnL2qP72hFZDPtWYMuj4Tjzeh8BgSKCJqZSxjoUzYJ2G
         FDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734480998; x=1735085798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEkYgx5IsCjOyNY4uIDVU82NRqAGn8PJfip+/UWwLso=;
        b=Oml5SarNgFudFRhtmD4vHgOpAq7G/Oxt0ALuqdLXUJKLtACZlOM9orOQxsMgqrDc4Z
         Ev9GPGSp1aurWfolN6Q0riuDS+F5JpUXSN6ogIZ2levU1oKdeB7wC2Q+j66CC7/zOGeW
         FJmjkWJ23G2aLBf9vA59Ey0Snbh7XaZaG2d2mGYZhYvXHkMd8S4jhsvrgu+QFJ/Ttw2j
         tCHxa7gwmlg6j1unlvY/Z9fSo2PTglth5yb06E0Mr21b2VVbUg/gQEGAzXhmIWPrWtH2
         /pqbH+MZgc1OAyjJ21isaEFOausxUUkT+R+R9qbno4nyqt2mWcdqNQ3niL7lAvIPEv42
         Q9tw==
X-Forwarded-Encrypted: i=1; AJvYcCUO3pAQcSKAxj9BzduunwWc5OX1jZKYmgc2hRU6UKwrN4S7du3alU9O/+IRYhu9MpsdWTDcWr6f7AJGl1FX@vger.kernel.org, AJvYcCWMCNIF1WTb33dT65W5rBV8+7QnXa6zHqrIw2PlgC0US1A4pYksbfOLBFMWCQTslcLm/FypV2nJMHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIrMkb++tex6uS92Z8vRk/diSip32pK92q8eqwAO+9a2CkDytW
	s5UvpJiWdO+ujHTFZ6dvZNBX0HxDhWoN5El+GAInBYolmWadIDUK
X-Gm-Gg: ASbGncuXv3tHMAuUdyVFXciZtXbQcQlznYPAoG2YoroLfVr2rl0/RtQ0HcObic96mD4
	Glrpp7OuubcTlWikEZyN6nEHlgUHIyXXODgEvmHhBzoGqA4+8LgZ+bm1T6I0i5EniNApixkEcK4
	ILO2sHwOIP5e2TdzqbtbPu9pQ4toYhuPxh4MDccuF7bByI2iGdRdTEBAaBIBK8PGaLzYDjfvop1
	1PLSFJ6azaQ1biYOCMa7bPTlpOJbfYfs2T8QbPgWRHYRZSf1hDFpDmMRjYhij7q4sIognwXahp5
	ANcS6Df4Lw==
X-Google-Smtp-Source: AGHT+IGHydQizdElKOLw0A4g1vC+AWWjPsJ1YntcTknj3PedLHU259LKN2aDhuwoN1Gikw0z2a3iIQ==
X-Received: by 2002:a05:6000:389:b0:386:391e:bc75 with SMTP id ffacd0b85a97d-388e4d83582mr673088f8f.16.1734480997455;
        Tue, 17 Dec 2024 16:16:37 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:ca61:1d3a:8af0:1c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b1f638sm2135495e9.37.2024.12.17.16.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:16:36 -0800 (PST)
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
Subject: [PATCH v2 6/9] i2c: riic: Mark riic_irqs array as const
Date: Wed, 18 Dec 2024 00:16:15 +0000
Message-ID: <20241218001618.488946-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The riic_irqs array describes the supported IRQs by the RIIC driver and
does not change at runtime.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2
- Collected RB tag from Geert
---
 drivers/i2c/busses/i2c-riic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index edf2212e96ea..378887b133a5 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -414,7 +414,7 @@ static int riic_init_hw(struct riic_dev *riic)
 	return 0;
 }
 
-static struct riic_irq_desc riic_irqs[] = {
+static const struct riic_irq_desc riic_irqs[] = {
 	{ .res_num = 0, .isr = riic_tend_isr, .name = "riic-tend" },
 	{ .res_num = 1, .isr = riic_rdrf_isr, .name = "riic-rdrf" },
 	{ .res_num = 2, .isr = riic_tdre_isr, .name = "riic-tdre" },
-- 
2.43.0


