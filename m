Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6DF59C95F
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 21:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbiHVT5o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 15:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbiHVT5m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 15:57:42 -0400
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 84B504DB1D
        for <linux-i2c@vger.kernel.org>; Mon, 22 Aug 2022 12:57:39 -0700 (PDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from asmaa@mellanox.com)
        with SMTP; 22 Aug 2022 22:57:35 +0300
Received: from bu-vnc02.mtbu.labs.mlnx (bu-vnc02.mtbu.labs.mlnx [10.15.2.65])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 27MJvYVC027440;
        Mon, 22 Aug 2022 15:57:34 -0400
Received: (from asmaa@localhost)
        by bu-vnc02.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 27MJvYBB012758;
        Mon, 22 Aug 2022 15:57:34 -0400
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>
Subject: [PATCH v2 6/9] i2c-mlxbf.c: Update SPDX license
Date:   Mon, 22 Aug 2022 15:57:22 -0400
Message-Id: <20220822195725.12656-7-asmaa@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20220822195725.12656-1-asmaa@nvidia.com>
References: <20220822195725.12656-1-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Update the SPDX license to GPL-2.0 or BSD-3-Clause and
update the copyright to NVIDIA CORPORATION.

Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index b54019b4b01b..1982286b9b22 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -1,9 +1,5 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- *  Mellanox BlueField I2C bus driver
- *
- *  Copyright (C) 2020 Mellanox Technologies, Ltd.
- */
+// SPDX-License-Identifier: GPL-2.0 or BSD-3-Clause
+/*  Copyright (c) 2020 NVIDIA CORPORATION. All rights reserved. */
 
 #include <linux/acpi.h>
 #include <linux/bitfield.h>
@@ -2487,4 +2483,4 @@ module_exit(mlxbf_i2c_exit);
 
 MODULE_DESCRIPTION("Mellanox BlueField I2C bus driver");
 MODULE_AUTHOR("Khalil Blaiech <kblaiech@nvidia.com>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.30.1

