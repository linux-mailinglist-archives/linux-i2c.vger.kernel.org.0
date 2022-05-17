Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE8B1529F05
	for <lists+linux-i2c@lfdr.de>; Tue, 17 May 2022 12:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243887AbiEQKNJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 May 2022 06:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343769AbiEQKMp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 May 2022 06:12:45 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FBD1CFF2;
        Tue, 17 May 2022 03:12:07 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id x23so16459920pff.9;
        Tue, 17 May 2022 03:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zomvFyKwvw6sl1NdObv6Lxmz7g2O8ob0ad1FOsoR+M0=;
        b=QGDr7GlpRtohqnEqHu9NzhS/DN2bjl9VDao1H9pGnSW7NQ1+ZU/kvpuuszSkLE/XS/
         vgXfS5vpbQHyvDVgyjeewc1ALxm1roslp4B6HUnfwqmEApI6g7mJ3bywifFn8ufCTgIn
         bRdvyg2BFue0am5FIkv+cjwQdelM7ANsNh+Y1L20fOy0SWwoV/bCKotMfL+tgGRV2mIf
         ugzf4KUSSjWl3KKmDUEjErxGBmEi6H+8kTpPei8cCM7k7YLf/0SPQgg89eMUR70siRFp
         Ej/NFy+rCGg4VH5ZiwjCXbIsAGPGIBfEhC2/+QoOMqIsxN4sqU9jSnRoWS0rLZtdtiiv
         kj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zomvFyKwvw6sl1NdObv6Lxmz7g2O8ob0ad1FOsoR+M0=;
        b=vF2Vtqx42Ewa3UXGXAnZz6/yY5CIra2FszGapilfIuMHYXW6kMB1mIhkORA1n704ES
         w1ktOJGfGruC3pTpzpnydI0/s4VlBveC0LyRdyyBzbTgqygppfpdX/1w4hCl583W3W1b
         /PBxcG9AYPlfq/2DQBfjyGMVdTlekTowWBmOnjwAhdtf0OMeVGuMWQWaixgUaVAP1ZMX
         XiZEYDCFtJfrgEb3yiea2AuHM9vH51gfpdsuSNPnqTfnIXJe5jyc4Hbe10dB6AXQuZXA
         0re/7tKMy9EsdtyQm/xCIt3o0Ff/BFf0dMP1ZNEgvfuCLhxqJJ6GEo/DBQuYhjkhWqzP
         S34w==
X-Gm-Message-State: AOAM531zh3QnQNOKrdykR6Ywy3AaGko2Z/K3izjlgP6w25wutErtlc0q
        TQ+8qwGqP5yh3VDL660Ccg==
X-Google-Smtp-Source: ABdhPJyEh0IIwPL85FUQMFt25TSsOVEFYpJ+H5cN9UppcTkM+ikonG1TwLiLRF3hTllzsaIHCB7DiA==
X-Received: by 2002:a65:4007:0:b0:3c6:c6e2:1ccc with SMTP id f7-20020a654007000000b003c6c6e21cccmr18499757pgp.500.1652782326658;
        Tue, 17 May 2022 03:12:06 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net. [220.133.130.217])
        by smtp.gmail.com with ESMTPSA id b1-20020a056a000a8100b0050dc76281c1sm8628069pfl.155.2022.05.17.03.12.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 May 2022 03:12:06 -0700 (PDT)
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
Subject: [PATCH v5 06/10] i2c: npcm: Correct register access width
Date:   Tue, 17 May 2022 18:11:38 +0800
Message-Id: <20220517101142.28421-7-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220517101142.28421-1-warp5tw@gmail.com>
References: <20220517101142.28421-1-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Tyrone Ting <kfting@nuvoton.com>

The SMBnCTL3 register is 8-bit wide and the 32-bit access was always
incorrect, but simply didn't cause a visible error on the 32-bit machine.

On the 64-bit machine, the kernel message reports that ESR value is
0x96000021. Checking Arm Architecture Reference Manual Armv8 suggests that
it's the alignment fault.

SMBnCTL3's address is 0xE.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 36f8aa7ab106..58d7175f0362 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -360,14 +360,14 @@ static int npcm_i2c_get_SCL(struct i2c_adapter *_adap)
 {
 	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
 
-	return !!(I2CCTL3_SCL_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
+	return !!(I2CCTL3_SCL_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
 }
 
 static int npcm_i2c_get_SDA(struct i2c_adapter *_adap)
 {
 	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
 
-	return !!(I2CCTL3_SDA_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
+	return !!(I2CCTL3_SDA_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
 }
 
 static inline u16 npcm_i2c_get_index(struct npcm_i2c *bus)
-- 
2.17.1

