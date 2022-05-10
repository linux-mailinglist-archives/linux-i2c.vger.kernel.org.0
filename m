Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 365D252109D
	for <lists+linux-i2c@lfdr.de>; Tue, 10 May 2022 11:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbiEJJWZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 05:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238636AbiEJJWW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 05:22:22 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E940D218FE4;
        Tue, 10 May 2022 02:18:24 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id n10so4277597pjh.5;
        Tue, 10 May 2022 02:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qdZcbphejbuJUyI8ZEVHLXuIfaV6dJq4J7NvpDgtTDg=;
        b=LPaoDLd4Ikgrg7XEbyCAALxooHVmKiLlzVexFnqt53TrM98BzkpR73oa/V2hJLohvU
         B1aJUHEDRTEHt8gvAFtOjpgdjP87bI3esyPGDSSuNm9MF9vpQ7o1SEpnOI4JtE1DU6AD
         GLMeEtcI+D69rMS6wNyyQeYV1z/f3YgugfpeMudoHY1U0UfUCwbolO8KUVVvM0HjE5lP
         2MCCPrctSV7sLbEIT0dc9WQZcmgrzuFmbxN0oRm1z97czaM4mFaKYq8mGiEsWenYlBFY
         mLneOPu/puWKkmKFiuaoy69NV86xj1vRVoFn5DJ+gd9VqZWv8Vo0ykwY4sL2YwYGZh/3
         eQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qdZcbphejbuJUyI8ZEVHLXuIfaV6dJq4J7NvpDgtTDg=;
        b=SrxbZg/pcRQMWkdxocjqpKUIirIQURBorL4uNe4EX0T58yRnPdmY9WaTnem9cyLNPD
         BlXejShB52sSJqM61fCuphNNGjsmrDimGDeTrLvwOTZxaT73HhTusbQEkmzBMGANRI/T
         qErMHLMvHsUot5hscsWvekGnYIoR2Hr2eogkDB5+UdFEhwcArcM99WnADZr/il46Flnj
         AVKVy31yV9PXCSDmGWciqoDBljJ/LsXh6f99SBxNdmg+l8c6HLu9I8A8GhnY18QGchLm
         JZLsCy8i/7BMwrqV5a8H9f+lynWKO2Z7cploxhiOyN4sTP7WFKNQ05BHSfiLRSsyr6k2
         vswA==
X-Gm-Message-State: AOAM530qOSSD3clobsca2nVi4+IEDDcCVfoTX2oqXkyhtbjdJXHNmjDk
        EkUZ1Jt7h87uhTyM2LguXtE0D7CahMcK
X-Google-Smtp-Source: ABdhPJwK15ScNG0MQ6kvstR93vQS+YXUeN1JFJINlUwVpN3CbMW5fFJpYiqTuWGQCQuQWMqdliwEgA==
X-Received: by 2002:a17:902:e549:b0:15e:aa63:6fd8 with SMTP id n9-20020a170902e54900b0015eaa636fd8mr20036042plf.152.1652174304396;
        Tue, 10 May 2022 02:18:24 -0700 (PDT)
Received: from localhost (2001-b011-7010-358e-c990-a8c9-85a7-1d3e.dynamic-ip6.hinet.net. [2001:b011:7010:358e:c990:a8c9:85a7:1d3e])
        by smtp.gmail.com with ESMTPSA id v3-20020a622f03000000b0050e0a43712esm10166345pfv.63.2022.05.10.02.18.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 May 2022 02:18:24 -0700 (PDT)
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
Subject: [PATCH v4 6/9] i2c: npcm: Correct register access width
Date:   Tue, 10 May 2022 17:16:51 +0800
Message-Id: <20220510091654.8498-7-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220510091654.8498-1-warp5tw@gmail.com>
References: <20220510091654.8498-1-warp5tw@gmail.com>
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
index 56af571f65c1..e3c13f801f1a 100644
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

