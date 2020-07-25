Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19D9122D9A7
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jul 2020 21:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbgGYTvH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Jul 2020 15:51:07 -0400
Received: from www.zeus03.de ([194.117.254.33]:34774 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727997AbgGYTvG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Jul 2020 15:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=HxJCPjolVU7R0I
        uWsThmJoJrJCBnRD7U7CaWs2fvrRY=; b=jxFt2naXCjU0CspMMmaJKXHdGWkwCP
        BPG34yEBrnOMcsFziTieEVpLIFD423zJNYpkZCnUkXxxo1X2qPCf0JkZDhzyjot6
        si/6kV1Z7biwtaIMw/G0gMANv7iLqFpnXjRMZloYcV9W37/a7ihCvS2O9ax5ftDf
        ZkhTHl663th1Q=
Received: (qmail 4064655 invoked from network); 25 Jul 2020 21:51:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jul 2020 21:51:04 +0200
X-UD-Smtp-Session: l3s3148p1@VVztaEmr0JQgAwDPXyGYAKSbnEfVwReQ
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Alain Volmat <alain.volmat@st.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] i2c: slave: add sanity check when unregistering
Date:   Sat, 25 Jul 2020 21:50:53 +0200
Message-Id: <20200725195053.14334-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200725195053.14334-1-wsa+renesas@sang-engineering.com>
References: <20200725195053.14334-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-slave.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/i2c-core-slave.c b/drivers/i2c/i2c-core-slave.c
index 549751347e6c..1589179d5eb9 100644
--- a/drivers/i2c/i2c-core-slave.c
+++ b/drivers/i2c/i2c-core-slave.c
@@ -58,6 +58,9 @@ int i2c_slave_unregister(struct i2c_client *client)
 {
 	int ret;
 
+	if (IS_ERR_OR_NULL(client))
+		return -EINVAL;
+
 	if (!client->adapter->algo->unreg_slave) {
 		dev_err(&client->dev, "%s: not supported by adapter\n", __func__);
 		return -EOPNOTSUPP;
-- 
2.20.1

