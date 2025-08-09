Return-Path: <linux-i2c+bounces-12166-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B40B1F294
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 08:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06CD31AA6734
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 06:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B0325487C;
	Sat,  9 Aug 2025 06:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="xg2YsxeL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEDA3C17;
	Sat,  9 Aug 2025 06:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754721723; cv=none; b=QOz5/gsQPn8S5jL9fQCt3OkzDDkViyNdnmTV3ZkYlcgrT7coDp/vXZlr46QLVlskm3HmCDhmd+9skzXqsM1cwByayCEqpgp9Me7B1JQsqjkAMqSdCsQZracrpPaZHNQacaupN+ZxFOfHVYsuLjTxZ+XDXLD1HZGfyBz9k5lM4lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754721723; c=relaxed/simple;
	bh=w0bAJq5+bavDrPNAcZYjfd9NL/kT4jBqERkwWyppw40=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bM8J3XIe2TShYWNQdVJtjpBH3vNtrCbWlNiHnh2r4j1+FTS5GXVGnDEEPOJ+fM/zuJgl/zQ2/l4uMQvwwE6B3KlZwoiyVeTyNxItgstQHjIvp/aL6FR5cYlzVpHaYC3TuZO5Q+0dD4Fh/E5lsekNWW59lKh/Y0Cerj1QcdeC1Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=xg2YsxeL; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id 74ADC1FDC2;
	Sat,  9 Aug 2025 06:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754721718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=anUgaJrif1hKwagIinlhUBG3/VFhPvsbRt5mMq8WGrQ=;
	b=xg2YsxeLkiyR9RHO2cc1BeoM8nrYT5ce8RrRNtFT626nSEh+MhG5MlB0B04AklAeDTIo2g
	AQLcEDZ9TMDtWIu9BUqjuXlBi4MFCR/bWkv4jQCoS+IAc6BOQ2x16PrD6Ax5h3AepACiJA
	UtCoO3iiisyZC+5WI3HnLxIR/hVj1X0=
From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH i2c-host-fixes v4 0/5] i2c: rtl9300: Fix multi-byte I2C
 operations
Date: Sat, 09 Aug 2025 08:40:53 +0200
Message-Id: <20250809-i2c-rtl9300-multi-byte-v4-0-d71dd5eb6121@narfation.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHXtlmgC/4XOzQ6CMAzA8VchOztTyseGJ9/DeNiggyUIZkwiI
 by7gxMxEo//Jv21MxvIWRrYJZqZo9EOtu9CpKeIlY3qauK2Cs0QMAMJyC2W3Pm2SAD449V6y/X
 kiVOlVGw0SIElC8tPR8a+N/h2D93Ywfdu2u6M8Tr9S44xB56ZXAoCKCThtVPOKB8+PPeuZis74
 p5KDikMVKGFFllhCHX+i0r2VHpIJYEihBwExRpl+U0ty/IBAX/PdlYBAAA=
X-Change-ID: 20250802-i2c-rtl9300-multi-byte-edaa1fb0872c
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>, Alex Guo <alexguo1023@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4707; i=sven@narfation.org;
 h=from:subject:message-id; bh=w0bAJq5+bavDrPNAcZYjfd9NL/kT4jBqERkwWyppw40=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBnT3m44rWfjcfKQT9VE26BAK+Y+k8zXkiFXWCQr+k5KR
 51Yc8C+o4SFQYyLQVZMkWXPlfzzm9nfyn+e9vEozBxWJpAhDFycAjCRPfYMPx4obQmVUnkpVvZU
 pnl2s3S6uLfU0o4fT17Oya9dxFyWzsiwRNBcunKP1R8d00nbWTquhi04zXRqosF3XatTkxlX/zT
 lBwA=
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF

During the integration of the RTL8239 POE chip + its frontend MCU, it was
noticed that multi-byte operations were basically broken in the current
driver.

Tests using SMBus Block Writes showed that the data (after the Wr maker +
Ack) was mixed up on the wire. At first glance, it looked like an
endianness problem. But for transfers where the number of count + data
bytes was not divisible by 4, the last bytes were not looking like an
endianness problem because they were in the wrong order but not for example
0 - which would be the case for an endianness problem with 32 bit
registers. At the end, it turned out to be the way how i2c_write tried to
add the bytes to the send registers.

Each 32 bit register was used similar to a shift register - shifting the
various bytes up the register while the next one is added to the least
significant byte. But the I2C controller expects the first byte of the
transmission in the least significant byte of the first register. And the
last byte (assuming it is a 16 byte transfer) is expected in the most
significant byte of the fourth register.

While doing these tests, it was also observed that the count byte was
missing from the SMBus Block Writes. The driver just removed them from the
data->block (from the I2C subsystem). But the I2C controller DOES NOT
automatically add this byte - for example by using the configured
transmission length.

The RTL8239 MCU is not actually an SMBus compliant device. Instead, it
expects I2C Block Reads + I2C Block Writes. But according to the already
identified bugs in the driver, it was clear that the I2C controller can
simply be modified to not send the count byte for I2C_SMBUS_I2C_BLOCK_DATA.
The receive part just needs to write the content of the receive buffer to
the correct position in data->block.

While the on-wire format was now correct, reads were still not possible
against the MCU (for the RTL8239 POE chip). It was always timing out
because the 2ms were not enough for sending the read request and then
receiving the 12 byte answer.

These changes were originally submitted to OpenWrt. But there are plans to
migrate OpenWrt to the upstream Linux driver. As a result, the pull request
was stopped and the changes were redone against this driver.

For reasons of transparency: The work on I2C_SMBUS_I2C_BLOCK_DATA support
for the RTL8239-MCU was done on RTL931xx. All problems were therefore
detected with the patches from Jonas Jelonek [1] and not the vanilla Linux
driver. But looking through the code, it seems like these are NOT
regressions introduced by the RTL931x patchset.

I've picked up Alex Guo's patch [2] to reduce conflicts between pending
fixes.

[1] https://patchwork.ozlabs.org/project/linux-i2c/cover/20250727114800.3046-1-jelonek.jonas@gmail.com/
[2] https://lore.kernel.org/r/20250615235248.529019-1-alexguo1023@gmail.com

Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
Changes in v4:
- Provide only "write" examples for "i2c: rtl9300: Fix multi-byte I2C write"
- drop the second initialization of vals in rtl9300_i2c_write() directly in
  the "Fix multi-byte I2C write" fix
- indicate in target branch for each patch in PATCH prefix
- minor commit message cleanups
- Link to v3: https://lore.kernel.org/r/20250804-i2c-rtl9300-multi-byte-v3-0-e20607e1b28c@narfation.org

Changes in v3:
- integrated patch
  https://lore.kernel.org/r/20250615235248.529019-1-alexguo1023@gmail.com
  to avoid conflicts in the I2C_SMBUS_BLOCK_DATA code
- added Fixes and stable@vger.kernel.org to Alex Guo's patch
- added Chris Packham's Reviewed-by/Acked-by
- Link to v2: https://lore.kernel.org/r/20250803-i2c-rtl9300-multi-byte-v2-0-9b7b759fe2b6@narfation.org

Changes in v2:
- add the missing transfer width and read length increase for the SMBus
  Write/Read
- Link to v1: https://lore.kernel.org/r/20250802-i2c-rtl9300-multi-byte-v1-0-5f687e0098e2@narfation.org

---
Alex Guo (1):
      [i2c-host-fixes] i2c: rtl9300: Fix out-of-bounds bug in rtl9300_i2c_smbus_xfer

Harshal Gohel (2):
      [i2c-host-fixes] i2c: rtl9300: Fix multi-byte I2C write
      [i2c-host] i2c: rtl9300: Implement I2C block read and write

Sven Eckelmann (2):
      [i2c-host-fixes] i2c: rtl9300: Increase timeout for transfer polling
      [i2c-host-fixes] i2c: rtl9300: Add missing count byte for SMBus Block Ops

 drivers/i2c/busses/i2c-rtl9300.c | 50 +++++++++++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 8 deletions(-)
---
base-commit: 09eaa2a604ed1bfda7e6fb10488127ce8fdc8048
change-id: 20250802-i2c-rtl9300-multi-byte-edaa1fb0872c

Best regards,
-- 
Sven Eckelmann <sven@narfation.org>


