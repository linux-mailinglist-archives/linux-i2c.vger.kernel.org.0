Return-Path: <linux-i2c+bounces-11496-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DA3ADB09D
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 14:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B5E73A1C96
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 12:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE55F285CB8;
	Mon, 16 Jun 2025 12:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="EdILSAIZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A9E285CAC
	for <linux-i2c@vger.kernel.org>; Mon, 16 Jun 2025 12:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078303; cv=none; b=QBxaN/osGKiMCIauxQMMnjbRcDnMDbR3ZagSKTX1hnXaaXMQDbA7aoBoNduxUD2ZLzwYNo6/QYofH2tL7X39tk5zydYJdTiiroQcl3/tilcxscI30LQWIevVhRwYgWADhF4Ouw16EpI7pA1Hk+DUPZ9xew0idCDl7M50m7SxA0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078303; c=relaxed/simple;
	bh=9k9Wh/NoYsqbKlKsFE6tFkqP7y1xy/55zKbtVtGtJXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dtL5KU5JBkG8lGc0d2oeHjIdAGyI1uZuutXFtAxwJeQhkrLUQfB4XtUBa1gU9qHqRUuRyISMdBUEZeeGd71ZpDJE7o0te9UEwwzkEEx8oxCXOXZt6aKp7nTWROSiiDTXJ6WNy/mKVCfMMlHdkClClRfpq7TMgHdl/THGlnrhWpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=EdILSAIZ; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-875b52a09d1so95092639f.0
        for <linux-i2c@vger.kernel.org>; Mon, 16 Jun 2025 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750078301; x=1750683101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S/rRqga4nciTe+40s1lGUJde2Ttgzu3tg/+nM/gCFAE=;
        b=EdILSAIZjrQDawlMlERPytnM5jrP/lgXhVtRY0XasclPozbLQw8c033FbZxIYn4h8n
         5hYvZmkHxE8OA3GtOLSO8f0lVZCoVXQ5MCsy3JpZKtJn4cvFsBP/MMeKHB4Y1qkDiMFM
         87Q8QWi5SuS5DlZZDRHF0Ga9MPW/bFWlAWfzJl1/0j0hnnf5sxZaEBFNml2bBl1zbYRp
         CTqeZCENc3XTtQw/ctb3Jay7wLVKllLHOBeWPzL40EwdZJvnPcvMgL9mCZUVAz7uYmOi
         Z8QSlPYNvsFao4aokb8MT+OW4H+fhWl9vQ527iS7mI/z58LhgRs3se9EJjWrTjgb6+7t
         t8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078301; x=1750683101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/rRqga4nciTe+40s1lGUJde2Ttgzu3tg/+nM/gCFAE=;
        b=vgu0nuqJ9Qd7qQUIPxhjhquLll97e/3vlRVhI5rHNPA6xn2A0JCxLWNBxZxe+FP8X8
         xCKNPh9I2EgmQgmqwYaYVvFzyzFbHWl9kRQOaman3euoZuE5cXSERBWATlSA6DWELLEL
         fE/34OJgGT7zipckowM0464EbN6iaOm7NyPGRhPczbMH3m6y3T9INSLrlugWJl1OMBfC
         U2Z6O06ibuzfiIrkJuMqmpaKcAaEVD/HcTvEQQcE1t+W4LBlJKq5Xcr5Z9t3KqUK0BHa
         uCTZwqAmgJw/0tXdEPqOV4n08ke4CTIO9KhBgXsFANFWc8LfyzTgQBs/yIQEVqXhZCU9
         uAPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtUZaf7s4+y0uK+T29AHwHjPlOQv1ZoaoTdLg6ExTkriKI5afRe01GF17pKOI3tH28sJQGjoM2lnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/bhtUNDyO8YisjDNXYtQLRTOjT2hCdNQgvB0fNl1fNsfghuyK
	5ZV3UiyYHPAxzM035o29dFuaoG7KuUDd2gLDY80mONxjgR9Fy4/HSUjhxyUn6QWxBhY=
X-Gm-Gg: ASbGncuIL4YLgJ6ayYLJ7AHp/IUNzVEoQ4geE5ZJQqPN7xh70t9hxjpcatw8PkBz/K6
	TW46cd03C6ULFUM/CZ/UHf+uMT0AGauYEgD4S8XRMQ/ou+qQrPHltxs+czCDLW0CEyjtpPKozHx
	fPaX7AHDsb6xM1kaG9UnRr79x6nVb7Fua4uBUUY0oIi3tkNHlGiiHpZg37Bd6VyKlL3kMYlqOL4
	3sWYqeCK47aV5gwguqzeCgXIhN2i/uHmtkETmbf0LB5KksQHoJ+2pCjeO/xQo2BxP0NTn6R2oab
	3fouXMXYD7osqgYg3nXqstFUyx14vsAY0Dbtc65gvgASJzb5/0AujNzA4Btw05Hp0xMftDqywiD
	R22s71vewtzvnRksRRRenO9noKoirgcM=
X-Google-Smtp-Source: AGHT+IGBM9IfcIVPXLIx3r77XwCbfXk8tkksQXCR2d/8SBqn06Uhn07s7o49RLoWiyjUv193p5+5QQ==
X-Received: by 2002:a05:6e02:1529:b0:3dd:cbbb:b731 with SMTP id e9e14a558f8ab-3de07c55b92mr92098655ab.9.1750078300563;
        Mon, 16 Jun 2025 05:51:40 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b442fsm20352865ab.2.2025.06.16.05.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 05:51:40 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andi.shyti@kernel.org,
	dlan@gentoo.org,
	troymitchell988@gmail.com
Cc: elder@riscstar.com,
	linux-i2c@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] i2c: k1: check for transfer error
Date: Mon, 16 Jun 2025 07:51:36 -0500
Message-ID: <20250616125137.1555453-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
complete, or if the hardware reports an error, it returns a negative
error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).

The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
which is the i2c_algorithm->xfer callback function.  It currently
does not save the value returned by spacemit_i2c_xfer_msg().

The result is that transfer errors go unreported, and a caller
has no indication anything is wrong.

When this code was out for review, the return value *was* checked
in early versions.  But for some reason, that assignment got dropped
between versions 5 and 6 of the series, perhaps related to reworking
the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().

Simply assigning the value returned to "ret" fixes the problem.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
---
v3: Rebased on v6.16-rc2; included version in message subject

 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 5965b4cf6220e..b68a21fff0b56 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -477,7 +477,7 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
 
 	ret = spacemit_i2c_wait_bus_idle(i2c);
 	if (!ret)
-		spacemit_i2c_xfer_msg(i2c);
+		ret = spacemit_i2c_xfer_msg(i2c);
 	else if (ret < 0)
 		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
 	else
-- 
2.45.2


