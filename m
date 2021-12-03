Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2BAD467F95
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Dec 2021 22:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236017AbhLCV5O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Dec 2021 16:57:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353908AbhLCV5O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Dec 2021 16:57:14 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9532DC061751
        for <linux-i2c@vger.kernel.org>; Fri,  3 Dec 2021 13:53:49 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d9so8518661wrw.4
        for <linux-i2c@vger.kernel.org>; Fri, 03 Dec 2021 13:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:to:cc:content-language
         :subject:content-transfer-encoding;
        bh=1RIE0k8MHaMxAF3y8dHVL8mV7w6ypvmsKUusOHx3Ago=;
        b=A9K8VN1eH+1XB2NxmxKQAWRFph3MF8OXAFJY3X3wG2LpgbHWA0xUxUrNYqHAy7+SWD
         SrtnGMOborKecsZqhaK0Pzn8tiyM3a+FS9R7tO1FZJPe1Sf4ZCqGz1xGutCRSS6Pp6hb
         CG44h024/GHJaofnz6J8XwVw9ZmOauFTnzYV9jh/cKsVD7z/XMSBxBL+sTVDD7wwd75W
         x1FS+iYHUU+3lPChGZvTAOMAJiAjb6+lCx7t0EX4ITP82tvI3kV0mhQRC+VCRDLYxSL7
         uO6LeGp1Ah8qiQp/8cyekI3Wyn7ZC5uSyIVtLmMiRFiOzGLNPKzWIbEyvzvyWCaYBrVt
         xSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
         :cc:content-language:subject:content-transfer-encoding;
        bh=1RIE0k8MHaMxAF3y8dHVL8mV7w6ypvmsKUusOHx3Ago=;
        b=Fdv65p6wPpATQVLnsKJZRsIHGZXHOHm1qPlLbI2/s1m1rbVvm+wgYe7dtUNz8IuaiS
         M7P0iiFeFEi1DHY7lLAAwDDI+Cs3kClEUGdKYmCiHX5OGpj88OWv6GCtS1Wp9HGoUEV8
         Vk4bGSxMYc1ZOBis/StXwS5FqH88JvDO4XpAXbmzRZV11sieJSc/eDjXOd0tyVT+4hh3
         4xe1EViLLnbzQ08AUFkBL46UFT+ZOsrUFDK/izjWhgVI6qo1SpJmix32PDUg4JPspeo5
         xwE+oPSNoftGP3kfGXLbq8TWA4GfcBkb5M2fNY3OwuJxzjHY8/W0pKm12TbfQCWp2Rod
         xkLw==
X-Gm-Message-State: AOAM532tMsr/ZwuobONPteuOjqPIRV8AGFvJ6FH5X4y92ODBllDnsNTs
        ajz8+pBwSzMOQhRkMJTcUAaKFnkm44w=
X-Google-Smtp-Source: ABdhPJy8TL4Nu3CSu3vtklxkcTtGG5vP0d/iydeLObtfnqEBlJd62usnsBduIjbPbGbvKCO1DQ6sPw==
X-Received: by 2002:a5d:6a8f:: with SMTP id s15mr24457041wru.544.1638568428206;
        Fri, 03 Dec 2021 13:53:48 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:3570:727:6afe:902f? (p200300ea8f1a0f00357007276afe902f.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:3570:727:6afe:902f])
        by smtp.googlemail.com with ESMTPSA id w17sm3873152wrp.79.2021.12.03.13.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 13:53:47 -0800 (PST)
Message-ID: <0995f70a-7d5f-b616-0fe0-0b2b7c16bda0@gmail.com>
Date:   Fri, 3 Dec 2021 22:53:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Language: en-US
Subject: [PATCH v2] i2c: i801: Don't clear status flags twice in interrupt
 mode
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In interrupt mode we clear the status flags twice, in the interrupt
handler and in i801_check_post(). Remove clearing the status flags
from i801_check_post() and let i801_wait_intr() clear them in
polling mode. Another benefit is that now only checks for error
conditions are left in i801_check_post(), thus better matching the
function name.

Note: There's a comment in i801_check_post() that i801_wait_intr()
clears the error status bits. Actually this hasn't been true until
this change.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- clear status flags also in i801_wait_byte_done()
- remove outdated comment at i801_check_post()
---
 drivers/i2c/busses/i2c-i801.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 930c6edbe..60fdb2fec 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -372,11 +372,6 @@ static int i801_check_pre(struct i801_priv *priv)
 	return 0;
 }
 
-/*
- * Convert the status register to an error code, and clear it.
- * Note that status only contains the bits we want to clear, not the
- * actual register value.
- */
 static int i801_check_post(struct i801_priv *priv, int status)
 {
 	int result = 0;
@@ -440,9 +435,6 @@ static int i801_check_post(struct i801_priv *priv, int status)
 		dev_dbg(&priv->pci_dev->dev, "Lost arbitration\n");
 	}
 
-	/* Clear status flags except BYTE_DONE, to be cleared by caller */
-	outb_p(status, SMBHSTSTS(priv));
-
 	return result;
 }
 
@@ -457,8 +449,10 @@ static int i801_wait_intr(struct i801_priv *priv)
 		status = inb_p(SMBHSTSTS(priv));
 		busy = status & SMBHSTSTS_HOST_BUSY;
 		status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
-		if (!busy && status)
+		if (!busy && status) {
+			outb_p(status, SMBHSTSTS(priv));
 			return status;
+		}
 	} while (time_is_after_eq_jiffies(timeout));
 
 	return -ETIMEDOUT;
@@ -473,8 +467,13 @@ static int i801_wait_byte_done(struct i801_priv *priv)
 	do {
 		usleep_range(250, 500);
 		status = inb_p(SMBHSTSTS(priv));
-		if (status & (STATUS_ERROR_FLAGS | SMBHSTSTS_BYTE_DONE))
-			return status & STATUS_ERROR_FLAGS;
+		status &= STATUS_ERROR_FLAGS | SMBHSTSTS_BYTE_DONE;
+		if (status & STATUS_ERROR_FLAGS) {
+			outb_p(status, SMBHSTSTS(priv));
+			return status;
+		} else if (status & SMBHSTSTS_BYTE_DONE) {
+			return 0;
+		}
 	} while (time_is_after_eq_jiffies(timeout));
 
 	return -ETIMEDOUT;
-- 
2.34.1

