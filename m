Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 825003DCBFC
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Aug 2021 16:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbhHAOZB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Aug 2021 10:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231984AbhHAOZB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Aug 2021 10:25:01 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87550C06175F
        for <linux-i2c@vger.kernel.org>; Sun,  1 Aug 2021 07:24:52 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id u15so8866790wmj.1
        for <linux-i2c@vger.kernel.org>; Sun, 01 Aug 2021 07:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lIBNyF3Gm3w6NDj4c8tFrdnQaWRUcf6vWCzj+DIKG6Q=;
        b=IInou7nzXIJXNrrKX85DG1/EMjovijbc1bfYLt+U1JzNhZxD0/p1YCEEwjsgIceJQ6
         Nkcv0cXR6rag+H+2yaexLAkxYg9iifPHfHahfMhp6PanO8oA0oCx+ertkdWjZ+gn7eV6
         Xv8BNfP//ggDa2HST59N6eOpNN2bQYreNoMHlS6EB/rohIk61rWyig6LLWThT0KwzE6e
         pzwrEzFhJsHAsNcdlaERsCTdtTv3gmRjkdj7DUzybeFAEZVc0iFZC6sTVRWH7bSt7MzE
         fUPZhWHQl3QvE+36Sx1H9WIXoRn0Jubm3oDpkpjsmDIkd05CSwgLEHCEUI2zXHyHUv4x
         zBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lIBNyF3Gm3w6NDj4c8tFrdnQaWRUcf6vWCzj+DIKG6Q=;
        b=f0cPD7jQdChJ9EggFZPndEXuVtDRkwgqWApG4Gq4jvR8bFdFUnu2PeXk0Qo/Im+DHQ
         x+QSTTfqxGZ3WoG/t/s7ZgZlDVN756qD3UNoPhopi8yh7COf6viCZIXbAUgr2caDz0Ro
         mEVhaxRmc5fTXuIkKOLfO9rd+XQero/QdAr4bi3O/eWEWV1pVHDAs6STJU0lGc0eH3GL
         cfiOrYSl6EHF7zeCy0FJlgNYoJiDRm9bj6Db1HKUYHOFKEGbYCO1BH+2x7ZcXsOc/sBV
         A+qERabHB4GKoHvrJitKDekmmH3klAcbVslpU+vfQUegUEw/hyQTtlNmHzN2ou82L4hZ
         l7HA==
X-Gm-Message-State: AOAM53025JxhH4eZUOS5MsJYCtvCiJeL6K3q49oQlIhSfUqt4WUHKTV9
        xRrlfjAOtOLqkVxkl2SK7qo5tyZSX2IM6A==
X-Google-Smtp-Source: ABdhPJx62eF9OqnDf8amCsFge62+A4/cWxt4Cw30b9qBr6KF4naVlCiCJ7TlaFN4sXSYMfiaRViivw==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr12477465wmq.138.1627827890980;
        Sun, 01 Aug 2021 07:24:50 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:9d9e:757:f317:c524? (p200300ea8f10c2009d9e0757f317c524.dip0.t-ipconnect.de. [2003:ea:8f10:c200:9d9e:757:f317:c524])
        by smtp.googlemail.com with ESMTPSA id k6sm7942759wrm.10.2021.08.01.07.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Aug 2021 07:24:50 -0700 (PDT)
Subject: [PATCH 06/10] i2c: i801: Remove not needed check for
 PCI_COMMAND_INTX_DISABLE
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
Message-ID: <f9115eb4-4b19-0a9c-0354-b3ded261c155@gmail.com>
Date:   Sun, 1 Aug 2021 16:21:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

do_pci_enable_device() takes care that PCI_COMMAND_INTX_DISABLE
is cleared if a legacy interrupt is used.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a6287c520..5b9eebc1c 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1825,19 +1825,12 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		priv->features &= ~FEATURE_IRQ;
 
 	if (priv->features & FEATURE_IRQ) {
-		u16 pcictl, pcists;
+		u16 pcists;
 
 		/* Complain if an interrupt is already pending */
 		pci_read_config_word(priv->pci_dev, PCI_STATUS, &pcists);
 		if (pcists & PCI_STATUS_INTERRUPT)
 			dev_warn(&dev->dev, "An interrupt is pending!\n");
-
-		/* Check if interrupts have been disabled */
-		pci_read_config_word(priv->pci_dev, PCI_COMMAND, &pcictl);
-		if (pcictl & PCI_COMMAND_INTX_DISABLE) {
-			dev_info(&dev->dev, "Interrupts are disabled\n");
-			priv->features &= ~FEATURE_IRQ;
-		}
 	}
 
 	if (priv->features & FEATURE_IRQ) {
-- 
2.32.0


