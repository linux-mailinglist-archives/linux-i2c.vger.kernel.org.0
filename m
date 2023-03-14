Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2E46B970D
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 14:58:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbjCNN6n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 09:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231834AbjCNN6X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 09:58:23 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 226EC32E53;
        Tue, 14 Mar 2023 06:57:45 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id bg11so11846267oib.5;
        Tue, 14 Mar 2023 06:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678802261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HDBnljpxfT2quGn/YLnb1AUpqlWKLru8pfMKw5zC3kQ=;
        b=ZQITKVeevPj8lK6V/B/QQi27WX2vAFfKwIZRQED+Iu95UCxtMBvOpWzPhSfqiBdews
         damBX5MAsrLA0W1ZqsiDv1tMzmQEV38sOS8Zh6RCGTo0rSJ7WWqi/oVePQBPUbHroi5j
         pJq+2sjzjDyPI9hybUReIGxInzsWmLNd96wSs8CZkeFdwaJNQoU6Dv1tgW3IDQTSabGX
         nsrBwRPHdZ5h5DPUKDU+jt5vdsVJUrHhCa1BM5rXkfsMISEtw5Xg9EwyZBHTRVUYj38U
         7HX/jEJ9eLIrxMxeXeRyVfkMZGnsfcqigC9HIaLzXZkEs9PI13ZfgcY1XPFkfUoX1/FC
         mKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678802261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDBnljpxfT2quGn/YLnb1AUpqlWKLru8pfMKw5zC3kQ=;
        b=p02lU3dYCi+2iORShNV5lj08zSyvq1ltS86gLBpV7/kD185HZmey5CpO5EqWtZ3/oG
         Owsqlqeh7OWSQacBDFTP5puNlsiJwzmNILOc9kTeL14xL20mzQuhxOfokIlwPuLW+agD
         EyfiCiTlXRifH5xbAdSOK3JmsqA45I2NpsA6uQw2GPO/PFCvCsBgfLeqztAdMbUp76H9
         BQHlMB6yC+iFmxRs7/c9Ru1zXb9dHUnzgSUfFgF9kSmzBgzyamF79GGNtkX082/Vzf1B
         cl38kTRm9W/rV5tA0kebpz9+s8+TLt6HB2z0yMpm2azHU4n2awyHE4D3fWevg67kDtRo
         d5Zw==
X-Gm-Message-State: AO0yUKU0HWmhh9sS4qGpHGshG3JZywNvPWiCoU7GZcrmO8sNm3VW/dnv
        SSCVXi36dmKGuji96YyOyOHC+YCWNul4Cw==
X-Google-Smtp-Source: AK7set8NjQlQJgr2LgPXTK1TxUxQDEDLIo/EXLD8zldhhqcXwnTxo4E/QAxkMfvVfw6lxprsZF0XTw==
X-Received: by 2002:a05:6808:b2a:b0:360:cb13:e78a with SMTP id t10-20020a0568080b2a00b00360cb13e78amr17272760oij.58.1678802261675;
        Tue, 14 Mar 2023 06:57:41 -0700 (PDT)
Received: from chcpu13.cse.ust.hk (191host119.mobilenet.cse.ust.hk. [143.89.191.119])
        by smtp.gmail.com with ESMTPSA id t26-20020a0568080b3a00b0037d7c3cfac7sm986481oij.15.2023.03.14.06.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 06:57:40 -0700 (PDT)
From:   Wei Chen <harperchen1110@gmail.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Wei Chen <harperchen1110@gmail.com>
Subject: [PATCH] i2c: xgene-slimpro: Fix out-of-bounds bug in xgene_slimpro_i2c_xfer()
Date:   Tue, 14 Mar 2023 13:57:34 +0000
Message-Id: <20230314135734.2792944-1-harperchen1110@gmail.com>
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

The data->block[0] variable comes from user and is a number between
0-255. Without proper check, the variable may be very large to cause
an out-of-bounds when performing memcpy in slimpro_i2c_blkwr.

Fix this bug by checking the value of data->block[0].

Signed-off-by: Wei Chen <harperchen1110@gmail.com>
---
 drivers/i2c/busses/i2c-xgene-slimpro.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i2c/busses/i2c-xgene-slimpro.c b/drivers/i2c/busses/i2c-xgene-slimpro.c
index 63259b3ea5ab..bc9a3e7e0c96 100644
--- a/drivers/i2c/busses/i2c-xgene-slimpro.c
+++ b/drivers/i2c/busses/i2c-xgene-slimpro.c
@@ -391,6 +391,10 @@ static int xgene_slimpro_i2c_xfer(struct i2c_adapter *adap, u16 addr,
 						&data->block[0]);
 
 		} else {
+
+			if (data->block[0] + 1 > I2C_SMBUS_BLOCK_MAX)
+				return -EINVAL;
+
 			ret = slimpro_i2c_blkwr(ctx, addr, command,
 						SMBUS_CMD_LEN,
 						SLIMPRO_IIC_SMB_PROTOCOL,
@@ -408,6 +412,10 @@ static int xgene_slimpro_i2c_xfer(struct i2c_adapter *adap, u16 addr,
 						IIC_SMB_WITHOUT_DATA_LEN,
 						&data->block[1]);
 		} else {
+
+			if (data->block[0] > I2C_SMBUS_BLOCK_MAX)
+				return -EINVAL;
+
 			ret = slimpro_i2c_blkwr(ctx, addr, command,
 						SMBUS_CMD_LEN,
 						SLIMPRO_IIC_I2C_PROTOCOL,
-- 
2.25.1

