Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 189C26611D3
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Jan 2023 22:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbjAGVl4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 Jan 2023 16:41:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbjAGVli (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 7 Jan 2023 16:41:38 -0500
X-Greylist: delayed 1330 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 07 Jan 2023 13:41:36 PST
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AD4A271AC
        for <linux-i2c@vger.kernel.org>; Sat,  7 Jan 2023 13:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=4vTAnyLsOGqs/zcYUpRiQcsisyMPbBxtJuMbNJ1l1Gg=; b=kr48M6q4P05s9/J0p6vqHo9xPs
        VsHum1EbDdNm1I7EVkALnaod+q2EYdewlAXhh9fI8ACPmkbffeFMe1N0NoDbvnwcgeyh9Do5j2lbj
        vrA3j41gIKpIkKK63tgqHaL2SxwPxtxuMzdORCYqago4TkyS+znVzTXTrQJx44+XSyJUETo00VDGL
        NQ1rdp4FSRmP59ZZa/W4SVh1uEAAVzM0ZyYQ7ipkBUuDmYgqV5m/LbtRyvyWFPS/zQ4VGf3HfXLyV
        HJk8H7chNHMdy9E4MnYBZDFWAL08/i9YkXVLsQmxfbNjPHQerP2mVkm/LZ2cjqBK/KGQc8AvusLYB
        /L7pcWYQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pEGb7-000ITW-06; Sat, 07 Jan 2023 22:19:25 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pEGb6-000KM5-Gi; Sat, 07 Jan 2023 22:19:24 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 1/5] i2c: cadence: Remove unused CDNS_I2C_DATA_INTR_DEPTH define
Date:   Sat,  7 Jan 2023 13:18:10 -0800
Message-Id: <20230107211814.1179438-2-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230107211814.1179438-1-lars@metafoo.de>
References: <20230107211814.1179438-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26774/Sat Jan  7 09:54:43 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The CDNS_I2C_DATA_INTR_DEPTH is not used in the Cadence I2C driver. Remove
it.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/i2c/busses/i2c-cadence.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index f58943cb1341..71ea658f4bd3 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -115,8 +115,6 @@
 #define CNDS_I2C_PM_TIMEOUT		1000	/* ms */
 
 #define CDNS_I2C_FIFO_DEPTH		16
-/* FIFO depth at which the DATA interrupt occurs */
-#define CDNS_I2C_DATA_INTR_DEPTH	(CDNS_I2C_FIFO_DEPTH - 2)
 #define CDNS_I2C_MAX_TRANSFER_SIZE	255
 /* Transfer size in multiples of data interrupt depth */
 #define CDNS_I2C_TRANSFER_SIZE	(CDNS_I2C_MAX_TRANSFER_SIZE - 3)
-- 
2.30.2

