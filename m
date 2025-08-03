Return-Path: <linux-i2c+bounces-12126-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5557B1948D
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 18:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F7CC7AA340
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 16:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D344E1D9A54;
	Sun,  3 Aug 2025 16:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="Mj2dIhY1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AFB23AD;
	Sun,  3 Aug 2025 16:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754240160; cv=none; b=YSNiG0ncvAiplnhgM4rMKBu1xu5aByQrUt5PjuD7li1gHu/H06pfyutWr8yxkD4pmLpLdWvKO7J38V1RVeMUj6BHN2MhPQeI4zmgA+BxFOf4i1bDCOvwBQwsOqgEw1qNUcW9kh+bDaqB+gfR+ITPAe9pZiHBX5BshVJqIocwbRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754240160; c=relaxed/simple;
	bh=Nlq3U7HDOUVhrJOZnty2PhlW+Gu4rePBDyOrl38KBPI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eMiziIJH3bxu+2x9wwesns4cvQwOcE1/Pn1+1I2LSt0f8Y0fWc6plXesTQefoF4edWTgNCdXQXN0pg2RwHccsSBDN3vJwI8ng6Be8rLG8lZhcPktHT3HucM86qxefrH6/8wlg3sKF1MQgOPtr1TJHwbrjIU2bkzun+EG8z3RAwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=Mj2dIhY1; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id D0B27203A5;
	Sun,  3 Aug 2025 16:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754240148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qNUJ5hqugrDrtghRvRRfnu87WCqAv2oX7EJc0/Q/6/w=;
	b=Mj2dIhY1KqoxEiCxi8YIlYEsmbzXPCoz5JM+OHqNjTi+fqUrr+UnluH7EGuFShM6DD05iG
	dUyloPPGKZwDkBC9SuAC6jR28GDhoAPVELxl2009+q4foo1FawnSm2L4mjdK8XVSGrwf0B
	UBUpYOAeUrqRjN15Gw1YvAbpCVJR5So=
From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH v2 0/4] i2c: rtl9300: Fix multi-byte I2C operations
Date: Sun, 03 Aug 2025 18:54:37 +0200
Message-Id: <20250803-i2c-rtl9300-multi-byte-v2-0-9b7b759fe2b6@narfation.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE2Uj2gC/4WOQQ6CMBBFr0K6dswwBimuvIdhUWAKkyCYaSUSw
 t2tXMDl+8l//28msAoHc8s2o7xIkHlKQKfMtIObegbpEhtCKtAigVALGsfqggjP9xgFmjUycOd
 c7hu0JbUmlV/KXj6H+FEnHiTEWddjZ8l/6V/lkgNC4a+2ZMTKMt0np97F9PA8a2/qfd+/lwxUP
 MAAAAA=
X-Change-ID: 20250802-i2c-rtl9300-multi-byte-edaa1fb0872c
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3585; i=sven@narfation.org;
 h=from:subject:message-id; bh=Nlq3U7HDOUVhrJOZnty2PhlW+Gu4rePBDyOrl38KBPI=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBn9U/qSiyo2nd7zevWRkq2dunq5XGXT5E6wl1bUv07R5
 hP78Du7o5SFQYyLQVZMkWXPlfzzm9nfyn+e9vEozBxWJpAhDFycAjARkUmMDIfrp1dwv3y5ZL6M
 r8qWSL6FzyzCLZjjg2/knLgQXrbQfB3Df2fONsZLRv/sFghHvZw5bYOf9oe8rW4Tb+yLf/fDVkM
 nihEA
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

[1] https://patchwork.ozlabs.org/project/linux-i2c/cover/20250727114800.3046-1-jelonek.jonas@gmail.com/

Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
Changes in v2:
- add the missing transfer width and read length increase for the SMBus
  Write/Read
- Link to v1: https://lore.kernel.org/r/20250802-i2c-rtl9300-multi-byte-v1-0-5f687e0098e2@narfation.org

---
Harshal Gohel (2):
      i2c: rtl9300: Fix multi-byte I2C write
      i2c: rtl9300: Implement I2C block read and write

Sven Eckelmann (2):
      i2c: rtl9300: Increase timeout for transfer polling
      i2c: rtl9300: Add missing count byte for SMBus Block Ops

 drivers/i2c/busses/i2c-rtl9300.c | 43 +++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 7 deletions(-)
---
base-commit: b9ddaa95fd283bce7041550ddbbe7e764c477110
change-id: 20250802-i2c-rtl9300-multi-byte-edaa1fb0872c

Best regards,
-- 
Sven Eckelmann <sven@narfation.org>


