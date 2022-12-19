Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0E36511B8
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 19:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbiLSSXD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 13:23:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiLSSXC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 13:23:02 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EBFD614D
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:23:01 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id tz12so23579803ejc.9
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jK6KmbWQc12uPIL5Io/OFJx758G/bZ5ohdHTweC19WI=;
        b=aiCrjE4XspXfTtLUOkwHjpvPb2cYRW2a2bTssMz9BD/YAhEjCCpU1vN5uZITQoak9N
         I02l9hY12BQBGwQ78YlTSAxuJFDkcwmnFbAPk5ju3LxN3HnQC2p7XQsnEbEEWiZlzqJM
         HVLHZ+wVp+/5IQrvOBcaR2lSbEPfKCggGKWVjS/0DTTr+YDyGlua3SJB6oLOZU1F9b47
         tgBGftxT3uuk4xfWph35sGR61DjeSR1+hsC+2uy62VzBBKbLjK0HilmkTudPkBgLX2aF
         tV1D7QXdSQAbntIhPyrcMg+dGBG8PMexT1pglAHl4ug5PN0HEOec0Q6MydHanWoFv3gs
         81Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jK6KmbWQc12uPIL5Io/OFJx758G/bZ5ohdHTweC19WI=;
        b=kPpvCg9CEhdO0b8Fu3/eBAnX7K+iWBzmx8/4+UQ1Ly57FFVtQjf+EFF/RTvBD5E5y8
         XkQDfMqvsqRGdg3r7YoQ/+FXqAzZurx2AKrOvb0W7JJgtFduqVqWOV66yjKFWNPMJqqp
         fFcu7OFB5mTxY2D5cjI2ozqfke1w1soR613KESlyaNP0WObkkRPPUKS9QOTtiBqDf2Sx
         jfVSa+TG2llJG8cvAHLaqJGveXCavbogPqoNN13XppB7uPv8+0qPOfvje7P0Gp/mius6
         VdD4BROLqoE8+LgIxsEQ7rTT0tL0s6fdahHQJ0pvmrbLZZP/tSbOsPq8P+Jwp52tHoau
         0z9w==
X-Gm-Message-State: AFqh2kq48K1C1AGYNrR3FwR852505MR5Ywcu4UoZq+ynePigiqPI2w2T
        o9Ohh0GQPohUwrC/2pZNVTyXFRgnOGE=
X-Google-Smtp-Source: AMrXdXuFlobrcqAPsB0MYJy/a6zmrIcZmslhxaygLzyDjW7BzDW8tvu5+lItK/Hv+antE3UG9F0rcQ==
X-Received: by 2002:a17:907:110a:b0:7c1:4bb2:f62b with SMTP id qu10-20020a170907110a00b007c14bb2f62bmr2482137ejb.27.1671474179760;
        Mon, 19 Dec 2022 10:22:59 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0aa:f200:2422:8cf4:48af:d322? (dynamic-2a01-0c23-c0aa-f200-2422-8cf4-48af-d322.c23.pool.telefonica.de. [2a01:c23:c0aa:f200:2422:8cf4:48af:d322])
        by smtp.googlemail.com with ESMTPSA id f3-20020a17090631c300b007c0f2d051f4sm4642048ejf.203.2022.12.19.10.22.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 10:22:59 -0800 (PST)
Message-ID: <0ef3e6f9-471f-ff05-0cf0-046d79a4c820@gmail.com>
Date:   Mon, 19 Dec 2022 19:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH v2 06/10] i2c: i801: handle SMBAUXCTL_E32B in
 i801_block_transaction_by_block only
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
In-Reply-To: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Currently we touch SMBAUXCTL even if not needed. That's the case for block
commands that don't use block buffer mode, either because block buffer
mode isn't available or because it's not supported for the respective
command (e.g. I2C block transfer). Improve this by setting/resetting
SMBAUXCTL_E32B in i801_block_transaction_by_block() only.

Small downside is that we know access SMBAUXCTL twice for transactions
that use PEC and block buffer mode. But this should a rather rare case
and the impact is negligible.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index d934d410b..d7182f7c8 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -511,19 +511,23 @@ static int i801_block_transaction_by_block(struct i801_priv *priv,
 
 	status = i801_transaction(priv, xact);
 	if (status)
-		return status;
+		goto out;
 
 	if (read_write == I2C_SMBUS_READ ||
 	    command == I2C_SMBUS_BLOCK_PROC_CALL) {
 		len = inb_p(SMBHSTDAT0(priv));
-		if (len < 1 || len > I2C_SMBUS_BLOCK_MAX)
-			return -EPROTO;
+		if (len < 1 || len > I2C_SMBUS_BLOCK_MAX) {
+			status = -EPROTO;
+			goto out;
+		}
 
 		data->block[0] = len;
 		for (i = 0; i < len; i++)
 			data->block[i + 1] = inb_p(SMBBLKDAT(priv));
 	}
-	return 0;
+out:
+	outb_p(inb_p(SMBAUXCTL(priv)) & ~SMBAUXCTL_E32B, SMBAUXCTL(priv));
+	return status;
 }
 
 static void i801_isr_byte_done(struct i801_priv *priv)
@@ -921,11 +925,10 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		ret = i801_simple_transaction(priv, data, read_write, size);
 
 	/* Some BIOSes don't like it when PEC is enabled at reboot or resume
-	   time, so we forcibly disable it after every transaction. Turn off
-	   E32B for the same reason. */
-	if (hwpec || block)
-		outb_p(inb_p(SMBAUXCTL(priv)) &
-		       ~(SMBAUXCTL_CRC | SMBAUXCTL_E32B), SMBAUXCTL(priv));
+	 * time, so we forcibly disable it after every transaction.
+	 */
+	if (hwpec)
+		outb_p(inb_p(SMBAUXCTL(priv)) & ~SMBAUXCTL_CRC, SMBAUXCTL(priv));
 out:
 	/*
 	 * Unlock the SMBus device for use by BIOS/ACPI,
-- 
2.39.0


