Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 985F32E1FD3
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Dec 2020 18:22:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgLWRWo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Dec 2020 12:22:44 -0500
Received: from www.zeus03.de ([194.117.254.33]:41294 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgLWRWn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Dec 2020 12:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=nBOJOXfbfynAi/
        Za9gqHZdbaWKCZVPPBMKA59PdkcyI=; b=GGMH6wuvkwMPt2idYzr5ziMw24nRbP
        KHJoc4lGQI9COaoLdw7IPhBlCpp2SxM/x99nLsMlA951JOobr51c8Y1FPe4yD+Gj
        qRzcGGkAyDE7ji5qfchHef4zSFWT6iwfiDkA0GcClWNYXVyUE/VZNsP+ycrcS1U0
        suw0TGV2Bh1S0=
Received: (qmail 543612 invoked from network); 23 Dec 2020 18:22:01 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Dec 2020 18:22:01 +0100
X-UD-Smtp-Session: l3s3148p1@subl7SS3uOdUhszw
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/4] i2c: rcar: optimize cacheline to minimize HW race condition
Date:   Wed, 23 Dec 2020 18:21:52 +0100
Message-Id: <20201223172154.34462-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201223172154.34462-1-wsa+renesas@sang-engineering.com>
References: <20201223172154.34462-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

'flags' and 'io' are needed first, so they should be at the beginning of
the private struct.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 824586d7ee56..ad6630e3cc77 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -119,6 +119,7 @@ enum rcar_i2c_type {
 };
 
 struct rcar_i2c_priv {
+	u32 flags;
 	void __iomem *io;
 	struct i2c_adapter adap;
 	struct i2c_msg *msg;
@@ -129,7 +130,6 @@ struct rcar_i2c_priv {
 
 	int pos;
 	u32 icccr;
-	u32 flags;
 	u8 recovery_icmcr;	/* protected by adapter lock */
 	enum rcar_i2c_type devtype;
 	struct i2c_client *slave;
-- 
2.28.0

