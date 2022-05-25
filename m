Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5EA5335B9
	for <lists+linux-i2c@lfdr.de>; Wed, 25 May 2022 05:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241848AbiEYDYg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 May 2022 23:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241178AbiEYDYY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 May 2022 23:24:24 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA372719E3;
        Tue, 24 May 2022 20:24:22 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id gk22so88285pjb.1;
        Tue, 24 May 2022 20:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0rffUNaGY9JVFcRgt64Xz6CcZdQ3YWgSvvOXYBNVtz8=;
        b=jKuli6//St0+LziZumcEVU9gK0gJSh/AzpWH/KvZOrjGADjGd6q9QqwOD441webjpK
         gilAjG+LuVOpD5IOFK/83ezJe7pJ1xqeoRB4UvizS6FSRJdbXVn2SzPhhAsakxycJwyn
         7GpFGlNuuN9u8cwWO24d/KKSp0P81EbToYQUryYUC6uqU2aEmdYMj935T+wh9nVI7KZm
         phcqaebLfwXYhPlJYL2KvrRvV/iV6MH4KGFT7f2eaDjIIdP/B4tUYjWXq9CoX2quPY3w
         CTPyYOnMOliR0s4mXNMyyGCBhUjg/CB3CecF3CxL995slIZGw57pNDs5Qnw+edU1DIPT
         j8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0rffUNaGY9JVFcRgt64Xz6CcZdQ3YWgSvvOXYBNVtz8=;
        b=KvxhFifVnRS6fIQVEkAGYA+qa2PNDTyMbkhOp3T8d39b8nQiC98Uqtyat1NTHjUDfP
         j6WDBuZuPDDx4u+Ax08535w5fO2DUQxFm5wv5UVCAiic+oWJfviF/V3TGoNuMROJeLBX
         BT5DcE2wrbzSjwvcnvh6A9QEscCSZZgf07Gt+oEiG8/pnhiP1H9Iz7/Fbf4RQU7uzcS9
         jUSt93Bf914PofBPFUJxBRxrDRd0hPDfL0LI2xiw0BCpcT6N3Xrw0QZpeTSyR3331J1K
         2KqA7ejuLfcDB+zuwsGSAdt/g25L+1j7JZudG4c2qxheB9Cqu0FpXkqt0K+RqRkEtzKV
         RmoA==
X-Gm-Message-State: AOAM530J329K4HfNdEZM3PuwDksF6ZIw2+BPVYSRS+yRbEnpc7vGORo2
        jGfOLJKFH6S5e8tM3x61sg==
X-Google-Smtp-Source: ABdhPJwAu5NH9jyXsBMmzbw6/e/vdCqMz64XE5Xk0CvUDXMx3MBbQxxY2jDtg1yuSX72ujd35ZM00Q==
X-Received: by 2002:a17:90a:8807:b0:1df:78c7:c215 with SMTP id s7-20020a17090a880700b001df78c7c215mr7941634pjn.234.1653449061947;
        Tue, 24 May 2022 20:24:21 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net. [220.133.130.217])
        by smtp.gmail.com with ESMTPSA id c21-20020a62e815000000b00518e3256022sm711553pfi.104.2022.05.24.20.24.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 May 2022 20:24:21 -0700 (PDT)
From:   Tyrone Ting <warp5tw@gmail.com>
To:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org,
        jie.deng@intel.com, jsd@semihalf.com, sven@svenpeter.dev,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/5] i2c: npcm: Correct slave role behavior
Date:   Wed, 25 May 2022 11:23:39 +0800
Message-Id: <20220525032341.3182-4-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220525032341.3182-1-warp5tw@gmail.com>
References: <20220525032341.3182-1-warp5tw@gmail.com>
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

Correct the slave transaction logic to be compatible with the generic
slave backend driver.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index b5cc83e51029..b4d218c6c8fb 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -915,11 +915,15 @@ static int npcm_i2c_slave_get_wr_buf(struct npcm_i2c *bus)
 	for (i = 0; i < I2C_HW_FIFO_SIZE; i++) {
 		if (bus->slv_wr_size >= I2C_HW_FIFO_SIZE)
 			break;
-		i2c_slave_event(bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
+		if (bus->state == I2C_SLAVE_MATCH) {
+			i2c_slave_event(bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
+			bus->state = I2C_OPER_STARTED;
+		} else {
+			i2c_slave_event(bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
+		}
 		ind = (bus->slv_wr_ind + bus->slv_wr_size) % I2C_HW_FIFO_SIZE;
 		bus->slv_wr_buf[ind] = value;
 		bus->slv_wr_size++;
-		i2c_slave_event(bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
 	}
 	return I2C_HW_FIFO_SIZE - ret;
 }
@@ -967,7 +971,6 @@ static void npcm_i2c_slave_xmit(struct npcm_i2c *bus, u16 nwrite,
 	if (nwrite == 0)
 		return;
 
-	bus->state = I2C_OPER_STARTED;
 	bus->operation = I2C_WRITE_OPER;
 
 	/* get the next buffer */
-- 
2.17.1

