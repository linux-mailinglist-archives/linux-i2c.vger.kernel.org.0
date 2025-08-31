Return-Path: <linux-i2c+bounces-12522-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F24B3D1DB
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 12:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A88853B2E22
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 10:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E112550DD;
	Sun, 31 Aug 2025 10:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aB3pBqWz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8618324E4C4;
	Sun, 31 Aug 2025 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756634724; cv=none; b=jVsTAqxjKLcZ017IkLtaY8ew96CoFrVXesaiI+UuwjicCFTyRWWpMT4v5W3hk0d5GF8BJAtry5yIDYYHGC/Qm7gOrcErHFixZCNuKXyt3sGuzYx4vRasIq+yaHdSQKEVWoJuCWrDUaofJ9sjpJY8KjFZ6kRUFrlSPgEazWmZcfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756634724; c=relaxed/simple;
	bh=2FU7jBaL5l0F7FcLIVYyLqFdd43eJjmVXTGQeNPVYEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OPuSXjeZxczld+oCNJLm2V51mcC0Nrmv2R5THol/6EOU+Pln8UIdrtW1KYCSOwABWSag4J19OzHl7FCmOj5NCxiRJQl7V6KpDjnfJBYSevEwDyw4iOHOaM0L7e5BaXcIR3vi2SILk9JjklgwSx1L69y1Q3KBiMZhxFIscJ9bg7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aB3pBqWz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b84367affso11463085e9.3;
        Sun, 31 Aug 2025 03:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756634721; x=1757239521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W12vvSGCow+ngePVEZ+KVEnYiYSPCEptwt7U5jJOCgo=;
        b=aB3pBqWzTEnoJU7y3bdm392hkid/J7A/lArz5+OJ6+UXQWYs3FufJkQuIA4F4JO5B+
         XGi+lQi55S8KeHK5PCtz6MB8jUYjAIPJWC8vbG68FxEH8JVlYLgi/krUwLbP+y67a2qk
         GxbpjtUJUN1snZRgmWJi5ZP9J5r+g2YTj29diVhLd0htQQoMsAaidmy1z9HUACNm9sHL
         aM6FrPfgrzKClSqtSyxg4ie3yenPyvW3pnG/idZM6ep+B8HGP/ghj75aYWSZ5O8VE9at
         vkz4NooIjASGT7nKeUSgxKLMYrRt5LO+kPMHDkh3bzTWm9fKd1d+mS3ApsRl6wYRecsX
         3XHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756634721; x=1757239521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W12vvSGCow+ngePVEZ+KVEnYiYSPCEptwt7U5jJOCgo=;
        b=RhHj1HX8QBInnve2h99xOORcuJ7L2n0sU8/Aun1PruPSJwkUnippUgve+9LyJ4qWMy
         O+vPeLx30HxpSK9WrmNvMWmbUGU2KFR2ri2xAdMh/XXVt1OIH/7fQlsiZl8CA6VRFaF8
         /poZnZ3FgCisl5BpBlEohRskMDKQqISTb23WcKu3AAHhlM8GOROuJ7HaRiDTdjoXdNeg
         SdEBDQmF7XAxh57PwHgu9SMEPMCZsXThZhKgihtOZ8RQEckqlSuo0ynZxlO149VRmodE
         tRuRFPcvrm8gctYT3oNGEojqZasIYLE1BnBTL47PjyJzQ+2d4tmV0vfgkDGkrT6ehx3r
         yINg==
X-Forwarded-Encrypted: i=1; AJvYcCU3WFhJ1Y5I7vzs28QdwHtB17+d9f2WbufYmCS/puQNh3rGXk8DrBnoBtl0RQd+lgLSALTk4uwukVT3@vger.kernel.org, AJvYcCVM4fE9hc2Y2z7pEmOhIOpxsxR9k550A4/6BmAfv/4Y2n3QCkQFrfyyM9AyJVNn+kmpU7vKxfGW@vger.kernel.org, AJvYcCWOIekxS7ZXNb8SPrDa7UVNf7j+ULvgvxu+TYSJiCI/q7GiwZWtz9Yd02WIQ9R8yIjMPxN7Db8Oasgjcw2/@vger.kernel.org
X-Gm-Message-State: AOJu0YyOJlAuVCOB4mNfV9vdZp0RxkMAvEHnYvekj3BUsb2rUaL5R76I
	iDxAFxW82ZPeM8eaztZhE2E6f/xHhXL4559WGtak75za1M2GWA4KlPiqDJF8UA==
X-Gm-Gg: ASbGncsORDFseVf49WnotRYYWagY5wDx5hrIzs73PTuVcyDc4LB4QSz0zJmOqX/heQr
	HA9UsRGYCTEr49FJBhAI63UifPwf2fJGhmVbWNOsvbCN9lNfGKEzaRGI8VFqE1Hme5otWt507LC
	1r+AhXx2oPaY23AAOq41OY+05rfW4XhX0qzUe7eZBsloW3Nq+UWnYS0LF140qVnorfqoA8LS6nO
	0AntETAA37vbP9oUicBgqrYA7HSsX06Cy5MluufFldK0ZaUc/pkIPHZQTbdhQp4ttqa2DdIkbtw
	/82gSucTOZ+AdfCF9xGWAYsb2AaeTwjBpIbuWcLz0sPpcty40yXaKB/gMiUVXKFq8sCzq2JypfN
	VvoMY7LqlYztB6cFfjNcuUMLaTQea2wxxmCdf6tHYFDJPmUNpXZjG/tXO4gu5+jk=
X-Google-Smtp-Source: AGHT+IFkWnyvylZ2juEpqteyJqOwih5EpHzSQ+mIV9sjGoVUu4+5hFmvjDcz3l9qFan61AE9CskVNw==
X-Received: by 2002:a05:600c:4f0a:b0:45b:8a20:5437 with SMTP id 5b1f17b1804b1-45b8a2055e2mr14437765e9.31.1756634720443;
        Sun, 31 Aug 2025 03:05:20 -0700 (PDT)
Received: from builder.. (39-10-142-46.pool.kielnet.net. [46.142.10.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e68c83asm117505565e9.20.2025.08.31.03.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:05:20 -0700 (PDT)
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
	Jonas Jelonek <jelonek.jonas@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v7 02/12] i2c: rtl9300: ensure data length is within supported range
Date: Sun, 31 Aug 2025 10:04:47 +0000
Message-ID: <20250831100457.3114-3-jelonek.jonas@gmail.com>
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

Add an explicit check for the xfer length to 'rtl9300_i2c_config_xfer'
to ensure the data length isn't within the supported range. In
particular a data length of 0 is not supported by the hardware and
causes unintended or destructive behaviour.

This limitation becomes obvious when looking at the register
documentation [1]. 4 bits are reserved for DATA_WIDTH and the value
of these 4 bits is used as N + 1, allowing a data length range of
1 <= len <= 16.

Affected by this is the SMBus Quick Operation which works with a data
length of 0. Passing 0 as the length causes an underflow of the value
due to:

(len - 1) & 0xf

and effectively specifying a transfer length of 16 via the registers.
This causes a 16-byte write operation instead of a Quick Write. For
example, on SFP modules without write-protected EEPROM this soft-bricks
them by overwriting some initial bytes.

For completeness, also add a quirk for the zero length.

[1] https://svanheule.net/realtek/longan/register/i2c_mst1_ctrl2

Fixes: c366be720235 ("i2c: Add driver for the RTL9300 I2C controller")
Cc: <stable@vger.kernel.org> # v6.13+
Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Tested-by: Sven Eckelmann <sven@narfation.org>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz> # On RTL9302C based board
Tested-by: Markus Stockhausen <markus.stockhausen@gmx.de>
---
 drivers/i2c/busses/i2c-rtl9300.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 19c367703eaf..ebd4a85e1bde 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -99,6 +99,9 @@ static int rtl9300_i2c_config_xfer(struct rtl9300_i2c *i2c, struct rtl9300_i2c_c
 {
 	u32 val, mask;
 
+	if (len < 1 || len > 16)
+		return -EINVAL;
+
 	val = chan->bus_freq << RTL9300_I2C_MST_CTRL2_SCL_FREQ_OFS;
 	mask = RTL9300_I2C_MST_CTRL2_SCL_FREQ_MASK;
 
@@ -352,7 +355,7 @@ static const struct i2c_algorithm rtl9300_i2c_algo = {
 };
 
 static struct i2c_adapter_quirks rtl9300_i2c_quirks = {
-	.flags		= I2C_AQ_NO_CLK_STRETCH,
+	.flags		= I2C_AQ_NO_CLK_STRETCH | I2C_AQ_NO_ZERO_LEN,
 	.max_read_len	= 16,
 	.max_write_len	= 16,
 };
-- 
2.48.1


