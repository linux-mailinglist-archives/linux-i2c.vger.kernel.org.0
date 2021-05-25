Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49E70390A50
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 22:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbhEYUJA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 16:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbhEYUI7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 May 2021 16:08:59 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 161F9C061574
        for <linux-i2c@vger.kernel.org>; Tue, 25 May 2021 13:07:28 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id x8so33483926wrq.9
        for <linux-i2c@vger.kernel.org>; Tue, 25 May 2021 13:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=pJ0+I3kI3gMiVzFoB7SIx7BTgA8TR+TS0zGt56pqGiw=;
        b=gtET9XTjRbWr2s1hkEjsmNGSEYeEl3r7KlrCP8vx7Qdt87D9/nViPZT5ggGlwoQAYp
         J39AfnvlDdOw6HRvdeWzu6uLKbEIgEyFq1quRNx/1KVrHL/cDjE+vhfNlQ9lL6WdmZTH
         6UTjsu+qPmxWNQs7hgTEpsUGOfEFSS800JwYhAvlMyL3Q/K+Jqb/fEWUhI0vDn9ZSo4X
         alhrcASyPPgSzLvVuM4B44GtpCTaNlMPK/EYK9CjQQZvJKacAYNfbGl4BhlJQyOqlb9q
         c4LNi3PGjpoejJ5EplSIjIEPtM1awhJ4Uw3MNnT+iNEePL3xJBZ6UIL6bnH3D76GEXNX
         hrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=pJ0+I3kI3gMiVzFoB7SIx7BTgA8TR+TS0zGt56pqGiw=;
        b=iJDRn2gJVLKW61Rl9lpCHQz17CvSZjsgPiWh1haqmKs7ljWgak16o7neayPbTxk0QJ
         z5zhugcZZMc5o06wGcfpj8SE7OSIzWOZNq8oUw6FCEwRkAfgKSm5GbYHvoC4XI2afXHk
         MnQLI5kZ69UPi3g3KuJKNTV9k6T3BUlTAfAwc+fu9sqEP6RfFWvVDZ3akeobvnISdzVK
         s1gc9c3nbiKwQpxLkvOlXymKggD9bBomryjjFrtl/5vddnJiGZyFjxnSdeZyQPF1Y7tV
         aKGTR5SGywnx85yKl1YHT3EAePKAEVWLYVOBGB/Xzj0tCb8bpkOdZiwOVWbl+jIn1W8C
         iPwQ==
X-Gm-Message-State: AOAM530YFen6QVqzvH2NOam7a9Bsq0C+BJ6+K6azHkhbRx85qaPy0qhw
        47AyUPGo523g3gBVCXL4AWDrEiDbNUE=
X-Google-Smtp-Source: ABdhPJx4uq1qcRttpeht0eYqHmYSGgPtSXjeoFm/KGptpx+QjQHnd1RtMPHfp7LTZ1/hrT0miItU0g==
X-Received: by 2002:adf:fa4c:: with SMTP id y12mr29177408wrr.393.1621973246378;
        Tue, 25 May 2021 13:07:26 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f38:4600:a053:ef5d:7e3e:e120? (p200300ea8f384600a053ef5d7e3ee120.dip0.t-ipconnect.de. [2003:ea:8f38:4600:a053:ef5d:7e3e:e120])
        by smtp.googlemail.com with ESMTPSA id r7sm3636955wmq.3.2021.05.25.13.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 13:07:25 -0700 (PDT)
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: Improve status polling
Message-ID: <4147230b-e88f-52e8-1241-ad343f77628f@gmail.com>
Date:   Tue, 25 May 2021 21:59:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Polling uses the same timeout as irq mode: 400 * 500us = 200ms = HZ / 5.
So let's use the adapter->timeout value also for polling. This has the
advantage that userspace can control the timeout value for polling as
well. In addition change the code to make it better readable.
Last but not least remove the timeout debug messages. Calls to both
functions are followed by a call to i801_check_post() that will print
an error message in case of timeout.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 36 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index f6d7866f1..2c6e84108 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -156,9 +156,6 @@
 #define SMBAUXCTL_CRC		BIT(0)
 #define SMBAUXCTL_E32B		BIT(1)
 
-/* Other settings */
-#define MAX_RETRIES		400
-
 /* I801 command constants */
 #define I801_QUICK		0x00
 #define I801_BYTE		0x04
@@ -447,42 +444,35 @@ static int i801_check_post(struct i801_priv *priv, int status)
 /* Wait for BUSY being cleared and either INTR or an error flag being set */
 static int i801_wait_intr(struct i801_priv *priv)
 {
-	int timeout = 0;
-	int status;
+	unsigned long timeout = jiffies + priv->adapter.timeout;
+	int status, busy;
 
-	/* We will always wait for a fraction of a second! */
 	do {
 		usleep_range(250, 500);
 		status = inb_p(SMBHSTSTS(priv));
-	} while (((status & SMBHSTSTS_HOST_BUSY) ||
-		  !(status & (STATUS_ERROR_FLAGS | SMBHSTSTS_INTR))) &&
-		 (timeout++ < MAX_RETRIES));
+		busy = status & SMBHSTSTS_HOST_BUSY;
+		status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
+		if (!busy && status)
+			return status;
+	} while (time_is_after_eq_jiffies(timeout));
 
-	if (timeout > MAX_RETRIES) {
-		dev_dbg(&priv->pci_dev->dev, "INTR Timeout!\n");
-		return -ETIMEDOUT;
-	}
-	return status & (STATUS_ERROR_FLAGS | SMBHSTSTS_INTR);
+	return -ETIMEDOUT;
 }
 
 /* Wait for either BYTE_DONE or an error flag being set */
 static int i801_wait_byte_done(struct i801_priv *priv)
 {
-	int timeout = 0;
+	unsigned long timeout = jiffies + priv->adapter.timeout;
 	int status;
 
-	/* We will always wait for a fraction of a second! */
 	do {
 		usleep_range(250, 500);
 		status = inb_p(SMBHSTSTS(priv));
-	} while (!(status & (STATUS_ERROR_FLAGS | SMBHSTSTS_BYTE_DONE)) &&
-		 (timeout++ < MAX_RETRIES));
+		if (status & (STATUS_ERROR_FLAGS | SMBHSTSTS_BYTE_DONE))
+			return status & STATUS_ERROR_FLAGS;
+	} while (time_is_after_eq_jiffies(timeout));
 
-	if (timeout > MAX_RETRIES) {
-		dev_dbg(&priv->pci_dev->dev, "BYTE_DONE Timeout!\n");
-		return -ETIMEDOUT;
-	}
-	return status & STATUS_ERROR_FLAGS;
+	return -ETIMEDOUT;
 }
 
 static int i801_transaction(struct i801_priv *priv, int xact)
-- 
2.31.1

