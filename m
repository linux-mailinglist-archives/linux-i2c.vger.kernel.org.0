Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9E47BCB80
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Oct 2023 03:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234329AbjJHBRs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 Oct 2023 21:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344378AbjJHBRd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 7 Oct 2023 21:17:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77A552D41;
        Sat,  7 Oct 2023 17:51:14 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1905C4163C;
        Sun,  8 Oct 2023 00:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696726259;
        bh=TxI7l2S2BRxrv3nR22d+QN6K+W8sIY5zyOuUww3lMhU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IA297/9vjJ7jTGZDq64rKdirzFCi24n2a7PtxPzq/U5YSSlB5L4fpufWwGtNcK640
         NMclMVdFoULYCpdWrBadeW4USepnjy8oCKoJzC7deCSqlM1Ll3PDJEloSs/6QO3YbB
         b6GbRg3CQU419csnHHCBtdGIbEoTUHqf95StA7hvZNwY7tFZYsHIqWia3MuHCbWZcc
         zLS98GWPT7YJCFASdX65ackqIQ6wqPDg2/CY0k9fFb8xJQQffgOUzaN72FQ+185Wrz
         eZpCxna075OJh/uUzJai+cXaj2FbFuWKE1IuUrj2urgDgQHl8x/mvnJ2zoIrbb/4th
         ZYCwNP5vcidFw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 3/7] i2c: mux: Avoid potential false error message in i2c_mux_add_adapter
Date:   Sat,  7 Oct 2023 20:50:49 -0400
Message-Id: <20231008005053.3768625-3-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008005053.3768625-1-sashal@kernel.org>
References: <20231008005053.3768625-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.14.326
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
index 7ba31f6bf1488..ad5fd357b2bce 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -334,7 +334,7 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 		priv->adap.lock_ops = &i2c_parent_lock_ops;
 
 	/* Sanity check on class */
-	if (i2c_mux_parent_classes(parent) & class)
+	if (i2c_mux_parent_classes(parent) & class & ~I2C_CLASS_DEPRECATED)
 		dev_err(&parent->dev,
 			"Segment %d behind mux can't share classes with ancestors\n",
 			chan_id);
-- 
2.40.1

