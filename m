Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F132269CF92
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Feb 2023 15:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbjBTOlK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Feb 2023 09:41:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232174AbjBTOlG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Feb 2023 09:41:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D83B1F907
        for <linux-i2c@vger.kernel.org>; Mon, 20 Feb 2023 06:41:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1A57060EC6
        for <linux-i2c@vger.kernel.org>; Mon, 20 Feb 2023 14:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4DF5C433D2;
        Mon, 20 Feb 2023 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676904064;
        bh=Ujiqv8C0y2jCD87FvS7q7OoBY1EHRwGtkNz9wutpmTQ=;
        h=From:To:Cc:Subject:Date:From;
        b=itQVYLxPGKLHQR2V9XTOd1JzSr8IzkI88mt3LriAAPQcOJS117P7hH2ppMaIITSPI
         t2bQtdmxKbbdyDLiFVazwUYMb3TJ9OqTrOpKWCLiCpYtU94OF2CM2LBVhrohAd50Ul
         iO8fD9XOKGvrdkKslCwRVQ1QHotONKk+VXd3uDheY3nV3I2irRBwRHEjmsFD0k6mkE
         0NLmtrIhy2HMIy/9JzFbjsKyGxjb+Xq4K/vetYezMsgUSViuRfu1wVdyO10zpsN17v
         2WJjlrAZWUeBYFeewG0YPpcptdx3v6DZr1dIsgqUBvgkwQihnvHd/FQ1Tjuz55w37J
         UhcsPbwhQMERw==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     nick.hawkins@hpe.com, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] i2c: gxp: return proper error on address NACK
Date:   Mon, 20 Feb 2023 15:40:59 +0100
Message-Id: <20230220144059.77213-1-wsa@kernel.org>
X-Mailer: git-send-email 2.30.2
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

According to Documentation/i2c/fault-codes.rst, NACK after sending an
address should be -ENXIO.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---

Depends on: "[PATCH] i2c: gxp: remove "empty" switch statement"

 drivers/i2c/busses/i2c-gxp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gxp.c b/drivers/i2c/busses/i2c-gxp.c
index 352dedf6292f..fda7809e72ba 100644
--- a/drivers/i2c/busses/i2c-gxp.c
+++ b/drivers/i2c/busses/i2c-gxp.c
@@ -129,8 +129,10 @@ static int gxp_i2c_master_xfer(struct i2c_adapter *adapter,
 	if (time_left == 0)
 		return -ETIMEDOUT;
 
-	if (drvdata->state == GXP_I2C_ADDR_NACK ||
-	    drvdata->state == GXP_I2C_DATA_NACK)
+	if (drvdata->state == GXP_I2C_ADDR_NACK)
+		return -ENXIO;
+
+	if (drvdata->state == GXP_I2C_DATA_NACK)
 		return -EIO;
 
 	return ret;
-- 
2.30.2

