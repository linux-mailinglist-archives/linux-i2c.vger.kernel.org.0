Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C251466105
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Dec 2021 10:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233219AbhLBKCJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Dec 2021 05:02:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357231AbhLBKBT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Dec 2021 05:01:19 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80A2BC06174A
        for <linux-i2c@vger.kernel.org>; Thu,  2 Dec 2021 01:57:56 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id t9so41430200wrx.7
        for <linux-i2c@vger.kernel.org>; Thu, 02 Dec 2021 01:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=hu8U2zj4La4wruxaV2fuyUH2waEjEhDTe+Q+ezHl7ZU=;
        b=kkbEsqtFn8hBSVef4RKCkuMGEtRH8buMomnCZVce4p643fB1NwfflJ8X8DHLvarsSZ
         HTVfRUq6534KmfYmWWLwiY69YiplJDFs7XYRqW5Jicv5kiqsXgIWMNQeuG/mG+hr3ECr
         tpp+6TMWeJboqZVTCLxnMo3y9mJU3qcIZEqcEDjAC4zrBsA5dGamQ4iipE5bdpEWCwqs
         l4ZsN+Rk3am/e1ZrVHdJV8pxcNmDm72ZZdic9OIbUN3W6SIL1Ay99jU9gSkKasCuglhM
         X6Nb4aLBO8QcTfXkI7jyvoC8xsXwUjBzL+jZ6Tblm+kFTmrOhnrpw0ECwHLsP74jTzIP
         tThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=hu8U2zj4La4wruxaV2fuyUH2waEjEhDTe+Q+ezHl7ZU=;
        b=oIa9ExtlQTBfuR5uBDqWdU54fc/87iiorObfD4F0h/6ohmxpeoVxMWzle6Vn4TxO6n
         zmbJHWTe/rEqmNVicnrRSlork61PnRsQS9AyX7BH1aPtsQfEPiYjzPLRQZERhwYcy34I
         +1aCXO4b2JMUcqpa8kvHRyp+ViOiZnvqJKvDfIO11IRfdsuWLGaQD+FoynfDaJdNytKP
         RJHAgwr9UjVF4uegejDQEVY5VD/kY5uvBu1nMTGmybmFQXHGT3/s7xE3enhm71LPnMv9
         1bmT/E4e/qV7EFiPEK57kdv4JKRGubdrf/HaW9dOXicgk7drAHaJmKVNYuQlvPPQgdOW
         eg7Q==
X-Gm-Message-State: AOAM53097EO46RQlcB48TcFaL5Q+SjPW4uaZOTeDCtRoEUo70T5MqASA
        mA619l9k1nPrFBFMx2rMt/3ZKhjnge8=
X-Google-Smtp-Source: ABdhPJzD8c8BUG8/ZxMHD15AJHOfzUJE9heV75vKdSZ8SBxzl9uOgeq4pXfWQpV26kgrmy9JCVsKug==
X-Received: by 2002:adf:d22a:: with SMTP id k10mr13864342wrh.80.1638439075093;
        Thu, 02 Dec 2021 01:57:55 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:6195:7c7f:1f45:58f4? (p200300ea8f1a0f0061957c7f1f4558f4.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:6195:7c7f:1f45:58f4])
        by smtp.googlemail.com with ESMTPSA id d15sm2892869wri.50.2021.12.02.01.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 01:57:54 -0800 (PST)
Message-ID: <f0d7dd91-5b35-d5bb-33b7-dacc632c542a@gmail.com>
Date:   Thu, 2 Dec 2021 10:53:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: Don't read back cleared status in i801_check_pre()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I see no need to read back the registers to verify that the bits
have actually been cleared. I can't imagine any scenario where
the bits would remain set after a write to them.

Whilst at it, change involved syslog messages to use pci_dbg() et al.
to simplify them.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 720f7e9d0..a82aaef27 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -328,22 +328,14 @@ static int i801_check_pre(struct i801_priv *priv)
 
 	status = inb_p(SMBHSTSTS(priv));
 	if (status & SMBHSTSTS_HOST_BUSY) {
-		dev_err(&priv->pci_dev->dev, "SMBus is busy, can't use it!\n");
+		pci_err(priv->pci_dev, "SMBus is busy, can't use it!\n");
 		return -EBUSY;
 	}
 
 	status &= STATUS_FLAGS;
 	if (status) {
-		dev_dbg(&priv->pci_dev->dev, "Clearing status flags (%02x)\n",
-			status);
+		pci_dbg(priv->pci_dev, "Clearing status flags (%02x)\n", status);
 		outb_p(status, SMBHSTSTS(priv));
-		status = inb_p(SMBHSTSTS(priv)) & STATUS_FLAGS;
-		if (status) {
-			dev_err(&priv->pci_dev->dev,
-				"Failed clearing status flags (%02x)\n",
-				status);
-			return -EBUSY;
-		}
 	}
 
 	/*
@@ -356,16 +348,8 @@ static int i801_check_pre(struct i801_priv *priv)
 	if (priv->features & FEATURE_SMBUS_PEC) {
 		status = inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE;
 		if (status) {
-			dev_dbg(&priv->pci_dev->dev,
-				"Clearing aux status flags (%02x)\n", status);
+			pci_dbg(priv->pci_dev, "Clearing aux status flags (%02x)\n", status);
 			outb_p(status, SMBAUXSTS(priv));
-			status = inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE;
-			if (status) {
-				dev_err(&priv->pci_dev->dev,
-					"Failed clearing aux status flags (%02x)\n",
-					status);
-				return -EBUSY;
-			}
 		}
 	}
 
-- 
2.34.1

