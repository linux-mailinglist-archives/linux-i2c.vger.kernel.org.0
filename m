Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5843B468AE2
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Dec 2021 13:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233913AbhLENAu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Dec 2021 08:00:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbhLENAt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Dec 2021 08:00:49 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED90C061714
        for <linux-i2c@vger.kernel.org>; Sun,  5 Dec 2021 04:57:22 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id o13so16355089wrs.12
        for <linux-i2c@vger.kernel.org>; Sun, 05 Dec 2021 04:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:from:to:cc
         :subject:content-transfer-encoding;
        bh=C0dVLya84y0lKeV8OPOv5ezrVmy33XM9yH54TV5FqXI=;
        b=hV6KpRpwCzEObUCmv3JxXWQoVq1c92vbWk9Jjzq3P2vdkd9dZdRLdRqVieiO/obx1u
         o/tV5juZkvFQugvGP4sg6SAMjSV9OWXbdqAfLklkdsNwL9xjQKoPhrzvS+o23bSYJbA+
         1q+4Tbbk5Qcr5e/Wr/oD50y+q8uTkQ2BwcuJuF91Y9mW4Qa7+vEYh74UyTe9ikuYrqJC
         ZeGpxc8eD4SuERzfop7jNCGLBIwQnd7HeVWLPStIANBM7MUzsOr4v6VHQSbvkV5s5zju
         9Q7oOVp6SqPzSLksYZs9+6l3y41X5fDCIp5Ijn8LGTUR2NuiPpaFyPGI7NcwGqxjiHMO
         r3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:from:to:cc:subject:content-transfer-encoding;
        bh=C0dVLya84y0lKeV8OPOv5ezrVmy33XM9yH54TV5FqXI=;
        b=13QjAKUHjpLB+vDPNPO0az8+57wwPZYj9si//s3xU69kaPsx/f244Qer69nWIOzloa
         /sh9XefN33PHM1JYRg+N6lbSGg2flUKsWqP6A2vxklNz+LfCZ5sObq/gKWgWuDdPB7a8
         R1mvr0CWyk4XVPzQ1ueDgQRzSi2o7dZ+k7jnE5msT1Q3ELatKQ5DFceqWf2o/Z/hdjp9
         YvjnxUgzeyQApcF6NrktaCfZ7+tpfyKNOwX9KlAz7SmnX16xG7xY7vIgbyzREljhqAXJ
         yATLq3RDq5jZkEfSxb2Rzht0v/8eAhhUEh81XQG+/xnqyB5hY/D0gETLg2c8x2ABALn4
         D1+g==
X-Gm-Message-State: AOAM533RNyGH81aA+Hur1AYbV6dCFcMvfxUj+IcFZ9pYhAfUseEowfoK
        dyOO7NHrLxJNPRjiTs41PF/KIUmOEZs=
X-Google-Smtp-Source: ABdhPJwu2cKjPWe5p/m/fIKDnBSgkwb5F7BeVudR9ClsbjMmSn5gKw6qR5+UceAU0UDOFFksIHcmGg==
X-Received: by 2002:adf:e8c8:: with SMTP id k8mr35127357wrn.135.1638709040989;
        Sun, 05 Dec 2021 04:57:20 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:c00f:8db8:101c:6db1? (p200300ea8f1a0f00c00f8db8101c6db1.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:c00f:8db8:101c:6db1])
        by smtp.googlemail.com with ESMTPSA id d6sm8409869wrn.53.2021.12.05.04.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Dec 2021 04:57:20 -0800 (PST)
Message-ID: <7de775e9-7bae-d45d-fb6d-f86719c13f9d@gmail.com>
Date:   Sun, 5 Dec 2021 13:57:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: [PATCH] i2c: i801: improve interrupt handler
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Not sure if it can happen, but better play safe: If SMBHSTSTS_BYTE_DONE
and an error flag is set, then don't trust the result and skip calling
i801_isr_byte_done(). In addition clear status bit SMBHSTSTS_BYTE_DONE
in the main interrupt handler, this allows to simplify the code a
little.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a087f4834..c4c67505d 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -575,9 +575,6 @@ static void i801_isr_byte_done(struct i801_priv *priv)
 		/* Write next byte, except for IRQ after last byte */
 		outb_p(priv->data[++priv->count], SMBBLKDAT(priv));
 	}
-
-	/* Clear BYTE_DONE to continue with next byte */
-	outb_p(SMBHSTSTS_BYTE_DONE, SMBHSTSTS(priv));
 }
 
 static irqreturn_t i801_host_notify_isr(struct i801_priv *priv)
@@ -607,7 +604,6 @@ static irqreturn_t i801_host_notify_isr(struct i801_priv *priv)
  *      BUS_ERR - SMI# transaction collision
  *      FAILED - transaction was canceled due to a KILL request
  *    When any of these occur, update ->status and signal completion.
- *    ->status must be cleared before kicking off the next transaction.
  *
  * 2) For byte-by-byte (I2C read/write) transactions, one BYTE_DONE interrupt
  *    occurs for each byte of a byte-by-byte to prepare the next byte.
@@ -632,23 +628,18 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
 	}
 
 	status = inb_p(SMBHSTSTS(priv));
-	if (status & SMBHSTSTS_BYTE_DONE)
+	if ((status & SMBHSTSTS_BYTE_DONE) && !(status & STATUS_ERROR_FLAGS))
 		i801_isr_byte_done(priv);
 
 	/*
-	 * Clear remaining IRQ sources: Completion of last command, errors
-	 * and the SMB_ALERT signal. SMB_ALERT status is set after signal
-	 * assertion independently of the interrupt generation being blocked
-	 * or not so clear it always when the status is set.
-	 */
-	status &= SMBHSTSTS_INTR | STATUS_ERROR_FLAGS | SMBHSTSTS_SMBALERT_STS;
-	if (status)
-		outb_p(status, SMBHSTSTS(priv));
-	status &= ~SMBHSTSTS_SMBALERT_STS; /* SMB_ALERT not reported */
-	/*
-	 * Report transaction result.
-	 * ->status must be cleared before the next transaction is started.
+	 * Clear IRQ sources: SMB_ALERT status is set after signal assertion
+	 * independently of the interrupt generation being blocked or not
+	 * so clear it always when the status is set.
 	 */
+	status &= STATUS_FLAGS | SMBHSTSTS_SMBALERT_STS;
+	outb_p(status, SMBHSTSTS(priv));
+
+	status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
 	if (status) {
 		priv->status = status;
 		complete(&priv->done);
-- 
2.34.1

