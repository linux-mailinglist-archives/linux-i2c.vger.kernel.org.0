Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACC2F4CB8F4
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 09:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbiCCIct (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 03:32:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbiCCIcs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 03:32:48 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0578A172885;
        Thu,  3 Mar 2022 00:32:03 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id c16-20020a17090aa61000b001befad2bfaaso3730400pjq.1;
        Thu, 03 Mar 2022 00:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1s01zZHFACuhxfR/67Ujv9UUKWNEX0HdJ3GBxp+74ek=;
        b=h9EnuvlRu+k08wZ1xmmTF7IwWtV1tRvstde2NDAaEbS56B9/cC/dSXvnvUBF6aRql9
         qvZiDBiUnKnw4I3xtb+d6T/2oQrSGzXP2q9ZSoU5PoJAsK4qVaGWN2onX7xTFzGqXUVR
         +uOAJ44Op79v5MUpssAOvimujokoJvGT3cdnrOOpnoxwDmle3LZvzEnT5dpVtKxZrRu+
         70OIkS+GazTu4nwfZYN4GUyQyukAi6edfEOCxkkndauTLiv7FmPBq+37rvepySBCqkom
         LuijPPb3oQz9FWMUAcaCfQfNqIKQ5KKdaaCno0Dd074Sed3PJoJXfh3jh28LH+EzyU+8
         2NFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1s01zZHFACuhxfR/67Ujv9UUKWNEX0HdJ3GBxp+74ek=;
        b=n0Lrn7tI9aF4L+zPD9F6I0i0mKN0C5YeRXca9uGAM1PUYjWGAGugKr1HHflAYbz97k
         Cyq3FNmU0B6bmZxdDZkbWBIDBiCmal20Yl2aYpSmQOVQgTMm4z61dkXDc++sxhgVrUk4
         TmVlaL5qHXc7WKS0mfBiNGnbSeNQwY9M91ANQKUKPEMx95rPtiKYt28OqqI094t849Lm
         rcm8KMHelY0hHLDnBuX9MdsQvAMRDjzz3gsjbFWxpkdIfSyjgnrx8MfVHE/12dyg93i8
         DOCCHQQ/Ohyjt1g0O0gJYIIrhYNyeNxRld4/eKlcpXQ2f675P2ZocnDUZa8xIzzVqYn4
         8/Ew==
X-Gm-Message-State: AOAM531e6n+nFtJGWE5HhP0p63LFjxm8ZIrH7u5yvfRbRavoGKmpOLXh
        z3rKApzC+jdRAPC+q92mrQ==
X-Google-Smtp-Source: ABdhPJzu1aZd+ZXqRi3c3bMSPY4hVoGU7gtwGYWJfi/4yzvj++fhZP6zPrDm68RRtnvJ/7UlG0piNQ==
X-Received: by 2002:a17:902:b210:b0:14f:d0ff:46bb with SMTP id t16-20020a170902b21000b0014fd0ff46bbmr34893256plr.47.1646296322428;
        Thu, 03 Mar 2022 00:32:02 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
        by smtp.gmail.com with ESMTPSA id d5-20020a17090acd0500b001b9c05b075dsm7348851pju.44.2022.03.03.00.32.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 00:32:02 -0800 (PST)
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
Subject: [PATCH v3 06/11] i2c: npcm: Fix timeout calculation
Date:   Thu,  3 Mar 2022 16:31:36 +0800
Message-Id: <20220303083141.8742-7-warp5tw@gmail.com>
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
index c41de3afcf38..3fd30c38b3bf 100644
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

