Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE32C521091
	for <lists+linux-i2c@lfdr.de>; Tue, 10 May 2022 11:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238581AbiEJJV5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 05:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238578AbiEJJVy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 05:21:54 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9DF3224A6F;
        Tue, 10 May 2022 02:17:55 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id x88so3816377pjj.1;
        Tue, 10 May 2022 02:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gP+plLDk5yRb5409QMGK9yKqiV4kS1Q3uENsLgiEyTQ=;
        b=BAXVn1StiszzHdVHviFtH5Hte/TEN5MOeyi4GE/2WZ0SNMYUUhi0CsGZT+GYssUHLi
         AhkqE9amGi8afYY2HrUpWhYcp7MZEdu2RY5ifmyyHhLlJ7D+H6vrujE5TQ/1exNZ57u6
         nTnSGDeULUqrGsavvzJL/4lV7V8zLzldtNK9Tx2kGFsFr99hbBTBFe6Gx7IkpQq/v9I3
         9h8RtQRrZaB3WpO+mggig4GN5S2+LkBGEP4ALKphdxHcatykoEAK3Jn/4zUYUP+xOBpM
         NOgbmUyMwsvL4ckJuE2de2Mc2JPiEFgkoKGYyAL9pg2CCJY7fB5Plojt3X0HbsTHYJWC
         SwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gP+plLDk5yRb5409QMGK9yKqiV4kS1Q3uENsLgiEyTQ=;
        b=FKNs4NL0cmbFMmGUOpuPGvY/pQ/UtWJ3hWFzM4717lgzMOIcx3fEF3aWM09wYxUPku
         5TCuVEfEenwbNRMUZi11amCLtlxCuGHDDDU3ma/QvWwGT05B+BmNM7vYKxlYLbKpzexl
         2MjKrpFdzXcU8oZFyc7Vx30KPGJ9OKJ0I0DenvPzkYPQ7fDODG4xVsTjyMiKLzfiN+vc
         FmXJl6MgZ/iBNW2IheC5Tdix8jNBs3KQcwaMPvI0bZ7qlF6NNdAMWJdpQ5ASHRpA0aev
         W8cLvQEsRrLUy6adBlr9ZrtW8HLlRgDwgavUBv5YJr1hdYiYmxgpJjJtFF+0PVkUjWK+
         vX0Q==
X-Gm-Message-State: AOAM533d1riTSkCSsq0Ad4bTpKuhZuyaZSOMkpUKCLmN0kCSXS/a6eVh
        GWyG5JWxIhDJOk/YIYobsA==
X-Google-Smtp-Source: ABdhPJypBGg9EMs+QxwC/Cjl5JuSGPx3TLdDHACzF4DheFO9FblAs+6ZM6y9BiuOWNwGHQ49bIG1uA==
X-Received: by 2002:a17:903:41c3:b0:15e:b690:bedc with SMTP id u3-20020a17090341c300b0015eb690bedcmr20056657ple.161.1652174275389;
        Tue, 10 May 2022 02:17:55 -0700 (PDT)
Received: from localhost (2001-b011-7010-358e-c990-a8c9-85a7-1d3e.dynamic-ip6.hinet.net. [2001:b011:7010:358e:c990:a8c9:85a7:1d3e])
        by smtp.gmail.com with ESMTPSA id y5-20020a170902b48500b0015e8d4eb26fsm1447231plr.185.2022.05.10.02.17.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 May 2022 02:17:55 -0700 (PDT)
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
Subject: [PATCH v4 4/9] i2c: npcm: Fix timeout calculation
Date:   Tue, 10 May 2022 17:16:49 +0800
Message-Id: <20220510091654.8498-5-warp5tw@gmail.com>
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

Use adap.timeout for timeout calculation instead of hard-coded
value of 35ms.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 1f92c84317e4..eaec051e080d 100644
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

