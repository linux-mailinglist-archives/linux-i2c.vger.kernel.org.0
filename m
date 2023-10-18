Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D26D7CD8A8
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Oct 2023 11:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbjJRJyH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Oct 2023 05:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjJRJyE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Oct 2023 05:54:04 -0400
X-Greylist: delayed 450 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 18 Oct 2023 02:54:01 PDT
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 144A0FD
        for <linux-i2c@vger.kernel.org>; Wed, 18 Oct 2023 02:54:00 -0700 (PDT)
Received: from hq-00595.holoplot.net (unknown [62.214.9.170])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 821D128049D;
        Wed, 18 Oct 2023 09:46:29 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-i2c@vger.kernel.org
Cc:     wsa@kernel.org, Daniel Mack <daniel@zonque.org>
Subject: [PATCH] i2c: core: fix lockdep warning for sparsely nested adapter chain
Date:   Wed, 18 Oct 2023 11:46:13 +0200
Message-ID: <20231018094613.849007-1-daniel@zonque.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When adapters are chained in a sparse manner (with intermediate MFD devices,
for instance) the code currently fails to use the correct subclass for
the adapter's bus_lock which leads to false-positive lockdep warnings.

Fix this by walking the entire pedigree of the device and count all
adapters along the way instead of just checking the immediate parent.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
This hit me when during the development of a driver stack that isn't
submitted mainline yet. This patch could however be discussed
independently I think.

 drivers/i2c/i2c-core-base.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 60746652fd52..4692a1e5ea0a 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1189,9 +1189,11 @@ static void i2c_adapter_dev_release(struct device *dev)
 unsigned int i2c_adapter_depth(struct i2c_adapter *adapter)
 {
 	unsigned int depth = 0;
+	struct device *parent;
 
-	while ((adapter = i2c_parent_is_i2c_adapter(adapter)))
-		depth++;
+	for (parent = adapter->dev.parent; parent; parent = parent->parent)
+		if (parent->type == &i2c_adapter_type)
+			depth++;
 
 	WARN_ONCE(depth >= MAX_LOCKDEP_SUBCLASSES,
 		  "adapter depth exceeds lockdep subclass limit\n");
-- 
2.41.0

