Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1FA74B37B3
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Feb 2022 20:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbiBLTrI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 12 Feb 2022 14:47:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbiBLTrI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 12 Feb 2022 14:47:08 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA912606CE
        for <linux-i2c@vger.kernel.org>; Sat, 12 Feb 2022 11:47:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id EF03ACE0951
        for <linux-i2c@vger.kernel.org>; Sat, 12 Feb 2022 19:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928D2C340E7;
        Sat, 12 Feb 2022 19:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644695221;
        bh=rqa3tXC1BshU9o2rZr/c+nvEfBgPi1GTnyjkB9IhvOE=;
        h=From:To:Cc:Subject:Date:From;
        b=RnyVa3mdE/ObkX0LyC7ly8p1p0o9k1qbj3uEt5YApBnSZ3Kay34rKYSOvOrVeT5Js
         9lcoZkPkyyE0YGZaNqz7CQiJ/O46ym2wM/11pZs2uBPgDJYeAp/luoMglb1vBofOk4
         AZC4F2jvwkiZWUi4VluG9CtafpbtWgt/qehEjxXGctG0WJWHhPgctaYJEex7PWBmrk
         EMl0GSU6YR8Elnrwiw2mkngIwEdrkjNIQ5g8V9QpgeN0N9W0YpPyiqnbTEYiMdW+06
         jjQMeouPBAYiQ51eMuWlt7lhgMR4rZmScQquIDzzcU6f1QtbSVF9ATICAc7mp6tIMl
         eSQEhh/u1G7ZQ==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] i2c: imx: allow COMPILE_TEST
Date:   Sat, 12 Feb 2022 20:46:57 +0100
Message-Id: <20220212194657.11203-1-wsa@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Driver builds fine with COMPILE_TEST. Enable it for wider test coverage
and easier maintenance.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index bad2fadc94a3..255fd4198433 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -680,7 +680,7 @@ config I2C_IMG
 
 config I2C_IMX
 	tristate "IMX I2C interface"
-	depends on ARCH_MXC || ARCH_LAYERSCAPE || COLDFIRE
+	depends on ARCH_MXC || ARCH_LAYERSCAPE || COLDFIRE || COMPILE_TEST
 	select I2C_SLAVE
 	help
 	  Say Y here if you want to use the IIC bus controller on
-- 
2.30.2

