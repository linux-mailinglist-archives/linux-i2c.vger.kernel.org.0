Return-Path: <linux-i2c+bounces-4836-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7170492D005
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 13:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2516E1F27015
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 11:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36E718F2FB;
	Wed, 10 Jul 2024 11:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gxh2nwty"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2CE17BB20
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 11:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720609413; cv=none; b=VRgljPoksMNeuMjoHHGadni1uiY0kbt9nwqucOVUGIqXEFR9XHQ5MvD1JlSHusImE7H05bwU9oprWSplqcSU+HTortjmt8BAnRd076K1H8DLTiwIgzXixJy6A6w3JVQaY3fSNmYC53wM7tDHoWLURjlArhx9Rih2Y6NcLtH92pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720609413; c=relaxed/simple;
	bh=0t0azsxRFwTHJyK0rshFrglsTJ86Rj4OCjaw64QomKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HwOV+yolgk4UfmurM6UinJzRAxgYkLRPItsaVY584avNe70b10KgGc8OlrSFL0XuhEPTE9chOT5QtJ9tg45FoHx1E0Pzfa0FHvhglie0tgyG7lnISYk91db4p4m2UbDruM/GnWcOlncIPlp1MU7SPQv0Ld3U8ZCt0PPpepaRbyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gxh2nwty; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=WkVMEbo8RR32pB
	GLYFBjnzqg9Cn7vP2XzOaB36zaeBc=; b=gxh2nwtyjzPNz+yQjYDtHxzi4FpIyc
	EjE47q8rFoFL0LwelyqAlrWyNvMnYJCt0eZTHSW3lc6KIw5vuTNwwBluswciH91y
	3xxXzgBISXtQsyyPSNLEsKtEnOM66WMeEeoaeI7dm3WPJixKVgdQ4Ve0vD2Az/sw
	3J+yYVd0+gkqEACfNMzs4l2in7W/+S+SQHcUmd7wn8xAFkjUP3IUj0wwgA2FOuU/
	MfMzJBHWIQJY/X/EC0jXJ3Xozb/X96jpuHaoHIk1uxhiXhM+vxqIqLcSwtRmpX9F
	aExzC2ni2hqg7d8oTO84dFft5JZ8iVJ9JkrJADWOa5LgOBvZMnd7v3ig==
Received: (qmail 504693 invoked from network); 10 Jul 2024 13:03:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jul 2024 13:03:20 +0200
X-UD-Smtp-Session: l3s3148p1@Zl8UmOIcONwujnsa
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: rcar: clear NO_RXDMA flag after resetting
Date: Wed, 10 Jul 2024 13:03:00 +0200
Message-ID: <20240710110259.49181-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We should allow RXDMA only if the reset was really successful, so clear
the flag after the reset call.

Fixes: 0e864b552b23 ("i2c: rcar: reset controller is mandatory for Gen3+")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 29c7fafeb8a9..8f2ede534f30 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -912,10 +912,10 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 
 	/* Gen3+ needs a reset. That also allows RXDMA once */
 	if (priv->devtype >= I2C_RCAR_GEN3) {
-		priv->flags &= ~ID_P_NO_RXDMA;
 		ret = rcar_i2c_do_reset(priv);
 		if (ret)
 			goto out;
+		priv->flags &= ~ID_P_NO_RXDMA;
 	}
 
 	rcar_i2c_init(priv);
-- 
2.43.0


