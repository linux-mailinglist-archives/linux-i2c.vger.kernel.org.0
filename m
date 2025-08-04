Return-Path: <linux-i2c+bounces-12144-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C52EB1A966
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 21:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A60C623251
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 19:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183D2238C08;
	Mon,  4 Aug 2025 19:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="e+kXtpvR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661F91C84A2;
	Mon,  4 Aug 2025 19:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754335081; cv=none; b=JC+0hA0DT0yNBRhA7xH3u3MK+YbCZ+kEFUg8aoMJDfuuE5w89urJ/r21Kz8rQoP/aE00uPs2ux2uK7LpaxpfWqUUUedDjUC69kZS9KMF3HbLiG+G0zm5btlpHfO5IydLURAHfJWw3NADUWWkTs3w8H8TAkMIybSjBqfBUj7rmg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754335081; c=relaxed/simple;
	bh=uwyBiqBNOuTA7ZJGpkmjA4i/Cn2gcwOadBggd5429/U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gPdsd+Fp3q0vkpSj+leX4EXP43cY21XBnhKWtlUBoo9Ub5gm3HJjr9TvQ2VSrlq0PA6od7OfatgxbkNeCjOn/E88rQGrzPjYavtRvwIoIn9RPJvkhuX04vOdVlumZ3MZOv/Z8lYMXxkBtFBJRq4eEpSXs04LBfTi+iup4zE3EgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=e+kXtpvR; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id 638172034F;
	Mon,  4 Aug 2025 19:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754335070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wnREMRvpLhIesXnDUqDjrA5KGeQuNSzhw1y7oCnnJyA=;
	b=e+kXtpvRsZH+fN1+0peJ49Ngkttzhq//aVlD4gUCXo3r0GaU0r65BOhAdY6wM1IWeSgLIA
	m+Kt6JMoM4X4p/4+GKY42wW9gjnszEmhh9KgFwlAfaIahzByGhxfT+RvJwyy2r4ZhxCFGM
	4k1Ik4C40xiOm7jukFOhobultu4EMfo=
From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH v3 0/5] i2c: rtl9300: Fix multi-byte I2C operations
Date: Mon, 04 Aug 2025 21:16:59 +0200
Message-Id: <20250804-i2c-rtl9300-multi-byte-v3-0-e20607e1b28c@narfation.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACsHkWgC/4XOwQ6CMAyA4VcxOztTSmCbJ9/DeNiggyUIZpuLh
 PDuDk7GxHj8m/RrFxbIOwrsfFiYp+SCm8Yc5fHAml6PHXHX5mYIWIEE5A4b7uOgSgB+fw7RcTN
 H4tRqXVgDUmDD8vLDk3WvHb7ecvcuxMnP+51UbNO/ZCo48MrWUhCAkoSXUXurY/7wNPmObWzCT
 6r8SWGmlBFGVMoSmvqbWtf1DTSh2BALAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4212; i=sven@narfation.org;
 h=from:subject:message-id; bh=uwyBiqBNOuTA7ZJGpkmjA4i/Cn2gcwOadBggd5429/U=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBkT2cMKzL4yX7rps2hmXVt7/PudX5Z6qDBqWTemLlp/r
 vFHsMTijlIWBjEuBlkxRZY9V/LPb2Z/K/952sejMHNYmUCGMHBxCsBEjN8wMvzjU46NMHqSfiz5
 RNukmk0Hvt5Zd/yobUzP1fr2kN0rCpYw/PdNrX4ivmjdhd3L5Q0eP1lh/0+ke+mdM5Ir31tIHfG
 cfpQXAA==
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF

During the integration of the RTL8239 POE chip + its frontend MCU, it was
noticed that multi-byte operations were basically broken in the current
driver.

Tests using SMBus Block Writes showed that the data (after the Wr + Ack
marker) was mixed up on the wire. At first glance, it looked like an
endianness problem. But for transfers were the number of count + data bytes
was not divisible by 4, the last bytes were not looking like an endianness
problem because they were were in the wrong order but not for example 0 -
which would be the case for an endianness problem with 32 bit registers. At
the end, it turned out to be a the way how i2c_write tried to add the bytes
to the send registers.

Each 32 bit register was used similar to a shift register - shifting the
various bytes up the register while the next one is added to the least
significant byte. But the I2C controller expects the first byte of the
tranmission in the least significant byte of the first register. And the
last byte (assuming it is a 16 byte transfer) in the most significant byte
of the fourth register.

While doing these tests, it was also observed that the count byte was
missing from the SMBus Block Writes. The driver just removed them from the
data->block (from the I2C subsystem). But the I2C controller DOES NOT
automatically add this byte - for example by using the configured
transmission length.

The RTL8239 MCU is not actually an SMBus compliant device. Instead, it
expects I2C Block Reads + I2C Block Writes. But according to the already
identified bugs in the driver, it was clear that the I2C controller can
simply be modified to not send the count byte for I2C_SMBUS_I2C_BLOCK_DATA.
The receive part, just needs to write the content of the receive buffer to
the correct position in data->block.

While the on-wire formwat was now correct, reads were still not possible
against the MCU (for the RTL8239 POE chip). It was always timing out
because the 2ms were not enough for sending the read request and then
receiving the 12 byte answer.

These changes were originally submitted to OpenWrt. But there are plans to
migrate OpenWrt to the upstream Linux driver. As result, the pull request
was stopped and the changes were redone against this driver.

For reasons of transparency: The work on I2C_SMBUS_I2C_BLOCK_DATA support
for the RTL8239-MCU was done on RTL931xx. All problem were therefore
detected with the patches from Jonas Jelonek [1] and not the vanilla Linux
driver. But looking through the code, it seems like these are NOT
regressions introduced by the RTL931x patchset.

I've picked up Alex Guo's patch [2] to reduce conflicts between pending
fixes.

[1] https://patchwork.ozlabs.org/project/linux-i2c/cover/20250727114800.3046-1-jelonek.jonas@gmail.com/
[2] https://lore.kernel.org/r/20250615235248.529019-1-alexguo1023@gmail.com

Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
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
      i2c: rtl9300: Fix multi-byte I2C write
      i2c: rtl9300: Implement I2C block read and write

Sven Eckelmann (2):
      i2c: rtl9300: Increase timeout for transfer polling
      i2c: rtl9300: Add missing count byte for SMBus Block Ops

 drivers/i2c/busses/i2c-rtl9300.c | 51 ++++++++++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 7 deletions(-)
---
base-commit: 0ae982df67760cd08affa935c0fe86c8a9311797
change-id: 20250802-i2c-rtl9300-multi-byte-edaa1fb0872c

Best regards,
-- 
Sven Eckelmann <sven@narfation.org>


