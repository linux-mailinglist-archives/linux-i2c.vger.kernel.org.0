Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE56B20DC6D
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jun 2020 22:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbgF2UPM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jun 2020 16:15:12 -0400
Received: from www.zeus03.de ([194.117.254.33]:47826 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732390AbgF2UPL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 29 Jun 2020 16:15:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=eDBC4KfM5z9+QNVxmf00W2P5GNG
        LaUKgVLYgC8/H4o4=; b=ZaIA8gSdSz+Qb76S0qX641pIYj82nUPmcldnJeLBeeQ
        5BrvkNHt12a4f7AvAUrS3Hp2hFZDCx266RCh2iRysWrg6TnKnu7aiyxA/fr0G8X0
        3fOyi6uUl+7e7OKwRlGrMD5/5GS1nO0iqlw7S5KZzs2kFj1OQlEfCebhM5saFVPQ
        =
Received: (qmail 2108455 invoked from network); 29 Jun 2020 18:15:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jun 2020 18:15:08 +0200
X-UD-Smtp-Session: l3s3148p1@XVbLXDupTLMgAwDPXwOPAD5GWjq5uCZs
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] i2c: rcar: slave: only send STOP event when we have been addressed
Date:   Mon, 29 Jun 2020 18:15:06 +0200
Message-Id: <20200629161506.20617-1-wsa+renesas@sang-engineering.com>
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

Change since v1: It is probably cleaner to clear the SSR flag before we
enable the SSR interrupt.

 drivers/i2c/busses/i2c-rcar.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index a45c4bf1ec01..51a3909f8688 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -572,6 +572,9 @@ static bool rcar_i2c_slave_irq(struct rcar_i2c_priv *priv)
 
 	/* address detected */
 	if (ssr_filtered & SAR) {
+		/* Clear SSR, too, because of old STOPs to other clients than us */
+		rcar_i2c_write(priv, ICSSR, ~(SAR | SSR) & 0xff);
+
 		/* read or write request */
 		if (ssr_raw & STM) {
 			i2c_slave_event(priv->slave, I2C_SLAVE_READ_REQUESTED, &value);
@@ -582,14 +585,12 @@ static bool rcar_i2c_slave_irq(struct rcar_i2c_priv *priv)
 			rcar_i2c_read(priv, ICRXTX);	/* dummy read */
 			rcar_i2c_write(priv, ICSIER, SDR | SSR | SAR);
 		}
-
-		rcar_i2c_write(priv, ICSSR, ~SAR & 0xff);
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

