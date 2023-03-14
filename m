Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1C26BA1A9
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 22:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjCNV6Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 17:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbjCNV6N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 17:58:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F5924BD2;
        Tue, 14 Mar 2023 14:58:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5421861A0D;
        Tue, 14 Mar 2023 21:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2288DC43444;
        Tue, 14 Mar 2023 21:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678831089;
        bh=rzP1OfS87vsi0Hjf6WC+JjuWr6HX7jni765Ubv/Snwo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OECqL0OZS07uL3BzVRDTosxxVUJFVMcoNQdawBbYgTjyUz3PZt5zKoh041xF5/mco
         Fvh9F3Q7Yxnn1ttLQEqkgA+/T7WnzNlyFNhufKlQgw5P7AJ/XerITj2epTSu1IS14d
         7JRoyyPFPHWYMl63UQ6W5/CjiItGejF4dygaGmtdbjAChrS0pzmAs6HC25LcbZWVeo
         E4O89HvSyxUQoDOc+cQ9B03kO9Cm5eNg/04KnvxVTKfZBt4zlhXYhHxoq0REshG9Mh
         wt8NbpAmBoVqoWFw6PRBcVIn4kx5byLGdxFtLXYX6X5YucClIwd1ydf6FtTI+RqZDd
         +PTIdq3UKCWtw==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v4 3/3] i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c property
Date:   Tue, 14 Mar 2023 22:56:12 +0100
Message-Id: <20230314215612.23741-4-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314215612.23741-1-andi.shyti@kernel.org>
References: <20230314215612.23741-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

"fsl,timeout" is marked as deprecated and replaced by the
"i2c-scl-clk-low-timeout-us" i2c property.

Use this latter and, in case it is missing, for back
compatibility, check whether we still have "fsl,timeout" defined.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-mpc.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 87e5c1725750f..e8798f9c23fcc 100644
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
+				      "i2c-scl-clk-low-timeout-us",
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

