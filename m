Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34CA77BCABA
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Oct 2023 02:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234220AbjJHAtR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 Oct 2023 20:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234199AbjJHAtQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 7 Oct 2023 20:49:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33EF7106;
        Sat,  7 Oct 2023 17:49:10 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5BDC433C9;
        Sun,  8 Oct 2023 00:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696726150;
        bh=UQPRDrfwJ0KuUOkzBw6SGSpxmstJEwVtWrhASvLDi/s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ljbeU3QGeLn0/5Dhk89sqgkm9RZgDOf0sK8YSV4WkeurCWQX7FIcNn2t2w7ON4IGU
         VTdJZ4z/Y3pBIdrMp3lSasaZsuoCHDAmesMNiidPJ6l1Q27jCtC+Cj0bpoNYRfRnZl
         EOKx4RuR8j7JW5d6secAL2uBvohRJjbsSQ1EwDN8rkemewNSjnvOW/7hE/W2ZimqHN
         sXm2Ss0b3mFd4Gh9gz6L3/CkR1pqpKq7q/Qv+2pt8KWx8sEUtN//vmc/ocv71/u1Zl
         pSz9zjDgPmqbahFsyJ6Ya1sfPtLl5nrr+uMjD9i7z6XMHef+/6OwdpJSZCqwkx1Hdh
         lVYuGOm1C2bzw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 09/18] i2c: mux: Avoid potential false error message in i2c_mux_add_adapter
Date:   Sat,  7 Oct 2023 20:48:43 -0400
Message-Id: <20231008004853.3767621-9-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008004853.3767621-1-sashal@kernel.org>
References: <20231008004853.3767621-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.6
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Heiner Kallweit <hkallweit1@gmail.com>

[ Upstream commit b13e59e74ff71a1004e0508107e91e9a84fd7388 ]

I2C_CLASS_DEPRECATED is a flag and not an actual class.
There's nothing speaking against both, parent and child, having
I2C_CLASS_DEPRECATED set. Therefore exclude it from the check.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Acked-by: Peter Rosin <peda@axentia.se>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/i2c-mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 313904be5f3bd..57ff09f18c371 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -341,7 +341,7 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 		priv->adap.lock_ops = &i2c_parent_lock_ops;
 
 	/* Sanity check on class */
-	if (i2c_mux_parent_classes(parent) & class)
+	if (i2c_mux_parent_classes(parent) & class & ~I2C_CLASS_DEPRECATED)
 		dev_err(&parent->dev,
 			"Segment %d behind mux can't share classes with ancestors\n",
 			chan_id);
-- 
2.40.1

