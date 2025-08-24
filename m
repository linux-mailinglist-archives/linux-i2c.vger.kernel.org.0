Return-Path: <linux-i2c+bounces-12394-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7CBB32F8E
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 13:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E817188BB0C
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 11:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5304B2D7804;
	Sun, 24 Aug 2025 11:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KiekYStG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF9E1DC198;
	Sun, 24 Aug 2025 11:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756035275; cv=none; b=bc/SExm3qcBfBVb8dHS9Sz9WJtvk7jqSIRWq7fNGPV/ciE53CzrwjsBM83sAcMXNaxTVjpR04pwL9k84/+kg86EMMm1HDeM8DmsPFVgBgHyQEP5jnonLn7ZvHqsWUI3eMj1DHieID19ScIC9FBC/2a5dtlGpJbKJf8HtUUipNTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756035275; c=relaxed/simple;
	bh=M/j3jg6iSNlGkf6wyCuJOna6CpDQLgph69HL/obvbno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XHbqP6obBcr5zKxUMG4Z2pV/tZEV4ejLSpFqjJAi26CMqp+TGeo6NNTGwjDHtqoBUPoIrtp89rzrCAW/blV+rxJoWoSwlkQpf1vvjEcSNTjCscfj27UaYOvKFpqNtZ/MqfIK3pxUzEuJp8ydHO3IcG4EZAEQGykGhPZ39tcU5x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KiekYStG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso17512975e9.2;
        Sun, 24 Aug 2025 04:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756035272; x=1756640072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQv5kNpDRuyJXRv/R9Pqr7iIwNZy1Lxb15S6N4mI6JI=;
        b=KiekYStGTxVav4+cXTEphUC/iXoXFGfrrFoubsdk6FxKNrPVoJWjm45koiiDAc4rK/
         kVq10WNJgF6cr2a03B/EmFEA69vn6r+KakCNK0nvFrMMb5LY8sx7EZXONnYRtE7LSwbW
         aE2YI+HutoIcKY0DjPjRUvC5j2q9zoI6o9MWk5xgkjNjXgSZTXSn5ejHwXuIr4vi7RG/
         Pj4zVkrvQze3c5fCk6RMVteH68RKi5OcFv5qiiFPI4/KyoTXJLZuNLUtOleizQxSRZ2M
         cQjWcnZ4arC4Ut8NY/PBtFJ+fWQrT50XegK0wzAsuDI41vVIJtF6BMS+wFfF0P+U4Bv9
         Q7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756035272; x=1756640072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQv5kNpDRuyJXRv/R9Pqr7iIwNZy1Lxb15S6N4mI6JI=;
        b=B5oLBE6KPnOlSVyV0hGNvgLJ4tREcf8wb5rpbx4kwEEMyHR4AKD7vlBAwbz4c6yLBp
         63wDr/e0ub7WSfKR7zVtz03hWoKla0uKld3Gvtyw9+zRWl59v3500P9tekTawwlhzFDG
         SC/iu6fBg6D9yyiNSjx+fuAaBn7TwqQ0dhj7ETitoYBsR/o77j5huqB5xhiUlR3mc/1l
         oSBWmIh83A6j17+FuxkG/pOmJPwI7QleZy2XcBaoKtqzsI6rpNc302tTELpBfBqsHWUq
         /OF3yTCGjIOdSEWucbccIlZQNqh0l/Fhtur6AG7s93Q0DH7r+ANcRo0yjnJlZDxRTmzf
         wfIA==
X-Forwarded-Encrypted: i=1; AJvYcCUuX/lUkt+alAvqz6lgn51vqalMbMM9SZUFF0xLUKE3s/c4kvvJYt8VbbGmnduYqtF+0s/JKcDEzKIU8p4h@vger.kernel.org, AJvYcCWBtbgHXMcryfMT/lYsj0ntSYJDWfin9yczCQQKlCvzGrBcmFUEqogFICSA/RJGkur6ljLweFUF@vger.kernel.org, AJvYcCWWaGMPCUZ3+BJXNR79d8o5ypOvviLvCbLmGzoew0aEftRqxGAgpGQvtCj7Tjd3vtCXeMAJDL2z4jPW@vger.kernel.org
X-Gm-Message-State: AOJu0YwKc1cyu6JTMO0G5t2+UIOL9+6ppW5a+oyazf51Ir6YRS3/hTd3
	RwYA/OpG33lBfWpn2R7CKGsXndGaSh3WemijfT22CyD+2FLOFb5fjXlu
X-Gm-Gg: ASbGncs6Vw/W3zJlrVD/BWvWK7AzuI+Hh3BuEpeOg+2jnJSApPdDHoVX+AsHnulBBw5
	Wads7ngRJeHyB1D79Q5Bn4qFPFC73O8RYovZtuW8HwuqJHg9hlHGNNFXNg/VDSsPJJkVDntanuu
	j/Jyklp5oQmbx+xFKA24HCvQdmu3J92foCLUe6bZqFbbX3+vXktXF3Z8DjszG7at/aR5PBAsy3j
	24oR+5MLEXMwzCZfbDtzedRgwMLnxZZCsgUH+Pr0JqKLijCLkhJ1jF/4iT+jU7QrebShgDPZQ/g
	y57HWAVPXJmox+avfgDW7O0QYOmIanrmw1vpCavEUfcqabupPB3DgpdrxSH/C9ItlWfrfZW77y+
	TWretUv+TCzk8sA1gmVEz/MNeyuab29pUj1hJqUFEIdMq2L7lqwCGrKU=
X-Google-Smtp-Source: AGHT+IEou+mkIjKMMneneCupHg/VUQE5pHLMfdEnWTGUjiK7lFROxhFimii6vBYaul2mMqZx+SZLxQ==
X-Received: by 2002:a05:600c:46c5:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-45b517e95a3mr65342325e9.29.1756035271563;
        Sun, 24 Aug 2025 04:34:31 -0700 (PDT)
Received: from builder.. (197-10-142-46.pool.kielnet.net. [46.142.10.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5757453fsm66470895e9.14.2025.08.24.04.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 04:34:31 -0700 (PDT)
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
Subject: [PATCH v6 02/12] i2c: rtl9300: ensure data length is within supported range
Date: Sun, 24 Aug 2025 11:33:38 +0000
Message-ID: <20250824113348.263475-3-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250824113348.263475-1-jelonek.jonas@gmail.com>
References: <20250824113348.263475-1-jelonek.jonas@gmail.com>
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


