Return-Path: <linux-i2c+bounces-4419-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA6991AE69
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 19:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD2E0B221BE
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 17:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5C219AA46;
	Thu, 27 Jun 2024 17:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="UIba0sIb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F74419A299;
	Thu, 27 Jun 2024 17:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719510500; cv=none; b=WnzRfiVeU+BdnsnD+wtoU/C1KiRY15gEo/lm6ZXe6leZWZt6CaXlJDc/lOMm2OVPiMf7kUynyhrS/wxgNzucuWBRKk6JzSVoLg9pxTA/eVZsk5sX1HSfRd2OvKJqD5BrTLnEzli3w6fLbl+uYOymJJScI15QPklLOBRjIaJgBds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719510500; c=relaxed/simple;
	bh=yPO4IKPS0N+e3zR4PMFA1NoA+jkkataabWTf+ErtjDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SLBCNGAY1Q9HK7d8Q6uKctVkTYn3E7jhM+GE2VR1LYirg44PuO2e4TNxkm/gwVqAvKNembNbMT1BBRaV59SixsUeqtZ5KAP8VInCLdh/M8vgUAtGIVyKx0TD9pvYhEh1GHE870eSTy3F9qExGK1y5g3yp4SdJtwsIBvi0x/gW6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=UIba0sIb; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1719510495;
	bh=yPO4IKPS0N+e3zR4PMFA1NoA+jkkataabWTf+ErtjDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UIba0sIbWfcUVDf8EitPZTjtGvqavs+Xu5FgzAwHtqg7fZ5G9Pqko+E6oE4YgK5oF
	 lRLvsjAsp4UnrBrR3VUA/y3K7BsC6W2B5CldNQGefuyfGxJY8dDxBFNToE6/VSjoEj
	 yhn8qWxhSA4Zpu/zibfr9HmmkeQIzc9piNBm4GuI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 27 Jun 2024 19:48:11 +0200
Subject: [PATCH v2 1/4] i2c: smbus: only limit max banks to eight
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240627-piix4-spd-v2-1-617ce47b8ff4@weissschuh.net>
References: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net>
In-Reply-To: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net>
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719510495; l=865;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=yPO4IKPS0N+e3zR4PMFA1NoA+jkkataabWTf+ErtjDU=;
 b=Y66WjhpWOZRLhm35AV6JPaD7yribSRCu8ucSopHb4SqQyPN4a7sbAJE7OIrVF1OUlwLzPSTE6
 3RdjLUbVs45DgQ63mQIL+JmUJFcXN9uZjqlQy0QNckubXvD8CMcVYLZ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

If there are less than eight slots in total,
only probe those.
Now the code matches the comment "..., then limit slots to 8".

Fixes: 8821c8376993 ("i2c: smbus: Prepare i2c_register_spd for usage on muxed segments")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/i2c/i2c-smbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index f809f0ef2004..8f0403652606 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -356,7 +356,7 @@ void i2c_register_spd(struct i2c_adapter *adap)
 	 * as this is the max number of SPD EEPROMs that can be addressed per bus.
 	 */
 	if (i2c_parent_is_i2c_adapter(adap)) {
-		slot_count = 8;
+		slot_count = min(slot_count, 8);
 	} else {
 		if (slot_count > 8) {
 			dev_warn(&adap->dev,

-- 
2.45.2


