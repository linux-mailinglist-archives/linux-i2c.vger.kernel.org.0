Return-Path: <linux-i2c+bounces-12217-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2FEB1FB90
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 20:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C8191897DE0
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 18:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695FE277020;
	Sun, 10 Aug 2025 18:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="MYS7ztNV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F35C274FE0;
	Sun, 10 Aug 2025 18:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754849176; cv=none; b=TAo2o3JWP4pFTP+eFEbSY5qztpU5/qpco7oTHYvAf57V4U+aKj11on45kBBrcY/pHw7E9snHR3177FExxR/UVBtLw7OZNpuMmUqZ7Cwlpyp+1pcRMRThq54CLD90jdYazvb7CCTVASQ+OX3Sud+4S/0vDsM3cBIP9G1iW5EL5bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754849176; c=relaxed/simple;
	bh=TpthaIOH9bcG/HjS8GYzpaB2CYoNJEhUn+cipvQCF+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JLoGMwkaiERMpSWioX0Ou7Nr//2KxyAsucfJHcRXpndZEW+rlXrPGMJUeUM9bXkUjvHvzSrpQaq+bmHJ56Sqkr0DjVClZAD+Y4oD+e9tkAvth4LO1y5tBF8z0Xd2VOhcUKU43+/yqN7hnO8AU1mrk6SneDMVvhhBQHsEVdRd6ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=MYS7ztNV; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id 4988521965;
	Sun, 10 Aug 2025 18:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754849172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iUzsjF6jNJPJu8ygajyyIZFBOGXBf9p3FjvBQBso4nE=;
	b=MYS7ztNVv6jL3Y3zetPj0+LyFbCCj+ef8an98bljhLbWdHmroeqQDi09hqDit18yPDqpHR
	sqepwUkvvlnzAMDGmqV7CptzBoG9AlBgJdS/i9+FlcWzss4NGpTNqlPb/RwQt6WIYNXyDA
	5NmvTCU7Hp+5IWcfnWSgnbenz9eZBxs=
From: Sven Eckelmann <sven@narfation.org>
Date: Sun, 10 Aug 2025 20:05:14 +0200
Subject: [PATCH i2c-host-fixes v5 2/5] i2c: rtl9300: Fix multi-byte I2C
 write
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-i2c-rtl9300-multi-byte-v5-2-cd9dca0db722@narfation.org>
References: <20250810-i2c-rtl9300-multi-byte-v5-0-cd9dca0db722@narfation.org>
In-Reply-To: <20250810-i2c-rtl9300-multi-byte-v5-0-cd9dca0db722@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2869; i=sven@narfation.org;
 h=from:subject:message-id; bh=1jT+A7C/CY/ODrnBGy3IEY79kMlFtxpeg+PKvR0HJjM=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBkz7neUCW2btLbnUDhXmuayC5xxkmaz2uMuHpR+vLZ6i
 /EC/dAPHaUsDGJcDLJiiix7ruSf38z+Vv7ztI9HYeawMoEMYeDiFICJXC5g+Gcz37O3rVnGNC+F
 yb78w5SL81RWih/6ZHg8Y1WGq6YZrwrD/1yF9c4zgt/kua7d1bD1yj6+NyaiVbof130x+jJx4hm
 r9ewA
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF

From: Harshal Gohel <hg@simonwunderlich.de>

The RTL93xx I2C controller has 4 32 bit registers to store the bytes for
the upcoming I2C transmission. The first byte is stored in the
least-significant byte of the first register. And the last byte in the most
significant byte of the last register. A map of the transferred bytes to
their order in the registers is:

reg 0: 0x04_03_02_01
reg 1: 0x08_07_06_05
reg 2: 0x0c_0b_0a_09
reg 3: 0x10_0f_0e_0d

The i2c_read() function basically demonstrates how the hardware would pick
up bytes from this register set. But the i2c_write() function was just
pushing bytes one after another to the least significant byte of a register
AFTER shifting the last one to the next more significant byte position.

If you would then have tried to send a buffer with numbers 1-11 using
i2c_write(), you would have ended up with following register content:

reg 0: 0x01_02_03_04
reg 1: 0x05_06_07_08
reg 2: 0x00_09_0a_0b
reg 3: 0x00_00_00_00

On the wire, you would then have seen:

  Sr Addr Wr [A] 04 A 03 A 02 A 01 A 08 A 07 A 06 A 05 A 0b A 0a A 09 A P

But the correct data transmission was expected to be

  Sr Addr Wr [A] 01 A 02 A 03 A 04 A 05 A 06 A 07 A 08 A 09 A 0a A 0b A P

Because of this multi-byte ordering problem, only single byte i2c_write()
operations were executed correctly (on the wire).

By shifting the byte directly to the correct end position in the register,
it is possible to avoid this incorrect byte ordering and fix multi-byte
transmissions.

The second initialization (to 0) of vals was also be dropped because this
array is initialized to 0 on the stack by using `= {};`. This makes the
fix a lot more readable.

Cc: <stable@vger.kernel.org>
Fixes: c366be720235 ("i2c: Add driver for the RTL9300 I2C controller")
Signed-off-by: Harshal Gohel <hg@simonwunderlich.de>
Co-developed-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Sven Eckelmann <sven@narfation.org>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-rtl9300.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 568495720810b373c4fa3b31d3f4cdec7c64b5f9..4a538b2660802c98e1a51d2ed782e154f2a5d1a0 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -143,10 +143,10 @@ static int rtl9300_i2c_write(struct rtl9300_i2c *i2c, u8 *buf, int len)
 		return -EIO;
 
 	for (i = 0; i < len; i++) {
-		if (i % 4 == 0)
-			vals[i/4] = 0;
-		vals[i/4] <<= 8;
-		vals[i/4] |= buf[i];
+		unsigned int shift = (i % 4) * 8;
+		unsigned int reg = i / 4;
+
+		vals[reg] |= buf[i] << shift;
 	}
 
 	return regmap_bulk_write(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0,

-- 
2.47.2


