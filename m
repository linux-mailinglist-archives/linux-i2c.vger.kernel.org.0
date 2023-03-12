Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED1C16B6C99
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 00:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbjCLXg7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 19:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbjCLXgz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 19:36:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC663B0D4;
        Sun, 12 Mar 2023 16:36:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 14C89B80DC8;
        Sun, 12 Mar 2023 23:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41303C4339B;
        Sun, 12 Mar 2023 23:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678664209;
        bh=wfuc6Igk++l7xu4oCP46B+qUAYlG7dpvbl5q/Q6k7cM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ldWOxo6n5bPUwNKnDwJsuZaa/BXi1lBKwJBXWPOwzXhaDDjrwl9gvM6jSgXZJm/1C
         RYyuFjPNkBMKkEgBjRp36QFHIx5lewKSE63DDtESkWG/J60CAwvzPbaXRV+eBE3opr
         ceq6Gci51OUPia2VLZDmrRDu3iUq0tqAZmuMCFfXgFBwYamE5nzr99uPzWOpdQKDHQ
         oQ19//bhUr9+jo/IWK/VpgWCxAHRJ8Wl7SLuX6UK/P2dWGnOpf+sFfh8vQvULWUCC9
         /MubxQpbAgsBsqXrxGMizTSmsytFnZzmZ7sCeQUyPgwSk9k10QzbFtpPKAWlMtPA/g
         DdqMV7H6ZJGow==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v3 3/3] i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c property
Date:   Mon, 13 Mar 2023 00:36:13 +0100
Message-Id: <20230312233613.303408-4-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312233613.303408-1-andi.shyti@kernel.org>
References: <20230312233613.303408-1-andi.shyti@kernel.org>
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

"fsl,timeout" is marked as deprecated and replaced by the
"i2c-scl-clk-low-timeout-ms" i2c property.

Use this latter and, in case it is missing, for back
compatibility, check whether we still have "fsl,timeout" defined.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-mpc.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 87e5c1725750..28f11e30ac50 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -843,8 +843,18 @@ static int fsl_i2c_probe(struct platform_device *op)
 			mpc_i2c_setup_8xxx(op->dev.of_node, i2c, clock);
 	}
 
+	/*
+	 * "fsl,timeout" has been marked as deprecated and, to maintain
+	 * backward compatibility, we will only look for it if
+	 * "i2c-scl-clk-low-timeout-ms" is not present.
+	 */
 	result = of_property_read_u32(op->dev.of_node,
-				      "fsl,timeout", &mpc_ops.timeout);
+				      "i2c-scl-clk-low-timeout-ms",
+				      &mpc_ops.timeout);
+	if (result == -EINVAL)
+		result = of_property_read_u32(op->dev.of_node,
+					      "fsl,timeout", &mpc_ops.timeout);
+
 	if (!result) {
 		mpc_ops.timeout *= HZ / 1000000;
 		if (mpc_ops.timeout < 5)
-- 
2.39.2

