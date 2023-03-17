Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4006BF65F
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Mar 2023 00:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbjCQXeL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Mar 2023 19:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbjCQXeF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Mar 2023 19:34:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9D05D882;
        Fri, 17 Mar 2023 16:34:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2532D60CD4;
        Fri, 17 Mar 2023 23:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C2AC433D2;
        Fri, 17 Mar 2023 23:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679096042;
        bh=MMgl7BH2vYNW64S6J+FPvpa5ZVx8951MJKLTeJvEY9s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hsRIucMcR17ozhb79cSGP8g6KI3zAA6XTphrCEwSwbyUS2QI1mbTkkCoo88ejyjpz
         We7W+oyltMWv3HgymN+ocAQuUtLyNHfyWHpwkGkKGDnaVDxkhSVJ2W+waeDUiiXrTL
         qQE7RJ3I+H1kfsg3Z3KuVX0/PZM2FsDSimVamCHsL0LiIItM7wSuLndc2cTAKOYgRd
         /DkXc4QsmTOJYNsiEPrQIQfY3e2vvTsLINV+nYrDH725ZXHJ/3SGSXAF1M2u5f82ZY
         AWXIKfTcqxF/tN2xFdbIzc+RZz2TCYOoUXzefJZfJ0HXUgPdHVkNm/pMz1FC3UE0Uh
         FUe21nobSeAlg==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v5 3/3] i2c: mpc: Use i2c-scl-clk-low-timeout-us i2c property
Date:   Sat, 18 Mar 2023 00:33:38 +0100
Message-Id: <20230317233338.424864-4-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317233338.424864-1-andi.shyti@kernel.org>
References: <20230317233338.424864-1-andi.shyti@kernel.org>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/busses/i2c-mpc.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 02baba2284e27..cfd074ee6d547 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -843,8 +843,18 @@ static int fsl_i2c_probe(struct platform_device *op)
 			mpc_i2c_setup_8xxx(op->dev.of_node, i2c, clock);
 	}
 
+	/*
+	 * "fsl,timeout" has been marked as deprecated and, to maintain
+	 * backward compatibility, we will only look for it if
+	 * "i2c-scl-clk-low-timeout-us" is not present.
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

