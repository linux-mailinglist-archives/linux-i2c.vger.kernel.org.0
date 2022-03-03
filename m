Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF6F24CB8FD
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 09:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbiCCIcx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 03:32:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231451AbiCCIcu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 03:32:50 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89DD5172889;
        Thu,  3 Mar 2022 00:32:05 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id z15so4152492pfe.7;
        Thu, 03 Mar 2022 00:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qR3k7tR7j/5S7kicq9024I41lOgKh8ZbJEsbrDlOUpc=;
        b=c98mF/VvcIKJ4ZkueVOL/DOQ8xsIvjH+GALr1n3psM9il/GzMYEKvoKwbq/+nLSToG
         qN65D5ikBc9Q2ZQUsVOAlQMw0A/kjvrQJAU15vWqr66JYOptvG4fGErDzCNvBOO62BaY
         Rc/4jl/alYAWiSXVbQQvOh6ZV3d9Dl5yxogCTFReuha6bEIdT/Xtyddz6L8mwL+D9p7i
         ls8Qek37dK2+/jSeF7Zkk6gbN8CVP4SaLjN8KlNxSTIflox3Rv86cViqAvN9Q8I3w0cD
         KAalSgjFKzM7fSY9Heh/2NdYIlN24E4nJb4pAm+X22nukzi91EhfUljKvc/bhSQgIhRt
         zSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qR3k7tR7j/5S7kicq9024I41lOgKh8ZbJEsbrDlOUpc=;
        b=lXg0tYN0Awc/4Dbx7d0l73T0bhaJQjyQLxdG4vpRA32MUbTEFFuqQE7sz8IRtA6FmT
         1WaV977TQpPCrVkn8yyXAnAjXn5LtznPueWdEkSpRK/9JjfzMv2lYYxlzoizVEESRI5U
         LvGKYhkkXspDf7QvkqS2pmB8QP7rMjvs3HbVgt6pWdz8A+zwnhFt9RopnDYEGLOfe3/+
         bBNIkio3Gn3VaW8LCbV92B5mF2fPQ8MBKGXT6OstuKFoWxbv4SdBIZtEntZiu9K6aluh
         STjU6Y6+QGymZtXCl9g1S4I41iR8+ekPOEYq05Vmyf4oJW/imNB7oFLOl9ziru+wX18w
         wpIw==
X-Gm-Message-State: AOAM5312i9gHI+8+Ou4m9YF1eXqWH528s256QJk8W6ZdjeqrwBj60gmF
        wAAaG9dTDAGcCvhCDyPW3Q==
X-Google-Smtp-Source: ABdhPJyekVB8f/Lh31XYkdJZut/jLW5LPwfmaUGnArpYhYDTba9LNre+0K88OWQ6Q0MGKmMPF+9MmA==
X-Received: by 2002:a65:4687:0:b0:373:a276:767 with SMTP id h7-20020a654687000000b00373a2760767mr29267201pgr.409.1646296324954;
        Thu, 03 Mar 2022 00:32:04 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
        by smtp.gmail.com with ESMTPSA id r12-20020a63a54c000000b00376047bf784sm1383972pgu.23.2022.03.03.00.32.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 00:32:04 -0800 (PST)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, andriy.shevchenko@linux.intel.com,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/11] i2c: npcm: Add tx complete counter
Date:   Thu,  3 Mar 2022 16:31:37 +0800
Message-Id: <20220303083141.8742-8-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083141.8742-1-warp5tw@gmail.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
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
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 3fd30c38b3bf..237da0ef32ca 100644
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

