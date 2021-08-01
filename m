Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12D5F3DCBF9
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Aug 2021 16:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231992AbhHAOY7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Aug 2021 10:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231980AbhHAOY6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Aug 2021 10:24:58 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 785ADC06175F
        for <linux-i2c@vger.kernel.org>; Sun,  1 Aug 2021 07:24:49 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id p5so18247257wro.7
        for <linux-i2c@vger.kernel.org>; Sun, 01 Aug 2021 07:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PEkqY2dSUnOtZJbRz80mcbikOXejOWVLD+AfhqwVeWo=;
        b=QUrdPFMTlAkeMObGIOMoCRKCo+OGnyoNFqbj0oy/1nwIbE65aoupJFM4qUBWy4+wpD
         z5zO5GZM9xwQ7AcxPhpDoT5+wEo20EFoQjmaiRHFtYsmBo16icN3cZw+jDD6vJojO0OT
         JZWP0/Vplis8wWEvF5JQeIj+Wph+JGExV7exwPtG1R6DrY08L18HeZPekqxVODOq62X+
         iIWihf43yioOSz+RsW+UkmHpSpZFNB8GMvUyHH//pFD3Beh6oUUYNhkTeNGQxQYYAWB8
         ppzm/diMVpBzMAHuoAWtwqCNxvsmxbzKp+1xVz+vUmygYBsEjzq6uNEqn8JsRz0h6V6X
         AbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PEkqY2dSUnOtZJbRz80mcbikOXejOWVLD+AfhqwVeWo=;
        b=l1BsLpXg1oS0ju3L441u5MPt9Da832497aSxNf5igGReDTCxOncy8Gt7Hb2iZAywed
         YZSfKrYq9feEEhWozEo5lK78bjbVbZdsbTybeJWHaE9ASIS0TEKKXolhVfdRD2QkA/Ni
         RLu7m4IjIN/wTvLTAMx/ZlP8aIjut5mSsrRIhE8kVMvxiqwOTVjngj7RXPKl8iMLjiRM
         NxlrRqHQWZ+09s9A1qcLTdzuPQplL24XDKqtJW/AEPyJMoB7WARKodqmTbS/OVLfl2hX
         tAtjvb1xUFso/jo+5LVP9CVZazOfcOiiU6xarKHvJuHkYLN5R1g4mUxIX+HrzQL4e3qy
         ZUdQ==
X-Gm-Message-State: AOAM531IGum8LzGKX1dwNVeuIlzpeQ3I6NtfNWmIBuAnvMIKGSIgtJNn
        6vRYWaK5xlSHd+Y/admJXIqKovNTt84oOQ==
X-Google-Smtp-Source: ABdhPJxgLZi7z7uVfhWTEP47jExoRk3tlj8DSKdVY8O7Pd1HruCfk3qqNSYlu2Q3ya1LoOJPeE3ZHg==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr12910175wrn.337.1627827887929;
        Sun, 01 Aug 2021 07:24:47 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:9d9e:757:f317:c524? (p200300ea8f10c2009d9e0757f317c524.dip0.t-ipconnect.de. [2003:ea:8f10:c200:9d9e:757:f317:c524])
        by smtp.googlemail.com with ESMTPSA id w13sm9658324wru.72.2021.08.01.07.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Aug 2021 07:24:47 -0700 (PDT)
Subject: [PATCH 03/10] i2c: i801: Make p2sb_spinlock a mutex
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
Message-ID: <2e727b49-b59b-fad9-6ed3-febc5b98b8d4@gmail.com>
Date:   Sun, 1 Aug 2021 16:18:38 +0200
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

p2sb_spinlock is used in i801_add_tco_spt() only and in process context
only. Therefore a mutex is sufficient, and we can make the definition
local to i801_add_tco_spt().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index bdb619bc0..504f02e1e 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1492,12 +1492,11 @@ static const struct itco_wdt_platform_data spt_tco_platform_data = {
 	.version = 4,
 };
 
-static DEFINE_SPINLOCK(p2sb_spinlock);
-
 static struct platform_device *
 i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
 		 struct resource *tco_res)
 {
+	static DEFINE_MUTEX(p2sb_mutex);
 	struct resource *res;
 	unsigned int devfn;
 	u64 base64_addr;
@@ -1510,7 +1509,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
 	 * enumerated by the PCI subsystem, so we need to unhide/hide it
 	 * to lookup the P2SB BAR.
 	 */
-	spin_lock(&p2sb_spinlock);
+	mutex_lock(&p2sb_mutex);
 
 	devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 1);
 
@@ -1528,7 +1527,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
 	/* Hide the P2SB device, if it was hidden before */
 	if (hidden)
 		pci_bus_write_config_byte(pci_dev->bus, devfn, 0xe1, hidden);
-	spin_unlock(&p2sb_spinlock);
+	mutex_unlock(&p2sb_mutex);
 
 	res = &tco_res[1];
 	if (pci_dev->device == PCI_DEVICE_ID_INTEL_DNV_SMBUS)
-- 
2.32.0


