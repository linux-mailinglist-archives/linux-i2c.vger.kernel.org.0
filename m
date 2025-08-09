Return-Path: <linux-i2c+bounces-12189-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CBFB1F70D
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 00:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECA557A59A7
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 22:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73502C15BB;
	Sat,  9 Aug 2025 22:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRHYrhmU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6802C08AB;
	Sat,  9 Aug 2025 22:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754777252; cv=none; b=JKXaHU8YIrzGvrHqjXLbnMafaqNvO1ntUw9dezjdy/GNhYhWna7WmY+Wl4qXAdRxBwLXw8NnjeqmRNwC0Xq6aA3WshSv3gGp7yfFM6NZqU32MhAqo51ARLsGRCfnn4hi1IeMh4BdLbiX/vw/2eXvAtiu3wymrhP5URgi9b8p3sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754777252; c=relaxed/simple;
	bh=d9Fqx107VJcIybGq4n1Vxzc3+DdazYBJ/EY0N505ZKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZZnakQ8f6ehmEPrPvpqNXVzAFHBKk9VFXCSWGxLsrLvPdINbpnc2GXelqCnWtkLRyk5GLEUyTs+ZmdLf7Nu30f6SCM2ev1v81qs6XAuaFCbMec6upXQN6YjKWEEqlPwZqXYBGxVq+Rwaln45Olu9cVV44kBNKUPGw/UTrJPhC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRHYrhmU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so16289015e9.2;
        Sat, 09 Aug 2025 15:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754777249; x=1755382049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/K8OtcDmjcXKP7Q/zHwb78jnIB7QQkghM+5rjTymugM=;
        b=PRHYrhmUK69W3aDRFWOheQPAGlf50EUXs9H1nUm9VYyuMER2UYB50ofX462SyuoBsi
         MnjwFwV9MVUvqdwZuUCtUwQ8Hh1f3IOzW18MDQvA3XoaL3G5J90ycRMjKs1d5bPR24CC
         v2clOw9oBBl2MuT/6EJpUjMhTNPWlorZQ5gHJUVaghRtqIBklQM/TIGG+vyJKHS7wQye
         H4zyKjpktYpSJdB+pXUDdDLa9vNq0Rpm3Demg5crLP3VoAUuchDfeP2Xr/nZx4nLuDaa
         y/163i2t3y1T5cOkthL3d2d7jsfoY1Xqfq0t+5vkQENNQwQR9BL/R4H7kp3akgQm/vB3
         tPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754777249; x=1755382049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/K8OtcDmjcXKP7Q/zHwb78jnIB7QQkghM+5rjTymugM=;
        b=OFoG1c4Jif6fwEA/EwnH1y2AqniwdV8eD6gfOiHRfhyv/FDmbJXNTMOaAE4DsI6unT
         jwZIx0mXFYgWCQjYZR99KcS84dF3Utws7MY8xrfZmEDOOLCfslcm3c6vAaDOxnEndw/x
         2x+7u9IHVqCVdcWJzq7U7R1zoYGPls0F5QaI4biOE/+lTuYFVmXtPpXruEOLCBJHdH93
         /JBIerfh1BrY2i8IaaB2fQYBn+S5CngThm/4l6CZOVUcq5RVp2pKoWEl0shSep5bDr6N
         5IJTl3kCSqM+GCPST/Xhw+56/mdzZ23WfiCYP/5o5Ntk5uuSnd84G/SRHj5G7X/Kx/7y
         8vfg==
X-Forwarded-Encrypted: i=1; AJvYcCWlEj7QsE+lOfgmY9oqnOhqP4iDVmXNnMZJBojRDG9YUmSl5gtO1TVW8uBbicrX0pwAuUVumrKnYR4bN0Bp@vger.kernel.org, AJvYcCXugSbe57QGU+mQa3wPWqynh6aBjvyNC7jenuNbro0p3XAIzIYy1d6ygyG3Rp5YyyiZxlZjMZuS+4Rl@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl3kne940diYJEkLNDyY1W+pq3G/9dkZJrsz4SGN3VKvi5tNIH
	KUA4vqOP+BshGS4Mcv7aFXKEvvRdO7jkhkylAIaG1XQgc+rL6IEEUjPN
X-Gm-Gg: ASbGncsX8YkVzXEeAbMXIQ69v1siXO6JZZmNbXksvZXufd4vRR3lsXZOELgv8XZ04zp
	hYor0AAPdw94yw2e3wCog8vLb0bl9+lxu52TlgrQhGoKzIZqAP550mUbgHZrHMyq5cuCRMe88kq
	n8Babd7Sf9LECViUSA20FpGfdb+kpY2K1X5vAjQJ4lMbxwGplOPAIzdsg3ZiPLFLH541dMnAgBm
	oOi/Xzqu8h8QgUOM/hA2Xw/sjC6yFJeS4i28EojfrYTHQGD7IZuU7Ce/ibTl7wtx+GDpDVHV6GE
	5W1Pa2X69b7CNyJO6Pcy6+Gvz8yogAPH2LOPMAFWBf5UKge4XHAoJF8dnIZH5E7mkTUzRKNxovJ
	2/qjnFTLc29tReXqeenkNjpWEfcYtymonSXUzgx2ZXR+3N8lAYKZ2
X-Google-Smtp-Source: AGHT+IGcsOWmRX1H5y2ocIaMEpPgz1i8f4PBQCi9Impo/5QnNyty+MngSnnJ/DU7YlSB8ixg/WYidw==
X-Received: by 2002:a05:600c:4509:b0:456:496:2100 with SMTP id 5b1f17b1804b1-459f4f2bac3mr81310235e9.31.1754777248808;
        Sat, 09 Aug 2025 15:07:28 -0700 (PDT)
Received: from builder.. (188-9-142-46.pool.kielnet.net. [46.142.9.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459c58ed0ecsm145592185e9.4.2025.08.09.15.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 15:07:28 -0700 (PDT)
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
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v5 08/11] i2c: rtl9300: do not set read mode on every transfer
Date: Sat,  9 Aug 2025 22:07:09 +0000
Message-ID: <20250809220713.1038947-9-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
References: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
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
---
 drivers/i2c/busses/i2c-rtl9300.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 8e8e98108750..4d3fcb5efc36 100644
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


