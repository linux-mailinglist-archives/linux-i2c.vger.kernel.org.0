Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 312DF521099
	for <lists+linux-i2c@lfdr.de>; Tue, 10 May 2022 11:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238629AbiEJJWS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 05:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238694AbiEJJWL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 05:22:11 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2932C253AB6;
        Tue, 10 May 2022 02:18:08 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id g8so14429653pfh.5;
        Tue, 10 May 2022 02:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VnQelYMKjVBHrVTpQi4LelIGs3/pDFcP4b0unjHuL9k=;
        b=YWlQ11nZJlHg2PEfUsZRnDdN2Y7O4SmXoTqZkSUDVYhlzs0tY55OW6zn6mKq2YXQOP
         miVOmqyFjSuTbqWMOVODy2QhlgyfpLpdEV0tRIDyDar9k+eKUs6vuGUuA2LUZp9yA9rS
         jiayj0M7qbRk3I8c34WAlhuv6enjD3jwYiGbARRZxpujoq759uxFpifXYysuDmbSUoMQ
         qSijrVPj0phm24w94vTf7gAsX0nBcYCoM52QCu0KQlmFr1mW2tnPejel+JYRBW3dsJoX
         3INKpH1/O7yy72AqJ1RRMJxGnQH2H14HSrVXIHVZlhIKd/LiyC0mYhZPxkqafLaFPhRG
         MU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VnQelYMKjVBHrVTpQi4LelIGs3/pDFcP4b0unjHuL9k=;
        b=uC122P14w93LrPgH7Z2lcVRzVuQVlx/KvcuTj60lB9Akz5NUEuI4Z2BwPOJ1zjyVTE
         SU4TBJuebotwEJpTaaMXp+4vm0rNxnV0cmXwpu4jB+619sKqCUc9oT/lR9n6TbJENv3H
         iHh1q26TVafCrjIL9cTh68705io4lhNvxyGk1Fi580vqzrvS6JONrGKY64Q2+oL8jebK
         PiauQH43Rm7ljGsL9qEk20lrIhmJOWkTdn8tHiNuL/BvOSYQisTTSLQfpMBZV9vKNjnm
         y8r157EZASrtpzPD1CKK5pYXzx3vZLbtkurjV0QVmhlbJ7SB0abGZn/FsrgX8tFWooQK
         DKhw==
X-Gm-Message-State: AOAM532OZUC/SmjY+dpqA+KlRNVajEFd2y7KMiJTseP+YOarQG9Lw5rN
        nSvLNuNwynuPcLUG3eaX/w==
X-Google-Smtp-Source: ABdhPJzLH7yfVzJK9FA+HiKIZOajcWkEVzxgG48lIMgSZKODiXP/rLrp5Advh5OGWdjV+5Fa+ykhuw==
X-Received: by 2002:a63:df0f:0:b0:3db:2d4:ded9 with SMTP id u15-20020a63df0f000000b003db02d4ded9mr579198pgg.267.1652174288073;
        Tue, 10 May 2022 02:18:08 -0700 (PDT)
Received: from localhost (2001-b011-7010-358e-c990-a8c9-85a7-1d3e.dynamic-ip6.hinet.net. [2001:b011:7010:358e:c990:a8c9:85a7:1d3e])
        by smtp.gmail.com with ESMTPSA id w6-20020a627b06000000b0050dc7628185sm10428968pfc.95.2022.05.10.02.17.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 May 2022 02:18:07 -0700 (PDT)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org,
        sven@svenpeter.dev, jie.deng@intel.com, jsd@semihalf.com,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/9] i2c: npcm: Add tx complete counter
Date:   Tue, 10 May 2022 17:16:50 +0800
Message-Id: <20220510091654.8498-6-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220510091654.8498-1-warp5tw@gmail.com>
References: <20220510091654.8498-1-warp5tw@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Tali Perry <tali.perry1@gmail.com>

tx_complete counter is used to indicate successful transaction
count.
Similar counters for failed tx were previously added.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index eaec051e080d..56af571f65c1 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -314,6 +314,7 @@ struct npcm_i2c {
 	u64 rec_fail_cnt;
 	u64 nack_cnt;
 	u64 timeout_cnt;
+	u64 tx_complete_cnt;
 };
 
 static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
@@ -684,6 +685,8 @@ static void npcm_i2c_callback(struct npcm_i2c *bus,
 	switch (op_status) {
 	case I2C_MASTER_DONE_IND:
 		bus->cmd_err = bus->msgs_num;
+		if (bus->tx_complete_cnt < ULLONG_MAX)
+			bus->tx_complete_cnt++;
 		fallthrough;
 	case I2C_BLOCK_BYTES_ERR_IND:
 		/* Master tx finished and all transmit bytes were sent */
@@ -2223,6 +2226,7 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
 	debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
 	debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
 	debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
+	debugfs_create_u64("tx_complete_cnt", 0444, d, &bus->tx_complete_cnt);
 
 	bus->debugfs = d;
 }
-- 
2.17.1

