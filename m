Return-Path: <linux-i2c+bounces-4800-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6653992C299
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 19:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FDC11C23346
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 17:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20BB17B05F;
	Tue,  9 Jul 2024 17:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="kRvWZPpG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711E17F476;
	Tue,  9 Jul 2024 17:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720546546; cv=none; b=e4nJ7gE8Qo8rMD/DQnjZ5eSERjlN4qr8cCZO1JzaEHtR1Pd2lGkAwFmJNMgYBL5a0Cfg2lLxjYlFpwM7pah81AcWS3SMTbLWJb+GHUA+gxZEuEQ3iqiALwF1idb9ZiL8+sRgqJAjR+xleDc5O32mCqNoVo8buqOuZOoJnaRiHIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720546546; c=relaxed/simple;
	bh=He4okGE77ma+iy3EptPWaqUz3h77VnZ4vgs97Uw/Kuc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=snMwACcyPwQDv4VfxyvYtNe0Z5Edu2UgLFEg+i5m/NR1kAxTzGTBI5ZQ6rohcUQYKznh94OEWNt6H8aVOtVa+Pvv+wJDjONUM81ERCAof1W4bxouR9t9fuHJJus+36b80gz3oam3SlS35UH2Ucb99coVdSE4JpvmTWBREuApYNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=kRvWZPpG; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1720546537;
	bh=He4okGE77ma+iy3EptPWaqUz3h77VnZ4vgs97Uw/Kuc=;
	h=From:Subject:Date:To:Cc:From;
	b=kRvWZPpGwUWw39OyvQnMqmajDoAd0WfeV3Zi7GiefuI5bclC/DMOI1MzMbA4vsZa7
	 o15jCShxiRQihj+Hb4S17SFpmhxIOs6mIH2jHhSxdIS16u1Z2JPlPYJzo5SIIy15Co
	 1E/ESPr7oJVkgfMnloHEumsmnuyRdYseVQ+9cQok=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 0/2] i2c: smbus cleanups and SPD support for piix4
Date: Tue, 09 Jul 2024 19:35:34 +0200
Message-Id: <20240709-piix4-spd-v3-0-9d1daa204983@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOZ0jWYC/22MwQ6CMBAFf4X07Jq2FLCe/A/jgZat3QuQFiuG8
 O8WLprocV7ezMIiBsLIzsXCAiaKNPQZykPBrG/7OwJ1mZnkUvGq5DASzQri2EGprahqI6WuNMv
 /MaCjeW9db5k9xWkIrz2dxLb+qyQBArQ1TrQGjVPi8kSKMVr/8MceJ7alkvzotWy+dQkcatFYV
 I05Oad+9HVd31p7wfrmAAAA
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720546537; l=1620;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=He4okGE77ma+iy3EptPWaqUz3h77VnZ4vgs97Uw/Kuc=;
 b=epRxzLkUn4MZ8VTbPHbNYx/+efwIMfwUf9oW4OrIFktUePymBsd1ovtW2ksdau0tFxziPArYE
 kh+1FxpPRn5BmmltmrHW6XQs8RZvGQ7VEvEKnMxCp8h3IPBc2fqTXy9
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Patches 1 is a preparation patch.
Patch 2 is the actual change to piix4.

Patch 1 drops the warning about muxed busses.
I didn't feel that the warning only would warrant the additional
complexity it introduces with multiple callers of i2c_register_spd().

If others feel different, maybe a more generic warning/info or a source
code comment would suffice.

On a machine with 32 slots of which 16 are populated only the first 8
slots are addressable, half of which are empty.
Unfortunately I couldn't run a custom kernel for testing.
But manually instantiating ee1004 devices worked as expected,
so the proposed changes should also work.

Tested with spd5118 and two DIMMs.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v3:
- Apply tags from Guenter
- Squash commits 1-3, and reword the message slightly
- Drop Fixes:
- Link to v2: https://lore.kernel.org/r/20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net

Changes in v2:
- Add new i2c-smbus prep patches
- Only register SPD for port 0
- Link to v1: https://lore.kernel.org/r/20240530-piix4-spd-v1-1-9cbf1abebf41@weissschuh.net

---
Thomas Weißschuh (2):
      i2c: smbus: remove i801 assumptions from SPD probing
      i2c: piix4: Register SPDs

 drivers/i2c/busses/Kconfig     |  1 +
 drivers/i2c/busses/i2c-piix4.c |  4 ++++
 drivers/i2c/i2c-smbus.c        | 15 ++++-----------
 3 files changed, 9 insertions(+), 11 deletions(-)
---
base-commit: 9746c2dd0307c80bd695e4e3065367f3e0154723
change-id: 20240530-piix4-spd-39c156b22959

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


