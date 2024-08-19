Return-Path: <linux-i2c+bounces-5477-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 909E395647E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 09:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C07BB1C21CBD
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 07:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA851158DA9;
	Mon, 19 Aug 2024 07:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieMBoB8h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8DB158858;
	Mon, 19 Aug 2024 07:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724052062; cv=none; b=jA65YKOqEAJh/eDYAtaSOtX79UbmFcGtMSBr2I12kFjqwWQjmIB0rYNP7V96BGMb21bBXbv7KnPI5TuNn/NThFQWI0KI61Ug6DRWio/d/P3Suhm+ro7npaHepIBeGgPgpQ9KVdU8zUmmXyF83tDftJ33wQXFTUNvOJsv6I1XTng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724052062; c=relaxed/simple;
	bh=cCzB2PLlp9czvX63xNjd52f9N0rDYZxwBsib+7fMQeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SrbLPnOUN9EFu7FIBsd6kkLRHYBDXNqRFEqzpVHrwpeUiV3h156iAxl/59W6PLMP2o7Q2BgpuVRzBbkQvz6SBr8ConXo7oezM1In2p1NMPta7YyawuAegfJcDig+ITNEli0epg3qy7JHIQSaovMp8zXXH7QeRLlYI4dY9nv9j+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieMBoB8h; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-429d2d7be1eso20307805e9.1;
        Mon, 19 Aug 2024 00:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724052059; x=1724656859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hORPvwJyh1pncU6srJU2aZd0plw9XdxlfvVdC6EA72Y=;
        b=ieMBoB8hH/vzP6YAY1AO92C7anIuz8g2Y32x9L7MzYEzfg7QGfDkt5AYNC49sAArzt
         5nSxphLkw3ABXfoIBu8mKd73qkwNilsGuBg5JLD81fQuSST3EZpfVsc0XYHDwfnx34YZ
         n/WsRVGW/6IEB5AUtupU3sfo/0RhP7WMoK0P2bssRIxoT/BjNaexTATOr6sxqcqgtsWt
         w1FdPEOR+sSSrbuA2JXciqCkNunIFzKm/kk4ELnsV9Iog4FpStxMvbXfzVcFzyUGpRr/
         P1LDWVjEK2SZKbWv59F5ME1ePMnqiSFis/zn/BepBJBJ2Gcw8I2mXuSz+MCVAqREDgb3
         056w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724052059; x=1724656859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hORPvwJyh1pncU6srJU2aZd0plw9XdxlfvVdC6EA72Y=;
        b=pkpNMbl8h8cPnr8bNo1ogAwpSK03iSjMQHQjblIYYueJpvRGig79fl9CiuQnd5O3rt
         0JtDRcTK/FQc0R5TQe6HhgBcv/4XkjcRAJ1McGxQ14CWxcwaoI/56+QvLYem3pqTyqAF
         DmEqOSMYLEvlxT5hyOHwCal+wHmUphPyn/yf+yPnctBN0FbkL7IpOO79aodGvl0Mg47+
         EsxfyeDJeg8O4xwy7C7GwLIPQe/irPSmVaiVuFb1u8g5sGy95BXMTHzVq5n/GQonpVg6
         xPkPaxefAPor9qtjA2/nMzZI9kZXbAWeK1BcVD32we6vNCTkH+XnJndtXWvvr+ab/X/V
         7/2w==
X-Forwarded-Encrypted: i=1; AJvYcCW/oIFsSkKvfM2xn7QDO21Iv+Ca/c6RUoii4bcpu8xdUXhYiYMQt5FNxR1CjH+6LkpXWOI3m7OpyKyiWWhdDyoErNLabEaAI0Inispe
X-Gm-Message-State: AOJu0YywYR0R/oroy/GgsiFp+vfZHA1m3WjZMmmaNI1rGOP3cd2WO3If
	tTWz6drun36sFm+9UO5uKL4WfCwd49wnicBnY5jWNAua3DSxF3UM
X-Google-Smtp-Source: AGHT+IGOTzKSg8W8hVyaEXI0HVPdRysysLEpf0RHZuY8lmPFwi3NAM0xoi+k233+RjaJ9gKYv0ipDw==
X-Received: by 2002:a05:600c:4f52:b0:426:5e32:4857 with SMTP id 5b1f17b1804b1-429ed8a3958mr68907965e9.0.1724052059061;
        Mon, 19 Aug 2024 00:20:59 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:a64c:8731:e4fb:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189896a9csm9683734f8f.79.2024.08.19.00.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 00:20:58 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v2 3/4] i2c: imx: use readb_relaxed and writeb_relaxed
Date: Mon, 19 Aug 2024 09:19:09 +0200
Message-ID: <20240819072052.8722-4-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819072052.8722-1-eichest@gmail.com>
References: <20240819072052.8722-1-eichest@gmail.com>
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
---
 drivers/i2c/busses/i2c-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index e242166cb6638..ccb466c50f598 100644
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


