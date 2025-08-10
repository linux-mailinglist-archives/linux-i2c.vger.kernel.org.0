Return-Path: <linux-i2c+bounces-12215-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 381E9B1FB89
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 20:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4874916A81D
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 18:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0F4226D00;
	Sun, 10 Aug 2025 18:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="yYDUKHcd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0008F66;
	Sun, 10 Aug 2025 18:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754849172; cv=none; b=RPRDhB/a/zrJIGV/fw8smgDcP4eZgGcpmPMLFMnGWAwizk8cv4opUe17PBBRksSi9rM71Kh7ZUpGk42BzjeRk6i9yaTvOuB9Ji+7Z7bCUA3iBwaG1S4CL/DC/fLt1d3/fr6xl/pmw4zRM2iiDbFlpoRnHz8BRGcwwOBUKfsGJqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754849172; c=relaxed/simple;
	bh=WHLRLsBfg7O/OTRHI9Qnnlt41lC3msVVIdYXbhNrpMU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qIzRRnDv1JLLZemwPLq8i9y48W2MBT+2W+UZa2OnxA3OOgZwjeEdrsSvtnVR3czu9JRjLUz/eLnaMfBGOFZbMcv0NwEl3OzuItgQoXtHaf241KwmZUGO63yZsU3ZfEFRg/QwcCaFoJ42VGfNiBaULYIrjb0BgqeiaDJLrr7cUjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=yYDUKHcd; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id 0855420019;
	Sun, 10 Aug 2025 18:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754849167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rh5O527zCk/QwVMc59etmyG7fXrzsTjPC0RIuT5k2UQ=;
	b=yYDUKHcdyqaana9p65+oJVma0TdDreA7IjWCU+d3nt+wZ7XYaT1uITqpQv2p+0pdgvBsP+
	O55/NxuQ9atLDSdpc/gLSml8fObcond65yLYTxoG+82xQfPQf39/3p2TlHHfDKhLgqlJ5Z
	2wXrxADVh5TKGplmqQFxu5BOElm8gVc=
From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH v5 0/5] i2c: rtl9300: Fix multi-byte I2C operations
Date: Sun, 10 Aug 2025 20:05:12 +0200
Message-Id: <20250810-i2c-rtl9300-multi-byte-v5-0-cd9dca0db722@narfation.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFjfmGgC/4XOwQ7CIAyA4VcxnMWUbgzw5HsYDzCKkuhmGC4as
 3cXPS3GxePfpF/7ZAOlSAPbrp4s0RiH2Hcl5HrF2pPtjsSjL80QUIIG5BFbnvLZVAD8cjvnyN0
 jEydvrQgOtMKWleVrohDvH3h/KH2KQ+7T43NnFO/pX3IUHLgMjVYEYDThrrMp2Fw+3PTpyN7si
 HOqWqSwUMYpp6QJhK75RVVzql6kqkIRQgOKhEPd/qLqOWUWqbpQXgnvJblGoPimpml6AZKIQbq
 hAQAA
X-Change-ID: 20250802-i2c-rtl9300-multi-byte-edaa1fb0872c
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>, Alex Guo <alexguo1023@gmail.com>, 
 stable@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4917; i=sven@narfation.org;
 h=from:subject:message-id; bh=WHLRLsBfg7O/OTRHI9Qnnlt41lC3msVVIdYXbhNrpMU=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBkz7rfP7gpMyuwSM5DgCGz9F3qC6ec22VnO3+5H/+f2S
 FuvGdTZUcrCIMbFICumyLLnSv75zexv5T9P+3gUZg4rE8gQBi5OAZhI3SeGf8aOGR4el9VjFO5U
 PLneIvzloknKrifdn48/kjt9dy3Hsn2MDH1xX14kyhdvn/w2Nvi++bOopJAfBdqtYfL/quSVjp+
 7wQUA
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
Changes in v5:
- Simplify function/capability registration by using
  I2C_FUNC_SMBUS_I2C_BLOCK, thanks Jonas Jelonek
- Link to v4: https://lore.kernel.org/r/20250809-i2c-rtl9300-multi-byte-v4-0-d71dd5eb6121@narfation.org

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
      i2c: rtl9300: Fix out-of-bounds bug in rtl9300_i2c_smbus_xfer

Harshal Gohel (2):
      [i2c-host-fixes] i2c: rtl9300: Fix multi-byte I2C write
      [i2c-host] i2c: rtl9300: Implement I2C block read and write

Sven Eckelmann (2):
      [i2c-host-fixes] i2c: rtl9300: Increase timeout for transfer polling
      [i2c-host-fixes] i2c: rtl9300: Add missing count byte for SMBus Block Ops

 drivers/i2c/busses/i2c-rtl9300.c | 51 +++++++++++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 9 deletions(-)
---
base-commit: 7e161a991ea71e6ec526abc8f40c6852ebe3d946
change-id: 20250802-i2c-rtl9300-multi-byte-edaa1fb0872c

Best regards,
-- 
Sven Eckelmann <sven@narfation.org>


