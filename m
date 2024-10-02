Return-Path: <linux-i2c+bounces-7181-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0430E98D223
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 13:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2817F1C218B4
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 11:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37AD200124;
	Wed,  2 Oct 2024 11:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4dy5qLZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10079200101;
	Wed,  2 Oct 2024 11:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727868035; cv=none; b=rX0gvoknG3gcQ9su/1IwU/El/4H7fZ7MynITK9gYhHsBH1hzaVSTQMV16weNojw6Rxhj+9lsFXdI9HylUe1+4Jx3Z6ML1agcr4zWjDdotLx2SmcPQ2+35QSto8p9ES0l31v9Qg6KLic+VyS27LjpsAO6Ysbq64g93BqTdCds7Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727868035; c=relaxed/simple;
	bh=E1YeGuIBk8BwF197H23q4KiKySl80PzVksLcuFV4vmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbR6esdwHuh/T7SZLAd+8yoF+dQpV0/if4v0kcvUsrGb/VXevJUEUSC89DsYvPIN93pkFk+YTg6H5/xDXDDhC7O6Pf+PDNEo1Ue/CIRKZIVBphML7Ls0yPWhIkuD8abT5IibENmxhL6zYbd3UDvhBsQRal9oM3XBvmDTB5hrH1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4dy5qLZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so80798965e9.0;
        Wed, 02 Oct 2024 04:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727868032; x=1728472832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4V7Qw24AIjD9e3DTOuaXw9uJfa/Y+gcgalY/kZOlqpg=;
        b=Z4dy5qLZNofGrevIZAVCCucNyNp5Mp2rnFo1M68jEB733pjYs2mbILoJ4jzX8/bHUk
         MKPiTa19GlvHHjU11p9d/r5+U6oZtvvDfMvtlP6C5Rhc7jdC85jhJI5varj85cCrJ5xp
         cue2Q4OxHIcrlCQA2tY5jnhc/bS56whi5nAqB/EJw6k1yyNe7AS0eMn3+Aq70MMTPKNU
         5kGTX8m8OpezjqwG3VeoXdGrGChXMz+GbqQ5jNgNLyve/3WgruaTF4wPLV0w/N1V6Jnm
         COYRwyZ7OEk8pAUHMLgH5P3VTUczBny/G7BjHqNzgQ/4Mw8j1SB/qLvhduxWNhYoYrDt
         NcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727868032; x=1728472832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4V7Qw24AIjD9e3DTOuaXw9uJfa/Y+gcgalY/kZOlqpg=;
        b=i9FBwrGXZD9N6Bo8XMKpvum7ZJpTtsdPgpKLZDyLjeRg4Vn/aCMJA7x7AUhZUkz4rM
         7RqhDR8fkd7+dE3FgEB/fV1CJiuNUurcjWa8FrCTGYeYxZaaqNAEAHpySZ87wWZwmtph
         RTM6054IGb6HHUQWfUuPcR8dHNQpEycZo/H3pwkGKvo5Ly+yQ9awkEvKNw5DwsqI1z1u
         PLB3zJA6xnGhHP2/39JMoBJcjWFDUWxxOEH3Vv/4kDL5uzokcFhPMqbZ9GUNbdyR/Kkz
         TtZFfAN1MMYXCyBAPPUyuIRPoa/cRJ1caZ5zxBr0hDNM2EecuhNaM/9YcwIEYr/NJJEk
         +69w==
X-Forwarded-Encrypted: i=1; AJvYcCW66vmE+Ig32aEQdULa9L/A2H793cR4GWnm1vTzSP38qzHEncWdx0xqS7gx93hJmgsMCUjcARaG9ZsY/SY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu2d0XGMf0siYzqBsOUxXfNmwrf0jofklwrhyZcxRpPIqWXxme
	OPAED9fX0DhoUA96nKL2q08tKXRO8GwidTI0L+94b4ZeBN2GTYiF
X-Google-Smtp-Source: AGHT+IGehBz2wvp4octtBZnLUT1OhdST1Vf9e5fzfCVsKngbJHX2vTvVmrVGdPh9ghtRzv5CYCn1eQ==
X-Received: by 2002:a05:600c:1d88:b0:42c:a387:6a6f with SMTP id 5b1f17b1804b1-42f777c365fmr23211065e9.20.1727868032188;
        Wed, 02 Oct 2024 04:20:32 -0700 (PDT)
Received: from eichest-laptop.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f771a1209sm23530685e9.0.2024.10.02.04.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:20:31 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	francesco.dolcini@toradex.com,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v4 3/4] i2c: imx: use readb_relaxed and writeb_relaxed
Date: Wed,  2 Oct 2024 13:19:41 +0200
Message-ID: <20241002112020.23913-4-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241002112020.23913-1-eichest@gmail.com>
References: <20241002112020.23913-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Use the relaxed version of readb and writeb to reduce overhead. It is
safe to use the relaxed version because we either do not rely on dma
completion, or we use a dma callback to ensure that the dma transfer is
complete before we continue.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/i2c/busses/i2c-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 8e9cdeff278a8..f70522a83f823 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -313,13 +313,13 @@ static inline int is_vf610_i2c(struct imx_i2c_struct *i2c_imx)
 static inline void imx_i2c_write_reg(unsigned int val,
 		struct imx_i2c_struct *i2c_imx, unsigned int reg)
 {
-	writeb(val, i2c_imx->base + (reg << i2c_imx->hwdata->regshift));
+	writeb_relaxed(val, i2c_imx->base + (reg << i2c_imx->hwdata->regshift));
 }
 
 static inline unsigned char imx_i2c_read_reg(struct imx_i2c_struct *i2c_imx,
 		unsigned int reg)
 {
-	return readb(i2c_imx->base + (reg << i2c_imx->hwdata->regshift));
+	return readb_relaxed(i2c_imx->base + (reg << i2c_imx->hwdata->regshift));
 }
 
 static void i2c_imx_clear_irq(struct imx_i2c_struct *i2c_imx, unsigned int bits)
-- 
2.43.0


