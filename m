Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 111A169B556
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 23:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbjBQWNt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 17:13:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjBQWNt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 17:13:49 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D7F5970E
        for <linux-i2c@vger.kernel.org>; Fri, 17 Feb 2023 14:13:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 03C5A61F16
        for <linux-i2c@vger.kernel.org>; Fri, 17 Feb 2023 22:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5361C433EF;
        Fri, 17 Feb 2023 22:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676672020;
        bh=iBk/gEHqXjtuP6teN5kIXqYfRYKCRNHvs7BOCpBSqWw=;
        h=From:To:Cc:Subject:Date:From;
        b=RJQx2n1YEAm/ujq34S/xMhPrLV8RQtyX6BaHrNFI0ZTD+my0WskXfl6qGJ27UmSLp
         U2Kfg1gTS7xPH+ddbzoqR0s/ePcdCuhdJa1WKbJEmdIVKVZ5So7MJjuwR/Own9Mb6+
         QJlKEX+XNmrBh7BEzvKW8FbkNBi1WMp2WwdhVsjJkyqrc3S4IJW9FLorELjJLIicGW
         melFbpO/uwEihRr9wDYMPanNH537lDBtuR1Gs4K3PkKdmvuCA3HX134o/abqaLeoC+
         nlmZCClBOrZs3aJt06kK0C1DGE7jbRKYrV6bUr6l9tFZuy0iFeRE5rbqiWxtU3N3wQ
         prZj0lC+/nNbw==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     nick.hawkins@hpe.com, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] i2c: gxp: remove "empty" switch statement
Date:   Fri, 17 Feb 2023 23:13:30 +0100
Message-Id: <20230217221330.27000-1-wsa@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There used to be error messages which had to go. Now, it only consists
of 'break's, so it can go.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 drivers/i2c/busses/i2c-gxp.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gxp.c b/drivers/i2c/busses/i2c-gxp.c
index da4c8e5a8039..352dedf6292f 100644
--- a/drivers/i2c/busses/i2c-gxp.c
+++ b/drivers/i2c/busses/i2c-gxp.c
@@ -126,19 +126,8 @@ static int gxp_i2c_master_xfer(struct i2c_adapter *adapter,
 	time_left = wait_for_completion_timeout(&drvdata->completion,
 						adapter->timeout);
 	ret = num - drvdata->msgs_remaining;
-	if (time_left == 0) {
-		switch (drvdata->state) {
-		case GXP_I2C_WDATA_PHASE:
-			break;
-		case GXP_I2C_RDATA_PHASE:
-			break;
-		case GXP_I2C_ADDR_PHASE:
-			break;
-		default:
-			break;
-		}
+	if (time_left == 0)
 		return -ETIMEDOUT;
-	}
 
 	if (drvdata->state == GXP_I2C_ADDR_NACK ||
 	    drvdata->state == GXP_I2C_DATA_NACK)
-- 
2.35.1

