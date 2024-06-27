Return-Path: <linux-i2c+bounces-4420-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7435B91AE6B
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 19:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D09AAB223D5
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 17:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C34619AA52;
	Thu, 27 Jun 2024 17:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="XSGMW+Me"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D0319A28A;
	Thu, 27 Jun 2024 17:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719510500; cv=none; b=AW8J7/tTmtR+nwIXtJfBOa/lxBFbbjf2P6Tw27jgJMnk0wu364r6oig4yn8LLl2IKOaY2VRHIh27TjevPbVU2QnzV9TGxQklqWFvAZ+Hgc5JldvqPeP6TZ/Vauv2IsjTVAQZaya55BTJzsBSeC0W87XoYO64n9clttDb1LS2Lho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719510500; c=relaxed/simple;
	bh=ON98I4kxeBsfWE8Kg8UOWYTMrbSepNH46iR8CasugEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QLNK5iSNi20ryfUIsjGRO4tzXgNeSuygnMvTrYaUR6gD6y/pW5SlxlVW8kRC7t1nBz9MkP9ej9TmlSJVCvgHyVKdQPaNGBAsSUXxBDKpn43zSasoZ3OETZChjEiKVKMdapzrglA6cDnnm0W2iV1C0dCcscix1zxSytLlcblNcA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=XSGMW+Me; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1719510495;
	bh=ON98I4kxeBsfWE8Kg8UOWYTMrbSepNH46iR8CasugEg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XSGMW+MePHfSnMTzrF0P/I12Lbfhu4BCkn55MoAWP1DQnGDeIDCEsOpt0VQRZNkuC
	 CuHyaSl7cSxWI0AxJLDWhPXyhg2I+fjK3PuJE5ti6oXGp3r6/J+hvpMMvdpi4M082b
	 9H0a+wz6Za5YQ1eSyoZWrDo2O77tv3pNS+rkDVxs=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 27 Jun 2024 19:48:12 +0200
Subject: [PATCH v2 2/4] i2c: smbus: probe SPDs on a best-effort basis
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240627-piix4-spd-v2-2-617ce47b8ff4@weissschuh.net>
References: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net>
In-Reply-To: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net>
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719510495; l=1540;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=ON98I4kxeBsfWE8Kg8UOWYTMrbSepNH46iR8CasugEg=;
 b=wftM+6W7fxyEYP80QZeSIqbQJNDZgzmvy3o3RPBgWTvmM4vWBcm0/GCK+ssuJDPoc7/QhrCr/
 zTJSydUdULNC7YLITfGUsKA3wuezzBn9H/DGVCK/JtpsHVjWZUiykEl
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Even if it is likely that not all slots can be probed,
then at least probe the 8 slots that can.

Also adapt the comment to better fit the new logic.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/i2c/i2c-smbus.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 8f0403652606..cdbb95fe104e 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -352,18 +352,15 @@ void i2c_register_spd(struct i2c_adapter *adap)
 		return;
 
 	/*
-	 * If we're a child adapter on a muxed segment, then limit slots to 8,
-	 * as this is the max number of SPD EEPROMs that can be addressed per bus.
+	 * The max number of SPD EEPROMs that can be addressed per bus is 8.
+	 * If more slots are present either muxed or multiple busses are
+	 * necessary or the additional slots are ignored.
 	 */
-	if (i2c_parent_is_i2c_adapter(adap)) {
-		slot_count = min(slot_count, 8);
-	} else {
-		if (slot_count > 8) {
-			dev_warn(&adap->dev,
-				 "More than 8 memory slots on a single bus, contact i801 maintainer to add missing mux config\n");
-			return;
-		}
+	if (!i2c_parent_is_i2c_adapter(adap) && slot_count > 8) {
+		dev_warn(&adap->dev,
+			 "More than 8 memory slots on a single bus, contact i801 maintainer to add missing mux config\n");
 	}
+	slot_count = min(slot_count, 8);
 
 	/*
 	 * Memory types could be found at section 7.18.2 (Memory Device — Type), table 78

-- 
2.45.2


