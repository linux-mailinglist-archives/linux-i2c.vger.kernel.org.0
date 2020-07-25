Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A244B22D9A6
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jul 2020 21:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgGYTvG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Jul 2020 15:51:06 -0400
Received: from www.zeus03.de ([194.117.254.33]:34758 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727034AbgGYTvG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Jul 2020 15:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=2yn9NIJ4xsAUyM
        wvpYwaBjyIEBWqiEQ11TIrhjcrHsA=; b=qi3HBAZ4gFqKcIZ3eDNLas2uE6ydxV
        biAJiZdGcdwgGe20hp8XcIyJdDPXguORIpDf4+tCaevubFrPs/Q3EgTRv+G8opLv
        pO5BzXB+AKiOjo60vxi8oLVw94e/xQAoeMgI9WxU9u9PeAssIHAP8aZiET9oQvu3
        P63+g4vQzCpQw=
Received: (qmail 4064627 invoked from network); 25 Jul 2020 21:51:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jul 2020 21:51:04 +0200
X-UD-Smtp-Session: l3s3148p1@ZtHkaEmrzpQgAwDPXyGYAKSbnEfVwReQ
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Alain Volmat <alain.volmat@st.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] i2c: slave: improve sanity check when registering
Date:   Sat, 25 Jul 2020 21:50:52 +0200
Message-Id: <20200725195053.14334-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200725195053.14334-1-wsa+renesas@sang-engineering.com>
References: <20200725195053.14334-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add check for ERR_PTR and simplify code while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-slave.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-slave.c b/drivers/i2c/i2c-core-slave.c
index 5427f047faf0..549751347e6c 100644
--- a/drivers/i2c/i2c-core-slave.c
+++ b/drivers/i2c/i2c-core-slave.c
@@ -18,10 +18,8 @@ int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_cb)
 {
 	int ret;
 
-	if (!client || !slave_cb) {
-		WARN(1, "insufficient data\n");
+	if (WARN(IS_ERR_OR_NULL(client) || !slave_cb, "insufficient data\n"))
 		return -EINVAL;
-	}
 
 	if (!(client->flags & I2C_CLIENT_SLAVE))
 		dev_warn(&client->dev, "%s: client slave flag not set. You might see address collisions\n",
-- 
2.20.1

