Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17B0B4CB8ED
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 09:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbiCCIcs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 03:32:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbiCCIcl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 03:32:41 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A7417225F;
        Thu,  3 Mar 2022 00:31:55 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id ay5so3903742plb.1;
        Thu, 03 Mar 2022 00:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VHaRDl/NeA/sk1ew9ZkQ6wgAVfjZxhVj9/cWGyaZpno=;
        b=AJBqM8KINeoSRfWd9e1yx+VHrQVOEYrRFBl3cJiRuwIUKEbKVendgOQ7Xy46sdKU3k
         glEwJj3KfpKi4Qm2qhlqxhpUjd5S5v/Dy1R3NBpp3YS0QBY6+cuKJcFcMgZaRQSkhs+B
         1fONo7ec+hBHBOMcreST8AMQeepSlkLBe5XAgpIGa62HQECMIDO8gzkwiDvDmlUGNOUU
         QZND0Vv/NyOhr/Rq3dQObQ0poDmRxzIXO+xzOyr4Mk0NS8QLXeCwhm+dZIcXgq8PJnLh
         kccjPPScsJCao6pDfscVLkAg2Mgk+b0VmqdnPVdO5vqApQrDdvuC0Yc+dvcs9zp2Ff6D
         8IIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VHaRDl/NeA/sk1ew9ZkQ6wgAVfjZxhVj9/cWGyaZpno=;
        b=ekXjHIzr2Of//1Lc8rBKVzVGZFX3qH6Q9Uo8x/YAB4DwYg7i9uyECjSJdwcxX3NSQx
         UzlYczeKE3A6o92W9RrtH7achWrFgBojKnI/HxTV5b26afXQBPc6aLnpeDvhAYSweMSL
         ZMjdHKjgdd+k38cCjebeyIg8+Ei8nIFzLWgn9Vaiz+tArnYf1hKGJnE3hfLI6Cv5TAFt
         lgl94ztdN5Mlcwpm+QINSNw2niIelEpVKDzci9ZJA89RT+4FgbSJPPVPRVfV3z4CiptO
         VZgQnDnRaMBtc7weYQFg/PUMDcxR3OOlu+Qj7w6DCR1VXJ4xIDKL5tiKkh84FIbmNCDy
         QERA==
X-Gm-Message-State: AOAM533XRy6HDeYhJac0oej3uoZuTy87LEEQ2+v9wyBxqLXwoem2kN77
        a9VUrZLX5WHdoV/AmMpK8g==
X-Google-Smtp-Source: ABdhPJzZrSthr04PXHtErJjKuzAkidzKO32y5t0cJZbCPeiqz0iaSN6WVOgZ7Iqc0ZrnKM+EKsrtIA==
X-Received: by 2002:a17:902:d643:b0:151:6f2c:cfb4 with SMTP id y3-20020a170902d64300b001516f2ccfb4mr17463091plh.120.1646296314590;
        Thu, 03 Mar 2022 00:31:54 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
        by smtp.gmail.com with ESMTPSA id ng11-20020a17090b1a8b00b001beefe9a1cbsm1488852pjb.31.2022.03.03.00.31.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 00:31:54 -0800 (PST)
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
Subject: [PATCH v3 03/11] i2c: npcm: Fix client address calculation
Date:   Thu,  3 Mar 2022 16:31:33 +0800
Message-Id: <20220303083141.8742-4-warp5tw@gmail.com>
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

Fix i2c client address by left-shifting 1 bit before
applying it to the data register.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2ad166355ec9..4c225e1a058f 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2131,7 +2131,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
+	bus->dest_addr = slave_addr << 1;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
-- 
2.17.1

