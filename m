Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2EE94BCC05
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Feb 2022 05:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243451AbiBTD5l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Feb 2022 22:57:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242489AbiBTD5f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Feb 2022 22:57:35 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90DDF51E50;
        Sat, 19 Feb 2022 19:57:14 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id v8-20020a17090a634800b001bb78857ccdso13508674pjs.1;
        Sat, 19 Feb 2022 19:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=z9lZGtb8cFLHmXYWpgnPlQ7M1L50cRGAk9IcCvdjsP8=;
        b=YN+Kd6rE4uJcnrXwSFKrFOhJvAT1AxzyAZOmWxSP44CsIjlcP1d+NMtG6qE5pvWy0m
         eqrVCTcgcpgJnaZvnZOOckCaPcOPVCoepZfrUVPbEGqky4HPDCkiK7wO6wIoPnCVHODQ
         mS+yFIiMsHnLx9shj/lEI0pep6RloMCGebATEEq+qXibp1iPMsCOsvcwZkl0dFZAT83z
         WawiDjZxjEBWSWqJO5IbHCnEPL6/PdLHWSjqHhDJGirvKkTeMleQZmSdANywKDMsvNCq
         L1HtsvFbukeKFzTvKaEbvEbw0ZP8hsW44C+K/OQLjgBPMg292NisP3KfE5puZq3U/K0R
         PPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=z9lZGtb8cFLHmXYWpgnPlQ7M1L50cRGAk9IcCvdjsP8=;
        b=Q7+HUL3kiuuUJNX+lllckkJiu3textWXKHxbljINFZpHsObfa9KVxPZIDhdPtZ7HbN
         ikEW7HXCP60HTZHhe/9TTivMuM291rMvZ19rUFJVXYvJb198DFBB6kgkBdD+/cntzafU
         nGNXP22soQtscnk2rLWLiEQriHCnqUfy/9BS9WxT0SFEAZgZdDZG2ZxusxfNQ7/gHoi5
         evzgCWBXTeuUjfiu9rj/lLMk6fV3WA6xQsq8AVzw8qkFJALqgM65Mw2Q+p2zqI7RBBvr
         4hFUKpwhrOD/DeEkIWG0G+2Mbw+ZgA3v8E83+AU6bz7TsGVAbN5Z3Kq3jtwXigvaPgJ1
         gISg==
X-Gm-Message-State: AOAM531Uufl1izuUS8ljV0KyxCTxA1pTnuqQf4l5NPPVGSa4Km5c5d3j
        CSWFanU/1LZB0yXjJdrIFQ==
X-Google-Smtp-Source: ABdhPJzhOQoXseYyF3hYCk4WIgcQp5Y8MuKzDj2R4zdZgzqfwFtNnB1cBghRkA35TttX/k58tiBOAw==
X-Received: by 2002:a17:902:6b0c:b0:14f:3a39:ad3d with SMTP id o12-20020a1709026b0c00b0014f3a39ad3dmr13674261plk.113.1645329434011;
        Sat, 19 Feb 2022 19:57:14 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
        by smtp.gmail.com with ESMTPSA id h16sm7910793pfh.40.2022.02.19.19.57.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Feb 2022 19:57:13 -0800 (PST)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, christophe.leroy@csgroup.eu,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        digetx@gmail.com, andriy.shevchenko@linux.intel.com,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/11] i2c: npcm: Fix timeout calculation
Date:   Sun, 20 Feb 2022 11:53:16 +0800
Message-Id: <20220220035321.3870-7-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220220035321.3870-1-warp5tw@gmail.com>
References: <20220220035321.3870-1-warp5tw@gmail.com>
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
index 9ccb9958945e..1e6e3f7f59a3 100644
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
@@ -2265,7 +2265,7 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
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

