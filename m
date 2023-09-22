Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD817ABA33
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 21:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbjIVTmq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 15:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbjIVTmq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 15:42:46 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB178AC
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 12:42:39 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-307d58b3efbso2426248f8f.0
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 12:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695411758; x=1696016558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uSenmJ9Las4g9YYe7bPAC0RcvkYFnxV4buUqt3EN5Dk=;
        b=SrFTpbQhgu5BcVZI92HUvKzxYGzyYMF2/Rmi5TJzHpZqfPsVMfsRRxMyegawtJDrO5
         cKTJixqSDh3zHCZuyych0oOlf/NDWUfkioDGRkLJVI8sgFj1uvgoXPTSjTnDx2oKSY1p
         HKLTe2SEDAjJHfypNc31DsvGJ+fFv3/9jMcCaDvn5XD1l32K81oL3zfiVEVdPU5iPXQA
         GNwLQ78wtEN0La5CY5t3i3WO711gapHmDYhFwn3Qs4m3piyE+j82ukM+Gtsx2pU42PeZ
         vq9ISt57GsXJxx7rx5FVJLXtErBNXfiFD8O1hlHPeXwfam1uH70QvkCzcu3nhpcnFTMq
         vCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695411758; x=1696016558;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSenmJ9Las4g9YYe7bPAC0RcvkYFnxV4buUqt3EN5Dk=;
        b=t6dct1ogOtmqlqiz2HZCQGkHIgnHR+tu8BaZT6JwKjyNWkEZ+QvT7m7g/wEX7/cGiu
         dpOvBzXdLEpvz1BBJ/WTqY0EELRU9PIMB26HRyg0YmQG0I/nMIQqN5EEzW+eR1e+dByZ
         2sk++Iuw+18A+sybJbpTvPUjSgdDNSXY/G6Pix3Jqm6koqCSM2todK66cRe5C3rfVrMV
         p1UUYCC/ZvoOGBEp1wW+Hg1TmjgI5XC2cHObZVV0WYdGBZPIlVziq1XPkIX16r7irn7v
         w1/5wuazH4jVzvfsoEAI9D8PIPfFpdlvf8yLqusvdSAD9ycbaw8ofbPCbtXGB0ONbpot
         ahng==
X-Gm-Message-State: AOJu0YywJbiGR76EVYnZXxeIKsrah09LtU7ryqh5diGG9eQg4m3H3jqM
        iv7jiUoGEjqMyWnvA0bY1t93TlYYPNw=
X-Google-Smtp-Source: AGHT+IHVfXqGzhUKu9k/yB3HSB2A/49HrU61YvnwnBLvo2Y1aUzo8b/7TpQsQbizhZAoqHxaiNsbTg==
X-Received: by 2002:a5d:6084:0:b0:318:7bd:349e with SMTP id w4-20020a5d6084000000b0031807bd349emr609143wrt.29.1695411758287;
        Fri, 22 Sep 2023 12:42:38 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9589:7c00:3475:142c:c3cb:ba32? (dynamic-2a02-3100-9589-7c00-3475-142c-c3cb-ba32.310.pool.telefonica.de. [2a02:3100:9589:7c00:3475:142c:c3cb:ba32])
        by smtp.googlemail.com with ESMTPSA id t16-20020a5d49d0000000b0031c5b380291sm5174077wrs.110.2023.09.22.12.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 12:42:37 -0700 (PDT)
Message-ID: <01fb032a-7b6f-4db3-a273-30a017d4e58c@gmail.com>
Date:   Fri, 22 Sep 2023 21:37:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/8] i2c: i801: Add helper i801_check_and_clear_pec_error
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Avoid code duplication and factor out checking and clearing PEC error
bit to new helper i801_check_and_clear_pec_error().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 38 ++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a300c66b4..915dd07e1 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -327,11 +327,27 @@ MODULE_PARM_DESC(disable_features, "Disable selected driver features:\n"
 	"\t\t  0x10  don't use interrupts\n"
 	"\t\t  0x20  disable SMBus Host Notify ");
 
+static int i801_check_and_clear_pec_error(struct i801_priv *priv)
+{
+	u8 status;
+
+	if (!(priv->features & FEATURE_SMBUS_PEC))
+		return 0;
+
+	status = inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE;
+	if (status) {
+		outb_p(status, SMBAUXSTS(priv));
+		return -EBADMSG;
+	}
+
+	return 0;
+}
+
 /* Make sure the SMBus host is ready to start transmitting.
    Return 0 if it is, -EBUSY if it is not. */
 static int i801_check_pre(struct i801_priv *priv)
 {
-	int status;
+	int status, result;
 
 	status = inb_p(SMBHSTSTS(priv));
 	if (status & SMBHSTSTS_HOST_BUSY) {
@@ -352,13 +368,9 @@ static int i801_check_pre(struct i801_priv *priv)
 	 * the hardware was already in this state when the driver
 	 * started.
 	 */
-	if (priv->features & FEATURE_SMBUS_PEC) {
-		status = inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE;
-		if (status) {
-			pci_dbg(priv->pci_dev, "Clearing aux status flags (%02x)\n", status);
-			outb_p(status, SMBAUXSTS(priv));
-		}
-	}
+	result = i801_check_and_clear_pec_error(priv);
+	if (result)
+		pci_dbg(priv->pci_dev, "Clearing aux status flag CRCE\n");
 
 	return 0;
 }
@@ -407,14 +419,12 @@ static int i801_check_post(struct i801_priv *priv, int status)
 		 * bit is harmless as long as it's cleared before
 		 * the next operation.
 		 */
-		if ((priv->features & FEATURE_SMBUS_PEC) &&
-		    (inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE)) {
-			outb_p(SMBAUXSTS_CRCE, SMBAUXSTS(priv));
-			result = -EBADMSG;
-			dev_dbg(&priv->pci_dev->dev, "PEC error\n");
+		result = i801_check_and_clear_pec_error(priv);
+		if (result) {
+			pci_dbg(priv->pci_dev, "PEC error\n");
 		} else {
 			result = -ENXIO;
-			dev_dbg(&priv->pci_dev->dev, "No response\n");
+			pci_dbg(priv->pci_dev, "No response\n");
 		}
 	}
 	if (status & SMBHSTSTS_BUS_ERR) {
-- 
2.42.0


