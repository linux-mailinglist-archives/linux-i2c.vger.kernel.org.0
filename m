Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C652339CF6A
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Jun 2021 15:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbhFFN7Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Jun 2021 09:59:25 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:46841 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbhFFN7X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Jun 2021 09:59:23 -0400
Received: by mail-wr1-f48.google.com with SMTP id a11so12464515wrt.13
        for <linux-i2c@vger.kernel.org>; Sun, 06 Jun 2021 06:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=pDyAihBmfI/crvC6DOvVeiSGZapCKBgnwZfURUrP71M=;
        b=BNJzSu/ueP5ELoira26/ZfUqGVLvu0IBObWaaFOJ/17Lpmm2pa1TL8ooqIp6HD11qg
         kDw+CkRV5UNcApUHTFqKtVxg2VXslTMkHfbCuFYYo/anRHN5Xs7MZmwIQNF93P0uss7n
         drrRWAz4TPu1MlnBuvcaxRsAXlM6MdG0ZIJ8BCxNSN+I89kVV/jhbpH/nKk8J6T/WeOn
         cpEYG+yAax56uxAzSrf8h6uJ36n8ND3ISTREQSuxkWtYsRTS5wDRgpgi4xG2cZQKx/LV
         6tO0tqbiOwgRfn1XkrxAuiy0ymoj16yopnlfjbE3M7mb7Da1fwIHdKwhyXQJ56k8xk6s
         jHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=pDyAihBmfI/crvC6DOvVeiSGZapCKBgnwZfURUrP71M=;
        b=IQyBWihCduViR5gF5x1jzhCDJSKwZXArpkxWaZrwmeKcXSV+uArp+3EA5RMbr6gZYX
         TqHmCKniOJmHO3FuohYbVHflQTq8KuThNcPBg/qFUc+kOQs1d27acAcxrM+R08ZU/Fmm
         Wqm+rbUdmjkrhxfMutUGn+7qdrDCjEB1lt1Z2WhclfVOEfm7lMWUbpjBu7aa5u2VzbNe
         52izXymgIlMtUxsjWv/TWIPrOHz1v0nZw8ea/1mZf+YuQzRoulxoWi1RYvRUN0gHr/iB
         GVdHGu7nkfnyNG7TbGcf+ni+GIi9fe7LQDWqCgu88LDxDPid7QZJP8JR5rueLjJuWnVi
         vScA==
X-Gm-Message-State: AOAM530xNG/G/3ieh7p7llPXhM9CjbTZkru0OYGzRIW8RqFuhxSuzVVr
        irxHngXO0cmV7s3uio/B+j33OOC+XUo=
X-Google-Smtp-Source: ABdhPJxI0GlzxtxsOz3TUXSxmyXrsz1t0VyUYqQMk5s0mIDyyti9kZNeFb/DlkNIUYb16kRDb2wJMQ==
X-Received: by 2002:adf:ee85:: with SMTP id b5mr12697155wro.95.1622987779647;
        Sun, 06 Jun 2021 06:56:19 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f2f:c00:49c:cca9:867d:9b13? (p200300ea8f2f0c00049ccca9867d9b13.dip0.t-ipconnect.de. [2003:ea:8f2f:c00:49c:cca9:867d:9b13])
        by smtp.googlemail.com with ESMTPSA id u6sm13588763wre.76.2021.06.06.06.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jun 2021 06:56:19 -0700 (PDT)
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] i2c: i801: Ensure that SMBHSTSTS_INUSE_STS is cleared when
 leaving i801_access
To:     Jean Delvare <jdelvare@suse.de>, Hector Martin <marcan@marcan.st>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Message-ID: <cefbeb76-5f7f-036b-fa0e-1e339d261c35@gmail.com>
Date:   Sun, 6 Jun 2021 15:55:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

As explained in [0] currently we may leave SMBHSTSTS_INUSE_STS set,
thus potentially breaking ACPI/BIOS usage of the SMBUS device.

Seems patch [0] needs a little bit more of review effort, therefore
I'd suggest to apply a part of it as quick win. Just clearing
SMBHSTSTS_INUSE_STS when leaving i801_access() should fix the
referenced issue and leaves more time for discussing a more
sophisticated locking handling.

[0] https://www.spinics.net/lists/linux-i2c/msg51558.html

Fixes: 01590f361e94 ("i2c: i801: Instantiate SPD EEPROMs automatically")
Cc: stable@vger.kernel.org
Suggested-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- add proper stable tag
---
 drivers/i2c/busses/i2c-i801.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index c7d96cf5e..ab3470e77 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -948,6 +948,9 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 	}
 
 out:
+	/* Unlock the SMBus device for use by BIOS/ACPI */
+	outb_p(SMBHSTSTS_INUSE_STS, SMBHSTSTS(priv));
+
 	pm_runtime_mark_last_busy(&priv->pci_dev->dev);
 	pm_runtime_put_autosuspend(&priv->pci_dev->dev);
 	mutex_unlock(&priv->acpi_lock);
-- 
2.31.1

