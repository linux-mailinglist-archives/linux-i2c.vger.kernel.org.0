Return-Path: <linux-i2c+bounces-12168-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC76B1F2A6
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 08:54:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36E84189C941
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 06:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718E7279DAA;
	Sat,  9 Aug 2025 06:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="icXngvee"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910D979CD;
	Sat,  9 Aug 2025 06:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754722472; cv=none; b=W2ZjBvs8K+jqI/r6CdZPLlcPnMHHe47O+sBttOH+KXTLJD1yq/DMs8KL8DYHYR01bOJpN2NNrvn09wy6fZIRTpWLN1prkwyj68GuGnH9PnBkCqob32iBiGgWb2vuzBnIGWLxeEHlc3xoqB7Xb78ApHCBiM4ftkJXNDloVO2JlWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754722472; c=relaxed/simple;
	bh=TpthaIOH9bcG/HjS8GYzpaB2CYoNJEhUn+cipvQCF+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NYM3UuF316cLP4gkSk6Vjyh5Cq8WbQA8VYReLtokFeLsNVE3eIrjzTsLrtzyk9bQ+6VvHVLrR2zzvdpfehTJHTTz7jtonNPuSZXre+IwRbnNPXl8w2nCF/kPy8+uSnKN1Q7JTQDq01Sh2mG1Ti/MdFL/+XISC6m6tbgXK1N6YJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=icXngvee; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id B2FE72034F;
	Sat,  9 Aug 2025 06:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754722468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iUzsjF6jNJPJu8ygajyyIZFBOGXBf9p3FjvBQBso4nE=;
	b=icXngveeOX2uZCYlwhcEJKj0dRITAgirGmElXM6aykJ7Uipx4CZLB4WHEaSada8ByyDSq6
	uf3QpfnSJ388Hn0zAcaIwR7rf4LEJ70amAUMFIEJN7cpb0GFInoY3WD0Bgs4mrWKAr5Wcs
	JXSBIBNPAbqWZbhQxOt/cr/u1yLgxNw=
From: Sven Eckelmann <sven@narfation.org>
Date: Sat, 09 Aug 2025 08:40:55 +0200
Subject: [PATCH i2c-host-fixes v4 2/5] i2c: rtl9300: Fix multi-byte I2C
 write
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-i2c-rtl9300-multi-byte-v4-2-d71dd5eb6121@narfation.org>
References: <20250809-i2c-rtl9300-multi-byte-v4-0-d71dd5eb6121@narfation.org>
In-Reply-To: <20250809-i2c-rtl9300-multi-byte-v4-0-d71dd5eb6121@narfation.org>
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
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBnT3m44ICJ/kl9Uw7lbc8H8/+JPdN5M6N7GsdhydhuHh
 prbx6fHOkpZGMS4GGTFFFn2XMk/v5n9rfznaR+PwsxhZQIZwsDFKQATea3CyLCO7c7+V4ZTntdF
 Xfpf9jessXv+BpkNCm/XuU+W+JT4hesgI0M3z6K1xr6SDpOMggR2zJJjXX3ud6XUdZvnmStzgns
 fS7AAAA==
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


