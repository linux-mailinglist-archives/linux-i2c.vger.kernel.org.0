Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2CA3E30DC
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 23:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237419AbhHFVTZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 17:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232112AbhHFVTY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 17:19:24 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CDFC0613CF
        for <linux-i2c@vger.kernel.org>; Fri,  6 Aug 2021 14:19:07 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id d8so12669239wrm.4
        for <linux-i2c@vger.kernel.org>; Fri, 06 Aug 2021 14:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8oo5Jk2SD7JU2vkSTDYam8cg3/23eaYoPmN3cO5/LUE=;
        b=nLB+AE5HX+v7aMwZN7R6trNCSbOFE5gVNubzZS3kaGT1YJKuQcgS7W+41EpnkrchKY
         2VcuFcx38/nRS8wv/rI3Pdvvn9E5oVGFGzGSl+18KvVWo17t0z9Dwh68FGsTSaanEPLq
         xTNAaBLtWGJ1vOpev3GRJLgyagI9ClWt+ULx5vdEKPUB3kqM2sUBj1JyJHbPAGLNlgZq
         h+LNRpbBpQwV7lBgi+JQ1gEHV0TravIXlahxfU+AQzc3aJ2yq4A2o3lkVxmUIPLPZZb9
         qt4A4Px1YbBoKQDgl/7M8500mb2JbzvVoY3QFPXTE5gvDUfvVT8ral6eJYldZPrfK73l
         T/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8oo5Jk2SD7JU2vkSTDYam8cg3/23eaYoPmN3cO5/LUE=;
        b=B+OO5NH6Lf5k+tiC8cqWW40jAE0XgaugpDKPWqjFVndDcuQwlJD5Mm0dEchoIqft8v
         pzLKq/ui/Ts/F1PHagGL0qNDiXgenD6xVHZqSn5NCeypZ6BXYc0VsI/Gvn0QBLblm9dx
         hUrA++47LlSanWPlNvtuJD8iy/P6bzIoI95LNruRNY9jrcPPGtn4R6Grd985QUz7T5iU
         BRAHmtOyEYqg0CfSqJn1XTv7TyfMebcYOr4YejTspgT1hKEyp+rnmBDDsgJwj927rXT0
         NxOvb5diaeUItCw0IOBTX2RXfmMdBK6pdEl5rMqVg0VTwAzHUvNynijEmqu7KMgkZ+4P
         oxeQ==
X-Gm-Message-State: AOAM533BLlWZn8fuaT3qT6NNPSUlCLssxzeU1PROg3AgSUQLtgNm2p9i
        EHxsx4oyl9L82Ekjdt404acAY8tbv/c++A==
X-Google-Smtp-Source: ABdhPJwW/QWOUvGwGGnf8kzdrmdbZeKgWa5iGCYvawqvagCU0R84qSnmuk29cBVjuyU7R5xRmgIvjQ==
X-Received: by 2002:a5d:6ac4:: with SMTP id u4mr12884986wrw.166.1628284746063;
        Fri, 06 Aug 2021 14:19:06 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:cc6d:4891:c067:bf7b? (p200300ea8f10c200cc6d4891c067bf7b.dip0.t-ipconnect.de. [2003:ea:8f10:c200:cc6d:4891:c067:bf7b])
        by smtp.googlemail.com with ESMTPSA id r2sm10853656wrx.27.2021.08.06.14.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 14:19:05 -0700 (PDT)
Subject: [PATCH v2 2/9] i2c: i801: make p2sb_spinlock a mutex
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
Message-ID: <90aee333-6490-db08-01ae-c0de1e18368a@gmail.com>
Date:   Fri, 6 Aug 2021 23:13:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

p2sb_spinlock is used in i801_add_tco_spt() only, and in process context
only. Therefore a mutex is sufficient, and we can make the definition
local to i801_add_tco_spt().

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index ef6dbb531..12e0c2ac3 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -110,6 +110,7 @@
 #include <linux/platform_device.h>
 #include <linux/platform_data/itco_wdt.h>
 #include <linux/pm_runtime.h>
+#include <linux/mutex.h>
 
 #if IS_ENABLED(CONFIG_I2C_MUX_GPIO) && defined CONFIG_DMI
 #include <linux/gpio/machine.h>
@@ -1492,12 +1493,11 @@ static const struct itco_wdt_platform_data spt_tco_platform_data = {
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
@@ -1510,7 +1510,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
 	 * enumerated by the PCI subsystem, so we need to unhide/hide it
 	 * to lookup the P2SB BAR.
 	 */
-	spin_lock(&p2sb_spinlock);
+	mutex_lock(&p2sb_mutex);
 
 	devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 1);
 
@@ -1528,7 +1528,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
 	/* Hide the P2SB device, if it was hidden before */
 	if (hidden)
 		pci_bus_write_config_byte(pci_dev->bus, devfn, 0xe1, hidden);
-	spin_unlock(&p2sb_spinlock);
+	mutex_unlock(&p2sb_mutex);
 
 	res = &tco_res[1];
 	if (pci_dev->device == PCI_DEVICE_ID_INTEL_DNV_SMBUS)
-- 
2.32.0


