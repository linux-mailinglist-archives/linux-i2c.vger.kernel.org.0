Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 115A85EE66F
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Sep 2022 22:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbiI1UNF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Sep 2022 16:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234021AbiI1UM5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Sep 2022 16:12:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FDDAD98A
        for <linux-i2c@vger.kernel.org>; Wed, 28 Sep 2022 13:12:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E7D4FB8214E
        for <linux-i2c@vger.kernel.org>; Wed, 28 Sep 2022 20:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2782C433D7;
        Wed, 28 Sep 2022 20:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664395954;
        bh=lO3iUonYh2GTJwLPcdv3nutfpm0LdDVsNkTwi19XDUo=;
        h=From:To:Cc:Subject:Date:From;
        b=Kh3dAF+MSm9pcyDMHuEfdePXt/j7JG2k0gqtG1QsZ81QWeJuZ6PLDmPXXfjwGO76X
         UfCN2QdMop5eBWuKvX0WiR2lj16JKZJdf5R0SuGeTIvq7RQUzMe6xKpR6Lf9tALxhJ
         Mzj+BlvopbKX9mA6S4r8uFo7IRsCVgfUTIg3Ij+O7SCV3BDLjfxqUL8IdG+TQVAuRN
         lTXpj8BZahECLnlRx8MNMZnQiRUwV01S5aakzfJ3t1Dtkg/Te4E7i1+TC0p+QjR+Gj
         cBTSF+bxF4O9Xhr5/zTvFifvoozMS2f1/qfcrLY31/5e4g6y+7Fk45vIP6QBGb5AeG
         fYiCWSQUrfgaw==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] i2c: pci1xxxx: prevent signed integer overflow
Date:   Wed, 28 Sep 2022 22:12:14 +0200
Message-Id: <20220928201214.8544-1-wsa@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some constants need 'UL' markings, otherwise they are shifted into the
sign bit.

Fixes: 361693697249 ("i2c: microchip: pci1xxxx: Add driver for I2C host controller in multifunction endpoint of pci1xxxx switch")
Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
index b2b7dbff5ef4..f5342201eb6b 100644
--- a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
+++ b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
@@ -190,9 +190,9 @@
  * Bus Idle Minimum time = BUS_IDLE_MIN[7:0] x Baud_Clock_Period x
  * (BUS_IDLE_MIN_XK_TICKS[7] ? 4,1)
  */
-#define BUS_IDLE_MIN_100K_TICKS		167
-#define BUS_IDLE_MIN_400K_TICKS		139
-#define BUS_IDLE_MIN_1000K_TICKS		133
+#define BUS_IDLE_MIN_100K_TICKS		167UL
+#define BUS_IDLE_MIN_400K_TICKS		139UL
+#define BUS_IDLE_MIN_1000K_TICKS		133UL
 
 /*
  * CTRL_CUM_TIME_OUT_XK_TICKS defines SMBus Controller Cumulative Time-Out.
-- 
2.35.1

