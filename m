Return-Path: <linux-i2c+bounces-12528-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F1FB3D1EF
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 12:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 190B7189E499
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 10:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9816B25C809;
	Sun, 31 Aug 2025 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KePVivY0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D3824676D;
	Sun, 31 Aug 2025 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756634730; cv=none; b=A+bqWJ8Bh1JUsV5KFURhpVuIGKtsTTPTy0rlzClBUUaYZHd8CXfS+Mad0H+Rwwn+nQtUH/tgLtPnB9/Riws3lQ4Gov2Fjc3yQsPdVbrC4Jf5nDKE+Iar25ArkSKkEAmnFpOsNdJRtFXdICP48Njp35lINGyQ5kfTnS5gXi8nikU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756634730; c=relaxed/simple;
	bh=326M5U9OojDe1lhkwFS7orxwbfULH69OkT0S7OD+L1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WbrEYhI+B5baTn2Bcu05zthULQiuTaqgY2KEIhZtHazttX/jFQx1bPH1XH/kUIuOFAw7D3LE/K8wBOMsZLXTu9H58YrEUZVF5jbO2blvPrrwIFhgSzg7SnYFKR6Bwoz6ixbVskmJ5j/3NJd1XqmR+KJUXGBHNkn9HLotv7Qtmtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KePVivY0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b873a2092so7271375e9.1;
        Sun, 31 Aug 2025 03:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756634726; x=1757239526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqzVllIT2yt3PFzcaYved+nt+MYV4oPu8rzPsTcO43Y=;
        b=KePVivY01b+sEWZUFkZ4lR8GYP2dKre9sSBKpDRT+2NAA7N15mgg6DkLUlrEJH6HqO
         J5Y4dHT6Qi1FH1CB0BhQIMYCOwgNw8ITvQotwn/x0bdjxw+kXrUc0NYjFRjeccOH38Ay
         MlLKUD+91nDx7nlFXn+MlV/pEsVlTMnUblXW8jiYl6pl5Aa8U8MFRRSc1aVvjobganz+
         OSL56++uMCdrbInbGPaOAEL33mVSt20NZMwKQKeTR2Fjtz9afNT1IoWqr7EHpaSnAVFl
         EX8UGNVhX85CtDrpapJdSVO9lQxixzI2CVqYQiYjBStWtYIwiRYVS5xMbkAwyV27/nVT
         ClOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756634726; x=1757239526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqzVllIT2yt3PFzcaYved+nt+MYV4oPu8rzPsTcO43Y=;
        b=he2U/pGONLLj2WcJcZoHdHQYr5k8n3P9sq959frsdBoXqd3KRUWhjQZa41fw7ppPRM
         CdjMZuqzCvIbvEYIS9hr/oPxBZy2CHnTmhaX0eojVzcPAxlVNM858uoltmoitZLcbKOI
         vs9idZQAC1py4Nmicbq2jy06MyJiDwS4miixC2xWJr2qxDv2URWtSTxMz0tFY9fLBSy4
         m4EenpDQf9KydX5Ef1zLHVNd9PFaQCxGEbGx/ixLlj9+XGS5s94w8XXr3DHgChKRz87G
         Fx4ml8pbrVNi/8XNx5ejoNb5lfX+BH7ryNfw1lXnctJ7Q92Gp+zorQZchV04sHAnfS6N
         9hbA==
X-Forwarded-Encrypted: i=1; AJvYcCVkHQ+/LGigQeZA8LmCrcBVIN/Tv9YTY5QnKtuxociHWWqyDWjn+Qoas8YhP91dZWkW+sPUe8I7vEEJC3qL@vger.kernel.org, AJvYcCWbmQ8nmbftEz03pVo+rIfwNP+J93uXPZgoMijplOPkEh5T9USGj0b2UAIjYAAiCB6XUn0YbExbokJj@vger.kernel.org
X-Gm-Message-State: AOJu0YyS4Dx0zlRTHvtHS4t7FDmb+igCO0YCLqFEf23bgFumgm0EOhCM
	g+vjk1ZXEDHAZgDb1LKL47wMYl2YUS9j1calzCpQpR54rCAeLyZyEYBh
X-Gm-Gg: ASbGnct/363vkl8sT2Xe7oPVzb7JHZELqqBigZlJ+LSaoAmFtDIpTNS3Fh8mijfBhoY
	R0DZrBzbhMFfVwO1a3pvHVXKxkwy18gQ0iRl20PcDeQy2eSUK1ya2Upk6VZU6Gtj39m19xZgQTU
	bnavVP3qni19F+001FxMOaPUgocg3ASzREA6qPvGeJNNMge0zGqvbTgWyGuLGMzqmR65c3GuYZq
	hfj46vkCFPJXuYsDNzsOcQhux32CRCPfMkNuVM2UiIvOr6w6JA7L3U0Tfuz/yT+f7s4g+yZfcZ4
	cpHI2SvmbbOrk1M5bptWMcfFinPdrzmUUDIibONgbRX+OUvK9Oled6HQP0tu65KYsJJ0ncA4ZjV
	8djCjOFBi4D9S18nCbrXfSYms9sMJackeoJiDG+xx1KMCdCzytxhf
X-Google-Smtp-Source: AGHT+IE2G+a5prT+qXpeyJ3UQTjX9jm7OkOdX2x3Am5y8oGbKbwjj+GGkhgmDbyNqWoBEjoWWPwiiQ==
X-Received: by 2002:a05:600c:c8a:b0:45b:8bce:40c4 with SMTP id 5b1f17b1804b1-45b8bce4223mr3003655e9.31.1756634725971;
        Sun, 31 Aug 2025 03:05:25 -0700 (PDT)
Received: from builder.. (39-10-142-46.pool.kielnet.net. [46.142.10.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e68c83asm117505565e9.20.2025.08.31.03.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:05:25 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v7 08/12] i2c: rtl9300: do not set read mode on every transfer
Date: Sun, 31 Aug 2025 10:04:53 +0000
Message-ID: <20250831100457.3114-9-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250831100457.3114-1-jelonek.jonas@gmail.com>
References: <20250831100457.3114-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the operation to set the read mode from config_xfer to probe.

The I2C controller of RTL9300 and RTL9310 support a legacy message mode
for READs with 'Read Address Data' instead of the standard format 'Write
Address ; Read Data'. There is no way to pass that via smbus_xfer, thus
there is no point in supported this in the driver and moreover no point
in setting this on every transaction. Setting this once in the probe
call is sufficient.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Tested-by: Sven Eckelmann <sven@narfation.org>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz> # On RTL9302C based board
Tested-by: Markus Stockhausen <markus.stockhausen@gmx.de>
---
 drivers/i2c/busses/i2c-rtl9300.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 4177cfb77094..9e3517b09b3d 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -130,11 +130,7 @@ static int rtl9300_i2c_config_xfer(struct rtl9300_i2c *i2c, struct rtl9300_i2c_c
 	if (ret)
 		return ret;
 
-	ret = regmap_field_write(i2c->fields[F_DATA_WIDTH], (len - 1) & 0xf);
-	if (ret)
-		return ret;
-
-	return regmap_field_write(i2c->fields[F_RD_MODE], 0);
+	return regmap_field_write(i2c->fields[F_DATA_WIDTH], (len - 1) & 0xf);
 }
 
 static int rtl9300_i2c_read(struct rtl9300_i2c *i2c, u8 *buf, int len)
@@ -455,6 +451,11 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	}
 	i2c->sda_num = 0xff;
 
+	/* only use standard read format */
+	ret = regmap_field_write(i2c->fields[F_RD_MODE], 0);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
-- 
2.48.1


