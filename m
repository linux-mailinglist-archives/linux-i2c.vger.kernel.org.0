Return-Path: <linux-i2c+bounces-11081-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEDEABE3F2
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 21:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E9A81BA7AC2
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 19:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E8628151E;
	Tue, 20 May 2025 19:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NR8JDEpp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C7727FD79
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 19:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770261; cv=none; b=XuTgxFY1wwnrwhai2PtT1iSUtimiJdQQFiTkl+fahP5Bg+Cjd089PlFAbQ37+CQFSx4wbvDkWIAiESIGBlIodUqrBZBTw9dn1O0JWRM9j3PKJekoYGupJe0zPKcmkHJkHp45E21dpZIDP1t4pT9DSKR0FdNR1PmmmuYgipIj+n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770261; c=relaxed/simple;
	bh=ynmAYPvAH/LrmJpo4MDryQML6zzuiHc67Q5YNVT/TUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Je6kdgYKGN03WvKI1swlncf+9egk3yiszwz43tVhNcefH2yNpRG3jeQaDkCLrenQB/3dHKWqUJNZK0w4NzqwlY6lxSdG6HTDhlGzOsJE0cXHFKoVR262CTDdYZz0jRnoIpp4WJhap5Kzeb/l0djei4vrfeyrVwS77GGumFiD2Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NR8JDEpp; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60119cd50b6so7372004a12.0
        for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 12:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747770255; x=1748375055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMzYJhCcEP323syMKgIcqE5uCw3H1V/W8yGCAUNpQsY=;
        b=NR8JDEpp34gdAKQqwHQ9QNamdlKyxETX1jIy4pVhFYsEquJdQNKwI4Yqf3F6NSQi9x
         w3CH3Pevgkx4l0O4HaD5coSh47CVqg6HueuuVuI5Iy7vUCSCc9SHVzKc/QOPnXgxooCa
         ir/3bji0Zkbm3R2xh6+Qa8vta81ilZXOfACGt69p9MsDy+kXJ03Md1y/+cAIu0EtMPvg
         f7NfxELDMD7j59WSfmHMUbiw9yApZ9V9lXu48mPSQLtaRJD4JBJowftT7aIbFbx4FSQU
         8gh2kE/cll08V/d+kTNrMs2+ES+J5zzygRbIiVVBxifPU70K47nRyhP8XEVeYP/+Ls08
         XNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770255; x=1748375055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMzYJhCcEP323syMKgIcqE5uCw3H1V/W8yGCAUNpQsY=;
        b=DoQvCBpVrxhstLRMrNuESD9UKjLd/8ae5/jEB9hQI1kMswo5t+/cc7UuT7OROMZ3xN
         eLH42LXf0tQPV6H4fF4M0ezsroWgtJ17+L8AxnEmpKBkXScZfJGvUXm79/2YwiHwVoQc
         NMlnfEH/RWwrvfMHZFTjF+Ax7uNMHa1RJguI2SNZ6SUYYwp4tIwusT0Y8e2N5vB+qdA3
         XGYXujAPu4963/9dqr7FHS+9Me/ArqDhZUGvC6CZ3bDKGB20FXB/iAkp1r+WTuGbk7uh
         IkN27OpsrL2aFvYzSdGcX/A89myTF1qHGA7/ChVGMdHC4lJwKQWrSTfgqtxj4HiOi61Z
         zVnA==
X-Gm-Message-State: AOJu0YwDs2jy/++j4NEkc4EgRQiimeja3Qaf5wKsYc1JVLQqHlKRXtoH
	x7zEFaXZt38jr2iOwPlLmQQpIINGx03WK7pYwrxRcwMYmkf6qt+3IZLktQ7mjeX1Zhw=
X-Gm-Gg: ASbGnctkE7lS54RvhhSA0hdSnPKJJXtfzvY8WQWBGjdgARh2cnUjmm/Ew7ENkBVtDi7
	ti9oKk6NR2PTKbRp3u301w+0TqCRfYosWFIYfOJAqEBjBKMI1RlP3V2dFVqAUpVCofeRGNiEGof
	h9VcRMUMlVicqvRFr4zXQnIswd8cZ0C7LMjpR15MyIDA2eYmbJgE0hKFVYKwxuaxF7dGcbmE1th
	t47zjzmILUm1lwIl1KIKf6xVW08Zlif3juZWFNsUV55YFu519J2hAobrvOuGuLvlb83EZ+p9j6F
	zvu5zN0xG+JuxOOmZYQUQZUYjoAby6XMaJ6uAmfJzdG5/sc8Geg644uTfFjqIw7nzcw/sQGc6Fw
	suHCAJA==
X-Google-Smtp-Source: AGHT+IEOZKLkNNOKqbGOrrrwFvzZGZVVSB/SHPQM+mtOGIzuM939ggKcukOo9Kx6T5AQzkd/ey1pjA==
X-Received: by 2002:a05:6402:2789:b0:602:29e0:5e2f with SMTP id 4fb4d7f45d1cf-60229e061e6mr1125654a12.10.1747770254571;
        Tue, 20 May 2025 12:44:14 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-11.cgn.sunrise.net. [194.230.145.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac33a98sm7736122a12.49.2025.05.20.12.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:44:14 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 06/10] i2c: stm32: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 20 May 2025 21:43:56 +0200
Message-ID: <20250520194400.341079-7-e.zanda1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520194400.341079-1-e.zanda1@gmail.com>
References: <20250520194400.341079-1-e.zanda1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
---
 drivers/i2c/busses/i2c-stm32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
index 157c64e27d0b..3ca84fef230c 100644
--- a/drivers/i2c/busses/i2c-stm32.c
+++ b/drivers/i2c/busses/i2c-stm32.c
@@ -39,7 +39,7 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma_sconfig.direction = DMA_MEM_TO_DEV;
 	ret = dmaengine_slave_config(dma->chan_tx, &dma_sconfig);
 	if (ret < 0) {
-		dev_err(dev, "can't configure tx channel\n");
+		dev_err_probe(dev, ret, "can't configure tx channel\n");
 		goto fail_tx;
 	}
 
@@ -61,7 +61,7 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct device *dev,
 	dma_sconfig.direction = DMA_DEV_TO_MEM;
 	ret = dmaengine_slave_config(dma->chan_rx, &dma_sconfig);
 	if (ret < 0) {
-		dev_err(dev, "can't configure rx channel\n");
+		dev_err_probe(dev, ret, "can't configure rx channel\n");
 		goto fail_rx;
 	}
 
-- 
2.43.0


