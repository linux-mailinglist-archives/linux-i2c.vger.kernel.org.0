Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F648529EFD
	for <lists+linux-i2c@lfdr.de>; Tue, 17 May 2022 12:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343579AbiEQKNE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 May 2022 06:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343793AbiEQKMp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 May 2022 06:12:45 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F7371CFC2;
        Tue, 17 May 2022 03:12:05 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id z7-20020a17090abd8700b001df78c7c209so1984238pjr.1;
        Tue, 17 May 2022 03:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=krLNxO0S/d+QCIpYPvVWVYi5XGTs+BtKLzm4JTRH6tI=;
        b=Wej2EPVtv+g3E5YqfceFbhSCpcOw88Cw6q41HmZNLtWCJJCj8A0mueeN2H9mG2J5GV
         oJ9tSPE2546gKfKptsCpkvicpPJiKqSzEEWKU7SuKQ3MD9hc+2UAPplRSpss12N4J+h6
         IxAIeVUWuNbD4efUsRmAbAt7TkRwvoCVlrYzGy402m02J5a6HUdgCpK9wzMqjyrRX/9Q
         kt5ojaQ46PU5J8fB4Xg2g5qpaHZ8xTGCscmCGkMr3XnMfLnBFp6SGOqMtbqXaJF2H1R5
         qPReM/WUz8VWNXQn/ffxwIXj6i3JBi5dvlB9whRI+MvLB50BKT/ipesqLA+qhZ5ge+M0
         LEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=krLNxO0S/d+QCIpYPvVWVYi5XGTs+BtKLzm4JTRH6tI=;
        b=JeXdkbvlCqrUp/cNnarDbNJ445GNL5Ujz8H3TwLWIhOaHHKY5EWoRgbCGIFvGLVTKo
         6dcd+VkSx/HTOiu7+xJdF+oas8fREDBLYJn1QZk23lF1kvmNNEYBjDpH5Rz3L5YUt/HP
         Serhx4gkgOH5e/TT61B8KbUeo03mUoOCxBFuo3GrPl5/Z27YmESIiDEizmftnMmjFueo
         o2uV6nYnfwJJsKE+C8tQNlh6VVMQx3Q5W3eZxRNYsscjuw3jDNs0lsnLWq03lmIiE0Yf
         2f0wBHZn+HS6n2ugNSj2gXhmsszA+opjLvzL9L8lCRJET2kDzwZoRv7TfzhvHmuYY+20
         YUjQ==
X-Gm-Message-State: AOAM530osQo45TMpZMyirUO4PSsZ427c4rKacqv/h5NlPfGv+5ZhGVs+
        21N3VHnxPETlxt/YsYYnrg==
X-Google-Smtp-Source: ABdhPJwX9+NKY+Vc1jqGFR3i9lcYLVNsUS92nD/cAkPrWGRBDbEQmHTp1Pfr+6u4Ge/WtKQEesW/6A==
X-Received: by 2002:a17:902:bb94:b0:161:60b3:3300 with SMTP id m20-20020a170902bb9400b0016160b33300mr12971537pls.97.1652782324968;
        Tue, 17 May 2022 03:12:04 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net. [220.133.130.217])
        by smtp.gmail.com with ESMTPSA id e17-20020a62ee11000000b0050dc76281b8sm8664208pfi.146.2022.05.17.03.12.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 May 2022 03:12:04 -0700 (PDT)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org,
        rafal@milecki.pl, sven@svenpeter.dev, jsd@semihalf.com,
        jie.deng@intel.com, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, warp5tw@gmail.com, tali.perry@nuvoton.com,
        Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 05/10] i2c: npcm: Add tx complete counter
Date:   Tue, 17 May 2022 18:11:37 +0800
Message-Id: <20220517101142.28421-6-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220517101142.28421-1-warp5tw@gmail.com>
References: <20220517101142.28421-1-warp5tw@gmail.com>
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
index 489b4c8ad0ee..36f8aa7ab106 100644
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

