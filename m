Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA0D424E3B
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Oct 2021 09:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240434AbhJGHrQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Oct 2021 03:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240429AbhJGHrP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Oct 2021 03:47:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65DD1C061746
        for <linux-i2c@vger.kernel.org>; Thu,  7 Oct 2021 00:45:22 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mYO5c-0003VI-3X; Thu, 07 Oct 2021 09:45:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mYO5a-0005v5-Fn; Thu, 07 Oct 2021 09:45:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mYO5a-0005up-F2; Thu, 07 Oct 2021 09:45:14 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     trivial@kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: Fix typo s/business/busyness/
Date:   Thu,  7 Oct 2021 09:44:57 +0200
Message-Id: <20211007074457.2393322-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=ciB9g0l7zS/ry8nKmFaiTbjkC7vA2J0z68OasJFm2D0=; m=GM/WoEi5PgLwaCa0f3MutQ2ymb6Hmc7Hac/WZQ086oo=; p=Jde8hiZhhgEZY9Mcqjen9jixRWhG7lls43/hMI3GRv0=; g=a47f100135b7597751536b3b79c5e964ca65479c
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de; s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6; b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFepXYACgkQwfwUeK3K7AkvBQf6AmS rJiXzUWl2yvrv6sTnCUzgnaWZdxike9sdMb5vgeHTc6+PDIUwPgzu4Dp0XrJgZYHqFQCLrFEBwn5q kO+hy6F3Uc/Mx+KDhkaOqMZoLDkRA4bMXuYWwnk9mNiIcA9cFrCDK6TruQq4evdlIPR1iXO00hBkc KQovFjpVR9tqz9m9Ue0Ire70WYHnmQ3PgwtdQdfmPHloaWRlvFI7LnNb+eknRMM8JPkKrenjVQZoM oSDWtYMb2ngxTjvLPnRay0+6hLel6+3EVrbPb8LuSjzQ22udBS8Wy5j5tKs/FdE9rPOM8gpMqOhB/ OELlGA0qLesTb6UCNXjTJer3eMNoTKg==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

While business is a real word here busyness is meant, so fix accordingly.
I hope I didn't miss this being a funny play on words :-)

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/i2c-core-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 54964fbe3f03..891cd0131746 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1036,7 +1036,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 		goto out_err_silent;
 	}
 
-	/* Check for address business */
+	/* Check for address busyness */
 	status = i2c_check_addr_busy(adap, i2c_encode_flags_to_addr(client));
 	if (status)
 		goto out_err;

base-commit: 5816b3e6577eaa676ceb00a848f0fd65fe2adc29
-- 
2.30.2

