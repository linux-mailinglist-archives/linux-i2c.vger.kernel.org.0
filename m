Return-Path: <linux-i2c+bounces-12128-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BC4B19491
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 18:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61B763B7518
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 16:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABCC1E8836;
	Sun,  3 Aug 2025 16:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="T7d8aKUH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC421DF24F;
	Sun,  3 Aug 2025 16:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754240164; cv=none; b=NcoOE9TC/4YjKrmU02tDDoz2Fg8lAdCSrZ/lhEvr4RyEUCO4ZW+ag/1eAKObDwkfYU+GkMkhaKUrdg9DMB7MDJfF7G37Lw04FS+YMMRg5ruQ67vqZZpBGk1OkFmWe9qJ4uO00r8U2/aWA6Hlt3pg3oPNXY+1W4IiFEu1OxdSR5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754240164; c=relaxed/simple;
	bh=Ou4prkCgD3r9vp0EyHMeD0cvL027do7J+yQolBrNtZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LqIyjeHY7mPpO2DiYgVetfHaDDCiFRCLEavwWe8Ke3LdnI/IwRPV2jcvl5vohUGQD3yH2/ewUyM8gcaVjVHQymyA4O2RyAGLrDTKWhjiLfi2mQB5gyD6LvP0BEIS6HYttCn8W8BPMtKfoXBToYWAKeEFrBvOhIJGyMxlhTRe/iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=T7d8aKUH; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id 90F1921025;
	Sun,  3 Aug 2025 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754240154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xhbAJZzJMhexzR97QbmwGz2nSA3Pj80XTZCx5wfqPDc=;
	b=T7d8aKUHWjPo9YZ+oevuaWqAfiWylPxceXe2R/wB5esWCstoDzbsoWKzZd2ghMuWCEKGTL
	jo5c0OEirSaDHze+YIIBkDmMtIOMvPISZHR9ahFYlncJikm4xCvclM6x1baZiJB1AXmNur
	FHARG3g3In+RIJMxbTqfgf9sD8fh3iw=
From: Sven Eckelmann <sven@narfation.org>
Date: Sun, 03 Aug 2025 18:54:38 +0200
Subject: [PATCH v2 1/4] i2c: rtl9300: Fix multi-byte I2C write
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250803-i2c-rtl9300-multi-byte-v2-1-9b7b759fe2b6@narfation.org>
References: <20250803-i2c-rtl9300-multi-byte-v2-0-9b7b759fe2b6@narfation.org>
In-Reply-To: <20250803-i2c-rtl9300-multi-byte-v2-0-9b7b759fe2b6@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2603; i=sven@narfation.org;
 h=from:subject:message-id; bh=fp5m+HrFVF1HrzGHiqewD50wt972OrHU8EebM/MHSdU=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBn9U/pfH/X/zv6o6FhfcPyxhX1Tqhp+NZ7uUT6tzP6/N
 +us8p/gjlIWBjEuBlkxRZY9V/LPb2Z/K/952sejMHNYmUCGMHBxCsBEqs0Z/hmw/vKbxKd/4Vi9
 Updl+KJJi3q/T5825/yyD7+8RW1OttUyMtw//onXYZlkUIH2LzVm6X+9LmE/ys7ECm/Q+/3wTfK
 aBF4A
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

  Sr Addr Rd/Wr [A] 04 A 03 A 02 A 01 A 08 A 07 A 06 A 05 A 0b A 0a A 09 A/NA P

But the correct data transmission was expected to be

  Sr Addr Rd/Wr [A] 01 A 02 A 03 A 04 A 05 A 06 A 07 A 08 A 09 A 0a A 0b A/NA P

Because of this multi-byte ordering problem, only single byte i2c_write()
operations were executed correctly (on the wire).

By shifting the byte directly to the correct end position in the register,
it is possible to avoid this incorrect byte ordering and fix multi-byte
transmissions.

Cc: <stable@vger.kernel.org>
Fixes: c366be720235 ("i2c: Add driver for the RTL9300 I2C controller")
Signed-off-by: Harshal Gohel <hg@simonwunderlich.de>
Co-developed-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
 drivers/i2c/busses/i2c-rtl9300.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index e064e8a4a1f0824abc82fa677866b85f99fbe4a7..1b3cbe3ea84a4fa480c5c00438eecc551d047348 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -143,10 +143,13 @@ static int rtl9300_i2c_write(struct rtl9300_i2c *i2c, u8 *buf, int len)
 		return -EIO;
 
 	for (i = 0; i < len; i++) {
+		unsigned int shift = (i % 4) * 8;
+		unsigned int reg = i / 4;
+
 		if (i % 4 == 0)
-			vals[i/4] = 0;
-		vals[i/4] <<= 8;
-		vals[i/4] |= buf[i];
+			vals[reg] = 0;
+
+		vals[reg] |= buf[i] << shift;
 	}
 
 	return regmap_bulk_write(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0,

-- 
2.47.2


