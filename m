Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADEA8256A2E
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Aug 2020 22:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728417AbgH2UiX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Aug 2020 16:38:23 -0400
Received: from www.zeus03.de ([194.117.254.33]:58354 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728491AbgH2UiW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Aug 2020 16:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=f5gjPSE4jbm4N/
        jLLF41Zghd+zThCN6fEw+rdAJVkOs=; b=gD9BnwzAU+jcynIvj9Xsmo2SGDMMg+
        SfOF7lJPfdTmiZUz3gJ/JuMJisFiO6Gzeb2jQOyi01Dd82JQWQn503Ar/DxvQku4
        ElMk2PwnUKGWo3dWr5ziSU5ZuK1Xa1AmaN1nWclJrXlCkPSYLc0dpBbA6jk2ctcM
        Bctmx1xIfrl1Q=
Received: (qmail 1629979 invoked from network); 29 Aug 2020 22:38:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Aug 2020 22:38:20 +0200
X-UD-Smtp-Session: l3s3148p1@6bRgJgqu/tAgAwDPXyCvAAFyN1rCWI+G
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] i2c: rcar: refactor and shorten timeout when resetting
Date:   Sat, 29 Aug 2020 22:38:10 +0200
Message-Id: <20200829203810.1467-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200829203810.1467-1-wsa+renesas@sang-engineering.com>
References: <20200829203810.1467-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

LOOP_TIMEOUT was only used back then because we didn't want to introduce
another constant. The timeout value can easily be a magnitude shorter
because the typical range is 3us - 8us. Refactor the code to use the
poll_timeout helper, use a specific timeout value and get rid of the
ugly LOOP_TIMEOUT constant.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index ef10514f6215..217def2d7cb4 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -150,9 +150,6 @@ struct rcar_i2c_priv {
 #define rcar_i2c_priv_to_dev(p)		((p)->adap.dev.parent)
 #define rcar_i2c_is_recv(p)		((p)->msg->flags & I2C_M_RD)
 
-#define LOOP_TIMEOUT	1024
-
-
 static void rcar_i2c_write(struct rcar_i2c_priv *priv, int reg, u32 val)
 {
 	writel(val, priv->io + reg);
@@ -765,20 +762,14 @@ static void rcar_i2c_release_dma(struct rcar_i2c_priv *priv)
 /* I2C is a special case, we need to poll the status of a reset */
 static int rcar_i2c_do_reset(struct rcar_i2c_priv *priv)
 {
-	int i, ret;
+	int ret;
 
 	ret = reset_control_reset(priv->rstc);
 	if (ret)
 		return ret;
 
-	for (i = 0; i < LOOP_TIMEOUT; i++) {
-		ret = reset_control_status(priv->rstc);
-		if (ret == 0)
-			return 0;
-		udelay(1);
-	}
-
-	return -ETIMEDOUT;
+	return read_poll_timeout_atomic(reset_control_status, ret, ret == 0, 1,
+					100, false, priv->rstc);
 }
 
 static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
-- 
2.20.1

