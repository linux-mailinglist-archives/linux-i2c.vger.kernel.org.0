Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD954AB54D
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 07:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237929AbiBGG4P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 01:56:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241714AbiBGGd4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 01:33:56 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3DAC043181;
        Sun,  6 Feb 2022 22:33:55 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id e6so11307986pfc.7;
        Sun, 06 Feb 2022 22:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=M8g46qJlsRdWiYs40YKErwbjRD+GvZUoxsx4dYRI7SY=;
        b=nuuiJ2jtZ2/imS93HSBXk9QGWXJQMIOQF2wGEiDUrb8UxkrweOj6a7n32gEiRJ5zaO
         puxgbRLNrBHIDGN5jGgUSE3qHcRpCjKkWQoxvzOLvhN+ZDYlQHNOOg0riw+C+TnnTWqT
         SHFlMKbMKfLiRnR/4K2us0gXrYDzDxowJ6fJyHhiBRJGzmNbzvCF5AiNl7fVQx++DHLy
         jtEKIfmOfUW1+A1su4TDvUT4fyczCXOiF7b8+tgfLWnTs6g/nL1+E2htNxPm+b+LMX2K
         jmgU468Ml9NHCkz3vsOV8YPW9vvGE2L8MzfMaiJIPWGA61WQ9y+g+4tbyIRzKv6Zwexo
         h6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=M8g46qJlsRdWiYs40YKErwbjRD+GvZUoxsx4dYRI7SY=;
        b=vF/18WG944WSRzWPMy+8xs3IvZ9IKhoK5DaoP4xem228VDaZUPKphOPMmZofeAUuN4
         Zd/T2gqpUYIlgyThxxyKse8YRmrEvs+XKwedfnI0S4WvhxbtJPtHIPkAhWR7MfPFv4Uz
         VYR2x+U2E5B/nz1ZZaA/Qhxiyr1B0XpH6Yzh60BT4t9iJiz2GQLN+gjccOlyLcNvjvQD
         F6bqkvQOy1vYuna9cnSzRbRu3deYVtWGWshx689YhrXq4naoBATPkgIwJtoJFY+2KiHq
         urtL+Q/pgJ3wST0NUE0k3Al/6j/8onKyOFoMfrDT7XDUoOWMjxGhzXe9pukEhrDT0AMa
         QEJQ==
X-Gm-Message-State: AOAM5308o2/WpaSKboKvYfOgV9O/5FojsCrD0hTbl4wpKvA1wHZS+lrC
        t6vBz7j2R/ToRVx3My7ONw==
X-Google-Smtp-Source: ABdhPJyFovo/KRxuiq9zjQNpksHG8TiAr6Vnn0Z1VF9Y8hw4MjzTkRRt+aY83SX+tgNpYJioziqr5Q==
X-Received: by 2002:a63:d952:: with SMTP id e18mr8329583pgj.290.1644215634685;
        Sun, 06 Feb 2022 22:33:54 -0800 (PST)
Received: from localhost ([2401:e180:8894:9737:7848:1ec7:b697:7d50])
        by smtp.gmail.com with ESMTPSA id b11sm10732314pfv.192.2022.02.06.22.33.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Feb 2022 22:33:54 -0800 (PST)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, andriy.shevchenko@linux.intel.com,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/6] i2c: npcm: Add tx complete counter
Date:   Mon,  7 Feb 2022 14:33:35 +0800
Message-Id: <20220207063338.6570-4-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220207063338.6570-1-warp5tw@gmail.com>
References: <20220207063338.6570-1-warp5tw@gmail.com>
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
index ddeee6f53621..5c22e69afe34 100644
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

