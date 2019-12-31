Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3898D12DA3F
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Dec 2019 17:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbfLaQOi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Dec 2019 11:14:38 -0500
Received: from sauhun.de ([88.99.104.3]:51582 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727064AbfLaQOh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 31 Dec 2019 11:14:37 -0500
Received: from localhost (p5486C426.dip0.t-ipconnect.de [84.134.196.38])
        by pokefinder.org (Postfix) with ESMTPSA id 908992C07CF;
        Tue, 31 Dec 2019 17:14:35 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 5/5] simple test case for the I2C alias functionality
Date:   Tue, 31 Dec 2019 17:14:00 +0100
Message-Id: <20191231161400.1688-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Not for upstream!

Not-Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c |  2 +-
 sound/soc/codecs/ak4642.c   | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 0cc4a5c49a15..97d3e9f8dfa7 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1307,7 +1307,7 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 		adap->lock_ops = &i2c_adapter_lock_ops;
 
 	adap->locked_flags = 0;
-	adap->alias_idx = 0x08;	/* first valid I2C address */
+	adap->alias_idx = 0x3e;	/* first valid I2C address */
 	rt_mutex_init(&adap->bus_lock);
 	rt_mutex_init(&adap->mux_lock);
 	mutex_init(&adap->userspace_clients_lock);
diff --git a/sound/soc/codecs/ak4642.c b/sound/soc/codecs/ak4642.c
index 353237025514..d34476b80b41 100644
--- a/sound/soc/codecs/ak4642.c
+++ b/sound/soc/codecs/ak4642.c
@@ -639,6 +639,25 @@ static int ak4642_i2c_probe(struct i2c_client *i2c,
 	struct regmap *regmap;
 	struct ak4642_priv *priv;
 	struct clk *mcko = NULL;
+struct i2c_client *test, *test2, *test3;
+
+test = i2c_new_alias_device(i2c->adapter);
+printk(KERN_INFO "****** wsa: %08x %08x\n", test->addr, i2c->adapter->alias_idx);
+
+test2 = i2c_new_alias_device(i2c->adapter);
+printk(KERN_INFO "****** wsa: %08x %08x\n", test2->addr, i2c->adapter->alias_idx);
+
+//i2c_unregister_device(test2);
+//printk(KERN_INFO "****** wsa: %08x %08x\n", test2->addr, i2c->adapter->alias_idx);
+
+i2c_unregister_device(test);
+printk(KERN_INFO "****** wsa: %08x %08x\n", test->addr, i2c->adapter->alias_idx);
+
+test = i2c_new_alias_device(i2c->adapter);
+printk(KERN_INFO "****** wsa: %08x %08x\n", test->addr, i2c->adapter->alias_idx);
+
+test3 = i2c_new_alias_device(i2c->adapter);
+printk(KERN_INFO "****** wsa: %08x %08x\n", test3->addr, i2c->adapter->alias_idx);
 
 	if (np) {
 		const struct of_device_id *of_id;
@@ -659,6 +678,7 @@ static int ak4642_i2c_probe(struct i2c_client *i2c,
 		return -EINVAL;
 	}
 
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
-- 
2.20.1

