Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEC616B6759
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Mar 2023 15:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbjCLO40 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 10:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjCLO4X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 10:56:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F84148E07;
        Sun, 12 Mar 2023 07:56:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EE94460F51;
        Sun, 12 Mar 2023 14:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0694AC433EF;
        Sun, 12 Mar 2023 14:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678632981;
        bh=wgu+IozaOTOe7y4MByQPBw6wOnEqP6STQSs//ZM1rZA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n7zOYxnquvIRwVU3Pg9SA1ylBU93E73LafFKYVn9AHKRxamZhaV+zEB6K7nAAlmAP
         C3sRaR5M6/mz1zNBHFM0qVF+XFF7XCB/CzvPLGnaVwc1okEZyAxEgsImznD8cePOsv
         vxPlsMRH0kDT1IICy/ZEqEIf1bqMZnDVseVQQqTgPStpPSZbhCE1gb7fCVtE95PzlQ
         bE3/EDqPu3rT1LXifBLX7TrkQImD1XmPl9hfaZa2O4f0Lq8PfnQLZXEI/Yb4hVvfft
         oN3mka2PbqYcLYxyxBXG9s7EHYdvLl3E4gxL3ZdVkWRZ/amFh8kMM95T9tE0Z39c46
         jaJ9kvVdan0xw==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2 2/2] i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c property
Date:   Sun, 12 Mar 2023 15:55:46 +0100
Message-Id: <20230312145546.262492-3-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312145546.262492-1-andi.shyti@kernel.org>
References: <20230312145546.262492-1-andi.shyti@kernel.org>
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
---
 drivers/i2c/busses/i2c-mpc.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 81ac92bb4f6f..fe6279a353c6 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -846,7 +846,16 @@ static int fsl_i2c_probe(struct platform_device *op)
 			mpc_i2c_setup_8xxx(op->dev.of_node, i2c, clock);
 	}
 
-	prop = of_get_property(op->dev.of_node, "fsl,timeout", &plen);
+	prop = of_get_property(op->dev.of_node,
+			       "i2c-scl-clk-low-timeout-ms", &plen);
+
+	/*
+	 * ensuring back compatibility as
+	 * "fsl,timeout" is marked as deprecated
+	 */
+	if (!prop)
+		prop = of_get_property(op->dev.of_node, "fsl,timeout", &plen);
+
 	if (prop && plen == sizeof(u32)) {
 		mpc_ops.timeout = *prop * HZ / 1000000;
 		if (mpc_ops.timeout < 5)
-- 
2.39.2

