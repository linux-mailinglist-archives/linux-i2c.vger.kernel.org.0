Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 942F8584F4F
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jul 2022 13:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234954AbiG2LC3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Jul 2022 07:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234581AbiG2LC2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Jul 2022 07:02:28 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6EBF2AE34;
        Fri, 29 Jul 2022 04:02:27 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id b10so4338902pjq.5;
        Fri, 29 Jul 2022 04:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OVF3y7QB8gY+KNNuUfkiCKf/IXKM8mP2Ri70A+tABKc=;
        b=S0P3lwD3l+s1lvJSF8eRq3gpfq+aLEn+6Uni+I1V2pnk87kzSgK1TAq/curq5Br3hi
         DPtB7ok6on/MXaVwyQtsCeYiio9MBIBcSigERU5ltfpgHJQg6QqP1mdNhahTQXmHcgvi
         JoIQbv4Cg7ZhMLAKvlNso2MdGec/dJtdKCn6qL0834rIp5AVvrxiY5TdoFrxE4iFOEga
         jBVxSYTOwi3m0EQxUsaV22LL1jBXtapC76kmkKNDCVJCYqYdbD3pPfQ6vXPmgr4fqgMe
         nflkgeFdIhsxO4sV5j/LKGBcmkYX0IV0WvCcMK/vzmvlIvxSEqqmDELPdjUXBRll6sFD
         6nLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OVF3y7QB8gY+KNNuUfkiCKf/IXKM8mP2Ri70A+tABKc=;
        b=cP2s3BXdOiZVDYivd0shs+dCdeUh3/ZAG+4RZ+C9lbZ07/x2KipXO02XYFmBnifKtx
         n/k+6FEhE/+y3BNiTwWzUOzrKGHl4HzX5aZxLSvFaLQ8Z055LgA0aq8exCDG/V21vfeh
         tHApCTSX4EPVl3xpZGPBQ+M/vBL9re24XWJR4PTQf/s1JS9k0218Ao6BKXrclKY2g5pR
         HJiWAKmddLqRTy1koTytrwywqiISbyUkGI7AZgjRnCGxz+3ATmg85+PchU9qpuiArejK
         ryLY4I3tHZAo3m9zLUSjGa8MK4qBWJX3125w8fM0j5rAbIB6RdPMT528oqWEBs1LMs2L
         Opgw==
X-Gm-Message-State: ACgBeo32GeLnTb2NRK4I9YqOxJUN7GURj/bMPaTetjuUQrdDUG856y5U
        XM5tzub3A8F4Jl3qeEWx0g==
X-Google-Smtp-Source: AA6agR6d/pXnMP5TH+WsFQflyu0AQvjGgMEEWwl8xZsEdBNSNUeR1i+IJtLFZ/mKEa1Apnu9uDWqPA==
X-Received: by 2002:a17:90a:65cb:b0:1f2:4c5a:93e1 with SMTP id i11-20020a17090a65cb00b001f24c5a93e1mr3525406pjs.188.1659092547156;
        Fri, 29 Jul 2022 04:02:27 -0700 (PDT)
Received: from localhost.localdomain ([166.111.133.51])
        by smtp.gmail.com with ESMTPSA id t2-20020a17090a4e4200b001f22647cb56sm5528851pjl.27.2022.07.29.04.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 04:02:26 -0700 (PDT)
From:   Zheyu Ma <zheyuma97@gmail.com>
To:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Jean Delvare <khali@linux-fr.org>,
        Bill Brown <bill.e.brown@intel.com>,
        Wolfram Sang <wolfram@the-dreams.de>
Cc:     Zheyu Ma <zheyuma97@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: ismt: Fix an out-of-bounds bug in ismt_access()
Date:   Fri, 29 Jul 2022 19:02:16 +0800
Message-Id: <20220729110216.557010-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When the driver does not check the data from the user, the variable
'data->block[0]' may be very large to cause an out-of-bounds bug.

The following log can reveal it:

[   33.995542] i2c i2c-1: ioctl, cmd=0x720, arg=0x7ffcb3dc3a20
[   33.995978] ismt_smbus 0000:00:05.0: I2C_SMBUS_BLOCK_DATA:  WRITE
[   33.996475] ==================================================================
[   33.996995] BUG: KASAN: out-of-bounds in ismt_access.cold+0x374/0x214b
[   33.997473] Read of size 18446744073709551615 at addr ffff88810efcfdb1 by task ismt_poc/485
[   33.999450] Call Trace:
[   34.001849]  memcpy+0x20/0x60
[   34.002077]  ismt_access.cold+0x374/0x214b
[   34.003382]  __i2c_smbus_xfer+0x44f/0xfb0
[   34.004007]  i2c_smbus_xfer+0x10a/0x390
[   34.004291]  i2cdev_ioctl_smbus+0x2c8/0x710
[   34.005196]  i2cdev_ioctl+0x5ec/0x74c

Fix this bug by checking the size of 'data->block[0]' first.

Fixes: 13f35ac14cd0 ("i2c: Adding support for Intel iSMT SMBus 2.0 host controller")
Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/i2c/busses/i2c-ismt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
index 6078fa0c0d48..63120c41354c 100644
--- a/drivers/i2c/busses/i2c-ismt.c
+++ b/drivers/i2c/busses/i2c-ismt.c
@@ -509,6 +509,9 @@ static int ismt_access(struct i2c_adapter *adap, u16 addr,
 		if (read_write == I2C_SMBUS_WRITE) {
 			/* Block Write */
 			dev_dbg(dev, "I2C_SMBUS_BLOCK_DATA:  WRITE\n");
+			if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
+				return -EINVAL;
+
 			dma_size = data->block[0] + 1;
 			dma_direction = DMA_TO_DEVICE;
 			desc->wr_len_cmd = dma_size;
-- 
2.25.1

