Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8EA58FBE8
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 14:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234179AbiHKMIb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 08:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235175AbiHKMIT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 08:08:19 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E891956B6
        for <linux-i2c@vger.kernel.org>; Thu, 11 Aug 2022 05:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=/jg+6T0SBgZed6OhPHcOdq6Q2Og
        GZjyVBit9kHCdzIE=; b=QmAnAsA1/cBcVJ9MdaQSHMHUageA2F0MgzVEWpGa66E
        uhRjmhNp49ubmtHdrpclq1RCPTiYw3NE7EnD1woLCQsmpDRF5IY3XO0D2D5LgyvC
        u8wYliL1LpTj6k23jU+vjfzG2+oXtxr9IpJBS6MrIStVOsMm24BVf+8SID8ZtjwI
        =
Received: (qmail 1049568 invoked from network); 11 Aug 2022 14:08:12 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2022 14:08:12 +0200
X-UD-Smtp-Session: l3s3148p1@MLv7BPblUawucrTN
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: move core from strlcpy to strscpy
Date:   Thu, 11 Aug 2022 14:08:08 +0200
Message-Id: <20220811120808.4256-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Follow the advice of the below link and prefer 'strscpy'. Conversion is
easy because no code used the return value. It has been done with a
simple sed invocation.

Link: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 2 +-
 drivers/i2c/i2c-smbus.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 10f35f942066..91007558bcb2 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -933,7 +933,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 		client->init_irq = i2c_dev_irq_from_resources(info->resources,
 							 info->num_resources);
 
-	strlcpy(client->name, info->type, sizeof(client->name));
+	strscpy(client->name, info->type, sizeof(client->name));
 
 	status = i2c_check_addr_validity(client->addr, client->flags);
 	if (status) {
diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 775332945ad0..8ba9b59a3c40 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -391,7 +391,7 @@ void i2c_register_spd(struct i2c_adapter *adap)
 		unsigned short addr_list[2];
 
 		memset(&info, 0, sizeof(struct i2c_board_info));
-		strlcpy(info.type, name, I2C_NAME_SIZE);
+		strscpy(info.type, name, I2C_NAME_SIZE);
 		addr_list[0] = 0x50 + n;
 		addr_list[1] = I2C_CLIENT_END;
 
-- 
2.35.1

