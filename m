Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1046720E26A
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jun 2020 00:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730926AbgF2VE6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jun 2020 17:04:58 -0400
Received: from www.zeus03.de ([194.117.254.33]:58310 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390277AbgF2VE5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Jun 2020 17:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=XyELTfetusW4VBoR00hLLWOgmZS
        fcaubs1yryHnn78s=; b=Iu4+IcxwmCtCvwGfXRYDhaPZC+idgyhiWuIxmz6YMZt
        F6wUKyx47kANSR0Fm1k7aJrp0fJAvATDKccpE8Hnq8ngCnbbZnNYdRyP9seMTS6R
        WeaoUJQ77IwFWVSnwhAeA95RQhZbjTkrMHw1Y4dr4/mFaKyuY9EMc9lYF6oQ59Co
        =
Received: (qmail 2098223 invoked from network); 29 Jun 2020 17:38:13 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jun 2020 17:38:13 +0200
X-UD-Smtp-Session: l3s3148p1@m/C82DqpJLIgAwDPXwOPAD5GWjq5uCZs
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: rcar: slave: only send STOP event when we have been addressed
Date:   Mon, 29 Jun 2020 17:38:07 +0200
Message-Id: <20200629153807.15744-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When the SSR interrupt is activated, it will detect every STOP condition
on the bus, not only the ones after we have been addressed. So, enable
this interrupt only after we have been addressed, and disable it
otherwise.

Fixes: de20d1857dd6 ("i2c: rcar: add slave support")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index a45c4bf1ec01..c2921e1d8c4c 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -583,13 +583,14 @@ static bool rcar_i2c_slave_irq(struct rcar_i2c_priv *priv)
 			rcar_i2c_write(priv, ICSIER, SDR | SSR | SAR);
 		}
 
-		rcar_i2c_write(priv, ICSSR, ~SAR & 0xff);
+		/* Clear SSR, too, because of old STOPs to other clients than us */
+		rcar_i2c_write(priv, ICSSR, ~(SAR | SSR) & 0xff);
 	}
 
 	/* master sent stop */
 	if (ssr_filtered & SSR) {
 		i2c_slave_event(priv->slave, I2C_SLAVE_STOP, &value);
-		rcar_i2c_write(priv, ICSIER, SAR | SSR);
+		rcar_i2c_write(priv, ICSIER, SAR);
 		rcar_i2c_write(priv, ICSSR, ~SSR & 0xff);
 	}
 
@@ -853,7 +854,7 @@ static int rcar_reg_slave(struct i2c_client *slave)
 	priv->slave = slave;
 	rcar_i2c_write(priv, ICSAR, slave->addr);
 	rcar_i2c_write(priv, ICSSR, 0);
-	rcar_i2c_write(priv, ICSIER, SAR | SSR);
+	rcar_i2c_write(priv, ICSIER, SAR);
 	rcar_i2c_write(priv, ICSCR, SIE | SDBS);
 
 	return 0;
-- 
2.20.1

