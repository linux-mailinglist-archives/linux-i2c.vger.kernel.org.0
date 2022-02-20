Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 694AC4BCC01
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Feb 2022 04:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238471AbiBTD52 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Feb 2022 22:57:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238943AbiBTD51 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Feb 2022 22:57:27 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672C341F93;
        Sat, 19 Feb 2022 19:57:07 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id 27so6092910pgk.10;
        Sat, 19 Feb 2022 19:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VHaRDl/NeA/sk1ew9ZkQ6wgAVfjZxhVj9/cWGyaZpno=;
        b=DrbOGJXWkMwEjYyrpb0z4riYVX2m3+wuBgJrfSafJ7eF7F8ZWrFVDFtuFb6Hl2NvK7
         UimSfxfbtpRxJP7gw/nXDeYRf4yxnuGsHgfgoZtwBn86K2e5fngQR4rxZo1sBJCmwF8b
         fNtV7d8cZbKwyJJPt76XLEO2EXTe2LP+5cfKB2gbfcrcT10haXkpuWLTmIkODLfHQ4Y1
         PoTidw5FUkydnwfeHtlQe1q7kWldSgyQbhEt4PgcC9HC2cHuaw0UW042eiI31qfJFzZT
         r31RIYEkiVI6gODot/NUcGb7reY8l5Oeg++LNtYX+7dHm0n8Uaw+PdV3z0AnCe9JIWs9
         bl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VHaRDl/NeA/sk1ew9ZkQ6wgAVfjZxhVj9/cWGyaZpno=;
        b=AWffW7ooB/GQswjWRZV8VE3T6t0xViWIbLXJpyih0WeQ4ajqwXwhI3yyH0uM9lfuQH
         fjuKeW3fljbmpCH1rQptIfahpdOP6ggw24GRZKTp6n+8EAoazgjtFQAAR9kDf9Z199Yu
         t64qmiDxlpgl1suNrchqGfc85ixu/eCqhXyOpStiJQyI58A30IfLmZxEoPxgw0MFRbGp
         /GKF822IVmVaWvhZ3uTjJs32A5c4npLq2WTwoGmRgtyUsuBqwOvMYuvad2AQjqg4FcDX
         7O9iP8m6av9ocy43zLHBA/yzgsLOR18epcDpxsNbqwipN6hcKDjss+hAORXCgDwHhIHQ
         QjqQ==
X-Gm-Message-State: AOAM531kLwJEo8beod0ZmvPcW7/341fwq+g0TgaUysAZmEPT4nxG7CXw
        ajt2GWUFotyiWTAPIupliQ==
X-Google-Smtp-Source: ABdhPJzChfyBfF5Xt3f1no2uKiR9FXvmqVlTsLehWQUsat8JqGMJX18ebUvpe8/LATTgL0fu2BQgcQ==
X-Received: by 2002:a63:4b07:0:b0:373:e921:ca4e with SMTP id y7-20020a634b07000000b00373e921ca4emr6478129pga.58.1645329426824;
        Sat, 19 Feb 2022 19:57:06 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
        by smtp.gmail.com with ESMTPSA id pf14sm3642564pjb.16.2022.02.19.19.57.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Feb 2022 19:57:06 -0800 (PST)
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
Subject: [PATCH v2 03/11] i2c: npcm: Fix client address calculation
Date:   Sun, 20 Feb 2022 11:53:13 +0800
Message-Id: <20220220035321.3870-4-warp5tw@gmail.com>
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

