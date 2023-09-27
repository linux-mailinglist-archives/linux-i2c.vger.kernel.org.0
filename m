Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E271A7B094D
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 17:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232906AbjI0PuV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 11:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232699AbjI0PuE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 11:50:04 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC18D037
        for <linux-i2c@vger.kernel.org>; Wed, 27 Sep 2023 08:42:51 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-690d2441b95so8721115b3a.1
        for <linux-i2c@vger.kernel.org>; Wed, 27 Sep 2023 08:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1695829370; x=1696434170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e+KczYJ63iTfnuMsHD4IMClJxOV5m4dNcMyA1mqDD9g=;
        b=RLhwbE5cF0AchcrKRjBTtVBNA2oVXu2QTVVh6MJ9Ue4WgkSdIkayZ6YTp2NI5dr2G8
         Ozy2UO4I8rx3jZdn+ycpNbQ7rewp4IBrVrEMHneNdjbMi2hxhqyhrbK5Ehf3AwWwZYQW
         Sqv4TL1DIhUcNfGnxYBIxRfkXimpF8nQX+i7wOUWZ8h4/vhkLGoH1EqQZ2qa3fgLh9rS
         Z34lIsCHRNLOFEJ5MtSXRBBU6EwP45inYMrrQyowlhXjkVWTJ5xllTZGvOualR3eqTte
         lrm6a8uiXM6SmqR632zFc+hHyImYQ0bXojujQCy40bLTacK3/24fcmVyXyeyyF4GA7bB
         N8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695829370; x=1696434170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+KczYJ63iTfnuMsHD4IMClJxOV5m4dNcMyA1mqDD9g=;
        b=kw2JWikCYFELgfaWOnNRNzBUzP86qnreixTnGMO+X29G0eC9WMmqfn89h+tWJFI+vs
         2xGlAp7JRwRK9OJyfQH9uV3dK8LW9bKSu60DF8SKIuQ6znt5DFsbRIaCgsViNv4CbI8y
         e2rBik8LSkRw2tRqE2R+rAmpqSAL2vDK7JvYKbWD8EqXlovlD1RweuI4J/hKsReDfrl7
         81IVj0bXdFKs8FlUUGCU/BmksbseizjGwY/LpHFsCSwbfkVaZA9MPYjxTmvI0SHm19Dh
         zey3Xlku8FsT/D3A+hju2WPt/O/qQYudwRjXckwE3eVuLjRYYmQiRX+ch0cZym6k4RBe
         VcKQ==
X-Gm-Message-State: AOJu0Yz4n4WhnoqMDIcy0AF2Fmmq2JM6dHGwGiDSLc8zzsHT9rclDFgo
        tDJ3yEmy03H1LbcWhSIbwPcBCg==
X-Google-Smtp-Source: AGHT+IFRfQ/0KX1bSuu5UuM2JxSiQwHD4x642i16XMLdBILDBkTo7GJS+ledc4uHjgaqOgLCqUIbcg==
X-Received: by 2002:a05:6a21:9983:b0:15d:1646:285a with SMTP id ve3-20020a056a21998300b0015d1646285amr3860484pzb.21.1695829370365;
        Wed, 27 Sep 2023 08:42:50 -0700 (PDT)
Received: from localhost ([49.7.199.230])
        by smtp.gmail.com with ESMTPSA id v3-20020a655c43000000b005782ad723casm10120152pgr.27.2023.09.27.08.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 08:42:50 -0700 (PDT)
From:   Jian Zhang <zhangjian.3032@bytedance.com>
To:     brendan.higgins@linux.dev, benh@kernel.crashing.org,
        joel@jms.id.au, andrew@aj.id.au
Cc:     zhangjian3032@gmail.com, yulei.sh@bytedance.com,
        xiexinnan@bytedance.com, Andi Shyti <andi.shyti@kernel.org>,
        Tommy Huang <tommy_huang@aspeedtech.com>,
        Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org (open list:ARM/ASPEED I2C DRIVER),
        openbmc@lists.ozlabs.org (moderated list:ARM/ASPEED I2C DRIVER),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE
        SUPPORT),
        linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE
        SUPPORT), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] i2c: aspeed: Fix i2c bus hang in slave read
Date:   Wed, 27 Sep 2023 23:42:43 +0800
Message-Id: <20230927154244.3774670-1-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
as a slave, a situation arises where the master sends a START signal
without the accompanying STOP signal. This action results in a
persistent I2C bus timeout. The core issue stems from the fact that
the i2c controller remains in a slave read state without a timeout
mechanism. As a consequence, the bus perpetually experiences timeouts.

In this case, the i2c bus will be reset, but the slave_state reset is
missing.

Fixes: fee465150b45 ("i2c: aspeed: Reset the i2c controller when timeout occurs")
Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 5a416b39b818..18f618625472 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -933,6 +933,7 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
 	/* If slave has already been registered, re-enable it. */
 	if (bus->slave)
 		__aspeed_i2c_reg_slave(bus, bus->slave->addr);
+	bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
 #endif /* CONFIG_I2C_SLAVE */

 	/* Set interrupt generation of I2C controller */
--
2.30.2

