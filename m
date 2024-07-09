Return-Path: <linux-i2c+bounces-4798-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF28692C296
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 19:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9D911C2200C
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 17:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC3D17B023;
	Tue,  9 Jul 2024 17:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="nLYoLWqy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FF71B86CA;
	Tue,  9 Jul 2024 17:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720546544; cv=none; b=E3UTYsHmuJxm0IhOwk0b/w6Pd285US0UJnkiAvomFN+Dqk7k97CxR86ixfibw0opBece8lJe2QWJHXOkHZMvw4rm9Tqo9sOf/malhhDVu2bEJjNPGvwK6yOgD4BDuCkfaE+a40tqDxQ081j7QUvPPzA55r/7BlozOV9lPhfgEp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720546544; c=relaxed/simple;
	bh=xD0bGdV/2IW+jndC2zwfx+FiqpbSHBhUIj4wvFJCbMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jgU1ueyIkVp67tjDYaaJc4pvl/6MTCIlNJuh291jnw1s8v1Mh6Zx4mZyg3XQRTolvH6ETHi6b+8M+hLv+EmHJNLKcvnzdqyLe6ajFxjRpXbZqJUwMOwYy3foL5qYFpbGQUTYEDqlasxNIKVHb19wxeGhKb3w6pYFJIJXxalW5/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=nLYoLWqy; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1720546537;
	bh=xD0bGdV/2IW+jndC2zwfx+FiqpbSHBhUIj4wvFJCbMM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nLYoLWqyUMsKeXmmSWPFKZrtBRsth1b1TuVPXZCjPtwn86kO+JYgz4O0KkgbgOdlF
	 Xs+OxjBATcleiCP3lV4H8/Umhvy47bgM41Ak3TEVC17XD1OCsAv4Gaj2BeynhpCi8g
	 sdw3TQmA1p3Ro47gqDdd7z82V0Q0E8Kwq7gTq+Oo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 09 Jul 2024 19:35:35 +0200
Subject: [PATCH v3 1/2] i2c: smbus: remove i801 assumptions from SPD
 probing
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240709-piix4-spd-v3-1-9d1daa204983@weissschuh.net>
References: <20240709-piix4-spd-v3-0-9d1daa204983@weissschuh.net>
In-Reply-To: <20240709-piix4-spd-v3-0-9d1daa204983@weissschuh.net>
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720546537; l=1642;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=xD0bGdV/2IW+jndC2zwfx+FiqpbSHBhUIj4wvFJCbMM=;
 b=IxmaWPNNkojL7XR0yRA11ZopG7fu2IPdYS0E7KUMMCUhnTnbox5cHYM2vSp2OalN/Y1OSfmut
 Bgg1mNxoS1sCrOHWq5BnHz7sx8BbXA0wA/nsEDwSMG13zdmua+IlWOa
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The check and warning are very specific to the SPD usage of the i801
driver. That was fine as long as i801 was the only caller of
i2c_register_spd(). Now that piix4 will be added as another user of that
function, the check and warning are not accurate anymore.
Instead of introducing a more complicated calling protocol only to print
a warning, drop the warning.
Even in cases where not all slots can be probed,
then at least probe the 8 slots that can be.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/i2c/i2c-smbus.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index f809f0ef2004..f0ac35fd0c5a 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -352,18 +352,11 @@ void i2c_register_spd(struct i2c_adapter *adap)
 		return;
 
 	/*
-	 * If we're a child adapter on a muxed segment, then limit slots to 8,
-	 * as this is the max number of SPD EEPROMs that can be addressed per bus.
+	 * The max number of SPD EEPROMs that can be addressed per bus is 8.
+	 * If more slots are present either muxed or multiple busses are
+	 * necessary or the additional slots are ignored.
 	 */
-	if (i2c_parent_is_i2c_adapter(adap)) {
-		slot_count = 8;
-	} else {
-		if (slot_count > 8) {
-			dev_warn(&adap->dev,
-				 "More than 8 memory slots on a single bus, contact i801 maintainer to add missing mux config\n");
-			return;
-		}
-	}
+	slot_count = min(slot_count, 8);
 
 	/*
 	 * Memory types could be found at section 7.18.2 (Memory Device — Type), table 78

-- 
2.45.2


