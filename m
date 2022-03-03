Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B783B4CB8F9
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 09:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbiCCIc4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 03:32:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbiCCIcx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 03:32:53 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B3A1728B9;
        Thu,  3 Mar 2022 00:32:07 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id c9so3925743pll.0;
        Thu, 03 Mar 2022 00:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/rDAVTie3SxeAVR95vRKlzdmhRE4hsYCRa8DjWFbl6c=;
        b=aVZAbdB6qOjS5fF2o7kwdQwkygkcvelz0L16o+BUrVTIgWAA33e3g/AFxHk+vcXIBT
         vqfzkeq8Scdw0wnsLV4EKkyBx8CKfzrrRwouqAVTtiJmwF/08MvGswQ7oxqzPjxc5bld
         kLNdIUwrdxm8tDoRrKX3H9Ej0qPw3NUecQNTiBX6fwZRe0DYyBwRgrfs9hpO7l15QA9k
         JKfyT9RrhuMc7tz2i25A82VOODVcnQj40yVHIGJPN5llbT66Uv+JvONfKsVL9CT9yy3D
         1kpR5SHazPl4oUWjLmKfsJo5OKIOfTsSAwAa2rdoIfRu4VSkuyOwz3SXlKbgCd7XdgW3
         GntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/rDAVTie3SxeAVR95vRKlzdmhRE4hsYCRa8DjWFbl6c=;
        b=mLa9j8QHJKtmSlwAow0nmdGGr81gQumViSVKSGCtvI+lHnym72yJM+DLQxVHxaojb2
         EozsNf5LQvDFojoRmTOI5GwRTNZporSJmqfRPIw+mkKRctHqOuNjzPoUL0ZklbU/WQog
         mlzkEPdBFJXL76TE861Rg0VuWCHYZlg0Tu5eRkMwOsAKWgViOZlj5LNxBrN7ke8EsOVC
         aEO6NOn/I+nuV0Uuls/PEQxCUdaeF5eEEDncbDexO46fSq30EVNhsMVwxeHHnaAoTMLK
         UOx0KCdXn242HOEGtFEbgn0zey3uzfXfRuyA3QMmKbO3EDf69HZ+n0eCd3oqJOaIl/HN
         f8tw==
X-Gm-Message-State: AOAM533LnSs7HwLfTR7xL7sYNP2JYMJu4qe2VapJARpv/HEsqLwgtirO
        YE7U67g81vjhTs7SMumFOg==
X-Google-Smtp-Source: ABdhPJzNYvYxi1ws8nYxWLiJ/HZhxdhvXlIHm+oQdyzpYJ3n4q+nNTm2xHYXmM9w8T95ElGmIKl0kw==
X-Received: by 2002:a17:902:d643:b0:151:6f2c:cfb4 with SMTP id y3-20020a170902d64300b001516f2ccfb4mr17463802plh.120.1646296327067;
        Thu, 03 Mar 2022 00:32:07 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
        by smtp.gmail.com with ESMTPSA id 142-20020a621894000000b004dfc714b076sm1823145pfy.11.2022.03.03.00.32.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 00:32:06 -0800 (PST)
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
Subject: [PATCH v3 08/11] i2c: npcm: Correct register access width
Date:   Thu,  3 Mar 2022 16:31:38 +0800
Message-Id: <20220303083141.8742-9-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083141.8742-1-warp5tw@gmail.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
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

Use ioread8 instead of ioread32 to access the SMBnCTL3 register since
the register is only 8-bit wide.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 237da0ef32ca..66532c680338 100644
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

