Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD9385965D2
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Aug 2022 01:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237662AbiHPXBR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 19:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237588AbiHPXBJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 19:01:09 -0400
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CA6AF89814
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 16:01:05 -0700 (PDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from asmaa@mellanox.com)
        with SMTP; 17 Aug 2022 01:54:25 +0300
Received: from bu-vnc02.mtbu.labs.mlnx (bu-vnc02.mtbu.labs.mlnx [10.15.2.65])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 27GMsOis022545;
        Tue, 16 Aug 2022 18:54:24 -0400
Received: (from asmaa@localhost)
        by bu-vnc02.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 27GMsOY2009252;
        Tue, 16 Aug 2022 18:54:24 -0400
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: [PATCH v1 5/7] i2c-mlxbf: prevent stack overflow in mlxbf_i2c_smbus_start_transaction()
Date:   Tue, 16 Aug 2022 18:54:10 -0400
Message-Id: <20220816225412.9095-6-asmaa@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20220816225412.9095-1-asmaa@nvidia.com>
References: <20220816225412.9095-1-asmaa@nvidia.com>
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

memcpy() is called in a loop while 'operation->length' upper bound is
not checked and 'data_idx' also increments.

Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 02ed6983c35c..c6959ba7113e 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -724,6 +724,9 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 		if (flags & MLXBF_I2C_F_WRITE) {
 			write_en = 1;
 			write_len += operation->length;
+			if (data_idx + operation->length >
+					MLXBF_I2C_MASTER_DATA_DESC_SIZE)
+				return -ENOBUFS;
 			memcpy(data_desc + data_idx,
 			       operation->buffer, operation->length);
 			data_idx += operation->length;
-- 
2.30.1

