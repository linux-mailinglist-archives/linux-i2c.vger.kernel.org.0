Return-Path: <linux-i2c+bounces-12145-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ED8B1A968
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 21:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3809718162D
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 19:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938F5286D76;
	Mon,  4 Aug 2025 19:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="aDJ5v2xJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529EB22FAFD;
	Mon,  4 Aug 2025 19:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754335082; cv=none; b=qDAinDHsSUsZFppjVr1sccEiRVEVu7DNtamOGiwObmFuiqeZACdNnqCllNv9nZstgGh18YPP4UTvTfKDY1lpjUbG2GeYnmzlRsbY4beiv8MDBHhu1fmwo0Rv0QnShl76snCPq3z/6I+b3JYvsmr834mmgFsfqaBYissR9XFvZO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754335082; c=relaxed/simple;
	bh=N/S7BI7MFx+Ev1eeKr/+tw8r5HeDR9bkWd4h5J5xilc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kyvCdZGdmVLhEDq3/xCU87dFX9BHvCNATuRnsjFinHTSOBejef6slG7QvOKReVcCbURFbdyAoLFOuKs6xtxZn7NbOqlhtJvXfqMqoo8JqJCT5u8SFeeAnvQ1y5HuvdaMv9Y22xTc0dwfpxTnITiptDqrxjJdvuoULtJww24Pnq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=aDJ5v2xJ; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id 260A920D95;
	Mon,  4 Aug 2025 19:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754335078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aYv+aJLVqc/Q7SRWlS3EVfQqT8kNYcHz9Tdrzi3KQYI=;
	b=aDJ5v2xJ/9Cg4tyqApERIbghvB+bQQkgeBLfmm6wKL7GqIGJxsqE9C3s5cufC+RrO7tCXg
	p65vVLu+Xg0axSO2DuvFkp69Bblik3GOnKc91HDKlCuNncIFA/Pl2Hfw0jpds8LGTy49ci
	L5idZkYIa3ySn5it/s6k6Yne8U7uyLk=
From: Sven Eckelmann <sven@narfation.org>
Date: Mon, 04 Aug 2025 21:17:01 +0200
Subject: [PATCH v3 2/5] i2c: rtl9300: Fix multi-byte I2C write
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-i2c-rtl9300-multi-byte-v3-2-e20607e1b28c@narfation.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2729; i=sven@narfation.org;
 h=from:subject:message-id; bh=PJ7UiIgP7qua5GKVS7qfgulOeNPjtXHCwjTgGFNPZMc=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBkT2cNnWhXk6c//ofrBODe2fGbI8iT9c6cbT372+Oep3
 iOblTKho5SFQYyLQVZMkWXPlfzzm9nfyn+e9vEozBxWJpAhDFycAjARlU5GhrtiAvo1t/9IHJt0
 /Mtj9Vc9jr4aolzO34O2rdk6dW9N7mFGhl6DiPNsCSEzN+T/u2NmvnGb35ZnNYdXPb8S0ljJkHJ
 gBQ8A
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
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-rtl9300.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 568495720810b373c4fa3b31d3f4cdec7c64b5f9..616d13e6d7088d2b5dc94dca13486caf10fc43f3 100644
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


