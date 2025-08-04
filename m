Return-Path: <linux-i2c+bounces-12147-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B023B1A972
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 21:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BA52623315
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 19:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5BA28C2AE;
	Mon,  4 Aug 2025 19:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="BgvXvou8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D7B28B4FA;
	Mon,  4 Aug 2025 19:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754335084; cv=none; b=HBqLWH26rRCey6RMtbsU8qCvClpXCewDLyNeAPwiH6UeNwVEJsYPc3+rkrwpWpf/kiVOtlzygCR/ySGFF+aaV6AuKmL09buoILq63TJJ90Suo/LfoXV3Wad/MUg7qRu6ASzmlAmZuEk7QqS4IrKF+pQeCSYS+8rSCQFaQMXgVSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754335084; c=relaxed/simple;
	bh=3hoEoAnN6KRhnO1uwCszA4VyBjhI9zYhjoqErVGcx7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ngbfQyGI3SP86bWUyNlh64pUZs1UEdQ0zKEEev/45upwaFsRVPIrEeikFHnVrt48J71GpnY8jVk15i1yIuuSvA2gvyLTl5KeDg0XUypj43BjyCBOJpWm2p32Rq8caFe8pyhxBi0IEteYOJOCefuGMLBc4eIgrJtJeuwZ4sl+us0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=BgvXvou8; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id 6093321025;
	Mon,  4 Aug 2025 19:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754335081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wd02ogiR3yNdP4gSs9IelS+hTKAuH/xjjfYBusMhees=;
	b=BgvXvou87BwBj+i/OeteYOUb4L+hFeJ5DUlO6iCEb6jkFyJQpGo6zgAsLLGkGn3hawvXuB
	4OTchq9Iby2PfixIfbcu+Eh6b/N4T0+U3pOgvHYK+JApzT5rYca30e9YTJwf+pGsmTf2ie
	pirIqFYtlNVNQ7miSo196QWyaCpihFo=
From: Sven Eckelmann <sven@narfation.org>
Date: Mon, 04 Aug 2025 21:17:02 +0200
Subject: [PATCH v3 3/5] i2c: rtl9300: Increase timeout for transfer polling
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-i2c-rtl9300-multi-byte-v3-3-e20607e1b28c@narfation.org>
References: <20250804-i2c-rtl9300-multi-byte-v3-0-e20607e1b28c@narfation.org>
In-Reply-To: <20250804-i2c-rtl9300-multi-byte-v3-0-e20607e1b28c@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1830; i=sven@narfation.org;
 h=from:subject:message-id; bh=3hoEoAnN6KRhnO1uwCszA4VyBjhI9zYhjoqErVGcx7k=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBkT2cNPF+4uXnj9qOOcBuMApfk/xS3TuxbOm7+WTeajl
 OUvO3/NjlIWBjEuBlkxRZY9V/LPb2Z/K/952sejMHNYmUCGMHBxCsBEWKwY/leGzrr49BG//L9i
 ddOv+p4Jpp0XjRt4SuM3CDFx/K9938DIcE+t/eTWpRuTzv/Onh8+fY7crt0mE86tmCy3L+XLio2
 vXBkA
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF

The timeout for transfers was only set to 2ms. Because of this relatively
low limit, 12-byte read operations to the frontend MCU of a RTL8239 POE PSE
chip cluster was consistently resulting in a timeout.

The original OpenWrt downstream driver [1] was not using any timeout limit
at all. This is also possible by setting the timeout_us parameter of
regmap_read_poll_timeout() to 0. But since the driver currently is
implements the ETIMEDOUT error, it is more sensible to increase the timeout
in such a way that the communication with the (quite common) Realtek
I2C-connected POE management solution is possible.

[1] https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/realtek/files-6.12/drivers/i2c/busses/i2c-rtl9300.c;h=c4d973195ef39dc56d6207e665d279745525fcac#l202

Cc: <stable@vger.kernel.org>
Fixes: c366be720235 ("i2c: Add driver for the RTL9300 I2C controller")
Signed-off-by: Sven Eckelmann <sven@narfation.org>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-rtl9300.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 616d13e6d7088d2b5dc94dca13486caf10fc43f3..b8e8f416c5658058819dc0c75af7aa5f18f3f7a9 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -178,7 +178,7 @@ static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_write,
 		return ret;
 
 	ret = regmap_read_poll_timeout(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_CTRL1,
-				       val, !(val & RTL9300_I2C_MST_CTRL1_I2C_TRIG), 100, 2000);
+				       val, !(val & RTL9300_I2C_MST_CTRL1_I2C_TRIG), 100, 100000);
 	if (ret)
 		return ret;
 

-- 
2.47.2


