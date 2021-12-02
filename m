Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A11E466107
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Dec 2021 10:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346206AbhLBKCQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Dec 2021 05:02:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357233AbhLBKBW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Dec 2021 05:01:22 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1806FC061756
        for <linux-i2c@vger.kernel.org>; Thu,  2 Dec 2021 01:58:00 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d9so37591305wrw.4
        for <linux-i2c@vger.kernel.org>; Thu, 02 Dec 2021 01:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=IfHOpBw3s4FHttIvC2ZAubhl4BmM6ohfRL40cbIe+ps=;
        b=Ly/+ypSYiH25g9tl8U30z5bSr7TQmWEj/tzTbrL2yW6mFpwp3tuN601I6IDrAiwa3p
         +8Yql32d73rIL9s2S8ghd5RfwpAtgVCVXv91eGkV+FUiWysrAgoYEYB1X1UQcxAs66An
         JDWMSVjxZCkSwV/DoU/DzRPG493ndSOivL32vh0huBCLblk1PASG5C1fXM6NeAz0bUIu
         Z9oolBMtWnXmHUFYM4G07oHVKBcc8D67taOEFDXPQumHrVGatWagz1TmfmWRXmAXD2i7
         MoVm5mFPcGdoHOFXzw91J06WTCDBHXgrR15Xu3YLFbPhfiGcE1P+i6EyEenjlnrEzAqg
         AwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=IfHOpBw3s4FHttIvC2ZAubhl4BmM6ohfRL40cbIe+ps=;
        b=LvaWh+79fNFV9Gwl58DycjpFCdU9R3rSZqIckUs0O4SDeIEfH66huUIaVrr9rz5vwL
         i0p9e7KMlHOAeL94ta3fivfqOlsR5zSfATL+5n7jaaQASUlWBKBIAoWlzbgDkUxbHQjv
         rMSWO/KdpHj8G5XuUE7Lderma47imhdbVQBbZHin8ftQuGvEreeXoSCJfAN5CwAj+3rw
         0JpqG5PqrBPvFY4rbZ/7FuA/a8gT3NCQrB0L/pArBmOn90kl85YxjJlngBOwPnkSb6G5
         5zXd4GozWAdsU4AAZedZNcXVEAl129JPSmugQRcPT0uTY08G92WX8sHGgy/DxTtjiu1b
         Zghg==
X-Gm-Message-State: AOAM531Z+YdVaMcgcKfRtfR1YjNKkzNzVio9tF+20Rpxc0ELQunCRylj
        oBR7eoouky6sJZ3B7UuxJ8V378CfjCQ=
X-Google-Smtp-Source: ABdhPJycPm45toLpPEiSgs2RF+u/el6k5ieuHGk8gwz3YMdVt27FdTNn9TY8MkiChw0cNRv5RXUohg==
X-Received: by 2002:adf:b18e:: with SMTP id q14mr14094609wra.477.1638439078645;
        Thu, 02 Dec 2021 01:57:58 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:6195:7c7f:1f45:58f4? (p200300ea8f1a0f0061957c7f1f4558f4.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:6195:7c7f:1f45:58f4])
        by smtp.googlemail.com with ESMTPSA id d188sm2107975wmd.3.2021.12.02.01.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 01:57:58 -0800 (PST)
Message-ID: <8fba896a-81c4-dda7-6481-92ae8dccf41c@gmail.com>
Date:   Thu, 2 Dec 2021 10:57:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: Don't clear status flags twice in interrupt mode
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
 drivers/i2c/busses/i2c-i801.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 7446bed78..82553e0cb 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -438,9 +438,6 @@ static int i801_check_post(struct i801_priv *priv, int status)
 		dev_dbg(&priv->pci_dev->dev, "Lost arbitration\n");
 	}
 
-	/* Clear status flags except BYTE_DONE, to be cleared by caller */
-	outb_p(status, SMBHSTSTS(priv));
-
 	return result;
 }
 
@@ -455,8 +452,10 @@ static int i801_wait_intr(struct i801_priv *priv)
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
-- 
2.33.1

