Return-Path: <linux-i2c+bounces-5987-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C76A69680D9
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 09:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FC2128135E
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 07:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3722185B45;
	Mon,  2 Sep 2024 07:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+JB4mCR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C456A17F4F5;
	Mon,  2 Sep 2024 07:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725263020; cv=none; b=LSYzO4QP7kFhXQQJ5y73kURkzyr84HYT/5ldnwdxwG72f3GXmYfjN/j9lx3lvmWRveCGPFm8WKTHul/DK/CvTAPRURfipUKgO6IGTJJZOg1sOTqDASis2tcSGYA8NNC4AJ+Gb/KtJ1Vg24Lm7RmrnuixUcBA8cutrsG4UhYwC7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725263020; c=relaxed/simple;
	bh=GBoNCxNr9REX/WUBO/XisBWT07mZUtKn3mZVR/uqRtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0jAQGXNVXdnlkjfcKyQ7pvJpR+7fx1nC77tOlHesV5w/4X32ZDQlWlHKSw2b323isiCD3vCphMA4ezW4RFx0jeSCC2wngAT46SSGVibquv6QxETGlLKD1pKoRjI+aZBl4T7GxV73J4AxzuyTE/AxgnMKf4jwITN4UE0oXblOqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+JB4mCR; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c218866849so4063022a12.0;
        Mon, 02 Sep 2024 00:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725263017; x=1725867817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6uJEhYo1wgA15wfbrz/2U4r9R3nPVkJpmSXzlK2nlI=;
        b=T+JB4mCRZwy0g8GM7TA+/s/VRtbD4nmj6SDeXIuPcOwWiMfo0Nx/xUfC9BIIBLwQEh
         kc90RVbzZxHLnDZ1siA7q80Lrz5YO+qsw5aOyb6woHDrE2nHmIfnuZbzUdklWC7E7eTz
         +sc4Qq+RQoNAL5+9XcZCc4E7AA7Gx2BTYvrVQ9HO0fhsuVUIYdWtZeHTs59PtH4zqoAf
         a1gqMomEWsW9iaElJFx5S456aOyIoa2zh2Jp4dNYCvQEffY36PaPYH9nouRvS3UAT5R7
         7v28IzAt3Xj5R0QhyA2UPIi30AR3ujqvNHpXMFu1iJ1MF6lJ8a73M4KhSFl1CiQNI+C6
         kiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725263017; x=1725867817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6uJEhYo1wgA15wfbrz/2U4r9R3nPVkJpmSXzlK2nlI=;
        b=QF5VCo7sFIDCJY85bKPXubKs70GeSMxCGuGExDlUaLiaTSG5LYpx2twQrk0P5y2c+/
         tjvrxt5WZiwy+4PL3yMBYM/NX3gZ+nI8FVAl/QKgLPAPsROcko6JrZgE9yrT0iOljOz5
         1E/0Su56BtCg9VyUjGj1l3VALCvql+ZDsqbpuP9XjHpx9F/q3F1IWyaRb/80Y475neUM
         l6S2w7k4IFHQWmglVyRglHzngNp1AO50i11ohNHItcgZuC1ziTuhowbmApnU5DifBOo6
         PeztR2yN1Mx834Vb78M4oNm6GvSKSkD4xqPqF2PTxgdinLbZH2QnWWGzbR6Z+HMs+1Bt
         26iw==
X-Forwarded-Encrypted: i=1; AJvYcCWtNVBaDPrRMlwo/XfzxNi0UUyKo6Xh1zbEVcxB83ir1m7UuzK72LAc6FxrZ8JB0XL5si4bwXILJov6s5w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Hk/sQcYeIq/i7IqBY1Qo9wRic6Eooh7a3UMvMq3dd4uG7VH4
	SB0KBPpDHjnNdDaMAWIF/UzcjShqR+K//i+wm3J44/vsgRxawxXX
X-Google-Smtp-Source: AGHT+IF+gPp7Guk0AwVW4KWTtsV4XPy/sheRsdCIms+DFiV6eNdF0CbTkwUp9ipAFhx6UBzgr4w99g==
X-Received: by 2002:a05:6402:35c4:b0:5c2:2ba2:6841 with SMTP id 4fb4d7f45d1cf-5c24236d23bmr4206113a12.20.1725263016697;
        Mon, 02 Sep 2024 00:43:36 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:3786:cf07:4865:dc9f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c24ff04551sm1975931a12.35.2024.09.02.00.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 00:43:36 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	Frank.Li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v3 3/4] i2c: imx: use readb_relaxed and writeb_relaxed
Date: Mon,  2 Sep 2024 09:42:03 +0200
Message-ID: <20240902074330.6349-4-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240902074330.6349-1-eichest@gmail.com>
References: <20240902074330.6349-1-eichest@gmail.com>
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
index 2e86d363e186d..9917f3e1d06cf 100644
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


