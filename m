Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D44943B282
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 11:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388664AbfFJJwa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 05:52:30 -0400
Received: from sauhun.de ([88.99.104.3]:39710 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388796AbfFJJwa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Jun 2019 05:52:30 -0400
Received: from localhost (p54B33062.dip0.t-ipconnect.de [84.179.48.98])
        by pokefinder.org (Postfix) with ESMTPSA id EC4C94A1203;
        Mon, 10 Jun 2019 11:52:28 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] of: unittest: simplify getting the adapter of a client
Date:   Mon, 10 Jun 2019 11:51:56 +0200
Message-Id: <20190610095157.11814-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190610095157.11814-1-wsa+renesas@sang-engineering.com>
References: <20190610095157.11814-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We have a dedicated pointer for that, so use it. Much easier to read and
less computation involved.

Reported-by: Peter Rosin <peda@axentia.se>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Please apply to your subsystem tree.

 drivers/of/unittest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 3832a5de4602..e6b175370f2e 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1946,7 +1946,7 @@ static int unittest_i2c_mux_probe(struct i2c_client *client,
 {
 	int i, nchans;
 	struct device *dev = &client->dev;
-	struct i2c_adapter *adap = to_i2c_adapter(dev->parent);
+	struct i2c_adapter *adap = client->adapter;
 	struct device_node *np = client->dev.of_node, *child;
 	struct i2c_mux_core *muxc;
 	u32 reg, max_reg;
-- 
2.19.1

