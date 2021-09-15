Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 736DD40C69D
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Sep 2021 15:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233395AbhIONuB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Sep 2021 09:50:01 -0400
Received: from www.zeus03.de ([194.117.254.33]:47636 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233440AbhIONt7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Sep 2021 09:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=PNiM6eZq5pj/g+gSkyNwKqvUMRm
        5wxAam9ujQ99kTdM=; b=XSCRHMP/QJFa+VeWJ9YpMJGU5nLYy9YfKzauh+bCvq/
        5vSPi1fWqqb4eFp57ckycyIR68yV1rBdJrwz81lQDZTeXclXllbzKLUTXUT8J+Mn
        RcF/vSUK2ebjSHlCcqmDFCld2n3Ul54YSrHmp1QOUdjybXsOsM6ssTPlHLqZa51w
        =
Received: (qmail 836023 invoked from network); 15 Sep 2021 15:48:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Sep 2021 15:48:35 +0200
X-UD-Smtp-Session: l3s3148p1@+jMk9AjMjM4gARa4RQ+9AROD5QHDIpVt
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ryo Kataoka <ryo.kataoka.wt@renesas.com>
Subject: [PATCH] i2c: rcar: enable interrupts before starting transfer
Date:   Wed, 15 Sep 2021 15:48:27 +0200
Message-Id: <20210915134827.13043-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We want to enable the interrupts _before_ starting the transfer because
it is good programming style and also the proposed order in the R-Car
manual. There is no difference in practice because it doesn't matter in
which order both conditions appear if we wait for both to happen.

Signed-off-by: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index bff9913c37b8..fc13511f4562 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -339,6 +339,9 @@ static void rcar_i2c_prepare_msg(struct rcar_i2c_priv *priv)
 		priv->flags |= ID_LAST_MSG;
 
 	rcar_i2c_write(priv, ICMAR, i2c_8bit_addr_from_msg(priv->msg));
+	if (!priv->atomic_xfer)
+		rcar_i2c_write(priv, ICMIER, read ? RCAR_IRQ_RECV : RCAR_IRQ_SEND);
+
 	/*
 	 * We don't have a test case but the HW engineers say that the write order
 	 * of ICMSR and ICMCR depends on whether we issue START or REP_START. Since
@@ -354,9 +357,6 @@ static void rcar_i2c_prepare_msg(struct rcar_i2c_priv *priv)
 			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_START);
 		rcar_i2c_write(priv, ICMSR, 0);
 	}
-
-	if (!priv->atomic_xfer)
-		rcar_i2c_write(priv, ICMIER, read ? RCAR_IRQ_RECV : RCAR_IRQ_SEND);
 }
 
 static void rcar_i2c_next_msg(struct rcar_i2c_priv *priv)
-- 
2.30.2

