Return-Path: <linux-i2c+bounces-10713-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDBEAA54FF
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 21:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6676A4A81A4
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 19:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE46927817E;
	Wed, 30 Apr 2025 19:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUEJUPA1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C881D20E032;
	Wed, 30 Apr 2025 19:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746042420; cv=none; b=uwJj11wuSG49TkLxLqOL4X9mg7ZP38plzHun0Kk36UfBGk0S/OgTcfxaFf4kCBgMNTRRuXCwCphZYXJM1YNysxiTQS4cLshs0IbjXT1jL4ss4O/AG4/dzSjT+26imPBnHDY8RhnBgEfjXoB+bRYHH58gYxPH0velR9//Q8QjLAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746042420; c=relaxed/simple;
	bh=9LtxQBPKOiUjXtlTHWPxFOjZNz4jsv5g8e0uGwjCZfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RhyqICbUrCmGl4iWrex0lhGfzDuKyfpfFxs6PC2U2T8FqSoF2TlTbqU0uTAHkH6a62Lmx3Hd5c2GfHbepneuMLBfRmrqiHz0Nxoc/Ms+Oy8qBpyOL9Z7WuTE3w17KU0uuAEx4zCAc/lDpniWiMWRQX8VW2tcKvFi4AqNVBHWQos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUEJUPA1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39149bccb69so105978f8f.2;
        Wed, 30 Apr 2025 12:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746042417; x=1746647217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=221neJIU1ejQ3qf8VHMblePVKbx+mBZh8+ACZ1QYRxg=;
        b=RUEJUPA1bSUBBZ4HRvlW1WRPkeV1cmEn+q0j2RIkqw1QHaZNfqanVoOoWmNwL5VqZ9
         2jeGFzEI47OXZ6Z+vwpMRhHkbW7wtyG5uIfaUTXb86qHy4W7ftztOcnAlXCHL+plcrcG
         cRcu7YPfuu8VZrZEGMdvLaiTxkaAmIpwehnZqtgUZnWaGmndhMW9B4EGaAn8h9s84qBM
         VrnT0N//dVhuVNpPfJpdDesqG1+I5hFK25gZskLwdtyvxv0wE1cccZWzQUmXQyNzsmXZ
         fTMTyCbuTdr1NpGccc5wFGrY6XE1xvSCCuV2P8/smOZkzz33N7K6hmBzTDs7yp8LhsFA
         TWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746042417; x=1746647217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=221neJIU1ejQ3qf8VHMblePVKbx+mBZh8+ACZ1QYRxg=;
        b=tJ0To90VMRFOlG+bO0q0yeaRwG1nyQgZ5REnb3sUD7qL2A+zJMKIygRrx4EdvMIufM
         huTNljG81ZB8fif17LILLl3BOZ/Eu2vVafaQ5WVEtlfjVt+ZYrTr5j79wfsr+tliu3Tg
         ZCpCzntjXaWARgQFuW/GYKPXqy9znEVeXJLRW1Kdz7EXNRMcHsL287G0jHYbudNjHLKf
         hvgkwggYc1RoCtt5bYYScQM1a7d9qTWXX/FoouG7xMPJJGXk4MAzxqcsXPBd25+b8q2I
         fe9tgzmHie0b3pkxVvClw2YuUGlwEdaG26wPgTH5uR+T7NDNtvbEA0TcMe6z91bq5V/m
         tioA==
X-Forwarded-Encrypted: i=1; AJvYcCV4E4QcGhcAUc9BDlx0zJEn8ku0HhZ2G+fV4YiVg8iD2yHw7MAVqFS/dwNA8TzB5E0CgUudLyKZtHT5XOOn@vger.kernel.org, AJvYcCV7DqstczHyVx9ECjxagQIOhVUg7qJliwUMjeWXofVKty3agZRiu6Vaz/t2YPm1TRrTLP/PAKXqR9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzxtxAArIoT8Mh1+yLif9BjXqY79HdJ0WtR5Go1rjxVsWH9/Cr
	UvRGCgrB47DwCbrh1vh59iOAVp0QM9rEpOfUmfBolrR/rtQkXxzGnO7Z2uQS
X-Gm-Gg: ASbGncvCEbbLF7NhEIEim6S6dWwX/1MYMatOwySPS8qjUZ4ELaQPMeJcabvTdNmQNyd
	wzdJCYnGOR3LasNqrvazRNReF4BNao6rgJK88FISL47om8Kzoz1q6WrWZNBRHl24QgC947MAMqT
	D6ZFfQ7QndTwg7YKfIVWxBDcYbx7QcVa5L7/72NXIJWYUPYBtZjRZ5NADKOhZ+U+doy/FPQkSCE
	SvJZo4pNNPoKH9yrEULdq6/VHKu+cgRCNvrVEi1nQxGWYOZc5M22BaEvRudq4af3k004QYRxf4e
	1itfHxgX1qixyqOg8S4u9W8UXgphI5CItqB9YIBEq3Ns2CsCohVK/7PqMaO17CruXnt3VNpCkM4
	=
X-Google-Smtp-Source: AGHT+IFqdejLBnkd9J3TsRgL/QFN+1GBCgffUsVhPYHdn7SILN/NvpuykFboLuGaK2KpbWOmv6ufXw==
X-Received: by 2002:a5d:5887:0:b0:3a0:6c62:8169 with SMTP id ffacd0b85a97d-3a08f770be0mr4571395f8f.25.1746042416998;
        Wed, 30 Apr 2025 12:46:56 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46517sm17861646f8f.71.2025.04.30.12.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 12:46:56 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 2/2] i2c: riic: Recover from arbitration loss
Date: Wed, 30 Apr 2025 20:46:47 +0100
Message-ID: <20250430194647.332553-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430194647.332553-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430194647.332553-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for detecting arbitration loss in the RIIC controller. For
certain slave devices, it was observed that after I2C recovery, the
transmission triggered an arbitration loss. To handle this, initiate
the I2C recovery sequence and retry the transfer.

This ensures reliable communication in scenarios where arbitration
loss may occur after recovery.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 740e53bdb2a9..86404d2df244 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -79,6 +79,7 @@
 #define ICIER_SPIE	BIT(3)
 
 #define ICSR2_NACKF	BIT(4)
+#define ICSR2_AL	BIT(1)
 
 #define ICBR_RESERVED	GENMASK(7, 5) /* Should be 1 on writes */
 
@@ -180,6 +181,7 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	reinit_completion(&riic->msg_done);
 
+retry:
 	riic_writeb(riic, 0, RIIC_ICSR2);
 
 	for (i = 0, start_bit = ICCR2_ST; i < num; i++) {
@@ -193,8 +195,14 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 		riic_writeb(riic, start_bit, RIIC_ICCR2);
 
 		time_left = wait_for_completion_timeout(&riic->msg_done, riic->adapter.timeout);
-		if (time_left == 0)
+		if (time_left == 0) {
+			if (riic_readb(riic, RIIC_ICSR2) & ICSR2_AL) {
+				ret = i2c_recover_bus(&riic->adapter);
+				if (!ret)
+					goto retry;
+			}
 			riic->err = -ETIMEDOUT;
+		}
 
 		if (riic->err)
 			break;
-- 
2.49.0


