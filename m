Return-Path: <linux-i2c+bounces-4422-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BBE91AE72
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 19:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEA34B21B5E
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 17:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A753C19AD93;
	Thu, 27 Jun 2024 17:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="gmup1eXA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D3319A2BB;
	Thu, 27 Jun 2024 17:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719510501; cv=none; b=qhspYu3eMDzSZXiBl0U8HxeKoqobh0mm/FeQ8l3nggwjdMr7apRqMNJKneHGX3dvyGHamhXPEIltMFOSKl2XjmYaM2iAunevEkU29c43afrzPgmWvi/foMQ7CgUWTrxQfvFtKPlqve42CytG9jCj8PMEuBrm59lwLZxB/wWyd+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719510501; c=relaxed/simple;
	bh=74A2TeSAT5o1avYbR2JpzelxgqxU5FX2kun/CTEKwN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CCNcZjAR2k7uKwz8NHuOwiWTtKC0PSxKAMOD91ZNM3m04QRb6FClyfkKJvTkzZsfw1vyTik23GD1UaTRoja//MqOnvnb8mSMRAXDIUAMIPWty8Zhrad+F9N92eu7yn5OSjdLAP0qhiV+O0/Xr4AOlK3CDKhF2EWeGiEaYzpoemI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=gmup1eXA; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1719510495;
	bh=74A2TeSAT5o1avYbR2JpzelxgqxU5FX2kun/CTEKwN4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gmup1eXAValqk5KZJRHFkrxVqF08NtXLaY1W0yKUesCXJA8YsW5uRjmEwwTwziodP
	 UdfI20rQhq6yj/6JfGYije9lC5qUK3rBLCGznsPtpPslC+lXn7HS2fb7zQBumlDm8m
	 dbPh9w1/3R/uH+knp4Y9g+bye5rOAqo0/LRqqGbs=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 27 Jun 2024 19:48:13 +0200
Subject: [PATCH v2 3/4] i2c: smbus: drop warning about muxed segments
 requirement
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240627-piix4-spd-v2-3-617ce47b8ff4@weissschuh.net>
References: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net>
In-Reply-To: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net>
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719510495; l=1101;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=74A2TeSAT5o1avYbR2JpzelxgqxU5FX2kun/CTEKwN4=;
 b=yC9URugz+cyNN1RocUi46I5h/SJGkMuUXjGeWBCPNZpQxafsEVZeu6WUPG2IftrphyoHfTM9k
 Txl9BRqMPRiC31gsWhFl5znH8vWbNDVVQHHs3X+wziwXPfqOcnueh/s
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The check and warning are very specific to the SPD usage of the i801
driver. That was fine as long as i801 was the only caller of
i2c_register_spd(). Now that piix4 also wants to do the same the check
and warning are not accurate anymore.
Instead of introducing a more complicated calling protocol only to print
a warning, drop the warning.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/i2c/i2c-smbus.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index cdbb95fe104e..f0ac35fd0c5a 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -356,10 +356,6 @@ void i2c_register_spd(struct i2c_adapter *adap)
 	 * If more slots are present either muxed or multiple busses are
 	 * necessary or the additional slots are ignored.
 	 */
-	if (!i2c_parent_is_i2c_adapter(adap) && slot_count > 8) {
-		dev_warn(&adap->dev,
-			 "More than 8 memory slots on a single bus, contact i801 maintainer to add missing mux config\n");
-	}
 	slot_count = min(slot_count, 8);
 
 	/*

-- 
2.45.2


