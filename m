Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26E29529F03
	for <lists+linux-i2c@lfdr.de>; Tue, 17 May 2022 12:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343775AbiEQKNA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 May 2022 06:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343782AbiEQKMp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 May 2022 06:12:45 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5894F1CB1B;
        Tue, 17 May 2022 03:12:04 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id q7so5497232plx.3;
        Tue, 17 May 2022 03:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=U1ZOSVbfziWWzBVab8oIymA4zFffiNgJBszalmSIU3k=;
        b=akU7xpusbKsA9jTmK+AAyLyo3rt7dAfD4QOXvkQKPbsihQBY5zGhMZ77fsPR0iyYP7
         6/4OvwldWiQMbhtwJAG32VI5vOlsoUSB4g5cWOuAL8OBAqWbEjNIH40ScuxOFjNTX6CU
         vQU8KAuxOuUoo3TsPQmU57J6Fdb1rGZ4TIa8W+l/8Aq8yWCu3FXcYWrIjpwaAh59Gytm
         EEfvCFYQ74mOupaWH0bsBWliZJCU4NqxwhvJ+sw7jI5Lts4ji6fUTn9gDhVXnQiHYbWM
         7V1WFejCLCVSIf70vJZbmnO1ozfHreF4+5JDU8m9wtryATaFVf7viwUkgukCDLnbhUBE
         X15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=U1ZOSVbfziWWzBVab8oIymA4zFffiNgJBszalmSIU3k=;
        b=LSazOE84waKCzPYywts24sJnCez2ZicrrdCBKkLjDr4cuh9+VcOX+YV5ov/Omzg7F8
         veIzIqNJ+0RMdTOUi6jjJ6SZddrPU7P4LcWTpJ3FKPEY8IJTd6d1LBYWFBoiMQQKTJEy
         mhxvkvz+o5pdxAFSNuli18ZFGMNwq5jORiXn5ms0kQgcRasGdpGLbbmlm16UAHJRPwWw
         Jh+FhN9X3c/2thKFciy4ob/oeIFM9rRsIUfsNaeGmHaUvctZolLEe0BINON/X3KhdDqP
         wRuqiE57V+YTkW430SPHk0JG/PaaXjFFjtZ6jmnbT5Yr0uw5no8l3S2aBqSRYeHcROLR
         jLAg==
X-Gm-Message-State: AOAM533fEFRPq8dGJ0If5RJRTLBLJgLpbnSt2mD5+LytmvOrQrcVbLyx
        6jOZzPYUqgLv47W4YdrB9g==
X-Google-Smtp-Source: ABdhPJyAXOqyldvFMK3vjOTZD00Ehx7QEsZQs96nfoiU0wOGfteyQdSkh+t/73y31GLrpaARikiIig==
X-Received: by 2002:a17:90a:8807:b0:1df:78c7:c215 with SMTP id s7-20020a17090a880700b001df78c7c215mr5295386pjn.234.1652782323316;
        Tue, 17 May 2022 03:12:03 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net. [220.133.130.217])
        by smtp.gmail.com with ESMTPSA id b12-20020a17090a5a0c00b001ded49491basm1909954pjd.2.2022.05.17.03.12.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 May 2022 03:12:03 -0700 (PDT)
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
Subject: [PATCH v5 04/10] i2c: npcm: Fix timeout calculation
Date:   Tue, 17 May 2022 18:11:36 +0800
Message-Id: <20220517101142.28421-5-warp5tw@gmail.com>
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

Use adap.timeout for timeout calculation instead of hard-coded
value of 35ms.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 550e4a4d1e01..489b4c8ad0ee 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2047,7 +2047,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	u16 nwrite, nread;
 	u8 *write_data, *read_data;
 	u8 slave_addr;
-	int timeout;
+	unsigned long timeout;
 	int ret = 0;
 	bool read_block = false;
 	bool read_PEC = false;
@@ -2099,13 +2099,13 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	 * 9: bits per transaction (including the ack/nack)
 	 */
 	timeout_usec = (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + nwrite);
-	timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
+	timeout = max_t(unsigned long, bus->adap.timeout, usecs_to_jiffies(timeout_usec));
 	if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
 		dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
 		return -EINVAL;
 	}
 
-	time_left = jiffies + msecs_to_jiffies(DEFAULT_STALL_COUNT) + 1;
+	time_left = jiffies + timeout + 1;
 	do {
 		/*
 		 * we must clear slave address immediately when the bus is not
@@ -2268,7 +2268,7 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 	adap = &bus->adap;
 	adap->owner = THIS_MODULE;
 	adap->retries = 3;
-	adap->timeout = HZ;
+	adap->timeout = msecs_to_jiffies(35);
 	adap->algo = &npcm_i2c_algo;
 	adap->quirks = &npcm_i2c_quirks;
 	adap->algo_data = bus;
-- 
2.17.1

